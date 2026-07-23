Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EC6C531C7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 08:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzZJgRo9oxRFUScNV5jKbVIl4o9W3sQcjc0AN+nULTU=; b=zsU7C6AIBzO6DG
	2UBKp9Ptmvwf9lU0FLkO72hWieZv50zU+WdNJ4t39nrBxJ3VQ8ZPs8JBEXoX+NQzeG4FhQ8bN0xF9
	rqmN8iEsdCGDgb7hPuC0u5THHlWxY/WzoDWVjYuFARg5AzZtHcHSQ7bRDnFB2ojX00Sc4q3MXPj+Q
	1fCSHPg09deVWlA/uPd6ENH2ntEJe0VVnNMSpBKBGMiaVdSgh/YnSBlG0BlwNBhZY4RLXypZhcKiQ
	QlhPSNLUNLPWFX8/rT4fhSgRzSE1P8kUhiVceTWqQDTo+UsXLi9LrJewfqYZSuUBo6NJI4qe92Dy9
	IiiA+dKSYIOscVYQUJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmp73-0000000DmQg-1xgg;
	Thu, 23 Jul 2026 08:49:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmp71-0000000DmPC-1mDz
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 08:49:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7Bonb3411100
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 08:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wOcPZDRUlYj
	BEVpd9CAl34xvqBasHL5p9oV5/4lGuw8=; b=VoyKSaPudSvNyXbR8qQ+QilLB2E
	vOuSnqQNq+wFYHDbgkjB71KUeaouLX+T/aRY2JXgLJZfuty/nPGl2O4e6Oinfpsn
	8yKA/7lWp0VnMJPOR9UfXjEZgQ2uBaOkTJGfN9/IGfKSG47M2z3ZnmEgHzaK/bkx
	wrLxGlXDcJMAoX2HnMl86T7WpbCpHxJQfBCtN45WTokQ7F9jZAIri/kjvyXzo3gb
	Xe0r1Gq9cLfmD/LC5rdtj/EDsZE9gfav92GfDGBtJMmrQxCciwxk/oGyJKmWgu/n
	+gwBabriSMzb9inVls+mCZzhZ9XS4QOGtkaKjVdc0+ijFMnyEnRMa23jSng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayh95d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 08:49:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38eca0a80f5so238540a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784796541; x=1785401341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOcPZDRUlYjBEVpd9CAl34xvqBasHL5p9oV5/4lGuw8=;
        b=h9fQ394XhGXq/YYEIfFmMuVQwuZxAOIWsaifn3ibGWtN9whWaHEJLQBc79Gau2GQno
         S+hLHRUAqZzgnbYkDMiJpX0zS6oVYDEgRQzPyDrz5vgc8wCpJBTXhM/RzVMEl8w7zDXC
         z48CUZVVAS767u5kkF0FHFZ1d9T54Z7Fa0+2+vymUFbOgUAF9kRmqcLQYYYAHzGY58pU
         yeBtJxGwJhHA4yYMtw1dzbW9Hdh7TW9VOj0Y6cFLwQhhHMz+zVkV8NYn9g/ysJRbzCz8
         d3lj9yJQFlHJQtR+GcQDoePyCJd3svJrYtHnfpTps97v4dgO/Wnfd4vquAopnCWBU0zY
         lOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784796541; x=1785401341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOcPZDRUlYjBEVpd9CAl34xvqBasHL5p9oV5/4lGuw8=;
        b=BDcmZphfb72tO30RCMql9+9ttiteeYjTvQyyFEFgeImyGfHHr1/ak3oWfisnERsjsS
         J525uanCyz3g6x7aTSudxWImkekgLYwiyyPPhMpHeG9yTqTSFf3m5V09ZGF1t17HFY0l
         cyy2/MMGnDuVYz/FtBgQjKgbuQYoo0b8uoS2IJbHHxS5+t/kfJB+VfQc3UjDnIt8wIZz
         I20O9YC3PgP5s951DFE/QBpx6v416+5rp1wbXzFtVv/mdAdrwnNFPUAWxbjwxmK3Jk29
         5VOfI+xy5AoXD/053yFk2C5eTyiwqKMh12p8QG2SHStqHsDxnWewT6enaeNyLh+Lqs/y
         vNUQ==
X-Gm-Message-State: AOJu0YwYabONctAAQJp+ub8XXKcFiOhV5SdN3PNxMteT+EhvyCFwnSLc
	0d0kjTnLlDiL+Yu1XN9sZBvSGf4whL+eIaLcGCnDw/4ZnR9S/PoALQtA6vuLaYNCrzUgADPzRrE
	jqv6OVK5Z/w+BH2NM5DUlWdBPwWWXqU9Sxf48NcuNXRLagVvI5MfJSzIB3wq0AFZFPvH9u2CHh8
	1bbuo=
