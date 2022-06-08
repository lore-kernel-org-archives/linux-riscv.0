Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6F3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKxC+BxmqBFtm/XjgWmXbCWzuPo56T1XljqMJZEh1A8=; b=Z74Z1FbCQR/vvT
	D2NPC2cWGst+Ly6ut0rYWEyHCQZs6tEAsJAfZNJvL2Kh3Sx4UQZCQ6ehAh5Jt6XSCM9sgMs/tanVC
	Yxeb3t7IBxENttjvLnThlnxawjBQH1bovd/0lGsemWKzetGsbMNgyfecON5KHwL63xNrw6CK7WlcZ
	LJMhQTERumVXcWPcXIZOGjYWw/BwkDd5H4MmOh1yFaMHTtv7Z6I+WDq4mbxjqvRcDbeCRZqjG4q/D
	3gZ9lyV/PfTLV9PtpEr+BKWfCvl/AFSApM7FEhWvk9hhl1OsiTNYtAUCXrBgJpFS0chAULp6czIoz
	KPzMn8kIF7vAvNBGDJfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqtM-00BtEu-7c; Wed, 08 Jun 2022 08:18:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqtI-00BtBs-5A
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 08:18:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3945CB825A0
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jun 2022 08:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F43C341CA
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jun 2022 08:18:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="oR7Qp4kI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654676284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y48EB/+qYWGE2v81oslfm42q3nbiPcHgndLfChUYuUA=;
	b=oR7Qp4kIauI254o1w9LMj/KBqCNNq16ujn84yhG7iLxkWaT2uc3EG4yN1+xY3mHnwLgGJR
	q5huvKfOIDOtmtwxZeDUGcYP0NgfrLNTyZ491lngtqx8VQTqLKYLi7cx658+H0e8zbpg8s
	R0hGECUrW2/Jtm6WRXLLzCL32OBCw9Q=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f6e30677 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linux-riscv@lists.infradead.org>;
	Wed, 8 Jun 2022 08:18:04 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-30fdbe7467cso165657857b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 01:18:04 -0700 (PDT)
X-Gm-Message-State: AOAM531bRb9iJA1OcT51UAUCKkGyLBqQvenlBIdostcry403wFsqdQWN
	4rpAy60ztNtCkt2vHBV/tBd3iutzeojaXT2dY9g=
X-Google-Smtp-Source: ABdhPJyfhGUwl9a+4mLnY79hQd5voE7ulIvmcll3+HUVh330Y2eTEuLSP3vpjZ+5HMHaenpd2DvbIbvV4XBEhS9fuA0=
X-Received: by 2002:a0d:cd04:0:b0:300:4784:caa3 with SMTP id
 p4-20020a0dcd04000000b003004784caa3mr35748864ywd.231.1654676282763; Wed, 08
 Jun 2022 01:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220607195752.1146431-1-Jason@zx2c4.com>
In-Reply-To: <20220607195752.1146431-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Jun 2022 10:17:52 +0200
X-Gmail-Original-Message-ID: <CAHmME9pycN94eCArsqNhr-6no=vDqPhdVyRhpRHGn=sO3bM2hA@mail.gmail.com>
Message-ID: <CAHmME9pycN94eCArsqNhr-6no=vDqPhdVyRhpRHGn=sO3bM2hA@mail.gmail.com>
Subject: Re: [PATCH] riscv: initialize jump labels before early_init_dt_scan()
To: linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Phil Elwell <phil@raspberrypi.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Russel King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_011812_388946_793AC648 
X-CRM114-Status: GOOD (  12.32  )
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

This patch isn't needed in the end. An equivalent patch is needed on
xtensa, powerpc, arc, mips, arm32, arm64, riscv. That's a bit much and
points to a larger issue. So I'll fix this the ugly way in the
random.c code :(.

H o w e v e r, I'm pretty sure that you do need to move the sbi_init()
call above the existing jump_label_init() call as already existing. So
you might consider doing that.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
