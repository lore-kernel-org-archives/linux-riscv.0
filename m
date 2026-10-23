Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24989606A322
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DlyclclG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xX/s8oY4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AnYWz2/f3tqXYw51haODqKD+zXQDERoL3dgS3vbmHwk=; b=DlyclclG7eNkjvnBzvFdCw+gbq
	MstnuJtQ6879bHFER0kkaRmMx0VxtB8X5t3QjdVd7c/c3pF+AuKxu3ox83PANVaB/ccV98tBSqIzJ
	X7Sk2sQAkKpxI9XpC6MGak1L331HytbMW0cJmMOdJ36YYxoNabMvQHn0TiyE8JRm0MQnC4IIrMPCM
	udYhI7S/h6oB0TTlrkcHCwxcPghMjlxs1Dx4i1CU0ollEWId0SjWB38WTrxy05Qcda2N/WqGchv+J
	CwWEqDiAP1AcWsnRPPAbSIsp++070yfJDYFizpi9iAPll9Ey3g/DkmXm2fl9crQTCJJipeyiwR91e
	avXhiV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5li-0000000FO5V-1RbE;
	Fri, 23 Oct 2026 03:16:34 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5lc-0000000FNzQ-1uJJ
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725317;
	bh=/+OBVE/Me7wEWOm6ldjM3ZEGj39Ns2tsxw7jm+cZTw4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=xX/s8oY4qj3dDrs+65/AD8GQQOEuo9Ovl1Z8tuL043o9GDCptoVOk3cfQuWoN/lb6
	 LbWbrW6ofbOe3Nw/RzdCH/CYnmMhefTyW6sDLmFw2R/ly9cDNQq/hKayapnquKw6lA
	 jQ/GwnDdzYlQMK02s80SZSGLPmUxx+RJWnoNFl5A=
X-QQ-mid: esmtpsz11t1792725309ta2dc2b13
X-QQ-Originating-IP: fzUFc1qThgCG/nO0+/karSV+umYCChlVbo/2w+Kkn5E=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6793098632900412021
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 00/24] Add Linux RISC-V trace support via the gtrace framework
Date: Fri, 23 Oct 2026 11:14:41 +0800
Message-Id: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N24tt1jDfpaBosf/p6Jy+EPQY13qcDYI/Ql4j6E+HJF5JGqQN6fS1Aii
	v92ub5R8mwdrUzFvuL3dBO4VZyO8Bgnu6Q70qBvEC7jNgaC9JYgaDSq97PyKsHwwcw25//L
	RBOocxgirIXtLas9hcMIlh5KzvP9N+wpZL4uqKkakeFYb71uMa1T4D9hqBiWAdQxUrKFRtz
	KVCPnf9ZqG+NlMuc7wBvbiwGjtCblbqdLgXNBzPO8KUeTTnO49d5pEfiMkfliDTGjp6u4px
	Jl8slJ1uuYugNrdLMnHytsMS2LjZFxqSZ0ntzP6JmhFuE483cKGcpgIOfub6wkTlhmDkM1i
	XGxPK85rF7/jE2OAfqLLnvxly9UTvAVKG9E2WD+X50mDOilUYRMcWC1w4yt1Xl7JyV4ctaI
	ekva0PV0ALT0kEkyGNFk9xE4565x55gFRPn/Jlno8MEA+bEuylSBMh+D4HHOEx7/FUZjUGf
	HAO9Ji9l4d2yfbqLDw81Wn5AcCICn1E0FOPwYuRrvdZpDTavp0ly9C3BLMDEbMnGWgprM+H
	YKCd302cQYWnMn26Gxr8wnBXCwc5pHW/F4LP8ybmU8ywF1ofpRv4quaSzV1yiVqxJkS+Z9C
	ndC5ynUJv7IwN1QA7x6I6oaraY7t/yaw9s/rfwZECnKRz7LxQxTZ79YZ4j/fy1gzhH9Pzvr
	lf5YvgtkMDI6v547E5vQURf1K3rbuOmZ30/T3aID09CJfhueztfMJk6whpylukeEFk5d2nC
	OVxQimfB/lXusxa1AdgPIsCTlx+fORA1S09gaJXEgniIi4dkNNsdzKr16QC8QIp6q6aB4Pp
	LpdxH7iNBMEI3CKucSTbDtbQWvZtN41RN+q69cx39XVRYcoU/S2SYLURg5832t7euZxlwK1
	Sq0Apu0//s7LFktsFRYc507KIFRaVOG8CkXtsOnMts4l7bLbqb/r3GB9XPwr5Gj/XQoShes
	SwFxO2uAwsB2zBVIfyz95B/j6S4qxtwTNV2xr3e//bkdNRsT7b8ZUx9PBdjRlMvoCFuTQOj
	uwt4adTWrfgyk0Okq9SGej2rLBck8S57FuPWIO3uziCf485yzLxDoihmmuLHAiHFbp9ym/W
	vT58ibQ/jIn
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201628_803282_41D02AA9 
X-CRM114-Status: GOOD (  13.55  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds Linux RISC-V trace support via the generic hardware trace
(gtrace) framework [1].  The RISC-V trace encoder, funnel, ATB bridge, and
timestamp components are implemented as gtrace components, and the CoreSight
funnel and TMC (ETB/ETF/ETR) are likewise re-implemented as gtrace components
so that they can be composed with the RISC-V components into a single trace path.

This work supersedes the earlier CoreSight-based RFC [2]. Instead of forcing
the RISC-V trace IP to conform to the CoreSight device, this series shifts
the topology onto the gtrace framework to achieve cleaner architectural
decoupling and shared data paths.

The series includes:

- gtrace sysfs support, exposing per-component attributes (control,
  features, and timestamp) for configuration and validation
- gtrace component drivers for the RISC-V trace encoder, funnel, ATB
  bridge, and timestamp components
- gtrace component drivers for the CoreSight dynamic funnel and TMC
  (ETB/ETF/ETR), built on top of the CoreSight platform core APIs
  (CLAIM/device registration) re-implemented as gtrace components
- perf PMU support: gtrace event format attributes, per-event configuration
  parsing, and an AUX flag marking CoreSight-formatted trace data
- perf tooling: a Nexus (N-Trace) decoder and a gtrace AUX decoder that
  synthesizes branch samples, including machine-mode instruction access

Verification on K3 SoC:
The device tree follows [1], with only the compatible properties changed for
the gtrace components.

# perf list pmu
  gtrace//                                          [Kernel PMU event]

# perf record -e gtrace// --per-thread uname
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 1.946 MB perf.data ]

