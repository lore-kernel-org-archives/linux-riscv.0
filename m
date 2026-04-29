Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31762CCFA13
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 12:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GBJxdUCn4kub03cBEOUNPkQv0g543sC4JaVEZPekZOM=; b=e+gFyb7VA4Z00V
	sBLX2LbbrnyJ4caXYxNv7buw109FTUs2OqZOTqEjDuIC5S3+U0M28rsW7S8qOBw474LTqpyaHxljm
	CdkjXX0LioBm3dloVoEMXYuIS8ox+s/rR4rhz5b/+KfwG0NiQih/lA+svHnvYKZY/RR+Zy+j11gTA
	YylRzOhMkC4s9dMQDTSKdH0vzf8Gz7HxZNlA3Uf/i/+XCgL51J/Aoc2FNEHW7vqwNBmvGFWGdfRBW
	352tg/NNXDVQkg1mP2Xf3CWBkHQ6U7vpapzFGQGc4/W//Dgjyca09LsNuQiuBrTYxNNnhd0TE6k1g
	9hdcUWfBuJKBK/sEXesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Ok-00000003bGv-3rSI;
	Wed, 29 Apr 2026 12:52:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Oi-00000003bFC-2Qbv
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 Apr 2026 12:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bYXYwzQuclEQ/6LXNdmF4xIW3tfTCncolOWeQi146eA=; b=oKTwM3cB+CDPZJOLupKQ7yatC5
	+V+7ZpV/uDgc0TXbnAsHAZvo2LpT/4lo7h4egyiPK1I8dGUbuuW4m0UHZ16bW37HQwcyvs2M62S8V
	+urXrXpRBG+d9w8q5V0Fmy22fRhWubiqGvaY2ok6FmH5B1peYFXOTJaMCS421Nrqg8OwwUKtg2mVT
	WYqXRp4KXvXZFsdHEZQLuBc5EmlZ9tHPcXuRZUTE+Obt7dOTRuWmwEMbqTzVGL86eNxlTQX1sglZa
	Y7uo7E2wMn6ds7cd3/BpEa6lDS+3SlRgqYcJikrE+sd+1gThY/1ji8ZJ4csXVyEYmTK/5ocIpudlS
	NHYDxR7w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4Of-00000005JoC-0d7b
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 12:52:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8plvC3752353;
	Wed, 29 Apr 2026 12:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bYXYwzQuclEQ/6LXNdmF4xIW3tfTCncolOW
	eQi146eA=; b=mYnCKVRs0FiMVGo8kF5LQMcNtscJxJrdUQfbVEB+oeaaK+Wp3uo
	F2/aw9Pj9B3TGeFiww/igE/OkMbEUYbrbEL7/7GywrpMze0UGHvcJPGvJkNRmKkF
	29qpyWvNl4rGeBPK2PYZ7jotrl6Rgpt+9erhucCvTmTSzP6cG6hCxYBHNMWj2ZWg
	OjLRN1r81C1RQz0Vp7SCaouBVsP/+nC9OfYZTnnNM8gGtF8bFBoxpmKHHtj0VYK3
	uLDVvUtwdf4kKBl2ydsBlf3LNEYqEcmZlHDkBsUe1IZY5mR8HY3BCEvt3lFkZzba
	orwBBWTHThXk9PkRzgadtexsqC8culRFkWg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1hjah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:41 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63TCpb5N010777;
	Wed, 29 Apr 2026 12:51:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ds65fvr0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:37 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63TCpbD3010748;
	Wed, 29 Apr 2026 12:51:37 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 63TCpbtG010743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 12:51:37 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id AE9DF215BA; Wed, 29 Apr 2026 18:21:36 +0530 (+0530)
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
Subject: [PATCH v4 00/12] Linux RISC-V trace framework and drivers
Date: Wed, 29 Apr 2026 18:21:23 +0530
Message-ID: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f1fedd cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=V1jnuoLLAAAA:20 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8
 a=utHJ6407P1UXFtj8NH4A:9 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzMCBTYWx0ZWRfX1ddY+Uv1MfCk
 mtgHPJEUX4rbEWeUp2B19CYQ3091zpQgg/Jdo+/Vwln6gBeZxOZ/sM2fXz5em+TYL4bBzXj7xW5
 aGOTxX/Ynfd4iArNtV8BOQbuuPRNt7wYqGS3gfEdHMYmRDqhGkFdgT6rfxvp5TBqbg+fPdBTbi/
 0IKQ40VGjgDVjHFPVYmURCDvYBZdJzK822rdDyutKvzareLYSVots2dB8wcZ0jGtEymg1d/1Ddl
 p7kWxt3Rw8K/q9z0cD4KzjovbfCkA7h8ayxXNwry5Qo6CNc6RNhxCuss5wQ1/zezdwdYMsF9hFK
 unrgaPn9ZjjvyFD7IaIcfWUxT2q7mEaq/af4JxTsDbjz2MKzkYrklGBAzl9kr5EqtkirQ8c/ziU
 JQrcbWHZF2HuXTldwMCRs2m8/fy+G57Wa+ENIByrDHfOD+MpXkxtbJNcgHCZuCgYuQEpHRcN49d
 O2pglWF68ODzFywKX7w==
X-Proofpoint-GUID: tBDwjlniXAo1fUUr1Yveh4tp_yAhg-BI
X-Proofpoint-ORIG-GUID: tBDwjlniXAo1fUUr1Yveh4tp_yAhg-BI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_135209_471387_132FC92E 
X-CRM114-Status: GOOD (  19.79  )
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

