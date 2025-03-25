Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5586AC36008
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqXUMs9w0DBu4gZJVkh6eXykX7YtNs2xkZGP7ZKPSl0=; b=rQuSE8iADtyZbo
	c5mYuui6JtSaujnxrJccBiQX9EspLTwDQzmlPmSCAu+DDyuFpA4GeLSB43knPYV5SgE8ksq73vYhC
	xs8EXd5s51F6DNVke3/wQyX0/41/QJ6xJCDt4+9NE34Jn3tqtk1Y/4qk6xxfgJJgglv3eiPojhj57
	LrQ1l8P2zkhNngO1mN11MWJ7LOnW3XB6/rMxwo6Gm858bsTESQIz3ptMEQmGwSRABjYOP8oRwwFfZ
	C1BbEvlUKFGqAtuE2HXicLD24eTlWBCpJVPDqVzQaCJXPlJJgjjsrdTs3pmBWYE6bwO+1Up8SxbFc
	QqXP0n+cXmFklqSBPZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8T7-00000006fTC-1uVK;
	Tue, 25 Mar 2025 17:53:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8SB-00000006fEa-3HVg
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 17:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742925161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=58+r+FAQ5TTby/P3+2e15XArHywgR9oB31F4zzKw58o=;
	b=G12cdrLZiH2O0I4Fg9LV2QgbNKilLkFryvzQoZqQyrdz4IU7BXV+H8AgVX+ixYY3mzjs0J
	pr8rcxZr3R2Od8PodkTO80jh4WHY8KNzNIjFL+0u585isJEqAChbTEthKR4TJWoPYyrqkh
	Lpm5nAIXo8zJzGyw9V+1NuhsjdY9mtU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-xO5m0qKIMNCegMnJSICrrA-1; Tue, 25 Mar 2025 13:52:40 -0400
X-MC-Unique: xO5m0qKIMNCegMnJSICrrA-1
X-Mimecast-MFC-AGG-ID: xO5m0qKIMNCegMnJSICrrA_1742925159
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so45854555e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 10:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742925159; x=1743529959;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58+r+FAQ5TTby/P3+2e15XArHywgR9oB31F4zzKw58o=;
        b=pl1Ri8GQOp5Gszw/0OXD321vclpehbKf5TWreKnPSsr+23IAH6BOWmDujr5x4tOyF+
         Eq5n+rmlvijoqMRxZ92Y6vEGgiU6O2WomAvueVwDib4c/7mk5Kn98/hZyoLj2FkgZ9pa
         EE4CsndhR28D2/M+fqj0FPsiLppA2REuWeHx+49N4z8lfUWEdmWKOfoFIy1Y4Rej+THp
         DF/2eTTF0wmLuycsKwKO5ZfIMlz2l/xSoPvUN7cPzP9yoBQU61MasKCY1C9TQDLYezvj
         XSsL3m9IIx7kwtRCJnuSA2uWsQopdzMXXozyAg/C9yrfpWvdlCuEc6iOIxF1wBFBTTA2
         L5Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUugu7x+KP5GF6lqpf9/BvPAexASZgMrj697I+oA6YJfz4bfCMf+0y4OkZXUKavHayPSJSvIY3NgUyQbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzvO5jCpqPLON6macuO3UWa7LsmcfIPAAAKL/nLcYBOpb9g6O/
	1SNzm4Ix/jKEl/PfM8MT5D2c1Lc7d2VJ7Sqj9cDqNGNhLv+fVvV/pugZkztlpb2OYnMroWCrKGJ
	zHIuL5xuEkVXGXCXLefWRSWphwT5qv5BB9eP7NoFQ1T7dswW1SXroGT00gix/jffA+A==
X-Gm-Gg: ASbGncsF0zS+rdFFmKnP8/RHwL7yfYbgrGHTucJ4eCwjyAsrY2m0PxjJcNkZZqiZzIJ
	BvvNSUFcGyHh3K4dDhpmqNtcNG4mDCN046k/yE1PD1KowMcHqz7jZCHA8XVzeaXqFVg8tPHw/nk
	Mq9DqfSd6wM/cRIWc9SJSt2Sp4mhJ9rawxvyYu4ewpS8OEtAP6Ilk/q9PvaMKu/VHwDm4ClgokX
	5PPrKXuFCXtcxUlpa/4J6JrDGNrNncTVuJs6YauOZ+n83p0o2bb3aNe4/INJ9esJqEndga5OyrY
	2jR7+eQ3elRuhifzGQ1znqhZEA59A1p7pEjXmy40hPDkzC42HV6Hox3yHvzK8xa+jvR/HwaB//F
	F
X-Received: by 2002:a05:600c:4584:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-43d509f4b25mr191666855e9.15.1742925159211;
        Tue, 25 Mar 2025 10:52:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE+waNkOHjpFuU78xXxVfBVrthL7+/n2itqapsAHnKkAlkbjOyC6OGUhEtlUEcPF/6kvS3dA==
X-Received: by 2002:a05:600c:4584:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-43d509f4b25mr191665765e9.15.1742925158655;
        Tue, 25 Mar 2025 10:52:38 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b409fsm14543767f8f.50.2025.03.25.10.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 10:52:37 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, Jann Horn <jannh@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
 <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan
 Gupta <pawan.kumar.gupta@linux.intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Tomas Glozar <tglozar@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook
 <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
In-Reply-To: <408ebd8b-4bfb-4c4f-b118-7fe853c6e897@intel.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com>
 <xhsmhjz9mj2qo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d0450bc8-6585-49ca-9cad-49e65934bd5c@intel.com>
 <xhsmhh64qhssj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <eef09bdc-7546-462b-9ac0-661a44d2ceae@intel.com>
 <xhsmhfrk84k5k.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <408ebd8b-4bfb-4c4f-b118-7fe853c6e897@intel.com>
Date: Tue, 25 Mar 2025 18:52:34 +0100
Message-ID: <xhsmhy0wtngkd.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kIaTHDcHBQJaLRxg0XB1H4-N_NadsXHTCqfS6tr9yz0_1742925159
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_105243_933138_C488ED5B 
X-CRM114-Status: GOOD (  13.68  )
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

On 20/02/25 09:38, Dave Hansen wrote:
> But, honestly, I'm still not sure this is worth all the trouble. If
> folks want to avoid IPIs for TLB flushes, there are hardware features
> that *DO* that. Just get new hardware instead of adding this complicated
> pile of software that we have to maintain forever. In 10 years, we'll
> still have this software *and* 95% of our hardware has the hardware
> feature too.

Sorry, you're going to have to deal with my ignorance a little bit longer...

Were you thinking x86 hardware specifically, or something else?
AIUI things like arm64's TLBIVMALLE1IS can do what is required without any
IPI:

C5.5.78
"""
The invalidation applies to all PEs in the same Inner Shareable shareability domain as the PE that
executes this System instruction.
"""

But for (at least) these architectures:

  alpha
  x86
  loongarch
  mips
  (non-freescale 8xx) powerpc
  riscv
  xtensa

flush_tlb_kernel_range() has a path with a hardcoded use of on_each_cpu(),
so AFAICT for these the IPIs will be sent no matter the hardware.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
