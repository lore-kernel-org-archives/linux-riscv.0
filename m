Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256D2EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 05:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yxk/TJx7bvxCiJmutp0sJk2+bFNAfFwtt3bnx1v1AtQ=; b=reluQPPk8A0gHr
	8hGOGdttUwTE3W2OqzAIjJ9VcJnZuyEeB0IJBCCxQR0OS0hV2fDOv5zxr+vSB7KcUWW6hIUv6vnYH
	8AseeQCNzvojvrSpc2UjHOm1da3YNSSRFvA5E/Bn2c6pQ65aqe2ihQsjIX4WdSBC/2oMfzZ4IiYgT
	3sCe6mb12yese58/xitPKLUFCN/Ta6U/iPlhGutoBCpz7rjLy5cyoYIW0EWVi5y5+nSRdHIhCLGuq
	mxSfM+LD0SqE+M6/trz+1LaJgXSxDz7Pxm+1vCQCfSw9H1dZG0tCGsLScPY4CEaC9zhxRw6vpec84
	+pTucT444foaDVq827Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHHZ8-000UrO-0N;
	Thu, 06 Jul 2023 05:30:06 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qHHZ5-000UqT-21;
	Thu, 06 Jul 2023 05:30:03 +0000
Message-ID: <fc9ebfc8-87cd-9488-20cd-85ed2a164bc9@infradead.org>
Date: Wed, 5 Jul 2023 22:30:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v3 2/2] RISC-V: mm: Update documentation and
 include test
To: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com,
 aou@eecs.berkeley.edu, anup@brainfault.org, konstantin@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, mick@ics.forth.gr, jrtc27@jrtc27.com
References: <20230705190002.384799-1-charlie@rivosinc.com>
 <20230705190002.384799-3-charlie@rivosinc.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230705190002.384799-3-charlie@rivosinc.com>
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

Hi--

On 7/5/23 11:59, Charlie Jenkins wrote:
> Add documentation explaining the behavior of mmap. Include
> a simple test that ensures that mmap returns an address less
> than the hint address while there are still addresses available.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  Documentation/riscv/vm-layout.rst             | 22 +++++++++
>  arch/riscv/include/asm/pgtable.h              |  8 +--
>  tools/testing/selftests/riscv/Makefile        |  2 +-
>  tools/testing/selftests/riscv/mm/.gitignore   |  1 +
>  tools/testing/selftests/riscv/mm/Makefile     | 21 ++++++++
>  .../selftests/riscv/mm/testcases/mmap.c       | 49 +++++++++++++++++++
>  6 files changed, 99 insertions(+), 4 deletions(-)
>  create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
>  create mode 100644 tools/testing/selftests/riscv/mm/Makefile
>  create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c
> 
> diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
> index 5462c84f4723..a610c68c9f3f 100644
> --- a/Documentation/riscv/vm-layout.rst
> +++ b/Documentation/riscv/vm-layout.rst
> @@ -133,3 +133,25 @@ RISC-V Linux Kernel SV57
>     ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
>     ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
>    __________________|____________|__________________|_________|____________________________________________________________
> +
> +
> +Userspace VAs
> +--------------------
> +To maintain compatibility with software that relies on the VA space
> +with a maximum of 39-bits, the kernel will, by default, return virtual

                     39 bits,

> +return virtual addresses to userspace from a 48-bit range (sv48). This

^^ duplicate "return virtual"

> +default behavior is achieved by passing 0 into the hint address parameter
> +of mmap.
> +

> diff --git a/tools/testing/selftests/riscv/mm/.gitignore b/tools/testing/selftests/riscv/mm/.gitignore
> new file mode 100644
> index 000000000000..022ea0a3f7df
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/mm/.gitignore
> @@ -0,0 +1 @@
> +mmap
> \ No newline at end of file

add a newline, please.

> diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
> new file mode 100644
> index 000000000000..d41a0b3d2ca2
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/mm/Makefile
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Originally tools/testing/selftests/arm64/signal
> +
> +# Additional include paths needed by kselftest.h and local headers
> +CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
> +
> +SRCS := $(filter-out testcases/testcases.c,$(wildcard testcases/*.c))
> +PROGS := $(patsubst %.c,%,$(SRCS))
> +
> +# Generated binaries to be installed by top KSFT script
> +TEST_GEN_PROGS := $(notdir $(PROGS))
> +
> +# Get Kernel headers installed and use them.
> +
> +# Including KSFT lib.mk here will also mangle the TEST_GEN_PROGS list
> +# to account for any OUTPUT target-dirs optionally provided by
> +# the toplevel makefile
> +include ../../lib.mk
> +
> +$(TEST_GEN_PROGS): $(PROGS)
> +	cp $(PROGS) $(OUTPUT)/
> \ No newline at end of file

add a newline, please.

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
