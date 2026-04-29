Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D363BFF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 12:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3mUG98VTBa/fv+joHf0efA5aLCuWB7wl/QWQlKQw8M=; b=vlUTQewfX3pnV9
	VxenLp2sO8JCqCi8OjV3dXe/JAhCxVxBB9maCNNfeSK7HlDszprayHwtaxwAjkk/4APCv5Hp9Xt+l
	qPA0SxUrG+vbuSgE2DAtjNiZrivTvZwvv9TJaSl/EoWaDqguRyoJG81KtlBZFHIekK2NjVfPmg8mg
	TgNRr2ZtEX6+WyoiDWGIJQEpBeabtS71+P6vB1+8/02DMAlEVIgMcz9jxxQlvOTM5xabT+rB2G/cP
	F6tlxTO71EOIvBHv0iM1Orpc1BKX4ISR5cql13d3P4sfHMp2pGMBxTIMMNxJzi9/Ty73bE4af/RS0
	+UdPcArYabBUPIHcA6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Oo-00000003bJE-3hJU;
	Wed, 29 Apr 2026 12:52:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Om-00000003bHi-1ZZS
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 12:52:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q4Va1729372;
	Wed, 29 Apr 2026 12:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xi4/W3hIi3j
	9BAohPxZCWvwdrGoIZDzS60/Qr+azm90=; b=Uc/MI9PgtGh773HlhoPIQk7jaLl
	WaxHKyoG7PsFVi1pX/ICDokP/XFFqedlyR7qwehqqn4DOxDiIS1GByLs9F7FrQpP
	RPEmjA1kD+06/TM2pjp7ZygLPTmbQ3eOgk6Oiq3WzA7gKUzSTnTGPLoGc9N+DCep
	vVkLMtpaqntwERzlJThTzuto627pKj5texauscRRuHNK3IoKXWBlThe9CNoswdrb
	8tHEK3sUjwZ2g5yth0pJfZ/P2RhtThr/qxZ6b8OZy+6VdIxlzQ7jRddro/XrzkJN
	KflGZwAz+kIoOAWu7k0Fb62Dpc4e9/eNl9bSFmedKp/q9zlSizNJWoCnzVg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5ks2kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TCpb4T010776;
	Wed, 29 Apr 2026 12:51:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds65fvr1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:39 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TCpc5G010813;
	Wed, 29 Apr 2026 12:51:38 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63TCpc9l010806
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:38 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id CB5B8222EA; Wed, 29 Apr 2026 18:21:36 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v4 08/12] riscv: Enable DMA_RESTRICTED_POOL in defconfig
Date: Wed, 29 Apr 2026 18:21:31 +0530
Message-ID: <20260429125135.1983498-9-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzMCBTYWx0ZWRfX3HmcdyJj6BVz
 R4lvylPa5Hy+pbbFqUVPOBD0WXkjOgrfgTex8cjUW31zpSXYidUaYp+hKxOkiFA1qNa3i3J2fx3
 QivX7G0b/3EK31e4fNQGa7Jc6dVmtXqwMf9/qLA6lBw/5e6SO0KzThHU72J2mf2vC/Su93Stgnr
 H23RQydZEYP74nfgA3mE/9Ph+i5IhEgrts/EiOvW11UVkL3Az+OpsJUFO8q7rgje4GSUOyH1A++
 RZ1XNibt1jJW7xA8RTj4eZSltnSEBennKJFS/psmTq6m5Wxpb+M4iwPohSaqdlZ584CZAYEwPU6
 2GnxBb2y4jg6Lvn+uyNB1xczjUdTkL8fnMGs5vM0jk710LB+Uhfuwl+lsZGbTxKa+FJWkoHLXEt
 rNqiwIGQSRpJidX5cMrs2eGKvi8aw+IHosTlBm4MpsDlloc/Wj9NTuS6SlFzlWuljom+P6AGz13
 aLyNTkDaLo6Euk+D5Kg==
X-Proofpoint-GUID: kQlEqspK7FwR22HqmrEn_6QpGFxlAjp0
X-Proofpoint-ORIG-GUID: kQlEqspK7FwR22HqmrEn_6QpGFxlAjp0
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1fede cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=bXOGUNLACKbNXswU7uMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_055216_567844_B6C32898 
X-CRM114-Status: GOOD (  11.28  )
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

The RISC-V ramsink trace component may have implementation specific
restrictions such that the component can only write trace data in
particular parts of DRAM.

Enable DMA_RESTRICTED_POOL in the defconfig so that dma_alloc_*()
and dma_free_*() APIs work for devices with DMA address restrictions.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 6f5343db1f8a..6a98d6dc28b1 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -306,6 +306,7 @@ CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
