Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C26EF531D0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7UIWOCNXdhrEbFsuF+2hDOWUzrxCezMpAYCwI9vtntk=; b=FErDU3CW2eZshk
	t9okrRyJnrzNPc/pAOLHf/WUZH2Qael5S/LDYXa6DkJa0cgMzy5xQfHpPx9LLMFD5oD2lbW1IHRGn
	A854jc1jGEsTTjSzGloISdt/9LUu9mmmdAHwwSDSU2qip5OXZxjkh3+2JYwyKLb9dDvy2leins7Sy
	8ljjdNqBFlvNlPRCgwknfXaeXP7UDGWpA0euAlu9l/czBsViCc0UdR9krljQ1Q82dLELGZbVZGmjh
	yE3xkbaAjiiKRD26uBIzhbEhLt06y4tzUZevBI0vv2HRXG8RIpVMg5CXN6DocDlURT1Lkx5c7KiwV
	ri8R7IhW77TRy+n5U1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUgD-0000000GekR-03ny;
	Tue, 14 Apr 2026 03:43:13 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUg9-0000000Geif-31yY
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138126;
	bh=ewJEcVxzQg5yFnn0UVM01TiBYohNAhJ1QOu6osabAAI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=SpEXsDS1IQMSJyatYezjldCbPaTk7QQDJrTf0UZvyuIEnr8nEkgVu4/eWyPwhCDX+
	 Rp4yp1nvkvDWCvYk+2XF/2pDKysuylYvmkNi/i+BspSr4cIkqGoAKw2oqYVnUcaqb4
	 9XRjHzMCrvaY48USsZtqgdBNe+lCNnAIy6Ee5eWQ=
X-QQ-mid: zesmtpsz5t1776138117t0d934813
X-QQ-Originating-IP: heSnuVTojV6EL2mpk/sCZZ/ZqnIPp7qXlrr4bx4mCJ0=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:41:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1036333238410535187
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gregkh@linuxfoundation.org,
	alexander.shishkin@linux.intel.com,
	irogers@google.com
Cc: coresight@lists.linaro.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	anup.patel@oss.qualcomm.com,
	mayuresh.chitale@oss.qualcomm.com,
	zhuangqiubin@linux.spacemit.com
Subject: [RFC PATCH 00/12] Add Linux RISC-V trace support via CoreSight
Date: Tue, 14 Apr 2026 11:41:41 +0800
Message-Id: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MwVR+5AyjF6hsnZQd9+VXi2DJWT8TikXRyBpaD4K+cN5AajqG2kwOF0I
	qMaltlVuaRA2hyOPvBwm+9Fwd8OxtVvSMrhz+451mjdslC7X2AihcTGCHVcZ1+gTOwAL6oX
	V3IrkYlkM9KCbkEeycLDyDOznbOMecZqjvYooQJnG/7UtdMkYRRIHFDzJcZ9bXBU3hV7vf8
	80D8xBrLKY5lcSf033Sx3DUIz4dbJ18u+fzjxJDqBe0Skmrku17Qrxs6cg0zT128u/LebV5
	yN3Jz2nHUa3u03Znth2B81aOa3YttWpL/i9GAz0+NWrhKigmjGU1A/jBURzX6lrOyl73HS6
	p9WiXp8K3eHpUPlrA97byZ53/BiChGENcsg1mA+bU8FLSRCza6z4HXHg7mTnrawMElTlLrs
	gGKivLbBA+wNeFz5CtDv6Fw9QQxcf2nJt/PxO5s4SFiXfuoRzmxL9drvUNA8osV+DbP6NFH
	A/bNSROVI+intTcnwm9P/TMkJBr1e2DAjzOznXw6ozaVHw3KJO8Qcih3Ius9QENwAvZQ6al
	25rLXDjyqr33vg3uH/aBilMK+5SuQk9/oec0CUBiamrx8K88y0f6+AJiQjCpsmRX4Don3K+
	MBIs3bxx3aDAsjs78tAd3ZwhdLKVLg+hWP9OFDYGGJt0VBOMSfzdcHk7Kon5EyYORfVUjKg
	aERJcoH3tgXQQMJ06Qz1K6K9CS8UNu1C0t2exquIM2VyG+Zz8hvpGhbTtNCpLChahjjU8Pi
	24Dr4h4ChJzVJFb0FvzVi5K4cpi+g8FSd6SW42yUn4gIBvK0j8Wh8Cej8iH9pWRrW9LA6+T
	n6q4xW0OrRnW54BVA2ULkaidcL/uUQGy5NRpLO9FWw+8+k2jFvKnxMwJ7k3eMCxiDElPXtF
	xiURo/r7EVPketfOoU7o26rxKPQTO1gXf/PA9+5HJR3O6kR/ga8AM/9oJ7EWKEN+z5SOWKA
	pJWWIHg6a9RFGny25WDr2ac0PqHY6Tg59LOs1Zfzag2bYw8qLmFZUSwTn8rXPrNtFvu0wzZ
	22QAPwEvhchWFe4YzfKaK5ty9ai5lnbnZz6IoaEdKEAuPDhvhdxNhXDuGaaUzT4N3zAV+gD
	ZAdLqPG2OlQYMdh7amG4Kln9vI/T8/A9b0dOoRnz5dDktcFKwSZ8/vEKvwHp6yXrg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_204310_360128_C30949A1 
