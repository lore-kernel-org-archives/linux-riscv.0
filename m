Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21962C98310
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 07:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaAbbiyXey/56E7g194SZX4euvQrIkffFErYDurAfLw=; b=H+0a0RM20RF11p
	Ki3NtPLmqZFiSeAQ9JK7/+wqN+CkRKoGDb0fqVVd7q1/Qth3fMzO1jYy8ZAIX50SSW5wqd4qx1q82
	M/m1QWivYMIbP+pg3WQHmlM1Wl5G2uydIHHqSZ/qiqStFWxlxyd7BkOsDmLrUFDkhBhr8AKg97ivr
	ofBWI7rfCSTKIh5CdDERXqdJsk0I2cAN9Sj5PTkkq0VI8I+OkOojUJ/15IUJmGyXpP8N0FKK+kuRf
	NG/zTZU+e6A6mja2HERJukdHoNJqfqkcJcF3d9D7wx3Wth2PsOW39IdyG/q8Tq4G0S9JCRZ6fyo5B
	IEAkbyBM2/VjacCEzWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1j-0000000AJJg-024c;
	Thu, 24 Sep 2026 07:37:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1c-0000000AJGg-0kG5
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 07:37:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O62LZS1475679
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pB6vrkBAByF
	zx3Q4zdQRRWEh7E4G3c0it3uuIjGmP0k=; b=Pe/wqpdeZ7PC+JWlQFS3sxeFLeb
	VUsxqEQqq4j43LQi5K6bmjtMVe7Can69P1VvO8utIXIxZxaGAqcbWbWuKtJ+0ERB
	VZXYDcKsb5/ELqplhyGtv3Mk/SyA7RmxMMJbC6ilvS4C1OCEKsNmNAjRCDAjZMQf
	KL+Y4zIW9MxZc6t6MrUuM+ZuP1ZPrfgA4p4fwYeTC6KE170rqUL99gsiG/IP34P+
	WJTMvjiYvhxtnkXasP2Ll1k79wUuhRlpnB5fJIWQ5jC4+FP+bTppMR/qeJUrvXLY
	vNQ1mDrluGHUlzuyeuqS80C8X7Dw8yyHcLUeomlQimYC7N4vdPid+uB48dw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8agcaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so3295016eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235467; x=1790840267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pB6vrkBAByFzx3Q4zdQRRWEh7E4G3c0it3uuIjGmP0k=;
        b=b15XNJBh1hN5dRV9AOzM7hUQ5zY1ETZCP83kng1ceaTXPxM6Wasl2N15gVsPWaw67T
         fs5uWJ1IAOKOagW7AdKWYn+Wy+un64uFmx12EE1Cn4iDj19bOTwaz1zved7cNbhDJ9cl
         ejvdI9IminO7dt47d0jewlarK3+g1hTOF8DPeXcYQfZgPjegdnK5nVogeTztMu2qfqcB
         IfQX4TtoVJ9p9By2FKPu+2wzXWGZF/m0gKQeF8LkChTN1BBzjH3hpSK3FfsZKn04HHvs
         4WzhjC/pXVrJd9zTPu3L/VbGCduryK7+JGgcNsLSTwR05c1pT8QsxhA+/ZH4NYuvZinC
         7bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235467; x=1790840267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pB6vrkBAByFzx3Q4zdQRRWEh7E4G3c0it3uuIjGmP0k=;
        b=rkjcxdU39IxiYZT+jbwQAQHBeTYC8lozvK+wZHY+SVVRUJNyeBJj5N7RSubvfTLyus
         iCSH0EMn2dE5pO1lzM9tSmn9+4356wWe9NE29l+iO0+j7Gw4fTRsztSlFjUCLnSlHPLn
         t0yLLOwuJaxCMZc7OBUqWMKKqqG0inOXeTimQAeh1VgYgwYL6klwsVErWlKHbBt4jLPM
         0ZNEGinzpNikLP4oP9ReRZCi7X4Pno/LQ736FMYvn5s181jjAjIUaDQpV69esV1mZJ4l
         w8DHjxHBWOl20W3LkSuwQ6GKeBmXDFy8M89nYQEmngwGs2pvQhjnnF8bOQ952Nvqa+gD
         uq7w==
X-Gm-Message-State: AFuF++lhavoJwuE79AKwhJ5eHvTIl7L3M1XKoyxWkqiCDRzap85b0Sh6
	M7OXOCEF/FeId7gQxxWUez2OPczeo0+FAublsDvajKVJUs01lOP2HGrsnW63HiYKnuopT7bRtDC
	2IG2zeEQwivJMpl0PuLQDgjP4z/WpkRg/beIUO1o/OoEND6ztETdsoO9fNgfjKKfO07nwBhc/Xf
	Z/BfI=
