Return-Path: <SRS0=INRY=K7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0FDC47082
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 08:03:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11C4C61380
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 08:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11C4C61380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+ERkLRDFiFdF+Jwzk2IN8n/6BD8dsPcrLHWfvQjSP8=; b=tyro9tV2MBtCyQ
	qRHjzboWhHlLehLL5pfK4H78y3dYFlDJ4dT75LLiBiJbTzhm0CquiDbpLpS6iYKl1hYDVCG9zN/LL
	dB2435qb7ovkSPIEJ78GUgIoCfusl9YLok2Kq3Vc5nyR0p6jJ8YIHwy6UKMIuDMp0u1QjuR/DPtmh
	Ajo8NTV4ljZ/nQ3Ac8DP2z7W04dVjAD6DXaoCWitMYkoOqOSAyJphm2RuoceprumYp0iC1DDGy1TT
	I8yGcrxJGlLi5uaMwIFsTPa7CDgeILyAvLzsz02DVlWCCwk/JX4A4MnQnMoOi7YHhZsT4FaaoQIii
	fm1HiP9+7f97EKcenqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpRGq-00GFGA-Ce; Sat, 05 Jun 2021 08:03:04 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpRGl-00GFFi-MM
 for linux-riscv@lists.infradead.org; Sat, 05 Jun 2021 08:03:03 +0000
Received: by mail-qk1-x730.google.com with SMTP id d196so6612322qkg.12
 for <linux-riscv@lists.infradead.org>; Sat, 05 Jun 2021 01:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K3vs5/z/aVaz7sVwe8HZzwxt5fKtTmUCCoC6h+qr0pU=;
 b=n1OCSbuKQ8GmZqJs4O9nG2OBAKjoH25SuGqPdI6xaC8Sg9XtLLCRKwVVTOo7BbfHH6
 Cgsbqwfg4VXRaIW6HJEdTLf2xB80fXzt85G41DXzyZ1Q/s3SJx8ru7JDKe1L8j74M0sO
 7iW/WA4xtxMUcj7mpw0Zv2G0nUe3h+hJRzRB/KMPP1Y2YbCLSGrLlm8jQ/BpuTY8m0VE
 1wgCNSg61bZcELyozQ26XeOCUmZzsFRhGsK6Ii9W2c7O5ij6RX+L+M1bsEFAg7SZEfeW
 yzD1aRgS2qx+ILwIVbj8estvzJoITPiBjsMCcf0SKWfEhbGFqhiepojoY3JQff20RVrF
 H/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K3vs5/z/aVaz7sVwe8HZzwxt5fKtTmUCCoC6h+qr0pU=;
 b=EOiyPB6D+GOqzWoYjcK4Mse6d7j5ryHc1/wNVbtvNtEj1ue9n1PsUELzOPk9N8UWoB
 lxfxM7egDG1pwGJIWmrt24VmjE0XJ/phTHWhFwweVVhGJvaO0NznS7zDXMm0JkCEtp6u
 /FT0v+Yhp+2uTAESM84mTZ7IniWJDajOIEgc3tK+Vy+Du2goFovNb3cJYjRjdTzooNOQ
 rs84FnT8sotl+OxQUpACHWxQS0jqWKEA6BNMn1Jr7FMyctBa4vqANnhnzl3DwwOg0dsT
 4gbg0NSuRnh9uZjPr+JCVyJCRrAnwgJpGEBrN52qZcqYRxcdzn/j6jruU+dqkKcTsz+2
 GIxQ==
X-Gm-Message-State: AOAM532vcTk4VtlyRpiFXqU4LYvmWg3clHXdjrLIcUAb7ipLTJC8QcRo
 Ekb8bYoAFH+duBOS/A8IhqJgjnHmzk0Thi1H2d0=
X-Google-Smtp-Source: ABdhPJwQFYERWKhbbdBsVEWBnlIGuPXaC/4w6fI7rhWIUXxXf5ThvRnqz7YVnn9DApWcnfYqWAjI57KP2+ijKoMblpE=
X-Received: by 2002:a37:6f85:: with SMTP id k127mr853833qkc.178.1622880175907; 
 Sat, 05 Jun 2021 01:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <CACuRN0NjftJDUAsF2pkXbx0jnJ=bba9+j-hJA8Mjj0r4RVicLA@mail.gmail.com>
 <mhng-a3a53753-73e5-4676-93d3-33c4b8760283@palmerdabbelt-glaptop>
