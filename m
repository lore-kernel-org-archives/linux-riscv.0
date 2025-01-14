Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D903C02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 21:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/2YK1TP5XGGe7pN9lUJgs9bwcKIfH97xHu5cQr6yWnU=; b=tUzozwlJhEhyQIVTPRvPKagE4h
	2mg4v+tlToOQAgw//mg+VOUqE4DS42mZZSWh7RoqAu0bFKNV9zXh9IomYBMoietH1O2fPkGbN87sn
	N7dZziBifK/3cUZkDuUk3vA1YeNf6NZXp08YE4gzCxG4rEYXIv1KTODevU1G1UvdpQM7xpfzCBMRT
	2deQ5Jv1DToBhZcLzZTWlx9F3I+jrVRSjmX1JhOUytCFCBqF20vJdOorm7TWty7jVoBlRu+m++OKA
	ag3anHJKoU/TFUppiypdEgVXTMjia6nJOK4ARsvuTszmCmXGdVnTHFWRNrlsts2o/3wCZNqgdAOv4
	Txlx/XUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoJu-00000009mtU-1gDF;
	Tue, 14 Jan 2025 21:19:30 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoJq-00000009mrK-36wN
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 21:19:28 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2163dc0f689so154237035ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 13:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736889565; x=1737494365; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVbipT56M6kECF5Qh7elLUxboyXWurLrq3UYAkefsoQ=;
        b=2ggAj7ASj85l71WZb//O6NhkwO+7ZQyZXUdlghhUABErPxnqsUNTmtJHsyv36dux6V
         5OR8Xj7LfRHAl7G62Zvz74v+Tn5JlC2IuAk62KczQTDEFM5yL6zj1R+NtAdw0QHfc6VY
         hS5xkaOZlOhCrSi0TAxM/a4uBk3wF4aQyVHtj9uXdsP0Mb1dYQ+eOp7W+lycVayiQUm6
         UAiKjksKUFkXnnLU+3gZBrMpky3h8GU/lBNJYtd6IzGQWnaQ1K/G0e88YuwOhk9QI1SY
         hH2wbXCUQKhtc2Z7NToHmNpKlOeDQG3V8gq5Uv+b48swsGhiDfwcIi10dU8ozS5XWoKY
         NSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736889565; x=1737494365;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVbipT56M6kECF5Qh7elLUxboyXWurLrq3UYAkefsoQ=;
        b=Z6ZPRQTFdjCC2xuPJedseEk5a5JemZuKwjyhlfuulYtR8WjEtHYg/bcLc/CXAWJTfc
         aT6hBH+cRj5oUmmwp7yBRs9CTOexWByAPP4HRpwIjx4RMqBrWKoBWLcaFSOfX0wc4CjH
         RWIAunPqjl51PD1dOZ0KUzpbHWK14hAT3noUuJX30pfr1En6IgCr0iquqLxOMiWWhqDJ
         AzZLk0iV21cW/7zg8+dAbsMA3RIBtXhPDekAyvPFcBynnwZ+E1To2M6CqOfP6pntIS3A
         WMiaw2fKggN12TCvopXsi30wEsrKAcAfkX+py/wNpmeGYecF9DtjT0FhZ4TzjypDi7iy
         G4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWLpR+fONKI7kfQOsQlHeTTG/r+zUNgZ73CcDHws723/OOCPeiaS8RARwyoqicdNVpFzWqwCUGgZ/KNbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxCIUClU8y9xuY2qy0w41San3hcaNsEBjv7YT79f/Sjl01MlbG
	QEEO5lS3CggAPxyuq03y016zaUm+0VDDVje85Sp0vXV+CozZZmyUBw2p1ItBNDZYsvUaZfmh16p
	57A==
X-Google-Smtp-Source: AGHT+IGTMIc2Hr+w/ebVVGGlbFAB7WFV7TbQJLIjfH34Jlhrw+YYPMlrag1B602JmLWOQ4sU4fLE9W3Pz50=
X-Received: from plap13.prod.google.com ([2002:a17:902:f08d:b0:217:8109:e87])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec1:b0:216:3dc5:1230
 with SMTP id d9443c01a7336-21a83ffc1dbmr401799985ad.42.1736889564696; Tue, 14
 Jan 2025 13:19:24 -0800 (PST)
Date: Tue, 14 Jan 2025 13:19:23 -0800
In-Reply-To: <20250114175143.81438-19-vschneid@redhat.com>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-19-vschneid@redhat.com>
Message-ID: <Z4bU2xlZXh53lgH6@google.com>
Subject: Re: [PATCH v4 18/30] x86/kvm/vmx: Mark vmx_l1d_should flush and
 vmx_l1d_flush_cond keys as allowed in .noinstr
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
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
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_131926_776301_8130B6C7 
X-CRM114-Status: GOOD (  13.54  )
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

Please use "KVM: VMX:" for the scope.

On Tue, Jan 14, 2025, Valentin Schneider wrote:
> Later commits will cause objtool to warn about static keys being used in
> .noinstr sections in order to safely defer instruction patching IPIs
> targeted at NOHZ_FULL CPUs.
> 
> These keys are used in .noinstr code, and can be modified at runtime
> (/proc/kernel/vmx* write). However it is not expected that they will be
> flipped during latency-sensitive operations, and thus shouldn't be a source
> of interference wrt the text patching IPI.

This misses KVM's static key that's buried behind CONFIG_HYPERV=m|y.

vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x241: __kvm_is_using_evmcs: non-RO static key usage in noinstr
vmlinux.o: warning: objtool: vmx_update_host_rsp+0x13: __kvm_is_using_evmcs: non-RO static key usage in noinstr

Side topic, it's super annoying that "objtool --noinstr" only runs on vmlinux.o.
I realize objtool doesn't have the visilibity to validate cross-object calls,
but couldn't objtool validates calls and static key/branch usage so long as the
target or key/branch is defined in the same object?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
