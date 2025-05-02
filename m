Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEA8C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Wti5/WUuvkFUw8E4prKTaxRkgexHv7tVCURVWlzEyo=; b=2kFOcCPqwGFKwP
	FzY6g5ltn7AsO9IyUtAaQgyQkFvlbYvbjxAQo/5nOEg+V9Nid5HqZm54OQMzq7NdFJflTQ5Ur1V2x
	BSpbXy6FQZRRTaCGGZdZAJLJNeZOYuV1SunJmIAxEvEFlog5uEL9q3gOs8quC00MHz5FRnPKH4pEu
	3Hp9b2z018upUuJxZF/PiTAEm+Nm90ZmGLo9PvevdpZjfULFdD5RjjizVuftK9Lvj6umctRtdeWeY
	GOjmsivUeAdz7HtiVMGT29SRghskl/TIuTHT3A0XHpt89NGxnufUsDacU9B+rgw8hyZuemub5tf6k
	R3OKj9fZxDwXTwxmAxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6L-00000002dr1-1UuO;
	Fri, 02 May 2025 17:23:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtP3-00000002XQp-319q
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 16:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746203900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=14Itu0wJcqKS8hAd7pT4xJxMeQ8wSKPFd/cQcnRkK64=;
	b=cw8uykW0L/SBrt55QU4jKDvHttf2fYgdn+awiObf/sl7Sob5SGzUL74bgrBMoEOaTAHwmN
	X0+4qFX3cSPer92WjgahnutlktFZ5bqrZo7nc2+egfiRt/N5nW3cDq1RHNoqlLEOg7FVX7
	pXyajsgNTnu+MG6x6V23P05c+YvDG/o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-xyG4l7s9OjaLYG4S6V2gsA-1; Fri, 02 May 2025 12:38:17 -0400
X-MC-Unique: xyG4l7s9OjaLYG4S6V2gsA-1
X-Mimecast-MFC-AGG-ID: xyG4l7s9OjaLYG4S6V2gsA_1746203897
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so9537165e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 09:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203897; x=1746808697;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=14Itu0wJcqKS8hAd7pT4xJxMeQ8wSKPFd/cQcnRkK64=;
        b=rdI8Ezt+tOA99qWdLIJs/OLazz3bPGnTm5hr0cmO6uPazyzo5UFAUPSR+wujQktgT+
         RtDwXdeE3k4YhpYpjf1sBjUMOnB4E1R+kWmMmmzqpnk/FuUmPXCulsBXymG6gv13tmSV
         Q//Oi3qc7gAnfhbrh/1rXEUM1OO95I1HWT4kclXWXKE7LCYfDedph4LPtmD3hQocAZBJ
         oP2Nq0wMm2gLzYYWaf5Lz6mcVdoEnqN/CMHzoni45Lqqt8qP7Mv+Fx6RJGp54W5n88K6
         2Am3gMs7FxAIa35YmBI5JE+XjumD/Oz+InM5Y95+yIJPjqiwL2vcJH/Kxv0OTn2oF1qz
         HNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0qJv2cuHDP40qH65cspwqKYHVIHLU1ofc97qvm3jxbRzrze+l553hYFcYTcwnlsCwAKyfH3yd1g05nQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEcOgVc+YpLMp/nQwRClCkF/vI7qmhrzVvJJhC2PnTv9/Zy96K
	bUBxm+QgKhelWZxdg7emvRs2GwpyV20/QNydKlF2F146kxuzsooCspLmHZN0XhB6CRNnSX8T/Y3
	KD4sY9h3DEIQe+zWsdNblPkHdAxKN4l/N12JssoEBx8jcDkwsAS1p0/42t1VIvPxNUQ==
X-Gm-Gg: ASbGncvT8IcbK5eV7SsZM64+bNMGLpjGqo7Rlgolhdu+7UxKjQH7hp4kjIkgctQpgy0
	lpDnKivgxbMXDo3EyIKBP4lA3wm46anazZm9ftGpfeDjaxQgX9CVIXlXJ8Xd3VbTlQUXLmBL+gA
	r1A9zEkbRAMDyRgUw+GDIobzaIjhoh9ECFpsrxkygFGMdce7CIOFjjKMxAVnEOiiaHzjDo7ZNMr
	hp11JCECvT1IRVPmzqXXR4S6H7jyhGe2wM7Oei6DP8d7hv+xjnH5es2HqU2EgHol/VWRPgUQxxZ
	jaNKkxFiYQsZYamSAJqmYz8MZA638WWJPNHwdv6KWe8Z6yp/
