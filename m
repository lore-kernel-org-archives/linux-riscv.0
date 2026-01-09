Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C54D232F6
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrJhpHbfbyxrYU2g2gxs8JlG4nD29XbAyogfu/U0fRQ=; b=o1MBtIoU5jjzqH
	67IfXSNH97d8FOBbSvbChuhrOzGq4VXKOXBFOhtyxNIP5jf8VtQ64EI0qgP7MQGpV/LmZNmALvzSK
	s29m22fmQ3q2o4dGdFuNwY6tf6rswSJebcxlBq5QD2i9X+jzyxtnymQa1XXLWm9Sw5Gj2nl6VeUFL
	fL5jPLH1jt7DGajARD4J6Fu/AAN/5TN6teVlvuq0CXjuMwopZRyis7CMoCQXHTk4aC7YUAYgFNMFY
	WShg/xLt9eL8YsdSNkqXEK2PlVHBqsKkDz+dxGsaFbSi8f4jAuop+JqAs9Tj6bx6TzjU8TAaTjp2Y
	Dagd3T/rRqU1szz47F5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OZ-00000001xHs-04nN;
	Fri, 09 Jan 2026 09:02:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8OX-00000001xGc-0gBr
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:02:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098mXIC3727889
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d4ucWhJ3h8W
	TC/Vx88wr4lDxFFX8PD/AphAsZy//mrg=; b=BZYzt1ZlebyBfYGZ1iZvKCvxRjV
	/XsXeUmeVGCAr7Y/ZQEnwO5sFv30zU5TIBxzC9+AUfTcMKqD6ZVDQ8fGvZyTe8j0
	l9I01Tn84VvmtT6LkpSzRccL8RZ7ufW7619ncKlnP2UUHefYRSfp1D5rgQcaGkSv
	aT86WU/PP+MUzWVx526bRJt4sfdX9iaxjMgcPiazyxNnGyIHEXsRQ5mtHQIvIV06
	YhCwxiCsHsH0zGPQavn4ccYKouL6LMEjN7hg8k1seu/hQNkT4SX9p/RpcF0okiPS
	foUowAjdtVI0ouAkGy1eDwyDZXSBIZ7wjH5+hqFYENhpp+mR26yLsk+h5Cw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhcvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:02:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ba9c366057so7486615b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949376; x=1768554176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4ucWhJ3h8WTC/Vx88wr4lDxFFX8PD/AphAsZy//mrg=;
        b=B/4EWNjRp1JXs/64pUDRmyhFWPmejWdwUxDkpIqykMSD2pkrqd5NHAsajQ7OrXuqeR
         H5s9zvOAJPjGY9m3rSp9hn50as3RHr6bfRTLJpbt80uTpwXJO50RceCDbVm/caqQ07p2
         hfbpwNB7yfvMmOpuf3XazsfkUKoxpMEvjm+Y1+wYSrwUZyN6eIHAELGZNf2KLD7MB58m
         wlHWm1L98PxYh9RldVSwZxE6oLBe7zN/rcGmbsEOI+ufGTUtyQAjaTzkF3W8fxDSsoay
         wrBZufnk4iNYHsLJwS+Uvf1RgFwWVkPFQg4TV3L/xEALyeJhq9X+8HOAku4hd02GgFWA
         qnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949376; x=1768554176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d4ucWhJ3h8WTC/Vx88wr4lDxFFX8PD/AphAsZy//mrg=;
        b=MjSzzMKerqUYkkiVJXzajdM2IqW+joOvV37tuww7j/z8Edizba2MwTcjC3hbdw60si
         WUWp8HG1+ATFWTcQlgWXwG2cQVZt+DHPNu6KQegGJKskSdMiPmsYh/JEwh6LINSrFyJV
         GMUScoKV5+Xa9DxvRhabrQ8EnBJO7hq7VhAArY46+6CD+KgSWdIFfbMkYlS52UDknB50
         sdjDjj9wYIw61dbxTrTL70D0nOeadOD859q5wBw2aiiRZYDfTXwkJR4PTFz01NJSq0YF
         H7jk0OaCmKeIXhHpSpCKjCAS+3INeVm16oxaY91GfChoiOdTM4k9WRO8yAGuyt1ffGQY
         JQ3g==
