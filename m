Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A18CA5FB3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N062yNwB2cy03K/I1/986qWzNmcFzOX13CPYdVtnSsI=; b=SJ8EjXXToT+6q2
	XLBAB+yYg2uB+cdBrHab0QUqymCxvxxYFaXylMYV37qOQLM9n0HA9mxWtVI8WRStSW8LORm1B6htX
	dFq8T71eOMCpRbX4V5k51gHf4uXrRExrnDaanTRe83vbIRykW86OmzLLMzdJp9GPvoIwxGjTJDxam
	B8ycw1n0O8vrssklvZcqvdOoZ6qIxswZtHCeFF1XfMuQ0EVzx9qg4/9jb0FU9qaHIbPUgeT8QFbTv
	BKUynxhYoxud8Q50/63ifI2votFbeEIHUfPrXjuuNxBAWrhoeCCr1vKaXfWXaolHEY0bzAN21Fd4h
	HYdw80IpM/A0LMXoelEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9GU-00000007nM3-1H1W;
	Thu, 01 Oct 2026 05:23:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9GQ-00000007nLY-3Sh0
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:23:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913g4gi1238907
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wRMZ5C+W4s3WBTEwnJCNbG5XG3HtxGnpkSf
	0y0USG3E=; b=mZM73UNI311C0UnbbwbOBngeN9+DmwbCj103ngjjqzmtlUWFg94
	JYBnCpzaLT3q43NB6AdCgB2AoLKcLEzED60viLnvkvRTY7hAXcL+k/aalZC5VshI
	P4Fr4XnMNE1iywZmRt6DBOMXAUloph0W3PfuzqD1lUQpQ7v4k/bWue4PkfImEqOC
	agAanG7EpMXqzRSpcqBDkjGIKRsD7ut7HBoR75hMpXbPsyLGBiH7jE4NtNacYtJS
	kJfFDBWcS/lbxYv2d64mUA3uWLLAI9HDg9IdLHDXSyBWXq0flHg+wJwgSzkZvX6/
	WJBQOPLT7P14/FOx9jRmpjYdCt3ce7qzdeg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pjm44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:23:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd7d0751efso4586405ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832204; x=1791437004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wRMZ5C+W4s3WBTEwnJCNbG5XG3HtxGnpkSf0y0USG3E=;
        b=ABWshNNCIf2Ow8AUpbTfW6lPIRV9cMDpPbiJ6Q6IJ4hzbN+xc81tXVKVauNKtiS6Cz
         haEGNY5Ityg9nNzEQbAQ21dDByWNxn163R0TGPgy5HnDfJkWHt186BMUWpBNKJSKTMyi
         N2T0mz02NqpvUyYWU86gI+zegLwD2NFTj+W9k50CjUV5fhtsxy+0yYx13BbgBItULK4g
         +pTw7lM/iDC/3VPjbZWBkjUgQ4GN/KeBnwEmMirRD+yydBCcr/7bKADmWT4iR6yYSOP6
         UFWmA9gtD7tmloCPrFddCKH1Lf8r7dBAC4FJ1j8FUvx0zCj+Qubttp75CxwGhSVLQQBR
         wVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832204; x=1791437004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRMZ5C+W4s3WBTEwnJCNbG5XG3HtxGnpkSf0y0USG3E=;
        b=dWc5wrKr4IpPB1TSz+k4skBO90mqqVhgNAD3/m3t0K1CMjwod5IFupGNu38BqK+di/
         VIHAyw60PrAfIaRaaagR3pa+SjhVwzCTjCUmLhvMBanZcPNL2Z5nNyTRv5sthtaQXlM6
         DCcug1vdKux3rI5nyPS1Y/H34T6B3zX3YexYVOpi5bDLUSeJc71h9SnKXHCLfi27wZ/V
         MylqPR3s28U97w8f4tqoxM8Locew1b1X4NfIafDT0r0e2hNA/pFK8X5ii1yDetwO0+gm
         ZqI66Ku6zNkgOVh8uHPy1WUITuacB3nal/Pb11/uDEhuxpjhbmIvlw1hbBS1p6lhoiVx
         wSew==