# perf script
uname  767863          1                          branches:  ffffffff80d18b04 gtrace_poll_bit+0x34 ([kernel.kallsyms]) => ffffffff80d18b12 gtrace_poll_bit+0x42 ([kernel.kallsyms])
uname  767863          1                          branches:  ffffffff80d18b4e gtrace_poll_bit+0x7e ([kernel.kallsyms]) => ffffffff80d18b6c gtrace_poll_bit+0x9c ([kernel.kallsyms])
uname  767863          1                          branches:  ffffffff80d1c17a rvtrace_encoder_start+0x112 ([kernel.kallsyms]) => ffffffff80d1c196 rvtrace_encoder_start+0x12e ([kernel.kallsyms])
uname  767863          1                          branches:  ffffffff80d18782 gtrace_path_start+0xbe ([kernel.kallsyms]) => ffffffff80d18702 gtrace_path_start+0x3e ([kernel.kallsyms])
uname  767863          1                          branches:  ffffffff80d18712 gtrace_path_start+0x4e ([kernel.kallsyms]) => ffffffff80d18724 gtrace_path_start+0x60 ([kernel.kallsyms])
...

In per-cpu mode, correlating trace data with the running task requires
the encoder to emit a context ID.  This depends on writing the task PID
to the RISC-V scontext CSR on context switch [3].

[1] https://lore.kernel.org/all/20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260414034153.3272485-1-liangzhen@linux.spacemit.com/
[3] https://lore.kernel.org/all/20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com/

