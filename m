Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181FB606A32C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IVbhK0vS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mGpwOGj6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XaX1ize0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9bk1iNCbrXuUITGmogOt4ZBlxswc1Cs0q9o3BH5rvPg=; b=IVbhK0vSF8+saRqR6H/hvltw+Q
	ayqzaWQT7RybklhaV+dy8I3SPGcJwMqefNjKuBgjAPIJd30+3E321o3hL1Ys+D7Ly3Ksv7xAm8Dtu
	bd1uavyyCRPsyB+Folh+1QGD+6eiw5rG08xsEjqwIMmXBv4GQbMKlv3xyGDaIswldXqke1usQ9koz
	lp3TfB2KZb9tbWFL1WF96vm4zOyfPJW5yk651iWJ1YC08WZD2FhSri7uv5MMO8TRo+QYMOKxNxLKi
	cY7oL9D9nwY7Cmj4qkLB59PywDTuSPgQ0USlMioLLrl4lOW5TZp0jQKvOB66WTjWGsVWQ1NXyGOpx
	xq1HKb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWCx-0000000CeJC-2Y7B;
	Thu, 26 Nov 2026 09:56:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWCt-0000000CeI6-2hmJ
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:56:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AuYt2594835
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xzFtEnnMvUZB8HXLsnBaAj29AuZlF1pQol2
	u34yaw3w=; b=mGpwOGj6xIJqGyO/JwShyTu4uIcdDwj8DyJdmRzsUzndzNhYMGe
	D2HodX+oGO3fy/QiHC9KyDsibwI+FZ88tuwpKKvVIGcHAXl1SqnYVXTrgm7A5Tv4
	4mBzL5yXpwanV6YGRFB+ePz8+tnYKQKEKTLpGF8raKNlmQfzD1W4MpBVp2Sz3nJ3
	v915BE8BlaG6q+MQS7SzSuAh2ym++TszuTCNXLK9f5Yr3n2NOzOM10vq6bJnoDgA
	pfBiWgtlIFtbzODm9yVy/qAcUcgaOR5ri+YhOHHxIF0Hxa76D0G7zqfQU064eNuA
	3pM5LyWznurOrCVj6ldAm4ovZAqT5TGOtKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sajyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:55:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b456fee3b2so4617609a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686957; x=1796291757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzFtEnnMvUZB8HXLsnBaAj29AuZlF1pQol2u34yaw3w=;
        b=XaX1ize0ruQyHLl7q5308UCkZaRmm04pjmYDLIO/V5s3cCigM12qy9pDW0T2xks3u7
         4VjMrL6oE8cCo2IXpWXSnUr1GeFcgjJ6dOjR6HTaYewnJM7/X5bKRCSSWwJbwBlHs4s5
         RLsfl8NlmaR/9B2lXxOth5PbM10RgGFF1bTV8DxaOvG1pidUS5ha3n0s3YnVNYQKs1gS
         KOUiunzKxLF0NZxBGCVLFnkmQtOitb690kJ8vdqTimRVquBtajneg4QQXIxIULHFWp34
         bUMqaJfkM9hvwmTAKJSdgz00XWuiH+zX6POxMOgsQThefdXUuWSUSw/Jqrtlw+qti02X
         x4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686957; x=1796291757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzFtEnnMvUZB8HXLsnBaAj29AuZlF1pQol2u34yaw3w=;
        b=qYBwakgxx7oYlKQ3o8aV1UmM7ITLyV3uOiNbC3pzrqmHYwa45vaPfvLIFKeh/0WQHu
         TflmWahXUXNbqXVdJVV/R4oEApvgjOVI7YJ6qXOffZqC1+jKY2oUEq+DjdsCT7jV8AP7
         XhHXp5Zv6P9TgVFOJWDUTzJ28JloiQyuCPnFdcVWu2/ze4CdHi+vdvmpQIPZ00c9WpDL
         t5Fbt+hNuJszLvWvN5/g4bhbTmvksL5EjycdxidhYZqeY+ZVumj9KbWXKVqUHfALMXN+
         5AlbKfYrLkcLhCuOhBIa1Zu9twIKXq+K2WrVcsBathyd/2fKMS5CVfIQsqZLsR37VlT/
         TIag==
