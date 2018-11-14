Return-Path: <SRS0=rRaS=NZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224FFC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 21:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E95372175B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 21:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jk9Pcq9+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R65cjeKq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E95372175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAgmFD1vq6tXSD6hmhlXsrRw9lz+JPaOWmkTz9Vz2Bs=; b=jk9Pcq9+2gCDfP
	fbGYoy1bsYh1FnS3+9vSLXRB1t01sXiEmW4KLpztkfnwXQYSxePi+cIABacXp2BNz7eSCDSAhamIZ
	Cym6F2iMPC++X/Cvw2nOZ7rgfLArGbFOWB+n9JUUJermKFiLxyavYgDUOR/og2ZsP9sk4qH2sLUPz
	dudXsQbILEkZBGSsuaKp2bWwyQT90jt4OLR7IF87Xkw30BRKY81miBsWwSAR/VMkXj1aTqhuZXQP+
	f41QGOLAeTee4LWgsUxT8z5pXwfGhhFQeBcLvWP6dEQtdA4zsk4L6uGP3MCOLm3dvL0Kj6obEx3Bp
	sR5ftaUScc1FWnciJ1fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gN2PT-0001OL-9E; Wed, 14 Nov 2018 21:09:15 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN2PP-0001NL-SS
 for linux-riscv@lists.infradead.org; Wed, 14 Nov 2018 21:09:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id x21-v6so5639080pln.9
 for <linux-riscv@lists.infradead.org>; Wed, 14 Nov 2018 13:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fgtKLH6ZCLB8hOtEUGHvxQMy3+HGo+5u1P0VcBxufNw=;
 b=R65cjeKqYv6FyWtEKPUq/FhFmR/1d2+pAKG2vyN7PzwBIbTtlM/ugoCj06IE3JK2jo
 e9mZtxH2skFUELvKfHdmW2CSOa3CL2jkxo/lP2EW0k2h8io+Wv+rAZywhZ2FDwsjI4CT
 g6v4vfP52MZJ00tTF+IoTzjzbS3xo0nmwp5BIy4mJrmRNMEzpj/pnMeHq68PPUZigJ0X
 l8c/ZrHrBjDO6CrUj2UG0/T/zDngy9KqCK2iNHIV2g1oHEAYIFMcP0Lf2jVuPQMkMMju
 9uidHH4p3bw6lDXSg2FFYuQcsZGDLjtd7hd9rvQ6ue2UbnrQ/LBQKUcVRAU20wCCnnr7
 Zplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fgtKLH6ZCLB8hOtEUGHvxQMy3+HGo+5u1P0VcBxufNw=;
 b=EWKKJzQxHUeqbTDLNKJPu/tAX98DshkGUWwBBeMw574SJ1S0Llab5dHIn30quqypk+
 hz7AIMjwDdn76V3SYYiB5bS98kArZyxSg9Jc2L7YQj4dqjd2mGSRJxv5XpX33xajHEef
 JAC0NnSpn1UZWv3bcTYHXSh/qO5IPNYUhIPfXnaZz/24UUhvZgPzXg7auOKks+djQRyi
 +d+UddskG7Twwzy9qOxcERBYuLVtjClm0e/04Ospq4VMfPeGwXj7w3/GXnJvzl8CXNya
 uAvybiDmiekmPg7UTmnZIyYIbWP4XQNCh0cCkCI6380t8yYL0vU3A15/31QKmVoue2Fk
 atDQ==
X-Gm-Message-State: AGRZ1gJHaHU46asBiHHaUbh/ceqBJ0RwPyFOM8jYj3/VbBCda8kYNUUW
 GJY98o5aVAG5HFxz7qF+W50cYXRjppI7wup++uugyyE4wPc=
X-Google-Smtp-Source: AJdET5doWLEyt7XQU8lu13r/LryCNYu1WEWTK7ImMqrYurlN17Dlh6jeWDlS5D9ZlKRTNejjfo5l2O8vS2EnYAVznY4=
X-Received: by 2002:a17:902:a40f:: with SMTP id
 p15mr3557930plq.286.1542229738744; 
 Wed, 14 Nov 2018 13:08:58 -0800 (PST)
MIME-Version: 1.0
References: <mvmwopffwlo.fsf@suse.de>
In-Reply-To: <mvmwopffwlo.fsf@suse.de>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Wed, 14 Nov 2018 22:08:47 +0100
Message-ID:
 <CANBLGcxSA0GYd+D0Ofe0mAJhGQcqdi-4jCWGWk=EUqnqK-4v1A@mail.gmail.com>
Subject: Re: MACB in 4.20-rc2
To: schwab@suse.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181114_130911_944871_91733F2C 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181114210847.A3zWTGMBkq_dbBJR3C8YKgh2Gg_zRCEPiD_ZKcbFNnw@z>

Hi Andreas,

On Wed, 14 Nov 2018 at 17:33, Andreas Schwab <schwab@suse.de> wrote:
>
> It looks like the MACB driver is broken in 4.20-rc2.  I can see these
> two messages:
>
> [   38.530000] macb: GEM doesn't support hardware ptp.
> [   38.540000] libphy: MACB_mii_bus: probed
>
> but appears to be stuck without ever reaching this message:
>
> [   38.750000] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00: attached PHY driver [Microsemi VSC8541 SyncE] (mii_bus:phy_addr=10090000.ethernet-ffffffff:00, irq=POLL)
>
> The module never finishes initializing.

That's funny. I _just_ came to the same conclusion.
Here is my bootlog with a backtrace:
http://ix.io/1rTR

..and the code I'm building:
https://github.com/esmil/linux/commits/hfu

I tried reverting Atish' hack, but that's not it.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
