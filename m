Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860A8C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2D7uXj+P4zEH+Uz7DP6o48VziBl0o1AA+zHFomcRzP0=; b=sCUy/vJAuIi1D7
	es9DUrb3tyhyS75y4OuEh6eB1G+GJFhl9mwjEhDe0V53iw5s7wggi1nl8JMpB+K50GeaoeYJCKxYo
	JD4xVcf1S4X/KW4ZrcogxYf5ihgaS/TrNEr+p8fD6zzqJoOKZpf1fUnVTggBfUCIU7gxsknePcE0c
	S1s/1DcmPusTUmeoB7/tt8gCWXLOMz0RTFV3JHMcAF6DzuOwo6ibo6oI3XIRHzf3OaQb+XTw9em8k
	65eCEr3umb6bbCN30cdaFlzHNlQHSEpyz8GZXIMnucRn0J/jOv8o0CFY3f/d0Uz+WWVO9VlH5VGK+
	H6U7dMs2x77sTCNy0jlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peFOl-0095Qd-0O;
	Mon, 20 Mar 2023 13:18:03 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peFOe-0095LT-21;
	Mon, 20 Mar 2023 13:17:59 +0000
Received: from localhost.localdomain (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 5AFCC5801D9;
	Mon, 20 Mar 2023 21:17:35 +0800 (CST)
From: Donglin Peng <pengdonglin@sangfor.com.cn>
To: mhiramat@kernel.org,
	rostedt@goodmis.org,
	linux@armlinux.org.uk,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	tglx@linutronix.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	mingo@redhat.com,
	xiehuan09@gmail.com,
	dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn,
	dolinux.peng@gmail.com
Cc: linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Donglin Peng <pengdonglin@sangfor.com.cn>
Subject: [PATCH v5 0/2] function_graph: Support recording and printing the return value of function
Date: Mon, 20 Mar 2023 06:16:48 -0700
Message-Id: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE5CVk1MHklMSU5PTk5MSVUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpISkJIT1VKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NxQ6OCo5Cj0QCxEeNwkNGCMr
	ASkaCUNVSlVKTUxCSEpDSU5NTElDVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFNS01DNwY+
X-HM-Tid: 0a86ff2b0a2a2eb7kusn5afcc5801d9
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_061757_259031_A45EE51E 
X-CRM114-Status: GOOD (  13.56  )
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

When using the function_graph tracer to analyze system call failures,
it can be time-consuming to analyze the trace logs and locate the kernel
function that first returns an error. This change aims to simplify the
process by recording the function return value to the 'retval' member of
'ftrace_graph_ent' and printing it when outputing the trace log.

Note that even if a function's return type is void, a return value will
still be printed, so it should be ignored. If you care about this, the
BTF file can be used to obtain the details of function return type. We
can implement a tool to process the trace log and display the return
value based on its actual type.

Here is an example:

...

 1)               |  cgroup_attach_task() {
 1)               |    cgroup_migrate_add_src() {
 1)   1.403 us    |      cset_cgroup_from_root(); /* = 0xffff93fc86f58010 */
 1)   2.154 us    |    } /* cgroup_migrate_add_src = 0xffffb286c1297d00 */
 1) ! 386.538 us  |    cgroup_migrate_prepare_dst(); /* = 0x0 */
 1)               |    cgroup_migrate() {
 1)   0.651 us    |      cgroup_migrate_add_task(); /* = 0xffff93fcfd346c00 */
 1)               |      cgroup_migrate_execute() {
 1)               |        cpu_cgroup_can_attach() {
 1)               |          cgroup_taskset_first() {
 1)   0.732 us    |            cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
 1)   1.232 us    |          } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
 1)   0.380 us    |          sched_rt_can_attach(); /* = 0x0 */
 1)   2.335 us    |        } /* cpu_cgroup_can_attach = -22 */
 1)   4.369 us    |      } /* cgroup_migrate_execute = -22 */
 1)   7.143 us    |    } /* cgroup_migrate = -22 */
 1)               |    cgroup_migrate_finish() {
 1)   0.411 us    |      put_css_set_locked(); /* = 0x8 */
 1) + 62.397 us   |      put_css_set_locked(); /* = 0x80000001 */
 1) + 64.742 us   |    } /* cgroup_migrate_finish = 0x80000000 */
 1) ! 465.605 us  |  } /* cgroup_attach_task = -22 */

...

After processing the above trace logs using BTF information:

...

 1)               |  cgroup_attach_task() {
 1)               |    cgroup_migrate_add_src() {
 1)   1.403 us    |      cset_cgroup_from_root(); /* = 0xffff93fc86f58010 */
 1)   2.154 us    |    } /* cgroup_migrate_add_src */
 1) ! 386.538 us  |    cgroup_migrate_prepare_dst(); /* = 0 */
 1)               |    cgroup_migrate() {
 1)   0.651 us    |      cgroup_migrate_add_task();
 1)               |      cgroup_migrate_execute() {
 1)               |        cpu_cgroup_can_attach() {
 1)               |          cgroup_taskset_first() {
 1)   0.732 us    |            cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
 1)   1.232 us    |          } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
 1)   0.380 us    |          sched_rt_can_attach(); /* = 0 */
 1)   2.335 us    |        } /* cpu_cgroup_can_attach = -22 */
 1)   4.369 us    |      } /* cgroup_migrate_execute = -22 */
 1)   7.143 us    |    } /* cgroup_migrate = -22 */
 1)               |    cgroup_migrate_finish() {
 1)   0.411 us    |      put_css_set_locked();
 1) + 62.397 us   |      put_css_set_locked();
 1) + 64.742 us   |    } /* cgroup_migrate_finish */
 1) ! 465.605 us  |  } /* cgroup_attach_task = -22 */

...

Donglin Peng (2):
  function_graph: Support recording and printing the return value of
    function
  tracing: Add documentation for funcgraph-retval and graph_retval_hex

 Documentation/trace/ftrace.rst       | 75 ++++++++++++++++++++++
 arch/arm/Kconfig                     |  1 +
 arch/arm/kernel/entry-ftrace.S       |  8 +++
 arch/arm64/Kconfig                   |  1 +
 arch/arm64/kernel/entry-ftrace.S     |  8 +++
 arch/riscv/Kconfig                   |  1 +
 arch/riscv/kernel/mcount.S           | 12 +++-
 arch/x86/Kconfig                     |  1 +
 arch/x86/kernel/ftrace_32.S          |  8 +++
 arch/x86/kernel/ftrace_64.S          | 10 +++
 include/linux/ftrace.h               |  3 +
 kernel/trace/Kconfig                 |  8 +++
 kernel/trace/fgraph.c                | 25 +++++++-
 kernel/trace/trace.h                 |  2 +
 kernel/trace/trace_entries.h         | 26 ++++++++
 kernel/trace/trace_functions_graph.c | 95 +++++++++++++++++++++++++---
 16 files changed, 272 insertions(+), 12 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