X-Gm-Gg: AYBFou1QaVO8xWqpXCCf+QVQNdNgedzrpESqJEXLKG/iwI6pPhGm63mPAP6zqYZkLrU
	5OndbXC6hbxxdu2js16nuC7o8hcLt7/sOlLK+CIqpWq/qCbF7+BSyV3M+B7aYxg9sV6gcz1pJLl
	37Rv0EXUWyQYui6nMCFnD/ZOBHQRdZE8iRzLYDSyDniiRfGRPGwvXEGmfRygTN/I71WcPkpZo6l
	CxGBV2RdcD0LDtORliLwwgqoqz5w9qi18tYiiSGw/Ow4kU2NtGLmAoxlMRPgc9QdDwa4lrt3EkW
	/RF4XE3B4B0yqECUW4J65Qkfh3P/Xp+06ZksUe5a+zbSGc3pHGT+TiejeLggpMru/81vR8O0fke
	9L32gAVHry+mGCp3ZPiaT2MdhBqnDAPLF9k5pefJ+RgDTZnX0EuqtgYny7oCOuaImTkZN7YfgsJ
	QwG0wFJI01cZLUPDtwvLyCvbIG
X-Received: by 2002:a05:7301:77ca:b0:33c:e93:764d with SMTP id 5a478bee46e88-3400151e050mr1333168eec.39.1790235466700;
        Thu, 24 Sep 2026 00:37:46 -0700 (PDT)
X-Received: by 2002:a05:7301:77ca:b0:33c:e93:764d with SMTP id 5a478bee46e88-3400151e050mr1333069eec.39.1790235464103;
        Thu, 24 Sep 2026 00:37:44 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:37:43 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 3/9] Introduce a new HEST notification type for RISC-V SSE events.
Date: Thu, 24 Sep 2026 13:07:08 +0530
Message-ID: <20260924073714.1650588-4-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX8f1kMGyyw5R2
 0Kk7i624vNAD377O+81wvedHP81gxEKO3ZGClmk22wAOwTZS9n1MuhIh9X952jNXTxW6sU9eDU4
 4rsGoF+ubS7ur4xgFhFWbvHjHyM+lsw=
X-Proofpoint-ORIG-GUID: zOXrECB5D7E2UEzi63n45dVuN-nc--np
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXxrSOQDdMf+tn
 QpODYg5o0bcvyvtQ1BjY/mNK3EXlvLy8OHm4tRbQkq35BW9I2kaUG0DRloGQ+rSJvq2ywQq0En+
 ytoK6woimHu/srxQxNCggBLZtA/87HUyjHO2csWrBbkcFfH7qWkvnbRr4u8jNYst9INYyl/OxtZ
 gp3bFeLWpIbbljYEGtLbDNfBvtd+y0848P9AUU3cytvt0F1T2K6Q8ly7cVzks9Uod3t6Ks/ah95
 +g9nWRyCvrIFJgBOCcWZtkj8BEWuWS4lArGnTqcDGhtJ2kKEIbbEipd7AnP0UrBRBXiFbZ6ramj
 tnfBnu0+SpO1poY65QuuzvixiwKxcCmw5ppChcMJcGkwxWz5W1u3JXjrwTIp9LqmcYWio0O+VaL
 mfGILQI0zFO/4aGZwfAexDncZ/Z2cX7vgP9n2HN3PN8Umua4b/KZTL2l7bnIRWSWEyG2Om0j08n
 7WcVzNAXkbgxxnqkepw==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4d34b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=6zSMeUNXk5_XeOI1LAoA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: zOXrECB5D7E2UEzi63n45dVuN-nc--np
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
X-CRM114-CacheID: sfid-20260924_003748_400156_E3D76299 
X-CRM114-Status: GOOD (  13.43  )
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

The GHES entry's notification structure contains the notification
to be used for a given error source. For error sources delivering
events over SSE, it should contain the new SSE notification type.
acpi: Introduce SSE in HEST notification types

ACPICA commit f73f39352c1170464afe812cc96b20cc9db1d822

Link: https://github.com/open-acpica/acpica/commit/f73f3935
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 include/acpi/actbl1.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
index d824838cb7af..105fd51f83ec 100644
--- a/include/acpi/actbl1.h
+++ b/include/acpi/actbl1.h
@@ -1798,7 +1798,8 @@ enum acpi_hest_notify_types {
 	ACPI_HEST_NOTIFY_SEI = 9,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_GSIV = 10,	/* ACPI 6.1 */
 	ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED = 11,	/* ACPI 6.2 */
-	ACPI_HEST_NOTIFY_RESERVED = 12	/* 12 and greater are reserved */
+	ACPI_HEST_NOTIFY_SSE = 12, /* RISCV SSE */
+	ACPI_HEST_NOTIFY_RESERVED = 13	/* 13 and greater are reserved */
 };
 
 /* Values for config_write_enable bitfield above */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
