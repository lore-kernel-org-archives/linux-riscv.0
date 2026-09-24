Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D31C98310
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 07:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ysAAT1DO1L7ytpljHnSJdVJ2P+S1Wi2LIUuRkoCOv8=; b=uJBfj9VE7+Grpy
	TN2AaLkforehZxacNxzYPNyRVgEcPqIaEZ5cOTQfkvz7UYbZnXNGJh+1V9AllCe5vd6UxJ2qJiK7I
	psQKMiiCBIXO/GELmRU8Y5fR8EA0CJbP+HEarw24wNMXbuKTilvBxSo1WqMvpeAgawclFSlzLuJ3+
	L3UiYe1NJwcd/2HhApP9cgvTezg4iqUq4ujOCIbW2CAKlNyFIUOBwJh4aV/8nbNdCw9SDn4RC05iw
	PdsuGPCennQueIUK2orQWIijprdfZKwPKbnbI9q1sD56ubObu4txL9r7aTMG3SoEGTV8GQ/SNRhlg
	acsCVBvVECggU6J7F9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e2L-0000000AJRp-3Gpd;
	Thu, 24 Sep 2026 07:38:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1g-0000000AJHv-0DqU
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 07:37:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O62MG21475890
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mknxxgoL3HW6ZUvafxGrZ8mdSHeN5aHUem6OHhh1IYY=; b=nUwXmaQA9SMdg14Q
	CXyYKtbH9a8HcwYYPNRPLL6vT2m1D8krKkkSA4YBkS2eP0MV8JkK9O5m11/XUA89
	tLX88fNfcSsuulD+yOq4DqZJWoqcNrCA7VDBIYFoHXNMIi9bpEHMYRvs/nQ5ulqh
	/IuKUrkYPPbOxBzCj05KTR/PGz/xFO14YZBpeT9dBWEbUj9IhD0d0IYfG6Gkxeg0
	HrtSVptcKdJM1q4ISr5ViAY/oscqbogbcyKNX3hqV7t1H8DOuYjlggAMVIxhsDsy
	xyk3BmtvLVUFZKDxRwGgD3K1/c1PJdIxfXQzbPXlq/G1J1+1fke6GR0E5kr5O4Jc
	CXltPA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8agcas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33bee712354so2330647eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235471; x=1790840271; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mknxxgoL3HW6ZUvafxGrZ8mdSHeN5aHUem6OHhh1IYY=;
        b=P31Ustpbn17JhzQz3wSnF4maBP43F9e0rIV/takduoQYRQFL59GV7oyDiKKqS74ujc
         Ots8pk2rVfhE7xfMy9PP6SiaXt1vwpTrX62LgM8gnyJ7NZTBh4RdsmHtUsmtG4naHxQC
         rmQPRAAgtkDU5NEq+T+5ESIXqItj16HGBVGYaa08MlEuczYXL/aj1lSChgWuFKgiJU6K
         G/ZQY+9Xm/znwRbziGK7fmeFso0+cXyp/k+nfWeBkY1QJO893QiBxATiFDljSahzk/MM
         Twa7ErkRISgXjsMJLyWogwxlmtX8kEpTGppV3ZdTtypvHj4Pmt+ZCdWowHQjoT4czgM3
         J3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235471; x=1790840271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mknxxgoL3HW6ZUvafxGrZ8mdSHeN5aHUem6OHhh1IYY=;
        b=Oy4totgwWE2I+438klVcJVe9Y+nje6s5ncfWpytVrGC6ZA/j4izBoqOKIeWZuCC1tO
         VB1pe1pnudXHS2+8lsPUnQO5LOxAymBLTjXZ81QsJAHCKC/oSgoRjuSAGSDu8tUiAjZG
         QHTaMCCAbv0hmtg2yZoMxh51fiH/5y7BjhB17/chJeO/dn/KbtalUsfWDRDQqO0sFca3
         oEWIEEk5bVwbYWTgR+2i7fpYnTw53dI8ZvIln4TSc3sZo1WV/ggq+4qCjGB7vNyY2RlA
         yK/NHa44Ep4c7m/CUCz+iQZ8DooTl2ftc8Gs4a/6f/1hcVP5hGoiiKKaU0FkTN1E8SKD
         JhHQ==
X-Gm-Message-State: AFuF++m8fW+gQ2I+xTtc72KtOdb+MsI10/uLP/2Tm7sSL1b45gOA7yjg
	cusnlkcy6noPQ76ENi30XUjHrwPAZoXOVYjnPXzsg5Btugc8PSa0X43hP5JrFARD3uT7xUEObZA
	FJ54ECEE6ND+9mjF+EJ4aqX3gxCm5yrezKvnoDt+7y6C93ZWHMBOSuhAXSkjr/c4azQ35u8f5cG
	CdcIw=
X-Gm-Gg: AYBFou2BLcTh6M7bWET1Xl/JmiHJuEjBRB5MhKKJhbG5LeFpkUKaXaGomuDZYNYCW7I
	KRogqSa5hj8llfDnZ4BXkfnu03cJr6CjTWEHNNfVEWPrz4kD48vL6bCSdKss6OhoJU+jJF3GRXM
	3MqCxMGAvaf7Qd2kdP+TEcYbys5Dr2L27vMaHRwkarhlShQ8sDoeACfN7cJvepfp/f8WbYjnSco
	Zzp63hu4mTRn5Fu2oP8w55OmgBprp9Psc2O70EgNu3XCWM6f0ZkTowJWkYlSGt43ab3TEyvJeJm
	wfEqSQ+YW/9YRTNH3FIBK+lND9H/g+GaAKTlqj/wDV0/t77yqNLFTdt8fJl9hNN2WW3Mh1lvJ3b
	CvMakELqzWvLZ/9SWMZjufDBQqcRZLa+V2DeMFC1A2XNUb+587xPx56oUO3g68Asz0NeUuVZyCT
	6fgllCq7JV/IiIz4eaqYLzcRpz
