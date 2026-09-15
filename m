Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D97CC88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 07:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2EWMlqkow7yYbBODW4WFpQBlWzGCe8MlNWNzQaPpYzs=; b=clDQX8UXSzKsOs
	sldBy2mL3AailZfPYpHu5ynd3hfifKmBY53Y/n6k/e5hQnWbCfEE61e7F+x0TRq1Wv9NBxesKyJDY
	8ybn6HBeBnkmvEJ01c6WHOr7YXHzXA2cnx/Sdb3Zs7ZzB1yKfF4ON35Ets/DkEE59LrmplRiCwWlm
	T57WyXvPLPpy2fCgqMDbKGo7Kbz7Lx+64482s8qCVog3Cn8w5KF+gO9DzSGgBnyHvd6FfGsFdgCY7
	XhPUB7jSlYpK28NUPju1idbLaFnJivUqSzONebMoOm47wWWQk0pkjXh98ohuyNEYU+cWeV8myCg2z
	1omzLI0dwfxjjBqBAr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NP3-00000005RKr-3n1L;
	Tue, 15 Sep 2026 07:16:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NP1-00000005RJh-1K0h
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 07:16:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7fL2167854
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8H+zzcJemHKwC42SEXR3fCJz082yfrkBm0HUs7XWSU=; b=IBc6+HsKihcEDmd5
	ox8MGmbFbJrX8D8CBk0EN7QInqjeIzNUfqaSmKpBB0VINyiru9wAFL7JWhBWpXRp
	ptJx/fP5Zs/bCfBrIXk/pj3lhu8GJvTpqYYWtPhcjX8CQBG1ki5fXhqvVgXKnyHm
	64VhbktvYuzd4YD/7TaqJo+tmSPFjLkE5rnqOgPry4aQdlJYUVdTF2p6rRAoCsiT
	Ul0iF3vdrtSxbgsCkVEINA5AJtmcx8CQChYzaz/58/xNBzKv5Pe+rnpwAvcPmmI4
	KPMHU1QgTEpqcDSd1Jx2Io/6xb8YB0X+ykOn7302JvC7LZsHzXwX3FiujkJa6Y4b
	Lb9S7g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s8tfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:16:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so649626a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 00:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456586; x=1790061386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8H+zzcJemHKwC42SEXR3fCJz082yfrkBm0HUs7XWSU=;
        b=K0Rw23E0a+BNOdi7cCXlyD299mVXd/WiahANYy/SldStUBG/9TgOtZ1KKowRJ7hutv
         BA83gY0C/WH7wf9jI4rXhmcIAsnGx7BO0I7UN9zLjw3EQ7n2tZQf+Na1Rnb8D3GmqNAh
         Pyk8oitu0mWTyMnu1e3+TNIUQJTJphFA2ynm4PRiWFSnxMmc7PoNQS5WNTt3a4OaOgpk
         rmLXeGhP/V7Vcoi9bl0Nw60e542aVQ2P5Fxb0j+WxPn1opyk5JTbDudBhqorX7i5SKXh
         J0NwgBeqQhUwmQe51Enhq44JRdA6PYij4pYulGisdCKhpSvoN23118/uQjqwyL8bRY5p
         qLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456586; x=1790061386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8H+zzcJemHKwC42SEXR3fCJz082yfrkBm0HUs7XWSU=;
        b=JLd6eVPUtTLoypwWsc8s+o0D28sz1YbucHjKDnYcjrN+ha0f1W62WUKcBHbM/IINVp
         l3/4TKDk0ydRST2I+SoihPhjXKRNdfD8tio08U43hSAWpQzxDB6EcIo3+n6edRZBrGe6
         Xh3oU34zSBTqXzh8CZSmGxPvt2z5nA4M3vuMfQEguQtxEpP+cWEaz4PZyONOX4FnM+WR
         f1jS2YMEP4075O1bgSM6AweK2a0nl9O7fJDxPw10Ma3hve9siNGQD9gQpY4dG5Y4480d
         IrJYzPUwR8MhVtl8dY4wVUNt4LbT8xOs7ZDYrAcfqQdYpQIxBscAbZrqiz0OmYfp9o8D
         nVKA==
X-Forwarded-Encrypted: i=1; AKwUvBw2vWugxqPhgFzg7HqL7YCqGNsuutyZPq7VbzHsKKIvcIugwcbU+nGIBprUefgmKgv12lrstiMskQxobA==@lists.infradead.org
X-Gm-Message-State: AFuF++l9sQk7BfFnoqT4kuPdw06O/6SuQ17vvvRkkg+XZwHvY827ttjA
	bNNjVTjBciAy2RXBr2Eww3ybJJLgiGhgoITvIK9irE34WCpsK1JMsf6MAXdKkz6ZSJJbfG9aamF
	Zds6DEpHCDm3DMSVyPiG0VlrQXwMf3GKJGTDsb9FhGqEehiE6n6InvJhxYas36utv2IXqtc0=
