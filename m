Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D815C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3ZrWPpnzXVsDx4mgtKvoanBl7ihzGuXejpRWjHmXnc=; b=Ky1MIg6pSTJrrS
	YCpKWce5xr/wY8dF+CBU4BokY3CYKP00V+HFtsOSQ5AMLYcXn17Ibt1akI9Ac5AZPqQ0WtblJDG/b
	CXFvkjjnrGKJvNRZqapUKBb82R6TCnMXylZCOFfB9fjNiiNqzBT21YWHk9P8SjWInJShED/dAu3Uj
	4lUPBzhQsN6M2uEcvNHPJ3GeNwp1dMFO1/8/iiz8o4a7DNw4fl1Tigjy5qr2kfgr70UBVRYZLApAm
	g4duXiytGoH6LkSdV73xpyJATIqfcINDaGJqm5Yop+tq+4fOJu5YUtSxMRXgfO8Dom9BqkmQCaw0D
	ZjjBnRR+CwOjamHBFnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbCz-00GGp5-5c; Thu, 02 Feb 2023 15:09:05 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNbC1-00GGGo-RL
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 15:08:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id h12so1972957wrv.10
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 07:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aYJ2N8WEHs5GTVFeSbPZHq4ulIlep5wwgIPvf0xRpx0=;
        b=emNEyF3xnXXJeUYNxx4wyhSDQsXeD7Sk7CkJ2QxZyKKtgxNaMEHAGYJOT2KelT2+gr
         vV2FkylDdDdrf5043yzEiNHi4T5MRroRPEo1cTUPo1JEoqm9O40uVrrrJW5hgje1VXQ6
         0/c5nriNGy/cjH/hC1wtc5l0CjVTLad2xhYhrvygdv55HP0eblbie7V7tfL38JDdLzqU
         fyMpG8LsIlthgQcsQ1hPgsgOPHoMR1qqAxdJrVRK5sValp3HgypcwDXSvkrqQL+V7UGh
         QjoBYblpYxqTzZsD+mv2a8u2R9Fxs/1wEqcEphvu0v4m6tzYCYdKEWuzCAxMIonwB9kp
         AM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYJ2N8WEHs5GTVFeSbPZHq4ulIlep5wwgIPvf0xRpx0=;
        b=4salzJfKLV9+EVvgvQOIcmBUkz32/c9NW3Uj5isx8rpc55XBumBCLSrZEh/XlN/Go5
         DNz6VUnBmtQWJlQZRLypGU9f5agSqfLiWA2boed4rLeh2TL59PNPzPXcLSOSgPBvgOLm
         QRvLbIDYjCy+biAHs1VThFB+3xC9JgQem4eUrY6ZmIYnV5ATdtI0ua1NPsrCSX6xJrYq
         /ZydWHKhk0STYjM+oQpuZUPKY7WT2t/N1AWB4/+fz9gBUp5vMriCBYp6q9fxP05XTa5e
         YG2GG9FKlvpbddqXm1JL8R/BTpjqRnvCsteEvbUDw3Xq2SwNLNUNqOgZHLuJnymEYHje
         MEhA==
X-Gm-Message-State: AO0yUKVvxkzhw4I8UDDk23b8FqSM8iNmE3W3j7imOsJ0da8nIjp8+slI
	71zpFReWSVJSd/JS5+MT2hLhUV/M2WPc9L8yso6TBA==
X-Google-Smtp-Source: AK7set+XEkvriksqDV6S8qdBAREdpP7cT4xADg8EhSkS/3ETeDAmV4wBFCCd91Ps9riFQGmny878Fyz+jPXTTIINCVc=
X-Received: by 2002:adf:ffcb:0:b0:2bf:e95c:9918 with SMTP id
 x11-20020adfffcb000000b002bfe95c9918mr219059wrs.330.1675350482003; Thu, 02
 Feb 2023 07:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20230131151115.1972740-1-alexghiti@rivosinc.com> <Y9lrB+RUBk1Njhaq@spud>
In-Reply-To: <Y9lrB+RUBk1Njhaq@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 2 Feb 2023 16:07:50 +0100
Message-ID: <CAHVXubh+DgdgXZ-hHk5rxmQkXSBdk1AvTr3dvT80L5YXQZF=sw@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] riscv: Allow to downgrade paging mode from the
 command line
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_070806_165230_FE1336FF 
X-CRM114-Status: GOOD (  23.26  )
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

Hi Conor,

On Tue, Jan 31, 2023 at 8:25 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Alex,
>
> On Tue, Jan 31, 2023 at 04:11:14PM +0100, Alexandre Ghiti wrote:
> > This new version gets rid of the limitation that prevented KASAN kernels
> > to use the newly introduced parameters.
>
> What's the base commit for this version?
> Fails to apply for me on top of for-next, fixes, rc1, and linux-next :/
> I also tried it on top of your KASAN series, but no luck there either!

Really sorry about that, that's the second time it happens, I'll
improve my workflow: I'll include the base-commit sha1/tag + a link to
all needed-but-not-yet-upstreamed patches.

Thanks for your time,

Alex

>
> Thanks,
> Conor.
>
> > While looking into KASLR, I fell onto commit aacd149b6238 ("arm64: head:
> > avoid relocating the kernel twice for KASLR"): it allows to use the fdt
> > functions very early in the boot process with KASAN enabled by simply
> > compiling a new version of those functions without instrumentation.
> >
> > I had to change the handling of the command line parsing to make the
> > code self-contained in kernel/pi/cmd_early.c to avoid calling too many
> > __pi prefixed functions from outside this file.
> >
> > I'll use this approach like arm64 to handle the extraction of the random
> > seedi from the device tree for KASLR.
> >
> > @Ard: I copied the "pi" name but I have to admit I don't know what it
> > means.
> >
> > Alexandre Ghiti (1):
> >   riscv: Allow to downgrade paging mode from the command line
> >
> >  .../admin-guide/kernel-parameters.txt         |  5 +-
> >  arch/riscv/kernel/Makefile                    |  2 +
> >  arch/riscv/kernel/pi/Makefile                 | 34 ++++++++++++
> >  arch/riscv/kernel/pi/cmdline_early.c          | 52 +++++++++++++++++++
> >  arch/riscv/lib/memcpy.S                       |  2 +
> >  arch/riscv/lib/memmove.S                      |  2 +
> >  arch/riscv/mm/init.c                          | 36 ++++++++++---
> >  7 files changed, 126 insertions(+), 7 deletions(-)
> >  create mode 100644 arch/riscv/kernel/pi/Makefile
> >  create mode 100644 arch/riscv/kernel/pi/cmdline_early.c
> >
> > --
> > 2.37.2
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
