Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DE9C98314
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IgvkTPWqApMjtXsQDH9yeCC2cM/SzK9pyMZwpbQIL98=; b=cxU6bFZAGxgnVZ
	mC74SkWWOwrHFv9W7hDptyj5VLqO8hU5Pcmu4E6iiRygvfmobwpNTnzutaZoxMy0F7mN4WTzoy8n3
	quuZ8llSwZkaeXbcPvjhlJPRGkAEfqY3/sddVbq4aysaiBokIDq0JNJ0ZkvQrXfuEZEtpTAAChuTg
	8LWTA759Fa4jDhOKJl9TeKP8BBR30u2SkxQSWEgPwj7+8cPaSoJcSNjgyA8PWFyG2dIEUxUrqOKyO
	lyPD3bbkJm3Oe+lafG2vaEbsemAWWI4WMI2GRlJquFZRFT9qp1upMbCiFET+C9W/9Wynliely5NZm
	rL9gCc2Vr8mVD3PHwMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e3C-0000000AJnO-04ax;
	Thu, 24 Sep 2026 07:39:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e25-0000000AJOr-07DB
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 07:39:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eBkc1147792
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c4sUVCmmjjo
	/P0eMok8JUuO6sZJCdXw8PrIwaTMTfUA=; b=ZBLfErtjnHbpJBbL2C3TJnOe6dC
	rnrCo7Njc0NBxWlfBgH3egh5mSCMfCi72t6i+zCk+AEp711U7KE9VOV0nN9PzMY9
	HgMn4Drml+qLliqS3z5jQdWXo5MVVXhhS0Jg2sAgVWbnylsdfmUsGaL5n0jdEeWi
	wJYEJDAelI4PCLyCrbPjyk2b242HOqHdau7MfxrctdkRl5nNfAS49wyu+g9klAib
	88w7retfxiU0dHd6Zrywd6pZPGn2ZeQHbLj3qH/4Ip+S7vfekM6wcUfB0KgEjVxW
	TCChsOlO0SekmYqLNZjo4QS7M1DfHcTOUgT4hlivSPT/puQ7W7w46YDLmFA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrab9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:38:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33bee712354so2331178eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 00:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235495; x=1790840295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4sUVCmmjjo/P0eMok8JUuO6sZJCdXw8PrIwaTMTfUA=;
        b=ZYtri4kmTTCWXYGFUHgET59QZn16nU4eHxISphNATPwMEdp1oSpoDBMsEHzJ3cQT4q
         Ki1IXcV9TMkkMHk4YIDE8tN7SUpy0MKchlBiCFpV2QmjZSxS/KESR4x3dUdC6yKaSwj6
         IYMvG2E28fdYBq71M4DqTtUvM8lH0t32Wm9wQQURbJwXfVe6VQqIArfFkifSt8yNj+dQ
         WdjQqIn1x0tzxtsLq/wHTiyBNaSXqPJs+zrTEkPHoqrkEnT3dfKcxoM4rZUQ0L1IvCdl
         B+QLHezFfCyWYp9nctQkVt4+LsZSp9QqHSt9sICAO8HfACFmJrgaaDx5FwbyTC5SP5OX
         aKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235495; x=1790840295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c4sUVCmmjjo/P0eMok8JUuO6sZJCdXw8PrIwaTMTfUA=;
        b=bvYHDOs69rDSShOovIh2fNo7S7dDSo90TI6lWRSJ7Gfi8B2a6AUJuaE1FTa1OyyucV
         rw/9Vi6mee3mA/UFZ+cRAJFg8+fp6zqde4YK8VMkAa7PrvhkjKfzgHIRpiXHQw9P01hB
         i/8kG5Whidev/6kyoE7X4egSaiFKR0lOsUwLFr+HaLr1W6v+FReb36QMz6GP64LrqmDY
         MFAfuK6HjW/Z+82tRWlTIN/9v3Uo3nEelEJbjW2cFuCzaxjbaxRsk1Qx2tNfpBmIcSWR
         qwWow++3o8X6KNE6Kx5a5vmMc/2qJWq3RbQZSzHUO7UWOlQPi5ZueIoL9Dm/1A0aodwd
         iwFQ==
