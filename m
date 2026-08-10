Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0621AC5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GXDzm6GizWFFv7SB+Y4p7v5nSGFIBxJHalPxOwGktwo=; b=HgkqnkxbLfus76
	g7IRgSdzGxS3O6RUUhwyWap3hsKkkGdX/ERbq6fAsvpP6tzMGXGKp/lUrLfq+GTXC2A8Vnx7s6qXA
	tDxkDfFZwYSuT208hGYKbF1YlU2LC/r4+ugwmM8tMX/2DVZ4ANpyG88zKKx2R0aQiRUgFZdtQGNa7
	8Qz7cd9NcyD8VBqa5IK+jGoqRuMJ56szMmRckKK6feWRqF7Pi5aDxjg1AWS+PHrRAJQzT3RIt6+8Y
	07t/SXsV9ycluIGXFcYqJof+OYNhTs/ykCxVwcjlPrBplx9n2fdXtg7OzHOpn4Jh+fETEb+rRJrNa
	pwFoXxKi6Qro5A0cT9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRqO-0000000CECA-0Zjg;
	Mon, 10 Aug 2026 15:23:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRqM-0000000CE9a-02OQ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:23:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjRHg1596761
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7i4nOYQc8blpjmLfO+teniGVVZZSDRrlrow
	Z7zCs7tA=; b=CwocuczT4jZUN+FtGk6R2KRwGPCastXIp9Im3Ii+AQyW8RnSdlo
	tUKJvJ1mp0Ng3k60KBdRIJl/SKeQfdqx78rj7WXcI+Qft+XVNTCa5GlNWkBTpzj4
	LtL4oki2tGen2+a3FTlBmOgA4oVsWH052HInnpnfE6JOXPjqdHn0l5vUFqkse9FF
	ExrX0jwC8amy29sz9/t9aH2KZZE82MhiCm5SDupC2gN3VxB7gzsP05Zxv8/HAcJu
	8I9Mu4YgN2yDvgX7UQ6r3kxeGRmKQ7ZGWP4O9AcX6M7injn8F//69nO6NSiGRfXo
	IkHsICfPGm4d007DtyYShMg624vpZ6X5otA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6t9kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:23:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84f7002f9afso2000926b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375390; x=1786980190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7i4nOYQc8blpjmLfO+teniGVVZZSDRrlrowZ7zCs7tA=;
        b=jMJUPUzLpO1D4SZrUyQgyeIjkofBYttJjzecXJb6/BbMPeyaXLih2arkceW5QtyuWd
         R8wjLzx0kvazkgvZWErejQdrjrm1shWk/GSBvGd3tmwIByM2MI0ILoC53KgGwP2KsOUs
         oqCsZPN6OQwf9IZvr8vzCqsScqyv6i+D8IbVhJMoNVzoLcfGLkutKQDv4VI5OoXswTeM
         L+EsI3fZUi7RYI8sJD8ha0C9VXwXAASehndeNqTaf0mlytlvH1gnjZLMS5LlG7bWEB2e
         t5xT4NGqwZ5WpOD35I4Y8mZBEwtEA1prAFOTzux7CEEfKX3i9df84GRjtsKB8QJshdXJ
         s37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375390; x=1786980190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7i4nOYQc8blpjmLfO+teniGVVZZSDRrlrowZ7zCs7tA=;
        b=D5ns9MeIVwg5QisAWQB7j8UpuApV0lxWGKyGBZ2qPlLRRM3NT9hp1uFP7Gm6FKmwf2
         xkI3uwja3M+5yKcYlPnjlJPQOk+N3N4Pfg3NHotUVTTDL61foxM9b/EUyYH9seOTYyX/
         WI0BQFMch61RYWN0hza3uJBlLc4uj9QJ+WNxFdMGVGCrWEQvD010LtLezO4xZLvjjFJw
         UGKuvLNNaGdRz4vdoPuzHwb7AkLG1wNpFuinkwag41yfKPsWr+tOqlYIgQaYR3Ru9yVF
         bWDyTzADf12sv+riwYyT3MVxkrp1XLRiJvhSx6SxDFD39ZtbiYshVKCu3URdqWrINCeA
         S12g==
X-Forwarded-Encrypted: i=1; AHgh+RqhzDN2RPiUPe42J2fmPJNIYEl1vav/njx7F1gfMgIPKrLWWbVCxm0HE3oqWjAkwEezUAM6zAigy8nEAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh8LxlE0T6i0ZRVXEvxs/QHSx/H5Ov/T9WhS8/LSCO72Y4r4zS
	SaV3XoyTqujOmfLLR8Pgy/poHu3nFQVhdV4FRRUG/lMhE8BSW75zu8xmwUyBFy9IEBr3211bvPe
	WeS+rI4hc+nvoUNqbGfvEc6xCVOsH6x6FinkNeL3XvkVaQDaCFWvBih6JgqLspIHlevHaClc=
