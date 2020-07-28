Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8125BC433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 15:21:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D216206D4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 15:21:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1YzdhxR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="BC65Xs0O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D216206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=yAtLSOR5yfYDWzyFxNmT2RI9EfghkDLDnl2Z0+HxKzY=; b=G1YzdhxRMHczaVGPp2ujbIZ+v
	X4tsqbMYkHeEEuD7hkO73PW4lQnq73AlvLkxfRzdnpHdltuq2FvYahMF48GlD92tCfT1Zw01Op1EM
	BXnoCpVsH9bwhw0oQ0W5i9wxkxfzaOUeCHLaMYYf0goCYSHvNgKnFFDgW1mdC80nfeyXJ5QgwZUNZ
	lzJgHEjvtu0crkrU20gUUOA++zqT7WoZHCelndzVR4RQNCtZlGaxdwOD4ZBaazffWAmpNeTPJM3IS
	ef5vgh0ixaqXNCJdiy99u9mhSYtwHV6lcFgD81o/wNIyDOwPjq36kAwbVqI1E0BDPUHVmLveOMT3w
	+Pk2i+q2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0RPP-0001Ez-Ja; Tue, 28 Jul 2020 15:20:51 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0RPM-0001EY-BV
 for linux-riscv@lists.infradead.org; Tue, 28 Jul 2020 15:20:49 +0000
Received: by mail-pl1-x643.google.com with SMTP id t10so4716574plz.10
 for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2020 08:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fVYFrhNuRzxClNpxXaRUQX6dz1n+dd3iTOeEE8nK3qU=;
 b=BC65Xs0OV/TCfXhoZqI1637SmjuPM36SIHHNHFDezBpKvWwmrh+uPJRGjrL4CSy0JM
 0euJ2bkTxMq0Hy8paeCU1xFVVOIjkd3w/NHJcSAV0OLEu654sv4boxtrdjwN6HtVd6P3
 0sVh4POnmnZ9zJdStAWpTQPSnQyVySCXRcEy9gBwYi3uLT499Ai+BrlheoUMJ71QLhIK
 nji0r0YtmDlxpQ7l38Ur3PcoWaKE+yvBmH7+tPM1j2ZQ83oTdUJ8CXRQMnQXfNbiawoK
 uOWXUkKeSBjylMBQDTZGZVsR57qsPdWQSRskkq75vWQHqr0h3LsNh72VjPiPQh2Zxcem
 5HDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fVYFrhNuRzxClNpxXaRUQX6dz1n+dd3iTOeEE8nK3qU=;
 b=HYE9WRGqOBRAwOAoUp87r8DJjrQTEPE8n1b661iZV5w7bw8S8s8WwDJyMb3y80cER/
 uUSjO7Qvv9d/9dioMbtxYrF4/znHM5ioH+7h+XQfjFdlXUgeQ+ZEiGjPWvJLS1aHALLH
 N7cRmfPzcpryON4jujBV7x1C03gbtE+0x4W3xc/dD+gzPbc/8fTPTvVECzai0XGPAtjx
 QLeC1vrVUVMItBfbyYADA35edxH06MFhwq7L9Nh+U+fGsVmFNzgp2H0Lj9XMrOBhIzMa
 LTdMLiC9tDNWHgEFrnzsL25s2/gkiJTNPtqQn4ln82O5Dtpr3XV53Z4+07tisn861JrE
 XGtQ==
X-Gm-Message-State: AOAM5329I848Zvfd9hzwNxtEQJMNLUUw3JPAEhABOcEu9cSQPGBKlXS3
 RjvBffjnBEWEvb69Oh5j9hcZng==
X-Google-Smtp-Source: ABdhPJzKzmyK2JVfPsrFoRpMS1AmlZh+bvUolctLUNiu3w8SHnw3fOsHe2uP6qF8FSaqK4xdX8Z6YQ==
X-Received: by 2002:a17:90a:cf:: with SMTP id v15mr4828728pjd.14.1595949645914; 
 Tue, 28 Jul 2020 08:20:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s18sm9142520pfd.132.2020.07.28.08.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 08:20:45 -0700 (PDT)
Date: Tue, 28 Jul 2020 08:20:45 -0700 (PDT)
X-Google-Original-Date: Tue, 28 Jul 2020 08:20:43 PDT (-0700)
Subject: Re: [PATCH RESEND] riscv: don't specify -mno-save-restore when
 building with clang
In-Reply-To: <20200728131252.15407-1-tklauser@distanz.ch>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch
Message-ID: <mhng-73766461-0f04-474e-a416-4597b879dbdf@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_112048_597256_5D2EB2DB 
X-CRM114-Status: GOOD (  19.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 28 Jul 2020 06:12:52 PDT (-0700), tklauser@distanz.ch wrote:
> Clang doesn't support -msave-restore and -mno-save-restore. This avoids
> the following message emitted by clang:
>
>   '-save-restore' is not a recognized feature for this target (ignoring feature)
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
> Resent due to infradead.org mailing list issues.
>
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index fb6e37db836d..cd3720bc45e8 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -44,7 +44,9 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
>  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>
> +ifndef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -mno-save-restore
> +endif
>  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>
>  ifeq ($(CONFIG_CMODEL_MEDLOW),y)

Thanks, this one didn't make it the first time.  Is there a reason we can't use
cc-option here?  IIRC that's what we use for the other compiler options that
may be unimplemented, and it has the advantage of avoiding encoding specific
compilers into the build system.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