X-Forwarded-Encrypted: i=1; AL+hErGgZn3KHlpwDbHOwUCxGyuYPNf0AYP4QgsAn+kwkX3jdTdI7fKhu84GwvCVB/8RL+L0VBjr6By6OnWT6Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z9/gFVvOV9zb3REFxCKKEZcooD5KmtBL4DKTM82zx4G4kLNTRlm
	lD1BdTU4eEtxUN2fufxl+F1+yw+72N6kSywh0kbhYhh+FoJXCdp8qSNesT5INmvF/K4skBs6mKx
	CA+03UJNt5aC970lMUn+vzFbYk6fpzIGGqZkl3pscPC3XrBcgeCknSN4rIFFnCjPGm8nrSuU=
X-Gm-Gg: AZFdTZcHnRGuhwTRRoT2yJy1JYBAGM6hmxUeisrECfDUn/0Kj1Ki5c9UFUhDfYUerfx
	/chJ2K629CZVV5/CQ+xiAPWo/n49s1rzLli8f7UXukpTVtjBOtxPgkIMEv60NKVNlgKlF8TBhRS
	XUBhGSmHRibgP6ynY8UmMPXx+PM7zz+U7uJWjT+xkf3X9k7+aZiFvMhK5seuj46u/HKhCy+MDaJ
	mjl5kJSt69ysFCQIjbT/Q82tFI2pvwpSlUS25NufbzkIsQJnkXPcC+pTgfRf6ynCUlveHAn0cXs
	YiBwcVIgqUJr3ktlutXzSC/MxbSpSREbfZMDegoX47/ab9xE2r83TOW2aDXv5XvdpAuX6QIdRVI
	f+XT5hgtXLp0IvinR8UOUknAfI8zSxFGX4iW/QHZQVxkQKvyW89y40P7K+HwlbxxD/1oDFknMka
	Lz3jp6dhXcXsDyduvqZQ2N1VFKq6gne3d2DGY7EblC8S11nTkzDsGg52BBbtIabgrss56RGz4J+
	w==
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr17902937a91.1.1795686957364;
        Thu, 26 Nov 2026 01:55:57 -0800 (PST)
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr17902915a91.1.1795686956799;
        Thu, 26 Nov 2026 01:55:56 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:55:56 -0800 (PST)
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
Subject: [PATCH v7 00/14] Linux RISC-V trace framework and drivers
Date: Thu, 26 Nov 2026 15:25:21 +0530
Message-ID: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b08022e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=S-okXXNRuRpZkZdKB-YA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: O3vxlZiH6SWn-isHlluh2Lm_5Ewcove7
X-Proofpoint-ORIG-GUID: O3vxlZiH6SWn-isHlluh2Lm_5Ewcove7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXyOmJqmbTCHKU
 aN+6HPkXIPldmmquLZxAj9FuoFbk4ITmsWPZl6akFmm/EBD3TPdbdnhvZCD7Ygrg0Ah6TSBnixk
 JbzwsvkrFCNJq1imv+QzvNqfteVaoN/8Xtl6GuDxpcFiQetBffsvcwk1zM/BBj3sks1XT0MfEJG
 6vKdS5GOGcD5FsZYJdMCmQTXTfA3ZTzosbhlqISBQlnFtSR+3uycrXq8HKRmKw5H2vwK8VArQKo
 rAcjlpNNil1mem4IiYZvrGvdmjZ+9hv9NoGYxkflls2VJb/ZKnm9IwNnRbJovlKpvGRInio5LR0
 JbojgYw/Cj305/CcmCAncAM2oXyH1nuaWGEgZbVmnS6JSWQrJFvxVk6vUNcaK6GnJJLglxdp5oJ
 aORvz+akIUoYVKCZsFF3Nyb4ESU53SZzmVoo4Nj6MZ3SH1ZRBHMlI+25D7RrbT7l5EA4RTqEl3b
 395Gb3QvIkXMYtQsfMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX5+J13WDJrYy9
 YuhhV8quzKaXsaN8IGZcy1EcemIWTsu57XD+iUiHF43ngA/hzq9AEWnFNIJPMnxa0uZw1V/IrSh
 vEjMeWArFP2lEwE4/7BnRa/l6y19n9E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015559_694141_E6C9516A 
