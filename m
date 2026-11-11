Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7923A606A326
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=phgHJm50;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1tET7ov;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lc7avDXp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1lRj8Di5bwBYQWP4OX1HUxB+FmWHXbAQZL3az04i0Ks=; b=phgHJm50QP8WF8W1CNg1w6roex
	H6RsKkbwv6Suc9JsYk0Hr+Os/woHtPN3wQAh16YXKZtoD+jmSlzPDFZNU0BE6dpHlGx/dArwIl+ZQ
	CWzEIFv5lPeHHcIJAgoKPPqCHG0R0SuQ4YvPg3jDByL/pgzYzrSSx0fnY2sUb9A98aYzz2frN1vKZ
	gDJri3f3n9QjLntk/ZXFIehwVL1Hl7tY1PfL43DNKQ8IAbiPPTwvb0SMK3/t0HtvzpkX7cqmF7e12
	1/6UswwttvuIrw+485y2Q2ZhnFXtfxFCU3j2SuWTU/1ZKuLvnNtQ6J+VHwCxgDzciK+Xy2ranppml
	sriiBOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8Ba-00000006nIt-1Huq;
	Wed, 11 Nov 2026 13:16:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8BX-00000006nHu-0RDA
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 13:16:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ22l3292079
	for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 13:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EpL/UlhMli3NzA/FongzlGW8okom/Xkf+Hc
	9CuN7O6w=; b=D1tET7ovDU3+9KHBZwF0yq3+CocjlJIhV0HFEqLLCorlTioinOL
	pocuw7ofJ2j6NeJhx9mSDgFIE+p5fTRDKVXTFd7KwGeQmQMgL7ZUXmvmby/IGLX3
	OlMxwbu5Ro2i33R42TVjSAGC7FIbL90r59gh+8WJPGiqXsKa2sJTWb+VfGKnDGoY
	km0LVTdqR1NlgbyukXuv2+GzLbB6L3g7myvk9eeQbf3spYPCz21iyo+lnGaI2tay
	WL+z9hUUeNiHFD9pz7529GBDprd6DLfHvx7umW4xW2ReGKFQ6+Wwjkvn3BLlpv+Q
	bBDVvKXxQJCKn+KG8NjTBSx+HxI/sk9abxQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2mdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 13:16:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91f03ea17f4so15970946d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 05:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402977; x=1795007777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EpL/UlhMli3NzA/FongzlGW8okom/Xkf+Hc9CuN7O6w=;
        b=Lc7avDXpkpDPr9f9OzNdaUjZiNqetFMEJEkIuqYbqhgGBTyv8RxX3Kh63/nZ2OKRR/
         TgYda2+GpjF84m5Wgozbb3g5NO3xFjzrv0Z5EcSOEhF1km1mJQBC7z4u0KNNW6OJmk37
         p53iWs2e0QqVmRwuMjwdqIAvWWCKV0CE1EEuQBMtHsl5W+VXNacfZYwYMuVI8OLjwM/Y
         w8i6Lzla1QAWJPvMtx0udOwVYtNvvHPuS5DyizRYClVDR2RDjmJ+LB7CVoGr+BNFGFId
         CUEmp0uE1GD2qo1olSW+RHrIqfYITiKCVajW8Mj+pHEQltFXgcslfYYXv1+rVdvA4F2u
         vorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402977; x=1795007777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpL/UlhMli3NzA/FongzlGW8okom/Xkf+Hc9CuN7O6w=;
        b=Rb0ZsgDHSra7SVA9QIbHV7eBr69sziT68pzpiLESF6RYuSRnqh6VS5eWHeyswg1RmK
         x9un0PQ+kEca4kUCtXTPEF4lCfGL28Fd9Kk7nZl+/MYNDRXCNsdFGfsFBbaV0ybsffxX
         wPs+qM6Bc2sm+PfHSy6UQATU0PdaeaIX3pJMsjI79tl5u8dHYaU1HsjXez9z1ypsw49G
         NUiTpM5fz+nkFhKkZI73stIXpXDsFNekrscR4SAjsZrrGJZFJrae/mpiiN0evoZJqZIM
         FizjZ9fUhhusAGRc/O9OyMmEJ0UhKtiplxzczyi8hmkExZdSmhQRwReXLr0dLY7KpXfS
         Mnfw==
X-Forwarded-Encrypted: i=1; AL+hErF+UUcdrsg08UnckrWgbbpmoePKwrM0VUQn7ZErWqNM/r5CtToNwsqWOX68zYnis3lXkfG7YBZQOvsVhw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8+CwCvDuPyQtZ7cT9SBHSK+IDRq9BYFQ2hGie+7J5uy1X9ZmUu
	r9RmRASBWaOgVtUzAOCqMDKLBttusdweGSrh+b5d+lpJYDmV6fkWteM0r/semVW+pkgOkdv7GVY
	V8+p1zO3CobwmIVvn9zbxV5IoSFMbSLlDcfM/dsy9bfdlF+4z9+2cjaUM4jliBFrYGERa/80=
