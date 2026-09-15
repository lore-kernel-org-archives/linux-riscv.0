Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F801C88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 07:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxbS8ZmijhIIRfQWUg14/fWfG077k5WyDC9oYXP1Nds=; b=iiZo80Wte+73do
	4UP8UhXOnTBuisOKkLw1GQV/lREwRNea+uCkD9SAitc95soJC6OqEbm1pw4PtYloCqJpHYUModgPS
	3nFOr7dTg0hGRnL1IRh4UxoG2NJeX+izoGQyPT/b7wSImyxPzIuwG1pISpRzzq2ozyE0lftTEZnjG
	ihjQTSQ98qmHonti4mWPS3reU6lj2PWqnU/7rDTUySK+nFtGY5UuPOYKVUGWfjKHTcPkNTwsz2RRv
	HugZp67IPXu3BK7te5jaSVScB0Khmxcu96Uzx6vUBIHY35gj+mWfzx2bIoOHFgKGqojFs+m7la5yt
	RDq9lZo9YpcIIr/uA7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NQ0-00000005RmZ-0CEj;
	Tue, 15 Sep 2026 07:17:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NPx-00000005RkX-1Nl9
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 07:17:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZJXq2892739
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLaRf5MNT6bdfuQJzz0+hxaTdxUHjMAv6d0xpyWSYCo=; b=izyFaTspFQkNFXi9
	dw0DL/rx7ZAfUbaRUECkHMm3rNOX4BlZzrNk/6RUE5fPrUmQ1WxVkxfeuFaHLMqR
	wbrzpMg0+OH0+S0gUTJyJEYpp9KwPvKg0gIOotDUn7B7vcDs0j4+EtYw5gSYERlr
	vB/ZSxokxxXP2K0ZPwTT/CmPx4U5KGwZLcXdb7Zwe0tlIRc/Ig6zVXHhZfGAklU4
	0rC1kAxsq7bVL59qteRPtXkl2RQKLe/cx4dOrLPXkfoopqVsU1NdJnjI56jCxMWG
	j/1OWL08HNumdXlIGblNANDdjgBSJ4OSLwUv8aQjPIjcCOOOgMAA9V7ahKXB3bWJ
	SWqZpg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kv8h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:17:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5361963a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456643; x=1790061443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLaRf5MNT6bdfuQJzz0+hxaTdxUHjMAv6d0xpyWSYCo=;
        b=UfXTycZ6maqFw1wVLQ3Rwxd4f54RaUU3ZCowI6rtSxWI1iexWZMs8XNy6RYqY+t1mg
         ssgsN8EJ6SalIgP9T0LUhHchuXAVSq8/Oh7/cLoiBdX5CBiITm6WcekFZ7EOXkx4JoMZ
         OoezqQBBMz3dvfBRqfL3zbujaduRSjVKpAv/Sq3CLgf5YJbQNpE2Nch6d5954ud/Vgc0
         lAYni1KKIyUaWLS4850aV2fOyEhUiXVNWIzV3dmUah7m8RyLQdBbHW9u6XEDBIA0gZS4
         pFT0UsI65m7L610t/2ScvYzv1rkls4uRgvk9le2a5wijTlzhsdNExij6kYOl43ppYb6v
         QK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456643; x=1790061443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLaRf5MNT6bdfuQJzz0+hxaTdxUHjMAv6d0xpyWSYCo=;
        b=LL4JLH3IU4r/BZIO4P/UwC8fuaIET8HxPoh8PvGfWWF6LPDtSGRpWL9XtLkBA8ym0N
         qHtMVw7Hu2oe2dznVS4Gd1bVgRXfkKOOWHL4p0/jtp8Ar1hWsbHrN4RLmSNig9t+/4Cc
         1yWmoxgPT+jIxw/xlQmUDF3XYb7/GC/Rc1awsfIVOWByfrF7nPUieyaMeRL5bydqE4P5
         zgbburWI5k56fzBKM+IQTpQGL1832cy1cn3JCUIurQB2SVRADnWQKZDWxBNNe+9qQxRe
         Btfqi9hCquX0E9piixGs3vBZK63bNtS4yXKWU3Z7JOm2aARMEoy1H690X/WgQIZy8YAh
         F64Q==
