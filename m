Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB417C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 07:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZW3+bpf6YXTXu9TaSSE1RqZDBY/d1pzeasVxUOgXyc=; b=lOk3cQCAl/ZbYl
	YSYHr+ugb7T9AyvtnIKbp/zAWne9s/OXZsGh2B/fb1YsHo5iynuw5G5s+j3dbKFbDXX3dolrcqbeU
	c5aEOh/pVNOo3TrJQsnGBK7RtW48qc2My61mlkeOzbz7/UtUuXm8eMXro41rPsMLKgE37tQ5MxwWa
	3YiBD5PXgk/Ii8uX9tTsQFZDnjqLNomk2TMNQiL4eeAPjbb89CHQ3P3WKnD3JNTmmpGTNlp9lpT1x
	fp5pbm8XHPMs6abUjgw7T8lwwM5YH/mFH7UsT4k7GIJq2hfntwM5CYfUQic1ntfqaRacd1R9tZD+5
	RFJJj2XRFCyf7M1Xg3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NPM-00000005RRo-12UX;
	Tue, 15 Sep 2026 07:16:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NPL-00000005RRI-2Jzh
	for linux-riscv@bombadil.infradead.org;
	Tue, 15 Sep 2026 07:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fTqVRfaAxudbHUUsHz0djLyzEwtkEiMK6H/EzB30hZM=; b=ZTMsYZKIRNiU0cdkHJYe3XPI4O
	s9ZOutygB/hIH5jbiAoW4mO5ntRB14TNwLZWAFKvUbNia3hRf+6q0XQy3uimwTIluRvzoZowsLyRs
	dGYgZtrdyQRYQPoI581jqwV4JgiDSTSv58v5pmSF0tS5UUIrttNeFXrkmtyu+5iLDESCvtwdDgn0B
	19pquLIeq7vnf/v5mq6T0FHuFJE2Lc4CqBG8hTIwdtmF/ly8cJmH7n2R0VER0MAIvFYg4P9vgrAc2
	Coyp6QI8bjTSWRe+MCowHag/ofMooMD1uqswzk6NMke5dMKiD301QVSdVIbEoVaRpyNvsHDbqKa1j
	XTLZYuVQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6NPI-00000006MGA-14og
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 07:16:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZeJ33126432
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTqVRfaAxudbHUUsHz0djLyzEwtkEiMK6H/EzB30hZM=; b=JG0KXhnRe0WnZHAP
	iUwfZ62ONv6ZsdeAK6dTLq1BJcen0HiH6g3V1hiQ9+VnZNF13voELp9kDi+kXwCo
	SUdeDsE6FA+vxtStPRfFq6nRNdHCo9Xd34/Z5yALRpmTjlNwNSSAFTiOixo1iu2K
	mL8zZXy8vIPJ223PNqJpEZhDQyIb/n1aPh6qWUyMNa9wxpKBPf5taHKAa5nraqB8
	jkBUqlL0xzY0FibgASXsziXaHfkUV+aZczhzYtCfP3hYHXJCjyvJbpi/q1AyEuRQ
	whQ/sMJ2ROYjmH+irENNvIV59lQMzu+weiiE8tfi4TYAukhlnw3uhChigZe37Bon
	Eaukqg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9u1uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:16:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e087a18deso455649a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456602; x=1790061402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTqVRfaAxudbHUUsHz0djLyzEwtkEiMK6H/EzB30hZM=;
        b=XBZCBPIYRZ9ffu7QT5f+EoAEdWhTVobmZbTCQ/3XigLzy5yTrkXeB487FfOu699aCB
         AvQerBdseQr+nbHCTOU9GrPWzabYzP4VQQfc+nioNWfJSDrCyyI+exNM1NhGt7ch1sNj
         dNS0IBu7smGhISpBLHrLq1IytUYXwXulibuXAnmUkv695LAdtuaYtQn2IsgyDVcrCCcy
         5b8NCM6ZqN7h+mHnoF+SH8PPiuv+xzwUbvL7zm5Zu1G2yMNx+vSkS3U8RJJbye8SgrYj
         tu1tKwrlx+Od54073mKaM0A6mw/zAwOs7ZcFn/DwB03DbJLHTAoZ4hXlC+mSmyxyfbXH
         soAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456602; x=1790061402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTqVRfaAxudbHUUsHz0djLyzEwtkEiMK6H/EzB30hZM=;
        b=F6w3WE3c8d2/KQEmnEarhPvanuzXUE8Fk4InIAGCgrftU1UohQHTffK+j/3zgKqU+g
         O32uQ/rYOaBoZ8O/yE2XTubGPMeNZk3PuZThHgmzasrIHgFfMaqOnCvkkoXrRPY+FSWI
         5LSImxxmoIzuARPdn7drp1zM4ML3Uc8FBDvifYnrJENEkoxPn+pBR4bLU2PlVlSh6JMS
         wlID/7AZ8EhCoYNguHGI94dbLIIEpFKghpcr8XvWxREc8p2llNmbguk3NBrtSBuhbSZF
         kWvn6R1M0Ph4yH8IdYooPcpql38x79NVnpimvslMcM9mWNRuKlcqPphxXy0SXufioHyG
         7gYA==