X-Gm-Gg: AR+sD10GHfZOmcc7yI/zIC6JlLLTzAfBTsU/DYDXNO/YcKn4BlW7T+GFmQk55JLfjpV
	SDpZLur7902XEfNx1G7a3po82HkB0Kd0tuZ+idhBxea4tFt4P7sSytLSSvcqXkDbsjw35yULw64
	guOxnDSw4UR4n3XH++oLZglA2xMR1N5TcSPnvp93EMcvnDO+AIL62DIRjjT50eHknUjSvL8tPJq
	6nl3RX4+vrp4bpNS5O7Siyk5oVvps7uA/HVa3EuQ4tJaHPNjMllscVaLYaEgy0MUMk7uq5b7vZS
	z5vFPdsNvGKtgoMdNHItv2D+GmPV2O94eWJV0R4Bx5L/IXMO6CwFrcTl3w9pQF03TlmsMbTCb6Y
	Q/rSR3Hd69h4FaOd9z8BuTNkxfiLI8xyRPfxU+deemMe474iAf3N1RzCbRzlAuxtjtZaMqegb0Q
	75sI1nPtZ6R7VMvSpoIDporcT9
X-Received: by 2002:a17:90a:d88c:b0:38e:7f52:c8a9 with SMTP id 98e67ed59e1d1-38ec856cf7dmr1799193a91.15.1784796541304;
        Thu, 23 Jul 2026 01:49:01 -0700 (PDT)
X-Received: by 2002:a17:90a:d88c:b0:38e:7f52:c8a9 with SMTP id 98e67ed59e1d1-38ec856cf7dmr1799173a91.15.1784796540842;
        Thu, 23 Jul 2026 01:49:00 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130ce035sm13852140c88.13.2026.07.23.01.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 01:49:00 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: qingfang.deng@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu,
        palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org,
        linux-kernel@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for RISC-V Debugging
Date: Thu, 23 Jul 2026 14:18:40 +0530
Message-ID: <20260723084841.2988456-4-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a61d57e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=8h6Es3YqzoBqtYBhd2sA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: YFMIE_qIfsVhKJbHwV_xlhCmJ-XbF1HM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NyBTYWx0ZWRfXxAsRonvAXP+Y
 A8D4ExZZWtpZUWBvU0LwBJbLcrtx/B+egwQxuWSj0vGn/Ng8BbKWBTBTwEwaIIHXrVhwIZT71/c
 oeJLWvk1eDvzJVjk2PaYsqHXKrBRlz0om2KtjFwYyz12lh/3/1ptI9+ohBzDVibfP0zUBy7e18u
 AOMkSIXDL5O5mHFREKIAZoeuGb6SZ7ZLmyCK6creBdFm3cw9Ka+fqyPI4AB6PZJ9Le2V1IPVFpe
 FJokeLrv+rANOM/6KTOn9Bgl678IL0S5wMqmgFA3Nj4uMi0SFlKhHRmLozTZhuzGxHJ9hoPBGid
 qC70uH9jNEIy5eSOgRrx31cJgb4KxehPCHgXwyqZFdTAvmziE+vVHktuq/mkeLp3Wf4NwMQ7eB1
 fXMDZoMo1I1IJeBou7qc/L6XJr+7unTBpY2lf+dzZ7n6xRseJob3S5S/uWg3nc1jsPLcuwSUYqs
 e3ipRdHTBSZIaX6zTCQ==
X-Proofpoint-GUID: YFMIE_qIfsVhKJbHwV_xlhCmJ-XbF1HM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NyBTYWx0ZWRfX6dJwA5lPXRbG
 Gviae2k4ZQVwSZjABnOp4IK+PVR88iIw96wXJeAhzrBloHS/C/cYryFVMR3yVmD6shIOW5RSAKe
 z0P634zJ8EfBA6+HOEzYr7xug1g0RQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_014903_580566_F56AE118 
X-CRM114-Status: GOOD (  10.83  )
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

Added myself as maintainer for the RISC-V inline debugging with sdtrig extension

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..e7f29599221e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23308,6 +23308,15 @@ F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
 
+RISC-V DEBUGGING
+M:	Himanshu Chauhan <himanshu@thechauhan.dev>
+L:	linux-riscv@lists.infradead.org
+F:	arch/riscv/include/asm/hw_breakpoint.h
+F:	arch/riscv/include/asm/perf_event.h
+F:	arch/riscv/kernel/hw_breakpoint.c
+F:	arch/riscv/kernel/perf_*
+F:	drivers/perf/
+
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@kernel.org>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
