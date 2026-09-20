Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D787CC982D0
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLvAMKCzBQGBE6Xk+uFToXslqal6EjOYFkjyGF5XhZE=; b=NGe/Lj1q619n7t
	PFfH6WKqFEr4pF/iP49GOAfvQk0jqYkJJZxWUsRe/HpWZm+boUUcpRH8cp0SPnHt8hRBurX7RnV4r
	xydtg88tIttBPi+C9rn6ZCX6jCrKcndO0xLtjUDJxriDn6EoaArAxmLftgLJkvo1BdnWZhV4EIFeo
	oOyttieaEPHnBFs3vAEw5bPPBr2zni8hZ24mmuKssohBcqxFVphm02ZVRxOE3K/WRkn4rHrB0gEkZ
	+KM/0ReIuwtohfEE1K0mU8ZbLus9fW0QNdAZLIG7kT5X9xk1blaJiPTspr7ppSThEn+q0zrOlSEEZ
	GOfQtDpWlQPQ3gI6KnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BpQ-0000000H12K-0gQk;
	Sun, 20 Sep 2026 07:19:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BpO-0000000H11Y-01Ek
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 07:19:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55JQi2096837
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=; b=NsswISVRApcxNnWd
	q9I7ebIEijYBgNSzK53NvxYK6vfDmnBchXTGFnd87W43g4i/ZCnmvh8ERfITtzrC
	Q4yrhbhZvaz2cc+4afmKS3BoDvSsKa4X0n13/qMnrPluqkmcP/5V9QXQadq/AJIr
	/MukywDiwsY7CYzgQN8fReDdaE+PFwMkYDsZZlpShm1LQpJHhNs8XWVDZFZ8LIrn
	G/eMZJYlavH2jybYjYA5rSMgWF24ZBpEVDnm+FlLaJ2zRx7bI1lFmbkMw26zzhEV
	8aqB+7otClsf3bOiAkhIIqRAeH1JR/QBiD1weknie4Ekou1ovUtNuF55PHwuUDdx
	7CBebQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxthm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:19:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so1957996a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 00:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888748; x=1790493548; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=;
        b=PvhqQApkd6+XqJFo6mu3UxdmPIvtGaQTu1gAUqqnuzWGwkG/D21c9VFhx0bGCymNdb
         Y8Tg0+2f8OI87q5CgvqvAa8qY5Qdph8KxbP29hlj3WDSlePIjykDNw/haENv3EDPHABp
         SsO+4ylp4gZ/zpgmRV8MOfgo0N98Frtq+Qx9P21NI1/p28lp9pLtUtPciE6hd+jmZYaC
         2QffZgHDCcBpxrjcrRQHNMoS50EuFF9ac9UCE0G0FLAgMoAa5Q+iEtLm/F7e6RY/kBct
         6lIyXVPFKJNP4O4nqVIKAt4KulA93I5UJUApfAntEH9JSCQsRSldC+2bim3MJ+s1uwAL
         /NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888748; x=1790493548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bC+2yuEEK8/OFJUbDMNad6VAaCQB5BaPqGUNGwsKKRc=;
        b=KhHmkQTO+KBhfgxwuUE+v55nD4VL0gt8c7kJRg5k8j6pRq+RGudieXCHFxqXmvjTlz
         zSYMgZdCaztIgRrF6vZPxus5EHXfiuGktmvS6ZJa7AAWHLX7FFvyaEJlJVzNSMX4jAcU
         gXubrB8f5M6qpMZuJEqJmj1KS/P+S594hwkWZIjfrvq0UEpM1pv56ZJs0LguSrSoSA9M
         1ju81jMc17na//uUdO4aRQAFKSg6jsJlVO+hVozs4m7VGs2ZwHGJZ0UVDK4SFtZJKwWI
         XqvmHpOgBWe549RtItOaMkCpoODEbZcTSeeFJaPgytmAqJsJFXaQog/5wAMoCHVhzzuK
         gAtA==
