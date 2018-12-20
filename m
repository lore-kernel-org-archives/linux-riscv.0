Return-Path: <SRS0=M4pA=O5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF17EC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 21:25:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B684E218F0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 21:25:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="horS46On";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQCM64Vl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B684E218F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=feGe9ZVb1PEHu4WGdk1dUOVYNl6vRxW2omI2dlU9Gp4=; b=horS46OnL7OHF5
	vhGi/GqJuofeHOzVSmp3krtnGCgbihdTwPICI/8e469GS86jfUXTJpjDFj2OjFxLnO7jQmpivYZ3H
	k8xpwFzE9iLFusRfyqdKW9eklxIcbS+BaECTOtCdrKPY9CC24qDwsSvLf4rvsTNaBHwfa+zyVGODa
	vJ1eYeO8liOHIeg5QuyWBbGEhizzPLnXIB6cUsyyDw35zRB6ArioWmeqdkS78cWw2W00K3pEc8Fwb
	Fa65JC313NBU4D6UxJEfA2IoLOPcB+frhgGCOBV/gt1OtHt243X/Qt4lpWLd3nngg1qXcwmu60Qyu
	apa2kKz47zGpCDAEEMyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga5p0-0003uJ-Qj; Thu, 20 Dec 2018 21:25:34 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZnOv-0002wY-1R
 for linux-riscv@lists.infradead.org; Thu, 20 Dec 2018 01:45:26 +0000
Received: by mail-pl1-x643.google.com with SMTP id e5so76884plb.5
 for <linux-riscv@lists.infradead.org>; Wed, 19 Dec 2018 17:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=YdZTl0kFPOrAAWlSh8Y+H2qvRaGrogVGEf/g9cnbaCU=;
 b=IQCM64VlMK5QujH1xfwAlJRbC1ez78mZjisl3i7JhPpohAfyDxKeWwgojN49Y5gxpw
 ZL2qAtoNGNLx2AQ3dMmnSFqi1p+uhJZ6dc0THl6thCAOpaDDjJNzIKa5u06qlp2e26XD
 clQ1y8QQufb/dyOPg5Q3ReBFxo5whDi6P1Po6ZT0AGLB60GHDWd7ucCI6ixc2EgBXK8D
 K/orJxiymCkVapCw2ghsBef/LwKRHpJAITJzlB23Cc5cWAj3cfM93ywYtcIsOs/wIFj6
 F+EwEIIvho9v5iqibimQrd7KLCCDmqB0R1Tedd5rgE01EFSff1kLubJ96O2zdNiEX9Va
 urxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=YdZTl0kFPOrAAWlSh8Y+H2qvRaGrogVGEf/g9cnbaCU=;
 b=B8aXaCRsSi+mqLQrm3L9wn4JlDkOy6yXdD5fV2BYb9rxRfzgM7ec/Q98x27uQaozvJ
 MGO43HBhIFKG4ymyY6oqWNV0FjIyvy4oYPR37fG690WohmJR5HsCMzSNxi6z3LtlOL7P
 LnWcGtZEre064INEU1yRS40lfYV1XFbXl6xLQHUhe68Ormrscwq5OtgkzRmeTtgTxtsv
 Z7ETFMP9VdBKN/On4XpDUp1SLpB3mrs7LNKd2U1GMcVFXPpQeocgkmq3ciWGdDXVAmt8
 s3srXc0pgzgb4XnUW2e4jxolv6ZxSBs7rU+sIrbOM2Y0MqilsueITc8i9AKRc80GxcmR
 soPg==
X-Gm-Message-State: AA+aEWZwuMeYI0tBR6iZ3mfy4Cszskm/nuLAfNPsa6U4bIw7FvylxEj1
 l7Ijnj0q5lQiajO1N51m6X0=
X-Google-Smtp-Source: AFSGD/VllhDam/M6UHu/dqRemnsCRFxd1bOZalAdN8prfzyTbGayG6yVIcm7Qf/ic4oh5npcMDKp4A==
X-Received: by 2002:a17:902:2862:: with SMTP id
 e89mr22722880plb.158.1545270314057; 
 Wed, 19 Dec 2018 17:45:14 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m198sm33661345pga.10.2018.12.19.17.45.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Dec 2018 17:45:12 -0800 (PST)
Date: Wed, 19 Dec 2018 17:45:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: Add CONFIG_PREEMPT=y to defconfig
Message-ID: <20181220014511.GA24845@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_174525_128069_FACF2C53 
X-CRM114-Status: GOOD (  18.91  )
X-Mailman-Approved-At: Thu, 20 Dec 2018 13:25:33 -0800
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
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 21, 2018 at 10:58:05AM -0800, Palmer Dabbelt wrote:
> I don't remember who suggested this, but I was talking to someone at
> Plumbers about all the horrible bugs we've had lurking around in our
> port despite it still getting to userspace and they suggested that I
> enable CONFIG_PREEMPT in our defconfig as it'll help shake out more
> issues.
> 
> This patch enables CONFIG_PREEMPT in the single RISC-V defconfig.  It
> still passes my tests (ie, booting Fedora on QEMU).  Maybe I'm too
> paranoid, but I still don't trust our port enough to just pull the
> trigger on this without at least accumulating some "Tested-by"s on it.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

I can only give you a

Fails-miserably-for: Guenter Roeck <linux@roeck-us.net>

Not the new defconfig itself, but the new defconfig plus a variety of
selftest options. I don't know what exactly is failing, but here is
my list of enabled selftests on top of defconfig:

CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRC32_SELFTEST=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_DEBUG_NMI_SELFTEST=y
CONFIG_DEBUG_RODATA_TEST=y
CONFIG_DEBUG_TLBFLUSH=y
CONFIG_DMATEST=y
CONFIG_GLOB_SELFTEST=y
CONFIG_OF_UNITTEST=y
CONFIG_PCI_EPF_TEST=y
CONFIG_PCI_ENDPOINT_TEST=y
CONFIG_PROVE_LOCKING=y
CONFIG_PROVE_RCU=y
CONFIG_RCU_EQS_DEBUG=y
CONFIG_STATIC_KEYS_SELFTEST=y
CONFIG_STRING_SELFTEST=y
CONFIG_TEST_BITMAP=y
CONFIG_TEST_FIRMWARE=y
CONFIG_TEST_SORT=y
CONFIG_TEST_SYSCTL=y
CONFIG_TEST_UUID=y
CONFIG_USB_TEST=y
CONFIG_USB_EHSET_TEST_FIXTURE=y
CONFIG_USB_LINK_LAYER_TEST=y
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_TORTURE_TEST=y
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RBTREE_TEST=y
CONFIG_INTERVAL_TREE_TEST=y

Tests pass after disabling those tests (or after reverting your patch).

Guenter

> ---
>  arch/riscv/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ef4f15df9adf..8869471af0fc 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -1,5 +1,6 @@
>  CONFIG_SYSVIPC=y
>  CONFIG_POSIX_MQUEUE=y
> +CONFIG_PREEMPT=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_CGROUPS=y
> @@ -77,4 +78,3 @@ CONFIG_NFS_V4_2=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CRYPTO_USER_API_HASH=y
>  CONFIG_PRINTK_TIME=y
> -# CONFIG_RCU_TRACE is not set
> -- 
> 2.7.4

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