X-CRM114-Status: UNSURE (   5.20  )
X-CRM114-Notice: Please train this message.
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

From: liangzhen <zhen.liang@spacemit.com>

This series adds Linux RISC-V trace support via CoreSight, implementing RISC-V
trace drivers within the CoreSight framework and integrating them with perf tools.
The K3 SoC contains RISC-V Encoder, Funnel, ATB, CoreSight Funnel, and CoreSight TMC
components, which can be directly leveraged through the existing CoreSight infrastructure.

Linux RISC-V trace support form Anup Patel:
(https://patchwork.kernel.org/project/linux-riscv/cover/20260225062448.4027948-1-anup.patel@oss.qualcomm.com/)
which currently lacks ATB component support and guidance on reusing CoreSight components.

The series includes:
- RISC-V trace driver implementation within the CoreSight framework
- RISC-V Trace Encoder, Funnel, and ATB Bridge drivers as CoreSight devices
- RISC-V trace PMU record capabilities and parsing events in perf.
- RISC-V Nexus Trace decoder for perf tools

Any comments or suggestions are welcome.

Verification on K3 SoC:
To verify this patch series on K3 hardware, the following device tree are required:
1. RISC-V Trace Encoder node (8)
2. RISC-V ATB Bridge node (8)
3. RISC-V Trace Funnel node (2)
3. CoreSight Funnel configuration for RISC-V (1)
4. CoreSight TMC configuration for trace buffer (1)

/{
        dummy_clk: apb-pclk {
                compatible = "fixed-clock";
                #clock-cells = <0x0>;
                clock-output-names = "clk14mhz";
                clock-frequency = <14000000>;
        };


        soc: soc {
                #address-cells = <2>;
                #size-cells = <2>;

                encoder0: encoder@d9002000 {
                        compatible = "riscv,trace-encoder";
                        reg = <0x0 0xd9002000 0x0 0x1000>;
                        cpus = <&cpu_0>;
                        out-ports {
                                port {
                                        cluster0_encoder0_out_port: endpoint {
                                                remote-endpoint = <&cluster0_bridge0_in_port>;
                                        };
                                };
                        };
                };

                bridge0: bridge@d9003000 {
                        compatible = "riscv,trace-atbbridge";
                        reg = <0x0 0xd9003000 0x0 0x1000>;
                        cpus = <&cpu_0>;
                        out-ports {
                                port {
                                        cluster0_bridge0_out_port: endpoint {
                                                remote-endpoint = <&cluster0_funnel_in_port0>;
                                        };
                                };
                        };
                        in-ports {
                                port {
                                        cluster0_bridge0_in_port: endpoint {
                                                remote-endpoint = <&cluster0_encoder0_out_port>;
                                        };
                                };
                        };
                };

...

                cluster0_funnel: funnel@d9000000 {
                        compatible = "riscv,trace-funnel";
                        reg = <0x0 0xd9000000 0x0 0x1000>;
                        cpus = <&cpu_0>, <&cpu_1>, <&cpu_2>, <&cpu_3>;
                        riscv,timestamp-present;
                        out-ports {
                                port {
                                        cluster0_funnel_out_port: endpoint {
                                                remote-endpoint = <&main_funnel_in_port0>;
                                        };
                                };
                        };
                        in-ports {
                                #address-cells = <1>;
                                #size-cells = <0>;

                                port@0 {
                                        reg = <0>;
                                        cluster0_funnel_in_port0: endpoint {
                                                remote-endpoint = <&cluster0_bridge0_out_port>;
                                        };
                                };

                                port@1 {
                                        reg = <1>;
                                        cluster0_funnel_in_port1: endpoint {
                                                remote-endpoint = <&cluster0_bridge1_out_port>;
                                        };
                                };

                                port@2 {
                                        reg = <2>;
                                        cluster0_funnel_in_port2: endpoint {
                                                remote-endpoint = <&cluster0_bridge2_out_port>;
                                        };
                                };

                                port@3 {
                                        reg = <3>;
                                        cluster0_funnel_in_port3: endpoint {
                                                remote-endpoint = <&cluster0_bridge3_out_port>;
                                        };
                                };
                        };
                };

                cluster1_funnel: funnel@d9010000 {
                        compatible = "riscv,trace-funnel";
                        reg = <0x0 0xd9010000 0x0 0x1000>;
                        cpus = <&cpu_4>, <&cpu_5>, <&cpu_6>, <&cpu_7>;
                        riscv,timestamp-present;
                        out-ports {
                                port {
                                        cluster1_funnel_out_port: endpoint {
                                                remote-endpoint = <&main_funnel_in_port1>;
                                        };
                                };
                        };
                        in-ports {
                                #address-cells = <1>;
                                #size-cells = <0>;

                                port@0 {
                                        reg = <0>;
                                        cluster1_funnel_in_port0: endpoint {
                                                remote-endpoint = <&cluster1_bridge0_out_port>;
                                        };
                                };

                                port@1 {
                                        reg = <1>;
                                        cluster1_funnel_in_port1: endpoint {
                                                remote-endpoint = <&cluster1_bridge1_out_port>;
                                        };
                                };

                                port@2 {
                                        reg = <2>;
                                        cluster1_funnel_in_port2: endpoint {
                                                remote-endpoint = <&cluster1_bridge2_out_port>;
                                        };
                                };

                                port@3 {
                                        reg = <3>;
                                        cluster1_funnel_in_port3: endpoint {
                                                remote-endpoint = <&cluster1_bridge3_out_port>;
                                        };
                                };
                        };
                };

                main_funnel: funnel@d9042000 {
                        compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
                        reg = <0x0 0xd9042000 0x0 0x1000>;
                        clocks = <&dummy_clk>;
                        clock-names = "apb_pclk";
                        out-ports {
                                port {
                                        main_funnel_out_port: endpoint {
                                                remote-endpoint = <&etf_in_port>;
                                        };
                                };
                        };
                        in-ports {
                                #address-cells = <1>;
                                #size-cells = <0>;

                                port@0 {
                                        reg = <0>;
                                        main_funnel_in_port0: endpoint {
                                                remote-endpoint = <&cluster0_funnel_out_port>;
                                        };
                                };

                                port@1 {
                                        reg = <1>;
                                        main_funnel_in_port1: endpoint {
                                                remote-endpoint = <&cluster1_funnel_out_port>;
                                        };
                                };
                        };
                };

                etf: etf@d9043000 {
                        compatible = "arm,coresight-tmc", "arm,primecell";
                        reg = <0x0 0xd9043000 0x0 0x1000>;
                        clocks = <&dummy_clk>;
                        clock-names = "apb_pclk";
                        out-ports {
                                port {
                                        etf_out_port: endpoint {
                                                remote-endpoint = <&etr_in_port>;
                                        };
                                };
                        };
                        in-ports {
                                port {
                                        etf_in_port: endpoint {
                                                remote-endpoint = <&main_funnel_out_port>;
                                        };
                                };
                        };
                };

                etr: etr@d9044000 {
                        compatible = "arm,coresight-tmc", "arm,primecell";
                        reg = <0x0 0xd9044000 0x0 0x1000>;
                        clocks = <&dummy_clk>;
                        clock-names = "apb_pclk";
                        arm,scatter-gather;
                        in-ports {
                                port {
                                        etr_in_port: endpoint {
                                                remote-endpoint = <&etf_out_port>;
                                        };
                                };
                        };
                };
        };
};

Verification case:

~ # perf list pmu
  rvtrace//                                          [Kernel PMU event]

~ # perf record -e rvtrace/@tmc_etr0/ --per-thread uname
Linux
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.191 MB perf.data ]
~ # perf script
           uname     137 [003]          1           branches:  ffffffff80931470 rvtrace_poll_bit+0x38 ([kernel.kallsyms]) => ffffffff80931492 rvtrace_poll_bit+0x5a ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff809328a6 encoder_enable_hw+0x252 ([kernel.kallsyms]) => ffffffff809328ba encoder_enable_hw+0x266 ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff80932c4a encoder_enable+0x82 ([kernel.kallsyms]) => ffffffff80932c36 encoder_enable+0x6e ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff80928198 etm_event_start+0xf0 ([kernel.kallsyms]) => ffffffff809281aa etm_event_start+0x102 ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff809281e6 etm_event_start+0x13e ([kernel.kallsyms]) => ffffffff8092755e coresight_get_sink_id+0x16 ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff8092820e etm_event_start+0x166 ([kernel.kallsyms]) => ffffffff80928226 etm_event_start+0x17e ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff801c3bb4 perf_report_aux_output_id+0x0 ([kernel.kallsyms]) => ffffffff801c3bd6 perf_report_aux_output_id+0x22 ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff801c3c5a perf_report_aux_output_id+0xa6 ([kernel.kallsyms]) => ffffffff801c3bf0 perf_report_aux_output_id+0x3c ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff801c3c40 perf_report_aux_output_id+0x8c ([kernel.kallsyms]) => ffffffff801c3aea __perf_event_header__init_id+0x2a ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff801c3b42 __perf_event_header__init_id+0x82 ([kernel.kallsyms]) => ffffffff801c3b4a __perf_event_header__init_id+0x8a ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff801c3bb0 __perf_event_header__init_id+0xf0 ([kernel.kallsyms]) => ffffffff801c3b58 __perf_event_header__init_id+0x98 ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff8004c658 __task_pid_nr_ns+0x0 ([kernel.kallsyms]) => ffffffff8004c696 __task_pid_nr_ns+0x3e ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff8004c71e __task_pid_nr_ns+0xc6 ([kernel.kallsyms]) => ffffffff8004c6a4 __task_pid_nr_ns+0x4c ([kernel.kallsyms])
           uname     137 [003]          1           branches:  ffffffff8004c6e4 __task_pid_nr_ns+0x8c ([kernel.kallsyms]) => ffffffff8004c6e4 __task_pid_nr_ns+0x8c ([kernel.kallsyms])