In-Reply-To: <mhng-a3a53753-73e5-4676-93d3-33c4b8760283@palmerdabbelt-glaptop>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Date: Sat, 5 Jun 2021 17:02:44 +0900
Message-ID: <CACuRN0MV4zNj1rBTnppoSudy98aOj2Pj6Ld1+D8mz0fn8kxGtg@mail.gmail.com>
Subject: Re: [PATCH 0/1] riscv: better network performance with memcpy, uaccess
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Gary Guo <gary@garyguo.net>, Nick Hu <nickhu@andestech.com>, 
 Nylon Chen <nylon7@andestech.com>, linux-riscv@lists.infradead.org, 
 Linux kernel mailing list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_010259_774197_B85C29E2 
X-CRM114-Status: GOOD (  28.18  )
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

On Sat, Jun 5, 2021 at 1:19 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 04 Jun 2021 02:53:33 PDT (-0700), akira.tsukamoto@gmail.com wrote:
> > I am adding a cover letter to explain the history and details since
> > improvement is a combination with Gary's memcpy patch [1].
> >
> > Comparison of iperf3 benchmark results by applying Gary's memcpy patch and
> > my uaccess optimization patch. All results are from the same base kernel,
> > same rootfs and save BeagleV beta board.
> >
> > First left column : beaglev 5.13.rc4 kernel [2]
> > Second column     : Added Palmer's memcpy in C + my uaccess patch [3]
> > Third column      : Added Gary's memcpy + my uaccess patch [4]
> >
> > --- TCP recv ---
> > 686 Mbits/sec  |  700 Mbits/sec  |  904 Mbits/sec
> > 683 Mbits/sec  |  701 Mbits/sec  |  898 Mbits/sec
> > 695 Mbits/sec  |  702 Mbits/sec  |  905 Mbits/sec
> >
> > --- TCP send ---
> > 383 Mbits/sec  |  390 Mbits/sec  |  393 Mbits/sec
> > 384 Mbits/sec  |  393 Mbits/sec  |  392 Mbits/sec
> >
> > --- UDP send ---
> > 307 Mbits/sec  |  358 Mbits/sec  |  402 Mbits/sec
> > 307 Mbits/sec  |  359 Mbits/sec  |  402 Mbits/sec
> >
> > --- UDP recv ---
> > 630 Mbits/sec  |  799 Mbits/sec  |  875 Mbits/sec
> > 730 Mbits/sec  |  796 Mbits/sec  |  873 Mbits/sec
> >
> >
> > The uaccess patch is reducing pipeline stall of read after write (RAW)
> > by unroling load and store.
> > The main reason for using assembler inside uaccess.S is because the
> > __asm_to/copy_from_user() handling page fault must be done manually inside
> > the functions.
> >
> > The above result is combination from Gary $B!G (Bs memcpy speeding up
> > by reducing
> > the S-mode and M-mode switching and my uaccess reducing pipeline stall for
> > user space uses syscall with large data.
> >
> > We had a discussion of improving network performance on the BeagleV beta
> > board with Palmer.
> >
> > Palmer suggested to use C-based string routines, which checks the unaligned
> > address and use 8 bytes aligned copy if the both src and dest are aligned
> > and if not use the current copy function.
> >
> > The Gary's assembly version of memcpy is improving by not using unaligned
> > access in 64 bit boundary, uses shifting it after reading with offset of
> > aligned access, because every misaligned access is trapped and switches to
> > opensbi in M-mode. The main speed up is coming from avoiding S-mode (kernel)
> > and M-mode (opensbi) switching.
> >
> > Processing network packets require a lot of unaligned access for the packet
> > header, which is not able to change the design of the header format to be
> > aligned.
> > And user applications pass large packet data with send/recf() and sendto/
> > recvfrom() to repeat less function calls for reading and writing data for the
> > optimization.
>
> Makes sense.  I'm still not opposed to moving to a C version, but it'd
> need to be a fairly complicated one.  I think having a fast C memcpy
> would likely benefit a handful of architectures, as everything we're
> talking about is an algorithmic improvement that can be expressed in C.
>
> Given that the simple memcpy doesn't perform well for your workload, I'm
> fine taking the assembly version.

Thanks, for merging them.

I agree that having a fast C memcpy would benefit many architectures.
I will make the patches for lib/string.c by extending your memcpy and send
them after I finish other priorities. The current functions in lib/string.c
use a byte copy, while most linux capable cpus moved to 64 bits.

Akira

>
> Thanks!
>
> >
> > Akira
> >
> > [1] https://lkml.org/lkml/2021/2/16/778
> > [2] https://github.com/mcd500/linux-jh7100/tree/starlight-sdimproved
> > [3] https://github.com/mcd500/linux-jh7100/tree/starlight-sd-palmer-string
> > [4] https://github.com/mcd500/linux-jh7100/tree/starlight-sd-gary
> >
> > Akira Tsukamoto (1):
> >   riscv: prevent pipeline stall in __asm_to/copy_from_user
> >
> >  arch/riscv/lib/uaccess.S | 106 +++++++++++++++++++++++++++------------
> >  1 file changed, 73 insertions(+), 33 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
