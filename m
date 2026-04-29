Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62611FF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 12:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKZU5+tex9xJcWA8KbH1kVEZLG7xFwnfMC1jz+Wb91M=; b=RNnzli316EQDW1
	XFR6+a/kDNjjl7TVFylDog+ldOibIQ2OPq14n1C5wxUYteLNR1A3ymzZU9U7ho5HMh3sVZ/umJtot
	XbY9IRqMJly65j58LrE2YYXbt5Bs/KhWud8tOXxBYZ0AZWx3QQIo/FCYRPY9IPtnOEMqXp6ZJS3E2
	qFIaf46d4bqUNe3PpaGKIasI/hEpfa4aO9nFy8B/V3kPNo/dCx9+E94pZF7HSfcL7Poq9IU5dSle3
	/6x59ejmWuRYpt5kM2Y8+f8r15xok2g/bwC/Ur/JuaT0692byk+f+6yX8Sl5B5npqdl1Yfj0gnMp1
	4BwnkuAh7NKx8Ez5QyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4P6-00000003ban-3zEl;
	Wed, 29 Apr 2026 12:52:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4P5-00000003bYY-0Lzk
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 Apr 2026 12:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+jG25hwzYFEdW4tHJTb6Enm9wZPCo8BV4CKkZSIZ0rg=; b=rK9hHKx5Y7HZ8IBhm9b3qxqeYP
	943OWF43EybPS0hPTRagFYiCPbO9WtjPl8eYXGYtSfZPej7HUOQUDWHfqroQxxYo4j50ELubBGRX1
	uhJkoC3URVkBjleq4+FF24CMIVakf8lCJJvdDq0eHU1+Zb2JyH6x9eHdUEX7k9n73itsTF5+1NTTQ
	bDXRsqJGCDbm1Nr26vNjnX/uYPAnHCCNFUaYLKcqzHi1rqI0wOQOWwe7Jh27F3HvBG3EEVr20cIpS
	72wsPbU3jjhEmJ3vpdl75a4PVOkA8yJZRJnmuJj8eJK9Plt5IrBmMEtHGFnqRSxlhpahg1GIVtr3K
	x2QGQLYg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4P0-00000005Jt0-2mxK
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 12:52:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q74s1721242;
	Wed, 29 Apr 2026 12:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+jG25hwzYFE
	dW4tHJTb6Enm9wZPCo8BV4CKkZSIZ0rg=; b=ppK8rpbWA6SNAwjvW+C/w5RQHw9
	7Bzew6dOl/IndnaqaxGl+ey6PWcyW757kohMt48pL3v3D02Fyv4pFdCT9TlN+Djm
	fotbZOClEkiWaS2dO82l06BmL5X4xjwSR9YRCroN4YGM6nV9AlUWAwHwnR6j08sA
	oLhwAoEFxDdo0QtMwJVj7rXsQlh789PUKYn+uenDWg3OB8VbozsSt+ZTroMzHvyT
	hIkWfwMn0BLAHytoCzgZpR/vXsRlPI6hmifYdkd3PzIYADyFNG1vtgcqDG7H6XGz
	vw06KKcVbw8Bxc5W6MENX2SAXCjNpARhSQlmTFfv1QkCUCTn0t9b0egkhZA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7322yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TCpb4U010776;
	Wed, 29 Apr 2026 12:51:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds65fvr1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:38 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TCpbD5010748;
	Wed, 29 Apr 2026 12:51:38 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63TCpcYR010804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:38 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id D9F0B22313; Wed, 29 Apr 2026 18:21:36 +0530 (+0530)
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
Subject: [PATCH v4 12/12] MAINTAINERS: Add entry for RISC-V trace framework
Date: Wed, 29 Apr 2026 18:21:35 +0530
Message-ID: <20260429125135.1983498-13-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1fede cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=W-_n0kkjAAAA:8
 a=JfrnYn6hAAAA:8 a=UgJECxHJAAAA:8 a=cfWhVP6ADMLbqTyXlKgA:9
 a=qeNa2pbTr82C0GpJEZFS:22 a=1CNFftbPRP8L7MoqJWF3:22 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzMCBTYWx0ZWRfX4lDEAoF95WqS
 p/i16/o3m1BRsEytKqCIQdhWUsLESZiH5n/eTfKoiUzDKF1z/584uVG/qB4rNNJwBvX47rZ8kH/
 cHoQyVjF1oq77rAEvAIi2nHNtcLD7fjQYQqUGGXXwdmpH8syGG73vmFC+nx92xQzqPl1GP2p2+k
 FoDTNyMid/zKMZ78Z+iv756pft3Exz3O3rpzGBMIcGqsSzhEstiVUKiia27XMIl348vtsX7P+Ex
 KcT3nOhaj7wnozxE3DFJwnT8r1Req+IaIPDRwJm7OAqP+dLFU7LlOgH755GzCAtXHlfi2r7NloO
 XvOYri9MLtgLbl4jIZyBnXu32ykdgJb4uPKRJZs3t1pxfSTRJm+dC61SgogQ6MfETCh6vv5uPRY
 R2rv6IPPtt+FUJb9njmuBSf5T7TkArQtzyZslbQLTkmUuonslE0SnviA05VgH1AMdehS0rTXj1S
 PUhilOgoAGJRp3jSeTQ==
X-Proofpoint-GUID: H2kW0fIPXQuBJTbeDzHbl-Brc6ph9xWh
X-Proofpoint-ORIG-GUID: H2kW0fIPXQuBJTbeDzHbl-Brc6ph9xWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_135231_041739_29E86BB7 
X-CRM114-Status: GOOD (  10.44  )
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

Add Mayuresh and myself as maintainers for RISC-V trace framework
and drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bee6eef2bcd4..352169340ec5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23059,6 +23059,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+RISC-V TRACE FRAMEWORK AND DRIVERS
+M:	Mayuresh Chitale <mchitale@gmail.com>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+F:	drivers/hwtracing/rvtrace/*
+F:	include/linux/rvtrace*
+F:	tools/perf/arch/riscv/util/auxtrace.c
+F:	tools/perf/util/rvtrace*
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