X-Gm-Message-State: AFuF++ksaGV0ZBMvq3IwV15OYVvMWsUFxN32nNp0d7y7OXWHMXnSik4H
	0d3+Ms8caxlDa9DS6XQw6Ka3Z+cyD+mBTg9xQ3BsH6vUhHPAILHSTAsDR75U7YvG9mEeM0wo7ee
	ZZb5wPqAZPJAfimwoXgR2gMgDZTd9UHpfufLD0YvlRMxMr7Dd28mtCtme0XbViWeYbEenWdzwge
	yeJ1M=
X-Gm-Gg: AYBFou0TPJAGsdP4AoVYP2mwhL7nXLn4fy7xAJiW/WHRBMnvsdVY7TvBakMGJXTruFo
	DKIZnBRKZjaK1Lr+djyfUr7PEEJ12/j8mRj/L/ZSYqoaAo6vFAtQYk5KtYylp1pzDZqF/PuogLe
	Qf/oyWpZCdnpLNR2U6/UrchBmc+ol+bYeWubgy8jRqkjhHPLvFBl9Gyvhe7TWYTF9P1+kM22M/m
	54+xaC3X1usuqCgYPU9zo25EERepgQpdfjhrODdf7T0lNef7mWzSbbqdkeXEFzOclB20ZpFBdsb
	tknbI2WguV4rxBS8KRFZQfesjxXmguKQHtmsFju7TQbHA8/BT4Maf7UGAua1WxkPRMkbnsZiMev
	D65pEMMGrY4Y6RritYgNaVJzRb+v8otXT6CP/Wa/J64m7ZRe7LUvkyl5hZs8nT5O0pKTAIBLZcd
	4HtOi5ZAz9AI4Hgz3O6xS/79cp
X-Received: by 2002:a05:693c:821a:b0:33e:699d:575d with SMTP id 5a478bee46e88-34003ca6caamr1230461eec.1.1790235494693;
        Thu, 24 Sep 2026 00:38:14 -0700 (PDT)
X-Received: by 2002:a05:693c:821a:b0:33e:699d:575d with SMTP id 5a478bee46e88-34003ca6caamr1230426eec.1.1790235493990;
        Thu, 24 Sep 2026 00:38:13 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:38:13 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 8/9] riscv: Select HAVE_ACPI_APEI required for RAS
Date: Thu, 24 Sep 2026 13:07:13 +0530
Message-ID: <20260924073714.1650588-9-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX++kJkl8dIEVi
 nLhVVNo7L8VPYplB3ccP1wMc3wnq7iUVFv6uSTsXsE/eAhMc5ZP5cJEZUT1DvcwheiAXogyeMrX
 HhgfBzzxhu5OJ8JjSND7Wr/vgYM8PvSSiZLR2Mi9OSPdiSaGsx29JxcYwgQDfIoSg99GP5X9rfD
 8OTbQhyW9GFgFISdF0Z/6W9gJWx5E15OMgQ07HWhALTHkdX0GX7KY+U/74pdUIN19LwfmwqxPOP
 xwU84dy2fOgSL4rhymeB6+Tv09thyS8JBcdKKyI6+xeNBbmDlW/makhadlwhIocJDTSAvbgOXfK
 IfRNZKNccULCYkIReX8uSS/9k+55/GZv8Z44RQNA1r8pytHqLR895AsZxB6Y/bt+HrgV1sMghMW
 lmof6kFl57Oawo03vNK3+0lAbmrYH2ic0Se2u8bYtI+x2YNk4k4FRJ+CNl/VSSUN2m2374hmEdX
 QvDt1owWXw0aIR6tVHQ==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4d367 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ctgbmQax9_dbRqqonagA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX5k7NvoNJRZRb
 EyCck+A5VXKj7jBBQoFARuzGW29KQhJ6TyHUJOYaSWbJcQOxbV3w8QrRrAdAU9cHvB9ZEhKvVon
 89WqvLHt6uYOg5VXaRnwCVVcYp+x0Qk=
X-Proofpoint-GUID: MC4eHTL9JzplXruNvAQX238xWtUItxOl
X-Proofpoint-ORIG-GUID: MC4eHTL9JzplXruNvAQX238xWtUItxOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_003831_585775_C18214E7 
X-CRM114-Status: GOOD (  10.98  )
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

Select the HAVE_ACPI_APEI option so that APEI GHES config options
are visible.

Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455c..9608abe126a0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -191,6 +191,7 @@ config RISCV
 	select HAVE_MOVE_PUD
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
+	select HAVE_ACPI_APEI if ACPI
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