...

liangzhen (12):
  coresight: Add RISC-V support to CoreSight tracing
  coresight: Initial implementation of RISC-V trace driver
  coresight: Add RISC-V Trace Encoder driver
  coresight: Add RISC-V Trace Funnel driver
  coresight: Add RISC-V Trace ATB Bridge driver
  coresight rvtrace: Add timestamp component support for encoder and
    funnel
  coresight: Add RISC-V PMU name support
  perf tools: riscv: making rvtrace PMU listable
  perf tools: Add RISC-V trace PMU record capabilities
  perf tools: Add Nexus RISC-V Trace decoder
  perf symbols: Add RISC-V PLT entry sizes
  perf tools: Integrate RISC-V trace decoder into auxtrace

 drivers/hwtracing/Kconfig                     |    2 +
 drivers/hwtracing/coresight/Kconfig           |   46 +-
 drivers/hwtracing/coresight/Makefile          |    6 +
 drivers/hwtracing/coresight/coresight-core.c  |    8 +
 .../hwtracing/coresight/coresight-etm-perf.c  |    1 -
 .../hwtracing/coresight/coresight-etm-perf.h  |   21 +
 .../hwtracing/coresight/coresight-platform.c  |    1 -
 .../hwtracing/coresight/coresight-tmc-etf.c   |    4 +
 .../hwtracing/coresight/coresight-tmc-etr.c   |    4 +
 .../hwtracing/coresight/rvtrace-atbbridge.c   |  239 +++
 drivers/hwtracing/coresight/rvtrace-core.c    |  135 ++
 .../coresight/rvtrace-encoder-core.c          |  562 +++++++
 .../coresight/rvtrace-encoder-sysfs.c         |  363 +++++
 drivers/hwtracing/coresight/rvtrace-encoder.h |  151 ++
 drivers/hwtracing/coresight/rvtrace-funnel.c  |  337 ++++
 drivers/hwtracing/coresight/rvtrace-funnel.h  |   39 +
 .../hwtracing/coresight/rvtrace-timestamp.c   |  278 ++++
 .../hwtracing/coresight/rvtrace-timestamp.h   |   64 +
 include/linux/coresight-pmu.h                 |    4 +
 include/linux/rvtrace.h                       |  116 ++
 tools/arch/riscv/include/asm/insn.h           |  645 ++++++++
 tools/perf/arch/riscv/util/Build              |    2 +
 tools/perf/arch/riscv/util/auxtrace.c         |  490 ++++++
 tools/perf/arch/riscv/util/pmu.c              |   20 +
 tools/perf/util/Build                         |    3 +
 tools/perf/util/auxtrace.c                    |    4 +
 tools/perf/util/auxtrace.h                    |    1 +
 tools/perf/util/nexus-rv-decoder/Build        |    1 +
 .../util/nexus-rv-decoder/nexus-rv-decoder.c  | 1364 +++++++++++++++++
 .../util/nexus-rv-decoder/nexus-rv-decoder.h  |  139 ++
 .../perf/util/nexus-rv-decoder/nexus-rv-msg.h |  190 +++
 tools/perf/util/rvtrace-decoder.c             | 1039 +++++++++++++
 tools/perf/util/rvtrace.h                     |   40 +
 tools/perf/util/symbol-elf.c                  |    4 +
 34 files changed, 6320 insertions(+), 3 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/rvtrace-atbbridge.c
 create mode 100644 drivers/hwtracing/coresight/rvtrace-core.c
 create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder-core.c
 create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder-sysfs.c
 create mode 100644 drivers/hwtracing/coresight/rvtrace-encoder.h
 create mode 100644 drivers/hwtracing/coresight/rvtrace-funnel.c
 create mode 100644 drivers/hwtracing/coresight/rvtrace-funnel.h
 create mode 100644 drivers/hwtracing/coresight/rvtrace-timestamp.c
 create mode 100644 drivers/hwtracing/coresight/rvtrace-timestamp.h
 create mode 100644 include/linux/rvtrace.h
 create mode 100644 tools/arch/riscv/include/asm/insn.h
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/arch/riscv/util/pmu.c
 create mode 100644 tools/perf/util/nexus-rv-decoder/Build
 create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.c
 create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.h
 create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-msg.h
 create mode 100644 tools/perf/util/rvtrace-decoder.c
 create mode 100644 tools/perf/util/rvtrace.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
