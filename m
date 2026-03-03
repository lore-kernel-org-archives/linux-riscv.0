Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF607E67A69
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/WjJQtnaz0m+Vhr2f7JhMZ8UO4Oe3BO0hxj8wq8P3bk=; b=WHDp71lb4gk8yr
	8quSU5gXNvmBbpA3Yc1kmYxDmmrIq3YFuiVlMPk5dA53nui2ti8yUkaz3zOIAfE9boB/WpS63OeYi
	8KSs3Ag6x+DL0f5QrL5Wq9khmIDxJJF0S0C1J4qJXXxpXXOPwRXy6bwZFTFVkyo6kIHQpg7Gl02dG
	P+7GTMdpKJ1wSlcPe1ZuYBQ2G4zUboQ0LHfih9UzfD5+u77BpwVQce4rO/y70CcYrPA/9NX9fBE+2
	Pw0RMBsi4XCTa2lopZM6jU4NWVfmIc8F7is6Q8MQNPMwvNubT5Qlc8RXUeVxrK03KDdmj30FWpstA
	cUPv3FoakfmX3CiWtPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJ3O-0000000Eahf-0NFF;
	Tue, 03 Mar 2026 06:16:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJ3L-0000000Eagm-2gaY
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 06:16:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622M3Llw2048854
	for <linux-riscv@lists.infradead.org>; Tue, 3 Mar 2026 06:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:sender:subject:to; s=qcppdkim1; bh=jBfJTiyHpDNC9aAf8vmH+NG8GrN3
	IfFl9hSg78Pea7E=; b=SY3yygMenGp7bzTezkaG5EyOZObt3y7qa6ARKasWE1bI
	0WvNrfVWVFWznlyrLf9+BJfL7peFjgB1Fh+1uu6IR3hIWMhm2tdoJWV8Vz4KXdXP
	eBIHJpw4TDNhI3sEXOICzTIYbJpdKg+KB9vvblyHs0PYe75m+mJgFERClA3fWXaY
	i08AHj0cYej44zSoQD3cnjDH9pPH/1BYJDfgC6oqbm/icCgpusRzGcFqksSnDVaJ
	BAZif341A/eNYm4OSGDIOlJwXq5qXn4bvlyVIezAziNZ4b9qo35o+v4yBD1MN5/k
	BqJO7DKwCrqBEFzpWnsvSTOSxywpXnkpm/5kCaZMqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmftthx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 06:16:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so3447199a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 22:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772518576; x=1773123376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jBfJTiyHpDNC9aAf8vmH+NG8GrN3IfFl9hSg78Pea7E=;
        b=Puy48aeqQlMv8E8c2WnL7zLxGhRJqEcJ8EpvTxZoLEGVnBXp3pJlj4z5Wb3uxJbdXA
         RZjc4k6rkFJg1OyXq9odBWmUcNkQd8Mo+y/juIu0U56fQh+BzImZBUL+gcPsh5M9uRzP
         /z0mcx/TCSKhYreu5Id+hMGmgGH3YjA8BjkGf4kyqqZDmBtsbg7GJLnTjM5S86vzFL8n
         UkLwewjh7HsHQlJHWgMQ0tOaMxpH0mWv4LayubYmjZwUkC2h3v28bpnoOu5pLPd8ID6W
         VDYpAd09oKR6QUPldjsTxr6RiabbCp25AIaHEZws6YMiuiLHtEL//8UPTehbbOSTbRv1
         6V5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772518576; x=1773123376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBfJTiyHpDNC9aAf8vmH+NG8GrN3IfFl9hSg78Pea7E=;
        b=o5VMruBYMermq1yHzH4hnmT4Girr5rf4R78eAztnsAhkAd4GavBgPtUnUeqpwJGtN4
         UeIxEUNrymeSUDK6GRZc3CMgXv27o7dwuhvqnU29lIYTcPnvJoH287BjHvpf9dH1y4ub
         PHFLcdTC2Dym9w0HCUhg6siZkGLm7d46FbVIb8Rhe3MEftV0pLfWivm6g+y4VppGBkUS
         lllIb8QmwMQgTJr0V6PcrwR/rgN3XwdReuJGoHOVq520N/eraQtdy4ZR4v2oe3FivJz+
         eTSWu5A1T0r1k9f+KDr1WG3tTm/6OwZQ85BGVgDudxPep0T+d/NFDFdUTPFGeDolCSS7
         utKw==
X-Forwarded-Encrypted: i=1; AJvYcCX1pYSFCX7hcwpTaTzW9PwZ6jrE7RIuyiOuWBOXyNQOmKnsWqbJS3VXbW1IIngPI+xJ3mIh+KAocHblyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzPfjMGS/76FVjoUTBYCbCmpZOs3/0ru+tJ0AtOGtsdzrm/r/9
	WXiGID31x/Uymc/ADniPtFqqE6PQgsnS5f8C3wWBnD8X87bhGWdhqyD6jkhfZrb6ZxD1L3BIfDO
	tJ/InOuVbljm2Y+PMPE4U0fjx42U7GiZy/H5a/GhuGZCSFD6ETcIRPizNuSNep9F3JC6J/jY=
