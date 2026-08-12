Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673C9C5CFDB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 23:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BoUKhNkxkHmoZb74PmHZa9WhIJJGaBaqeNrdfW3yCI=; b=XHRv5qsEYqSnMu
	E6F9kK3UHkQZIx7zFuo/SJj3XJujO8O4izx3cZVcOeINEDV9Z4yO+goIOx2R7jXv2yzvm8UXkebYW
	AVxjuuF+NmZ/2c/JTZt8DA0n9Drph87EYme+BV6XN4fCsriM9bMfhfvMKrgEh+AkVg1fZi2gjSpK0
	YyEcl0N5m8nQ5In2D1A7aLDEWuBJjjJZQegzCaaIha28rUa0EZ5dgLCDpf2ogCBk3ZX5q9c7HEBcI
	59QEvWMeEjFowz7NO1GJXJzpoqNAOF0ZJndnO9kPOCo3bFIrMLJHS9VEAEMEIsDi5w+mNTEwG1Lcn
	r4r65YPEPi/NvXeiYd+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITc-0000000H9S9-0GR8;
	Wed, 12 Aug 2026 23:35:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITZ-0000000H9RY-3Xtp
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 23:35:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLegd1058799
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1LjGLBPhCkN6fNBzzMLJks+FhS/j60EJGyFCmImsGY=; b=KEe3HAd2iRmogojt
	qIG7t5EjJHoNXMfBlQfiN4Ma/G/JdIrIsfLB13rA1AGcwrxLwVIkUbovqK9CPFSR
	kO0K1rGAPRUKcfjZw8RiRN6PGXzFaXGWft0LD8VMXRNjp2g3gYtLIZENckhuegF8
	WHkxOeRMNDV9EjymqBjnBNRH7goLXoL6UJhbHEdcti1et5+clqUU9hrJaw44UrwT
	swX+wiPjdc1RdIrq1BRdUFDXvPjJqjonmjeMBivSFOsEshgbL1xbrK5IIyfbEuyd
	3T6EKxUS53QDFUim7o8Rtt79HhUHPMZlftVQaLZ53mwnB4a4S+6T+2Vjk6yOP7My
	Xb8sOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g11asg8f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee894b3d8so3417275ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 16:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577712; x=1787182512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1LjGLBPhCkN6fNBzzMLJks+FhS/j60EJGyFCmImsGY=;
        b=fC8x0L08T39aqHaDAbREaY9xtfwOnFfPrQo/Z6qXIc9CSF484uTfHWPISz1oLAGj7I
         hHA+4xX3bVmVXCyBruqFl2PA/OXtGuK0WDrvMxg4NEtbwSPh1xxAbbKRSAiUXFwJrJCT
         aiaRVVsK4/kkXG2UV/skPFmvvKrD0NsHx0OBsV0riDdRd2puVnkvMkL4mHwgCTEdq6rf
         6FCQCwFgD175MQQKVDRvvdtdgFU96UUdABbJFcerM7VuYNW9SifUgxi09r0IF9rfR/5x
         m3x9zDDERt5z+RuGEqH66BU0GPW9yGhI5o5J0+FzMe74HTM4neqgPS8SVa41Q1IzHxsQ
         n+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577712; x=1787182512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1LjGLBPhCkN6fNBzzMLJks+FhS/j60EJGyFCmImsGY=;
        b=f0at1QpzsI8UztODvEPFGFoiWWhrQ5vmDH01j5D1Mwa5T8Prex27hSyIeGAOK3xBLh
         kBc5Ox6TtE12pBhVcjtiQntXhljFYcIBMufZ0rp0pqelJQHuSyYWnzzwzHtpjgkw+APZ
         QOcGCZWh+iUmQESCrRW6gvsAGJw+SBoYzPguhFwg4LEmCjz3QRMkeAnUl2RKFHutEAqw
         fIbTdsVWEI7WLB6q9XATtFDJ3EvWas302Nx9fM10d9leLFGKId9JZogc6VZM/IEBlczm
         B+y7KMdf8VFb126QYtWpcBWpyDyI5tUX3k5+yQcrBsbXbvZbb/HxJ5q3oNoWtLCwXMhG
         WB5g==