X-Gm-Gg: AR+sD11LCJDZ9Lrs39wnJUjzex5ouhcR8h6zlHSnFQoSrC0QQ6JFHUPIbjAPnZ0xhPq
	yBEKU/hK4tgQVQ2C+D6WyZ7ZOsp1Z1Q0q7gdIHT6mZw5XJewpUV5vlO9+IoRZZIBmepJVi2UU7r
	KTMouo7K3u56yApC3HWht1VWI73QEBt3LM/srufsw30xAHAyjnQGaZCJ4TDr4IU1p3jrnTSVyJf
	cTAKi173VytiNn/SGVRE7C+xPmZOkYfYJcH6D77D6IMkIKdGwQFtzV2xgr4DVWlWpLJ1nbvm6uW
	HNpZhJ606tSFok6j/FyIi6Qg7srlA79VcB/8Z1M1HFTcQr5cdnqsoLuwDE7sXfWUwFQ0lLEVdAg
	AkgKkKIZId9/vrA79Xsjb8f3jKXGEHzOc8NypvLt2ggVLY/aFdNUfalweqAbx5ifb69DQTSeD3K
	L7JToyI/pvd+plL9mU9kr/HY/Arg==
X-Received: by 2002:a05:6a00:982:b0:845:3d82:10fc with SMTP id d2e1a72fcca58-84f6926b235mr21438014b3a.0.1786375389392;
        Mon, 10 Aug 2026 08:23:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:982:b0:845:3d82:10fc with SMTP id d2e1a72fcca58-84f6926b235mr21437923b3a.0.1786375388690;
        Mon, 10 Aug 2026 08:23:08 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:23:08 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/14] Linux RISC-V trace framework and drivers
Date: Mon, 10 Aug 2026 20:52:02 +0530
Message-ID: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX8onNnTReXjw0
 kCqSPI60NY8Ewi3/LlCR2cx1VkxJdeTnjkH2dnYJ2LJbFuGWxS+hkX6T3qNZ/rNtJN9C65/F+D+
 x5Gz9WWpEnKhGBuE3Kv/wKd3HfGHrbA=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79ecde cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=3VGhpSTrpI1f5KnKU78A:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX5wpVhDX5E2w4
 iBd+DBCKutBOkZLGbS4kpjdnoOjOB4OEWw5l4xljLHOdvN49/OivQhEzoPhF9cOLhMTxLwFnEvn
 Pa8NcjFfUgylJdZxLAlzhzUfKB8U5diXfDhwDmCa0k8urxuXPyPz8QYFsEnvFb5613/K0oFf5xm
 /q8w2vVu+9FMNaOPfoEqXwaP4mL/JpuzRxz+IXdDcgkKyS6e4cxbwu457MtvIg4VU0+OoOMaJ2o
 jvCwttw7jTJcxTfC9AgpYTZsn9waGOfXQ8aYRp/sMxKwv8UHpbTQzkIBKbQlNQ2MOBaj9MtK16W
 md2+Ps4m56XlBPZInZhWauOo2bzVDjRbhDTg/3zcJwZgrfwU5aj+Vv2+XcT1h2OyHIlu4tnYpdE
 WEcHkb5upDQIWaDSVhyGXFfyNX/hL8He5+Qhe1/gRQpN0M0KasJWHcy7/qnnYXdxRwifD/UYnCQ
 BJPeZGXfZiyOtzyO5Gg==
X-Proofpoint-GUID: tGvNAFuhoTlPcTp7FVuRE_qwCqmYizLH
X-Proofpoint-ORIG-GUID: tGvNAFuhoTlPcTp7FVuRE_qwCqmYizLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1011
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082314_171076_2F289D15 
X-CRM114-Status: GOOD (  30.75  )
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


As decided during the discussion on v4 of this series the 'rvtrace' framework is 
now being converted into 'gtrace' which is an architecture-neutral core with 
RISC-V E-trace as its first backend. The 'gtrace' core framework has the minimal
shared plumbing (component registration, path create/destroy, path start/stop, etc)
and the RISC-V trace drivers are its first consumer. It should be possible for the
required ARM components to be adapted to the same framework in a future.

This series also adds initial support for RISC-V trace compnent drivers.
The RISC-V trace v1.0 specification is already ratified and can be found at:
https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0.0-ratified
https://github.com/riscv-non-isa/tg-nexus-trace/releases/tag/1.0_Ratified

The RISC-V trace component drivers are designed to be agnostic to the
underlying trace protocol hence both RISC-V E-trace and RISC-V N-trace should
work fine. The discovery of trace protocl parameters are left to user-space
trace decoder.

In the future, there will be subsequent series adding:
1) Sysfs support
2) ACPI support
3) More trace drivers (such as funnel, ATB, etc)
4) Support for upcoming self-hosted trace specification
5) Arm component support under the gtrace framework
6) ... and more ...

