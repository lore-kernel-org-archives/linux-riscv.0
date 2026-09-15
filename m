Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F967C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 07:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0qIrKgR+eOAvR7lB+Cd4bkH7kzG85EGPKt7jgSEhRg=; b=ZP2RoBduvrltCJ
	rKAKjQY6qfzHO9CFYEK/FHIt5a1DoPLvoNRLYhm/Veb5icvTQYei0SJ+XANKjRWx1WBxmOPJM0Pkq
	gMVQdlx7PhT8SsJWjXrlsLKfy8B4CYXvEqf/CC4sUOIRIaR+ac7Tk/FVt16iWJozVgxMrpJpot5+E
	XYbXieTPGNCLyBLZOZQX5ikgawTk9+6xcZLLJWGiKKI7iSaw402tYXZN0s04cZ8rmR1HZMyxK/eiN
	TUYEOOxIVnuZCkXpDMjroIx8t3D+tvZYLaXgRwnTOE0N3R+hQ11RP0GC4dYd2Y7JZ6LtR40UZTrgH
	BKlQoLj4JQUDOPzpHXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NQW-00000005S8t-1wPQ;
	Tue, 15 Sep 2026 07:18:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NQU-00000005S7S-3W4U
	for linux-riscv@bombadil.infradead.org;
	Tue, 15 Sep 2026 07:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xlfk++XyU1ksGb867DX9M/DYidhT/J3K0XN0SWFOlDU=; b=gvCS33x1shhYQ+EFR5BBEfpcs9
	KUWc1VFBXmpALjeFXc6exOZPgx4/wsW5gr7pHeX+KMjWWAg7nvpBHMV4Xbq/0UhBarbuEieAR2zXW
	FdUvQl10L17tESmQfdbi7qXLnPUnUzEq4BJ8rwUScXgkeTRn81AcwN1fe2X1vmUzyuHEa1zAxntNv
	XZ5j6jf7mpxNLMbZfVX7JRx8ZgWmKyNVXyf7iT56+BN9s6W5ceavtS+4Gkg7KhXwG02n1DzKQqLTc
	mEaLw3LgWMwIhEjl6/EOZVkhqCOP58waPrZWZaMi6LAMzJcCCHvDb0XWhQP8w+IGkiz6wcvLfdeDT
	Y8iDPmlg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6NQN-00000006MSL-1PFy
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 07:17:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZT6A3316454
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xlfk++XyU1ksGb867DX9M/DYidhT/J3K0XN0SWFOlDU=; b=UIhqtdmhYfZGZQJA
	FBERNDICmZ+DiCoaE9/9Ba+de1bRnGJNuXWg2e80AqWSEGjWYed7uG00K43AAi3c
	f5VZ9xpVDpLt6q4bBxqCA6b6mM2rKD/rC3SY4qVqqoHU6AuSraDcAVinEykwFpSH
	PsUdmTwe+dW/tGfuInRYMtebxkJCy6ErmQwc1yX1lQlFtkOuZmwlJR1BJecyv75l
	TMAYbg2dmQP39DS9KpeeNgIGHoTlgEF05UC1HAmh1gmvio/PLtODyk95lK++O9XJ
	P5K9yzTaDX8zvpgkfGQBT4QdNNiHmBHXybD9Yx37U21U2R4yN2V+MRXZi6A/JNjo
	imPlwA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux0dje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:17:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3048382a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 00:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456669; x=1790061469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlfk++XyU1ksGb867DX9M/DYidhT/J3K0XN0SWFOlDU=;
        b=QY3I9ckcSUIoads9uOQjpycqQ9zDOot+Laj08TQd18C6kyhUuOwEmYzgT+gm7CJXNo
         HMWGHE7GZAMxeBoIb85LRq3lvRXneNtR9j2ZPRkZyFFAGkFvaZnEsuJC9O8Lk4CdFPAW
         ZLAvCofnfzpSLVanGO5DrehC1JDrYUr9kZxhHLxbBdBdqZ5aaMaS8+Ef0gQ9QxG7JJ8T
         YglMnYPXBkryApoUN2mFv3M591UGagx4ok4o7DAGPAkjA4ipWlR1rg3BsrM0vzf7Hf2L
         jDpWm2lQpSbK9KGuj0rN48Z3OjkcrykPgtQuE/NJbJxwG0ihZi2Ng7vXuhDOzmB3LJxN
         semA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456669; x=1790061469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlfk++XyU1ksGb867DX9M/DYidhT/J3K0XN0SWFOlDU=;
        b=ajYYZM2Bi9vyk6pkNrMAxxKpXV+KRirgPURXx9fZsmeuwvkXj8qEKNDWNGcpCyO4a+
         f9H1qp7J+sEJogX9IwdHVAVbT6NCJDNy4Ic1slSV9Y2u8du+t0yN2jOXsb6lV883urW0
         3Ryn0ZtIl/U45ejCkHOL7y5UcRsZvfpOANce3t+L+xDLl9Eds4JnXHNmmGtleSJVlG7s
         oGz9nqmKH5cPFEa7xOHHCwth0jnRIj94hsZs3qHa7Djc/QZydBRZw0tuuVbdzMEDMndx
         yhuJ6FuI8nnaLKurLStQteY+BGZX1N1eqNU8oHWSrBToDKogHNmlHy6z6FZp9NmMsjXL
         zy1A==
