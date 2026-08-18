Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5B4C5DF80
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lmnw/bkkYSrY6rh6VJr7hc71al/n+ghd0RDvN4VsKqk=; b=OA/TBItTgor5Ww
	fVzOYWm3PTVN9IeMly5t/WeHLqcUXwAgxVw57bmCfBlEwytRKfcIH3ihJd3+HlLeDbObbyTq7I3Rc
	e270JhSUkDaFdlL9wn/Vw47vmK71KynifI6hSAZzTSljMsqRcfzLxcMyyhsrSKD0DrdF7GOwFZNed
	srwKTOwUvkDtEWvmlg1esOHaN8abOsBdF9zC2v8AZIyT//YIEgSz/T61YkedkD3zY7n/9HE5m9VVG
	CWvJpCcpaL773T66yw5JxOwlN3OrXluXYyv+HjgMQ4S6JCha3ObVrrkkikSMC0HsKF0hWNOTQ+Rpw
	boHBZOL98fDYPAld1mjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG3w-00000007bzu-2pgQ;
	Tue, 18 Aug 2026 09:24:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG3u-00000007bz0-0l3W
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 09:24:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BLIi3703515
	for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 09:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mJn/FZa8W23PTaXnKMduvvzPW2zV73QGReU
	yurQ+/y8=; b=JO0vM+vZpMjE6IaAAGoqlblwJz8Wx6t3z/qfShkhn69GMeyQd0b
	uRedLudiZp0SAQjhRTXQY7FKNYuC5NEvhEp7iJl+F/oiAM1AAzkxrvGR7TX21LU+
	EdIop5mPNio5eI8eu74WBNHGo7VaBTUi35EazplSghF+kYEjoToG1dn+g9lDiOH1
	GtcPD9V36Dx7nvCixGq/lAD4tqY6q/wMyD7QtWWkVtKw7GRAImNEEghPS7KvI2Bt
	x16Kv8slelmYcWXVNbemBFtEE90mR6eA3BZISRNrUEUMe/FZOClJ40y1x2TZQFrS
	XnqfJ+BWYMFbZOWf0G51nR+fpmHN33E45bA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpsq27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 09:24:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907b38aaad2so39296366d6.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787045088; x=1787649888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJn/FZa8W23PTaXnKMduvvzPW2zV73QGReUyurQ+/y8=;
        b=N5pWC3guBXbhJZTLkCO86zE0sqxiZztkEbAMSWyUm7XnAvILxk+IRjxYZ0uR+8ZpOr
         6axlR9RfSfmzhcjDrskk5F7rbRN6+Ci2OGWXFFSYPEd199/Agzhe6x/kjcLr6JuzdFLz
         F9XfqvJkwcLUFYki8589D1DcTmKy0cZ65luvhV80dreV/Um8vZvt4/Tq/eS5/M2f9Aee
         WQ04R9nif72ErOyFqNYov0cYCpzzVxLW7RL0088WUvGMkKByoSaONbVoqR243A3Z2Sad
         V9k+i2P71VYUZPmhpdSKqM/hvxj6+ItfyP7WDxll5PJdLk1f8H3yFln7MYs7aS8d3SKp
         dDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045088; x=1787649888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJn/FZa8W23PTaXnKMduvvzPW2zV73QGReUyurQ+/y8=;
        b=PJ0NasjuglMSp4ARMsKF4HAnf5Zw4yEqRDtK+yzO0q58MJZIJae8s1EMpiOgpU3plG
         qVGYUJxzISKjGwFBO1BaTMVfszUECVjx/Ti5+rHQ6XVgQEmkWYf/ypQBIXv8ZxBFJKog
         hxLtzu5Bm5OQGcDKuREAIPq1fwiZ/Z4Lpu5F97+o7MOUWx/jHCvH6c9xLxf7kX3/UOra
         3tSULsS2Vzts3qnSTXN8Fh17pw3NX3UlwpwRJdoQs08AJJNdMlL8Ma9dKGwvWL1t0eDl
         FnTywPehcAdJEqrGBK2n902v0PRbJQikitGqTlt/VPXLnH1zC8tzq2dLv3DnfQ3A5XQ4
         gvFg==
X-Forwarded-Encrypted: i=1; AHgh+RqcYf7dTz4qjcO6znzs7P66oqUhNJhXkVYtj7AWVCkuSoTaBv7GvqAJpxxU5zpF8D0CBavlgn0W3PqnGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeIZ2s8GJUJwNwUMPOyi9dNt91xAB+NRKF3VlvOxTATCNYgC1y
	mtDtNJKv7j5hsiM0mIWmd2X9zA0ZV7uuQ3vAEM2xXKLz0G+9R+2bIJokjXaSqlS/g3S9JYRGv6f
	nW5FC4j6UEuqFx32iSe9dVw6IZG8+TJZuaLU7E9rdvYSiGP1S8JJEJa7Ao/tU6Sw0PdF03URK3O
	gR9Gc=