X-Forwarded-Encrypted: i=1; AKwUvByDvlkDu0ZL/DtguawB0hN7hdXuSvhcOPNPPQ/MbB6QhmsynHh1huuCVInxRatut+fKaRtfr+YCyDPZAA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKkXmFPI51RxlQQrSjuqHd3DYyqSMwNyXr+LS6iwsY6zUeXMwWc
	2O5dYuJnmhGT9Hvxh3mHunl8x8yxotVJKjZHNNsfVf/D7le6YWHHZGs/VIA4SBmFBO8qvuseAkp
	Y2Fd904UkTwCFT8n5ydX1UFLrox0mSZTSGLDKZcHzsUoV95fpwg/3TTJtMSn2//te5cIyUTA=
X-Gm-Gg: AYBFou0Cjq2HIRaH5iQu8wd1Ig0jn6kJt1ttb1YLLZ1Wv+09a9vrr35Y8phoOG/vNzD
	q7cYuBUp0L1lpM1uxyERL7So2IX38aP7xdroBwRAibfzdXyOnPIOVuV3n7SSUFkRqJDgQwp36qJ
	TBXRUWDUnCTFg+zW3YTSraaOJLk4ZRLzGcKpAP9XPfI0XUmNZ4xfF8f6gEDsj00urIqr4lfIges
	ciR/lFidyqnBr9WycakZ67vuYYUP1lxt0Rb/ioPTAPZg0C8lgoKRyR35HzCe8mh5X9UEEwHCAvI
	c96mrY8OvB69ScMBmV7i20fPAWCB8tDU/jZ81NXPJQ7fyVwzR3yFrs7b3RyQ7YmLGiodH8dC5gg
	9v4pj2xxLfytePHrNYDBJcGSLMu2IiSH5a6zzXa4mQUCxGpZFD0apIYFu4EgMEY1RjnOJy8mCtw
	EUyH289jZqpUEewMleRAZCW9yn
X-Received: by 2002:a17:903:3201:b0:2dd:86a3:232d with SMTP id d9443c01a7336-2e3000ecbebmr9988195ad.8.1790832204312;
        Wed, 30 Sep 2026 22:23:24 -0700 (PDT)
X-Received: by 2002:a17:903:3201:b0:2dd:86a3:232d with SMTP id d9443c01a7336-2e3000ecbebmr9988055ad.8.1790832203727;
        Wed, 30 Sep 2026 22:23:23 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:23:23 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 00/14] Linux RISC-V trace framework and drivers
Date: Thu,  1 Oct 2026 10:52:11 +0530
Message-ID: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 06UXZf5rQPeb_0s0XbXl6JIAdGBx_9gL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX3NcKnFYSvhFB
 eXqayEl14/kC0kZDcC1ivhmkuiznGB09Hv6H4qxxrC5QEMLyIAA2Fzl8BIFypr+lLqP85ak3xOA
 ZQXNGRyNkw16aWbMvdvkUGXj2IYCeSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX/fNLB5s2qDys
 6rVAgD5ks7sIsEC3Co9ATAMWuhbMMZoZI689lOS9pkSHawsum8yHNwoAwVjahxHeyo+AIehtZ50
 LS5X11pi/a070dojxy+b6LZx64/Wwoq1jxx7Gl1XiiZ5ZgscLIzqMYAS4QMD+FvL3aeCrKN5vwV
 Ocvp2RIAnWYvQS4qJUN9afcb1yEjodpUqeYcBrozks0cJBpxgrxoYsgQG7cntip+rP/Gwzj5oLB
 CfzBAR1NfiLCYZb3eMp7imq9WyDlQkql4i5oxcD8yxEDZOil4gRTXt2VUmyrlprzBxJtQHxoPOY
 xaA8FjB0HD3pDMrtlDQ4+jT//bqGUkZMTB56C2QUB6nR7XZymjtNvA8JivxkRbypHDVaDd+DM9M
 d2W9xLGkY2OqsUnh1hKzawNLQyHemej/gVx54zzJZXqSgFIlqQcokfcTe2aDCEpSpkG5FJLShfG
 bg8TDdszKPgIgm2HyXA==
