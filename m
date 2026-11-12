Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D94606A883
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WTq4h3l/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIT2BLD6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHubkwtA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7wkGmEO+XDUJ1JNQqwrgZLpQkIraVuHMGav0ieNVt7k=; b=WTq4h3l/skxswFhl83HbLwRV1t
	CQIq19AQpya7/7QsYnQIJYwIpCy3xzDL4wHf8Mf6QnNH+Bn59gANhYm8BidQ1IQTJuSEwAxQ7Xrg2
	/SAaTfl4uR2qBWh5j4q6IVcggimahTSjqcUmKMvhi+ggJCqfb20pHQEAl6kVhLPqKorlUsCHh8GyR
	R1zqZBmNbtYcG+MSMyN/XIEkkhYaWpKQKaxGqL3Azbr4lMsRul49peWd2pgyYRJYlcskpk/culenn
	cjNYJbpJu3ZDanrVhBpAJF9RnCvs7Q8M6ZbHHqSkC+Y7cmYh3CGOE9oKn0+Twg1y4g4w06bTsZNvK
	YWpap7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVAt-0000000A8pO-2ODy;
	Thu, 12 Nov 2026 13:49:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVAr-0000000A8nq-1Fk1
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 13:49:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfOw21954166
	for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 13:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UWCRboaEh8ibRoIvLn+DX1286L/MuxfRB55
	9M1PwhJ8=; b=TIT2BLD6/nm6h/H0lPjW5FUasIWvkTvrnJDKH1DhjdvMF76yo4r
	WKLJMR0Bknd00v1QUidurARJxQDfCROsoMZmBof/DJLiv2W0R9ziL2Lj4ZtrPWjA
	87QrQ4NU+MtQlYF4SYmhXk4AToPCwXmsBeneUkD09FdxY7BntaMkIfClsGN4jMiR
	+W3dk1rAeUzeqPxvvTAP9mTHRcPmguHeKZyTHqkY262ZNUGSLCmpGuncsyQ7CHIi
	Z07/jneBEEG3b3HbnPMGKhVreAiaspULP73DCpGpl2NoaupPBeruberuRfooTwld
	SNCXn0+04mMdkA+WD4KOYLwI5SLN3FIsvBw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx30m3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 13:49:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91f12cc95a0so21140976d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 05:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491347; x=1795096147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWCRboaEh8ibRoIvLn+DX1286L/MuxfRB559M1PwhJ8=;
        b=eHubkwtAwUtnaY3wTsy4S8ltzKaUdPyXMsQzJfCJ48VGIGOGH3t4JnvZn9mnIgPhUa
         3tYpqhBoachcDghXCt3RJp0UGaTAcaGGmGYtlpVA0fatfXl/shDCyK0OtVHPI9JCIWDU
         ABJkH7SZf4RL2kdDWogbUhApJH/fO9CdBoacxhdNQ/EPX9jSeDGsNQwrZtmsVpGj0Gqn
         S2dux5C2oX/DHO9Vq1B/drhbqQm0Jk8uGULSaVt0GU1kYkpw/3f3PUCGKC0fx/VWGpBb
         dJnZSDgxMrO16jbJJmCX6aIaR93+03iNaUTx68Ie+aDhbi7eN83J9dk7L1VGKE/z4fl1
         Mv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491347; x=1795096147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWCRboaEh8ibRoIvLn+DX1286L/MuxfRB559M1PwhJ8=;
        b=1ZtJ/7KOffm42XLixoVi605Yc549ETf0wXlPL3yWaFH9nYDbSdErqX9b9gI+YdsWHb
         MpwPGqW01n/Yf548EEKx4AESSTYSODuHz41ga8tMjRI2uKooVglOkCBfqZEOCPrLutRW
         3ptNUHGfT1bFaoqX7lEugtTY8bY/ycaS4IzKAJ7m8GV3cxQbFS4AjYR7VYydNUd3IdAb
         nxoO0Ofe8N9TFfOOucHXfUv+QrKaLF1p58psPWd51dfK7Cyl24bA708RShekfQBUVAxs
         3Lxjuk+CkuXoZi031q4JlNvTAKhFgYpIERT+wMzKSwYqjARlANADXT+e4v6PXe8Bbb6f
         8xIw==
X-Forwarded-Encrypted: i=1; AL+hErHjBsBY3hJB6wt+RnLFTJwtHDgrWzcicLfbI/QM9lupKiz1etisgLnZyoYwDhBk5YVfC9B6So2rT3R6Bw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/EYSuvfOS1rvOro50FocjYyNF9hzLzOrWVSvCmFRJx0b4l0kcg
	ZXHM1XiS0SHiVM/i12SKxd/d9vWFasSR54RFEY7Rok0eJszsBA0znwhkz7u+ZTpJ58UAjnODHWF
	6EZurtpk8Vc/iPR2MKM4rNT4MyQQuwqVvXWZaZK5Y4/kXqiUqKB1prx1eAMtYWFIZNaszwdw=