This series adds initial support for RISC-V trace framework and drivers.
The RISC-V trace v1.0 specification is already ratified and can be found at:
https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0.0-ratified
https://github.com/riscv-non-isa/tg-nexus-trace/releases/tag/1.0_Ratified

The RISC-V trace framework and drivers are designed to be agnostic to the
underlying trace protocol hence both RISC-V E-trace and RISC-V N-trace should
work fine. The discovery of trace protocl parameters are left to user-space
trace decoder.

In ther future, there will be subsequent series adding:
1) Sysfs support
2) ACPI support
3) More trace drivers (such as funnel, ATB, etc)
4) Support for upcoming self-hosted trace specification
5) ... and more ...

These patches can also be found in the riscv_trace_support_v3 branch at:
https://github.com/avpatel/linux.git

To test the patches, we need QEMU virt machine with RISC-V trace support
which can be found in rv-etrace branch at:
https://gitlab.com/danielhb/qemu.git

To capture rvtrace data using perf on QEMU virt machine do the following:
1) Launch QEMU virt machine
   $ qemu-system-riscv64 -nographic -M virt -smp 2 -bios fw_dynamic.bin \
     -kernel Image -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
     -drive file=/path/to/rootfs.img,id=disk1,if=none,format=raw \
     -device virtio-blk-device,drive=disk1
2) Run perf record to capture rvtrace data
   $ perf record --all-cpus -e rvtrace/event=0x1/ <command>
3) The step2 would create a perf.data file which has the rvtrace data.
   Now run perf report -D and look for PERF_RECORD_AUXTRACE event
   section(s) which point(s) to the actual rvtrace data offset.

Changes since v3:
 - Rebased on Linux-7.1-rc1
 - Use kzalloc_obj() in-place of kzalloc() in PATCH2, PATCH3 and PATCH9
 - Improved PATCH7 to save the previous WP value

Changes since v2:
 - Rebased on Linux-7.0-rc1
 - Addressed Rob's comments on DT bindings in PATCH1
 - Addressed ref-count related issues in rvtrace_of_parse_outconns()
   of PATCH2
 - Made RVtrace framework more generic by avoiding implicit access
   to component registers in PATCH2
 - More improvements in trRamStart/Limit/WP programming and other
   improvments in PATCH7
 - Removed RVTRACE_BUF_LEN from PATCH9
 - Removed redundant page_size from PATCH10
 - Renamed found_etm in PATCH10
 - Removed rvtrace_recording_init() declaration from header in PATCH11

Changes since v1:
 - Rebased on Linux-6.18-rc3
 - Addressed Rob's comments in dt-bindings added by PATCH1
 - Get reference of conn->dest_fwnode and add missing break in
   rvtrace_of_parse_outconns() of rvtrace-platform drivers added
   by PATCH2
 - Added new inline function rvtrace_comp_is_empty() in PATCH2
   and used it in rvtrace_encoder_stop() added by PATCH5
 - Fixed trRamWPLow usage in PATCH7
 - Determine RAM sink buffer size based on component implementation
   ID and reduce default RAM sink buffer size to 1MB
 - Add new PATCH8 to enable DMA_RESTRICTED_POOL in RISC-V defconfig
   so that implementations with RAM sink address restrictions can
   be handled.

Anup Patel (6):
  dt-bindings: Add RISC-V trace component bindings
  rvtrace: Initial implementation of driver framework
  rvtrace: Add functions to create/destroy a trace component path
  rvtrace: Add function to copy into perf AUX buffer
  riscv: Enable DMA_RESTRICTED_POOL in defconfig
  MAINTAINERS: Add entry for RISC-V trace framework

Mayuresh Chitale (6):
  rvtrace: Add functions to start/stop tracing on a component path
  rvtrace: Add trace encoder driver
  rvtrace: Add trace ramsink driver
  rvtrace: Add perf driver for tracing using perf tool
  perf tools: Add RISC-V trace PMU record capabilities
  perf tools: Initial support for RISC-V trace decoder

 .../bindings/riscv/riscv,trace-component.yaml | 120 +++
 MAINTAINERS                                   |  11 +
 arch/riscv/configs/defconfig                  |   1 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/rvtrace/Kconfig             |  33 +
 drivers/hwtracing/rvtrace/Makefile            |   6 +
 drivers/hwtracing/rvtrace/rvtrace-core.c      | 787 ++++++++++++++++++
 drivers/hwtracing/rvtrace/rvtrace-encoder.c   | 130 +++
 drivers/hwtracing/rvtrace/rvtrace-perf.c      | 345 ++++++++
 drivers/hwtracing/rvtrace/rvtrace-platform.c  | 209 +++++
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c   | 338 ++++++++
 include/linux/rvtrace.h                       | 352 ++++++++
 tools/perf/arch/riscv/util/Build              |   1 +
 tools/perf/arch/riscv/util/auxtrace.c         | 219 +++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/auxtrace.c                    |   4 +
 tools/perf/util/auxtrace.h                    |   1 +
 tools/perf/util/rvtrace-decoder.c             |  91 ++
 tools/perf/util/rvtrace.h                     |  19 +
 20 files changed, 2671 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
 create mode 100644 drivers/hwtracing/rvtrace/Kconfig
 create mode 100644 drivers/hwtracing/rvtrace/Makefile
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-core.c
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-perf.c
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-platform.c
 create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
 create mode 100644 include/linux/rvtrace.h
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/rvtrace-decoder.c
 create mode 100644 tools/perf/util/rvtrace.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
