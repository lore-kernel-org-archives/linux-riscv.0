Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAF1CD4F24
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KC9djvAMI/q8tbRtCT9bFZECImCXt4QS8KZZzLmM4c=; b=MvBPlhMEn4Y2C0
	8qJCn3XLyNSsBc2Gj7WLgxAEBds08dvcQ6HFHiAls175plL+TnpWWU5BOxoBo8ZmKUiVUvZ3y74rV
	N0hfuj9XCS2PcvcDkKwszfpObEEU78sa8UD1o642rVY6Ji4K/WqJDljjO3hyhCq1BIoeVhSBklad1
	THt5kSZo/UawU0GiBQZ6n7+xd5/3H0oU8M19+o0dVEuNW73FaNFnrwdTrWfLk4YrMSArpuCJgX30O
	Zp/9MO6233PZ4/j+Tb334J0dEfEqhNUB/d1W2kozpB+OBqiTnHVBUkzsrxXNSWpBaTRlP4eNjyP8m
	c0cHiHEgkZHYmwsWMC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Cw-00000001mbt-1dZG;
	Wed, 13 May 2026 08:44:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Cq-00000001mYY-2eTl
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 May 2026 08:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V0HbiZ4P78pMMZLzC1v2KdG7nYX9gwkT4Ii7QaESwzY=; b=AiqrFElmDMtWhM8PzkvUSRDWCa
	0znOc9EghWrPYlT6vdMfaVLIqe7SbyJCi3c9+8wAO++lOxpnY8Dm+viKmWuWRbpxfkfJsC6RWDHuw
	auCKTQ73uAvWCwjaPwJyNr+5534RK1vF4XIzmISkLBAUc/1MBMrXkeQ6tJyszsSk1HaXlFIV86Lx5
	zTFwRYbElLCwSU15twi8celfD9Iu6nxFwMT/XX2qXYo5dH/EOc0ayyUInzv3zF6FiFLBadJQq987q
	w04X/gs693GfFAbg1E4pncCOoq5Mu4CsKAHP8NAogpqwNSdkMlSd6kv5qzWpYHcgOoaTEr3KQJPHN
	N7JQ1z3g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5CP-0000000Gs5v-330x
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:44:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p8dk978130
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V0HbiZ4P78p
	MMZLzC1v2KdG7nYX9gwkT4Ii7QaESwzY=; b=Ew1B5Uchu+VjkXeGWc9d3N/Pnp0
	nZzD6LFWdy1C5JumSy6HgxxxatVH7CrcEpiAr9tS75N2AIkHFhcuhJRYTQ8mgoyP
	k1wM/NjaJOAmnExQUkI3ZQALvNKL7NR6A92epgC9W1XZK9labvSiOzprUknX81XP
	UpnV7m3Y4Bttu2nKW79QfqCF4PFIRGybDVKuPRjTLw9qc4t2aI1vB8yBu89fjwzP
	fFdMdlBWmDobbsttc8VESNOP/+UnbmbEa23zIA9ufpAF+GWKY/+Ag75US69WBBTB
	h7+ga4OgAag/YdzmegpAqGLCjlOoUX3Xj2wXtuqPlacEWT0VTmuGmhuIz4g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9ue2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7aba0af02so70502785ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661852; x=1779266652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0HbiZ4P78pMMZLzC1v2KdG7nYX9gwkT4Ii7QaESwzY=;
        b=gMT1oGdMkDJ6x2RqxwqIMTNKQYHXgKHXDUQdR7LyAOC+V/N5xFKz0vymfP55junZrO
         3IfbZSoJjDroWfIpNXXmqJGa4G+yHRMPSYMRrqBKT2ri1HmCMxmVU6kmRctmxiQPsfXo
         0ECbvzuZJiS6ITxSEb3k9IP4IWvXJGq+k5zCXw/P7RwA29eQVHk5XtsbmtbgNkcvIw8t
         PRdIxvrZaH/SuqDDHGVazLr5j6rbOEb0ZFkF7yPFHdb0Xhtk9hF/fdgLGyN7OQ+mqX8o
         HsDYDIztKfPE+gwGpzgw1MLq6WJ43b1v/ngYtadKYbNawL208hrpbKd8jPZcXWpaSPwq
         ONug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661852; x=1779266652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V0HbiZ4P78pMMZLzC1v2KdG7nYX9gwkT4Ii7QaESwzY=;
        b=YfVlsbehmWZQQ7ul/MGGBZkYCFyOdH4d49Po/SXlT7stU/sgO3xanpBsFxGj1Jxi2j
         JSTT8R/rKIxsAe9IqgbgwtD5ky5TU5fpMaIYv4lVY2cGUoqWQDykQlFh1qsh+37dfV+C
         LGCGLTGQ5Kn1SaBsPfacSOErOS7QXjvQ91Hf18ZDrC7pec9muFGK9qWlDe3akPdvWlDx
         W8jmS1baCqUHhuAoQZ3qk+hxbe75pNdW6sli8H5m+tuY8QZTaXkOCKG+cumgz3WUVqJI
         AKS6m7B2kuKbNfqPP/ybxgVH5SBULSKNbvN/WMs0ST+Xr6lqaB3QR9JWPKynJpBZh21Y
         wd/w==
