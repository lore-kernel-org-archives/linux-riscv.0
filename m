Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F5CC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 14:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/yFs7dY1Pnd2gOa/XAnre9J/inRTCJYzd7IaBLHTV3k=; b=nWVU71rRi1VMaaZHr/a0aDEwcu
	0Xqu/pcaMYn3H1w7L6+SiwPe6mJeXa0V2okMg7YUtv0YExcsksSrk7cAFyTW47P8cwTH2marmw+My
	NX+i62mgvoPdEkBnWYkjrOO1vMWFQYme6z5EsDvuy/G+Z1WypAZvdcBvgz+fJ8kNySvoLmiSorL94
	CKqZnZrHf005jnKRkyZV+XOfUyrB/A7RyZP+46qBR3dgg8R7tk3qnLVVw7C+PqCIp+46o+1emYHyt
	ik5sYnVLTbQBlmLmA5mab7OBzI34x0j+n5JL9a2kYHroNTUXTrPAP+qLCO7LGLFhYJiUOs26HXBTi
	Q1rvKbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsgv-00ATAA-2n;
	Wed, 06 Dec 2023 14:15:57 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsgs-00AT9o-38
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 14:15:56 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-58d54612d9cso4478766eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 06:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1701872153; x=1702476953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgKI2xyGODCiFPlxyU5+BAAYcrGDTRi9HM+3OhX+AwA=;
        b=xuBTLcNRLhcu2LZF7qqEBWgIWfelSOHuLxJk7W0WZvLYwNSPHTPGq7FqQcKP9Jjiie
         nDRAV7Ic/BgpMpglJTjXn9bDrH3SoVyKyDMQGCP7GYFLbXoRZl9ogjUuT4ViZj2k3yvW
         FUK/rHQik4GtNjc+xzV1dXaojyqUI9/ec58nSpn+VX20noxN+8HLwOnXRtA51jiscZYt
         TNEEGmQWCUyOrT+4OoE7Fb4C4IHBKHVQye3X0ZHN/mzyRLgdf45dTTGfqJ8iXsMUI9gj
         WvDE/orgVNH9xFE8d7Eom2YMTfJutT7+nBAodHNnwNcItZZGlRlZESCxuhW1wISDTtje
         lxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701872153; x=1702476953;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgKI2xyGODCiFPlxyU5+BAAYcrGDTRi9HM+3OhX+AwA=;
        b=Wb5yQ9L752ciJUXr+jdnh0mMgtacxnBLIutpCdqTwtq+k+Ftrx8cD8bjmm2fRAqiyP
         VOQGgTHYK6hvSsVYATXhyCACm7ZMaefOIhFgs+0JdYAElH4KFd1pFfpWzhBQmfWKKCue
         Zi4RmgVkvEXpSj7bgLupjRa0+ANhRYxWf3mQ0KKCDdjmG5kmJHwCfDswIZNTiAuOqZD5
         xYW+eqpNIN9eL7m4f2zwPm/ofwtbr8y15SDI/Wv2uuLwyxNBAvdPyHkMZghdV7D5me+f
         uFxcqLYVi0PlYHNEQEKBaCIBINY3M6Svq/mUk7DYcWdFgT7bawDCSxH4Pxn/dutz+GnE
         HbvA==
X-Gm-Message-State: AOJu0YyUAtCv+DA2Lm/dbltZJ300mqVmGXzinQVsQ/RdGJKXtXHRXQUT
	PIawPqGNozFcvoxO/wHu3b7JvQ==
X-Google-Smtp-Source: AGHT+IFPf3FTqsWC/1qvU045Pf4RvgR8HF5dZsG26N9kr5zXhPC91ObgfpOIjJOaW1hEQNzaFZX8pA==
X-Received: by 2002:a05:6820:80a:b0:581:e089:9e5c with SMTP id bg10-20020a056820080a00b00581e0899e5cmr1092075oob.6.1701872153415;
        Wed, 06 Dec 2023 06:15:53 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id cn1-20020a056820230100b00581debbeeb4sm3836oob.1.2023.12.06.06.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:15:52 -0800 (PST)
Date: Wed, 06 Dec 2023 06:15:52 -0800 (PST)
X-Google-Original-Date: Wed, 06 Dec 2023 06:15:51 PST (-0800)
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
In-Reply-To: <ZXCA+4WyI6D+Somy@andrea>
CC: mathieu.desnoyers@efficios.com, paulmck@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
  charlie@rivosinc.com, rehn@rivosinc.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: parri.andrea@gmail.com
Message-ID: <mhng-26a1b3dd-ca9e-4b82-86e9-1faf1e3571e5@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_061555_217142_7899FE62 
X-CRM114-Status: GOOD (  14.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 06 Dec 2023 06:11:07 PST (-0800), parri.andrea@gmail.com wrote:
>> I see
>>
>> $ git grep "config MEMBARRIER" fab957c11efe2f405e08b9f0d080524bc2631428
>> fab957c11efe2f405e08b9f0d080524bc2631428:init/Kconfig:config MEMBARRIER
>>
>> so IMO this is just one of those forever bugs.  So I'd lean towards
>>
>>    Fixes: fab957c11efe ("RISC-V: Atomic and Locking Code")
>
> Works for me, will apply in v2.
>
>
>> (or anything in that original patch set).  It's not that big of a backport,
>> so I think it's safe enough?
>
> Indeed, I think so.
>
> The final version of this fix will likely depend on some machinery/code
> introduced by 3ccfebedd8cf54 ("powerpc, membarrier: Skip memory barrier
> in switch_mm()"); but, yes, nothing we can't safely adjust I think.

Ya, I guess we'll have to look to know for sure but hopefully it's 
manageable.

> Thanks,
>   Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
