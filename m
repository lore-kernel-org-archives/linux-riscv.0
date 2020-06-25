Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72428C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 09:50:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5D7215A4
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 09:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K6kBqlqD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="STZouody"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5D7215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BQNj31fxxSpfXrCeiZGFPQXqpKKvPyy0a5jjqTfnCfA=; b=K6kBqlqD4E1NzEFGPefsiG9kw
	RaZZXLC7fkzXPg2shD3C4//LBOuBX9UEQbNr+ntcrzqnYzPpoJ8xswH3nwsISE5fw/iolHlIpMZXD
	WY8YdhULqW9nQlYA+uLCMFE3tgQHzELe+cE5CuDjeOCYBKv5wnFjw9A5/Cad5UyfTcmpsGVjMiX/t
	zXqRhlDmO3DLgAy/TZdLh7UQTbewmKtbHR2ScP1Y2oPgpCRilDukCyQQpOKDGtfQKXRptV4ndbjdx
	pVNYg1iII0PwO3tB035Ztiu9Lt98cj3b2gUZ65o1nFm61qSu/918dbXuAm1qbo6L9WX2jO6BA2mlu
	go11M15Sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jol0M-0002mi-BV; Fri, 26 Jun 2020 09:50:42 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojnI-0002Se-O1; Fri, 26 Jun 2020 08:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593160405; x=1624696405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/aLmMoaf+R1cfTR4Mi4doOLt0MJCtDnvFjCl4cVqNk=;
 b=STZouody1zwMIXI3S2FKaTn9h46bBago7NH3Pdp7J/4I0sbmLmvo+kwx
 oeLCV6fi+s5FQRTFCGO8Fi5ap5zmonF2SiI5zWzitkD35+qHDeOvs3XeM
 8Ypkc18Jrwp2FcwVMr2Zk3E3cVLc51JlFg9DicOGGcrsP/BI2gjF3CX3n
 dG7iekK+phBPyKqTjmrcxdMrfKJkSv1bdGHX51tOAA6UjjwUWie/NPkxk
 Q+r25Ul12BAz3C9tIJ3M0Okse/OTp6zazRqgwLvZ4vC8govnrm9ADvSTO
 CjbzvNmDvMYnvKmV/0hkIHW7cq91CEB/E5nvcIoDnpZw/hTwLiryTwQEh Q==;
IronPort-SDR: 3JKjASaZsXLb5USMDrV2CAcxss2JLjtSORhf4ec0FbCbfDlHxNnvLMujS/a/4L3p0xm5xMZjF0
 E4nU0zM4jlSS5bTyoFkgCeNZNWB+MDiRhW+AN5zw+iATaC4xLmcW5lzlNJS5QK27B9Q+rbIZFR
 pfKpwtaf/UXgAk5iJyOU0prsFVVJbhrN00L0+eGONTwE4JstV2Lzjg6OX3Gtoab6/PMJ27SNhu
 ORWHSbnRSriOVnrd8CNoiwsXy2oWF06XqnX/1x6Brx/7VRmusbqaFhesFLKmTvMLF4pSuRhrC1
 6Mo=
X-IronPort-AV: E=Sophos;i="5.75,280,1589212800"; d="scan'208";a="243966122"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2020 07:45:59 +0800
IronPort-SDR: OJ4ZZ1wmDZXWhSV5XMzf/hgYCpIL4BI7/8W+asnozef6Zbl8HT9bD9LegxFDzUqdd8NLkaD+vm
 iHinNe445+xB/TE05zcphDSQ86JsxLOhg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 16:34:27 -0700
IronPort-SDR: rsP8xzULUfBFMDuMCtJGe0TMaOrFxT6DTyZwDjC5tdJA7trEYutCByptrNB4uMfLlWXegYkKzb
 pktVpb+3JPPA==
WDCIronportException: Internal
Received: from 2349pbt5e4f.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jun 2020 16:45:26 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 07/11] include: pe.h: Add RISC-V related PE definition
Date: Thu, 25 Jun 2020 16:45:12 -0700
Message-Id: <20200625234516.31406-8-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200625234516.31406-1-atish.patra@wdc.com>
References: <20200625234516.31406-1-atish.patra@wdc.com>
MIME-Version: 1.0
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
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
