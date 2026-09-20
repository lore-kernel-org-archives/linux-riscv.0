Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0514CC982D8
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 07:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyxN5rqmZpvqWRSlpQPUPMMV3pMaMLYQX+wLQm90e/w=; b=RBMKEtHAwphQBQ
	IcWLHDjXMXSyljXr7NnsTB7QJLGefk+SPYFvpFcDIijm21qbMpO1v5kufTly6InlSbjH2mpg/q1MX
	jJBFLScJser+vXD5WQG22KiMFUWfhVSRBltLOgrJ+88oqhjEu6nK9QUwEiEMOjrYYlpmk5xbMlZDf
	ZqeR45LcVzVeQw4JZWo1KjVueF3qGU2YIiTtDmmeA/oKet6JE7W+fxI3xZgbZAtONuImR/Te/KzGV
	o9K8AYYxs50Wn38fsYuLdZzRS/PBUk9LcVt3aFHv+3mtuoIwl+HpFPXusbFK0XBIiJAHC9YX2YN8/
	H20uZMA4blPxtpD+fVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BpJ-0000000H10e-0CEE;
	Sun, 20 Sep 2026 07:19:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8BpG-0000000H10H-0sSI
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 07:19:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55W4N1376078
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	He+kIGk1e0kiBGfrpPN37cGZ/osNcIf8RyZ3rf3zVnI=; b=hv6f59NmZw3jCZxF
	7yeN1OYfWZz+4AZc46Bs+mwr7bAs0V3uJrUbKKwuQuzZpn5DLUsM5EaDuSGZnV0h
	D0qWLj73SFVEq0DNWnjXXVed0iDGmvnVIHGmJyG7RHmRTNp1lhzfNvIDqx4rDjCy
	oTbTPNBF2etK4FqaFwWzjmTDfimh8RoNQ6q1+7kPaThDhK0jMQsyBSnehXGp9YwN
	ZYMGpv9KaUIlhfYZJniiXEXzuif6nRKiC+gqTPNvOljKfSN0z7Z8fwJk/BcMrMr4
	TWsHgUHON6s3K9cQHXVKP/gB7Q2CM0HAoE8GpF0ITp20xFGXfL0+BQTA4XkYzaF7
	n4aXfg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqftjk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:19:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d7443e0f0bso40097245ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 00:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888740; x=1790493540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=He+kIGk1e0kiBGfrpPN37cGZ/osNcIf8RyZ3rf3zVnI=;
        b=Xm+SYRyjOEID46zoHTTR+NXF3rqPAJk7sfIwFsr+sRmaV1Pd7Aol+/Y1ZLdo84Y8Gg
         08TrO1Suie2J+tj8ZCkA4sSq8ngWBCtWpRbjsSLI6ytGu/AOBdIcTja88B0kHRbUT1bf
         5zaEnDRRxo1gvq1za9dhGA0hzeXFCWVDAcJAExY4HrAuOnLx/pwBoTnBjnNFs/0iyVNi
         LjepCnheqWrYxt1tIaITPvg4SNThdYx0D3+lzEjTBvrrB95vC+/V9j9hnfPYUciSVAO6
         8YYhHq0zJsFE4skippUxrmIu7hR5N7sPzYueeDB2kGljtUUJ8vnSxpVOWfA4Z7zaLQAl
         uFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888740; x=1790493540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=He+kIGk1e0kiBGfrpPN37cGZ/osNcIf8RyZ3rf3zVnI=;
        b=wUJf3JMtSB2aSlL7w93fvypXddYsCjb0NJmERN+A7zdigbDHWtWEoZ2e9zJif0V9OS
         TZusvrrNO8rjauyvW24hscJdwOlJBeVx17uAkWJ8Ukb1mHon469pmgnui4j7FLOYwTed
         FS7YaXNu0/fEyWwW8VSgb02AkLRrOIns9XwQBrxuYkXFPjoqaj4DeR9CSjxtnxViBMOw
         C028pGh0fpcyovR9FPX2J0XNymkkR3Yba8wDXENBFDEdR964L4bFH7KGuyYogw3aEcEs
         XGEu5ozssAhNrzXj2TbgXOFdxX+iua936P2d5iPfaiNoQ80gOX2aWgqk+2LdLoAS0Zvr
         WwVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNZL+FJbwiqiNFhxVcV1aWqarT7ino8QF5X0G08OpFwmjDD3Okc/RfxGsfzyXSAzVG+QKXC2yHBsEV/g==@lists.infradead.org
