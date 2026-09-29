Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E168CA5FAD
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 03:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=auZKEpMwcgP0Ro+KsY1VkBTU3aYY51dj5SNHLevpHgQ=; b=Wmm5JHPSbpPXF0
	Mou1GvVqfgNw6DZGd29zMT9J4LihT0isKqxv+OZ5wo0LfikDntZcq3T6TIjmaJXbUggEUNMiOD7Gx
	wvpWgGz3t1C9XIaw5sFVS1AXjTJNHTy2++pxngouzzMu8AtsQDtyVh2t6COv8shatuvC6MAla4W4u
	Yo6aYj46k00VwlNfpFGmiFzOweW//VFcTai8rU4C8CuWm8f1Tb1pN0eTM1D9h9APPWV4lgd56dc47
	b9pdrOMgNg2tKQdUPoa57WNDnx2UXu5XfndowGiCEfbEGSd2GMOoGclUAC6hxLN8+ZlaVDidSDmff
	PSTzprir4qjRrpvQnZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOM6-00000002CAs-0Rn6;
	Tue, 29 Sep 2026 03:18:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOLs-00000002C28-3Y2Z
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 03:17:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0j37R3210769
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 03:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9ov8W6fE9gqAZsQlIuIktm/LEGd+4kh4Ula1IscwgI=; b=Sn/nVrmSAs/z35+b
	i52DBtVuzdBRekqSzu2e++XRcRt4n246q4TZ5tP2rSTkJL2T15PNxb4LNpzwgePl
	sZaS2i69xNG/uYeBAmsIVofoGMK51wRi4kHGxs/ZSjBXyM8ErgEeDduwHICQ9ofW
	PUDPU8miEzus2tOLgNsWvdGCigN6h1t+BlCnt2EKY9dns2+PX8dO/ARsuidEkAn5
	icIM0pdkearuVJ67tYifd/NlvBAxgdolZNaTuGAm7c/PxDcLzbjlg+w18Yz60yyX
	w3QIcVdRyoGq8H5EKJMv3inlpTVeJ8sooMjM2Wdz6fk9DOLdvaoaIT5BfvbGifSg
	AxS//A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4rvut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 03:17:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34344599f01so1604232eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 20:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651876; x=1791256676; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9ov8W6fE9gqAZsQlIuIktm/LEGd+4kh4Ula1IscwgI=;
        b=H+9sOHbpvLQ4h1My3zwcsXVmFoqFFpj9Bfg/WKVkZvCfZawmYOwtKJ1wZL/Pn2RE8W
         WTOB6PpmS50hbgSzxx2t7yPBVyK0TBg7EBMouTcHRMMOdQMB2VM4ySR+IpXBDTAKlF00
         Vm02B4XHZ7a4EAFk9G9bfVjikw1c1J69y6LPKWFS21FvKp5s6Y9QWzjudOIVAmcBqSi3
         fl56pNn9ljwhmrFoEO7di/m+YHjLWaWm9az3b/UWBJ2RZARjv1akmCHWZFWI6KuwN85s
         0NqabC7LzZIEOl4khz5LO8F7kGXn+O3aFgsp4G0RB3F2htBXN2yK3RGemR2848iJsQR/
         vgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651876; x=1791256676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9ov8W6fE9gqAZsQlIuIktm/LEGd+4kh4Ula1IscwgI=;
        b=kllM74qsmCjD5QDHMAIG3dYh5iYrgkO2qLHl6ps/SqJc4uO5vHCmQEe9umeSK2Rn01
         AQO5wDQ2j7b6dQzfoKRxtzg5Ns+Zn1J0jhGsY0o/AQoggcr2+/jzPhs+CXfyuUvmxskX
         55MYKPSloLQ9um4cKOEHU+1culNE78HSdTvLHlzTlpXubDXzIC6J/8lRU99f8R44RWNz
         5GfHLGRGBKim/EI9//rRBc+H5OpoCmXf4UQnyisrvCv1htFwzocI15SnC/XIPnzR8EPG
         qKlmqkeK8sAphpNtfu6xKAtcdW7H4geY9R16zZNxT11ExvLkCHD2TjNBv9lSeoFylqri
         8q0w==
X-Forwarded-Encrypted: i=1; AKwUvBxp8YnB5cN22QLoi0V7YkocwgqdBxyzumJfMoe9jlhzy6fLrdWonhIVNDBFOPjMYziw5Vv1nni98H9LAw==@lists.infradead.org
X-Gm-Message-State: AFuF++lhkTQ/MZYxXTQSDtNbC9UjSiKsTMiwXknntgo+BK9MgSntDTlf
	9geSp1kvBUpr8Tp26Pgg5x0NSEMZiMDsXqQLzlITLzrWuUaJ7MQhro76M0kgqdXfGu+XfGUX9A6
	Rsu0WStg5RjdTDZbTZs32jOYrWumAkHS5UvGF1x3/bYq5AU97bT2iRTwTDScffUILJOV0Aw==