Zane Leung (24):
  gtrace: Move connection release into component unregister
  gtrace: Initial implementation of gtrace sysfs framework
  gtrace: Drop trace format field and helper function
  gtrace: Add RISC-V trace encoder sysfs support
  gtrace: Introduce some PMU format attributes
  gtrace: Replace owner PID with perf_event pointer in gtrace_path
  gtrace: Parse RISC-V Trace encoder config from perf event
  gtrace: add perf symlink support for gtrace components
  gtrace: Add port-level start/stop driver callbacks
  gtrace: Add RISC-V trace funnel driver
  gtrace: Add RISC-V trace timestamp support
  gtrace: Add RISC-V trace ATB bridge driver
  gtrace: Add CoreSight platform core APIs
  gtrace: Add CoreSight funnel driver
  gtrace: Only copy AUX data from the path sink
  perf: Flag whether gtrace AUX data carries CoreSight framing
  gtrace: Unify default sink selection across CPUs in perf setup
  gtrace: Add sink-specific buffer alloc/free callbacks
  gtrace: Add setup_sysfs_buf callback to setup sysfs sink buffer
  gtrace: Add CoreSight TMC driver support
  perf tools: riscv: making gtrace PMU listable
  perf tools: Add Nexus RISC-V Trace decoder
  perf tools: gtrace: Record and parse trace encoder metadata
  perf tools: gtrace: Add AUX trace decoder and branch sample synthesis

 .../hwtracing/coresight/coresight-tmc-etf.c   |    1 -
 drivers/hwtracing/gtrace/Kconfig              |   70 +
 drivers/hwtracing/gtrace/Makefile             |   12 +-
 drivers/hwtracing/gtrace/coresight-funnel.c   |  430 ++++
 drivers/hwtracing/gtrace/coresight-platform.c |  279 +++
 drivers/hwtracing/gtrace/coresight-tmc-core.c | 1111 ++++++++++
 drivers/hwtracing/gtrace/coresight-tmc-etf.c  |  573 +++++
 drivers/hwtracing/gtrace/coresight-tmc-etr.c  | 1888 +++++++++++++++++
 drivers/hwtracing/gtrace/coresight-tmc.h      |  469 ++++
 drivers/hwtracing/gtrace/coresight.h          |  212 ++
 drivers/hwtracing/gtrace/gtrace-core.c        |  165 +-
 drivers/hwtracing/gtrace/gtrace-perf.c        |  122 +-
 drivers/hwtracing/gtrace/gtrace-sysfs.c       |  452 ++++
 drivers/hwtracing/gtrace/rvtrace-atbbridge.c  |  153 ++
 ...trace-encoder.c => rvtrace-encoder-core.c} |  182 +-
 .../hwtracing/gtrace/rvtrace-encoder-sysfs.c  |  323 +++
 drivers/hwtracing/gtrace/rvtrace-encoder.h    |   61 +
 drivers/hwtracing/gtrace/rvtrace-funnel.c     |  220 ++
 drivers/hwtracing/gtrace/rvtrace-funnel.h     |   29 +
 drivers/hwtracing/gtrace/rvtrace-platform.c   |   26 +-
 drivers/hwtracing/gtrace/rvtrace-ramsink.c    |   11 +-
 drivers/hwtracing/gtrace/rvtrace-timestamp.c  |  336 +++
 drivers/hwtracing/gtrace/rvtrace-timestamp.h  |   44 +
 drivers/hwtracing/gtrace/rvtrace.h            |    5 +
 include/linux/gtrace.h                        |  161 +-
 include/uapi/linux/perf_event.h               |    1 +
 tools/arch/riscv/include/asm/insn.h           |  645 ++++++
 tools/include/uapi/linux/perf_event.h         |    1 +
 tools/perf/arch/riscv/util/Build              |    1 +
 tools/perf/arch/riscv/util/auxtrace.c         |  203 +-
 tools/perf/arch/riscv/util/pmu.c              |   19 +
 tools/perf/builtin-script.c                   |    4 +
 tools/perf/util/Build                         |    1 +
 tools/perf/util/gtrace-decoder.c              | 1283 ++++++++++-
 tools/perf/util/gtrace.h                      |   30 +-
 tools/perf/util/rvtrace-decoder/Build         |    2 +
 .../util/rvtrace-decoder/rvtrace-decoder.c    |  423 ++++
 .../util/rvtrace-decoder/rvtrace-decoder.h    |  122 ++
 .../rvtrace-decoder/rvtrace-ntrace-decoder.c  |  910 ++++++++
 .../rvtrace-decoder/rvtrace-ntrace-decoder.h  |  124 ++
 tools/perf/util/symbol_conf.h                 |    2 +
 41 files changed, 10926 insertions(+), 180 deletions(-)
 create mode 100644 drivers/hwtracing/gtrace/coresight-funnel.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-platform.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc-core.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc-etf.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc-etr.c
 create mode 100644 drivers/hwtracing/gtrace/coresight-tmc.h
 create mode 100644 drivers/hwtracing/gtrace/coresight.h
 create mode 100644 drivers/hwtracing/gtrace/gtrace-sysfs.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-atbbridge.c
 rename drivers/hwtracing/gtrace/{rvtrace-encoder.c => rvtrace-encoder-core.c} (55%)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-encoder.h
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-funnel.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-funnel.h
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-timestamp.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-timestamp.h
 create mode 100644 tools/arch/riscv/include/asm/insn.h
 create mode 100644 tools/perf/arch/riscv/util/pmu.c
 create mode 100644 tools/perf/util/rvtrace-decoder/Build
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-decoder.c
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-decoder.h
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.c
 create mode 100644 tools/perf/util/rvtrace-decoder/rvtrace-ntrace-decoder.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
