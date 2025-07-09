Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21C3C83F0A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKbpH/ge/8Ma/O298OPBnLH4Gbcvk1Cfh/uzzESYNYg=; b=GibGaaHMIYJiik
	fejCU9ivnuq91epU8wBuiocL9O0yGgvhy6OmpQUoKfo6BjKVNHiBrYauojS++jartZ0QMkoYHfHPJ
	q8ICGyfGYClpZxGckOppWSPNyrhPy5R4N/JFdiXJhI2N5hSMcSGxaktFU90ua/e4v3RAbJfVwYnaL
	bc4NTeDesCO4dYD+fjfuv62uCIh6NpLIO58c0FrxDhPwc6+TbEGpnVmWZTPl8oq8wGTDklrGajSUD
	vLWtL/UDGoAwL2pu3LWHd4iEoVdgIPCW7e16PHwNykcNcJ65e8JbtTtvuWmmphDhnbJegeBIE78qa
	OwbWZz/sRNLpvyND2uzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa5L-00000009cFD-0LPT;
	Wed, 09 Jul 2025 19:04:03 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWPW-000000096ct-3Qml
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 15:08:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AB6043E9F;
	Wed,  9 Jul 2025 15:08:31 +0000 (UTC)
Message-ID: <203fba2f-24c0-45bd-aeac-c907297f9a6e@ghiti.fr>
Date: Wed, 9 Jul 2025 17:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Optimize GCD performance on RISC-V by selecting
 implementation at runtime
To: Kuan-Wei Chiu <visitorckw@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250606134758.1308400-1-visitorckw@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemrgejvgdvmegrugelvdemlegrsgejmeefudehsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemrgejvgdvmegrugelvdemlegrsgejmeefudehsgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemrgejvgdvmegrugelvdemlegrsgejmeefudehsggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehvihhsihhtohhrtghkfiesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdpr
 hgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhsvghrvhestggtnhhsrdhntghkuhdrvgguuhdrthif
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_080838_993656_9044F91D 
X-CRM114-Status: GOOD (  20.24  )
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

Hi Kuan-Wei, Andrew,

@Andrew: Will you merge this one? I can do it through the riscv tree if 
not, no problem at all.

Thanks,

Alex

On 6/6/25 15:47, Kuan-Wei Chiu wrote:
> The current implementation of gcd() selects between the binary GCD and
> the odd-even GCD algorithm at compile time, depending on whether
> CONFIG_CPU_NO_EFFICIENT_FFS is set. On platforms like RISC-V, however,
> this compile-time decision can be misleading: even when the compiler
> emits ctz instructions based on the assumption that they are efficient
> (as is the case when CONFIG_RISCV_ISA_ZBB is enabled), the actual
> hardware may lack support for the Zbb extension. In such cases, ffs()
> falls back to a software implementation at runtime, making the binary
> GCD algorithm significantly slower than the odd-even variant.
>
> To address this, we introduce a static key to allow runtime selection
> between the binary and odd-even GCD implementations. On RISC-V, the
> kernel now checks for Zbb support during boot. If Zbb is unavailable,
> the static key is disabled so that gcd() consistently uses the more
> efficient odd-even algorithm in that scenario. Additionally, to further
> reduce code size, we select CONFIG_CPU_NO_EFFICIENT_FFS automatically
> when CONFIG_RISCV_ISA_ZBB is not enabled, avoiding compilation of the
> unused binary GCD implementation entirely on systems where it would
> never be executed.
>
> This series ensures that the most efficient GCD algorithm is used in
> practice and avoids compiling unnecessary code based on hardware
> capabilities and kernel configuration.
>
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>
> ---
> This series has been tested on QEMU to verify that the correct GCD
> implementation is used both with and without Zbb support.
>
> v2 -> v3:
> - Drop if (!a || !b) check in binary_gcd()
> - Move DECLARE_STATIC_KEY_TRUE(efficient_ffs_key) to gcd.h
> v1 -> v2:
> - Use a static key to select the GCD implementation at runtime.
>
> v2: https://lore.kernel.org/lkml/20250524155519.1142570-1-visitorckw@gmail.com/
> v1: https://lore.kernel.org/lkml/20250217013708.1932496-1-visitorckw@gmail.com/
>
> Kuan-Wei Chiu (3):
>    lib/math/gcd: Use static key to select implementation at runtime
>    riscv: Optimize gcd() code size when CONFIG_RISCV_ISA_ZBB is disabled
>    riscv: Optimize gcd() performance on RISC-V without Zbb extension
>
>   arch/riscv/Kconfig        |  1 +
>   arch/riscv/kernel/setup.c |  5 +++++
>   include/linux/gcd.h       |  3 +++
>   lib/math/gcd.c            | 27 +++++++++++++++------------
>   4 files changed, 24 insertions(+), 12 deletions(-)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
