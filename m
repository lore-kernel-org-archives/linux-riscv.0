Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2755ACA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TQcP+QYSdqc1Ywf07PZPhtSiW8+bgcbw3/tRpknSbUg=; b=VMEEdQe+uvAfUL
	jHwUIVoEdZkh69Xj3eE2GVJ7BQHquf73xB91ya69y0RcS17JhzHadp8tZuLxISeaPC2gVKJ10hw20
	OCrwwjtvjA0MGx98/01RtDMhNIHtJeLZKTXxRF22k7UiOU1KVpBJ80a5W/Gb3uJn3dpV6OzeXH8u9
	ynVXDVxPIz2NZtvnj0sQNVzWq2nSNW6lnwhuQoFik1urov/AIIg5WgzRZUE98U+QN3kHbuSNazbwr
	n67ZhIOnJIa/FMk+YEAZctAjv5LG6dBONZedlIf5KtPmLGAPDR0DR5kWgqXO78K4h/xxDYp/MyZ0y
	CRcb8XRaR3Ry46QpqKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTcf-00000002swp-35wA;
	Tue, 29 Sep 2026 08:55:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTcd-00000002swJ-1i2U
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:55:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tpg03220622
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:sender:subject:to; s=qcppdkim1; bh=YYysSFbntWirOw1STKVl4DrzLwzu
	CO73/HGQAWPAgJQ=; b=SxwwWJdo3tGTRs3AaiGf1j/VaAqnsgMbWZMSWtn74vsD
	zwqiDSxOpJaOws2+xJZzDHHuMqxvqlygctslhLdl5Xp3uTBgYmY0chpWOb8YChJB
	v1bE3R96lkI6MpgdMA9Z1yPJxzmsftMBnHaMUxem8TvkIMl8YmqVVxepIttO4Mm7
	y0kRTFv0TMRIuT73a9i+uQ/XPdLV9ooKR0BvqSZEIQRasmqyVnKuy5H92ZQNI4bj
	9RlqpcyokCzii6SaTNp6sVYYi14bXwDmyQJwqGVjvDqC6PJ2Fq4YpdwQHhAVSSiy
	6XT6EYyAueRsQqbgFbE/ViVOUWtuoKa9ndXGLEbZ2Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw2362g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:55:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so8109437eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672133; x=1791276933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YYysSFbntWirOw1STKVl4DrzLwzuCO73/HGQAWPAgJQ=;
        b=Clmj0WuzyBPGF2NGPuxWAumLwLw/5PsFxLuMTJksqbD12YwXF1tMzep3LZPDr9NzzP
         crwBaoymAuTBo+meMA7Imq3rXbF4IFYUiB5WzVFAn00Oc2SMjctyF3XxB8urvpkzfRwH
         ifUWSxeedSw0RYIHKf3+QGKIyjQ8vUP2hMfev6Uewm3PATQnIKtR8HLT2+jtj0QfKheu
         QVcmI+9J8O19O5+hipYhub2A63Fc1ZDJ9j0aMuUuWdy4LfKtOQjHvFho9sr0qSIqy/1E
         6fKADhg2XfbXt2/oM7lu1Tx8Pz3PD085rNH9nG5UfAZ+kspfslJpra2nhls95fWbENSH
         GRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672133; x=1791276933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYysSFbntWirOw1STKVl4DrzLwzuCO73/HGQAWPAgJQ=;
        b=bIH2v00C+wsNKFMHu90Q70tRo6sigatSgziVjJVyZe5hynlpVgjUfQHavjMz8aGujd
         MxRgZ8WtiQeMClPmD08vVG2tfCcBDkSWbyfCm/UM0sj7fS0vYaH3/PvvGAJ4dXjQmddG
         K0W+iyXL9Vts29b/s3toLN+jiFrjSz1CcXcjRa5K5j3RXZ/eUHK3OKLQ8HvLujxOHTxC
         qctckU3z860LP8nBCF+JYlKDxnaB/rv4NDbqWqKRdxtsHzlVGrDASHYt1yj8ylODE/bc
         IYkm+LvsDRPpMv4wZ2DW2aakplUCUuwY2VSitXk5M6SkeCcEfuqKcWJKJXcPuPxnbQRL
         jE5Q==
