Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E6AC02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G4vv5al9TlXOnkhC9icLM9RkHToU8TnqdA30sRoh++k=; b=cW5NBicow8IJFxS6il1hrNLjiJ
	FW6poI/EK5b9xxl1tw7MXao6mnUc1JCThyzjRF36n4JBXZ7xGCDKp9+BTuCapV6bli8Lnt3oGknWM
	j18SGBNwQYx4sAC+xb17xYZN8Q86BV3+mb7IgT1ikmphTBvaSIoqo9fBUlc9vyLIfsOuhJyKC206g
	hUnU88B7cLiIFmLqI6rrr7Kv+GfOlGXeUHLSYF55mjxCLRKgKkqYZ/p2ayIWxtrPUWWlw7hGxP8NS
	BmnmxvwjwK6VHFT2PaTUly7kkMDYBtyu6g+RPmF1x+jY617xzGrf4IIg3Ck2oCYZrQDIodThrceYM
	YUXOAb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYq1W-00000000wlO-0IGc;
	Fri, 17 Jan 2025 17:20:46 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpwQ-00000000w3Y-34Cn
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 17:15:32 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2178115051dso44450825ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 09:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737134129; x=1737738929; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/pcx17eniD+ASjh3teIfjrJN/d55a+1SMCIjE05N6Y0=;
        b=zttRI2SODOA2JjE61Y/01AnIpRrQYvAzSo00TWby6t6n99RBppCqDZRk81QL/ciooo
         NtwFq0hbxbaLPiGE63AwiIIs6treFB9pxTpKh0ujrbyRK9BRZAcygl/BocEQO86m5C2f
         Ay79PMYLs5AVRCy+utQ2t4HDt/DFRW+wFrLImBbWNlxfgMn8gSqzYEyb/nVVHgcQnfQR
         IcKV801YWlGXapQO/zE0dEpj+n0HadRTyOF8geBeXTKmAvNdNsGswHetiySjZJTTrzTq
         OrkNbc0dZtpV+32Q8mamHlXc3q/cR8JpkeX4cAHfnct5h+g2BtJBYHfGiYXyb3ivLs8q
         NZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737134129; x=1737738929;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pcx17eniD+ASjh3teIfjrJN/d55a+1SMCIjE05N6Y0=;
        b=CS/UKwfM/CM6cJHlJ2VzvYo7z6U+x8XNLYHjRilwzCC206B5AveoaEt8CITpS9kQ3V
         QoNLXFekSHNBAzHL0X1/CF+VLiPvpJvo3qGgp5JA/9T5M/7GsB25xMWgdmtenKbpLs0U
         ubALXBk0a41AlaUu81m4l1l6JI18ips2wyJnIUp1T5vbEpqSdcf29JZSG5pFiYc2ZBTp
         01Gl186SIj1huPBLXNcC1pYkRbmf1jSBRQGhLWFqXqs84yp10YQ4SwMbe2XO1czlGyWh
         vfmPtaq2aIVVM7YOkt34UJ5DTg0hjBIR1qxnpVbwZT5Lxbde7wLuCntW4y00COpGWk8X
         DPDA==
X-Forwarded-Encrypted: i=1; AJvYcCU6toT6gycOyEVST/FsNfI5BVadBZn+8YttU1ExGdJqEbnMtxLlXgV+EQrEAnNfpgmIWgnM+RE3GB2RNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSjzyOURE7sKOHQFCKTzvbCLAmqkILmI/Q9oi+xyUNpyY9T9DT
	8E3e5cC7dRrGDarUn5EnDhdlovqR6nFaA/zOWXlT8f8hy9TZmkFrPNyU2W0NLcDRk54buYrvwdr
	t8A==
X-Google-Smtp-Source: AGHT+IFBt8EUJmCBrYJSR6SbgIXxnZj6fm10TNGjaAj4XRK+x0dRIzGirCE9VGAaKkDPtl0zEYTqCFRnILs=
X-Received: from pfbcv2.prod.google.com ([2002:a05:6a00:44c2:b0:725:a760:4c72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:148d:b0:725:eb85:f802
 with SMTP id d2e1a72fcca58-72daf930e3cmr5815077b3a.2.1737134128872; Fri, 17
 Jan 2025 09:15:28 -0800 (PST)
Date: Fri, 17 Jan 2025 09:15:27 -0800
In-Reply-To: <xhsmhed11hiuy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-26-vschneid@redhat.com>
 <Z4bTlZkqihaAyGb4@google.com> <xhsmhed11hiuy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Message-ID: <Z4qQL89GZ_gk0vpu@google.com>
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
X-CRM114-CacheID: sfid-20250117_091530_762342_742A0F32 
X-CRM114-Status: GOOD (  21.62  )
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

On Fri, Jan 17, 2025, Valentin Schneider wrote:
> On 14/01/25 13:13, Sean Christopherson wrote:
> > On Tue, Jan 14, 2025, Valentin Schneider wrote:
> >> +/**
> >> + * is_kernel_noinstr_text - checks if the pointer address is located in the
> >> + *                    .noinstr section
> >> + *
> >> + * @addr: address to check
> >> + *
> >> + * Returns: true if the address is located in .noinstr, false otherwise.
> >> + */
> >> +static inline bool is_kernel_noinstr_text(unsigned long addr)
> >> +{
> >> +	return addr >= (unsigned long)__noinstr_text_start &&
> >> +	       addr < (unsigned long)__noinstr_text_end;
> >> +}
> >
> > This doesn't do the right thing for modules, which matters because KVM can be
> > built as a module on x86, and because context tracking understands transitions
> > to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
> > being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
> > or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
> > patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
> > use the wrong static path.
> 
> AFAICT guest_state_{enter,exit}_irqoff() are only used in noinstr functions
> and thus such a static key usage should at the very least be caught and
> warned about by objtool - when this isn't built as a module.

That doesn't magically do the right thing though.  If KVM is built as a module,
is_kernel_noinstr_text() will get false negatives even for static keys/branches
that are annotaed as NOINSTR.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
