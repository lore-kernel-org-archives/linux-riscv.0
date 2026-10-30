Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB5606A32E
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4rhstkwO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G+NhfRy9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PhoA9X2HX3IGQ9T/L10u8cbW/bpgOot558EJvUQWn7E=; b=4rhstkwOTg/Rthf+WP0lJLf8rs
	ZenDxHV9PicHJFZoHAJVb6HpM4nGk5NjuTD295GcgMs1M+8kEJ9a9vvoFzjGzsWFKdahsjFwFqaJt
	MieJOvKwICnxQmXt3r5GSXibWnG8mIbAuYrH86QV/AsoXLF/gT/5Pz9ASwG/PBDaE8THx6CWkTmBX
	omHpUQRLd3IBjSuFrxrEGHVCViq0YpXydnqoHmUzt2gaSysaN6RqexTfx2Z+c2KQp2Iff+mSdi4WP
	RhsjsbeLgbFHCOQwYpiP2RMgJvapkKQoGxyxSEqjwxFCBvQTVRZ2p3dHPMnceLRcIUon9MlK2lBiF
	Uff7GzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqG5-0000000CDiU-1DON;
	Fri, 30 Oct 2026 17:19:17 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqG0-0000000CDfu-3SvY
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 17:19:15 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-91c5e31bea9so15208256d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2026 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793380750; x=1793985550; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JauK/xMdQboHkyA0i/AilFknl7ToPebcspkolAFjyJc=;
        b=G+NhfRy9zcneacyQTyADTmzuSUOY3/glMJIsIT7ycFnjcgGcVg8fGwg8+tAi3WeO+v
         u6KknFlJroASX8Bv1QZMG4ShAXJVBPprsQ1N8ACrrYbGGESmrYRgpTGHmgM1cXtj2rFS
         6Yjw5vOh2eYIKbIzkrFODZT9eH5UhmE21fAQI2TrjNO8kgGFrZx48Q2DgR8wRSjJmCBD
         e/phnXWC4VDAUAXc6FP/8nYYIRxWg09BIScrCkP6ycnr1qopi4IKber75+6sRqTLgNxV
         Cpve95Y6j3zOxemy11vtZY7iER9y2GGTgXY7K9IFz58Ge/zEtjBlzzuGzi8YUjsX3f/r
         FItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380750; x=1793985550;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JauK/xMdQboHkyA0i/AilFknl7ToPebcspkolAFjyJc=;
        b=oZiLG5VoD2BaQLlZckkaexRn0Jd87UbKYj438VIWdVwIZLAQH2qnd5yY8TWfzKW+04
         AnCVB8JFrMYY1BprZLeCtdG0yL9IfudIslmfGxr8VrSZEG+C38IN1Tinido7jCmcWcsp
         jCbkIaxRfMHmGK+6gj9YN/pwy18dzKmC74CF9uLqEmGhPCkEPZus9mPkVc2aaiamwuho
         jsAYKfSuUMXzgwGCSpnBMHPJZLtqzLgefW1hl3H9vknu54W6tLa/UAdIMOOwREXSK+Oj
         n1652PQkfjV3zhy/3BP3ZYLPVCygfG0OrEpY9VABA3Ns2A9kzdhcxuY+OHmZBFmgzDWL
         1E3Q==
X-Forwarded-Encrypted: i=1; AKwUvByjK0Ci7/yD6ATkMSBT6v3QrK6mqglOfTphVK1IxKYMIJhmpsGeZpIqAsDfi9LXCpskoqf5p6qHvInCWA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIeut6U32YeGJ9rgY1HtnHDqO6KBCVKZSu4N8a9shF5DvepC1hx
	BobE4Jqp/1A7fzcDarEZFYHA98orbkvP126OOrVq2XC5tRZt+7loFI0vvnaIe2y0ad4=
X-Gm-Gg: AYBFou0UgeR58dQFfbeAsPPSDMFgLBHEyza4TjvwFMpMSllaO5VYNTdzim7oRA8dDnF
	1Y8h/JhtV6xqdoiXKqtGsuLQPEJhJBakG/l3uq9c//MFcqcKmWhKhaRZi9N599c2bnRgexGUDzE
	bUrjt4TCXuXCgvZFMWMdCnuKeeUQIuLX0h8M4/UYzsg5R4qqeBCxj6tw1okKvYZS5C2xXUO52iG
	3m3eVQgaPorENFjQod8iQGUF4ZJmeR2FT9DnWKIZJaRusxVQPAVbptdjAp4G90hFTiWOaGuM3Um
	ZeFGuKeZ/l0Vt5qh4WGJ5zkG5VvjyIis/uus4jmqOWNc+sU5uF7bA/ZGH9dqpv7UG0CQ/jPaNQJ
	1XUliVDYqLvTGpndF46yNm+sC9qRdPOX726sSTJVId6gUV06w5jGB+6ONpEN4ke4G2OrL05YDRG
	1+DMNlsp5Gx85P5P28fpa3m+Y5cuRQreBSG15NbpPbPn36tXs6xn2hDdDacdWiMEf2SIMA6Y7qw
	JcVJyMBSB/Uk4lrMT/2s2SmVDuE6Di1Yjp9Lola5jlfgHkcAR5yY/s03IlRAxroopsw5cbzclzP
	2+cNOff+pWGtZSTRCNg33Nz28bx6put1diuXP9/+LfxUjvXKL716smfIuUVkHpdb
