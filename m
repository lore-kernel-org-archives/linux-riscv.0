Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5441C88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtatesetIH2n/QBNPMOo9RPWVAy6C0DOgoLC56zd14c=; b=OiGaxdNlfte3MV
	Fom6mz6R00dr6UmLXsYNF74MnKa4FulEIY56OcUTm5kHLPaEwHo7RSmMUBlPoIQG0qaOhG/2synKm
	qdbvEOz7uDPksIZDN1GQ+5LCSJPA2iYg8F21rdm0lbB2+afiw+impUIIjnnLMmb4ol1mn5P1duU5L
	uMuB1RVE6LqyMBKPHLYUIJ+LhLx2oFPbin55WQLcZLT5GN3HW/h77vakUKYhaWuTMyEBmOlJzzScQ
	hsgNc/28Ah/K2+ZQHMZbHP83k9PKxo+km7LnRA5a5aducOU0Z+IfxlCGY1Dhf5eiEgHqqLUrWvy9k
	0KFrH9+PtFwlt2qbq+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NPC-00000005RNU-0Y1r;
	Tue, 15 Sep 2026 07:16:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NP9-00000005RMa-3POZ
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 07:16:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZOZN1661450
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qgmlv3XWxHqYEcDtaQStAaCiJTua/7d1HfjcjuBqWI=; b=VfUftpWXJpGHZevx
	5UfeudRRRp4y2BVM5eZc9U3nHz0ehqU78Sh1jKTgPHEW5q+rJYa/fQdS6WoQMULf
	228jVwdemQSI0HtwEmMO0WuFqWoW6lKplxl9ezpgy+GBmQnYiJuPSQSbTVGGmMW8
	0GcCCjp7yKqEHSSMNiYNKn4x4gD23uNYzUiuF8KcDLQWyfgIzpswozAnLjAMV/x6
	42hwBQ4W4vYFcM+UtAPrDWc1YvfV0vtYz7CIvXIg3fRAeezfDyU53t9hPUN95JUv
	0+/A29x44bgmraiQLwp9PTWvelYo7Rd9cEIRXZ5+R8HkkCeYxXxDVqrcAvNhe53D
	FBPN+w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergcg17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:16:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so3141140a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 00:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456594; x=1790061394; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qgmlv3XWxHqYEcDtaQStAaCiJTua/7d1HfjcjuBqWI=;
        b=CW8+RKycL7oislvmi6C3caXCjCBYj1JhQvbEuEdzC8GxywBtCAYiDqc0NBiI8rklrd
         4wtvTgAGbr6zZA2iDZkJPhkHOm5ucOSoOEHKSVQ07N6oHAvfDn8oI/MNtywvGpTvD7C6
         xzzrEU9tsQ+EZvwQxqHyLNKdzXAnEJlt+POCePbvVB76jR5YcKIgmS27uGylm6yId06g
         zTGbJPLTfRh4IXjjfsyg4WRFqtO4bavGlMQWAmW/rSIcko8MUYVgTlDrifrA8PDixQLQ
         t+1IWxSXA3PSMMzriEen+XTfGQJUGIB7apwNPQxEEcrdxZlFCFFe5QaomRpOd2u8xcex
         ONFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456594; x=1790061394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qgmlv3XWxHqYEcDtaQStAaCiJTua/7d1HfjcjuBqWI=;
        b=hP6k1Dn2deINbdatwo+jcKKUkn5HD19zwcrqvZqpTXX3IPNcQ2NnLStAt69dGC7UJj
         xUSk8k24LX+KQ3650W1Ex2vty4QWz9gJvhCWiPQO8Bdu/qF6Sb+GqxPBM7GzISEP+ReJ
         f38WXnGN0qTgdPltCH/mxCdIZNJl/SZ8ZOCcd+bIrdJhmecnzpa2R6y8uGTFuMvT7Ard
         VyKLWNvHNMoWgrtssGawlbcYuCLPQ5gYLbfTexZxTYGFkZAqil3FRBR2ShGINiV58dDx
         +LFsNaHPEardoBaXS1nomnQj3/kiFINmO0c0R7grDFRlJs4fqZhENtlyE560ThNwtA8O
         /bmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrZ9rqJwATXiw7yMqAKeBkAge1ySFb/YVhG1kHDt52ZC/mqVb+HCLyT1d4vUIQJlLhG4973EjT+uWGOg==@lists.infradead.org