X-Forwarded-Encrypted: i=1; AKwUvBzD5zQCJiymUSAWH+kXC6uXsKqq8+SSlMG8zpbhHRameSWBFUVqCljUAHk15mBzY1ZcZlis5PIFOlKYlg==@lists.infradead.org
X-Gm-Message-State: AFuF++l16A4pKWKc7fgtcukCLMGbihVsbiT+H9QOPPi6Ult3rmtVNQ7D
	M2bpacCCHdzTK5n79mpt9QIaXYnoD/6FMOb7gyE0xRwhsahgvh55E6jViT5Sp7dPHk6RJUrINnu
	DJXecMHt+41+SbYVAzR7FfHl9kfnaeFMjCoyys9mAcYBwWINNQIsIVWQArtstxgkYOh+NpVk=
X-Gm-Gg: AYBFou0+xlV+CyZnuHnN0fTFlB0a3ruU+0x4CSI1cZFuI3LPNPBHrUGP4/SYnDTY0Kb
	mUk/FyhSvWoqrVomV9Pzy2FEKkqi9zakaQmTROsF6fd+ox/+S+E2lTq7qRQt0bFaCJZyFw8/F7x
	likeAsZ4Zss+bSmGqbdQLmlMGdtQxpm+NLwCA085cPOt2SPukXROsY2UV+J33DERZGuLtwNnC+f
	lo1m6pA3OaCSOfKhZosVdrJjJnMs5we1SIZ/wqXSx3vvkqQBf9s5eGKSVoCW2+FOPKiZXgpv7EX
	Y/coNfcmmPyEpDX4irby+0LT7ailzIxxzSVO9EpGhg0slsWCvXqvRalKo5Hm
X-Received: by 2002:a17:90b:4f45:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39debf925c1mr11925804a91.9.1789456643021;
        Tue, 15 Sep 2026 00:17:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4f45:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39debf925c1mr11925727a91.9.1789456642507;
        Tue, 15 Sep 2026 00:17:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:22 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:34 -0400
Subject: [PATCH v7 08/11] riscv: Add a getter for user PMLEN support
MIME-Version: 1.0
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-8-aa35ebd9ae96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=rqiM95uXML2sMynfTJbBvcXeaGjmecCzWZWIwJqroOo=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bOfaP34dHv5gAH59qrglKXfygfk51TXp0uM+PCl
 xc5tixMHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCR82mMDBc+l8+0+eBeGXT0
 o8WDvP1zkoPFOBbPUplaee/kt9OaLKcZGeb6PmSvmKhW+jl0w9p9hvfVNvX9YmiPDKvpvHbO7ne
 WMzcA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: wch-KJNuegN1sKd0Z7tGxwqvPzGaDT2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXzaRD7TeKFyIS
 t0sTiuzqnCVcdmbYg3fOLq8W6wRkzcMU0P9xnZIkkq9iwH0c5OKm6wFuYb/h3W4lndl7qIW0fSt
 1MTtjJwKfyoBp+6YMNqW1C8FWNoBGXWAwWI5iB7zYXUVjwcjZn+0goAb/nmiBGSSkdfuVq+tha6
 PZfxXRApVZOjxhJoyvduFU8YRWfMiUsdKGA2s/W1UhQWPtGnK3pfp8yw79A3nisY8DZ92GpwxW/
 iP9JGXtIfSUvr6mgzEaKaYPanU023HG9BEJH7RNA9SuZMGLbAQGryea0IQzkN2KfPsxsIDzkGQb
 pk/6g+pSZkeH0uYm5MVoVPAZgNaXwS31TiRbmbDBFQ+rno3GbvawlICUW+tQgh5bSxoEHegbsbj
 nWb0ZYnjw0Zbp873b8U1DcFS+qB8KiccjwfNLLBWkVVMMMdj4FlnVunVJa1oayXzHl+ovl6+v1X
 /2ymNxWde4ynRbgiNUw==
X-Proofpoint-GUID: wch-KJNuegN1sKd0Z7tGxwqvPzGaDT2-
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa8f104 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_72rIs-Kagud5g8OzcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX7xhLRC7IixwC
 vVjWs7JsmZJ3ArpKaQj/ak7EfYf+FINkqNAP44U/FuIqQH4j7voa7FRns42Kj/TBtW/ymY4D9TF
 I0yaL/9j6NM/oNB1zN6RKhlXNxQoJmg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_001725_497460_03F881A3 
X-CRM114-Status: GOOD (  14.49  )
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

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: No change.
v5: No change.
v4: No change.
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 49a386d74cd3f..da9089695ed6a 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -217,6 +217,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..5d9cb108a6232 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