X-Gm-Gg: ATEYQzyOJeMu2XYVzNuRWlYMulZ2Zt8rDM5AwnFRg0fYGUQoxCSfPrSNZca74LQg8EJ
	zpX2aFcg+4s0aXCgqHSNwCLFbiVbfdfJyrtQ1svC5Tq9rJrgQmFxAtU6vNV3pi2uDUK2qz8SgZ1
	M1N7uS4RewHm4BxgiLeH1T3F6iLZJtM5vWE2qFxVlgrz0BZyvX9NiFWE+Qm3SmRjLyUEgdaMh0i
	RdbAprRwp5aAmAfES3Reuf6WQC6oD1BZP4pvfkwxQrNyg23NqcOFhhF948rlE2aEohspPx8IlFO
	L7I1Rw7F+tuf53R9W/JxT6Hf2EHQBNQ9y12NWqh/2mO8Bb/f1ItUKcdJZXjcltuXIMFNau+fS/H
	Ywy7MerNlYJHbEZYhB3t/6qef1ahwWldCd8oue0Ugn3IgUuS2tCQK3ALc0ctjFiZaIKDOGIU+nW
	FWbA==
X-Received: by 2002:a05:6a00:13aa:b0:821:78ac:f197 with SMTP id d2e1a72fcca58-8295d99ff4fmr1205382b3a.23.1772518575874;
        Mon, 02 Mar 2026 22:16:15 -0800 (PST)
X-Received: by 2002:a05:6a00:13aa:b0:821:78ac:f197 with SMTP id d2e1a72fcca58-8295d99ff4fmr1205358b3a.23.1772518575401;
        Mon, 02 Mar 2026 22:16:15 -0800 (PST)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff350asm14132649b3a.35.2026.03.02.22.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 22:16:15 -0800 (PST)
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-acpi@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Anup Patel <anup@brainfault.org>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [PATCH] ACPI: RIMT: Add dependency between iommu and devices
Date: Tue,  3 Mar 2026 11:46:05 +0530
Message-ID: <20260303061605.722949-1-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a67cb1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UhKKETOMA_ZNL8J_uLkA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: if4vQinRWJ4wiZYKd7nGWQefpfctDCe2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0MSBTYWx0ZWRfX/KbIAJ/mpjed
 u31Ejci1fK542Yf2bKyKg+EPuFPK1b4gPadBgdGq7+FTeiD2I1i9xQZeRoqng0Lo812YNXe/XKr
 0zLD8cxbfHSSB+9hGmTyATuDGBuHSVwwaR8xpUHfryd+Rd8/EMOgrj9Odh+br5dWTS3HLU8+eS8
 YE3ixXWAnHO1jLGrh3awG64ZNANSmXd3pMSEif7ayxGG8EYodVJhEQG7CoXTgvIWXAZHtD8E9et
 o60RNv05c17TaKbyrPNx4NOYb0OIYyaKD0NrfW9wY7/Xw5xQRdwMmR41i5GzLXqBPCK3vuzeRn0
 qPK/BGJN8ta9jLI6ZZ2h63B9gkI32ZeJhCXQl/kwz/u7QvMRlLQecEdkx83UZJNjQNib77HR47R
 2RkU9h2wVbb7P2+dlqoPGC7SVLADZdmxXAZSNSQ3QK2P+8ipOxnXp17eie90sEAsq0vJDNnsZ+5
 EI3qqt55v0IGq5HiF5A==
X-Proofpoint-GUID: if4vQinRWJ4wiZYKd7nGWQefpfctDCe2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_221619_800303_2D00823E 
X-CRM114-Status: GOOD (  13.41  )
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

From: Sunil V L <sunilvl@oss.qualcomm.com>

EPROBE_DEFER ensures IOMMU devices are probed before the devices that
depend on them. During shutdown, however, the IOMMU may be removed
first, leading to issues. To avoid this, a device link is added
which enforces the correct removal order.

Fixes: 8f7729552582 ("ACPI: RISC-V: Add support for RIMT")
Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/acpi/riscv/rimt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
index 7f423405e5ef..8eaa8731bddd 100644
--- a/drivers/acpi/riscv/rimt.c
+++ b/drivers/acpi/riscv/rimt.c
@@ -263,6 +263,13 @@ static int rimt_iommu_xlate(struct device *dev, struct acpi_rimt_node *node, u32
 	if (!rimt_fwnode)
 		return -EPROBE_DEFER;
 
+	/*
+	 * EPROBE_DEFER ensures IOMMU is probed before the devices that
+	 * depend on them. During shutdown, however, the IOMMU may be removed
+	 * first, leading to issues. To avoid this, a device link is added
+	 * which enforces the correct removal order.
+	 */
+	device_link_add(dev, rimt_fwnode->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
 	return acpi_iommu_fwspec_init(dev, deviceid, rimt_fwnode);
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
