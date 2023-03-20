Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F35C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 13:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Td2WXUindLlO0F+qzn7id2veYATh97DMmJ7k6tEvHSc=; b=zG+dBL8YmwOkgO
	gJlQ9yiq7V7OkPsHFpkoW8vBzBv6uiI9XyrUhaeonNfxVANVuiT36wvo1xwXSIUYjJprI6R9X9YiG
	xvQrUbIPimeINyz05w0IsIGX54/yffy+AdtuDM/wd/QUoU0i5D4ZA1GJq++m0XNH1aDwUx+WtcFYQ
	swqlS71GEBB1Qt5RjouwiynWj51rFLmCbWOgyic68ozD8cXFc1G97WUtZ+T2Cvr5y8HMdG6QujSSa
	xQf4YnjTVX2IIo0WzsThQdZhKdYP+8MyPP5gzeup4y6ARmhvTmyxx2ah693KCQrTLYaSVFam+WaG2
	XqQNtzvRy9bllj5tjiyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peFOl-0095R2-2I;
	Mon, 20 Mar 2023 13:18:03 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peFOe-0095LU-22;
	Mon, 20 Mar 2023 13:18:00 +0000
Received: from localhost.localdomain (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 427315801C3;
	Mon, 20 Mar 2023 21:17:38 +0800 (CST)
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
Subject: [PATCH v5 2/2] tracing: Add documentation for funcgraph-retval and graph_retval_hex
Date: Mon, 20 Mar 2023 06:16:50 -0700
Message-Id: <20230320131650.482594-3-pengdonglin@sangfor.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
References: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZS0hMVk4YSEgdTE8dHU0dGlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpISkJIT1VKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NQw6SDo4DD0VPRFJThQ8GAs#
	NzpPCzBVSlVKTUxCSEpDSU5CT0NNVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFMS0pONwY+
X-HM-Tid: 0a86ff2b15712eb7kusn427315801c3
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_061757_063894_E6EE86E8 
X-CRM114-Status: GOOD (  18.48  )
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

Add documentation for the two newly introduced options for the
function_graph tracer. The new option funcgraph-retval is used to
control whether or not to display the return value. The new option
graph_retval_hex is used to control the display format of the return
value.

Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
---
v5:
 - Describe the limitations of funcgraph-retval
---
 Documentation/trace/ftrace.rst | 75 ++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index b927fb2b94dc..797841d15da9 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -1328,6 +1328,19 @@ Options for function_graph tracer:
 	only a closing curly bracket "}" is displayed for
 	the return of a function.
 
+  funcgraph-retval
+	When set, the return event will include the function and
+	its return value. Note that even if the function return
+	type is void, a return value will also be printed, you
+	should ignore it. This option is off by default.
+
+  graph_retval_hex
+	Depend on function-retval. When set, the function return
+	value will be printed in hexadecimal format. If this is not
+	set and the return value looks like an error code, it will
+	be printed in signed decimal format, else in hexadecimal
+	format. This option is off by default.
+
   sleep-time
 	When running function graph tracer, to include
 	the time a task schedules out in its function.
@@ -2673,6 +2686,68 @@ It is default disabled.
     0)   1.757 us    |        } /* kmem_cache_free() */
     0)   2.861 us    |      } /* putname() */
 
+The return value of each traced function can be displayed. This
+feature can be very useful when you encounter system call failures
+and want to locate the function that return errors firstly.
+
+	- hide: echo nofuncgraph-retval > trace_options
+	- show: echo funcgraph-retval > trace_options
+
+  Example with funcgraph-retval::
+
+    1)               |    cgroup_migrate() {
+    1)   0.651 us    |      cgroup_migrate_add_task(); /* = 0xffff93fcfd346c00 */
+    1)               |      cgroup_migrate_execute() {
+    1)               |        cpu_cgroup_can_attach() {
+    1)               |          cgroup_taskset_first() {
+    1)   0.732 us    |            cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
+    1)   1.232 us    |          } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
+    1)   0.380 us    |          sched_rt_can_attach(); /* = 0x0 */
+    1)   2.335 us    |        } /* cpu_cgroup_can_attach = -22 */
+    1)   4.369 us    |      } /* cgroup_migrate_execute = -22 */
+    1)   7.143 us    |    } /* cgroup_migrate = -22 */
+
+The above example shows that the cgroup function cpu_cgroup_can_attach
+returned the error code -22 firstly, then we can read the code of this
+function to get the root cause.
+
+If the option graph_retval_hex is not set and the return value looks
+like an error code, it will be printed in signed decimal format. In
+other cases, it will be printed in hexadecimal format.
+
+	- hexadecimal or signed decimal: echo nograph_retval_hex > trace_options
+	- hexadecimal: echo graph_retval_hex > trace_options
+
+  Example with graph_retval_hex::
+
+    1)               |      cgroup_migrate() {
+    1)   0.651 us    |        cgroup_migrate_add_task(); /* = 0xffff93fcfd346c00 */
+    1)               |        cgroup_migrate_execute() {
+    1)               |          cpu_cgroup_can_attach() {
+    1)               |            cgroup_taskset_first() {
+    1)   0.732 us    |              cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
+    1)   1.232 us    |            } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
+    1)   0.380 us    |            sched_rt_can_attach(); /* = 0x0 */
+    1)   2.335 us    |          } /* cpu_cgroup_can_attach = 0xffffffea */
+    1)   4.369 us    |        } /* cgroup_migrate_execute = 0xffffffea */
+    1)   7.143 us    |      } /* cgroup_migrate = 0xffffffea */
+
+There are some limitations when using the funcgraph-retval currently:
+
+- Even if the function return type is void, a return value will still
+  be printed, and you can just ignore it.
+
+- Even if the return value is not an error code actually, it may be
+  displayed as an error code. You should read the code to check.
+  For example, both 0xfe and 0xfffe are be interpreted as -2.
+
+- Only the value of the first return register will be recorded and
+  printed even if the return values may be stored in two registers
+  actually. For example, both the eax and edx are used to store a
+  64 bit return value in the x86 architecture, and the eax stores
+  the low 32 bit, the edx stores the high 32 bit, however only the
+  value stored in eax will be recorded and printed.
+
 You can put some comments on specific functions by using
 trace_printk() For example, if you want to put a comment inside
 the __might_sleep() function, you just have to include
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
