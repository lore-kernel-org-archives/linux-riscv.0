Return-Path: <SRS0=T9/Q=BW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB15C433E8
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2020 23:48:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F8A42076B
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2020 23:48:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ldwG15Hq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="O0maVcWY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F8A42076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1umPXkIVQHPQCS1yTh55sW4POQ14YuwTY5okvhadl7E=; b=ldwG15HqR5zoL6kBvDaZm78vT
	5XXkEYTMcizr8TJHZ5sv6KPVrnj3USEfC80jyHXi2bkZph6sjMpyyZaaMiuz1gUgHrb1OcmoFv+gQ
	lQagQEDyo+ffa1PrOE+v5TByFwfJcZ+K9vwXt8vzh9lMnK1CEZ9gqyt7/mAjD8PB8MBUDLN3xPeov
	7edCFZsLyB8HmVRfcVd2OvtVwJktdvZbziiKIUrMo/uHo75gZDtmDs70t27p5e/D6b39Wrukh/7Gq
	szyVSxb8a2KWfGYrTRIpBcmyqIBRSLQKs6sIzIT9KAOcuFVKUHP5oyxI9JdJiM3+Vp4+Wts8MoPRu
	Z4GG1Xtzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k60U9-0007og-89; Wed, 12 Aug 2020 23:48:45 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k60U2-0007iA-V5
 for linux-riscv@lists.infradead.org; Wed, 12 Aug 2020 23:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597276119; x=1628812119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T6HBziqjPfpEOovieQwcPFPkqxzZPptEH0FVtMgRIac=;
 b=O0maVcWYWJm0JpWK7Zwf6EtJmsROG1Z/4hfPcLAge2aIgCFW1e9jK8sv
 MMJ/OXA9DAlJK3H1Et/3YDxv4CHNx4CY20iFL0z4OwRrglg+3qqw2j83M
 dCOz8NdYj7S+IDvad51PyBmpwRwUQBdsKXm25jCVRjbo6fzfZCl/KX41W
 NGM5p6tHfUKmOdwFIFG9MNKXY96CnzyGInRJvwgMj3Z/yDBRB3DRL7ABA
 tn1XZr5BKv+t0gGMK+Rf4dmh6d5+9+NpnI7ZM39kjK2OLonSRRqJrw3v7
 eN97rNUNE9n1GUDv4EI8WfFpykT0U/zp3rrf6T44LS3TrdkXiRooTM/Go Q==;
IronPort-SDR: O5ZZoG4ysxQ8hN7qzENWUC4vgS/dOCiN0ltWSBf52s7C61uwF9IoiSCZiYqrIxIay/H/Wi7/y7
 EeTPmwv8olKTIVCyKN8ucGNCiMpWDAX48kGpHsmN/CLfJ2VioaWZ+wTOe54GSV2WRqk5Ztnpty
 4Zjfs8o4ndK7BP9tCHxbpYmsfuW3kGuEB3y8wl4vQpT736YbvGxpZ6Jv6ugRTBpsPt3qjvZ5l1
 MwNMwKDe+1+rFkivMh9J5we5SRnNrZs5lMAMj0oQOpCPLovI5e+DTdLd0P2I7XWAo4lsRTfaVn
 6kE=
X-IronPort-AV: E=Sophos;i="5.76,305,1592841600"; d="scan'208";a="144856854"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Aug 2020 07:48:38 +0800
IronPort-SDR: pFYP8Pzq04ylpXGNRnbbhPpDMylvFu1D2+gT7ZrbimoR1o8t7AMFJiJOANdotchZhzEgdg4DXW
 8tfpcykgYbWQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 16:35:46 -0700
IronPort-SDR: O+vleDwdgNpf3+2oP8xArSX/++jjUSr7GNwSK8op4zl/Hvx9QM238mzPfMh8vi6BCgYI+Tv0sN
 qx8sx+6zXXqw==
WDCIronportException: Internal
Received: from usa002576.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.59])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Aug 2020 16:48:35 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/9] efi: Rename arm-init to efi-init common for all arch
Date: Wed, 12 Aug 2020 16:47:56 -0700
Message-Id: <20200812234758.3563-8-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200812234758.3563-1-atish.patra@wdc.com>
References: <20200812234758.3563-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_194839_217211_1EE9D765 
X-CRM114-Status: GOOD (  13.10  )
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
 Alistair Francis <alistair.francis@wdc.com>, Waiman Long <longman@redhat.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Borislav Petkov <bp@suse.de>,
 Mao Han <han_mao@c-sky.com>, Daniel Schaefer <daniel.schaefer@hpe.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, fwts-devel@lists.ubuntu.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

arm-init is responsible for setting up efi runtime and doesn't actually
do any ARM specific stuff. RISC-V can use the same source code as it is.

Rename it to efi-init so that RISC-V can use it.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
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
