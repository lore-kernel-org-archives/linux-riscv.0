Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A173CD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3S9Gqi4yuR3Rh8eBse3dvxpVQrmfJEo3Pcx+LHx7gm4=; b=IHhzUV+KkzlSlP
	yMLsL0TmBvk5ucjohDKEO34uKJr95tzeUQoX6QZGIq6gQLMzn09SMoIfF5gGrhv/p7MIxcZGQAYgj
	OEEH+v1ArY/DtH6blrvcnkYGENZj/QQHo6BBnlFSDZlpO4m1jQjCMAtWF2ooDZMbSOP8kyhJMQ906
	KVcF2PjIv1nAkTmquwBfYymr9J9oLnOWb3ybv5gtLq4n7ZFmqXfyJrmwqsDD1o8ZrKTOTrsrdOkyf
	eh2E6o/v8IHIdzcirnd9pXR6CJt4eEdjNBsxxKcOfJ5PnrR6kQP4SfcUYm4bPzsdtvtjJBqGcpEYp
	/L06roRKQtB1qBkMJ6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Ci-00000001mS0-0iSd;
	Wed, 13 May 2026 08:44:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Cg-00000001mQo-3sqo
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 May 2026 08:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NUjop8bIgjc4kzn5Txli1zlGm+BpePPllAZ0mN/qO84=; b=U0tMnX9dQpBrUzYGVAIjM+slw/
	ee12W5J30XRq3YHU69f/AHa0yAre1zROI/9ViCyGM6/7Il9SedslG0g11/lGS/Jn/nsZJGVomEbDn
	5b4TiFuLgeMxmSvkw7fRwZ0sx89J6dwIh77ZFh4J5jO3d61Mc8HfjhAseiwUufyukZS7M0MQYYHC/
	ckf7ilCGsNsLf8NvCAjKFDazw+UBbQgpkfdMGbcEEa26CbCg9CDQaGn0sSmxHhFzEM5NyMU+WjWe+
	aZUrU5lwE+npL7G/KAH7QhGT3mt8n2Iqk8SxMMKHaySaTcifHSWokFuZGi6cgFX35DvgRtFzu2rv2
	NJ2+GC+w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Ca-0000000Gs9X-3fJR
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:44:28 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pFUj3527777
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NUjop8bIgjc
	4kzn5Txli1zlGm+BpePPllAZ0mN/qO84=; b=YRekJzfFZ/MHDlciDtRpJz040hC
	BlbOFPswO1P456inpjHtRnZ9ouyRtT0MY0O4FkMSeLeSm1WNmh194NcDk1zClm1d
	LbNeJVxalCUmw4bhrKN4xCzQkcIyfPhdcmwfo+iLf/3WxeLsfCKiihuINxAYP+2m
	RcwuHFrhocW4/fVs4vP6a2UQLSAUhBMHI3m03Img7RZCX0gsjPivVnUPBVVXmUv1
	1Gro2I3fb6r5zZXpJgY62ZBZa7c7q38FbGCX2x2mcmro4L+rq1eISBTCY2JWHnXc
	ZTDAXySzbbSg2F99Xq1tIZkMB8xu0zPxhHMBXjHWKHn1bBdiWssE2BjcCLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f340qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365faf6006dso7610225a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661862; x=1779266662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUjop8bIgjc4kzn5Txli1zlGm+BpePPllAZ0mN/qO84=;
        b=e6+7yIhApRWuR4awKx3OJL5cOM7c8rAPud13S+50jXSiZpMjFNOlQro6mNscTzVrC0
         HtOUOUzUo7YGq8vZ377hFOgCtFTLkpn7PH1mXPEarTG93rE8cSkKOqFrJLIMCM0FvqCW
         0OTgHEd8O9zChUzEotCmlJpyZ2iHKAnB0QoBpLUxlph6YdyTkcSXySXA+Bbk6HWfbSmU
         H6osvi3jyDbomxlZruQe+GAadetlLvl0WUbmZAPYUNIG8sN4iGWdgaQGF+Fv05RUvt0N
         TeBsaGDIuUHMvTii//omsdeoh6DvD2hjoxDux/vAcoaD7la38qZMBt34WzoXujJC5aSI
         bQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661862; x=1779266662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NUjop8bIgjc4kzn5Txli1zlGm+BpePPllAZ0mN/qO84=;
        b=BK4veq9QXyT9A/1g0E/uqx+WBcA75KrilW+ugYa6BBzxPXgt9hug3PBgbljKdvRN17
         2+9r1UxWACvlikOswWEF7qKcV1VUriias48Cpc4B257mTuoOIrglYjL24wT7JCzX5EnH
         8SaG4/Aox4rBHrfP1tDsHHCQijM4CoOKbxEzBw1XMJWYu4TcRRAmbBoHnF+MAeyr+Ft7
         /doWSuKVM5u1otToLFbrMXh3/iz4ognq7G+h074gChklRW42VPmWZLIM7U8hIQNzVQvm
         koW0+9E6bQcT9nZOuLufBYdtj4BoW9EXOsmXFVz0Qc14HPM7QaL460DbFjLyppt6z68l
         ZB3g==
