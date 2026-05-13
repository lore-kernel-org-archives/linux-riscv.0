Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E344CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWDKgbCOIt3TwNv6Tv8QAbrWqGDRR8qFdDiPj041+u4=; b=n5yb0SpRo7a6nL
	bisAnT/Yjw8UN7lT1hZrF2fHV9mejANZi6hGMlU3iDyhyO9Xj5odhFzw7rcQt5fEVv3D/hakbCDfn
	wLZfHcUqo7oXVBkD2XMXTpCH+M9paKITsD6YCN8hGbHHMxSMZM2Nugajjxmdi0d1DDQDH2vHITtAP
	0Noh6LW64FG8T9ig6O8oZ1Q2yCQtZVcAlsEy9BfUAT8Xl1bTw/7I+cYcL1wMrtp5wKVoMroL5glpB
	8xI2lSrzya3OYouC7TXcWozpeJ4XZovn7bODC7eWxyXdJxAJLEtiPmgs+XZkdVEQlq/AExFNh30g8
	evzjoRWo0s19nEO3I7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5D2-00000001mgP-243b;
	Wed, 13 May 2026 08:44:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5D0-00000001meT-36Vb
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 May 2026 08:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zmAbegcURExUMu9LBa5XbR8BKHL2qZB12gzd9RXImJ0=; b=C9++a4sQ0242Du+RJQsxGgyjEG
	TMPFoTlC3Q4Gh3zla8flQCORL02fJC9+uj+DMAivNt8bo/DFyZdh7WBJFbWIuW4yUqaOaknYWGkfk
	ryWbNJB9KE5pbURWsCFEuDDLbrpAaerorIxSUEBOK56w39srvIEFyFP9acaOSzCPLU/GXrCsqrNKS
	vKRsLQWErH5iepUIUgx0hI/kHEF+ipGNNdq452g0tkU/zwTNnQ+84+WoXeeaQivVAoThvHS0GUKxV
	TrRAaXsB6x//sCWkApVNfPyesc+OMaW37Ockvik+6YQvWwL624pfqe78F+QP1Ht2SmnL2F1KhYt7r
	xnh9N5Iw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Cr-0000000GsDb-10LV
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:44:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9VW2343978
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zmAbegcUREx
	UMu9LBa5XbR8BKHL2qZB12gzd9RXImJ0=; b=iVz425xm8NrnarAFsAX5H+HUYOk
	UupNDRM0cum8UeBq+sX4nbv6ktka9JpEftA+rUacYqi1jirP8l1ku/xlW47Z/SmQ
	gBg6/yreQLGjB/YhRmi3TDQ9+BDohxcLaw7Lp4WHKRPiS8gAYSyB2DfEWcbXXNzX
	ZGoxnZZVb240KftcGC9Za+JzSgFh+2tAY7ZlTs9Bu199r/EX7K3yGQfQEt/zNmaH
	f7FKO8Qeisg4eu5QEIoUHSaDwHHgxaq2dhKFA24DAqnIQQBq5FbGmh8umsTneYvu
	cN0DiryRjmRxMnumLqySOn021o/3lSjwwH60BeVLTnsEmOIIdJm67l57apQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn456s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso67975625ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661879; x=1779266679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmAbegcURExUMu9LBa5XbR8BKHL2qZB12gzd9RXImJ0=;
        b=Ud2MfpQQuX0XJp6XOfAdxG3fPiDGj//Wcc9NV5xJYap1DImCwBTFcuL+JLmHYWTEHe
         EZBrELPaDx8DoM6aFu5YjdablwDhv3lc7fy0qb/DogDrMmVvqPfOb3aq7jmmiJUQDAWy
         1K2UqXw3VW44j4ex3ZAkZoK6Z4YDeJx3hvbH9uEyjw+yrn8sXVHbOcFK0hU/cAbHW24I
         gCDUJt/ENWDEapHJPO92YfupQrYoEA5ZWtjOhMC+R0qYQ8G2rsfWO3HCxzC7/WMkGh3N
         zophD2HtiT75lVy7ZkUB8dT3B+Qtzvbs0jnZBIHOGnR0KV2/P82yDXRFHtIXifpPq6P5
         t9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661879; x=1779266679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmAbegcURExUMu9LBa5XbR8BKHL2qZB12gzd9RXImJ0=;
        b=emFb7LNUi44MTopj5jfRW2PancEEz4uKSBwEty8RitCpP9PinEGLR53mAWfSQOgGt4
         RYIgj1tEKhQtVyhCINd3LtrbLJxQukgZvACMpJECvLPhggZPFE5eSzdFFRp1I5jrMs9M
         uKW3kJYYhhv5/FL8UnK9lc186wl5OgnRxv6+hYwfJzLTiuCKKZwYKuUYtSoMzqZZb77G
         HjRsDvuWuSS+Lm2MmrRp9+jEXNZ6Yr+QxO5QKDCYCeTwDzPiaejDhDQQiqqFU59lbBNI
         jLH8dqQiFm1Iun6eZ8VgdQDo1rJfWrWjGjyV6uVUUw8mt7dQHnhZiq5Ds/z0olAvcDjf
         3+zg==
