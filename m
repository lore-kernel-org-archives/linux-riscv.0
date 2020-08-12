Return-Path: <SRS0=T9/Q=BW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B284C433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2020 23:48:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B4C207DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2020 23:48:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0pwocqd6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="rUbp//9k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B4C207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQNj31fxxSpfXrCeiZGFPQXqpKKvPyy0a5jjqTfnCfA=; b=0pwocqd6B+QcjSWQFSlle8H4L
	aI8jx9kug7G4WmXnC44Yy/zb5HlLgypItDVkE6v6LjRFXgbacjf7Sg2/j/QwOKcoSeYpjdzpj4w+P
	J0c3IvhG6jJJ1VTMIRaY75+oa3KNfpVpLpwbZG6il53WU1EowjOqZeQjzm95py1Q8euCXwr0NBwOl
	EZpMfrJ5AwHFM4C8/Zbz/Xx5S5X1se0uf//7Nsi421T4KDW2lnw9BtxRwC3eRQmWUVDK3vbuBtbx+
	Rd60m25rBZjJkRIhQiYcKC2BOAJf0s1KRHcxZPJPKGfnhGN174kDcUW0gefL/9c9SHtuOfg+L9g45
	xViepE0wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k60U7-0007ng-Ow; Wed, 12 Aug 2020 23:48:43 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k60U1-0007iA-BB
 for linux-riscv@lists.infradead.org; Wed, 12 Aug 2020 23:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597276117; x=1628812117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/aLmMoaf+R1cfTR4Mi4doOLt0MJCtDnvFjCl4cVqNk=;
 b=rUbp//9kz8gwxsx0CFb38saEO9jQewxTUbSWfsFF5kobZUunvuoQs4JE
 hyiCaaD1Ll6FbPpTw46sbhLLAVN2hFlWZy+A5+efytLoDVYmiCC82wqSW
 dk1RulvsOVoE/exD5XlL3zfnFiQrxdLvzEpm+A5Rtr3MLrQ1X2Sk0ooj3
 At90n3g7OByM7fuL+8yYMMFezlTYph16qByLWdL0sn8Q33W1Nsd22Hycp
 RE+RIsLJik0XyXZLfkokq3UvUmROuHBta9hsmmQFuWSoCgf+TtwwD2/y4
 pQkbTwlwpkQrrLFkgD3INmS2AmkePFRpreM1ZzOb/2C/gTSd0rmhW/NL5 A==;
IronPort-SDR: Av+PgT2ott3tsroJbfLKc1vs+s5MIWIg7YLKJSebdTk8xlnibjcI9bm4jjXg/cD6AGzUj14JA/
 SH548wnlAvB0VkkxkFfdcYxLOifI2NtST8DoGPj2sCtKgm4TNPkTKSSA0ndFuGG8IaNVvwZiYr
 i8lzzBHi7/tyARCmM4jDpN5KvFXMxS4fSTVcxWFrkg6PUkrzzQgEShBBPU+qJBz3cFCsne8xBq
 SAYx+47gSnsQWfYZ6uBf8cb1rpqh/YPY/MVCvhXENs7J3dy9mx53N4acg/5NqPvouSt5wm0wnF
 C8I=
X-IronPort-AV: E=Sophos;i="5.76,305,1592841600"; d="scan'208";a="144856846"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Aug 2020 07:48:35 +0800
IronPort-SDR: uz0JqEeZbqvxQzhKmyh97PTraCogMC3vzSn8HCcqcC+8YM9xuiNogxYb9p629hWmkqXXnnZJRu
 AVo0GDacwzew==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 16:35:42 -0700
IronPort-SDR: P3ovugPv+fDHQa0kXG4xONb+xNMYChSxVI7c1P6E62oC4EfAS3HLQYntJ5lU99kbUACcLa5o7B
 X4ihSkv+Dn0w==
WDCIronportException: Internal
Received: from usa002576.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.59])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Aug 2020 16:48:32 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/9] include: pe.h: Add RISC-V related PE definition
Date: Wed, 12 Aug 2020 16:47:53 -0700
Message-Id: <20200812234758.3563-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200812234758.3563-1-atish.patra@wdc.com>
References: <20200812234758.3563-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_194837_617361_18B1C3B7 
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
Cc: linux-efi@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Alistair Francis <alistair.francis@wdc.com>, Waiman Long <longman@redhat.com>,
 linux-riscv@lists.infradead.org, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Ard Biesheuvel <ardb@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Borislav Petkov <bp@suse.de>, Mao Han <han_mao@c-sky.com>,
 Daniel Schaefer <daniel.schaefer@hpe.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, fwts-devel@lists.ubuntu.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Define RISC-V related machine types.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Link: https://lore.kernel.org/r/20200415195422.19866-3-atish.patra@wdc.com
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/pe.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/pe.h b/include/linux/pe.h
index 8ad71d763a77..daf09ffffe38 100644
--- a/include/linux/pe.h
+++ b/include/linux/pe.h
@@ -55,6 +55,9 @@
 #define	IMAGE_FILE_MACHINE_POWERPC	0x01f0
 #define	IMAGE_FILE_MACHINE_POWERPCFP	0x01f1
 #define	IMAGE_FILE_MACHINE_R4000	0x0166
+#define	IMAGE_FILE_MACHINE_RISCV32	0x5032
+#define	IMAGE_FILE_MACHINE_RISCV64	0x5064
+#define	IMAGE_FILE_MACHINE_RISCV128	0x5128
 #define	IMAGE_FILE_MACHINE_SH3		0x01a2
 #define	IMAGE_FILE_MACHINE_SH3DSP	0x01a3
 #define	IMAGE_FILE_MACHINE_SH3E		0x01a4
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
