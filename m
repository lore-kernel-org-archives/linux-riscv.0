Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59EEC77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdGWpcHI6AmfZzpvy3VVvopx8nImWifJ43GvJb5C/rg=; b=uBY+lqXhwKHsEv
	/gO74naIZGc02c4P6i4ZrPz1W32WRzQmslPA4cJmRSWKl/SZCpFv1nsCxSVqW9Qvd0YWDVPGsYgsQ
	gSrRDa1dtdZLZ1/Ts66Hgtggg+eTRCmEPXunTzMCKSpp7rzAStSsUQJoQLJ1MlbFdkP2a25o0m8Tn
	haoN5F5v3KahoGo05q9qpPASfyeJWDTNv52azL4vTEN77UHTSzokzchMMWEQibI6QLcmsKhjmMiUb
	k+p5XfAAIUMuZ2dUjwGmSHraAtPJWRDIZflrq8Eqd9rwA/X1lC2vuLItCfparLPafEHEMrjp6Hbv+
	yo6GY0pNdHZohoAsKTQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0NFF-001dzG-2D;
	Sat, 20 May 2023 14:07:41 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0NFC-001dyI-2A
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 14:07:40 +0000
Date: Sat, 20 May 2023 16:07:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1684591655; bh=ySREgzMBnxEK+0ESf3+KXe4YjYf8WKePWiFol6csxZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9NICF87zsuSxMmlrl2aWcCqjjZp/fU9cSUqETjqgM4+cH6C2+Wwuc/NA5UW4i/xa
	 qwURD69NS6FdK7PtSo8slY/2nv/cYTQYQCIHVe4z2Xfq3py00oqtRXlnr/4oPIejux
	 E5bJ/ykbzSIS+Z/1dkpOLNCi/p39Yb28r252B+Qs=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Zhangjin Wu <falcon@tinylab.org>, aou@eecs.berkeley.edu, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, shuah@kernel.org
Subject: Re: [PATCH] selftests/nolibc: Fix up compile error for rv32
Message-ID: <d98dfd41-8938-4388-90f0-38199d2f0574@t-8ch.de>
References: <20230520-nolibc-stackprotector-riscv-v1-1-d8912012a034@weissschuh.net>
 <20230520120254.66315-1-falcon@tinylab.org>
 <20230520133237.GA27501@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230520133237.GA27501@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_070738_869297_BC219115 
X-CRM114-Status: GOOD (  20.65  )
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

Hi Willy!

On 2023-05-20 15:32:37+0200, Willy Tarreau wrote:
> Thomas, Zhangjin,
> 
> I've merged your latest patches in my branch 20230520-nolibc-rv32+stkp2,
> which was rebased to integrate the updated commit messages and a few
> missing s-o-b from mine. Please have a look:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
> 
> However, Thomas, I noticed something puzzling me. While I tested with
> gcc-9.5 (that I have here along my toolchains) I found that it would
> systematically fail:
> 
>   sysroot/x86/include/stackprotector.h:46:1: warning: 'no_stack_protector' attribute directive ignored [-Wattributes]
>      46 | {
>         | ^
>   !!Stack smashing detected!!
>   qemu: uncaught target signal 6 (Aborted) - core dumped
>   0 test(s) passed.
> 
> The reason is that it doesn't support the attribute "no_stack_protector".
> Upon closer investigation, I noticed that _start() on x86_64 doens't have
> it, yet it works on more recent compilers! So I don't understand why it
> works with more recent compilers.

_start() not having the attribute is indeed an oversight.
No idea how it worked before.

> I managed to avoid the crash by enclosing the __stack_chk_init() function
> in a #pragma GCC optimize("-fno-stack-protector") while removing the
> attribute (though Clang and more recent gcc use this attribute so we
> shouldn't completely drop it either).

I would like to first align x86 to __attribute__((no_stack_protector))
for uniformity and then figure out on how to make it nicer.

> I consider this non-critical as we can expect that regtests are run with
> a reasonably recent compiler version, but if in the long term we can find
> a more reliable detection for this, it would be nice.
> 
> For example I found that gcc defines __SSP_ALL__ to 1 when
> -fstack-protector is used, and 2 when -fstack-protector-all is used.
> With clang, it's 1 and 3 respectively. Maybe we should use that and
> drop NOLIBC_STACKPROTECTOR, that would be one less variable to deal
> with: the code would automatically adapt to whatever cflags the user
> sets on the compiler, which is generally better.

That sounds great!

I explicitly looked for something like this before, dumping preprocessor
directives and comparing.
It seems the fact that my compilers enable this feature by default made
me miss it.

I'll send patches.

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