X-Gm-Gg: AYBFou3vvez5GgtHkig3X/pektZCE1gckdKUeMbtl2mEgeDe5fMQym2naejHU25I1N4
	XXKeFCTRBpdbiHMcZHWv3JGoX7mAZtFuCfSH7jKVJuxnwmhb/EV0zdBEveJAx6qzg2hRAF+y5uK
	Y4h94uloMmd58MCmkJB91VVzIcWOh0aLJ/wyjZUtQHKCRSeJWsWKiMXZuVA7UETp6bVrL/klJe1
	qsvk1Ioy34qIzmob2sN5S0JGCvxl6w+ngCDpDmskX8qbAXfd/ylvN3rnaOl3tLm3I3nVqpOBncE
	Rt25qP62LFLcinhJOyMka8e4OScit4txsDVKAuNo2t3QqU1nmqWxRTcRMmJkjJedR38kWHrDiit
	mv+xOzAOzVz5AvDiNMU27abw4fuR/h4amVvzAgLctaXG6gzhcfBuc3XF6CeFA2vxIywSfQT/PnT
	4T3Vee3GSOxNAWLPd8d28cGj6qHqvmrJl2KtjgyKrxE3Gtz6ZAlE331TH11jaE
X-Received: by 2002:a05:620a:390b:b0:93f:3646:7a53 with SMTP id af79cd13be357-947b008b8d5mr977309985a.83.1794491347526;
        Thu, 12 Nov 2026 05:49:07 -0800 (PST)
X-Received: by 2002:a05:620a:390b:b0:93f:3646:7a53 with SMTP id af79cd13be357-947b008b8d5mr977306285a.83.1794491346974;
        Thu, 12 Nov 2026 05:49:06 -0800 (PST)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a643f12sm352641666b.62.2026.11.12.05.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:49:06 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Armin Wolf <W_Armin@gmx.de>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v2] platform/wmi: Allow wmi module to load when acpi_disabled is set
Date: Thu, 12 Nov 2026 14:49:05 +0100
Message-ID: <20261112134905.6100-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5c3d4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=zogTTYgQR-khBHg7lYcA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX7lQKqDgj0sHr
 4gMqj1XpzP7ZyP+9IllyVAz9NEYQCVuBHIJVq06P3lYFCMaRW7jaTZ7teIF3GXScPcm8MV0LfKy
 rhF8pGhUCTpbiQWafOjk6Vrnpi/hHuH+YHiTkElzLqDD6i+W8RoVWcidCkBbWdgXgMpM5YDokyZ
 +SlkNpw+PnMeKjsk+xzUfyCIUO+/+rdJqYW/jgL7BmAygbox1LRMjLT3eOilqbdtmSberAIWiFS
 qK0T8n2zEa4DPYgoGIjBUuGh1MaN7EhmzsQM4huHnfS4h9bG1lxxQxN+pZXViVCVNrHwgNboUrH
 Uhug+8wujnfaSM/vPPEi1I/qZPSPRDY8IUufxuwTwc3+2xcV7dBlmxxKuQBnOaEOWih/NBMFPLA
 Daynq7VBcaroWGazsHw7O549xeYzYpbnToQJzHV14dfR/riajpdABeHzdsiqyc5nXvwPLqqp2q8
 U9f4NLA9LLyTN5CSR/g==
X-Proofpoint-ORIG-GUID: TGNiZ_QM_0l4fKj23nHtofuNBc26JIjc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX28dHpP76pRae
 aPbDJ6R0X1nl+KpyuaQiQZbHgRtTRoI5n2GxOgcgDBN12uG/ubFDbPZ+p4Q2/pcOCK8fZImvWyq
 9ELKyya/CenDtF+I+zNn4Dfci8O1+Es=
X-Proofpoint-GUID: TGNiZ_QM_0l4fKj23nHtofuNBc26JIjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_054910_053887_AAADBCFB 
X-CRM114-Status: GOOD (  17.28  )
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

Fixes: e2c1b56f3dfa ("platform/x86: wmi: Move WMI core code into a separate directory")
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Add Reviewed-by + Fixes tags
---
 drivers/platform/wmi/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index a99da9b7039d..ec1a51f08e02 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1598,9 +1598,6 @@ static int __init acpi_wmi_init(void)
 {
 	int error;
 
-	if (acpi_disabled)
-		return -ENODEV;
-
 	error = class_register(&wmi_bus_class);
 	if (error)
 		return error;
@@ -1609,6 +1606,9 @@ static int __init acpi_wmi_init(void)
 	if (error)
 		goto err_unreg_class;
 
+	if (acpi_disabled)
+		return 0;
+
 	error = platform_driver_register(&acpi_wmi_driver);
 	if (error) {
 		pr_err("Error loading mapper\n");
@@ -1628,7 +1628,8 @@ static int __init acpi_wmi_init(void)
 
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