X-Proofpoint-GUID: 06UXZf5rQPeb_0s0XbXl6JIAdGBx_9gL
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abdee4d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=141_r4vzzXyHVjRiWNIA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_222326_984900_8B1F7A46 
X-CRM114-Status: GOOD (  32.16  )
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

This series adds 'gtrace' which is an architecture-neutral hardware trace
framework with RISC-V E-trace as its first backend. The 'gtrace' core framework
has the minimal shared plumbing (component registration, path create/destroy,
path start/stop, etc) and the RISC-V trace drivers are its first consumer.
It should be possible for the required ARM components to be adapted to the same
framework in a future.

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

These patches can also be found in the riscv_trace_support_v6 branch at:
https://github.com/mdchitale/linux.git

To test the patches, we need QEMU virt machine with RISC-V trace support
which can be found in rv-etrace branch at:
https://gitlab.com/danielhb/qemu.git

To capture gtrace data using perf on QEMU virt machine do the following:
1) Launch QEMU virt machine
   $ qemu-system-riscv64 -nographic -M virt -smp 2 -bios fw_dynamic.bin \
     -kernel Image -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
     -drive file=rootfs.img,id=disk1,if=none,format=raw \
     -device virtio-blk-device,drive=disk1
2) Run perf record to capture gtrace data
   $ perf record --all-cpus -e gtrace/event=0x1/ <command>
3) The step2 would create a perf.data file which has the gtrace data.
   Now run perf report -D and look for PERF_RECORD_AUXTRACE event
   section(s) which point(s) to the actual gtrace data offset.

Changes since v5:
 - Moved the DT connection parsing into the gtrace core as gtrace-of.c.
 - Added start_count and a lock to the core's private component data
   to serialize start/stop/copyto_auxbuf operations. Dropped
   perf_buf_lock.
 - Added handling of partially enabled path by disabling all enabled
   components
 - Added cycle detection when walking the trace component graph
 - Added trace source ID configuration in the encoder driver
 - Added trace format (E-Trace/N-Trace) selection via the platform driver
   compatible string. It is used by encoder and perf drivers to set it
   into hardware and perf data header respectively
 - Modified the ramsink buffer setup to read back the trRamStart and
   trRamLimit registers, and program the sync frequency, memory format
   and stop-on-wrap settings at start time
 - Improved error handling and added path owner in the perf driver
 - Fixed several issues reported by sashiko-bot but some of its findings
   are deferred to a later version.

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
 drivers/hwtracing/gtrace/Makefile             |   9 +
 drivers/hwtracing/gtrace/gtrace-core.c        | 858 ++++++++++++++++++
 drivers/hwtracing/gtrace/gtrace-of.c          | 126 +++
 drivers/hwtracing/gtrace/gtrace-perf.c        | 390 ++++++++
 drivers/hwtracing/gtrace/rvtrace-encoder.c    | 236 +++++
 drivers/hwtracing/gtrace/rvtrace-platform.c   | 186 ++++
 drivers/hwtracing/gtrace/rvtrace-ramsink.c    | 357 ++++++++
 drivers/hwtracing/gtrace/rvtrace.h            | 121 +++
 include/linux/gtrace.h                        | 332 +++++++
 include/uapi/linux/perf_event.h               |   5 +
 tools/include/uapi/linux/perf_event.h         |   5 +
 tools/perf/arch/riscv/util/Build              |   1 +
 tools/perf/arch/riscv/util/auxtrace.c         | 221 +++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/auxtrace.c                    |   4 +
 tools/perf/util/auxtrace.h                    |   1 +
 tools/perf/util/gtrace-decoder.c              |  95 ++
 tools/perf/util/gtrace.h                      |  18 +
 24 files changed, 3160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
 create mode 100644 drivers/hwtracing/gtrace/Kconfig
 create mode 100644 drivers/hwtracing/gtrace/Makefile
 create mode 100644 drivers/hwtracing/gtrace/gtrace-core.c
 create mode 100644 drivers/hwtracing/gtrace/gtrace-of.c
 create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace.h
 create mode 100644 include/linux/gtrace.h
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/gtrace-decoder.c
 create mode 100644 tools/perf/util/gtrace.h


base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
