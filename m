Return-Path: <SRS0=trTC=B5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BFFC433E3
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 22:24:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB6F20758
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 22:24:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YSLbM4wd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="rjZajX+N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB6F20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O8a95Di4CjggJ3Q6mX6kyyBjxqeWcfOB7QuR1dycKzg=; b=YSLbM4wdM6ShK4W1i6AHt4QuN
	ZiAu4URmqQnwyrZpMLLbdd9MU0WgJOoMU4m9Pz5VL9f0yoWgAVYu3LHmOFNEv2JOL8RiqM0E54fuV
	qF62PmWuzIUV75TYsLOivuq7UJobFiAYLQ3Dvy9xqQDbngKbl7Dv1qCfdcdEdlH+Vn/rvrdkthLGC
	VapgH3KVTY2sqrGtVKB6CP+IKOnCNcaGDCelxt9NCOyYYLuniTzIoW+7EC473PXXP6YFVtJFhGiK1
	/NsXbiK4nKaeI0nB8uAyBE6y98CKrSZS5GDR5Pla+8h32NHe0q8x5ospKkuiFKfmp3EFPmb1UBT3Q
	tNRp5+weg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8WVe-0001GN-06; Wed, 19 Aug 2020 22:24:42 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8WVZ-0001DJ-Uy
 for linux-riscv@lists.infradead.org; Wed, 19 Aug 2020 22:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597875877; x=1629411877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bk2Gh/XGM+blmye1lG7fqQWiRAnoRdaJAzm3HH3f+As=;
 b=rjZajX+N7+2i/jSYGD90ZhC6e0hpsyzilWBi3b8wXoqDlykCdDIkS76R
 Mv/1q39ykX0EaxO6JoDQzOyld7Zuzv8EfavMgbtlInNzeZfrMgtSoNzsC
 dfLtsHsu4Z1fqijLDaH2vI+bbPlwliZIzGBIxQ+Dckqsahs0DENUqs3xy
 HmtVeok2sxNpWLWio3JR8cBrW77gbVK1KGVKAI9jxnVTGOsHXKAH58JBq
 shOPRirTIOoZVBz0tLxY2F32QlOuH9MEyJ+zfmAiTNdnPmYe4XkB1A59E
 qyY9slPCmDviUgOjiOnTQkYRCAlyxJDg0ywRiLOPJ0c0HzpZtOKkEc3hQ A==;
IronPort-SDR: AI31E3JuHSaOFtNlUbxZeVX9Ad/wAuX139U0+Or+uQLjQxioowy09nXeaVp9XH1u0NnzvOkQnL
 kYmjRMQPwgI09cbLJ4DVsMa8NHgl4WrRuxtrz7iA+NM0iQhEEZVLHHeGOvlKWpZLxM4fhyJNYY
 IKoPeA15B0/RQBR0GrFg7SyZwGwrCkAezECbHfEp/OzgisCYIccl3vuyyOR8B7lzAdHgWuJvg8
 iaaS+jxLMhfjrKauAicK7JQsWNi6R+Rl8Gv46e+QFANr5zPGWCK4A7rR+yvKaKlLIGwlEPi7lO
 fw0=
X-IronPort-AV: E=Sophos;i="5.76,332,1592841600"; d="scan'208";a="145313332"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Aug 2020 06:24:37 +0800
IronPort-SDR: YUxCEj25mx+qBCotGemBj02jd4HjqUiwQIukxasab34aTKDo2OrePNxEMjbkPwlmBLNiBM8gg/
 6qqzty3FZIcw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 15:12:20 -0700
IronPort-SDR: mR5GQ++tJdfzFRFihTJaMucU1XgxcuUoLxd/gRMkE1wzAwfBUDzf6fR7PnP8j1c4pLfeMm+J6o
 LVUXXgAWTJVA==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.62])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Aug 2020 15:24:37 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/9] efi: Rename arm-init to efi-init common for all arch
Date: Wed, 19 Aug 2020 15:24:23 -0700
Message-Id: <20200819222425.30721-8-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200819222425.30721-1-atish.patra@wdc.com>
References: <20200819222425.30721-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_182438_160716_4C67A0A1 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Alistair Francis <alistair.francis@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Steven Price <steven.price@arm.com>, Waiman Long <longman@redhat.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Daniel Schaefer <daniel.schaefer@hpe.com>, Kees Cook <keescook@chromium.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Heiko Carstens <hca@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

arm-init is responsible for setting up efi runtime and doesn't actually
do any ARM specific stuff. RISC-V can use the same source code as it is.

Rename it to efi-init so that RISC-V can use it.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/Makefile                   | 2 +-
 drivers/firmware/efi/{arm-init.c => efi-init.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)

diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
index 7a216984552b..61fd1e8b26fb 100644
--- a/drivers/firmware/efi/Makefile
+++ b/drivers/firmware/efi/Makefile
@@ -32,7 +32,7 @@ obj-$(CONFIG_EFI_EMBEDDED_FIRMWARE)	+= embedded-firmware.o
 fake_map-y				+= fake_mem.o
 fake_map-$(CONFIG_X86)			+= x86_fake_mem.o
 
-arm-obj-$(CONFIG_EFI)			:= arm-init.o arm-runtime.o
+arm-obj-$(CONFIG_EFI)			:= efi-init.o arm-runtime.o
 obj-$(CONFIG_ARM)			+= $(arm-obj-y)
 obj-$(CONFIG_ARM64)			+= $(arm-obj-y)
 obj-$(CONFIG_EFI_CAPSULE_LOADER)	+= capsule-loader.o
diff --git a/drivers/firmware/efi/arm-init.c b/drivers/firmware/efi/efi-init.c
similarity index 100%
rename from drivers/firmware/efi/arm-init.c
rename to drivers/firmware/efi/efi-init.c
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
