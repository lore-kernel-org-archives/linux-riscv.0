Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1F2C004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nftTFIO2SPa7mPbNWlUOSHS9gzW5Wx+H8ZVGkaNHcw0=; b=Fc02+B4SoOQw/o
	ALtrLQkNSAwxNdLHl06AYVI16MAiur0uy79YR/cbqFlyuXzyFgSbrB0F0/04vceyfkUqZghtCcKzc
	ciMD/na8FWnC7hMG0ROA+aFUpurmUWArfklhQx4LZlQp6e/eX5P6rpkpzLU5WTcP9sRxIKMM6TtSL
	PNkMmoyEEKrZOLvhPw/L6/eH2X7myRhNE7QOy0clFU0cf+FSLF1c5Edn5LSO6pRZdBkR+sGcKAw92
	RtKC09yKQ0quBU07QSCxIULmCEovf0n3TXNliVD2OALf2zARSpLJwLj8XIy5bljS1r5a69Gd6sWIH
	FM+kv+hDyHN3NBODdVTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZo4-006b5u-2o; Thu, 19 Jan 2023 18:38:36 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZnx-006b45-Ot
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 18:38:34 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 188so3692509ybi.9
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 10:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug88fDNkyBI0BBO5NHntR5hEaqs+0c3VcEsiCYtu59I=;
        b=CD5UjpNAve5p2n34E505LpPA+Fv/mil+a7ySZCwa4cdirZCLCoBP7rDvLCQsu3xmaB
         Ew7kYB69mBAEO/u7k+sGlpBjnG1dp4IffmBZLuYU10krSiyCe6kHbJFvifaS/8czl96m
         rAv2FcZ5hIDB/+YDXs6PskZm3OcerKWQHclqeSHcXaQu7YChMjVbglQbqgPg4lFmGaxM
         feHHgPhsOQIooQ/G/3kR94YjL8y0XRIA66qH9V9zeksKjA4S3ZxleHZ4g0UZsZMDpCZ7
         VeURifs8UuavreMHSVgeZo4LBtIrsFjf78bsFmqLArlOR5YfXrO5d9p3C+p8ot5Of0Bv
         LFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ug88fDNkyBI0BBO5NHntR5hEaqs+0c3VcEsiCYtu59I=;
        b=NJuN7ul4bh5l4atn+Tzu6+EG9xa26l3FG44LECn8JZeVADKDWL8c7337tlo6YNAsP0
         YviMowF7gYEUqJpkmw0wd/RvSQFLn7gNI95VLMT6KVDLZUnUPky3IhONlcDEyucAtiUw
         DtkeyIS1ULH0nSVVUVmLr8ab2ady9wTRt6nKBLaC7hzhKpX829p0D7cx7g67TE3Cjm2b
         cfKaTtAAxAmU6MUgK/7RX0OmjdlO1NjlRVKESEJam1VoB4BQ+61LINqUh5bk+sjqeNe8
         qTZTLBd/vddl+j0UqlLS9FJGB1rt0ocqK0e0Vwx/Z/09WoSMcnHzTaLMDgJXI4HXCeBw
         w6/g==
X-Gm-Message-State: AFqh2kpa9TIxVdEk3BSD+kvsS1N0GnKlFlj4FYO38v+r8P3rQucnjrCu
	PCkFdIysTBkUKBBU84vRVmqnPRbFwNAFKv77Cp2OyQ==
X-Google-Smtp-Source: AMrXdXvj7JLSu67yZSCrAXbJnFAdEysNvlQhdZNSBcAvK1s7UO8zpqZUtwsbUaHqW+fn/EaUvPQ8kleXCyZxAjw4CDE=
X-Received: by 2002:a25:d4e:0:b0:800:9451:c106 with SMTP id
 75-20020a250d4e000000b008009451c106mr14043ybn.191.1674153508397; Thu, 19 Jan
 2023 10:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <Y8l6egh2wWN7BUlZ@google.com>
 <86tu0mmo8m.wl-maz@kernel.org>
In-Reply-To: <86tu0mmo8m.wl-maz@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Jan 2023 10:38:01 -0800
Message-ID: <CALzav=dya7GsOD7-dm3649Xe4Xo_p5gJACvjZHtpbk0QwoU-gg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230119_103829_889456_81B373E8 
X-CRM114-Status: UNSURE (   9.10  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 19, 2023 at 9:24 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 19 Jan 2023 17:14:34 +0000, David Matlack <dmatlack@google.com> wrote:
> > I'd like to target RISC-V first, since it has significantly lower risk
> > and complexity than e.g. ARM (which has pKVM, stage-1 walkers, and
> > [soon] nested virtualization to deal with).
>
> And (joy, happiness), the upcoming 128bit page table support[1].

Oh good, I was worried the ARM port was going to be too easy :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
