Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C9EC77B76
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Apr 2023 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmUVAXnaj5wRQU97tAN1jiUeHRz8u14T1ofHQsnde2Y=; b=u+DeVW5eQKe9Ey
	AN7J+l/aQ5IAf/vGXEO6NrZ9iEQC8megnvz+QK7+sshmcU86T+0zkBsKjcseBInH50gdo7thz4ymX
	JEHVmdoFZzkabolDPxfkJyM2wix//ILLy0ofjdYhdrtXBYvQetdGXwjmWlr0+sEqHcGbVy+x2dROo
	2ukwdJLwtVJ/2IAVQ5cxmVSJxEJyNueQz1JmV3BzmSCwTvJOgaSlB8WM5uZlSL+QFKCQp73xHF1iH
	1ihNeAyL9I4hLiq20hz8UfYE7ORoloKaAZkIPleKa+fh9tfJ4cmuXxioyibI8C5Dong2YYJ+nvoc6
	nyRXIrIq8SI2qWd+pL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqVWr-00Dvx1-0K;
	Sun, 23 Apr 2023 08:57:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqVWo-00DvwB-1N
	for linux-riscv@lists.infradead.org;
	Sun, 23 Apr 2023 08:57:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6BEC60B36;
	Sun, 23 Apr 2023 08:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C779C433D2;
	Sun, 23 Apr 2023 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682240215;
	bh=EuVQevi3GafI4guHg34N0jSUyUsuS4brrJy72U2kSX8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=U4peiDlBgQu1fr6J+U0F9kUpkTf3TGEZ72jIjpDRI3+NvvHDqeNLUNHDsPBSyBMsP
	 n36eUg50v/iJCJXx9JSt69JEVqPVscQm8tnClEDFC4QvoRlSrBcegfqdJWe6x602ch
	 jfNgneYXy5D3Q5mylsfEqNuGoT8KLDaxUgBR5kFaGQDnv9TNLqpjCYKxrubWlOPkaF
	 U3HiL0+GVLuvnbCBc4fadWOIzh5KGRChiqS6ok2Zu3FtNT0X14Tk4Xur461J7ny75s
	 DZwZod8HD0snECK7V2G76n5TZyzpeaS8EutC+vvVaz2eO2dgv/U3xZ701Kaw7rbyZM
	 TQlFdIsY8phZA==
Date: Sun, 23 Apr 2023 09:56:52 +0100
From: Conor Dooley <conor@kernel.org>
To: ruanjinjie <ruanjinjie@huawei.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
CC: ruanjinjie@huawei.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND=5D_riscv=3A_fix_kprobe?= =?US-ASCII?Q?_=5F=5Fuser_string_arg_print_fault_issue?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230423012912.890965-1-ruanjinjie@huawei.com>
References: <20230423012912.890965-1-ruanjinjie@huawei.com>
Message-ID: <F17EE38C-5C44-411B-BAFA-B71EEAAC0BDA@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_015702_540232_F28A84C5 
X-CRM114-Status: UNSURE (   9.58  )
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



On 23 April 2023 02:29:12 IST, ruanjinjie <ruanjinjie@huawei.com> wrote:
>On riscv qemu platform, when add kprobe event on do_sys_open() to show
>filename string arg, it just print fault as follow:
>
>echo 'p:myprobe do_sys_open dfd=$arg1 filename=+0($arg2):string flags=$arg3
>mode=$arg4' > kprobe_events
>
>bash-166     [000] ...1.   360.195367: myprobe: (do_sys_open+0x0/0x84)
>dfd=0xffffffffffffff9c filename=(fault) flags=0x8241 mode=0x1b6
>
>bash-166     [000] ...1.   360.219369: myprobe: (do_sys_open+0x0/0x84)
>dfd=0xffffffffffffff9c filename=(fault) flags=0x8241 mode=0x1b6
>
>bash-191     [000] ...1.   360.378827: myprobe: (do_sys_open+0x0/0x84)
>dfd=0xffffffffffffff9c filename=(fault) flags=0x98800 mode=0x0
>
>As riscv do not select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE,
>the +0($arg2) addr is processed as a kernel address though it is a
>userspace address, cause the above filename=(fault) print. So select
>ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE to avoid the issue, after that the
>kprobe trace is ok as below:
>
>bash-166     [000] ...1.    96.767641: myprobe: (do_sys_open+0x0/0x84)
>dfd=0xffffffffffffff9c filename="/dev/null" flags=0x8241 mode=0x1b6
>
>bash-166     [000] ...1.    96.793751: myprobe: (do_sys_open+0x0/0x84)
>dfd=0xffffffffffffff9c filename="/dev/null" flags=0x8241 mode=0x1b6
>
>bash-177     [000] ...1.    96.962354: myprobe: (do_sys_open+0x0/0x84)
>dfd=0xffffffffffffff9c filename="/sys/kernel/debug/tracing/events/kprobes/"
>flags=0x98800 mode=0x0
>
>Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
>---
> arch/riscv/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>index eb7f29a412f8..c51f0d3227af 100644
>--- a/arch/riscv/Kconfig
>+++ b/arch/riscv/Kconfig
>@@ -26,6 +26,7 @@ config RISCV
> 	select ARCH_HAS_KCOV
> 	select ARCH_HAS_MMIOWB
> 	select ARCH_HAS_PMEM_API
>+	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE

Please add this in alphabetical order, thanks.

> 	select ARCH_HAS_PTE_SPECIAL
> 	select ARCH_HAS_SET_DIRECT_MAP if MMU
> 	select ARCH_HAS_SET_MEMORY if MMU

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
