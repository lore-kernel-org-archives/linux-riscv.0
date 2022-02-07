Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B02C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 07:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1a5OPQwVDZD2xR/yc5WZ6PdOpWZfhARC0FkWtyphvU=; b=h0eTOJpE4Fg/Q7
	tpgk/e16dzn67IINKEwuQiFB7yNNXybyWnKkVX4ehfXL0FztXLOhRbnuNIsYLGDqfNvr3E3MDxEzi
	SRRNwZ8Su+Gd5JvHYVXJQ6schTLAXGPyJQ1b8n6xAdw1z4IWLSF2A18+/qR9hAyTXVdeeyHeWAQmr
	NMe+ESXVBiuSEaI3Pauo23BSiZ5KRWeS3tu8uj4wWDuA45mm+evlxxof9S80Bpu8zsO3AavUiB0wS
	FEDxuaw2kFUgRUIvNDJnvKvXmyNSOk7+R030MK689BIPL3NaLAJrvKEhC65rBg716F4LrGySVNSdE
	GLwGl/jyJkNe5IZ7jXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGyZR-009EvV-6v; Mon, 07 Feb 2022 07:36:21 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGyZO-009Ev9-3A
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 07:36:19 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MHG4W-1nUE6l1O7c-00DGo8 for <linux-riscv@lists.infradead.org>; Mon, 07 Feb
 2022 08:36:11 +0100
Received: by mail-wr1-f41.google.com with SMTP id v19so8146228wrv.6
 for <linux-riscv@lists.infradead.org>; Sun, 06 Feb 2022 23:36:10 -0800 (PST)
X-Gm-Message-State: AOAM5309whGGHxOyzyIa45INDXabM5AnXI/AkUqc0LP8J9yFOAnVzsOa
 fzlg1eSXDI8UJa1uyUd+JDOcP3rge9JrXNUWlRM=
X-Google-Smtp-Source: ABdhPJyVGlOIgvpJW7xM8t4FOY4J099x0i6fJeSzk3p1XheXRjJZU8gVJdRuTWL3cfoKvVb3ClydTQGTK80Ui1xm5V0=
X-Received: by 2002:a05:6000:3c6:: with SMTP id
 b6mr8739723wrg.12.1644219370262; 
 Sun, 06 Feb 2022 23:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20220206174359.2986-1-jszhang@kernel.org>
In-Reply-To: <20220206174359.2986-1-jszhang@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Feb 2022 08:35:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Nnw5gfPAYx5UGdW8Om16GDcBi1-SS9Bs+CyLzssgVbA@mail.gmail.com>
Message-ID: <CAK8P3a3Nnw5gfPAYx5UGdW8Om16GDcBi1-SS9Bs+CyLzssgVbA@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: reduce THREAD_SIZE from 16KB to 8KB for RV64
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:VOooGUA58tJjI8Shwxe/uDWSKPna+1sAgafzOjyvLboonGd03+a
 8/d47cQANu+QsdmNaBcPNC+rJL2fuEy260velayfH8Sm1fS7mz6HHbC7Oujlx3Rlh6fW3Ti
 ZiIPRyhnd5/aeKDF2m70o9wwM1SeQBb0TnmjXH4OUO+dvAAoX/0SOqjgDodXYVu02mozZbg
 7SOJb8FxnyWJBcEKb0sUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GRz+fbv5hBA=:/XELDVbg+/7fzFyFG09mIg
 de7ykGvtzo0SJKaH2SbfYF63HaZFQwtBlDNsPH3W5NGsbHIuNHIsYv1xBSAXAs9i3ZEMd5lvW
 LZd6+DmO+YVAiJCXd0qxwfrp2yaXRBcIsukZN5oG1Zbxl30aqrgEJXFtmZtS0uRy3z7QuPD6c
 DEjf/bOygn73Op6s1bj3EU17b5lMWgAAGJ76zBYiXb4mFsqC+0g2o/kbhY9AiIzi59I9NbiVl
 OFjKGal+xz9LHmaJhcRx8IeRSMFTVYEtYNPC2IgoxgNRBYNTXBYP96Q5aXAmiUVi04a4nrGhv
 G8tCCP1SvmOxRUTnso99E3v5bfUCQlikjdoU6fvIDEU9vKAGRH6H4IURQgF1RdmpFIwj5JVLv
 Ej3EZ3pH2ntb+1N/urecTJJK5thK9z2ZXuL0KqjV3SYVfgBiafpRUrN/ajBEQtFehi1YIr/nj
 J22dYHYbyiuE+jGTtNwJzWX4FRGnG5k2yIdEk4WpHKJN5w3WEKaW6CJEuaARuCTV/k+te11n1
 yTj3pLMa+yHKaA8YTzBR7vj7u7ECKh9AP3xk594U5URXzmNLKzCKUvq8LApiOAZwb5HYV3EjT
 5iGlkazLKpgY0n9ywxebUDYbZzToGNVadLjLxVXIFpUZgmkRrTK1r3lrxf9fNTupgrJHMkhgU
 Pz0kC+bJ0OmMV8MWgsxkN9kryrEQl7rwRZCjomqp0CKDsoaRsUoPdwngjynHDwP0sdhPXaKsA
 yUbSsNy/1yZOQN6ZTDKNV7PYAvAH+h+4D+nK1OKJMKOYrEK0cI1SyFvJ/SQtGXyBCVUqJFtGj
 CsTQXvYYSkL75QpbCS8n/WADjL2+A2gRWVQnxwNFQsK+Of4CBY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_233618_475259_9B8EE957 
X-CRM114-Status: GOOD (  21.46  )
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

On Sun, Feb 6, 2022 at 6:43 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> After irq stack is supported, it's possible to use small THREAD_SIZE.
> In fact, I tested this patch on a Lichee RV board, looks good so far.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

I can definitely see the value in this, in particular when you get hardware with
small RAM configurations that would run a 32-bit kernel on other architectures.

However, it's worth pointing out that all other 64-bit architectures use 16KB or
more, so it is rather dangerous to be the first architecture to try this out in
a long time. Some on-stack structures have a lot of pointers and 'unsigned long'
members, so they need twice the space, while other structures are the
same size either way.

IRQ stacks obviously help here, but I don't think the 8KB size can be made
the default without a lot of testing of some of the more rarely used code paths.

Here are a few things that would be worth doing on the way to a smaller
kernel stack:

- do more compile-time testing with a lower CONFIG_FRAME_WARN value.
  Historically, this defaults to 2048 bytes on 64-bit architectures. This is
  much higher than we really want, but it takes work to find and eliminate
  the outliers. I previously had a series to reduce the limit to 1280 bytes on
  arm64 and still build all 'randconfig' configurations.

- Use a much lower limit during regression testing. There is already a config
   option to randomize the start of the thread stack, but you can also try
   adding a configurable offset to see how far you can push it for a given
   workload before you run into the guard page.

- With vmap stacks, using 12KB may be an option as well, giving you
   three pages for the stack plus one guard page, instead of 4 pages
   stack plus four guard pages.

- If you can make a convincing case for using a lower THREAD_SIZE,
  make this a compile-time option across all 64-bit architectures that
  support both IRQ stacks and VMAP stacks. The actual frame size
  does depend on the ISA a bit, and we know that parisc and ia64 are
  particularly, possibly s390 as well, but I would expect risc-v to be
  not much different from arm64 and x86 here.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