X-Forwarded-Encrypted: i=1; AKwUvBygk9qpi77N1r3Vc8W8ZGDpAsGLH4aWDSiQ6VtgYrxdEhEk0Hp7wytkaElKfi2wA2dsCzYLXJFfEOF2JA==@lists.infradead.org
X-Gm-Message-State: AFuF++kkuEuKphdqgH0FcQGrLvYxJOUw0BiftpjLcnV0NkDmka4+zX5a
	p28J1hPgwSCDdbSW6GPiP7qyCJo68Uh8aP1NlNIpYDhRzKd8jpcK9DJx5KxpZRizNXKXLdOOqbI
	PZ18LPYX3n8A7Yp4x5XUPY8yqiO2zvv3S7pIoJzW2VxRgI05PTYOVx+wDdELGClXuXj5SDnk=
X-Gm-Gg: AYBFou0gXZZ60RfD0dnI03K94o2eJqC/eGN/ZFObm12FPM8ZaGNj0uKa3Fz2KGoYG6F
	KfWaioQJrfqfg0++1eL9pOoVg4RUyOejpO6G2B4OJQNb/gyRkKOzi+B2pM8FVb7L5HnGSH3njHR
	ArAywU2jN/1+zgKavXBCH0wcn6L0z1s9y1KB17xIEbYY/3lqHdC7POiSiGfVOJVcnkW7q83BdRa
	Axp8L08Y3YJ+bf7Fx351mF0hQvtMS45Fsb5cK8TyYy3NgTTnHS4Y/Vp8aSt/CMIGHCAN/a/a2Ko
	Zbn7qgmV/1ccTGeuoR9TS/avmOX5UZB4u0dPz+9D7+oR+AXVN7uYsJ+ZG5wVMDEOygLZKicgHx3
	RHx6Eaoj7Qck6PuWA7P1iCWKBjVrGOjRvcHRJbXSCAPkhcdhg95XzU8Gp
X-Received: by 2002:a05:7301:b0f:b0:341:f87d:4bd4 with SMTP id 5a478bee46e88-342701c003bmr12253855eec.4.1790672133130;
        Tue, 29 Sep 2026 01:55:33 -0700 (PDT)
X-Received: by 2002:a05:7301:b0f:b0:341:f87d:4bd4 with SMTP id 5a478bee46e88-342701c003bmr12253819eec.4.1790672132479;
        Tue, 29 Sep 2026 01:55:32 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:32 -0700 (PDT)
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [RFC PATCH 0/5] hwtracing: rvtrace: Add ACPI support
Date: Tue, 29 Sep 2026 14:25:19 +0530
Message-ID: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb7d05 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=vF7HM7XGAAAA:8
 a=EUspDBNiAAAA:8 a=V1jnuoLLAAAA:20 a=Zpogi3qlAAAA:20 a=NEAV23lmAAAA:8
 a=YG64nluAAAAA:20 a=wDIQ8p4OHAohPmJ-3qkA:9 a=bBxd6f-gb0O0v-kibOvt:22
 a=bNn2QJc11pDkoTYzAKk6:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: ax08KqKiT2bbJPMoTWps_tW4vogy8Mpe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX/d8D8NozNqWh
 qo9sEF6qi5WMEqRZLBbWd7q8hcUUwgmaytH8pfhx5Ra+QraNFGp8X9DrdJ39b+dxaA0DOpvjqX0
 S0JRfZ7UbevCOrnTiTFGTvy3F2GcDtW6GdonbsUBCgb0PPhAiqFgkuwdKJ09xvUXfA9GQgDOSC9
 dmYMJGCqLGbIA1J8vGe77DwNs37oGEdQuDXxt+JnKJVrSMgJTdStcAlYDIMpWeLqgxEokq1xlGL
 Io3F7hWwpj8cWWHDAx39wQPyKa2Ogg/6PEc6PdWjff6EVMBTeGS8O6p8jn1fsQr2ynE7awRQg4S
 s3wfmpiNILYkChYdK95Te3zkBQm5em7Yntq8VgGyXb1IHDEEU4rv5+xKsAYit2xMC7OE7DO4h0X
 zlei9Dnhoon2KV0u5wf1uO2M9IhYVAurmTTaZuqew8io6HyF3HPiJKTUMIdYgHhKtPIKdyIwz6l
 n0hxhxGVp/121ZssbRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX54/23G1ITzJg
 vRsFKWKpPIlHtSfI3LyvVc+d3z9BS4de5su26FdvRqFkNHnPUWHjs1Gxqal8AOWAKa68qwbA4nx
 WjBEI/4FXR10jaA3ct8jiWQIdEe6mgU=
