Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EEEE95A61
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1vYhgwybtu4YIZrRUVRMg5MUgujd1RoWd1lNDFyIw8=; b=JKoENBtxPN3HnW
	UuLn3KO9Z83I3r9GaOwerr8eMMiEn6E/Ik/qK8Rs0wlRcGytPzHXjxLvt/p8CJQSuIlACe7a45UqN
	9LRrPhFiB/j8ZIXphug65lj/1+Yaz4YehbFGgNX1ThTWuNFAZVihKd1+cExG52UNJL8fjOCsO+6TM
	N2+tqEmIyoc5hTTwfdBWuUA3AmUGnRxtHqNSmXc0x0ExEdNZjCn7CEitaUgh4Aj5E/wC82VuCwPkE
	0jRVNhH/wKQPQUq48C+xCj9AcyGufwd2KH++TMl2FS4Pmbk29UZRB7AZAo4aJq5AMWTfGofQwBshy
	XiSIyWdbT0xk14pvD5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp6tL-007Zj3-1q;
	Sat, 07 Oct 2023 12:58:47 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp6tH-007Zgx-1p
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 12:58:45 +0000
X-QQ-mid: bizesmtp62t1696683499toxoeh80
Received: from linux-lab-host.localdomain ( [116.30.131.235])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Oct 2023 20:58:18 +0800 (CST)
X-QQ-SSF: 01200000000000E0Y000000A0000000
X-QQ-FEAT: znfcQSa1hKZVfh9GrD3uNMtHNu/dw/83w4TCDC4x6Jkd6m4RFK30wwv2HWQDi
	KugXEjBTPsuU63pTKX6kpwf6tCMey5OtbXURMx/GfECLbAQJOHnY1olUoKfE2C0DhXXEGUK
	7vkArlwgpGMvr3PmudYOTzGZUCDAnWzB2lBm/xMADqA0KzWwZ7wW94nePe3r8/ozUgWH+x0
	QeskCUegNlNShOPcCSC/oa6tLrv+mOGQa+JFUsTRHgVVh35NIdfmeXMmYpDS3x12S1KqH6g
	YQtzglvBMd/L1n8DnnFJbiyCecymNKTV74C1HIanc52TVIGytRS/+51gao0723AL6cZSL8Y
	UHsmO2K0qCEQWFiuxIuaZLs4owMb1IpjNmYwTBPO1wKxjIMVXI=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4895001494971990047
From: Zhangjin Wu <falcon@tinylab.org>
To: arnd@arndb.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	tim.bird@sony.com,
	tanyuan@tinylab.org
Subject: Re: [PATCH v1 4/7] DCE/DSE: mips: add HAVE_TRIM_UNUSED_SYSCALLS support
Date: Sat,  7 Oct 2023 20:58:17 +0800
Message-Id: <20231007125817.5259-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <862f42d7-b582-4d88-a9d2-f72ea5bfe903@app.fastmail.com>
References: <862f42d7-b582-4d88-a9d2-f72ea5bfe903@app.fastmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_055843_958967_31193A82 
X-CRM114-Status: GOOD (  16.83  )
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

> On Tue, Sep 26, 2023, at 00:40, Zhangjin Wu wrote:
> > For HAVE_TRIM_UNUSED_SYSCALLS, the syscall tables are hacked with the
> > input used syscalls.
> >
> > Based on the used syscalls information, a new version of tbl file is
> > generated from the original tbl file and named with a 'used' suffix.
> >
> > With this new tbl file, both unistd_nr_*.h and syscall_table_*.h files
> > are updated to only include the used syscalls.
> >
> >     $ grep _Linux_syscalls -ur arch/mips/include/generated/asm/
> >     arch/mips/include/generated/asm/unistd_nr_n64.h:#define 
> > __NR_64_Linux_syscalls	165
> >     arch/mips/include/generated/asm/unistd_nr_n32.h:#define 
> > __NR_N32_Linux_syscalls	165
> >     arch/mips/include/generated/asm/unistd_nr_o32.h:#define 
> > __NR_O32_Linux_syscalls	89
> >
> >     $ grep -vr sys_ni_syscall 
> > arch/mips/include/generated/asm/syscall_table_*.h
> >     arch/mips/include/generated/asm/syscall_table_n32.h:__SYSCALL(58, 
> > sys_exit)
> >     arch/mips/include/generated/asm/syscall_table_n32.h:__SYSCALL(164, 
> > sys_reboot)
> >     arch/mips/include/generated/asm/syscall_table_n64.h:__SYSCALL(58, 
> > sys_exit)
> 
> My feeling is that instead of postprocessing the generated files,
> it would be much better to make the elimination part of the
> existing infrastructure that generates the files from syscall.tbl,
> and finally change the include/asm-generic/unistd.h to the
> same format, as we had planned for a long time.
>

Agree very much, then we can simply touch the common files, no need to
touch the arch specific files.

> I should be able to help out with that part.
>

Thanks, is it enough to touch these ones?

    $ ls scripts/syscall*
    scripts/syscallhdr.sh  scripts/syscallnr.sh  scripts/syscalltbl.sh

One question here is that is it possible or required to share the used syscalls
selection code among them?

Another question require your help is the compat part, the compat stuff makes
things harder (include the Kconfig symbol interface definition and select
logic), perhaps we can simply limit our first DSE version under !COMPAT?

Best regards,
Zhangjin

>       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
