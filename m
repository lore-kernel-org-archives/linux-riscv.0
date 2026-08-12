Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DD5C5CFDB
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 23:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgY0+5PHoEPNkI9WvUIGTJSVLSu81ldR2msH8GiIg74=; b=JsMdYcZ7vpy2JP
	9BlpDG49S2UBThJKsoqrGp9nIN9XCQHff5/s96wj9dSzfdfOQJ3Wfp3CQLuS19mA050o6VPdoPpxR
	TglBVuZRf4FJuQuW/BWmLAQMI/RsINE8oFlUFTx084trvy25MsENfAElOgxYdgJ7sEJP/ZjqjB5v/
	sbBGh2iz+B6vkBJKD6X1S3sAQo5K6laji4FlpN8XdneXUE34f5FNL7pFu8UVtxIVseV4tpl2abswf
	2up9qnDHjY+kNqj5miWgD3GNRm1VwCM27GBw4stPrqudAkP42JtOg8GcZS2M70B7/gQxLbXcnOvQ8
	QETYvyMRnFcJfueRYCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITj-0000000H9UU-0kNJ;
	Wed, 12 Aug 2026 23:35:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuITg-0000000H9Th-3Yq5
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 23:35:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMh7C1375017
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=; b=QRVSFQ47/HfFj+l5
	1NZcpNhH7D+NfqSPF8QVnXbaf5oeLkC2iCGcqnpkNvYm5pXkI9msqwKdEFoZpFes
	Ieqiqj/8LByLIG1GwqMz1f/C+z0DItXQw2vicLrDlSCXPlseo8tZ0uJ8wcMsv3Zi
	VtLf5PUfW9PvmlrSdUqX6/4R1DIPyp47XdohzGLgSgI24v/r2aT+Is/hyxUJBR+i
	GeUfKVvvWJXyG9xLYmi9+THEo8L2T0tp+fv/+s+mgLr73oVH0NXxCCGG8K4839gE
	EkgPTDywrjy3ElT4GWqtVWtFzmJKv5AryJ7alo/+nmBIGcJ0DH5BPSKWIsjAkiP0
	i6OvSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nuckkvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:35:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so3573965ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 16:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577719; x=1787182519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=;
        b=CV79Gq5oaPHn+LZEAqiOYdhsCOVonTB9+jE1NP4YieK1IIlFnZRkDOPOy+ChTPmES1
         Ej6aqyq4Yjv5ItgBcLWY7Y/x6pMdHxXJvzlWCEdjU2674tDtitmi4uMjKRFD2ESHQwfz
         iVneaCyx+Oxy6OonfRQjPMbk8N63BwfP6hEutDVeIfJbMThFtoDVV8EmeC8OlzDvLkzU
         Sv0bESc8iyfSvXrO3rFPU3uZmfyLOnW39BumEA5P0j7rbJF+kOtT2zpqX7dnucve84xS
         nR0UQXqgdqXHZD7/WBYVIOe6BNLbEk8XZhzq/r6T2vobQ83hBbXrCUKqampV5HKmuGpD
         EXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577719; x=1787182519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ew7essRfW4CKu/wg5LnPI4usVo+eyUYoe/mBBDpBn4=;
        b=TYSAQIi7xTLsbA0WO94KCY91esmKnM12KkY+M4pp1yvc/2BAxIZ+KFk7gVDdrAyQeJ
         ALTycOyn/A1CRfIGXJk9iPMHmPz8MJiVJuaMQA1oU8Fupaw6gqvLQ0zBBhveeiitqKXs
         qxH5UvMLanap0ASokIV6RxsqFryPbJ6cozAHH3YJTRjPUWlAwvJ9CwGsytnTHQxAnnU8
         bU6HrjMKe3V89CBJfKKTrNlKazEtjJcDaGUCP9xNEBf26fc+CXg8Qz9gy3gGdfsHJEc3
         ZUMb4nprL1EhxN/WXxe+WOX7Q+4ssOBoAhDONhfdb8+HtFYVtVY0TnW5epkVGZDAJYgo
         LO3A==
