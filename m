Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63074ECD9AA
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPte5wIDogFzfwuhPOvKkse+MnOgEsuqMNSdf+IW4is=; b=hsfWW3G7fvbbJ/
	2W/1EjLgvKhQKS2RE/qgN341TeXVBgn/Y2arw4S9NH/lX+yTxf9qWrS7Z3o5+V//J8guQ2r+eetUL
	e+XN8sy9iBEwXiY/Dsk9Kv0qnVUXyf0E0bBU9VAXb8e8T2RmohlWnv2vUP9OR2VJi+Ab4TjMFtm3S
	ipOG45utpjeJp02M8+SV3l0S85Owpds9gInoUzgQkctIUZsyFs6HdknedSQ+23YhBVBcbwa57YSBH
	r51NRwZixNw5oD6YpU79UE6RyIv6SFOzg8rB8KvDBtqgSNEVEvnVWL5DGZFSWl4zbDggycB9+Qtej
	OPBXQti/kA/2ubDzrTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dn-0000000Ae1E-0h1P;
	Fri, 06 Feb 2026 00:24:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dl-0000000AdyG-1Aga
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615M7nug334697
	for <linux-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FzTAUyaLhnk
	1nNIhG4OIYl6NZIfOvt0gAkRvxrWQ6X0=; b=BaaN1TYOknrDYAdbMq8zVMa0gca
	iVe0pEs8ftQOgMiqkrltAdrjc6fN3YM3MEmRTVPJe1H1ARCbntu6kZ/tSkWMBc3J
	KwcRs0nDiXZWE6+j6+NWkzHN9lwyDREG9BhgPJQJ+Jm0r3MgzVyj0VCV2ihFkNPH
	xPxjJdLUCFxqDkD2lGP8WlOOkJRoFQvrFx/VYDSd7s/m8yaqGgswtbV/RKVJG5Uj
	8yS4nC3q3hkILkgVuyR9rvT57rCpnwoTIbIUOoyNxCAJUTnJSUOaVTUfvSwncmwJ
	Go6nfS6A7cNUgua66QPp7lKzz+iojMQ4yBZOq109/yRoVOwMRcKmx8zzqRQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c53qv8bhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b7eddde359so235400eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337443; x=1770942243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzTAUyaLhnk1nNIhG4OIYl6NZIfOvt0gAkRvxrWQ6X0=;
        b=YpPl0Cj3TV2rL2eCfURNB+ISxYi+S0zqtdsHpoev5eH0cFYNUfy84MPp0+UTkty5S1
         Mg/sY+B4iiVD5XXvHNccvQ190dkrK61La9x6BCAeAUb1tNvv+t7xccN7z9UQD7zWlOSz
         yztBsjTx/YoGlHwIhAJGygMTFxDskmebIIRdbkTPE0y+pzZz/mxdvAAqm/CIenmOmo2L
         0qbPj2KoatGsc8xPA8Vpb+snSkTQng47g3YnNFGkpofpLh9p7uDzDadL4NcBHOcMRzkU
         MxUxNczZ8wmliKp8Tf4GsONJPOpOI59PVMnsXvo/b24w8//Boor5BFuD+85bl22m8M+e
         xgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337443; x=1770942243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FzTAUyaLhnk1nNIhG4OIYl6NZIfOvt0gAkRvxrWQ6X0=;
        b=XK+ql8fp1n5qOuAoXLKOw1DMcwe7mwvcXzYTrWZE7+V2gA4BM7LUF8GgWjHa9Vbr43
         8c9KtfXx4fiY7wamQiYx0VfapNuVcApYR8tKhKkoHTSUkm2TOr2+64IBz5FfGcNPlaQW
         T7ATYH9UmvmuKTluNC9KsGe3Ie6Xag18GLSbhtUehIHzUXYBTV47vDGalFh0H3DPlS5o
         zvHEJO3HvdsAMJyH9l4lbCYveHBrt6fXQNZ9ef7ODUi2zCXwLjEoCVhKfsVh6nQfq1fs
         svT6LJebOzpY9cTlhRK7makVV48guKZQeq9DCCfpnIFe/WzTZMns/swZ/NUgTAN1EQXw
         mLZw==
X-Forwarded-Encrypted: i=1; AJvYcCWUOBPx2lPVjEubvegx/pyQhk4M/UU0uu5ujiWYDJG5D9RvVA54neA03BR57La8HpvbrzmMQHg6EFlb4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx796SVotiQBbeB29YPzNiZl2pL7Q0HUIuFPAovOfiWjhbY8MRm
	Z3ksdw+ADDmHZrl8a21XEg1eZKXHyPmdtSyiQUTKkjuma4kf4NTNmjJ1XJlp8E6mxXbCrFmlbSG
	1e27kFC1gL0OTCh0Gv+va+2+8jnSkfx4gub8i/wG51NsK4YcLePRjm7wGbllEE6vzLRXt+38=