X-Gm-Message-State: AOJu0YzS5VjjLIXsgy9EminThZu7cLt9YgA1U6IRMML8ySeB5lH+3gSR
	J8nmVg+M3ysGr4iGP5RvnQTk7wWPSSme7bq5CwZA8lJ8T2TrIo3zAojC14pPvech2axIgbf8rBJ
	347tpbSxrZxo3smNRCUTMwYnG7XQB84LP4JY/a5XePFjGckKmQhJtQ6et3QdlCaQfDr9FuSWF6d
	PbYsw=
X-Gm-Gg: Acq92OHNlx4SUmqBnXrZv5oe2drA9/9Pc7MmfhYr7+dTqo2uMV6FDjMGdKtLjir1YQv
	XlGROTWnWP8mn+BRA4/5s2ZHYHzk/4O9ME6vmIavM7VEtRrdIYqLUyy9nUHdFZ6t0031/R/nmH+
	9ekrcQJ67W0bIFkJXnPe5LtXuc2a/J2nxmKIHCEFQpHPXeJTLQ6aSs0BmlB8nCl4/abc07G+vCc
	I18oxTGI12UyBECUhP5slkjY9B+55DyX5D2OPcUhPod79bURsdWhl1UXIcYm9T9yTEb/e99z6gS
	iMsv6HedbF9HJ/O5qgUipjOCdN42COAEYuvUm7hjaVoGmRQdkHSpOdBe/QA5L1ue1IjntLEYEt1
	g1EnJiul5WYqfgG9LQk8Q77whz6A3/zJYwBXNXlDmlChIPfaj0ozaWoaMYbGXxHx97HaPIV4bYG
	udMi6GQgftxEzE+sDtyrehe4AXe4hJ7UX3uqeV4piNSJ5STg==
X-Received: by 2002:a17:90b:3845:b0:368:1064:62f2 with SMTP id 98e67ed59e1d1-368f3bd83ecmr2662353a91.3.1778661862216;
        Wed, 13 May 2026 01:44:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3845:b0:368:1064:62f2 with SMTP id 98e67ed59e1d1-368f3bd83ecmr2662325a91.3.1778661861767;
        Wed, 13 May 2026 01:44:21 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:44:21 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 07/10] riscv: Add RISC-V entries in processor type and ISA strings
Date: Wed, 13 May 2026 14:13:22 +0530
Message-ID: <20260513084325.2176952-8-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: futKJjAjoyvA03VQaJJllVrJfamUP4H1
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a0439e7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=osVkw33_48dge00NZUcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfX0p5oj43aAcJS
 8MA0cPCnE2OrBX3x/L5SP93pRHPIXzRc62XcjtMysGH+4+ibAkoyVkKdeHHVmRKZCad/YEIeTHr
 hhwNAkyfM5/aCU2rFwd1L1OFXbL1JUhAAd1eSE2T1VaxHtk4YAYrll9Qw1HEAUlK3a9e9N0Y1w3
 rP7WcJwmFrUOnE263rgHckyyFlMNOhLmHL5kYpEot4bHaL4k2yGuNsKR/3h02MvzdyagAQIIv62
 ahgmRTh9K3ugCl8XBG7V2NRagBcxjpXpcbsZgU5EjAul5hgQxsL9GjmNLT6+knoCzNB4Keetiga
 lb2Nj8rHiq82w3nh0kjwiB8h+Xp/YDjXuiJaCUDxVmqZ4UJ1SkUbfCOGewFDTgY22ORX2T0433d
 YgnNdRL+1M5Wo0zPMzpVvYMF7Xw37uU0LoezgWGsuR9+6EPi/l86fNVUAnoR1Vh0bEAuEwT4KfE
 0ibBUF+lvxq1jyZywrQ==
X-Proofpoint-GUID: futKJjAjoyvA03VQaJJllVrJfamUP4H1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094426_365601_B196AA74 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add RISCV and RISCV32/64 strings in the in processor type and ISA strings
respectively. These are defined for cper records.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 drivers/firmware/efi/cper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/cper.c b/drivers/firmware/efi/cper.c
index 06b4fdb59917..1b1ab2f1355b 100644
--- a/drivers/firmware/efi/cper.c
+++ b/drivers/firmware/efi/cper.c
@@ -170,6 +170,7 @@ static const char * const proc_type_strs[] = {
 	"IA32/X64",
 	"IA64",
 	"ARM",
+	"RISC-V",
 };
 
 static const char * const proc_isa_strs[] = {
@@ -178,6 +179,8 @@ static const char * const proc_isa_strs[] = {
 	"X64",
 	"ARM A32/T32",
 	"ARM A64",
+	"RV32/RV32E",
+	"RV64",
 };
 
 const char * const cper_proc_error_type_strs[] = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