X-Forwarded-Encrypted: i=1; AKwUvBy4acE2t+esvVFR14y9BTwrxkPq9ebWHxPl7IcIAYyrjx0EK/guXiT0q6DvG2THg46I8Mgf31N+O9kmYA==@lists.infradead.org
X-Gm-Message-State: AFuF++kbihThyw0t7DxppB1bAbUQzA2x3eiU0FLq5D98KtqBgKRaqya3
	lwjIYOc1C5o6rSFNB38azS0C3YaBjnjiZ+fjnW/ljmbcKdzam0BYBjZIaNlpsLsS1T4lm7OSiPr
	YgoBKL1AdE5Bld7p95nAvNZW6u2LYVqGrFb3ap4mNcVtHbCOL+1WDQrISBwpLkVO9ix7vYhk=
X-Gm-Gg: AYBFou2rqg6aTtrOQ4Yf9choU4u963b9kXXIUr4ekJR+aH7/ws0muQ8iXTFETkCR9BG
	TJKjywYM4qelXCQXxAlaZtbLXgRFiEEY69apPS/v/p5AptwWLR+7OCWjtW/WKEvXX3G3t7AGXUo
	GAHHt9mi1E30iJDNY1KJoI2OcB6rXwjfp00xDhxoRKxYuPSG5mzwToGPpziNdT0dKWkjEPlSdyD
	h1awOjeUfmxrBT5pUMhDl3rhLeqaZbhKYRwZXk4BFAZLLL2bCFaHIp7pC+xxjHDVMBgw8D0vxp1
	9IjvvmyfUS4DCp5VRdJ2zicBpH6VzP9AO5/04VzH6Xxfn6ocHSQ/DO8jWMcH
X-Received: by 2002:a17:90b:5102:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39dec0bf7b0mr12098925a91.18.1789456601585;
        Tue, 15 Sep 2026 00:16:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5102:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39dec0bf7b0mr12098875a91.18.1789456601134;
        Tue, 15 Sep 2026 00:16:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:40 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:29 -0400
Subject: [PATCH v7 03/11] dt-bindings: riscv: Add Zic64b extension
 description
MIME-Version: 1.0
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-3-aa35ebd9ae96@oss.qualcomm.com>
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
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=ly0eko061Qlf/uDE0HQLjreuewjv2PPwW/vrF9/DA5g=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bsm35G913HBN81Wzf3a3bs1NpjtdIlcEWMnePXp
 2bxH8y+dJSyMIhxMciKKbIcPtqSvfWVT7Tvc84fMHNYmUCGMHBxCsBEVjczMtzMub34xnGn9l7W
 /zcszmg/suqdseqESdThgMxjHitq5Scx/NNguprSlHnxx8zrkRXyn5eY79dXUuDZkRtiENp39/e
 2T4wA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8f0da cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXz9bGhmmQq04c
 mGsbkIzt7wCSte3NQgGhIHAA32TP3bA5veXmZI6OnW6Q2R54c+m20XeDe5nNL3rSc2Qtf4oJBRJ
 19W7XGh0WfNyyS3O6gJY5LIa9OIbrT00xD+DXY/SvAE89lWl5Wx1r4LA4KtxM8CxwvOUyFq+AZs
 mQDxDTD2Y+q1mI+IcjqgnUVZ9PoSLPH+7EYZrt7jyv3gWORwFDjfw12Vgb9uv1JN8mVEQpd8AFy
 iinXFrE6RTSkithgdw+z8ctcq25jAyXQKJs5+UUJ+lhxTViGSE1mXfIAyiiLoFilPXy0lWFrv2H
 A1qoWX0fnfR5tJHrHxQqhwh5X0B3LpDrm8FlrZD/dhX839O+S0Aw9NDSbvoKORKpmr6saGH/LF1
 lURYlXhgmOb/5i+sM0UEzqjwO4SyuiLZpgiAruOHoJgL8r80MP3S6bzn9EWkQuplybVhADnQGem
 D5NbiAG2Q/266Lono6g==
X-Proofpoint-GUID: 3_LTU6jBiovZUZqTWjK3a3xQyKnurXBE
X-Proofpoint-ORIG-GUID: 3_LTU6jBiovZUZqTWjK3a3xQyKnurXBE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX++nsOLF+p/l7
 nq/F80WKMEPm1yIq7YWlxIHh8VCjenAulaVKcyc65QxKemgOTgGzUEgwzhg2CjNTg4nqj1cNV/v
 7DGIspD5P7ubwtJgLSp/zx8OzD4DWVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_081644_751986_00F83F31 
X-CRM114-Status: GOOD (  14.81  )
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

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64. The check
matches only nodes that use riscv,isa-extensions, so nodes carrying
just the deprecated riscv,isa string are not affected.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: Collected Acked-by from Conor Dooley.
v6: Guard the zic64b rule with required: riscv,isa-extensions so it
    cannot match nodes using only the deprecated riscv,isa string
    (same defect class as Rob's bot reported against the Zicbo*
    block-size patch).
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d4cde2a7b8b2..79491ef8f86a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -537,6 +537,12 @@   riscv,isa-extensions:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1211,6 +1217,22 @@   - if:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+      required:
+        - riscv,isa-extensions
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