X-Gm-Gg: AYBFou1r6rRnPBZ6g5Y9y/4QwMvqI1BQjr4poPsI7YRS18EFcny+uvlRU2Ey0JX7ILR
	hchfyeh94+zCAELF05dCQ8jSL+jsXliu7ZkBImRir/cVkLrwaGH50DQxFKBqnOj55vT8mVKTw8T
	heu38Oxbrkhg++NYkySrd00BDQRRkQfM+M3whPjj67sVkJauHCzv2J7yrp5Thz8E1vvDHg35uVA
	Xqr7CRvKIrHovX4JWBGpf7VpfJJup3inhUm10QbNjstao42FemBEIhJxLH4pJM/f6MRsVwxeDN3
	P4R0v1XdljFchwz3w62RpM60EWkDeR6uzPK1fghDGowOYCGfza8wuYcqkPmk
X-Received: by 2002:a17:90a:1188:b0:39d:fea0:33f3 with SMTP id 98e67ed59e1d1-39dfea036c4mr1722357a91.2.1789456585790;
        Tue, 15 Sep 2026 00:16:25 -0700 (PDT)
X-Received: by 2002:a17:90a:1188:b0:39d:fea0:33f3 with SMTP id 98e67ed59e1d1-39dfea036c4mr1722329a91.2.1789456585264;
        Tue, 15 Sep 2026 00:16:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:24 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:27 -0400
Subject: [PATCH v7 01/11] riscv: Add B to hwcap and hwprobe
MIME-Version: 1.0
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-1-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5564;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=79VdSxhAJWwAJ2I3+EjaPF/Oe48XuOikMy17edoXtOM=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVHzZ7XlB2klL+cJM5+EIBW9PrsE1vFgba1TX7HDfO/
 P5rKp9uRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEzk7UWG/1mdh2ot/6ffa7pQ
 IX+wpW6q/JQHWqtefQj8kJ53pf/BzV8M/x2LuxmOXvzzt/NV7FSLvV8mqnS2fnd4++Xo1Ab/qxv
 MhBkB
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX09/Moiw84ezo
 iLmx85JHqY74WcipL6q0YBNrEfIPzxCGAKJzhSarD865jE3un2Q64E2fnzYK1AXPH3Uya2WoGbW
 L9wJVzg8D9HBCbaKNcKEG7v9MVD2SRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX5Ai3fJINMLl4
 Sg+XDbfhTsQclZQgn23YG6Os4J/iwX5dKglEQJRTM0HU3w6dgL63ZxygnUPO/zwZuph38yY/LLn
 vsblS486IX58tqYufP4iKJY3PESF1r2ds8S+YVVYzUXfyXj9lrsLUlryAtf3lXP76f6fL/x9fdv
 7UtDGhjogBd6vBQP0aLn8VccAd3EV69pGlm7HkbSt+ZNaED+24t2/BD7cMXKm3F2+Tkptc73uF6
 PYjXzazJvpogXQpx+mqVwMKNkfyvsE4bNxWokfMyB+wz4UxHRx1XOdQCmHKBdbk0aZZDIXVNmZW
 Aj+6kc2vxLOwuxGdkd1L9EVjHpY6FDu5dLGjpSLms3l7WTRuvl8InzsxDBUYMgdfMMCdkFRxijg
 Zd4An4Eu8kyf1VRaxtH9jrN9E67fpilpN94y9XlAIE4pogwYl2mY7QZ4ni7L1XbCmhmLWCCUvHO
 4CHdaOLiZKHLGpygPOQ==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa8f0ca cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=XYAwZIGsAAAA:8 a=mioeM4dCHJ9OQqhfmfYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: JWq_4X3YmbP5a3DzUqz-Dwk2k6lOi4st
X-Proofpoint-ORIG-GUID: JWq_4X3YmbP5a3DzUqz-Dwk2k6lOi4st
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_001627_394468_FF5DA9A6 
X-CRM114-Status: GOOD (  20.79  )
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
mirroring the F/D/C/V pattern where each is reported via both hwcap
and hwprobe.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Add B to hwprobe]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: Rebase onto riscv/for-next: define RISCV_HWPROBE_EXT_B in the
    _BITULL() style of commit 8da45c93dfa9.
v5: Collected Reviewed-by from Conor Dooley.
v4: No change.
v3:
- Indent the added hwprobe.rst entry to match the normalized style.
- Rebased onto v7.1-rc6: index isa2hwcap[] via RISCV_ISA_EXT_B to match the
  macro-ization in commit 41337097f2823.
v2:
- Rebased to v7.1-rc2
- Add B to hwprobe (RISCV_HWPROBE_EXT_B at IMA_EXT_1 bit 6) and
  document it in hwprobe.rst, so userspace can probe B directly.
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwcap.h   | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 8 ++++++++
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 6 files changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 893e1a1215d23..fc68dea397aae 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -421,3 +421,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+    presence of the Zba, Zbb, and Zbs sub-extensions.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f8db798b2654b..6a693210b2519 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_B		('b' - 'a')
 #define RISCV_ISA_EXT_C		('c' - 'a')
 #define RISCV_ISA_EXT_D		('d' - 'a')
 #define RISCV_ISA_EXT_F		('f' - 'a')
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index c52bb7bbbabe9..96b7cf854e090 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,6 +21,7 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
 #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index e6a394fbe7fce..9323feb7c3c81 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	_BITULL(3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
+#define		RISCV_HWPROBE_EXT_B		_BITULL(6)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d2ec968434561..7f615d1a175b9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -471,6 +471,12 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
@@ -519,6 +525,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
@@ -1145,6 +1152,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bd6ca7d769da7..12ea4f39a8381 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -207,6 +207,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
+		EXT_KEY(isainfo->isa, B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