X-Forwarded-Encrypted: i=1; AHgh+RpYj88kLZmyYqd/yGiYAXj0HzzBurYXid/md0oLOfMKpVEIpCudn1eNEIBSM8/Ujn82KrG2sLnRADR3DA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxsUKbfbsMtqD+S7mikRBnan2sIqg0qoI02Mo3ZEWcyvo/hEG3
	4Te/ynh2zM24TmYqNZ5sXKXKAJqR3wSahco5x9m3h9dlQLTOwFyJ9LloRs5O7sW0q9OqaDSUT7Z
	fCm4lR5q6D7lnA+ny4Ch12xfDFd17HNK/pZ2BAFYxTOF4AnBwS7gm5hSQcSMvWLnNJsgFgJ+EBi
	9jpBU=
X-Gm-Gg: AR+sD10lOYxhvTwqRpSUEW1vFwc/vDRVqq84HjUvxnlhtk55O+NX1Ws3k8MR3pMuyVO
	WmEy8rrUZB9A4fK+9FTs9Wv42wf56f4yjeI+WnJmZ9mVKRYvoVbGUUeNhB7XbEmBAxBZkbqyaQC
	eeywc/qeYLl+aQ/R4MbNSrfbcJ4IRafPEyfTbyPD5QQ6SjJGbLvH8NTCxB1Qn1ymatkUpx+ooe+
	4wuvq3yTJJ+b8Tn+BxZoLP/EpTbkDe6wOnVILBylCVuFkkLXDHGlZ+v15MkejEZlXvfj2lZwhvn
	5FE2fDvVp6uUIemUq/QeR/Xf8TwlfjxfrBpgwFWew2Zmna5iQzulWjByrR8PwA==
X-Received: by 2002:a17:903:2385:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d37d53f429mr18845345ad.2.1786577711582;
        Wed, 12 Aug 2026 16:35:11 -0700 (PDT)
X-Received: by 2002:a17:903:2385:b0:2d1:134:b86e with SMTP id d9443c01a7336-2d37d53f429mr18844905ad.2.1786577711165;
        Wed, 12 Aug 2026 16:35:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:10 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:48 -0400
Subject: [PATCH v6 02/11] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
MIME-Version: 1.0
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-2-c985af3256b8@oss.qualcomm.com>
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
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=pMTIzY1h407OmP6ZGR17M43SvczEQJjzPSrXyQZ3aK0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpH1uwQlz9uxSeza7rMy9PFM3dxHFy4XvwgKXPBy2
 ZwJd+ojOkpZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiirsZ/hdwLbU2Dz0960NX
 0rypGXdvxPuUKj4u+tpZHrO+jOOhRTHDP8PFEu7mwprWDAtOnj+1sm3V3QSnELbJDo25viGWegU
 tHAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=EujiaycA c=1 sm=1 tr=0 ts=6a7d0330 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=7qHV-DMWNrx828xCWhIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXyaSChKnCml5A
 c+I5z1wpnW//fMML8JhRfE+JhT24yQ+ZBdDKg4raWplaT/Yrx6EwSEdq21Hn4XBLxzpNXRGDKho
 SbVqW9R//be+fywLYLz1lZrLYwUlDPhuAby8D57MG/dL/g3aMtzCmsXYBQ1h5RW85D0eUAtcdFy
 7xDkUDjpz+Fba4QHZ3rldVRmARdfjZfFqrcYfMKbCYxoryykouiFtYgFD5kKUTuQK9UAo8YPXf6
 gcJUIG8h50/NvlvUO7JVRGs2E+sT8Uak8NUuEx7cbIUy914qOZCseZufCyuSIsrno6ss8oD0voA
 tQrLnbhz6rYcNyMNvFFWGvikqf8e/JM/6PBOnBlT6hFXwIUgD7YWp+eJiQxYPEz7vhqmM69DOWk
 8HfHMYH4hjJPiA+ifI7mHMUTySNM8+Mn1rkfJsi5zF5EJ2vvLZcNnwhzXitTgH8pf77dqtN3Bwt
 hEVggtITHkRI+4aKMRg==
X-Proofpoint-GUID: ff0bJEfThpZFIWTwYvr4TGpuIqSyxrlE
X-Proofpoint-ORIG-GUID: ff0bJEfThpZFIWTwYvr4TGpuIqSyxrlE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX9AdjqQXn2FRc
 w3U+Ceiir4MsIo/KP/vRNwX6VK8Z9hmYZ/KtqEB0Gpg96crbVw2xbkLFNc+HgWcs1OoZ35+Lj5a
 4GivBvoKr9aFy5FlgbAd99dZg/JeALg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163514_008137_F4409B75 
X-CRM114-Status: GOOD (  11.50  )
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
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
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
@@ -1211,6 +1211,38 @@ allOf:
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
