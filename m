Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CCCC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 02:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feCem+b19TDC/ALSYSrs5X65xXppFB2r10bUCyhpHjU=; b=LI6VT8crJ8rg8Q
	IfI5U6AF3owmk45j6Tg7KWg29VVCoxkJ6YCMA1nkKUAsD9z9EUGp1TTOppgZvFSwEo0Lbtz3DFKe8
	ddXZwhNNc8s6xnUZtpuUgMHDye791RjlegWyC8A9CAx0FbexNOW5j5ZKsCCodAMaWrmaQ3qoRisuO
	9GWl9/4x2BuF3lqKW78c49a/dutko5fvuW4Dl+gszgoPtUBxny7m1chfJaEHgzhPADtmHpF+k8yBE
	2wUe4gMjH3pEanNH1sZuzfG63XV4MhMHsXLyq9zd0joJN6vWAwGdH45EfpMetmyINQJLD/aVbYZ5K
	fmMCl4Y3KTtf2yaaebaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF4yl-00DxsG-9z; Wed, 02 Feb 2022 02:02:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF4yX-00Dxqn-Us; Wed, 02 Feb 2022 02:02:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C6E5615DC;
 Wed,  2 Feb 2022 02:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500F7C340F5;
 Wed,  2 Feb 2022 02:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643767344;
 bh=Lu17CtWHMQyIMd+r/gZ3QnCD3blDyX01IGU77gYzPwo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rVuAgKNepQhlXkSgJ4nOfKqdZ1m2QgRk9ZkvH8SvfvWkeorNEQdY83E2n5eXKfc79
 VCuJEViT4M9HIVIMPr3BsvqjoERHgklnIISy31sSuU4uK2OLJWs1IQstgOysSW8fQ3
 A4+TDqM4i+9dG2f1hGh94TQRtV9FMnT0rwP8iPWmKTMSzCFTVSM/jumBKMQgjTroNE
 +jwQ76K54dK8UrZ95Lj5eu9y4l1FTA2KToTqrC9gowaW+jPXRuZTVpoBs8+clZOz6I
 Yl2FZr99TUgkOSak2L7h6irEIbDEWdhFCcdReiCBHO2TFXtVzEQRwjOz0Twz2ZkMOl
 aMu8vburo8Amg==
Received: by mail-ua1-f52.google.com with SMTP id b16so16568962uaq.4;
 Tue, 01 Feb 2022 18:02:24 -0800 (PST)
X-Gm-Message-State: AOAM5319PlN2hcDpaY7zOloa6Wn7xlGvWYohqJLKqVjH2F7loOJ83DkI
 ZHbZ7Wm1jeTwyfbNJ7jn4gJ4CTA+x2D6eNVWTJE=
X-Google-Smtp-Source: ABdhPJzjbMxJZrbhxn6pmM0yG+DXrY57H4w+bp7CFApaAn/IyFQRMevzGEcLPsnqGd8f9H2BAFJtp6v6SwrSYMY64Dg=
X-Received: by 2002:a67:e0d9:: with SMTP id m25mr10551317vsl.51.1643767343232; 
 Tue, 01 Feb 2022 18:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-16-guoren@kernel.org>
In-Reply-To: <20220201150545.1512822-16-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 2 Feb 2022 10:02:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSpz94OBM_Ob92MdGOHt7p2akPS0Jco9B0rC0XJToh0eg@mail.gmail.com>
Message-ID: <CAJF2gTSpz94OBM_Ob92MdGOHt7p2akPS0Jco9B0rC0XJToh0eg@mail.gmail.com>
Subject: Re: [PATCH V5 15/21] riscv: compat: Add hw capability check for elf
To: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>, 
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_180226_119578_173E88F3 
X-CRM114-Status: GOOD (  24.13  )
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

On Tue, Feb 1, 2022 at 11:07 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Detect hardware COMPAT (32bit U-mode) capability in rv64. If not
> support COMPAT mode in hw, compat_elf_check_arch would return
> false by compat_binfmt_elf.c
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/elf.h |  3 ++-
>  arch/riscv/kernel/process.c  | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index aee40040917b..3a4293dc7229 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -40,7 +40,8 @@
>   * elf64_hdr e_machine's offset are different. The checker is
>   * a little bit simple compare to other architectures.
>   */
> -#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
> +extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
> +#define compat_elf_check_arch  compat_elf_check_arch
>
>  #define CORE_DUMP_USE_REGSET
>  #define ELF_EXEC_PAGESIZE      (PAGE_SIZE)
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 1a666ad299b4..758847cba391 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -83,6 +83,38 @@ void show_regs(struct pt_regs *regs)
>                 dump_backtrace(regs, NULL, KERN_DEFAULT);
>  }
>
> +#ifdef CONFIG_COMPAT
> +static bool compat_mode_support __read_mostly;
> +
> +bool compat_elf_check_arch(Elf32_Ehdr *hdr)
> +{
> +       if (compat_mode_support && (hdr->e_machine == EM_RISCV))
> +               return true;
> +       else
> +               return false;
> +}
> +
> +static int compat_mode_detect(void)
Forgot __init, here

> +{
> +       unsigned long tmp = csr_read(CSR_STATUS);
> +
> +       csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
> +
> +       if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32) {
> +               pr_info("riscv: 32bit compat mode detect failed\n");
> +               compat_mode_support = false;
> +       } else {
> +               compat_mode_support = true;
> +               pr_info("riscv: 32bit compat mode detected\n");
> +       }
> +
> +       csr_write(CSR_STATUS, tmp);
> +
> +       return 0;
> +}
> +arch_initcall(compat_mode_detect);
> +#endif
> +
>  void start_thread(struct pt_regs *regs, unsigned long pc,
>         unsigned long sp)
>  {
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
