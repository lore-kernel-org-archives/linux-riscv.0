Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A93C63797
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 06:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1TBppGTTBYPDQXuZHoT0Byr5egog3+4hQo1QCTq9s8=; b=m69tu9lnVmCVOA
	qxnIUfvQPutWUn2Z70d8tFefrv5mzrvvaR+ez6CV9HzeWmvq1aoT+ITXaEkywuOVGtqu9cVWG9EoX
	ktkVchlT7zqSTuxeF9FSH7a4mxXzWCPLLkdg7229d1iBv37hiE80aWn8YZPd8zzFlBg0VsSCiUjrK
	GsDiBiRI1lAZABu4LAJ0VVRwsshsQyk4XR0CBZrtZM4wX9eMXirOlugnMbO+Nx/6MmrtjHU9/43ab
	Ci7SwmTO0OZcYLQQ8rJbGVGdLTsYHFsxHVsf+5x2GsbGgwdVrYo7D97+Hjd4ZlLetMB/kyq74ztiC
	eeoPv6KOuOzGK/Kv42og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHfRB-00D3jB-P1; Tue, 17 Jan 2023 06:27:13 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHfR9-00D3iZ-1o
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 06:27:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 637AFB8118A;
	Tue, 17 Jan 2023 06:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5900DC433EF;
	Tue, 17 Jan 2023 06:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673936828;
	bh=6HCpG8Qf5/MQ8nh1W9D1yh6J4bruyytOp8+//e6GPzg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Yl+aw4eKIbRR9tvurWD7mPnCIenu64tRka/gqeZqRC+gpX/xWxkMp17YcJ7xiM+Cm
	 ax52dhLrFx0VhCwE/tZ/YcHjdx/dpEOlvFv4Ejg1jNGan0RJ4OjyC03TAax3b54eci
	 23fYmxymovV1/LppztYuZVhTt7XBjg+3KlGrHrtH8QMUwhdVyoUFox/V+uALY3H/vt
	 u9XiWZSM/DsGyIqzpu/QVCuSzZLl8v0PQwCnPbB/ixbsCu7yyAJMv8ZXMrZXzRFhDT
	 cVSI+atjCwybASrsUumuAx3yf4DpuZ2kCBsbCFRUO6cnExcYDX3HkBWn15MZMNLN8Z
	 RKXaar/efs6Dw==
Date: Tue, 17 Jan 2023 06:27:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Masahiro Yamada <masahiroy@kernel.org>,
 Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] riscv: lds: define RUNTIME_DISCARD_EXIT
User-Agent: K-9 Mail for Android
In-Reply-To: <Y8XmbogsG+gLoOHj@xhacker>
References: <20230116154800.2396-1-jszhang@kernel.org> <20230116154800.2396-2-jszhang@kernel.org> <Y8V+mXWZfA62JYvJ@spud> <Y8XmbogsG+gLoOHj@xhacker>
Message-ID: <7596A4A5-52E6-41CD-A63D-AAC1A2346FFA@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_222711_267356_A0F3CB12 
X-CRM114-Status: GOOD (  19.47  )
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



On 17 January 2023 00:06:06 GMT, Jisheng Zhang <jszhang@kernel.org> wrote:
>On Mon, Jan 16, 2023 at 04:43:05PM +0000, Conor Dooley wrote:
>> On Mon, Jan 16, 2023 at 11:47:57PM +0800, Jisheng Zhang wrote:
>> > riscv discards .exit.* sections at run-time but doesn't define
>> > RUNTIME_DISCARD_EXIT. However, the .exit.* sections are still allocated
>> > and kept even if the generic DISCARDS would discard the sections due
>> > to missing RUNTIME_DISCARD_EXIT, because the DISCARD sits at the end of
>> > the linker script. Add the missing RUNTIME_DISCARD_EXIT define so that
>> > it still works if we move DISCARD up or even at the beginning of the
>> > linker script.
>> > 
>> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
>> > ---
>> >  arch/riscv/kernel/vmlinux.lds.S | 1 +
>> >  1 file changed, 1 insertion(+)
>> > 
>> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
>> > index 4e6c88aa4d87..07c19f2a288c 100644
>> > --- a/arch/riscv/kernel/vmlinux.lds.S
>> > +++ b/arch/riscv/kernel/vmlinux.lds.S
>> > @@ -5,6 +5,7 @@
>> >   */
>> >  
>> >  #define RO_EXCEPTION_TABLE_ALIGN	4
>> > +#define RUNTIME_DISCARD_EXIT
>> >  
>> >  #ifdef CONFIG_XIP_KERNEL
>> >  #include "vmlinux-xip.lds.S"
>> 
>> Since the diff is identical to:
>> https://patchwork.kernel.org/project/linux-riscv/patch/20230102124936.1363533-1-conor@kernel.org/
>
>OOPS, I didn't notice you submitted the patch which did similar
>about RUNTIME_DISCARD_EXIT, then I'd like to recall patch1. I
>expected some review comments for remainning patch2\3\4, I will
>send v2 which will both address possible review comments and
>remove patch1

Nah, keep your patch in the series.
I'll mark mine as superseded in patchwork.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