These patches can also be found in the riscv_trace_support_v5 branch at:
https://github.com/mdchitale/linux.git

To test the patches, we need QEMU virt machine with RISC-V trace support
which can be found in rv-etrace branch at:
https://gitlab.com/danielhb/qemu.git

To capture gtrace data using perf on QEMU virt machine do the following:
1) Launch QEMU virt machine
   $ qemu-system-riscv64 -nographic -M virt -smp 2 -bios fw_dynamic.bin \
     -kernel Image -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
     -drive file=/path/to/rootfs.img,id=disk1,if=none,format=raw \
     -device virtio-blk-device,drive=disk1
2) Run perf record to capture gtrace data
   $ perf record --all-cpus -e gtrace/event=0x1/ <command>
3) The step2 would create a perf.data file which has the gtrace data.
   Now run perf report -D and look for PERF_RECORD_AUXTRACE event
   section(s) which point(s) to the actual gtrace data offset.

Changes since v4:
 - Introduced a new architecture-neutral 'gtrace' (Generic Trace) framework
   and moved the RISC-V trace drivers on top of it instead of a RISC-V-only
   'rvtrace' core.
 - Added new PATCH3 "gtrace: Add RISC-V platform driver for the gtrace
   framework" to split out the RISC-V platform/DT code from the core
   framework patch.
 - Moved all rvtrace driver sources from drivers/hwtracing/rvtrace/ to
   drivers/hwtracing/gtrace/, with single Kconfig, Makefile using
 - Made the perf driver (previously rvtrace-perf.c) architecture-neutral
   and moved it into the gtrace framework as gtrace-perf.c; PMU name
   changed from "rvtrace" to "gtrace"
 - Added new PATCH8 "perf: Add gtrace AUX buffer trace format type" to
   define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE which is used in later patches.
 - copyto_auxbuf() and gtrace_path_copyto_auxbuf() now take an output
   parameter so the AUX data format can be reported by the sink
   driver by setting PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE.
 - Renamed the generic side of the perf tools support from rvtrace* to
   gtrace*. perf.data ABI is unchanged.
 - Fixed gtrace ramsink start/stop to call gtrace_enable_component()/
   gtrace_disable_component() to remove duplication with code in
   gtrace-core.c
 - Updated the MAINTAINERS patch to refer to gtrace framework instead of
   rvtrace

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

Anup Patel (7):
  dt-bindings: Add RISC-V trace component bindings
  hwtracing: gtrace: Initial implementation of gtrace framework
  gtrace: Add RISC-V platform driver for the gtrace framework
  gtrace: Add functions to create/destroy a trace component path
  gtrace: Add function to copy into perf AUX buffer
  riscv: Enable DMA_RESTRICTED_POOL in defconfig
  MAINTAINERS: Add entry for RISC-V trace framework

Mayuresh Chitale (7):
  gtrace: Add functions to start/stop tracing on a component path
  gtrace: Add RISC-V Trace encoder driver
  perf: Add gtrace AUX buffer trace format type
  gtrace: Add RISC-V Trace ramsink driver
  gtrace: Add perf driver for tracing using perf tool
  perf tools: Add RISC-V trace PMU record capabilities
  perf tools: Initial support for gtrace decoder

 .../bindings/riscv/riscv,trace-component.yaml | 120 +++
 MAINTAINERS                                   |  11 +
 arch/riscv/configs/defconfig                  |   1 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/gtrace/Kconfig              |  59 ++
 drivers/hwtracing/gtrace/Makefile             |   8 +
 drivers/hwtracing/gtrace/gtrace-core.c        | 744 ++++++++++++++++++
 drivers/hwtracing/gtrace/gtrace-perf.c        | 347 ++++++++
 drivers/hwtracing/gtrace/rvtrace-encoder.c    |  99 +++
 drivers/hwtracing/gtrace/rvtrace-platform.c   | 286 +++++++
 drivers/hwtracing/gtrace/rvtrace-ramsink.c    | 320 ++++++++
 drivers/hwtracing/gtrace/rvtrace.h            | 121 +++
 include/linux/gtrace.h                        | 323 ++++++++
 include/uapi/linux/perf_event.h               |   4 +
 tools/perf/arch/riscv/util/Build              |   1 +
 tools/perf/arch/riscv/util/auxtrace.c         | 217 +++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/auxtrace.c                    |   4 +
 tools/perf/util/auxtrace.h                    |   1 +
 tools/perf/util/gtrace-decoder.c              |  93 +++
 tools/perf/util/gtrace.h                      |  13 +
 22 files changed, 2776 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
 create mode 100644 drivers/hwtracing/gtrace/Kconfig
 create mode 100644 drivers/hwtracing/gtrace/Makefile
 create mode 100644 drivers/hwtracing/gtrace/gtrace-core.c
 create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace.h
 create mode 100644 include/linux/gtrace.h
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/gtrace-decoder.c
 create mode 100644 tools/perf/util/gtrace.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