X-Received: by 2002:a05:6214:e82:b0:91c:71a9:34a6 with SMTP id 6a1803df08f44-91ca4b9af72mr48585976d6.37.1793380750212;
        Fri, 30 Oct 2026 10:19:10 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f3db1asm20663476d6.16.2026.10.30.10.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:19:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 30 Oct 2026 13:19:06 -0400
Message-Id: <DMICF1DA617T.1TZ7DMV5WG818@baylibre.com>
Subject: Re: [PATCH v7 0/2] Add UFS Host driver support for SpacemiT K3 SoC
Cc: "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>, "Aurelien Jarno"
 <aurelien@aurel32.net>, "Jennifer Berringer" <jberring@redhat.com>,
 <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Yixun Lan" <dlan@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Avri Altman" <avri.altman@sandisk.com>, "Bart Van Assche"
 <bvanassche@acm.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org>
In-Reply-To: <20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_101912_879728_3062A9D5 
X-CRM114-Status: GOOD (  24.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Oct 1, 2026 at 11:10 PM EDT, Yixun Lan wrote:
> This series try to add UFS support for SpacemiT K3 SoC, the controller
> components consists of System Bus Interface Unit, UFS Host Controller
> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
> Management Entity (DME), Transport Layer, Network Layer, Data Link
> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
>
> The DTS patch has been dropped in this series [2], and will send
> in separate series once this patch accepted. For people who want to
> test UFS driver, please grab the DT patch from version v5 [3].

Hi,

I've been testing this series (and the DT patch from v5) successfully using a
v7.3 kernel in Yocto's meta-riscv layer. It's been working well with fastboot
flash in our nightly CI. An example:

https://forgejo.baylibre.com/tgamblin/boardgarden/actions/runs/827/jobs/9/attempt/1

For both patches:

Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
>
> One known issue is that the device will occasionally raise BKOPS interrupt
> when doing some high load test, log from dmesg shows
>
> [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_event_handler: device raised urgent BKOPS exception for bkops status 1
>
> Link: https://spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=en [1]
> Link: https://lore.kernel.org/all/20260918-belligerent-succinct-kraken-7fa592@quoll/ [2]
> Link: https://lore.kernel.org/all/20260916-08-k3-ufs-support-v5-3-1f5d71f1027d@kernel.org/ [3]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Changes in v7:
> - check err return value of ufs_spacemit_quirk_host_pa_saveconfigtime()
> - Link to v6: https://patch.msgid.link/20260921-08-k3-ufs-support-v6-0-3479768a2299@kernel.org
>
> Changes in v6:
> - drop unused macro and dev_req_params
> - use global PX_xx macros
> - fix axi clock name
> - drop dts patch
> - collect tags
> - Link to v5: https://patch.msgid.link/20260916-08-k3-ufs-support-v5-0-1f5d71f1027d@kernel.org
>
> Changes in v5:
> - adjust clock names
> - add runtime power support
> - collect tags
> - Link to v4: https://patch.msgid.link/20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org
>
> Changes in v4:
> - fix clock and reset settings
> - drop function which retrieve value of tx_lanes
> - propagate return error of ufs_spacemit_dme_set()
> - check return value ufs_spacemit_check_hibern8()
> - drop call to ufshcd_vops_phy_initialization()
> - handle compiling warning if CONFIG_OF not enabled
>  add __maybe_unused to ufs_spacemit_of_match
> - Link to v3: https://patch.msgid.link/20260806-08-k3-ufs-support-v3-0-037fb322acdb@kernel.org
>
> Changes in v3:
> - collect tags
> - fix dt-binding warning reported-by sashiko
> - fix low freq in opp-2 table
> - fix err checking in check_hibern8()
> - propagate err code in link_startup_notify()
> - update documents for event_notify()
> - ufs clock driver is merged into v7.3-rc1, update cover letter
> - Link to v2: https://patch.msgid.link/20260725-08-k3-ufs-support-v2-0-45036a2a2418@kernel.org
>
> Changes in v2:
> - fix missing interrupts property
> - move ufs node to k3-com260.dtsi
> - convert freq-table-hz to operating-points-v2
> - rework reset_control, fix header and drop global variable
> - drop dump_host_regs() debug interface
> - converge and refactor dme_set() operations
> - massive reduce of busy delay() loops
> - drop vendor specific hce_enable_notify(), fallback to default
> - drop unused member from struct ufs_spacemit_host
> - add COMPILE_TEST support to Kconfig
> - comment style fix
> - Link to v1: https://patch.msgid.link/20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org
>
> ---
> Yixun Lan (2):
>       scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
>       scsi: ufs: spacemit: k3: Add UFS Host Controller driver
>
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  56 ++
>  drivers/ufs/host/Kconfig                           |  12 +
>  drivers/ufs/host/Makefile                          |   1 +
>  drivers/ufs/host/ufs-spacemit.c                    | 652 +++++++++++++++++++++
>  drivers/ufs/host/ufs-spacemit.h                    |  77 +++
>  5 files changed, 798 insertions(+)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260605-08-k3-ufs-support-c8b308e415e2
>
> Best regards,
> --  
> Yixun Lan <dlan@kernel.org>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
