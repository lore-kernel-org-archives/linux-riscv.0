Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A646E95A61
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEFd2DkgV9Rs5ipg0L0Fc9Bjg5tbsVNJWMF4k/+Pd5g=; b=roknFACfzR8HOt
	6v27BZPc94QmzcBFZ0UuUN/DgZ55lZbaeZET8UcTppWnc0yg3TIUuNNj468BAAjCnZg1Wzhd4e+Iy
	HZXaZJN7NhVtE+d9gWue2/+xHSltkoMOPsEIT3VKnd6bZ3L5zXul7Rb91Oc0YWu0X3o9jqgkg1kHP
	ldiJGmIXUxuDDFpmZOneC4zOToA5M1S73//meudieh3gAFow0gZMHLY60rPMLn6GUnh3jdAhmyg6h
	plNng8C42v3bcECJJnR0wNDZ0Y73StMIjVAR6wqn02SGu/RH9bJg6B1UEQ/WyRm4+47D4o+rEhuqX
	05KuRWUNNsJCaGL3ryFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp7Nb-007bCG-2L;
	Sat, 07 Oct 2023 13:30:03 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp7NX-007bBD-0g
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 13:30:01 +0000
X-QQ-mid: bizesmtp88t1696685377tixjkyac
Received: from linux-lab-host.localdomain ( [116.30.131.235])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Oct 2023 21:29:36 +0800 (CST)
X-QQ-SSF: 01200000000000E0Y000000A0000000
X-QQ-FEAT: uGhnJwy6xZJV/e0VH8OkfFMOH//RSXNosQBDUF7ZgNu4tnUxukivDhU5cuyB7
	XloNsxalsLoVEKJoacjMo8tIjByfc9yws6qcaf5yIW9vl4Sv8vreGJSeYU7AnrWpgiDjEGA
	/jVVbA5i3USp5MjqqBTn7YOLTz3XIIk0qn5ClJkR2xmjHJe1kDXBygKbAmPMgDx5LOtLS6Y
	9eGAxj+0xWVb5DMJ2JSUQzJYwkL0JeVKE3cTS2GilDQ4XBJ2f3/XgtY2brOAxG5IBiIEp74
	u6q4EA4mlAyAUABRZ/h/CfeFTtBNqUYqJFiYk/TTGJP+USiKteN/iTi3Ckn6dFgQ/1ZCpgf
	WHHE9ur/U9x9YStAXTpSGRtqgQrNZ5IHLT5LFabhyeGDssoI6sMKWeHh1cdKI6fImGtbTAq
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8522446484513126745
From: Zhangjin Wu <falcon@tinylab.org>
To: arnd@arndb.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	tim.bird@sony.com
Subject: Re: [PATCH v1 6/7] DCE/DSE: riscv: add HAVE_TRIM_UNUSED_SYSCALLS support
Date: Sat,  7 Oct 2023 21:29:35 +0800
Message-Id: <20231007132935.6276-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <3a8f0d0a-25ad-49c3-9cd2-66db44a4a1e6@app.fastmail.com>
References: <3a8f0d0a-25ad-49c3-9cd2-66db44a4a1e6@app.fastmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_062959_574805_842586B2 
X-CRM114-Status: GOOD (  14.95  )
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

Hi, Arnd

> On Tue, Sep 26, 2023, at 00:42, Zhangjin Wu wrote:
> > For HAVE_TRIM_UNUSED_SYSCALLS, the syscall tables are hacked with the
> > inputing unused_syscalls.
> >
> > Firstly, the intermediate preprocessed .i files are generated from the
> > original C version of syscall tables respectively, and named with a
> > 'used' suffix: syscall_table_used.i, compat_syscall_table_used.i.
> >
> > Secondly, all of the unused syscalls are commented.
> >
> > At last, two new objective files sufixed with 'used' are generated from
> > the hacked .i files and they are linked into the eventual kernel image.
> >
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> 
> As mentioned in my comment on the mips patch, hacking the preprocessed
> file here is too much strain on the old infrastructure, the
> asm-generic/unistd.h file is already too hard to understand for
> anyone and in need of an overhaul, so let's work together on fixing
> it up first.
>

Ok, I was thinking about using asm/syscall_table.h instead of asm/unistd.h like mips.

    void * const sys_call_table[NR_syscalls] = {
    	[0 ... NR_syscalls - 1] = __riscv_sys_ni_syscall,
    #include <asm/syscall_table.h>
    };

Therefore, we can generate syscall_table.h from asm/unist.h with a tool like scripts/syscallused.sh

Another solution may be firstly generate a list of `#define __USED_NR_##call 1`
for the used syscalls from Kconfig symbol, and then change __SYSCALL() macro
to:

   #define __SYSCALL(nr, call)     [nr] = __is_defined(__USED_NR_##call) ? __riscv_##call : __riscv_sys_ni_syscall,

`include/linux/kconfig.h` defined the '__is_defined'.

This method may work for the archs with .tbl files too.

Thanks,
Zhangjin

>       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
