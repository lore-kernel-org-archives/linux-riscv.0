Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22C4E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZlGXkhXLRw5bZ0YmNBDVXMZQfWu4/EWFI8jJFJFKz3k=; b=0JTd5UBkPAXYp9lCV+1sDSwUq7
	TET574Fd23nV44hE+o92hdUJqv6rX9wEbmmL60MCJkEf87ipImjHqkRk720ASInzhUIw3mG9xdP0Z
	yJj/JnDXIvzKnZ7DjUcZzgp5zvRHk6mxRXKMOsQHXgXR9rSyss2MNrOHAQsYj3eLcPi0J+tKVrs0f
	rRcxkWob+rS0rNiypet+CNjJb/9DXPfbSEk14iRNfbmrTGbEcGJjxyKfeeyGLl/RaPS8UyWYgofzn
	f/M3A2EpMWi75AF2FBrNuQo6oOAGxyjknA0Bits4X/pOfW/ifXZSR9IywFxUz7O8FnFrgSZfjdlU3
	wWfrMKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpvY-0000000A1UV-2bhL;
	Tue, 14 Jan 2025 23:02:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXomO-00000009qp2-15Zx
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 21:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SY5ohLi34L7dYoduVlaYy23kjKtiA3foJ9V2Q6nj8Ew=; b=hnMbApVosPXyJvrpmHLQQBZU6D
	LHxImM2b7YJNhNj9z5MqpwEccnfGefcPBClLMKvVufOkPoqykId8bzvIEsvpvIMMzKaEPzYIx9Bse
	h88UzZRhd/HoHyRBKc+Vi3V75sE+lxfrA/4kl1GN/nP9Ellitpi6nn6NyKBRnpL2y96Zoc6NzGuxW
	Xo7KAWekAWRwhGYVdoTSETlUUNaGc3htpGahG9Ykp3Pb10QitUUPu06ZkZBcSPLPhqbOXyKOLDSgN
	16Kc+cuH9STtrLsp6q2109jpjJG+su7CM1cF7plwW8BabdH34UYa5v7HByntsTHMdegDnSgxu3aTG
	Gv7BmLhA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXomK-0000000Aes3-206x
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 21:48:54 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef80d30df1so10433564a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 13:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736891330; x=1737496130; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SY5ohLi34L7dYoduVlaYy23kjKtiA3foJ9V2Q6nj8Ew=;
        b=rn+8t8u6AxOPuuzEU8O+dDWz863eUyXLhiyfbYd7zSVTdwrOxzvIDo6Suy4YKG7+Sk
         EhNgtdfK6YhJte+hWr5yN2IDAkAP8mJ1N9NQu+J2dmywm3yue3ss7H3sPsRCyAQ83e/9
         e8tdRTMr3UCNZJXOgRe2KsBP2o3jPkQeUONbx1St/FoT/YHPETtksLeimX3hlMj3lCy3
         VFS6UQtrrxxSAw0VcFRBCUOTjbDoIgHdhoHaaDK233lrl0WqmPN/dNE9xcoF0ieodr9y
         +jVdeqMssI8IhhOlC1wLLRb8zpnAOSbxk3f+3CW4eEZP66j+4rKc1peiUIBeFdmdpL9O
         6LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891330; x=1737496130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SY5ohLi34L7dYoduVlaYy23kjKtiA3foJ9V2Q6nj8Ew=;
        b=MJmu1bYg4Y/CNrEXH12r7QYS+S2/ssnv85T/5jgtNkPzYM7VQEhJmX0ra0j69oAeGh
         XAQCAeCPQYi7e8D78Yo8HnkRwy98nAq9WPbFB643WiImRvAv2XLhpA4VHMeNGjZfGw7J
         UAW9H7vOOvMwhJGskxgAf8/P6DhcQc0RD4NVi1R/0WC7XMR2lbLouF+jDirlEv8Sy1t5
         YVq1LSHMuqG5gasXrf4Iq1YCKzXGdqchoLe3CkWbqWnJzhNgIX4t0DIdgy9t7F137fym
         BunSSAY6iFTjdyzLeqsq4XKsehYV61vm1GzGGdfZGaK7kWcGjUqQ/Yc/9denAnLWZ6EC
         OmXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS8o5pTwVoeAK40txezQJb0Xas1a+iOtOAw5CX12YnZ/CDl8cTa1Oi6zEOY1NQEu0+P9sTNsknsqBB2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJu5lmu3Jc0kn3tYOZbFoqgEwum0mM+nlBUHK1CkJ7B6dKghdr
	kc8VfpYH8OrnUs79OcyaSCgv9j3Cks1TQR3i18S89Y+uCRHtpbUW4UXCq9K/7ef5775v00iTLCc
	J+w==
X-Google-Smtp-Source: AGHT+IGwfpH2TIl0yoCx6tHXuYKAWJYGIodcKzr2p0TmFaGwbmX4878qRqYpxqFQD7ygsze3Eu4GllOh0sY=
X-Received: from pjbtc14.prod.google.com ([2002:a17:90b:540e:b0:2f2:ea3f:34c3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d00b:b0:2ee:d63f:d8f
 with SMTP id 98e67ed59e1d1-2f548ebf53cmr37053651a91.13.1736891330040; Tue, 14
 Jan 2025 13:48:50 -0800 (PST)
Date: Tue, 14 Jan 2025 13:48:48 -0800
In-Reply-To: <Z4bTlZkqihaAyGb4@google.com>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-26-vschneid@redhat.com>
 <Z4bTlZkqihaAyGb4@google.com>
Message-ID: <Z4bbwE8yfg349gBx@google.com>
Subject: Re: [PATCH v4 25/30] context_tracking,x86: Defer kernel text patching IPIs
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra <peterz@infradead.org>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_214853_226692_2E7DC6CE 
X-CRM114-Status: GOOD (  23.15  )
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

On Tue, Jan 14, 2025, Sean Christopherson wrote:
> On Tue, Jan 14, 2025, Valentin Schneider wrote:
> > +/**
> > + * is_kernel_noinstr_text - checks if the pointer address is located in the
> > + *                    .noinstr section
> > + *
> > + * @addr: address to check
> > + *
> > + * Returns: true if the address is located in .noinstr, false otherwise.
> > + */
> > +static inline bool is_kernel_noinstr_text(unsigned long addr)
> > +{
> > +	return addr >= (unsigned long)__noinstr_text_start &&
> > +	       addr < (unsigned long)__noinstr_text_end;
> > +}
> 
> This doesn't do the right thing for modules, which matters because KVM can be
> built as a module on x86, and because context tracking understands transitions
> to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
> being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
> or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
> patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
> use the wrong static path.
> 
> I don't expect this to ever cause problems in practice, because patching code in
> KVM's VM-Enter/VM-Exit path that has *functional* implications, while CPUs are
> actively running guest code, would be all kinds of crazy.  But I do think we
> should plug the hole.
> 
> If this issue is unique to KVM, i.e. is not a generic problem for all modules (I
> assume module code generally isn't allowed in the entry path, even via NMI?), one
> idea would be to let KVM register its noinstr section for text poking.

Another idea would be to track which keys/branches are tagged noinstr, i.e. generate
the information at compile time instead of doing lookups at runtime.  The biggest
downside I can think of is that it would require plumbing in the information to
text_poke_bp_batch().

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
