Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AB2C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eDBNP3FIxTWX0yTRcfoXRFAXDYleER7S1kVFP+woQk=; b=a/wD1nYe1jo5Yu
	j05zWRjrv4hJBRo5jmpycziTTxNi046QjYHbS0rtOSRgLWeQe6VabJkNzcO8EaciecfDN/u3r+kVQ
	H8b5KWmVdy9l2b1KeTpRLhJ9tcD1YGibo+urcQPK7Q/EYtk3sKQjs0p/g3r2pRAJnX4uc9rF43qGC
	KEUPHDk4urSLlOGYAi3mCJHLa+vFnDUmg/Q7lNJPYKnVInQfTU3jL8BaPSg2sVTeH8iE4ZR1e3JiX
	GN/A4fNuHDjV7+vZZaDIoOe66WPxFx0WT6bL+kCioFY34ag70Y5lanqlSV2NpgZwufJeK3n0M5514
	gsHAwOUdlh3hJRC512CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD5Iw-007OcC-4y; Sun, 17 Jul 2022 14:31:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD5Iu-007Oag-1h
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 14:31:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7BD59B80D38
	for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 14:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B25C3411E
	for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658068285;
	bh=pJ4t0k6XmyXiEzl7ZlYkfPxOiEZ5yTVc8cAg/K3WUqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PtqDsAfmv7wUkwL2Sq+kLmJuZBMnQf+K6r2DJELu9gRLHDonxGflAligAfIoQggvS
	 +ixk+WgF0BqWaVO484SogfvW1a3yxWhVioKHEXOLgsa/hS5HMes90NJaJiu33fBE17
	 t8GvceNJarDFEgXUOzORTDHnanRJiLlWuS/gWGBDm93CoZ9p6xjnBPmQbW2Iw6ront
	 L5C0Q4QUACT4VlWm5asneGbZ7XrnuIo65o1AD/YTaJIwX9/TtRh9LJLhhZu/RNYhLR
	 PFOP7suXvQh/M2X6fBvVUidOj/EW/AvPUBBc5Qm4SDT9fIqJdVXHRxOHn1evyVHctj
	 MJWlNlumx9ePw==
Received: by mail-lf1-f52.google.com with SMTP id u19so6614576lfs.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 07:31:25 -0700 (PDT)
X-Gm-Message-State: AJIora8e7UBX7/nf6Dvbpxsq5w7W+Uvtdd6Vf4QH7wuC9gw6YoZhKdnB
	llI1UnSXG0J3gE9wmOQTuE9L6fxIJD+0Y/eiA0s=
X-Google-Smtp-Source: AGRyM1sb2uuey/LyOHbFE6QQiPVd/CaWuscIin4XAiwGwckHDVTGaB1OZeVRfZzr/fwVRF2YrFmdQGU8i5SdEEYtQVg=
X-Received: by 2002:a05:6512:1191:b0:48a:2269:e87 with SMTP id
 g17-20020a056512119100b0048a22690e87mr6257453lfr.122.1658068283087; Sun, 17
 Jul 2022 07:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/8SFo/oC1TFZYk@decadent.org.uk>
In-Reply-To: <Ys/8SFo/oC1TFZYk@decadent.org.uk>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 17 Jul 2022 22:31:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com>
Message-ID: <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_073128_255649_82DA9EC6 
X-CRM114-Status: GOOD (  17.43  )
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

On Thu, Jul 14, 2022 at 7:21 PM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> The recipe for vdso_install in arch/riscv/Makefile invokes targets of
> the same name in arch/riscv/kernel/vdso and .../compat_vdso, but the
> target in the latter is called compat_vdso_install.  Change the
> recipe to use the right target name.
>
> Fixes: 0715372a06ce ("riscv: compat: vdso: Add COMPAT_VDSO base code ...")
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  arch/riscv/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 34cf8a598617..ee763562895c 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -110,7 +110,7 @@ PHONY += vdso_install
>  vdso_install:
>         $(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>         $(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
> -               $(build)=arch/riscv/kernel/compat_vdso $@)
> +               $(build)=arch/riscv/kernel/compat_vdso compat_vdso_install)
Good catch, but what's the problem you've met?

>
>  ifeq ($(KBUILD_EXTMOD),)
>  ifeq ($(CONFIG_MMU),y)



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
