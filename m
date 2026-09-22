Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC61C982FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plyJay9fNwFPAj9X8V++cwDa4XDKKPLJAGTGKZLzLoE=; b=T7R/l45250GaaR
	EgXAE/+3hx/NqwreavCbWjKjWSp8E68jUTPbdBQTyx0dSW2aOgr6PSSYZRczbJWODPEdNmEYh1UZC
	J/JJpIbrl59xOkfILk+GcgMfls6V87ecx7tnhuKR8pgsEIAP/EaMD8LXR7nOHB+5fyl2BpS1granK
	ijXTM6FpoZHTPN8xEtGxcgSQUaP7JOAFSB3xm0kICj1p3wba2CenqRxPykcAec/VbnS9dVaXf84O3
	69/xe7SKrsl9fHszGIVoef4Cd6egglvqeTd8qJGKPQ4H7JA5qVIUXGhTLhzd9nkKNmHbGpgAydoIy
	M8DKiz5zth57Ns9CcPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uKc-00000004NS6-2ie7;
	Tue, 22 Sep 2026 06:50:22 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uKW-00000004NMs-1yUJ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 06:50:18 +0000
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4eaf44e16;
	Tue, 22 Sep 2026 14:50:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
Date: Tue, 22 Sep 2026 14:50:01 +0800
Message-Id: <20260922065001.1888961-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921124206-GKI297024@kernel.org>
References: <20260921124206-GKI297024@kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa0c7e1019503a2kunmdae442db36297
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHktNVh5CH0JIHh9OH0tPGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_235016_680030_104AD747 
X-CRM114-Status: UNSURE (   3.74  )
X-CRM114-Notice: Please train this message.
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

> Could you point me where the u-boot patching the MAC address?
> I'm not fully aware of this problem..

This is handled by U-Boot's fdt_fixup_ethernet() function:
https://github.com/u-boot/u-boot/blob/main/boot/fdt_support.c#L639

do_bootm_linux()
        |
boot_prep_linux()
        |
image_setup_linux()
        |
image_setup_libfdt()
        |
fdt_fixup_ethernet()

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