X-Gm-Gg: AR+sD10VAavUF955yhvP6ZSRjPGkxBb4ecTi6TrJZnh5D1oejB4gQd7WZxW6DM0uf9c
	wxOwxemjwgh4ujj+YfFNBSNaoqKtdFbe95e5BQbBykmyIaN7zWpkxRK6d4zvRSaEdzrZY35ue44
	fE2TLLCwoeWZxEKsQL6TmS6X21u3weccp+ZJv+KYPXDAWjarbiZNdQJKabv1Pw2lZwLmfCfbFeU
	PVcPR2jcPrNOeOACPapOdIb1mjZgYd0hB0ohZxkyA21Mc+xev5JLuLwwfGDwgvkKdbagBWTuCI2
	xQwlY502xRLWvBOr+DFAw7+G5FEGtaz4PSt5qpBib0QED5eUQMu8aU5l7pqFYXXA13QmoK5dp6a
	p6ZzRvRElC/+dYAJ1AW14/u832AKyiCr8buo=
X-Received: by 2002:a05:6214:5545:b0:907:c056:d648 with SMTP id 6a1803df08f44-90c4b2a964dmr83876666d6.2.1787045087870;
        Tue, 18 Aug 2026 02:24:47 -0700 (PDT)
X-Received: by 2002:a05:6214:5545:b0:907:c056:d648 with SMTP id 6a1803df08f44-90c4b2a964dmr83876096d6.2.1787045087340;
        Tue, 18 Aug 2026 02:24:47 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a31396sm10813064f8f.2.2026.08.18.02.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:24:46 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: fangyu.yu@linux.alibaba.com, tomasz.jeznach@linux.dev, jgg@ziepe.ca,
        oro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com
Subject: [PATCH] iommu/generic_pt: Fix the RISC-V supported feature mask
Date: Tue, 18 Aug 2026 11:24:44 +0200
Message-ID: <20260818092444.42755-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: 4Z8Nwa3v5SMUfN9rlHFu5aiAKvzkOUKj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2OCBTYWx0ZWRfXweTRkbcuq1FW
 32MtKvAo/Wb4xsZqmXsXYjgSrHeD43KcefX1ghOdYS0WK1F3o8cTxMgqIeXAKc4ImmhRLhIGaBP
 h2Nmdp302YplWlq5qsQHNtB1fGcofiYlr+6upzmw6gqaX19L7a8oAG0ZMuTXR+WrGBQ/MpAbrKW
 NkDecmrOxR711vdkwbK5b+jupBbKKGjmckH0mgtOZRmE+d04tfGeSBVxv3c/4EUuP9oAcz++9+p
 GQHL4s3O8e004dEZ/xiI/0bWyYm7lnpF7EBuRUdOtwJBjSNZwfRvWs49grwAJMA1Nr1E4f6LKL2
 dXK+WSv9SsYoBjryvnledC3qJ1Elgd+P3oSC27hJH6nVhmbYfi9mIeu2VdrU+TtXafgyV2zyNb8
 /4OhJ5q3a7SAin/GbFl3QcukspXj1gWJIypWmePNRgBLHr7Y/SnoyiuB2hV6pplLsTUlBafK8Ro
 MM5s1rGSPT+9W/d7NqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2OCBTYWx0ZWRfX8iAyXcBxyjoG
 cpKoGmrPM7pONGL5kazR4NB0lfBBkRzISgi+1XvPQ6WLjO0BYs0dADefDSeNqvlNy5g6UGTVoYR
 LmV40dHMBivqSXybY4zAFU6rYqZAcDw=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a8424e0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YhUPgLupSSQvV9JAn3kA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 4Z8Nwa3v5SMUfN9rlHFu5aiAKvzkOUKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_022450_339115_6C00D7E1 
X-CRM114-Status: GOOD (  11.96  )
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

The RISC-V format advertises Svpbmt to its users, but omits the feature
from PT_SUPPORTED_FEATURES. Add it there so configurations which enable
Svpbmt pass generic page-table feature validation.

Fixes: f196a8668797 ("iommu/riscv: Advertise Svpbmt support to generic page table")
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/generic_pt/fmt/iommu_riscv64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/generic_pt/fmt/iommu_riscv64.c b/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
index b18fc4d109f5..1bb74114fb02 100644
--- a/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
+++ b/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
@@ -7,7 +7,8 @@
 #define PT_SUPPORTED_FEATURES                                  \
 	(BIT(PT_FEAT_SIGN_EXTEND) | BIT(PT_FEAT_FLUSH_RANGE) | \
 	 BIT(PT_FEAT_RISCV_SVNAPOT_64K) |                      \
-	 BIT(PT_FEAT_DETAILED_GATHER))
+	 BIT(PT_FEAT_DETAILED_GATHER) |                        \
+	 BIT(PT_FEAT_RISCV_SVPBMT))
 #define PT_FORCE_ENABLED_FEATURES BIT(PT_FEAT_DETAILED_GATHER)
 
 #include "iommu_template.h"
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