X-Forwarded-Encrypted: i=1; AHgh+Rqu4mmP1q1zzqISHE/rMoM7fPV8yC2JrhnjBwasdAaCj/xVdeSLeOuRZTmN2KRzyZaVjOfo6ylziofWjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHZO9rPnmfaVDkMCzVd1Vr7ygN24xvMQTsHfYb7qV7gMlsGQ7L
	TA4/K67CMWN3dFUw2QI7W7NPPew504MtltLJRU8rDtHa+w53r5KWQpWq/N1Tb+1KFFgeUDTGcND
	rFvL4IGLQBe/cLG161j5DtRmAf1M1AY8xSidnd4AiEIwnMBf0GPfIghtJIF4oI/x4AwETWVM=
X-Gm-Gg: AR+sD11MpOKiDE7/HhKRfCEQRHDRKVGHSHO6SvEZqMjCohdD1dA0f3YghY+YvIxOF3i
	WhSCrRJ0KN4OulvU3H+VGB3h49hJ50XWuVbzngUL8BzokIgITXQEWhdPgrP8WmvQ0vat1Y1soQJ
	GRux6/3qepW/LBJdfxBLnNuEtodqh8IFDpASWgvruHjZ2mOj7om+p5k+Oit5x1/SNPQVckRw63v
	DZGewVNQRDaQ/HUHExzmCgJaBkRoTlup1MeLgaqbo7PgXFmz0txlaGKzqH/0q8ou2kx5Yi0kR6C
	e6JnuELiXDFanBBvj8nHvxo3ZEPnCM3MXSI3LOG6ZDCHYNf5HGZKkM2M3An/kQ==
X-Received: by 2002:a17:902:f651:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d37d581162mr19111035ad.8.1786577718837;
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d37d581162mr19110515ad.8.1786577718418;
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:18 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:49 -0400
Subject: [PATCH v6 03/11] dt-bindings: riscv: Add Zic64b extension
 description
MIME-Version: 1.0
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-3-c985af3256b8@oss.qualcomm.com>
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
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=df+eBxBrANzUqAkDxq/LIOvp8cwE4dtT4e7eHOHJASw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpGghL0lKZNWVsyfs/b09AnNXKwq7Ue3Jb5z3bP1V
 bmp1L69HaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCRVHtGhs7zvq3twu+tnrx1
 cD9TvWg1n87SC7vz+1NusSjfZ/ed2sjIcEBQY4v9Xc3WDZeKznt5ss3XPXZa67/EvvcOlyzzb9n
 t5wIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: gwDADMhghFLsYd0DducPAJpXC8RDLCkS
X-Proofpoint-ORIG-GUID: gwDADMhghFLsYd0DducPAJpXC8RDLCkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX0JUlX20r6zL2
 tSnFX6UmV5WiavGAxv0tp7LEgafYWfLN2RsIxpK0ctmq0/XgEPUOLxAO+GqNd+YJdtvA6mYrjPO
 gHi5BtLTnmQtml/Y163HSaBMXBLWQqrpbfg7DlXbiUi0R3nDpCW0NpiUcRblMS8KXPhi7BzeGIj
 E0pbSjOjbT7pipybb+KTE9JRAtCpsafsm+F/R1122ErBh5v8ZUT0sZ8bnwcb+mG+jtM5SEIcC2s
 f4pOtUoYKLaRLWBa/sd0M1JIE5uBt0YbHefvRgLSMkgSMRih0AQUfOVqcCYPkQmn/VZRdMm25fc
 GIWc9Kg1wZdkX8SsfxTyUnbqR/IsgV8q8Ol16VXMVvc78gxO9V/80HnA9EHwhhcAsvkUppTXjw/
 C3n1/JPx5jNpULv0BbW5kihZG7cDQmBJceAlVC6+KME04HX0E9m+fXeEZb+BdlJ/zTPalJyx8Ql
 l/nrM6p4QV/MkgBmOmg==
X-Authority-Analysis: v=2.4 cv=VcjH+lp9 c=1 sm=1 tr=0 ts=6a7d0337 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=B0juqsJzrbe9EOqzv1oA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX+awhP3gA4TsH
 5Z41aijh+SzaX/uxZlSdAwauUW+exdPPkZ+JjHwO+pH0oSW/WceX7bE+6dZIYjPas2PHwZt22sM
 0CYt0vxdSqpInUOOXXZWYrra8ttStS0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163521_008765_49D05651 
X-CRM114-Status: GOOD (  13.02  )
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

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
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
@@ -537,6 +537,12 @@ properties:
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
@@ -1211,6 +1217,22 @@ allOf:
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
