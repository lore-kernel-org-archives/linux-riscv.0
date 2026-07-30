Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B9EC54FCD
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 00:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDSth9R4KpHciJIwofL9umtj1z+ZJWDEXikxA99iN3o=; b=OtraHy+Ijj4kiL
	2jkNDYlP/cklQOYf1+uRV6k+qrUXAumk3q57Bop/w2QJaEJXhffNxshfO4fuU9X1T/1N+ac+VngQU
	5EXJfl9KqeaArY/zh4/bMR6BkB2CuAT+Y91kijEh8/kc4tL9fLmjFDy2Q35lHY7fdz5tqTGeTJAtv
	hhp+FA/Kyov/AAN9Jz6fmFvQPWJYAJtoqamoQuzdNGkGFkg8CZx0kn2I7b/1XDN7N94jtOUZQaA98
	jRQKZ/hBWQN0RPJVQxC0UXk7hdeDYF0GNAwYs5iHngUGrIOiAgIwa94IljIZxeN8GTOGj1WBeQyBN
	bZLrmkKyQWhF+0wupuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEDM-000000098kZ-1BOG;
	Thu, 30 Jul 2026 00:01:32 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEDJ-000000098kC-2hIF
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 00:01:31 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-81ee6b2da98so22237487b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 17:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785369688; x=1785974488; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nAq/JwzA/qGSSA38u08YVkDTzAiY1egMCTFF3E/QBPM=;
        b=LBiZ6i3MGPJl4W0KnpKRyUXeHRD6KpMZBLfqk+EKvDFaoO4STN21iqOg4mgZujx83Q
         YtE3Qv9Z3a/BH4jAnN8W9ZPXoNIbrkzvoWmNxjJtrShjsvH78j3aZwJfpPq9G76WxUz2
         YOaU+mi1Eghl7igBavqmm+qWUJx18lOMnWBQdQfaXt0tlk+ORGhR2/HVw2cEhmk9996h
         rn8W0eXS9qNra1gDfx2PujAJZdWGjQqq76x+GTIg8F2Xn8ul2p8iZ6356nMX/VJ0ekI3
         9b86c5mSxEj7Im32ztztR/QypiOHr5ajutpZWU0KyLNOmb7nlf/s0PNhG+ysAletc588
         TWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785369688; x=1785974488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAq/JwzA/qGSSA38u08YVkDTzAiY1egMCTFF3E/QBPM=;
        b=fb5/W1segILLr+tUn/X28m5Me9w72/3wHFrxOh8OydpSukPowPONhOW/EYHqEl1/o5
         j/7gqd310uenSlQjZfK9VU2shIq+XGAtoYUgtrY+1W90/e84ROtgdFzUlMcZov2kNJBE
         UhbDkjLxdUBHJmYjIur9H0vIEaF2xwb5PKd6kxhHIEV/cJvdwmPLTP6VszvmYVYq1ufs
         bgChVOS3+QemWE27f3sBE9DerWupPkVEprCStzN9bQXrS5OUJ0pG1oZfOVeoPoLyktMN
         hElhfVpph+gQLfi5ScOlxSgoKDQzN2xQPz5U7L+P/D5IRLLCAx9wwJuI1UNBR7i+e3NV
         ndgA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1t4OoQhnS2Fyt11/MaBpiUPIdmcBoKQdDTvou49Q0IW+q8eBwhgig1K6EQUEHzzhljwMUTG6RS7nG8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxF/wT3je93c67dPxJVFtpg3s3x0VIE0K9kc8faSGo3jzvWQMi
	J6qVQN1xSqt9kvSXKxOG5sqba2IW3mYfUwoUt/Ycjd5D5GxwiZMOehoO
X-Gm-Gg: AR+sD12PysXELEYrMxdXapvI0G/yJJ0N7DGk/caN7XtT/aRMcWLgbJMn2Od4hb3NH9J
	nh8rZKz7lFwJeJw29tFbGtnwW2PQKNxXYUxYgxfPQ6+dGR5SHT2qYXT20IxxxBmI0gL+h2qYK8a
	OZAWY6+XdTC4jX+3Rz8b2X+6d+cSWDI2u4OAzCtt68I3+qg/lUgctFFyPRnrimb6v28inKuZEV4
	2WAMHd3tOT2nuWqBdxf6+zRhkbAAPoYy/3uTZWgbvec6vpdzn0JPJlGrGTuvRaCLm689OgYxj7i
	GsX4olO1hEqODnsTyNxnD/tokIMRSN8x0TsAdrVx73Y/OCkusUdjJnN0kjK6SXoCwmXpbfxYc5Q
	ePVjWH6giQ11s1ePV9nBp2MpCtrHPBGLFvdMJ3hmk2NUHFD/gQf8htWe6oBfK5P2W0NWi38Ts5R
	AwGs+K+cjAcK6gbvxAvPOgSDMz1uEKqv294e/aCxk0DA4nVVKnQKGTiyu+Bw9+WeRzd5SPrh3re
	28bN4BmwXFcRPAp1xz1NyZ1yw==
X-Received: by 2002:a05:690c:dc9:b0:81e:ae6d:caef with SMTP id 00721157ae682-81fb8b44433mr1924497b3.46.1785369688447;
        Wed, 29 Jul 2026 17:01:28 -0700 (PDT)
Received: from got-milk ([107.198.84.185])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8b08ceesm874567b3.43.2026.07.29.17.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 17:01:27 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:01:25 -0700
From: Paul Sherman <shermanpauldylan@gmail.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	hchauhan@ventanamicro.com, apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: sbi: fix errno mapping for SBI_ERR_ALREADY_*
 error codes
Message-ID: <amqUVf8KLUivRUMW@got-milk>
References: <20260727221508.5179-1-shermanpauldylan@gmail.com>
 <8760a4fc-fde1-85be-174d-dc6dc6012265@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8760a4fc-fde1-85be-174d-dc6dc6012265@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_170129_717901_F502E53D 
X-CRM114-Status: GOOD (  14.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Jul 29, 2026 at 12:43:30PM -0600, Paul Walmsley wrote:

> It looks like -EALREADY is defined as "connection already in progress," 
> which doesn't quite map to the meaning of these errors, here.
> 
> https://en.cppreference.com/cpp/error/errno_macros

You're right that the POSIX description is networking-specific. My
reasoning was that it was the closest existing errno expressing "the
requested operation was unnecessary because the target was already in
the requested state." If you think another errno is a better fit I'm
happy to respin with that mapping.

> Does this patch fix anything or change any behavior?

Yes, concretely. Today SBI_ERR_ALREADY_STARTED falls through to
-ENOTSUPP, so callers cannot distinguish "already running" from an
unsupported SBI implementation. The companion patch updates
cpu_ops_sbi.c to recognize the translated errno and treat the
"already started" response as success, which fixes the boot-hart
bringup path on many-hart multi-node platforms like SG2042 where
firmware releases all harts simultaneously before SBI HSM state
is established.

> I don't think the comment is a good idea; it creates one more artifact 
> that can get out of sync with the code.  We'd just expect people to read 
> the code, I think.

Agreed, dropping it in v2.

Thanks,
Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