X-Gm-Message-State: AFuF++kaoA+zILwuGl0BVwswBaH4iPzDIqUni5wFpUxrEKHPXUHSYJbb
	NWuDTRamvFEr/ccTXSobfmScBe+PzCQmz6QhHitnFx8mqGJgoh9JLqouRSzONDGZo9BpdAbTcuT
	qMY3ZdA/8VIjmrYb6dm/qaFBTT548QOcFbRd1q+qw9y/T7VwOL91+L01u9YQD5oSQwMoWFu4=
X-Gm-Gg: AYBFou0IbEzLg6KFpIB2W5U+4FX/39s7sJQ3Y43bw48Ms1P7/TY6tp5OCIsJHi3rNdR
	qG7h+j6E3WHaSOcWUDZhSaj7QprJQWLzMqpOFLj3NsHZ6oT9AAffk42Sraplzh9iovFOJtA1Vht
	+HvdwDugRqtBHyAlKQ9EUFYqrXvA5kOjtGpl9kKekdCcLwyKDtD57Xjg6Ib3qfm19HL0vAkD1Iy
	gsMfIpv8FcN3v2gV62ewzFTWBlnKWqfvMXz9yTJYYjmpkIZIPHYo1zqhjqSyiwgTJUJNPtHVQIS
	zyctHkNvcGdwKOkVbjraXGrX554VcgDs7Dd2LgN7B7Jk+eVm0SqzQRrFihKp
X-Received: by 2002:a17:90b:2d85:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39df2470c15mr9173020a91.6.1789456594056;
        Tue, 15 Sep 2026 00:16:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2d85:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39df2470c15mr9172925a91.6.1789456593323;
        Tue, 15 Sep 2026 00:16:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:33 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:28 -0400
Subject: [PATCH v7 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
MIME-Version: 1.0
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-2-aa35ebd9ae96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=NF3ddzUfo/3eIQKDC/wsRnOuXvG5lgOW1mkc/KT7w9Y=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVHzZ/n6Trr5fvI564+4nNYeGWkuYyO99AjSSOC9LtS
 fy32g51lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQEtzL8M71hEnLuQoO9upod
 l829vIBZyU1mC7U8ls91zHLd5GCjw8iwuozTenZW2cvGB/xhk4Ky6zR41rBdPMvi9/bcxhMVC0/
 xAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8f0d3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=JwNH_LCS6ezfG0-7a8gA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: qpLBUoDVv7JLWomaxBSQPMq9Sw6oxgZK
X-Proofpoint-ORIG-GUID: qpLBUoDVv7JLWomaxBSQPMq9Sw6oxgZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX4pteJ6W0vgiD
 ZjfYuKQwU/WH3wAJSiu9q+O+K7IyjNaB5gOlbHuV2lhsx28x62OGek+0eVUdeyODAbO39+0m3Qm
 q6On2WLTPd9aRsDATOvgH3LWlrYNlrGYFXSpgVrsI5qU3K6ZcJT8BKh1RCdrc0xGGdXiablGNNt
 3jFBUzvtzOmUNMd4cBrqgg4WzaUc6qH/HTWpdKtx9X0G+zM8qhh3TM8wfnXyyC7DaPsm+LlBIBx
 U02y46la6ca9Ni6Qg4y3NS6OSymhvGbehlyQ81mCV8uTXEYELvLrPjGTO30Re4EKK4RCp0iVhT3
 0dqlbq6UI0fdVS4UukH6y6keUUZFCcVLf8/pbZYkEzRbs0kiHJWZCZlGkI74peFSAfYqhDGudZK
 OrJTZEJo/5EsU1A8h6DHfivTI/295ka2FjW8+bo3yJC+VneK54MLmu9rse3feNvg6ngf+ZReJup
 qpvVyzkUAcIqkfK77Ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX7HNGpJLTMPG0
 mCV/0jqzHaPDtEfwcfGlzCb8vYrMeN0VLNhhKw4uWNuitk9Rw2V857bkYUl+rUKKQr19dA1OZsP
 Ak80OfGG45z4Ze4cfrCyeUZuynQbkpo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_001635_866425_4EB12C4A 
X-CRM114-Status: GOOD (  12.57  )
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