X-CRM114-Status: GOOD (  30.84  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds 'gtrace' which is an architecture-neutral hardware trace
framework with RISC-V E-trace as its first backend. The 'gtrace' core framework
has the minimal shared plumbing (component registration, path create/destroy,
path start/stop, etc) and the RISC-V trace drivers are its first consumer.
It should be possible for the required ARM components to be adapted to the same
framework in a future.

This series also adds initial support for RISC-V trace component drivers.
The RISC-V trace v1.0 specification is already ratified and can be found at:
https://github.com/riscv-non-isa/e-trace-encap/releases/tag/v1.0.0-ratified
https://github.com/riscv-non-isa/tg-nexus-trace/releases/tag/1.0_Ratified

The drivers use the common trace control interface. E-Trace remains the
preferred format for the generic RISC-V compatible string; the encoder now
reads back the accepted hardware format and updates the component's format.


In the future, there will be subsequent series adding:
1) Sysfs support
2) ACPI support
3) More trace drivers (such as funnel, ATB, etc)
4) Support for upcoming self-hosted trace specification
5) Arm component support under the gtrace framework
6) ... and more ...

These patches can also be found in the riscv_trace_support_v7 branch at:
https://github.com/mdchitale/linux.git

To test the patches, we need QEMU virt machine with RISC-V trace support
which can be found in rv-etrace_v4 branch at:
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

Changes since v6:
 - Rebased on latest upstream
 - Add a gtrace component type of NONE version-zero components can match
 - Hold gtrace component references for firmware-node and CPU-source lookups,
 - Detach incoming/outgoing connection pointers before removing components
 - Balance temporary OF node references and outgoing references on parser
   and platform-probe failures; fix the CPU-node diagnostic lifetime and
   the OF module device table declaration.
 - Use a spinlock to guard trace-ID and component ready callbacks 
 - Probe SRCBITS using all possible allowed widths and select the final
   allowed width
 - Read back the trace format (e-trace/n-trace) supported by hardware and update
   platform driver state accordingly
 - Make ramsink register-pair helper functions generic to gtrace
 - Copy AUX data from the actual path sink and not the first component that implemented
   the aux copy callback.
 - Pass the available AUX byte limit to the core and sink callbacks
   whereas sink driver returns the actual byte count and AUX flags.
 - Release AUX mappings data directly in free_aux() instead of deferring it via workqueue
 - Set the AUX_OUTPUT_HW_ID to the encoder's hardware source ID 
 - Other fixes for issues reported by Sashiko bot
   
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
 drivers/hwtracing/gtrace/gtrace-core.c        | 962 ++++++++++++++++++
 drivers/hwtracing/gtrace/gtrace-of.c          | 133 +++
 drivers/hwtracing/gtrace/gtrace-perf.c        | 368 +++++++
 drivers/hwtracing/gtrace/rvtrace-encoder.c    | 274 +++++
 drivers/hwtracing/gtrace/rvtrace-platform.c   | 194 ++++
 drivers/hwtracing/gtrace/rvtrace-ramsink.c    | 366 +++++++
 drivers/hwtracing/gtrace/rvtrace.h            | 121 +++
 include/linux/gtrace.h                        | 382 +++++++
 include/uapi/linux/perf_event.h               |   5 +
 tools/include/uapi/linux/perf_event.h         |   5 +
 tools/perf/arch/riscv/util/Build              |   1 +
 tools/perf/arch/riscv/util/auxtrace.c         | 220 ++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/auxtrace.c                    |   4 +
 tools/perf/util/auxtrace.h                    |   1 +
 tools/perf/util/gtrace-decoder.c              |  99 ++
 tools/perf/util/gtrace.h                      |  17 +
 24 files changed, 3356 insertions(+)
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


base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
