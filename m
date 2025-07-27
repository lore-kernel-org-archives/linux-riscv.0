Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AACEC87FCE
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jul 2025 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znU9fJKafcVVfLXz3o53m8US7wXiFk3nWJ1TyZ82h+U=; b=rljlz80eSG4pBA
	lYD46Fgph3T17f3KT6kL0bJmKJQG9ezh34akCytfgwL+j7zSnXLt5xkr7UCBHNgW554perf17nWya
	RBzBL/w+7/yfoFEzvFxpxyeEmxTetwG9VtYDa87TRil8AmtjIsIpLuPEdnub8Tj/JwM+HRhvyf8qL
	SZT6x81nbWLaMqDSygiO3c9PgPVpqTMeqf62Ues2t532s0iEHl6pX2m5RU/FyXBMsT4XzNpFzpjbP
	+6dh5q7OLFaAXZNilbInk/X/LGsOHu4FMwjMoXOY1nNCIc6ouVqUtag3fAx6cBjKmbY+FoGOBuVzM
	KiPA7QtlIDi2qw9CJ3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug1Rn-0000000CkGE-0ep0;
	Sun, 27 Jul 2025 13:29:51 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug1Rj-0000000CkFd-2VTC
	for linux-riscv@lists.infradead.org;
	Sun, 27 Jul 2025 13:29:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8995E43A03;
	Sun, 27 Jul 2025 13:29:38 +0000 (UTC)
Message-ID: <271c2d08-4ebd-45db-a019-f8f04725904d@ghiti.fr>
Date: Sun, 27 Jul 2025 15:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header files
To: Thomas Huth <thuth@redhat.com>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org
References: <20250606070952.498274-1-thuth@redhat.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250606070952.498274-1-thuth@redhat.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekleegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepvedvieehuedtvdevgeetlefghffhtdeihfevvdfgtdeivdevfefhuefhleelueejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpshhtrggtkhhovhgvrhhflhhofidrtghomhdprhgrshhpsggvrhhrhihpihdrtghomhdpghhithhhuhgsrdgtohhmnecukfhppedvrgdtgeemtggvtgdtmegttddvkeemrggvfedvmeefsgekvdemtggtsgdumeeffhdtleemiegugeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtdegmegtvggttdemtgdtvdekmegrvgefvdemfegskedvmegttggsudemfehftdelmeeiugegkedphhgvlhhopeglkffrggeimedvrgdtgeemtggvtgdtmegttddvkeemrggvfedvmeefsgekvdemtggtsgdumeeffhdtleemiegugeekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepthhhuhhthhesrhgvughhrghtr
 dgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghtihhshhdrphgrthhrrgeslhhinhhugidruggvvhdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhhtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_062947_798509_08A65FAE 
X-CRM114-Status: GOOD (  18.96  )
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

Hi Thomas,

On 6/6/25 09:09, Thomas Huth wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
>
>   https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>   https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>   https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>   https://github.com/riscv-software-src/opensbi/issues/199
>
> To avoid confusion in the future, it would make sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.
>
> I split the patches per architecture to ease the review, and I also
> split the uapi headers from the normal ones in case we decide that
> uapi needs to be treated differently from the normal headers here.
>
> The x86 and parisc patches already got merged via their specific
> architecture tree:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
>
> So I assume the riscv patches should also go via the riscv tree.
>
> v2:
> - Split the riscv patches from the global series
>    (see https://lore.kernel.org/all/20250314071013.1575167-1-thuth@redhat.com/)
> - Rebased the patches on linux-next and fixed the conflicts
>    and new occurances of __ASSEMBLY__
>
> Thomas Huth (2):
>    riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>    riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
>
>   arch/riscv/include/asm/alternative-macros.h   | 12 ++++++------
>   arch/riscv/include/asm/alternative.h          |  2 +-
>   arch/riscv/include/asm/asm-extable.h          |  6 +++---
>   arch/riscv/include/asm/asm.h                  | 10 +++++-----
>   arch/riscv/include/asm/assembler.h            |  2 +-
>   arch/riscv/include/asm/barrier.h              |  4 ++--
>   arch/riscv/include/asm/cache.h                |  4 ++--
>   arch/riscv/include/asm/cpu_ops_sbi.h          |  2 +-
>   arch/riscv/include/asm/csr.h                  |  4 ++--
>   arch/riscv/include/asm/current.h              |  4 ++--
>   arch/riscv/include/asm/errata_list.h          |  6 +++---
>   arch/riscv/include/asm/ftrace.h               |  6 +++---
>   arch/riscv/include/asm/gpr-num.h              |  6 +++---
>   arch/riscv/include/asm/image.h                |  4 ++--
>   arch/riscv/include/asm/insn-def.h             |  8 ++++----
>   arch/riscv/include/asm/jump_label.h           |  4 ++--
>   arch/riscv/include/asm/kasan.h                |  2 +-
>   arch/riscv/include/asm/kgdb.h                 |  4 ++--
>   arch/riscv/include/asm/mmu.h                  |  4 ++--
>   arch/riscv/include/asm/page.h                 |  4 ++--
>   arch/riscv/include/asm/pgtable.h              |  4 ++--
>   arch/riscv/include/asm/processor.h            |  4 ++--
>   arch/riscv/include/asm/ptrace.h               |  4 ++--
>   arch/riscv/include/asm/scs.h                  |  4 ++--
>   arch/riscv/include/asm/set_memory.h           |  4 ++--
>   arch/riscv/include/asm/thread_info.h          |  4 ++--
>   arch/riscv/include/asm/vdso.h                 |  4 ++--
>   arch/riscv/include/asm/vdso/getrandom.h       |  4 ++--
>   arch/riscv/include/asm/vdso/gettimeofday.h    |  4 ++--
>   arch/riscv/include/asm/vdso/processor.h       |  4 ++--
>   arch/riscv/include/asm/vdso/vsyscall.h        |  4 ++--
>   arch/riscv/include/uapi/asm/kvm.h             |  2 +-
>   arch/riscv/include/uapi/asm/ptrace.h          |  4 ++--
>   arch/riscv/include/uapi/asm/sigcontext.h      |  4 ++--
>   tools/arch/riscv/include/asm/csr.h            |  6 +++---
>   tools/arch/riscv/include/asm/vdso/processor.h |  4 ++--
>   36 files changed, 81 insertions(+), 81 deletions(-)


Applied for 6.17,

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