X-Received: by 2002:a05:7300:f810:b0:33b:fc68:9790 with SMTP id 5a478bee46e88-34005c6210bmr1298358eec.21.1790235470851;
        Thu, 24 Sep 2026 00:37:50 -0700 (PDT)
X-Received: by 2002:a05:7300:f810:b0:33b:fc68:9790 with SMTP id 5a478bee46e88-34005c6210bmr1298326eec.21.1790235470219;
        Thu, 24 Sep 2026 00:37:50 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:37:49 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v5 4/9] riscv: Add fixmap indices for GHES IRQ and SSE contexts
Date: Thu, 24 Sep 2026 13:07:09 +0530
Message-ID: <20260924073714.1650588-5-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX/gxJfq2j7y5Z
 Jf9P/NLqow8p3/XV0pcBUkBK2jwRTe8hTn/Xk8VAYjMgSbkTydAl00c2p+jUVZKgOGwfEAATcBl
 0HGcw77mj8alUSQdBERVVm89c7qUcKM=
X-Proofpoint-ORIG-GUID: cgWcRcw47rwhTC64HX8_DJsf78oPd8xy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX+ZeCU8cmNhlj
 k4YBmb+GKYDNz8Y9KsC13ocjsR+VRnpI5JBx6vkIBmjpZmCeL1WSTy9Nu1CfKiOMQE0lfEp7jiA
 zxJDxsgLWtkYWiwMqYCIgOjO1Z2b/vkK0izNTLv+f/A2N+gCnpeopmaKEj8dYgpeM6/JjFowvcK
 OZf5GgUrtVPnQChKAHAfbB02MFjePgYekzwb5wmskrfg/SPcbRxscj8Op8BxQj20OUT0hatcm6c
 2UfCNCjwWcisq781t1bwNBpZGW43dk/LTOStsPN2GVWADMabL4XFwfFTyNSHcHATAyr8ZJWg9Kc
 8ZwCnpRL1x7vkDfnvojTB8ymBCIXEB5dq6IyVjbCMqDPP1rnevUqE7h/juahtKNHy19hI9bQPNf
 7n/fWbmiZ/rINn0Ij6lrj07duts2pqNUYyxsE+YbO17EmboItF78RDkjjkrWZh1kur2lrRMw373
 7JlmATe+eEp6+RMS+1A==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4d34f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=h0uksLzaAAAA:8 a=EUspDBNiAAAA:8 a=0wheRbxtA0UXKxI4o1AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-GUID: cgWcRcw47rwhTC64HX8_DJsf78oPd8xy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_003752_148300_7EE1D7F5 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

R0hFUyBlcnJvciBoYW5kbGluZyByZXF1aXJlcyBmaXhtYXAgZW50cmllcyBmb3IgSVJRIG5vdGlm
aWNhdGlvbnMuCkFkZCBmaXhtYXAgaW5kaWNlcyBmb3IgSVJRLCBTU0UgTG93IGFuZCBIaWdoIHBy
aW9yaXR5IG5vdGlmaWNhdGlvbnMuCgpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBIaW1hbnNodSBDaGF1aGFuIDxoaW1hbnNo
dS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9m
aXhtYXAuaCB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ZpeG1hcC5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9maXhtYXAuaAppbmRleCBhODE4MjNjNWVlNGEuLjNhNzc1YjhkMGNkZCAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9maXhtYXAuaAorKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2ZpeG1hcC5oCkBAIC0zOCw2ICszOCwxNCBAQCBlbnVtIGZpeGVkX2FkZHJl
c3NlcyB7CiAJRklYX1RFWFRfUE9LRTAsCiAJRklYX0VBUkxZQ09OX01FTV9CQVNFLAogCisjaWZk
ZWYgQ09ORklHX0FDUElfQVBFSV9HSEVTCisJLyogVXNlZCBmb3IgR0hFUyBtYXBwaW5nIGZyb20g
YXNzb3J0ZWQgY29udGV4dHMgKi8KKwlGSVhfQVBFSV9HSEVTX0lSUSwKKyNpZmRlZiBDT05GSUdf
UklTQ1ZfU0JJX1NTRQorCUZJWF9BUEVJX0dIRVNfU1NFX0xPV19QUklPUklUWSwKKwlGSVhfQVBF
SV9HSEVTX1NTRV9ISUdIX1BSSU9SSVRZLAorI2VuZGlmIC8qIENPTkZJR19SSVNDVl9TQklfU1NF
ICovCisjZW5kaWYgLyogQ09ORklHX0FDUElfQVBFSV9HSEVTICovCiAJX19lbmRfb2ZfcGVybWFu
ZW50X2ZpeGVkX2FkZHJlc3NlcywKIAkvKgogCSAqIFRlbXBvcmFyeSBib290LXRpbWUgbWFwcGlu
Z3MsIHVzZWQgYnkgZWFybHlfaW9yZW1hcCgpLAotLSAKMi40My4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
