Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ACBC5CFDB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 23:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVpvsPWhkp8vNlUzXyHtuYwuroHVZggy+q+6Auaxwvk=; b=KJBvUlDhXlwC39
	tUQaw528eplnuty5QFUnivmmHvRmlzTGP/e60z9SWcOkbH5LU4SA/YY5p4BkA6JcP9mGqMwLfB89l
	iWaxV6dUsKZFUQ+tAKZQCnr8oMpyCoBLzKra90dlcvKQiLIdq05nr7pCLu12hMFqDCCpnZ9EGq17d
	odOv8EDgcS42XzG1X+yRGUtXVp0yRd4sFUK/3HtjprfBrVXkoZP7nAO7fOrY1MGVoPlMZ1puIej5+
	hevs8xZRbc+DLdoLCojcyroqOvREoVNZIKerIKjq6kxUv6DagWMvkVd2/JWgu+96d0agxCCpVZ7o8
	6w95uMV0SJ+BjHD4UKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITs-0000000H9Y3-1A20;
	Wed, 12 Aug 2026 23:35:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITp-0000000H9WX-0AX5
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 23:35:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLmkE1590291
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+QKQ6AR1ad5oWQF1qcyBu89GPxfEiK2nPeWrXANXmw=; b=Lu/ecR2tRoKUnVui
	rNr4gsg3snH2hrB+t5TLDUas+iR5znPABm9uCvDcPIBw/KC/gEsdJOpw3E19Ca1t
	lcSAXqoS5RAxrPQUETNJjyCX9AxM+VQZWmfxFEyN2jMMmVyOCZrKAxApeV0mZlx7
	Tr4aNWu9JbChce0jfsfaJ6t5A91IET+f1DuLJyfmZ5XkeV80849yTkN2HOihi76q
	ge1A2mlWvgJWaMFubt2tKnSgnsncISTpYBmDJgQaO4qJ1T2sUE0eCOc5TJDnGT3x
	OawWXW6/e/Tm9CgY9OnTnqWKifNKUpIXE0DNvdM3qMIbX1NrYoNejzxmOpIldIqS
	nKBmTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk42nb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cceabd70f5so40328935ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 16:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577728; x=1787182528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+QKQ6AR1ad5oWQF1qcyBu89GPxfEiK2nPeWrXANXmw=;
        b=Ihrq4Wu/G+iwGYi99rOvQ1EsrSK5OfUlh47rhkC/FxI3Zw01A+miP0M1YL8ZGEfZu0
         TeEEAYkaND5LxOq8/duhmMACLoNW+lvdsPRSL4Z5kbf4271c75o9K+mVOmM2H2zhl9tH
         t4zsH/0trYWLjRLh+HnTg66k3GJw2DpZ/Qk1OsvjjnCNczVqoE0eseup8C8wXXMu3ldr
         KyoSUa2z3ddNUBp8jaUNqElvNkeczKDVF1HoYP5Loiv2S/V8YXRx7Ixeqzqnes01W5m+
         jstVA+btYmPAIMdIKyVLWXToAOWaNTOnhoggH7s0Rh/WW9MPoIQkymp2tgcS3XnkVgNT
         QV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577728; x=1787182528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+QKQ6AR1ad5oWQF1qcyBu89GPxfEiK2nPeWrXANXmw=;
        b=UXUD5QL2Nf2xoZ8HsI+gwFD0zeDwjNjNNYsDrLUEyIcquJCF0LptGTNjXW6crf3Byf
         F7lh2Y89sjlpzjt5o8SNNSQIc4fI+EM4/BppYv0mQXT+YSwxuboORRHImDBpPXqlmJC6
         fjsG56Lb9r/PN/9+2sNXRzGAbz98FN2YxGFpbZ3dEGYvWlIo9cJMOZXBTBvefgKZVP5y
         a+CKlLAzinUphR+ZlFS/TXVQgRqmKp+9/tbxti1aVf0Oyva1P7Zio4/RuofvzQ4mioxv
         4uSN5BdsNntZ4Fb1uSA1sHmYwxnGSxO0eogGWyJwgGSfjtiI7v2LYbU94M6aSXUEeA4w
         t/Cw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9RrVEUQFAitdfik0QRO86IDCegXPIsMFCNytK50BeMge4vKaWSXtNzMFi254IL2xobEaxV57QQjDzqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd3oVzoKJNmrDzss0lfSrUG5Zxy2Mr/r9q4LPxb4MStdXtJdV5
	jbnHlwRq7o7uQLIa3bPbG0Oky99dLo+hjThUa03U/RxzJKFTfvzMAXL6mpLsGoQpbNkXdaWB9Db
	Lmolzb3b9byRsWLLgNk8hhtgIbHQVapM4YUY201SBBG2sEUSTeKLM1gS7ncXAShAY6u1m4V4=