X-Gm-Message-State: AOJu0Yzxs2O47FjJiqEclwfY6ChzSczg6YJyEfyUoUTcqx+8pjv/2//P
	ZkgQODzmSYHBvo5vVKIooY+zUMotSA5vl2K1bsxO13j8goNHTg81NlIDud+bvvE5CQGcHjQcMaO
	wU9i/voTxjfpaSD1BG7uZ6aGJt6JUELD8exPFZwaXUH3BBmugq0e//XdjQfyjnDvjfJz5tUOtGL
	0zBbI=
X-Gm-Gg: AY/fxX5atpTmnrDwwiWoga9SoHMMzgF5LA23bLl9yMAAfwsXndmHDUmq1wGgQc4Cgb4
	+4iwwhKsb4aDF40xsDWUIkoblTLnNYieIK5TKHCYuAsdNPetz5C0tXuG/avkWwhq389gpFKz8+F
	TP38tcptsnsV+y0SiWqqCAqRsh9n04ukdkP9CAIZwraMcf9Q05aNgWsVbwZSj9eVxHA0Xbr6fv7
	0gSAhsUmLLc07O/v2BUQSNW2Mbj7rNP/Tqi4koOkOuemW02tgq12zPojVI1bUCA9b+JOkkPNQdg
	XNwS0O1sT37DJHS9UzMSTfpp64GLUDDwZDeXrQn88T6sRHTAzsO4UQPLgE0NttFx17lwCWWXh3W
	4I929yzHzaWwtG3pzXc5lrzDU3neLu9VWE+rxoQb3hCVf6FlU48zLeFYoCs98zrY7d10KiNRFT/
	OqG81wY942M9JQ1RNbMxhZunQ1vc4K1FkOxA==
X-Received: by 2002:a05:6a00:909d:b0:7f7:4dc8:55e with SMTP id d2e1a72fcca58-81b7d8621dfmr8786982b3a.7.1767949375605;
        Fri, 09 Jan 2026 01:02:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7zW5d+nSu+0wcfE2eze2NWNEmecsW0E5hntD0qHwPd/5r9VK82uccFBhoCMXa8NAbj/Emew==
X-Received: by 2002:a05:6a00:909d:b0:7f7:4dc8:55e with SMTP id d2e1a72fcca58-81b7d8621dfmr8786945b3a.7.1767949375086;
        Fri, 09 Jan 2026 01:02:55 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:02:54 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 05/10] riscv: conditionally compile GHES NMI spool function
Date: Fri,  9 Jan 2026 14:32:19 +0530
Message-ID: <20260109090224.3105465-6-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960c440 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-FlRX8pefk0TmyAjS3oA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: AlQ9DGEQFmXRqaVKKtieyt__wtoF5LB5
X-Proofpoint-ORIG-GUID: AlQ9DGEQFmXRqaVKKtieyt__wtoF5LB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfXz+ILCeY6Vifw
 zwS8eh6Ak0wyPJs8448yOz3xsdyfzwbFMI5nkItU+FPCQ73IHOBho44Dem6ubAwQTTIC+ud+7gq
 BJ37D0ICKDwdaUY3B8snJ5sJdzNygYxOcYrEOn2MV6VvD6hslCcXTsrmnqk4oAh5zqF6ydRnZse
 wYX5bGtfXiWQfxvraX/0GNAyFIwNneMS7ryLhEfQS+kSkSJQ8TPRZTGE7mQYjEqRJJqjcu9MK4F
 0LW1bCDWt5Syd00zi50DP+IJLMJiHnLXaMVMeVfwOCUnB4ejjqU3TjaCSdpgrFY8I+cBfEhPcxN
 yuPdhJPDawzWI0P0hY/SOjjfzKFUCmuag2h3LofPDB2I2og9Pn86x3JFFxVpWKH6xTTllbT+PMw
 lZj3MZLsxOwPdu0xRg8TqGqyIVRALbYSU+7bp7SZnkPP8/j7eHO62iJ+ZqGtW/iMSduV4gy+E/w
 yUcn4IunlVD6u50yArg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010257_204349_B4C597E1 
X-CRM114-Status: GOOD (  10.61  )
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
index 0dc767392a6c..6fd84a1772c6 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -1387,6 +1387,7 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
 	return rc;
 }
 
+#if defined(CONFIG_HAVE_ACPI_APEI_NMI) || defined(CONFIG_ACPI_APEI_SEA)
 static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
 				       enum fixed_addresses fixmap_idx)
 {
@@ -1405,6 +1406,7 @@ static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
 
 	return ret;
 }
+#endif
 
 #ifdef CONFIG_ACPI_APEI_SEA
 static LIST_HEAD(ghes_sea);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
