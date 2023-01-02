Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3F0C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 07:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6QVlXwPrkkStXhj3lviafHs5+En6sVA+zhZUJFcgho=; b=KGXzUD743LDhtQ
	Ej2DcGq8OZHe1QsVSlGdRQqjGIHrXANLRavFnK+8mLUx9yJdEVN6xd+r5sVHggaxAjtHWP3cFo+gM
	Ebz/y44dQY36ljqXkGGCWX+//0eou7AE/O70PvJ9UmNRsi+4rH9k5le/1Wv0xWPKizxB8fX2mk+IY
	a3DPaAgf8bT99QWOyApPqYzg8sILdeDYpPLdAoR4XBCBKBxK4THM2aWT2UMO3Q8nSTvLfmGatv9Gj
	rRrXlhs3hWxcn1mLY4yJfuBcq+exVBtddApapY5w1V5E1jJEi6ew1AGwEso88q54bdXENFAHQAfgl
	rS4ItmjCw9wYnL5EXqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCEw9-009Afp-Od; Mon, 02 Jan 2023 07:08:45 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCEvv-009Acf-Ut; Mon, 02 Jan 2023 07:08:34 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pCEvi-0003ql-G6; Mon, 02 Jan 2023 08:08:18 +0100
Message-ID: <bb976dd2-490c-a2a0-6c46-65ab79a413b2@leemhuis.info>
Date: Mon, 2 Jan 2023 08:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] arch: fix broken BuildID for arm64 and riscv
Content-Language: en-US, de-DE
To: Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Dennis Gilmore <dennis@ausil.us>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Jisheng Zhang <jszhang@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, llvm@lists.linux.dev
References: <20221226184537.744960-1-masahiroy@kernel.org>
 <Y7Jal56f6UBh1abE@dev-arch.thelio-3990X>
From: "Linux kernel regression tracking (#info)" <regressions@leemhuis.info>
In-Reply-To: <Y7Jal56f6UBh1abE@dev-arch.thelio-3990X>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672643312;c84dbd9c;
X-HE-SMSGID: 1pCEvi-0003ql-G6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_230832_253930_8C8A25EF 
X-CRM114-Status: GOOD (  21.30  )
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
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; all text you find below is based on a few templates
paragraphs you might have encountered already already in similar form.
See link in footer if these mails annoy you.]

On 02.01.23 05:16, Nathan Chancellor wrote:
> On Tue, Dec 27, 2022 at 03:45:37AM +0900, Masahiro Yamada wrote:
>> Dennis Gilmore reports that the BuildID is missing in the arm64 vmlinux
>> since commit 994b7ac1697b ("arm64: remove special treatment for the
>> link order of head.o").
> [...]
> I just bisected this change as the cause of a few link failures that we
> now see in CI with Debian's binutils (2.35.2):
> 
> https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2Jjl88DXc3YRi2RtvXAzlS8NQ4p/build.log
> 
> This does not appear to be related to clang/LLVM because I can easily
> reproduce it with Debian's s390x GCC and binutils building defconfig:
> 
> [...]
> 
> I ended up bisecting binutils for the fix, as I could not reproduce it
> with 2.36+. My bisect landed on commit 21401fc7bf6 ("Duplicate output
> sections in scripts"):
> 
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=21401fc7bf67dbf73f4a3eda4bcfc58fa4211584
> 
> Unfortunately, I cannot immediately grok why this commit cause the above
> issue nor why the binutils commit resolves it so I figured I would
> immediately report it for public investigation's sake and quicker
> resolution.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 99cb0d917ffa1ab628bb67364ca9b162c07699b1
#regzbot title arch: link failures in CI with Debian's binutils
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (see page linked in footer for details).

Ciao, Thorsten
-- 
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr

Annoyed by mails like this? Feel free to send them to /dev/null:
https://linux-regtracking.leemhuis.info/about/#infomails

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