X-Forwarded-Encrypted: i=1; AKwUvBytcVzzupLDayYp8QWzF3QRKQiUhq25/5szKqXp6O8gJLH+fU46fOW3VR9BSNTtCQGhbxWcaJOAklPSdQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kzNmj7OH+nAH7J+6dAymX+Peye2Jr2MINHelzS1JA8WLDAq53q
	ftT1EBk7ayF0uysZ8+Xqr56UUSHCIX6ScetrErxJN93UqJsRWwzeynUlEJ+rwh5rBhGWfLa00uS
	rPVyJXHaCK1ia1jpcYEQdNHPU2bL1ecM0p4h7jDLMrP7x4LJsMbQjyDRHVGivdk0RUL49Xcg=
X-Gm-Gg: AYBFou3dSl+E0ZWp8a9k+aOrTKUQRsyY4J+EO06d0CExg7nwO+iqThl7HVTdYWRZHll
	us+bBaqhgNSJfBxk/mTt1JVqosFIv1Rb7ioIJC42JBPVPMnuHS6YUWkRLxnL+fe/Qxy9f0dlSeZ
	4MZUKYKgapK4XDYkG7iafs4Ps+8JAcTf3HpRR0wlMJVoqhq3Os54bGhymTAFntuUwUxNoTw+2Bu
	c4iYzZ7a+05EYSOKRKuJ5vO0MpEb7TH1/c7pr6x/9RgHWp6PVBT2Vrh1KpPhwKIxD+pqrNBrseS
	ix2YSBEw9O3jV5yyJinI0lflZ2/siiKGRixkvFx7lFFUBhdsLvZXBekhax4=
X-Received: by 2002:a17:902:db0f:b0:2dd:b52d:e83e with SMTP id d9443c01a7336-2ddb52debe3mr111653705ad.19.1789888747505;
        Sun, 20 Sep 2026 00:19:07 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:2dd:b52d:e83e with SMTP id d9443c01a7336-2ddb52debe3mr111653405ad.19.1789888747065;
        Sun, 20 Sep 2026 00:19:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:06 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:23 -0400
Subject: [PATCH v8 03/11] dt-bindings: riscv: Add Zic64b extension
 description
MIME-Version: 1.0
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-3-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2839;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=YtizxNhzSjBCt9sQnYHFkLSFuB+kE8v57Hh6K2S5Rxg=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSeumV0wYZYK+vLtRbLJ6lylrDY+nTvdCdoiixkD1
 2Stu8fdUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABN51srIMCsoe/lpzy/vhKV/
 S/9pkJ3Hkm6TZL9H7rLShfSXAZXnHRkZpk2ZoRiwsild9cBTqV0XDt58dW+J2Rrfme+LpTJ+MRx
 M5QIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aaf88ec cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX8cMsxiofXbCo
 4MXZyfMGEFzEUwyKU6gq0FDW+EXuuV3xu/j9DQHoyA9bJJVASvzjCARusSRAZwQvyq75W3iSEyl
 sD2NCilSfG3D5PwduHFXt896aqd+MRM=
X-Proofpoint-GUID: JAAWLNrgsxZggBPjkoLuWVdmKKEcwda-
X-Proofpoint-ORIG-GUID: JAAWLNrgsxZggBPjkoLuWVdmKKEcwda-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXyECFlB3QXQGB
 43y/wdGiVpTzdCF7nLcZNTj+qHZpQBptBirx8MkDm0LxGkpvDSXJiOG3b0nFnoLuEjgdjKyOA4X
 qIwqf34b3pNFW0fxB0/tDno3mhTWN9spARNvOm1QDreES32SBIk921WaVFuDCdSm6BHZvG/83ye
 2oKsXJKazPFY9qk3gUT+l0+nKkLkLEuqBK5p9a1/jw4bpUhDo2z6Mr1vcFfSX3BeqEQTG8SPhD4
 +h2rHXqw5hMyyTgsE4OUN/2O+QO+QIijDSXqJsCEvSwPaVyxKdgQ/fxYAiphR8anPg5517gA6VD
 OrK2FkSHSimeV1dVRrZvSOCC8MC8D+LCFnSGbneUFaTydVIi8C/0gV17BJEUv2UB+zjpIwIx+3q
 BdKxr0jfL/z9SNn6/DCW64q0kLypkhop0n8jiZ3BisHs2R9dTrhDEM7We2ofO9mXYlcN/2rSSiJ
 cKipuwLz2mPQUV/WSww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_001910_166282_FE640142 
X-CRM114-Status: GOOD (  13.78  )
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
v8: No change.
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
