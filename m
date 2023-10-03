Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EA5E75433
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQuLryGI8u04Mnzf7ul0qeLWu6iFZXPnWEOxnG8xotE=; b=koTuUbG8cteTRZ
	LEtlPH1c4f2Vq0CrJZVFcYvPxCRdYn1iBCuuWAhlt9ptZhWZGSvTbdZfWwvReO4bi/RWbJm/cvwF3
	68sEQ2TXGFYSDJaIXwVSWtTsXUUyup0q8281Uu7ynPIrswM44WymYOGxorS5BDcIS+c3+o1rJKXOJ
	RsWldb0kKTudvMktCLSgQ+Q30NFgvF2nVxU/hd4W3DEY9dWoqDSZB3rsj//3uNn4TrSlgCqJWaczG
	pW0Mde0GtD485yvdxzKokI9tqopp5e/YIp6OdKAGlA9cQa9YEysg0E9mAqmyjrqmoXiktvfDLBZ06
	oDmpUjn5/y0LDq3NSoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaak-00E8P3-2G;
	Tue, 03 Oct 2023 08:17:18 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaah-00E8OU-10
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 08:17:17 +0000
X-QQ-mid: bizesmtp71t1696321014tnq024mo
Received: from linux-lab-host.localdomain ( [119.123.130.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Oct 2023 16:16:52 +0800 (CST)
X-QQ-SSF: 01200000000000E0Y000000A0000000
X-QQ-FEAT: qOAV9bwDT/kslhNsOjNH3gJafQbGN1FJWt1YOI+bEDmIQ71Yf8KntnUaWCK3y
	KUM1h7gExFtq6jc3cGxTvWmht2mni0DZg98J5E2QNnV0WxGvAWZzGdaKT7RTLw79SeYh0PY
	kks1ZV6iPO8D5iSycfeLdSoVT+p44HMi5gK/K1aj5yjafOvOm4DN2asOcIdto3EjBfThCQn
	Y2x++XsOaR+av4NXDa85YN6DZrvhC3LlbiS1WdcaCs4kaV6jOYD2CpmVPzrh0hAweVFkms3
	x7eYNsrKSYzOcc6DEyYx6v3//mMIfqMm/Nno1ScjAB6x+fr3rHEZ2yBstIewfC4AADj7mSv
	xFEtwosatx43fkQfcBoymLIxlxfUy/TPPv/egzVJ/jh+T6JQiY0aFFSD5t29w==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16612592793082372881
From: Zhangjin Wu <falcon@tinylab.org>
To: arnd@arndb.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu
Subject: Re: [PATCH v1 3/7] DCE/DSE: Add a new scripts/Makefile.syscalls
Date: Tue,  3 Oct 2023 16:16:51 +0800
Message-Id: <20231003081651.6047-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2c4bcf65-69f1-4af6-8f80-fe23a4fb20ab@app.fastmail.com>
References: <2c4bcf65-69f1-4af6-8f80-fe23a4fb20ab@app.fastmail.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_011715_698098_7AD28571 
X-CRM114-Status: GOOD (  26.84  )
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

> On Tue, Sep 26, 2023, at 00:38, Zhangjin Wu wrote:
> > When CONFIG_TRIM_UNUSED_SYSCALLS is enabled, get used syscalls from
> > CONFIG_USED_SYSCALLS. CONFIG_USED_SYSCALLS may be a list of used
> > syscalls or a file to store such a list.
> >
> > If CONFIG_USED_SYSCALLS is configured as a list of the used syscalls,
> > directly record them in a used_syscalls variable, if it is a file to
> > store the list, record the file name to the used_syscalls_file variable
> > and put its content to the used_syscalls variable.
> >
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> 
> I like the idea of configuring the set of syscalls more, but we
> should probably discuss the implementation of this here. You
> introduce two new ways of doing this, on top of the existing
> coarse-grained method (per syscall class Kconfig symbols).
> 
> Both methods seem a little awkward to me, but are doable
> in principle if we can't come up with a better way. However,
> I'd much prefer to not add both the Kconfig symbol and the
> extra file here, since at least one of them is redundant.
>

Ok, it is reasonable to remove this extra scripts/Makefile.syscalls if
we only support the configuring the set of syscalls via Kconfig symbol.

> Do you have automatic tooling to generate these lists from
> a profile, or do you require manually writing them? Do you
> have an example list?
>

Yes, we have but no generic tool across architectures, libcs and systems
and I plan to delay this work as the part3 patchset of the whole series.

I have tried two methods, one is objdumping of the binary, another
method is recording the used syscalls from the libc linking stage, both
of them are limited to single-application system, for complicated
system, the libraryopt [1] tool may be required to find used libcs at
first.

The objdumping method simply greps the 'syscall' instructions and
extract the syscall number from the 'num' register write instruction,
but I have encountered some exceptions, that is the nearest 'num'
register instruction is not just the one for the 'syscall' instruction
and therefore we may get a wrong syscall number, I do have a demo
script, but it is very ugly currently [2], and I have found Tim have
prepared such a python script too [3], not sure if it may get wrong
syscall number either, If not, it should be a good one for our future
development.

After getting the syscall numbers, it is not that hard to convert them
to syscall names with the help of <unistd.h> or let kernel directly
accept a setting of syscall number via the Kconfig symbol (I have tried
it, but it may make things not readable, so, the support is removed in
this patchset).

Another method we have tried is recording the used syscalls during the
linking stage of the libc (only for Nolibc currently) with the help of
sections-gc [4].

It uses such logic:

- Rename all of the my_syscall<N> macros to _my_syscall<N>
- The new my_syscall<N> use .pushsection to add empty and not really used .rodata.syscall.__NR_<syscall_name> sections
- Enable -ffunction-sections -fdata-sections, -Wl,--gc-sections and -Wl,--print-gc-sections
- The unused sys_<syscall_name> will be eliminated, record the syscall list as group1
- All of .rodata.syscall.__NR_<syscall_name> section will be eliminated, record the syscall list as group2
- "group2 - group1" should be the used syscalls

Basic test shows, this works well with Nolibc, but it requires to modify
the Libc source code.

Thanks,
Zhangjin Wu

---
[1]: http://libraryopt.sourceforge.net/
[2]: https://github.com/tinyclub/linux-lab/blob/master/tools/nolibc/dump.sh
[3]: https://github.com/tbird20d/auto-reduce/blob/master/programs/find-syscalls.py
[4]: https://lore.kernel.org/lkml/cbcbfbb37cabfd9aed6088c75515e4ea86006cff.1676594211.git.falcon@tinylab.org/

>       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
