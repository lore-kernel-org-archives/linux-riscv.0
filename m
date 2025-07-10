Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B716C83F1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 13:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plDeuDXzZX+2WjH96BJHn6T2LuoyXxsHhuKt812/WeQ=; b=mHM/wIy1tnVMFL
	HtN4JuSHdQIJZCRRk1pwyV55jSNQXG9THfYIGAyU8Zf/Qm5F3292Jzk1E2SHrPrpBl33XlmMdt+/Y
	GxbJapH8KtUqPA39750w+MfIsIe3sE6I4XPVaKYWB+Yv6v6yXwNEi9oS5DJNsjUNTmSaMUMf5+6+k
	S/7p7JHEuEUu5yHnIEl1of8Z1haEWwO/jMPk9aoAenilTeRcYk3kopN/L1s66jvtzneslZ38IJhrp
	6wuwHEax/Rw1XHWzahpJ4n62KeVKfGo2hiIdJW4eQ7f7VOnOYSN74MMLJ+VpZrsm1iq515PbcEkUv
	EBbCSrzJcnY+wM/S8muw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqtG-0000000BrLP-24uX;
	Thu, 10 Jul 2025 13:00:42 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpqk-0000000BgZR-0XPW
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 11:54:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 670B8449CD;
	Thu, 10 Jul 2025 11:53:54 +0000 (UTC)
Message-ID: <f5b1fc77-d180-4df7-b8f6-0cb0ca4a187a@ghiti.fr>
Date: Thu, 10 Jul 2025 13:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
To: kernel test robot <lkp@intel.com>, ChenMiao <chenmiao.ku@gmail.com>,
 Linux RISCV <linux-riscv@lists.infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Heiko Carstens <hca@linux.ibm.com>, Pu Lehui <pulehui@huawei.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
References: <aG3A8Jirg+TxNza/@rli9-mobl>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <aG3A8Jirg+TxNza/@rli9-mobl>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepueekjeefieeikeevvefhtddtteevgefgtdffheegieegkeffueeujefhjefftdeinecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemsgeffhdumeejtgeirgemsgehudelmegrfhgstdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemsgeffhdumeejtgeirgemsgehudelmegrfhgstddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemsgeffhdumeejtgeirgemsgehudelmegrfhgstdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopegthhgvnhhmihgrohdrkhhusehgmhgrihhlrdgtohhmpdhrtghpthhto
 heplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_045402_317777_DF8F5A89 
X-CRM114-Status: GOOD (  12.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi ChenMiao,

On 7/9/25 03:08, kernel test robot wrote:
> Hi ChenMiao,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on fda589c286040d9ba2d72a0eaf0a13945fc48026]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/ChenMiao/riscv-ftrace-Fix-the-logic-issue-in-DYNAMIC_FTRACE-selection/20250706-231907
> base:   fda589c286040d9ba2d72a0eaf0a13945fc48026
> patch link:    https://lore.kernel.org/r/20250706151830.25091-1-chenmiao.ku%40gmail.com
> patch subject: [PATCH V2] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
> :::::: branch date: 2 days ago
> :::::: commit date: 2 days ago
> config: riscv-randconfig-r112-20250708 (attached as .config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce: (attached as reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507090650.YGY56SIA-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> <instantiation>:1:14: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
>     addi sp, sp, -FREGS_SIZE_ON_STACK
>                  ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>>> <instantiation>:2:18: error: unexpected token
>      sw t0, FREGS_EPC(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:3:17: error: unexpected token
>      sw x1, FREGS_RA(sp)
>                     ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:7:17: error: unexpected token
>      sw x6, FREGS_T1(sp)
>                     ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:9:17: error: unexpected token
>      sw x7, FREGS_T2(sp)
>                     ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:10:18: error: unexpected token
>      sw x28, FREGS_T3(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:11:18: error: unexpected token
>      sw x29, FREGS_T4(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:12:18: error: unexpected token
>      sw x30, FREGS_T5(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:13:18: error: unexpected token
>      sw x31, FREGS_T6(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:16:18: error: unexpected token
>      sw x10, FREGS_A0(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:17:18: error: unexpected token
>      sw x11, FREGS_A1(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:18:18: error: unexpected token
>      sw x12, FREGS_A2(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:19:18: error: unexpected token
>      sw x13, FREGS_A3(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:20:18: error: unexpected token
>      sw x14, FREGS_A4(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:21:18: error: unexpected token
>      sw x15, FREGS_A5(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:22:18: error: unexpected token
>      sw x16, FREGS_A6(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:23:18: error: unexpected token
>      sw x17, FREGS_A7(sp)
>                      ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>      ^
>     <instantiation>:25:15: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
>      addi a0, a0, FREGS_SIZE_ON_STACK
>                   ^
>     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instantiation
>      SAVE_ABI_REGS
>
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE
>     Depends on [n]: FTRACE [=y] && FUNCTION_TRACER [=y] && HAVE_DYNAMIC_FTRACE [=n]
>     Selected by [y]:
>     - RISCV [=y] && FUNCTION_TRACER [=y]

To avoid that, we should check HAVE_DYNAMIC_FTRACE too:

select DYNAMIC_FTRACE if FUNCTION_TRACER && HAVE_DYNAMIC_FTRACE

That fixes the build error for me. Can you send a v3 with this change?

Thanks,

Alex


>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