X-Proofpoint-GUID: ax08KqKiT2bbJPMoTWps_tW4vogy8Mpe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_015535_456521_6A37A87F 
X-CRM114-Status: GOOD (  19.10  )
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

This is an RFC series to add ACPI support for the RISC-V trace
framework. It is based on Mayuresh's v5 series, "Linux RISC-V trace
framework and drivers" [1].

The RISC-V trace specification is proposed in the RISC-V BRS v1.0.6
document [2], Section 6.5. It uses the Device Graph UUID defined in
Section 3.4 of the DSD Guide [3], similar to the approach used by
other architectures.

When I started looking at ACPI support for the trace graph, the obvious
design was to follow the approach used by other architectures, such as
CoreSight. However, that would mean duplicating the ACPI graph parsing
logic and maintaining separate DT and ACPI paths in the rvtrace driver.

Instead, this series proposes enhancing the existing fwnode_* graph APIs
so that the trace driver can use the same interfaces for both DT and
ACPI. The main idea is to parse the Device Graph UUID defined in _DSD
and create synthetic nodes that match the DT nodes. The ACPI-based
fwnode_* APIs are then enhanced to traverse these synthetic nodes in the
same way as DT. The ACPI fwnode_* APIs already support the
"Hierarchical Data Extension UUID" defined in Section 3.2 of the DSD
Guide [3]. Adding support for another GUID therefore seems natural to
me.

The series adds the ACPI device-graph parsing by creating
synthetic nodes matching the DT nodes, extends the graph parent handling
for in-ports and out-ports, converts the rvtrace platform driver to the
fwnode_* APIs, and adds ACPI matching and CPU binding support. In the
future, other drivers that use the Device Graph UUID, including
CoreSight drivers, can use the same interfaces and avoid duplicating
this logic.

One question that may come up is that the DT schema [5] has not
standardized the in-ports/out-ports. However, the existing OF
interfaces already support in-ports and out-ports. Therefore, I do not
see an issue with providing the same capability through the common
fwnode_* graph APIs.

This is an RFC series, and feedback on the overall design and the API
changes would be very helpful. We have a slot to discuss this in LPC
next week under RISC-V MC track. I hope this series gives better context
before the session and we can have a fruitful discussion next week to
converge on the right approach.

The series was tested on a QEMU virt machine with the required ACPI
namespace changes for the trace graph. These changes are available at
[4].

[1] - https://lore-kernel.gnuweeb.org/linux-riscv/20260810152223.3946743-13-mayuresh.chitale@oss.qualcomm.com/T/
[2] - https://github.com/riscv-non-isa/riscv-brs/releases/download/v1.0.6/brs-v1.0.6-20260928.pdf
[3] - https://github.com/UEFI/DSD-Guide/blob/main/dsd-guide.pdf
[4] - https://github.com/vlsunil/qemu/tree/acpi_trace_rfc_v1
[5] - https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml

Sunil V L (5):
  of: property: Add in-ports/out-ports support to
    of_fwnode_graph_get_port_parent()
  ACPI: property: Add ports/in-ports/out-ports support to
    acpi_fwnode_get_parent()
  ACPI: property: Add device graph support
  hwtracing: rvtrace: Move to fwnode_* APIs
  hwtracing: rvtrace: Add ACPI support

 drivers/acpi/property.c                     | 516 +++++++++++++++++++-
 drivers/hwtracing/gtrace/Kconfig            |   4 +-
 drivers/hwtracing/gtrace/rvtrace-platform.c | 191 ++++++--
 drivers/of/property.c                       |   4 +-
 4 files changed, 657 insertions(+), 58 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