X-Gm-Gg: AZuq6aKmhHtc+mIr2mmxDXG3C5yQQZkGn0+xP5EPLcY3bp5RPBjja4dCqYcHB+CV2D1
	Hyn2P6nOKSeURUg/nxItT7oOLOHkHaFR5+zsaICwNb/ukT6BucGZ/FOLKKYg/8PN5qzpfzQwXsz
	9uYtntRfWseDuahaoY+tz7ldu9i75SJ4Xk8oWrAzhI99kIIgEwc2sgnK7utp/CFEyDtBsurko04
	Aea9WLGzJ9Z0KSWcPeaBi0B/8dSezrV9fUvUh43rbyfzTD+nD4DNaqfCl/0qwY+eLmMchF1P7pA
	/9zuXXGsDgyAoKYxI9Me41dLKAez8vYVGOvO427JGpnWT/4zIvSnmm1nRWZ+3G3yE2yUOUX0ZA1
	PlkGcX3Lv7DORblAyN/A=
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr445099eec.32.1770337443323;
        Thu, 05 Feb 2026 16:24:03 -0800 (PST)
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr445088eec.32.1770337442754;
        Thu, 05 Feb 2026 16:24:02 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855caa061sm591521eec.35.2026.02.05.16.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:02 -0800 (PST)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH v1 06/11] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to hwprobe
Date: Thu,  5 Feb 2026 18:23:44 -0600
Message-ID: <20260206002349.96740-7-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TsPrRTXh c=1 sm=1 tr=0 ts=698534a4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=J7CogLm1HqMz9eIOx6AA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: v3j0VrUJOaxWUjWzZ3dI19zIUyoeG54l
X-Proofpoint-GUID: v3j0VrUJOaxWUjWzZ3dI19zIUyoeG54l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfXyBnGGKi188cK
 NzgvfpudpJBILh5c8y6iRKoPakswE6v/1SiUAnzTdf60tWM2H132fCUDWnfdRz1AWkf0qN4wAtx
 5Mf07UZqWmNyuQFVeL7fRxfucjSS3hlCGTm+nz1DTeelUqVYNWrj3dwW5PrmaLYdNeIZGP8zULb
 T7wJOW3/21YzOnwSvJOJrSf97KqMiWXpcHRgUiQ66jxsgVtHiFTNJLWmpdzEqqiXBQc6jk/qmwQ
 4cJs9fVO0xivOFYpRad93TxsUTtqfA9nIhT2D42cQrG/ZFgpXdVore0xoXuCrextLBYclEBG5LW
 RfeAqc2PLv+TVBQXLtTiw22udp1F1lIf72HCAKZJyM3qnUFIut8A8McBd5cz2USObGsA7venSMe
 U3NK0RkmRn3j7g0CcoFnULLajMaKRkBxIyxgeaSvRTUHie7qD6V9OY9VNmgR4llad2IEy+eY2rd
 oUjtPBqPJ2BL4Pxkkzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162405_437780_E2C14A13 
X-CRM114-Status: GOOD (  17.30  )
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

Ziccrse is already present in cpufeature.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 16 ++++++++++++++++
 arch/riscv/include/asm/hwcap.h        |  3 +++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/cpufeature.c        |  3 +++
 arch/riscv/kernel/sys_hwprobe.c       |  7 +++++--
 5 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 4484f2a7f798..97226b7c5936 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -395,3 +395,19 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCAMOA`: The Ziccamoa extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCRSE`: The Ziccrse extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index c17e11caca83..8e764dbc7413 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,9 @@
 #define RISCV_ISA_EXT_ZILSD		102
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICCLSM		104
+#define RISCV_ISA_EXT_ZICCAMOA		105
+#define RISCV_ISA_EXT_ZICCIF		106
+#define RISCV_ISA_EXT_ZA64RS		107
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 6a0163b54718..fed9ea6fd2b5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -115,6 +115,10 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
+#define		RISCV_HWPROBE_EXT_ZICCAMOA	(1 << 0)
+#define		RISCV_HWPROBE_EXT_ZICCIF	(1 << 1)
+#define		RISCV_HWPROBE_EXT_ZICCRSE	(1 << 2)
+#define		RISCV_HWPROBE_EXT_ZA64RS	(1 << 3)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ca7a34f66738..b001e78eecf6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -488,6 +488,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(ziccamoa, RISCV_ISA_EXT_ZICCAMOA),
+	__RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
 	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
@@ -498,6 +500,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
+	__RISCV_ISA_EXT_DATA(za64rs, RISCV_ISA_EXT_ZA64RS),
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 76e673ab42a5..31d222301bf0 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -196,7 +196,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 	 * doesn't have.
 	 */
 	for_each_cpu(cpu, cpus) {
-		/* struct riscv_isainfo *isainfo = &hart_isa[cpu]; */
+		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 
 		/*
 		 * Only use EXT_KEY() for extensions which can be
@@ -204,7 +204,10 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * configuration, as no other checks, besides presence
 		 * in the hart_isa bitmap, are made.
 		 */
-		/* Nothing here yet */
+		EXT_KEY(isainfo->isa, ZICCAMOA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