X-Gm-Message-State: AFuF++kgaGSpyxAL4nmL3rFBtUWBBg3+EMqa2Em6zrm0qQ9YgGXae1q0
	rJS5LcSa1j0EDx9TcBof965q3r9Ge9SrZQn8xqmqErECSR0LId40NfQPuhctO7WQRXMXeYF4xBE
	KqkYbkQkhqTUqM+IM40iat3vQsNl40jCwOEfVUmTlhqeRfD6iRnffOg0XS1DqFK5Jo0rNKns=
X-Gm-Gg: AYBFou3CNJw7jFp+ZhP7DpMj68/YUaCsDdVPC3X3GHWsuFoZSpyY9ySGjZPGNq8XZtw
	ROFpNR8chQV0Ea8O9k5juA6Dzao+KmjAgmxp2aoLXAbqaWGFqPkU8MphrjpB2DALAxqu/AmetNm
	tdp0KYNpIJDN6S1S0Ab1wO0g3OMUmzX2k4O1j/tOO7JpG+v1cCj3Rid7mVqToC6HqSVtbVR3JoP
	gwKGdPMZi+sFREit3i41LTTSYHe5yW0GyChfciLk/BRbgDVVAlF+WMRSgP+q8/NA0lYobtP4Sd2
	aqwTo+RgRzZJRW4V3JMdL7uBn7x9Qz4p/BLoTJHe4O4GxyeA5oXOOT1vwMw=
X-Received: by 2002:a17:902:d487:b0:2db:8019:847a with SMTP id d9443c01a7336-2ddb1adbe4bmr125951125ad.9.1789888739938;
        Sun, 20 Sep 2026 00:18:59 -0700 (PDT)
X-Received: by 2002:a17:902:d487:b0:2db:8019:847a with SMTP id d9443c01a7336-2ddb1adbe4bmr125950945ad.9.1789888739468;
        Sun, 20 Sep 2026 00:18:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:18:58 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:22 -0400
Subject: [PATCH v8 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
MIME-Version: 1.0
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-2-5f14bc5c23d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=QljQsLZgvTlldSo9Rcar9zMqwa1TqgtCUjw6CR+xk/Y=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSfsnswMllI0v9+6LmXlWvmE6DXM+inXd0k0MCvNV
 /jhl8/aUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABPReMzIMOOz1DO9x7kN/NF2
 gf2asv43/SKsF1qfm316kYiek9acRkaGx9b/f31YXLve7MaGwClsGi0nNTa59s59tUhd6+7XTRH
 lPAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX5g5W+Ur1kar1
 RD/AzTp6nnTcCaVOJ7GjA3Hu7Og67g1FDogbG/tSSzmqbo+3XcVMaB3eMGcU/vAh4FDmuCUZR/U
 LiCCdaB3pVI4Kr7+nzdHs6zCf2UQc+M98Cq19QaQNCOz58Z3KM0egt2CSM5TAwvhiv9NXzkHuyT
 RUXjAQQj31nHCg7LJWLh1AmODwx318hK0Zzbzj0afv1QfuhhmHHAVJRyGfvwX1BJV1W7Eh3Yt2l
 40RFLop7r7oBnM4qF5AW1rR1YO0U0qoTS+SnyGp4G9JB6AHoWV8q/SRY0eC2agHjkqy9ZEd7JfI
 2zIsHwrItcOcC2n9qmSzg4gZLHGLKVr5F706y9mYCN+IX3ugzAsUmDsbLhsdK1DRuQoTXMH7oXx
 6QxZfLDgDvhqrgwf4jt7GEHu81M8rdoEY6UQcMvEbeyTJvdYIJ+EGo1oWkXnZDJLSBg9KrR2Mi7
 Kxz+EYQSlNAMFzueUkw==
X-Proofpoint-GUID: bxe6kKOscSabbJXmJ8cYxCqITv7pASdH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX7r3fpkPt/NMy
 OQBUHsrqwEef7Gwx40XoIPwF2OgdeI2zfAeo2vMOMuCsK6j1HqcKtEF8jEfmUFUPPFNaqF4PCEU
 vDXprljxzaSGAVFL7LMolwiHz2P2Y3Y=
X-Proofpoint-ORIG-GUID: bxe6kKOscSabbJXmJ8cYxCqITv7pASdH
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aaf88e4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=JwNH_LCS6ezfG0-7a8gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_001902_436773_93D62092 
X-CRM114-Status: GOOD (  11.62  )
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

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Match only nodes that use riscv,isa-extensions, so nodes carrying just
the deprecated riscv,isa string are not affected.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: Collected Acked-by from Conor Dooley.
v6: Only match nodes that have riscv,isa-extensions, fixing
    dt_binding_check errors on legacy riscv,isa-only nodes (fix
    suggested by Conor, breakage reported by Rob's bot).
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 577d7ae5576b..d4cde2a7b8b2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1211,6 +1211,38 @@   - if:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+      required:
+        - riscv,isa-extensions
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