X-Gm-Gg: AYBFou3fvsZoP79f2PASpTEuM1c/G9lTMHqd6VocM/9WHdiePvHLKPzEuMD5pYSmFMT
	BPPH6GdJAKI8peuL5DIowkO0Xu/ry6zGKJUdENC6+8GkZ1ngq1PN1+HOGGWlOAptuYj5t8r5Hh4
	jSnP9pO7VQllN58EMqagb2WY2UL48WyzxOQuMKaOPNBa61s2zed0372thGs5DZD/TY9153+9DV6
	5+L+raJG9uwnqy59BJGBZueFmZheDU1IaFbLfXxt4JaxhEOTyUqnpItMqJNhHjdDS2Sh+GavNnD
	dHYjFMZs6D/JNr2i4iEo9bsl6Ub5wnHV9IcyblhfwEwIn5BnvgPe4GBwRSf7lLFmFSbtRwSjYie
	3uBp/9T1TxAh+IOIZXO7KC+R9G7/LfUzSctZVrNuxM/i5G1nInMNQ4x2hGHnLhqPHZ36FH1olDE
	HXFDRyKmy6URVKDjen9hRel8nxQ70ZGFfeF2Od3Jy3opkYWqlZCLbF3CGp2GYm
X-Received: by 2002:a05:620a:4107:b0:93e:c5eb:2230 with SMTP id af79cd13be357-947afd92bf7mr381829085a.33.1794402977269;
        Wed, 11 Nov 2026 05:16:17 -0800 (PST)
X-Received: by 2002:a05:620a:4107:b0:93e:c5eb:2230 with SMTP id af79cd13be357-947afd92bf7mr381824785a.33.1794402976801;
        Wed, 11 Nov 2026 05:16:16 -0800 (PST)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578eb0b1sm2399995a12.22.2026.11.11.05.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:16:15 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Armin Wolf <W_Armin@gmx.de>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH] platform/wmi: Allow wmi module to load when acpi_disabled is set
Date: Wed, 11 Nov 2026 14:16:13 +0100
Message-ID: <20261111131613.6290-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX7R33P8aZQywp
 5XGeux/0xXlyP+ZNPQ8G4SnC3kCMBG5WxNjzBVEwdMFnX8/IynUV/5v38iyfJLdbF4KcQnFzsXx
 o476h6CNjl83MheQLW2/qKI7e5pBdLRFKKbxbeXI6Z6fkZNva/QuN/Se8nKHhF/HgiYwWMa3Hvj
 Te8nASKXzJkzvOv3D9K7douuH/yO/gVj2T5NrvZfBsHil2xhz9ieaWxZb7ZkiuTU+USuU11Mv6s
 BU4Cte+WznyfhSqnx4Xz2gl2KNSpNE1aZxLmu+QZTWGGSolSxRbRSVAxHO69X1npS6EiNKgskgN
 /s6/EXRpwu4H3mhzKKpB1B1Nzkm9O51x2SMzZzJX1dJAb64BF4itTczoIbbAY12pMyjXB8TdsnD
 +kSiYo/J5V2dv+DLbdo9zBcpKANt+36xmy9rHS3xMqMu5YsOVPm9ebhexnmuV9TfB5nlEJ3Fpw3
 bTi0ABwFqCFBwi9o5hA==
X-Proofpoint-GUID: _-J75vpxJUF0sNacCf8i7Tptz-cB-efc
X-Proofpoint-ORIG-GUID: _-J75vpxJUF0sNacCf8i7Tptz-cB-efc
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af46aa2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=zogTTYgQR-khBHg7lYcA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXyJsAAmJZqOBk
 i3Ht8FRWC7mYUNaYAQkdRtbZgPD3w8bKU77mrCtluNN2C4vtkmXf5CQ2k7JNEcy0sA1LA5PNeX0
 FJvdgJOAPVTIhUGrKIJj0yDddZht0pc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_051619_156429_F1E7EAEB 
X-CRM114-Status: GOOD (  16.54  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The core wmi module provides symbols which may be used by other modules.
These other modules may still function when acpi_disabled is set, but
the current behavior of acpi_wmi_init() returning -ENODEV when it is set
causes loading these modules to fail because the wmi module these depend
on fails to load with -ENODEV.

One example of this is booting a kernel with both DT and ACPI/WMI support
on an arm64 systems with devicetree which will lead to acpi_disabled being
set. Trying to load the amdgpu module will fail in this case because it
uses symbols from the drivers/acpi/video module which in turn uses symbols
from the wmi module. Note the video module itself already contains handling
to still load when acpi_disables is set for similar reasons.

Fix this by allowing the wmi module to still load and also register
the class and bus instances since some exported functions like
wmi_driver_register() rely on these being valid.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/wmi/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 529825dcfbfe..412f2e23b01d 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1573,9 +1573,6 @@ static int __init acpi_wmi_init(void)
 {
 	int error;
 
-	if (acpi_disabled)
-		return -ENODEV;
-
 	error = class_register(&wmi_bus_class);
 	if (error)
 		return error;
@@ -1584,6 +1581,9 @@ static int __init acpi_wmi_init(void)
 	if (error)
 		goto err_unreg_class;
 
+	if (acpi_disabled)
+		return 0;
+
 	error = platform_driver_register(&acpi_wmi_driver);
 	if (error) {
 		pr_err("Error loading mapper\n");
@@ -1603,7 +1603,8 @@ static int __init acpi_wmi_init(void)
 
 static void __exit acpi_wmi_exit(void)
 {
-	platform_driver_unregister(&acpi_wmi_driver);
+	if (!acpi_disabled)
+		platform_driver_unregister(&acpi_wmi_driver);
 	bus_unregister(&wmi_bus_type);
 	class_unregister(&wmi_bus_class);
 }
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