X-Gm-Gg: AYBFou0xjuYlVD0/aC3Twg+XeByj0UQfDdrLIfpiXJdtoH/oPFwksjtfzbCDNSMBVMr
	xQvMUaBrPUxX1CNkOlUjEnsPeDoQm6hPSqhIVx1w4R6aWgNHlSDiI3CVd/BFhO1mrprI4L5BTQ1
	l/WI4bXaC5SUHU2g5bEbCsZmTOSwOXS/rEXPc1t7iK+EC496j68EIg4r2vNyMfWYxuJXKHtAmwr
	86EGXdgEs8m7KYR/E+6Jziw8Cl4NGgV8r9b3UymyrZHZZGaYgFuPmFcOqPZxmeT+O+BZLRNmL/j
	tIbXmwlnqIoePYAd+5hORuRkNZNlWOvn1hckXOAL+cVZi1Pim1nGT/10C+Cb41xQYVeW9CTICJ9
	65nBncAIDm+L2kkLxSZO7AM+eo1E6cYZQxzMq0LdwihkUm4cTh8CTzXoAalc=
X-Received: by 2002:a05:7022:28d:10b0:149:8354:ba29 with SMTP id a92af1059eb24-1498354f52bmr5383827c88.8.1790651875694;
        Mon, 28 Sep 2026 20:17:55 -0700 (PDT)
X-Received: by 2002:a05:7022:28d:10b0:149:8354:ba29 with SMTP id a92af1059eb24-1498354f52bmr5383798c88.8.1790651875144;
        Mon, 28 Sep 2026 20:17:55 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:53 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:59 -0700
Subject: [PATCH RFC 08/10] firmware: riscv: rpmi-tee: cache TEE
 capabilities
MIME-Version: 1.0
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-8-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX+vFaZ+aOYt0J
 fv3GI/yTRukCd2/g4FOjfadzAUGvhjMBIIbFBdvjHIRjtvJv1LTkQqs+i8alzcfuUq7nmQv19Fn
 2dJMbNTAo81NgboUgBjf90eDaj8sl0E=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb2de4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ViJ-rRY3MSY-B2NivjAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX5z5jVKXtEbV0
 V1r33LS8HkCwQBOLfuZ+vi2wQgTZ31g3pdXHh0OOOIf2HH8Y8jaP1/YMK6FQC/6a9pUUmAGtiNE
 M5K3x7l3HdE6UPmFRDlumxEnnkZ5Ekzu42FG4iRVVUihxYKBtKS+OwD47A/CEcPjinTm+tTwpqN
 vweom6fJ/Kb9HjPrn/MIYNxH02Ez1wpi9FtiGw0R3RT5D435QFdY0f13XR6u2hGlth4nBeBnBZr
 TWYSUXw5jBS199NOSWFllN8v/O6r0/6dENlWfS+z2rdoS7eTIR4Bc4PxH4sfyHgT2D95VnCC7rD
 2YNTI+LOJY4yU6fBZiafVmANVnkZP5OvFt2cpIXqPW3nGfAAKoGV04iVr0fo13lMuulycQdfzww
 gLfH6iejVT13jzkCcvGa0Y/BNz5iQ1arIPgPUbXsixD0/TpvUUdVXQObDiBk827i5PdcthSKZ3K
 7z/e8iShA4Hta+0DPoA==
X-Proofpoint-GUID: WoYSOVUWCOLVeR1AKfCpnxsL1V2lrRya
X-Proofpoint-ORIG-GUID: WoYSOVUWCOLVeR1AKfCpnxsL1V2lrRya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_201758_148651_E64348F5 
X-CRM114-Status: GOOD (  14.42  )
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

Query TEE features during discovery and cache memory, multisegment,
and signal-bus capabilities in the transport.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index db3dbab53078..7b06c1f96ba8 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -25,8 +25,16 @@
 #define RPMI_TEE_SRV_PROBE_SYSTEM	0x03
 #define RPMI_TEE_SRV_CALL		0x13
 
+#define RPMI_TEE_FEATURE_MEMORY_LEND		2
+#define RPMI_TEE_FEATURE_MEMORY_SHARE		3
+#define RPMI_TEE_FEATURE_SIGNAL_BUS		4
+#define RPMI_TEE_FEATURE_MULTISEGMENT_OPS	5
 #define RPMI_TEE_FEATURE_SYSINFO_FORMAT	6
 
+#define RPMI_TEE_MEMORY_FEATURE_UNSUPPORTED		0
+#define RPMI_TEE_MEMORY_FEATURE_TEE_ONLY		1
+#define RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED	2
+
 #define RPMI_TEE_SYSTEM_WHOLE		0
 #define RPMI_TEE_SYSTEM_SELF		3
 
@@ -581,6 +589,7 @@ static int rpmi_tee_setup_endpoints(struct rpmi_tee_transport *priv)
 static int rpmi_tee_transport_probe(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv;
+	u32 value;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -604,6 +613,37 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 		goto out_failed;
 	}
 
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_SYSINFO_FORMAT,
+				      &value);
+	if (ret)
+		goto out_failed;
+	if (!(value & RPMI_TEE_SYSINFO_FORMAT_TABLE)) {
+		ret = -EOPNOTSUPP;
+		goto out_failed;
+	}
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MEMORY_LEND,
+				      &value);
+	if (ret)
+		goto out_failed;
+	priv->mem.lend_ok = value == RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MEMORY_SHARE,
+				      &value);
+	if (ret)
+		goto out_failed;
+	priv->mem.share_ok = value == RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MULTISEGMENT_OPS,
+				      &priv->mem.multisegment_max);
+	if (ret)
+		goto out_failed;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_SIGNAL_BUS,
+				      &priv->notif.feature);
+	if (ret)
+		goto out_failed;
+
 	ret = rpmi_tee_setup_endpoints(priv);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret,

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