X-Gm-Gg: AR+sD11b6SaIMa1RjpSBi3S5UrC+mV+GhqScwNpvKQXinrXPBxx2zr0XBY3mOYd1nyu
	c4UoD6hYTdzebZlLdsUn/79QxTu8RsdtMWqb9ECYStpD+pCLyYY1Dx7I6yGYcns0Fp3hd0gOFfl
	J6XqiOehu9JlgTZUJ6UBitkXPhI7WKSjykrEv1w+9JpO2xaOcRjfvkrAHIL7Xs9ao56EmhXAX5r
	38Bpc+tbe7khOcDnZG/H5ACpPqaBRghGZbD3/r4oLEmtBJ3tb/HPdCCcOwNtZ7CvZcjHcuevvXo
	9wsJ0MlIDk7Mz4JY+1Zd5C/8RB2hBamVICSrWDZ4qIOPAca7PzDZIV2EplyMqw==
X-Received: by 2002:a17:903:1b46:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d37d884e0bmr18080805ad.10.1786577727481;
        Wed, 12 Aug 2026 16:35:27 -0700 (PDT)
X-Received: by 2002:a17:903:1b46:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d37d884e0bmr18080215ad.10.1786577727034;
        Wed, 12 Aug 2026 16:35:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:26 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:50 -0400
Subject: [PATCH v6 04/11] riscv: Add Zic64b to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-4-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5790;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=VLbBTWJCKZUIMQKhsVDcXNJs8R0yLJYIEevi+ZPuabY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpEt9euvBqx2PaN+K1ff/bWVn+W3qdO3c64/ujs1m
 XeJwiPFjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiI9T2GP7x7358L12+y0d6e
 KL3yw9Ts6gWchaYzrgXP0A5y6UpctoDhf86Bkrmu1pVW+XWeP5uyeNKDhSYr/nrwvdCp6dmRHZN
 YWQE=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: Eu5WSZ5ySDLVWrh3wN6hPyJrxR37z9oB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXybF9Rk2FEQO3
 QYOIUM6QtRW5yH8c0mFU6OSRRsNBk8TDnTXb4a+gJfGw9O39lKg7yu3xQc8aElAc1r/1uL26oGB
 KUVAAbzyldIr5PdHvAraFd2CbWMkNccWFhmUs2QEFuglSDBnnkgcBhHx0SY5OCeZ5iJXtIaXr59
 4HyKkNuPVvXVDOJNnU4DBh1cvDqHld9eBZxSBxgK7vvdeozHfLzMx+11JWiyX6Pc+yN/z05YbcZ
 mWMZmu0OkhbUzPVDGT2EOapLbgZxaeWeMT7uVvcYH8T0pNev/vOaw2qk8oFRR7u5fZlPsL5WLph
 fYC3GuFWPpAidEdvGnRhTpcrdjOgaDYQjlT/oaWiAwUOABEgu1xdefP+k23gFcnY/e/1EhiHtzS
 7C1fvfi9yo3clUPLKJGE90VgWGmrGAx//6Ye92wYWoW89s9Px6VO3snyjKaWmX/9vPNENf5nH4m
 A590NKTeD+D+FrIEusQ==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7d0340 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=HwFc7jivAAAA:8
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=fFnMLytXjIv02VNa_WYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=kr7TZk85JJIQSqC0cl8G:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX93pvEE0wlK1m
 n0/wS/Gcm5VQ+x3eLJOfNqEZ/kjeLXKnMpiPRZlyzMb0BJ3/0kn2B6+Noaphvqre6bKOC3MWx/v
 h4OSCg8KCw75FIKbWeMYBiijTSBtOgI=
X-Proofpoint-ORIG-GUID: Eu5WSZ5ySDLVWrh3wN6hPyJrxR37z9oB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163529_096811_AA17A47A 
X-CRM114-Status: GOOD (  21.10  )
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

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Rebase onto riscv/for-next: RISCV_ISA_EXT_ZIC64B renumbered 110
    to 116; RISCV_HWPROBE_EXT_ZIC64B now uses the _BITULL() style of
    commit 8da45c93dfa9.
v5:
- Collected Reviewed-by from Andrew Jones and Conor Dooley.
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc68dea397aa..32a14331eb9d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6a693210b251..b103aaeafa47 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -123,6 +123,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_ZIC64B		116
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9323feb7c3c8..9a121ee3b436 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -123,6 +123,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
 #define		RISCV_HWPROBE_EXT_B		_BITULL(6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	_BITULL(7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7f615d1a175b..de7cff5f48c3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -136,6 +136,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -529,6 +547,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 12ea4f39a838..656cb100ac48 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