X-Gm-Message-State: AOJu0Yyi0l9LyDSbZpEv38JKthwt8QrMJj5VoAwDwx7ltbdzHiFMdLqq
	cCWChUty2zoQEgE7uERv7GtvY+Cbv4RcN+5G1MXIkgcJz8k2nUa5vrxDU6iBsb8z7IJan3cViVX
	o/YCF+a0mBlP2WHX/8+ZzflzvE0xjyTLnAyR5dN7pNMjKjDh7USZ1qTZUeAJzCjFO0S892EQvC0
	GV+m4=
X-Gm-Gg: Acq92OElyb8vJUFNVZwFuy3YZHPQB7bzPUOcIQYs182QKHSlNPlrpir+k81+TTliJ69
	AYgM/2Mdnk3z53GeE6MIvBBBe21IiDiN2/54qAbPqoFSDs0NSqJyEtvM92+2P8cOG7HxXFhsLRA
	uYLOMv7fygKeiZbip6z3BawT+GLwkHs65oinuC3u/l9lGEt6+Nn6Nu3hTxy8fi7qRxf8HQoEIdB
	AzH3IkxtwvUfZwUvzwKYwyT+OljopNllhYOsafQXF5xgJFjxwgDe35gge/6CWdOwpCRGty1cCWK
	EBdhIVL5Hlb/zdp0pzDoLkkpHGJaWq+XsRG6vEREhVkSwitG6NsC8ltX+3crhU/BCMqPwzoOGj1
	m4JcwjGVk0cUgJo7M5rVRBLhiAWRNTSd6uzHBAUx37WMCuRgONw0bD1EeZPosQJ8eQAUhZnuBn6
	l4FCOTtfpoGfIy8CsinIr6HoG+ZVDGsWOEL5pdkzy3p5aTsQ==
X-Received: by 2002:a17:903:907:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2bd2713c355mr27371415ad.5.1778661878568;
        Wed, 13 May 2026 01:44:38 -0700 (PDT)
X-Received: by 2002:a17:903:907:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2bd2713c355mr27371015ad.5.1778661877861;
        Wed, 13 May 2026 01:44:37 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:44:37 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 10/10] riscv: Enable APEI GHES driver in defconfig
Date: Wed, 13 May 2026 14:13:25 +0530
Message-ID: <20260513084325.2176952-11-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 1fadRKYAa-33Z8pbZHrRiJOed0ME7ZQR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfXxHaNjEsyQLYy
 aXttXBbBYLq+5jB6aycd+A7+SiJ0XXjNAwU7OFVh0NQLCHuoZohSFA9sEQ4EKcpfl5z34FFJv8o
 f0IdMaENCgZnal6XI5sl5xSks2vbNkoU5UQiDZcfptFbcTu/IlMzu+58sp3w8SlFQEVHrfdHfJU
 6KdkASps6f3wX2VzEWJuQUCRMvsQ59KEYX9baF/z9oiuo0w9cOeD/EmRhJtIMwVBYrbQoI/7TD5
 gEXZXbx8NAJsoUyf6+plS7b6t1Ujy1j4lDp+6obNjV0K/E9Ovg3+fsmRYeOK8ngxTbP5vif6mcn
 2T8QqOVO1UDwhO9Hix3vzjMVd8gvMPCvBOR3MbA9zEWj9JTzFWcG7tQ82fXgG2JSdDsWQptn1k9
 ROsb8iGpy9D2HdvRbrz8Q7TeRagco2AxGjsRegNR0wXNPTOnjkNfEvaJeVpHHuW//RZeEsJHRbJ
 fx3mDtWXotObPh8d9hg==
X-Proofpoint-GUID: 1fadRKYAa-33Z8pbZHrRiJOed0ME7ZQR
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a0439f7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=xUlk1AThICIXWUt23vsA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094443_007804_37D406B0 
X-CRM114-Status: GOOD (  10.36  )
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

The APEI GHES driver is very important for error handling on ACPI
based platforms so enable it in defconfig.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index c2c37327b987..eb0c45405cd4 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -46,6 +46,9 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_ACPI=y
+CONFIG_ACPI_APEI=y
+CONFIG_ACPI_APEI_GHES=y
+CONFIG_ACPI_APEI_ERST_DEBUG=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
