Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F5AC004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 19:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/AUPG5DCfuyZhrLNhPxDW8FvAhcE2esMSclVelsuwk=; b=dkwrZxzUTQ0gTb
	tzkYPpB/Zn3RirPrayE2XJwz13y9GI2ndWawW41BFpf5OUmSCf9zw86uMPAnjZ4oJ1wsmis4+/RqE
	R9xR2ZfagtUuGqfvpK8QOofM+UzWzSuOCUNtWvn6M+FMVzvWW7Wn80x3cwfVmg/DddX9a3M+NFLWm
	AaZ1SpbdYs3QOSYk+Jw16LvyI+msWOP9f9WDdFl2108ljF1OfbzsIGLDV/JLuug+mU5nw7BnNvm/s
	oRZPSGOn2pz7BNKlWb7ElWuWfrYW9E8UqQ4jA/OV2Mgm00eTf5gArr9Kb/frLn2FC6wpuR/11ssn0
	Ue7V6mmkbPuJxp4WHwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIaTg-006ttM-NE; Thu, 19 Jan 2023 19:21:36 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIaKP-006pNh-Ko
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 19:12:03 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4a263c4ddbaso42073807b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 11:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZdECDAg9mmwgMiId+0pdkIRFxWXX0Q/ZbZP48ymAFw=;
        b=Giy1ebz7O7hQyLTIrtkNNdjBv+MOt2a11+O3yrLKdfi0gkb9lOByfeSgTPczfJEGb2
         p8d0RDgaBcgodvbREpLedfJYFzJ6sUh3y+/Kk2nB5wG0XWFvHIIwdRQir2FjfdWdS9Tj
         +rt17AF0fb7qkyCHUXHbr0WuZ+0k+UmlUL3XRsZ35z/NG8KC17aR/t4/C07kqwQtIjYu
         ik9/D70oGXpm9zYVjNL7tCpYbaSSHLrAJ0Kx6LokMM1zSa/Omk45VsI0lkLRYIZHjJ0t
         T4WywLp/HCTt1yfU3CMQr50DAEA47mnPOtX1zH6p6WhCGjVh6+PNei54Lb8VlWVsM6ML
         fO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZdECDAg9mmwgMiId+0pdkIRFxWXX0Q/ZbZP48ymAFw=;
        b=5beeKS+Elgj3paG/cbWmIKYbteyRj5eyJio/AvAIVi8AXr0Xz38FbCOufznpLgIqZg
         d+bWQUKLBe7d1cWF3/6yQSkZuXTeW6jCAxPt6yUDN+a2sCLnH4vwFfjssfCU7rgwUcDp
         VU9o0yrO2rDFYSUsg4b1tSip4WimVH0BoY/Q/Zw/JdTy06nVKSBgOwWKtBGgTHKslZEx
         NAyeaTVh4xu9QF0/eADKlE7xYNmCdAEujQEDlw2M8+3DGIwovM1RiqYAZ7mBbhayk1Sk
         y1b0ee9p6dmmb+Vfv9KpBlAmG0F43/tsEPfLLL2+UaBGgj0v1f05e3FdGYtWl/gZSfH2
         eVZQ==
X-Gm-Message-State: AFqh2kpeD72jR9LR7KVoN5Q9yZ0yryNRhfP2qPT3xk5ciB/0nXtme+5c
	UMnJc7pG18PEyubqYz2wGo5tpvFHKrtF/7Qn2bMt3hdT9J1l5UCP
X-Google-Smtp-Source: AMrXdXtw3ClXGsau5g83hRYHF5bMmdLrbSAwU9zjlK/t8/PMP/LzBLrUT8Sd0TO+7LHePXlgOs+p8s15w/v0I2sj3tQ=
X-Received: by 2002:a81:4bd1:0:b0:478:1c89:6462 with SMTP id
 y200-20020a814bd1000000b004781c896462mr1433601ywa.150.1674155091041; Thu, 19
 Jan 2023 11:04:51 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <Y8l6egh2wWN7BUlZ@google.com>
 <86tu0mmo8m.wl-maz@kernel.org> <CALzav=dya7GsOD7-dm3649Xe4Xo_p5gJACvjZHtpbk0QwoU-gg@mail.gmail.com>
In-Reply-To: <CALzav=dya7GsOD7-dm3649Xe4Xo_p5gJACvjZHtpbk0QwoU-gg@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Jan 2023 11:04:24 -0800
Message-ID: <CALzav=ebYgZu2LfeQkspU_ke6GHbuPcpiST0pMafmAJGziybnA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common code
To: Marc Zyngier <maz@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_111201_727882_180A1A65 
X-CRM114-Status: GOOD (  15.27  )
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

On Thu, Jan 19, 2023 at 10:38 AM David Matlack <dmatlack@google.com> wrote:
>
> On Thu, Jan 19, 2023 at 9:24 AM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Thu, 19 Jan 2023 17:14:34 +0000, David Matlack <dmatlack@google.com> wrote:
> > > I'd like to target RISC-V first, since it has significantly lower risk
> > > and complexity than e.g. ARM (which has pKVM, stage-1 walkers, and
> > > [soon] nested virtualization to deal with).
> >
> > And (joy, happiness), the upcoming 128bit page table support[1].
>
> Oh good, I was worried the ARM port was going to be too easy :)

But in all seriousness, I'm not too worried about supporting 128-bit
page tables in the Common MMU, assuming it is a compile-time decision.
The way I'm planning to organize the code, architecture-specific code
will own the PTEs, so each architecture can do whatever they want.
There is a hard-coded assumption that PTEs are u64 in the current
code, but we can abstract that behind a typedef for 128-bit support.

We will need to figure out how to deal with concurrency though. Will
128-bit page table support come with 128-bit atomic support (e.g.
compare-exchange)? If so we should be good to go. If not, we'll need
to emulate them with e.g. spinlocks. But either way, figuring this out
is not specific to the Common MMU. Even if ARM kept its own stage-2
MMU we'd have to solve the same problem there.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
