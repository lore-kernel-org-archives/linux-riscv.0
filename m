Return-Path: <SRS0=qC9n=SG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570CAC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 18:56:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2716F2075E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 18:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nL07bjpz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M76lnXAH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2716F2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dIg8M1MAxoHQoCQJ1ZHCRGh78hItL74WE2EtSim8Go=; b=nL07bjpzJOZ4C/
	BmOtUlGJzhu3QKjSXpppH8LV63DF1q7ys+BgEmG3tcr/yJS8uVf/HOn50qQf4/1TnXzQ1oP7oTThe
	atwHGVQQHMHaftjnZnMWZYhycP3PCjAosN6zk5MPTUrZ8TYqACR8IMU6MVpiX2yyBBlpWLANtafR0
	YLzpCJf6w8nvoTZyWGqXdZB+stzRbEXCPDAa0jAzow7HDKN4wmLbZM9BRxE8x1BY4JIIo27/GaGJp
	2iR4ARn0EPHPc5SYsaR5CGSOGbns3j15W3q7gEPW+QAWKGytSUvtv7fNmsc9yD92iEMqyr4OiXji0
	1LZa+I5JUIe5Q2F2wvig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC7XX-0002pU-Hv; Thu, 04 Apr 2019 18:56:43 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC7XP-0002g6-3R; Thu, 04 Apr 2019 18:56:36 +0000
Received: by mail-yb1-xb42.google.com with SMTP id c15so1430474ybk.8;
 Thu, 04 Apr 2019 11:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=czb2ENwQGWnSQaCPQIrYNCynYy2KSbTtKbmrxk8aiuA=;
 b=M76lnXAHZW3E/8sfPEo6AMsEvKo1Fj2EhqlUI6eC714OKjs2ScEs0g5Kdp16SCqkPF
 N0+X6xTwMiV/VBKBoM8U7lCaiLZf0D5h8H0NYyJsPMWgNRUMOJFoGIeE3Kw2Z03GU9vT
 zVyDQ6CnNyqqWAbFqnkhKqeqcKWpSWW3q20J6IQ+uvd8srIqBj9yOsnXEon9ojIURp4v
 bTLlHhqhnN0+9uDyqXd9PWoJbT4ZfrXOkz5CQF3mN7LEVXFyBxCwjgwaWqj7DMqenuLs
 uXedhWbK9lmCM0WnwBXxlX+/J6awXNP/t6T5RlKFdEob9MOiRhxs9ue2K7i3gYHUzYfA
 pf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=czb2ENwQGWnSQaCPQIrYNCynYy2KSbTtKbmrxk8aiuA=;
 b=ioU4IdqIbOHXWsJ5DwCu1u1jqf4f38Pcmeyj6i8Mo1tVSfGGjAVWuGmvAzlKAp6daP
 Fl23oT3TFs0WIOJjpfP8M0iB79vw3ZWF+qhkQBgvfJKK4pFMVz5xPwwSTDK28I8zIoVz
 wi6OhQmpWsLFsve+ZaO3I8Bmek9TIakmc84hckqFBfoZxxu2RWtEMcGA4si7NPbiAlPs
 hEf9HbL5abwPL35OqBx/SlVBHRCICPeMvKtXSkqqtRN3vfvSaJGHxKdGExwjp59gRcbX
 5uIXAsllatauSoEeuR92JxFsvjvlsH4YicUv0Zc2Em4LAgOrsDxljgMYms7t1E431Glc
 I+/g==
X-Gm-Message-State: APjAAAUrnVodHpbZs3ikiOWGP2IRloZmcbBlbwGQ6KyCeRTvleOvSZs4
 66qMOPO5BdwzvUF2339tiiqktJycsiNM/ZBjsVM=
X-Google-Smtp-Source: APXvYqw2AeCdLcNxw3yXyG2q9A1yJJjPzbkEFkUNasjS0SEO0/rC6tigTrt97xSpbl9QpVkQd9PzuPxHxf4nnJWaXhg=
X-Received: by 2002:a25:6c88:: with SMTP id h130mr6951040ybc.112.1554404194312; 
 Thu, 04 Apr 2019 11:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190401134104.676620247@goodmis.org>
 <20190401134421.278590567@goodmis.org>
In-Reply-To: <20190401134421.278590567@goodmis.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 4 Apr 2019 11:56:23 -0700
Message-ID: <CAMo8BfK8gdgni3z3PKv1rd0KPFMXgDCpicQQ_obuoDAEz3PkZQ@mail.gmail.com>
Subject: Re: [PATCH 5/6 v3] syscalls: Remove start and number from
 syscall_get_arguments() args
To: Steven Rostedt <rostedt@goodmis.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_115635_183384_4655075D 
X-CRM114-Status: GOOD (  11.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:IA64 \(Itanium\) PL..." <linux-ia64@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@sifive.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Oleg Nesterov <oleg@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 Dave Martin <dave.martin@arm.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Roland McGrath <roland@hack.frob.com>, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "Dmitry V. Levin" <ldv@altlinux.org>,
 linux-arm-kernel@lists.infradead.org,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 1, 2019 at 6:45 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>
>
> At Linux Plumbers, Andy Lutomirski approached me and pointed out that the
> function call syscall_get_arguments() implemented in x86 was horribly
> written and not optimized for the standard case of passing in 0 and 6 for
> the starting index and the number of system calls to get. When looking at
> all the users of this function, I discovered that all instances pass in only
> 0 and 6 for these arguments. Instead of having this function handle
> different cases that are never used, simply rewrite it to return the first 6
> arguments of a system call.
>
> This should help out the performance of tracing system calls by ptrace,
> ftrace and perf.

[...]

>  arch/xtensa/include/asm/syscall.h     | 16 ++----

For xtensa changes:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
