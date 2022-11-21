Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D69BC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YvmoJx7SX546mx+ch3xhzCAbYNV3X6JxY+I8qLBjHs=; b=htTBkLgfZUNCwl
	L1Nn02XcD2OTYG59akPnPbnK6FWHSqYVjzTIfCyu6oEkzdZkptkUbgW34bSpSNBOvo2cX6S4O64xk
	1Gvzrmckpt8XNwk4I+M9C6lxKJi8xAjdQeD1n26OmhU/Bxe4qJla4ovUZoDSakHQ21WMUUfBnCIKi
	39ga2TEFLk0u7CKc1rNqAPLgbcsB4YHqdmdyaJRBL6fdYZyppHFJNo3pPbFQelxL+VKFNRuTnKrtP
	RCRFsh/lmEu29OXpY892sP7sveQVnovCMQypO/pLtXG7x8dpg/N3FqPENt0Uc2HX28YPvKXBSjzo8
	CLMJjjx8mPk11ejVUAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox52f-00CxFn-Bj; Mon, 21 Nov 2022 11:32:49 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox52c-00CxDn-EM
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 11:32:47 +0000
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6AA8A3F535
	for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669030361;
	bh=Wdu8vQakfdIXWZI6cloLPICZaVlSsHqCpUijZ/K0Ym4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nHy/naF46E8HlCo+XkxyJ0Zt9BNNBqXFSJnhUcGPqX65Y9ZRzXEe/MfyGXL/RSa9w
	 uREfg0yxZRGqXgdoDsNrP4Vl9zgZPAGEIqLcQ2Ice1eTst/tZl7tOaM+18GYg4hpN3
	 m1NTJm46d3dUP8i78PCwvWIyqQGbhIZNVErX4Zih8CmTriSad6Do1GUH7YWMj/zcZX
	 1zbUHfJtOZ6rD1mYEbwC59liq3CnRgt3QaN3lveJjmbCkhhbzlv7SlkOzduhdup2uA
	 VRE1jW6Fix0v017M0XBFi4HXJQYS2d95xLVbKraP/28FzDh3hwTN33+MwYe0K2qQzo
	 XvD0hEFHBn/tA==
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-3691846091fso109528497b3.9
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 03:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wdu8vQakfdIXWZI6cloLPICZaVlSsHqCpUijZ/K0Ym4=;
        b=n0UWoqqGxU9Vs4RBonISnytk8gexUgc4AOZ1T3V7nvCCHRwZzvehAfw38EWMVzutcd
         LVY4rBrTfvQFeJ4L6nAOpdU4M/1pkLQWlNOozcQMcq9PiRBMvdxqP8JS2NIWpINvLxAY
         zUGVA3BPW7wmP3hJEAHjhItToA+dZE53cbYys5ccSFh4/vrUW6rKKvVlbYaWjMx5KsWE
         9WKnKykTykHU/JHljRL/8ZzVR2wFVQPBNFu1OsWOwWQSDi1VcPnvKqHEKSBxlbRiLLYN
         AvN6r/syrlF+EBz/8rFLRo3QCyLD8Zdfoyx1vUdQlkrMd5VlJgXIxqdWkJAnRqnDBTD5
         vkgg==
X-Gm-Message-State: ANoB5pnBBhiWV+ZEL2pvOGj6rAUx2qmBGSdWiG77LkaSU+bywtGLTMFD
	I034TCc78T3bm/9RxRmQwAPq1tCH8WxfZKgtjD0A23LDF8ZxVsqNtmeBfSOkiaMSgpkqAblBEMm
	dCm8u7FBWsorWpWVuyHrMkHz4tzLT+8qhtEUzPOSLqZfPZIBum1oUk2IVD7Uwow==
X-Received: by 2002:a05:690c:582:b0:391:fccf:db48 with SMTP id bo2-20020a05690c058200b00391fccfdb48mr16027166ywb.257.1669030360334;
        Mon, 21 Nov 2022 03:32:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7N94HxBZ+Phe4pBPmAyuYlGRxUDO4LFZpUy/j94PlMnqUevStF7XkySMLq/crkVuRUqW5EdlT7wLqM6xkcUyE=
X-Received: by 2002:a05:690c:582:b0:391:fccf:db48 with SMTP id
 bo2-20020a05690c058200b00391fccfdb48mr16027152ywb.257.1669030360150; Mon, 21
 Nov 2022 03:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-3-hal.feng@starfivetech.com> <CAJM55Z-Zftr29oGzeBFzOKuGixABSJEzPF-R2c0U9Pg5qDcRCQ@mail.gmail.com>
 <13578755-ab98-7567-258d-bc6c4164ee6c@starfivetech.com>
In-Reply-To: <13578755-ab98-7567-258d-bc6c4164ee6c@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 21 Nov 2022 12:32:24 +0100
Message-ID: <CAJM55Z-a1Pg2q7ZyvhwU2sp9YpsJZmE8y161UM-Ap7egCdgYVw@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] clk: starfive: Rename "jh7100" to "jh71x0" for
 the common code
To: Hal Feng <hal.feng@starfivetech.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_033246_628259_1AA1D99E 
X-CRM114-Status: GOOD (  19.26  )
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

On Mon, 21 Nov 2022 at 08:16, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> On Sat, 19 Nov 2022 00:26:27 +0800, Emil Renner Berthing wrote:
> > On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
> > >
> > > Rename "clk-starfive-jh7100.h" to "clk-starfive-jh71x0.h" and rename
> > > some variables from "jh7100" or "JH7100" to "jh71x0" or "JH71X0".
> > >
> > > Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> >
> > The patch is fine, but I'm a little unsure about this Co-developed-by.
> > This patch is taken directly from my jh7110 branch so does Hal sending
> > it count as co-developed-by?
>
> Your original patch merged patch 1 and patch 2. Suggested by Stephen, I
> split the patch into two patches, and I need to add a new commit. My
> previous thinking was that the Co-developed-by tag should not be added
> to the commit author, so I added it to you.

Even if you didn't just copy it[1] I still don't think splitting
patches counts as "developed by". You can set the author of new
commits or copy them from a previous commit with git commit -c.

[1]: https://github.com/esmil/linux/commit/df4bcbc307e97cb6a0e7b8ed5ecc66487395176d

> Best regards,
> Hal
>
> >
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
