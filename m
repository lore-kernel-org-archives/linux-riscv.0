Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2A3ECD9BA
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNyHtlsjgbZfqjdZM85bbmPivoiYdgThlfkEXQUmKNs=; b=yP3D7P9WhpjDGZ
	meCzchXT8azxv7BxKay1ScZgm6P1WTyJtnfVioFaxPMpKHF6g0xhp/AQczC4/3Z2ZnMAkfPHgzvad
	Xscpnh7k7tSJf9w8DtMH0C0QMAdoOPjXWOInZOr4I26LXNC+tzKr3HeCzZ67wOQ71UEeFRLhMiGXu
	lFL+Mfam/IbwfEfzHF5hyDGrSo9lg494p6uMTPVEXQnHwL2jXFKbr21pJg7PoYDDVVgL+Bj7wC4x+
	g68ul+Lw/upLfs+wI8dIr3PQTGOwrUUkYCO3HKodKgInj5S31uWm3jwSBOr0xYZzr/laJUWpjp1aR
	yLtKcOdn5gxIb7eTFeRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dg-0000000Aduf-3YBc;
	Fri, 06 Feb 2026 00:24:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dc-0000000AdrX-3KlI
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:23:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615M3tTv890582
	for <linux-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=duq1MIGt2nr
	sc/Dbial9NVfQhy3xAH8K2EGdF2CFPhw=; b=O+uFXPch7jOYHhmOSC8XxTRciVw
	f2OEPoLt45MrHkj7sSlSE/rcRmJnI7YUKNkbKT9RDoWyjNqcYzhmHv8Pn55DATAK
	HGC3YiOj+zxzwKu8qoog2uMZu3Hm4amMe5lC1vo1B2whgTWA4z1uCOY6z0ZKN8Vg
	bBjngTeN2lJdjWqSuNND04NC4GS6zzOAPeN9xRgu2TpAgl5RB3C0cXRRxWRouIG9
	Q8tvdZtX/43xW7SWrYkyN7uo8m7NvxeLUilcjBOYs6CdoOf2yd9WxWrUAjIrjgdy
	7wOq9yj4xWFzQ00zppYRcHNOKvQJdJFJ/1dHgCC+ac/79UgBguegWHsq6bg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prxb6wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:23:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-124a95b6f61so1458178c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337436; x=1770942236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duq1MIGt2nrsc/Dbial9NVfQhy3xAH8K2EGdF2CFPhw=;
        b=Q+8CGVFfN/fl5RaSa7BkBpjFc8tBbxck6+20ugMDu5EQwdJdGeztchjdGClWHQHzCQ
         JQBuAKrNbnMiy8S2Qnc6qwejJO8GNMBOwlmiSqWPlLbz1xNreheSN5v8i9bp8jwk/SAe
         C9y3wQqm3pUgcqc1dOHXJUT+i1jyFiKLDQCKdIjYAQP+L16vOc8USNjbspgIpbbhpJ7I
         LX72jvJmXXxvR2GODQmVr+3NXUa2usCLjDcRHWDB3ADMuwcYU8CsxE5t0AkYDKUVfwQ2
         7+MXYziSUEodO+YwvOAo8UQwD11zyyuWyQmAXHbSrUajJIOBNm4z8x6rEJ5nJ2011uIJ
         MciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337436; x=1770942236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=duq1MIGt2nrsc/Dbial9NVfQhy3xAH8K2EGdF2CFPhw=;
        b=NpkWG5PJDWQDKIEbGWBdiEoBCcRjzrj7W+3ykX3dZhus/qmWCQTxWW2Je6KhY9a6Gr
         0z/VkVVlAj5nh7n+NPKHxKbantixPtGTKQMJsK3kF3WzTb9T3ufbUXNbQ8HnNtQspE+G
         We5KzyCrpQFXWl+8QleQSFTAVkwhkQ3wfwrl6Zamac7+v8X2aaADmOzuyqHD4BBXvUeb
         Lw0piMUK+ms+LEWe7tLFiwFHtoRltV3Fmy7+Ui5nJsGnQl29AEVOGaUFK9lOpYlhwJfz
         mk3A2Ex6eyvyM+39emR//5l/3+aF8cbi0G+31p5XLW+6bIqWvH35jS6UxKWaWofSw9gZ
         JB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvmC9c9Od8kxIkrFYulJb0S2KDZaX/p51V192xWKmwCpQPh8iPUwBMRh1EuVz30b4hZFQiKu9+K8/uLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd5LlGOrhDxu57dp77HTfV+DfgwuPw7WcKgA33j//p6KeDzK2L
	DCGp1j56fvzkQXmVK9tXuonIUoExUX4N85HogZn9jjs+w2vrYnEfS1ofbGlRgEzG/PEpHVxxp80
	0p0e518qdGyU2XyinA9aeuZ1qPtDFzRFRgYCoCoNbSOT5SaBGBwLGh2YI4yM7KuJQNdbCBYk=