X-Received: by 2002:a05:600c:528f:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-441bb852744mr33829385e9.5.1746203896749;
        Fri, 02 May 2025 09:38:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMHXR/p+bYllCeFUiu3mvj1rpI7ZOiyLrHoitDd00Nmz4qAV27N+1EVZD+X61FQi8x3pEBZA==
X-Received: by 2002:a05:600c:528f:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-441bb852744mr33828185e9.5.1746203896267;
        Fri, 02 May 2025 09:38:16 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb ([2001:861:43c1:5950:3e51:b684:9982:d4a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28732sm94362125e9.37.2025.05.02.09.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:38:15 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 rcu@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, Juri Lelli
 <juri.lelli@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>, Nicolas
 Saenz Julienne <nsaenz@amazon.com>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, Sean Christopherson
 <seanjc@google.com>, Juergen Gross <jgross@suse.com>, Ajay Kaher
 <ajay.kaher@broadcom.com>, Alexey Makhalov
 <alexey.amakhalov@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H.
 Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
 <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, Pawan
 Gupta <pawan.kumar.gupta@linux.intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Jason Baron
 <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, Naveen N
 Rao <naveen@kernel.org>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, "David S. Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook
 <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda
 <ojeda@kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Rong Xu
 <xur@google.com>, Rafael Aquini <aquini@redhat.com>, Song Liu
 <song@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Brian Gerst <brgerst@gmail.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, Benjamin Berg
 <benjamin.berg@intel.com>, Vishal Annapurve <vannapurve@google.com>, Randy
 Dunlap <rdunlap@infradead.org>, John Stultz <jstultz@google.com>, Tiezhu
 Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v5 00/25] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <34535b8c-35c8-4a7f-8363-f5a9c5a69023@intel.com>
References: <20250429113242.998312-1-vschneid@redhat.com>
 <fefcd1a6-f146-4f3c-b28b-f907e7346ddd@intel.com>
 <20250430132047.01d48647@gandalf.local.home>
 <019f6713-cfbd-466b-8fb5-dcd982cf8644@intel.com>
 <20250430154228.1d6306b4@gandalf.local.home>
 <a6b3a331-1ff3-4490-b300-a62b3c21578d@intel.com>
 <xhsmhr0179w1i.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <34535b8c-35c8-4a7f-8363-f5a9c5a69023@intel.com>
Date: Fri, 02 May 2025 18:38:12 +0200
Message-ID: <xhsmho6wb9de3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ag-my_bL59D1rq9ZxLUkzJGr6h1LmnLRDaLF0fmKAFU_1746203897
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_093821_848308_5AD4B183 
X-CRM114-Status: GOOD (  18.56  )
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

On 02/05/25 06:53, Dave Hansen wrote:
> On 5/2/25 02:55, Valentin Schneider wrote:
>> My gripe with that was having two separate mechanisms
>> - super early entry around SWITCH_TO_KERNEL_CR3)
>> - later entry at context tracking
>
> What do you mean by "later entry"?
>

I meant the point at which the deferred operation is run in the current
patches, i.e. ct_kernel_enter() - kernel entry from the PoV of context
tracking.

> All of the paths to enter the kernel from userspace have some
> SWITCH_TO_KERNEL_CR3 variant. If they didn't, the userspace that they
> entered from could have attacked the kernel with Meltdown.
>
> I'm theorizing that if this is _just_ about avoiding TLB flush IPIs that
> you can get away with a single mechanism.

So right now there would indeed be the TLB flush IPIs, but also the
text_poke() ones (sync_core() after patching text).

These are the two NOHZ-breaking IPIs that show up on my HP box, and that I
also got reports for from folks using NOHZ_FULL + CPU isolation in
production, mostly on SPR "edge enhanced" type of systems.

There's been some other sources of IPIs that have been fixed with an ad-hoc
solution - disable the mechanism for NOHZ_FULL CPUs or do it differently
such that an IPI isn't required, e.g.

  https://lore.kernel.org/lkml/ZJtBrybavtb1x45V@tpad/

While I don't expect the list to grow much, it's unfortunately not just the
TLB flush IPIs.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