X-Forwarded-Encrypted: i=1; AKwUvBxdcz5WFy151+nMQy5vRs4LA1lXYYZEQhbQdbBzj6EoQUXsrSKiyvr4MFnQe96OEzL9KiC04PPJQuINcg==@lists.infradead.org
X-Gm-Message-State: AFuF++k7NOFxggYjhVzixMKdKzRIG0JyAZoVBWYPqrYLYqUb5le2FC5G
	B1JmoofGSZT6b6LjmzcEaBppw+L2RfRC6Q1LcFRB/kepys+soMO8uMqpmIzFgtrfICydwr866QV
	Y+qLhsqtFcma2zkDaQ0ePGGy2yb4g+hUBUG7z1xAUtHFQ3fHBoXJUl5xQf077Ivj62FESjV4=
X-Gm-Gg: AYBFou1C63Wd7M0h3udVGGEnI/Bp26hSJ8kgFhlkiyiX5dKGpwFWleP7Na8HLkMXiP3
	9PSrXxRiAVEo/bf4N653AN6TpA5IqyNFLpD/ltv7/bCl+Ftt7fITXI6eD4MY/QNGOPOFsJvGe7C
	rrwEDHGtMXRukeh/S8kImO5iE7sPcEQ7Gj/RNdJ0HDGgVkgQSkOLqIop5935a2lKoEFP7QMhkg1
	c1N+mKX0pWv0ipyHYU7XQ17UPTbADlAJc0nDRTHekFydP2yOHztebScfchmMaKCFa/nOlRrJZXj
	C1RJcvg4Luphgaq2diXd2e+jMW/FaYY85OsEMcx3YxwCsFphHeVDf2qhhvw3
X-Received: by 2002:a17:90b:3e50:b0:39e:2f2:214b with SMTP id 98e67ed59e1d1-39e02f221afmr4277502a91.16.1789456668478;
        Tue, 15 Sep 2026 00:17:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3e50:b0:39e:2f2:214b with SMTP id 98e67ed59e1d1-39e02f221afmr4277428a91.16.1789456667863;
        Tue, 15 Sep 2026 00:17:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:47 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:37 -0400
Subject: [PATCH v7 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
MIME-Version: 1.0
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-11-aa35ebd9ae96@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5107;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=hAXGf3fwKFEiB3f4/YXlhsIaiotd9AUAeVeNMwuOMCQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7YpVSuJte9Zvqye67H+4vxXO2sv8DXe11vvPKvAz
 K5jldmljlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjI9yBGhifdP94cOHHwtdIF
 NvV1l00OBU1YXDvX8duRD6KLxEN1krgZGR7811SWUZ3wqXElB7PmRZ5JE2Yy20bnNv1eNPOccrF
 8GBMA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXxrHY32YUBtWR
 mIPhrhDE+czDZ7vdrDuJVvQQbbgquFYwUcH+58Li/UFu3+H3vD6TwLDvXBipQpeAC5qGQGK46Um
 GTlR2y7J3QLe94nX1kGBuqoLUAXgMnT1ayUHiJTg6ZcV1KD15GvGIQBkx/JbDU9bAnUbx7PCOhm
 x6oV7Kz4hc7UT1NeUU5pGeUWetoKKsxPbEaXsmmPO+68fqT8vb2qePcAOvViNkzpRSVrqXKqOwB
 Hy3XOhVXEbV/C4qWCBllHab1hZuEN20rxV7RoAB6dFZc2urs3V2F1//LxiCd8rQ2HRwcxWxs4OY
 3b8cKVD3CbPw+usppQ+oK5dK9Wk7RtSFqW37ucws7VTL5prm6qJXa6JRnAVSo5MQYOdYSSei4r3
 3Fj276Oq/7v43uhYEboKi/aVmwqNuY5twzhSNbOpaf5GK7g0lHd3sdgK3HJ10zdrDQabKvVyUjZ
 xz7lLcw97Q5LqpI68eA==
X-Proofpoint-ORIG-GUID: boLq9V6oBZmMdJ1ooSMwD0QlwhA_hX6w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX4S7Bfey90KRo
 knx+/NoITs/jAUHQy13vvJuzzZStB7e03dg7R4EgMJHlbUUBS3HqOqJhKmMdpoSPVQ43M9PDOrr
 BtLgPNdTjhRATMooDZxDDj9M++xOYPQ=
X-Proofpoint-GUID: boLq9V6oBZmMdJ1ooSMwD0QlwhA_hX6w
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa8f11d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jBCMAwuHs6T3S2td1yAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_081754_558998_EA2611E4 
X-CRM114-Status: GOOD (  20.87  )
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

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: Use riscv_isa_base_available().
v6: Rebase onto riscv/for-next: define
    RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64 in the _BITULL() style of
    commit 8da45c93dfa9.
v5: No change.
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 32a14331eb9de..dc70470093b1b 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b4369..4f5d51788c416 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,7 +22,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	_BITULL(1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
 #define		RISCV_HWPROBE_IMA_C		_BITULL(1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 656cb100ac489..51a85e61088bf 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -305,14 +316,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