X-Gm-Gg: AZuq6aJ9VEqDK6aQ4tI4cTBNSX/kvrSQ39dvA3jXVa0zJSpH16oltA8Ef9ObGQ2KDr7
	dM3UFuZFX1UAj3975onLKLfvDKDaxwfrGgtcTTGf2/Iij/bkBMiObIMu7SV6UI655EdmqUgkrRg
	B6T33SGSUx+Qs5DajUHNke0rC3G7sjD5qnWvMXUfZtpNr1E8sP5s81WAYD+0jI9KcIx8SM3uU+j
	lVb2h4IPGiwwfFBJTzS4WbWoMfUfGCifGprbX6OkIs6QIWuLvOa5lel7im7C4HYazWgEVdeSqAM
	XrCi3Duz0h1rMeGDF4HHCj3uoUr344QhqLisVSFpRJ83a6+bRh7ytG4U9Emedx9rTen+45Xcdv6
	sK9jy+2JZJxi7lOQz4iw=
X-Received: by 2002:a05:7022:fe04:b0:11d:f44c:afbc with SMTP id a92af1059eb24-12704074490mr568207c88.37.1770337435620;
        Thu, 05 Feb 2026 16:23:55 -0800 (PST)
X-Received: by 2002:a05:7022:fe04:b0:11d:f44c:afbc with SMTP id a92af1059eb24-12704074490mr568193c88.37.1770337435027;
        Thu, 05 Feb 2026 16:23:55 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041d9c91sm748823c88.2.2026.02.05.16.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:23:54 -0800 (PST)
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
        Samuel Holland <samuel.holland@sifive.com>,
        Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Subject: [RFC PATCH v1 02/11] RISC-V: Add Zicclsm to cpufeature and hwprobe
Date: Thu,  5 Feb 2026 18:23:40 -0600
Message-ID: <20260206002349.96740-3-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: SQuEl9PP0HWFb_0e2auwmywgqlgrOkuF
X-Proofpoint-ORIG-GUID: SQuEl9PP0HWFb_0e2auwmywgqlgrOkuF
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=6985349c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=h0uksLzaAAAA:8
 a=XYAwZIGsAAAA:8 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=vFLl6S4mlm16Le5vUt4A:9
 a=vr4QvYf-bLy2KjpDp97w:22 a=MSi_79tMYmZZG2gvAgS0:22 a=E8ToXWR_bxluHZ7gmE-Z:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfXz1zL1ZRwu4Bm
 6Q6ugV2CxUfjSo0ntbL0PUEig3pUAbcC0iFwhhjCNCuTBAAepSBy1CbBtzntJVZQOcH3edHuexx
 H/BKk+7NDPLMXBfjn8MVfQjcR6mdkGKHWIFbCZ5vLZcG++03ileF5ckdBEdKN6ofId9k5+rK+1K
 4n7mnzSYvPZLy5jEBsZWKovg2zQ05GzKZufyIelyAG8nEQNdfSE7kUdEfNkV4swxD53n7I30InP
 ApML5ny/88r2BXCYdSAgW2IP5r/focLEy3Cficj+pjM/MfLzq47Je6IEZotxHwUAMBcQ2VE/2jV
 LIId9KgpKa79PRImxty19FJUOX+HNg9yJAKJuD6f03xnM28v+FFamrRrMotOjPiGuyBrYkkVrz6
 CuON7WmqcJgQgkr1qJBFqclN9JlUdpzqjPeUBw34ZDJRft3W5MnltJHLnfVRFiieWyxc++Ux074
 Z7Z3IPdODhuUuwqOs0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162356_841178_004F0173 
X-CRM114-Status: GOOD (  15.14  )
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

From: Jesse Taube <jesse@rivosinc.com>

Zicclsm requires misaligned support for all regular load and store
instructions, both scalar and vector, but not AMOs or other
specialized forms of memory access, to main memory regions with both
the cacheability and coherence PMAs, as defined in the profiles spec.
Even though mandated, misaligned loads and stores might execute
extremely slowly. Standard software distributions should assume their
existence only for correctness, not for performance.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
[Rebased, rewrote doc text, minor commit message revisions]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 03484a2546da..0598c9ddd73f 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -289,6 +289,10 @@ The following keys are defined:
        defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
        load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
+       as defined in the RISC-V Profiles specification starting from commit
+       b1d80660 ("Updated to ratified state.")
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 4369a2338541..496694d3e182 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -110,6 +110,7 @@
 #define RISCV_ISA_EXT_ZALASR		101
 #define RISCV_ISA_EXT_ZILSD		102
 #define RISCV_ISA_EXT_ZCLSD		103
+#define RISCV_ISA_EXT_ZICCLSM		104
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index ed2621a5a47d..6a0163b54718 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -86,6 +86,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICBOP	(1ULL << 60)
 #define		RISCV_HWPROBE_EXT_ZILSD		(1ULL << 61)
 #define		RISCV_HWPROBE_EXT_ZCLSD		(1ULL << 62)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 63)
 
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index fa591aff9d33..cf27b7a2547f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -481,6 +481,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 53731ace7984..1423b447fe9a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -126,6 +126,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICBOM, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICBOP, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICBOZ, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICNTR, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICOND, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZIHINTNTL, pair->value, missing);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