X-Gm-Message-State: AOJu0YwVFPuigU+Nu2G3tHgbdOPW92dDUVxapMZ0aQeJA7B8c+33f+S9
	7jbmWWk/I+9+hAyZBUni5mYjOoXabESBmRpSPgy8nwgKeO2fIje74vY8cy5CgMbFzWZ7ruxhGxc
	kfjYk1GlLN1dPcW34PFcWrCwFU1xtPSW5pM9V+HlzrlL+3WXq6ckCJFntmyx4hTqAo0xNZHgR9S
	rgzSE=
X-Gm-Gg: Acq92OE2LR2jzSb1s3vZBIYwoB1PYSRrYXvYbNXOm4+nNjD4+3Y8vqEG92OWywvPidC
	rOibYU5tSadoAO4GCPbeJCCBZcbFlgnYtlQKGc99DczXeU4Tbef692DyVGy9sqV/SUWwAlFnv80
	IpB4NOxt+mYqmatrsfJsrNchq3rKOYbDJ2lC6u8YGYkqQbCNc6lBweuWeDM06dWx1b2hjbYFMtJ
	3h+AjmfElwy0v+Sp57YiGqvxOdn1PyRHILTHWUo9zvTX9jIH3ZiSkoDlsccL4KkWvB+AHu37gx3
	oVEBMILuQ4B/u/gaREMCnj6avlrngymMfZObaHtEfS6kXMGmjAetjV7NodZ1rv3BN60J4IJzG6z
	vwHIPTsFx/C61mR04CWRGkRV7ki1OyBPSBzDPbfha43EnU4Ine71TfydZamnLgymSa1RJfSYXXq
	pxDAzXrvnAL0Wz+DTOCpWV/bFdLa9tMhlvmC5XbgRYT5+RMQ==
X-Received: by 2002:a17:903:11c3:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd2f4cb703mr20265485ad.1.1778661851549;
        Wed, 13 May 2026 01:44:11 -0700 (PDT)
X-Received: by 2002:a17:903:11c3:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd2f4cb703mr20264915ad.1.1778661851092;
        Wed, 13 May 2026 01:44:11 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:44:10 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 05/10] riscv: conditionally compile GHES NMI spool function
Date: Wed, 13 May 2026 14:13:20 +0530
Message-ID: <20260513084325.2176952-6-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfXwRMJooHK+F5A
 +hcjNLesfSTu3zR13k1JnQ6I80mmle97MPiCuaGCFjaWSn1yRNHvhN1RSdSLpFXZc0JZaErcuK0
 7JHonCSaCcaf5YvnegJUbx2W7nyDlLhxJJWqWZrcaxkBw2bKR7YVyp4j9jMlH2spPwH7971ziWZ
 rytD26CBIsDa5fPVssgarb+Ga8FrEAeIRzg7+v0LCM09GUKHYER0WnC0W9uXtSoLiURAgw77DYF
 NCyTZRhsd7DU2VSpxYnH/Mdpo5xf6W5z/peVq9u+4J3cCskNRHxh2d7E5SXO3gvzM+JplVTXHaa
 AFdaWrGG7VTSLsyBhk/zH7RawT0o45My4fbTEGx1c96/176nNdlkyq6ytNeLRWqmLpRAwZHa0Py
 ZVOwsUdJ7Qv83oWaXevvCYtNvb59PTLGtbVVIvAd1AuwtRfi/+8JWCCRivKZwLO1Vz0E8TUoJQC
 1pin9208ZOgSKQWTEOw==
X-Proofpoint-GUID: vT9KBnWEgUdhMm-3Okx2-KHtIqD6Mfuk
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a0439dc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=-FlRX8pefk0TmyAjS3oA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: vT9KBnWEgUdhMm-3Okx2-KHtIqD6Mfuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094417_642279_B373F360 
X-CRM114-Status: GOOD (  10.67  )
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

Compile ghes_in_nmi_spool_from_list only when NMI and SEA
is enabled. Otherwise compilation fails with "defined but
not used" error.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 drivers/acpi/apei/ghes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 3236a3ce79d6..8edc2c8db1bb 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -1397,6 +1397,7 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
 	return rc;
 }
 
+#if defined(CONFIG_HAVE_ACPI_APEI_NMI) || defined(CONFIG_ACPI_APEI_SEA)
 static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
 				       enum fixed_addresses fixmap_idx)
 {
@@ -1415,6 +1416,7 @@ static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
 
 	return ret;
 }
+#endif
 
 /**
  * ghes_has_active_errors - Check if there are active errors in error sources
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
