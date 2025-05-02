Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39DCC3ABA3
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNwu6pfoN5DZN4lHnl0DtsW1+riSJKyZw/7slHaNQ9w=; b=csh02RcLh7GdRd
	9TJnvYJZNXfonHVwvFJX20NDk0hyRGzfoL+oPUTe4NlXcuaRZQV2eHAjrnYKguIRf7IbH2GMtdA8f
	1I9UAB630ftZ76lWctc15HO5So8Npn1DZEe1xKWmtthAp0ILgn5ejR2AT2CKYFsA7IqlCaYX+4tLK
	I2TqOJLo5Y1nWjhw30sOgUfB5EYMacZ9+NktfwtO+iN8yZ1fx3hnZyee4qERoXNmKohmyvyYUGlP3
	AmQSq96/EUHUvJHUVoxCWanbpKjwmNScgeMKbDaLcH1/+hG6nEpKVRiUi7dM+5zqUJLi5gYK4QDLa
	rELcR6RK7rDmVrKjnSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAn82-00000001RaK-3HEg;
	Fri, 02 May 2025 09:56:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAn7R-00000001RP0-3gc5
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 May 2025 09:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Lg/z+bj6Vp6Uwot26MZjMyBdidDV8u4Eq/gx3z2pwHw=; b=WKYXllAUem7RH/diGe2LMm28Z6
	vNbbEdgLf8p45rel/Jsd6dRuO7wb/YsnUm70qK1liG9/ifxY6t7Kpi5luUnsngBz4o81WaXGNslaM
	+vC4NG24mq+a7dYZSpMjGXOW7q8fGWng8VMKEa7IpA4ASLGXQmfdGsqLt2qW9qys/OkLGW0mpDUrh
	d0Q82J+PEmLS1zm30FC2K9oqU9jUSDYWdnRwPXgox41k5prz7nudlLK09LbDnGkrpSga4YCrD/31G
	riL72cuKmmpJBCZs+wtOhjzb7SO40EbH+g1AHcrofXqYhbYeQzKLZ0J6WN6Q6rlUFd9xx0nl/J9Ov
	FYe8m5ug==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAn7O-0000000EhPN-099S
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 09:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746179728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg/z+bj6Vp6Uwot26MZjMyBdidDV8u4Eq/gx3z2pwHw=;
	b=c/2SNfyPnj7Q9740GNXSjSEGfyVQvNzu1kfdfMKK8wnyBIbvhRbHp3RRvGxNKhur9XdPjf
	NDwyDWSpxQFULU3QRWu9NWeR+N9O9AzjSw5ovLXlF7ih/C0yxFkdnAFJo+C44m7WQjSUzY
	0rKen5oRNhg+LimqnoXiLxENKrWjTpg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746179738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg/z+bj6Vp6Uwot26MZjMyBdidDV8u4Eq/gx3z2pwHw=;
	b=GFVK4OxK5hY3uuDKxrbK/dNtJOCjctkqXOJyGDYaHhhJVALuo+e0BAG0tK5dvAiaSGx8lR
	ifPs7+7zN/tWwsu6ILXjJbQRr5u+qzcHjCsb2flTvxaiZOP/TMh2jxIMciZ1vYYJodt9qm
	nKtqrfLs7P+gFRmZsF+kYWruEaonV3U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-kVB0qPT8M-eHtfxAa4LySA-1; Fri, 02 May 2025 05:55:27 -0400
X-MC-Unique: kVB0qPT8M-eHtfxAa4LySA-1
X-Mimecast-MFC-AGG-ID: kVB0qPT8M-eHtfxAa4LySA_1746179726
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39130f02631so496913f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 02:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179726; x=1746784526;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg/z+bj6Vp6Uwot26MZjMyBdidDV8u4Eq/gx3z2pwHw=;
        b=E5be8NfYWe5o3g3+KWIj0yksiDQzpyNUz6odCxx9irvEtWU/ggH96pCBvvRzcZn8nN
         yhrwo16I65h9uclMjdw+7S0TZSS6UfuEBk2gaOQ7hR11PhaN84f7opuFQevVnyfQeFe7
         Y6vCGnTjfrxlKxz8a1b3q59t+oq1jxY6ndlk08igXKjApu6VHSvnerfT3EJaTFGYJ6t3
         4kcPwAp5/9U6QtRHhwZRPIj8t2tVmNg2tjUUHkset1/4KktQQHnhmRT2N9Lm0NygdI6D
         d7e9VKNDXp8PyUK1xgLuZIxjk7yT6oLywnJBHRG3Mf/NxMQSjbJgmAipW4B8E3ug5lq4
         M/rg==
X-Forwarded-Encrypted: i=1; AJvYcCUSQTiziGR6lQAyT9qPjc29VAOO3z332y+Irumba0fdiZ/4iFGFksZNidb1NjakCASoxH82YlOe+ftZpA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrzwk74mKMug9ZtBxN8kyynlibj4pXQtctQYMhaZjA25w/rZDz
	lyo6AIC8uGRia9kYSO4tZurnQQG07DRNQknjU7c2kVYER5bFtB3oSFQ5rSdaxeYykopjKqolgQE
	GVOZpv7Znj3xaHmAd/hngHH6WGva/wSHpYrcKwrG0vimGx2eHbkuXNct8gR/aB8nzbQ==
X-Gm-Gg: ASbGncuiKBkzXZ0gmLRPMkndKAnEMdwv52sIZXmzN0nYkdJgr783DdVdvw3mDnC3YVq
	QT8gkYSroSSNzEGgsibjxJq2XtT7I991yyTj6f1qtGL1JhhGYSCwhaIAgjqMDy+KsBbyHilFCsh
	5dD/BJmB6Mi6sRALptBDF+iW8TGnRrIcdkypX5eXSp1Lz2ZFu2uZKA0TO+PlabFI/SeQ2fsXdy1
	TlFUGDWXCy6eGMBWg5iEoANaHZ/+DJBf8m1SI4JHPcvIZbFHuL7q9KeQ79rUklA4chNKDXRlM2w
	t/MzgCOMNUsqkdTmr0AcP/P6gGeKGk/8vgM90Kb3nZUS+vlP
X-Received: by 2002:a05:6000:40cd:b0:391:4873:7940 with SMTP id ffacd0b85a97d-3a099aef847mr1613272f8f.54.1746179725792;
        Fri, 02 May 2025 02:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpWssSttWyCeyGY3CsU2VpUSZWAU4rNhFXcV+QIILeKOWgOhhc72G0KBYplClE77XLY5f7yg==
X-Received: by 2002:a05:6000:40cd:b0:391:4873:7940 with SMTP id ffacd0b85a97d-3a099aef847mr1613170f8f.54.1746179725069;
        Fri, 02 May 2025 02:55:25 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb ([2001:861:43c1:5950:3e51:b684:9982:d4a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3ccdsm1693329f8f.38.2025.05.02.02.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:55:24 -0700 (PDT)
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
In-Reply-To: <a6b3a331-1ff3-4490-b300-a62b3c21578d@intel.com>
References: <20250429113242.998312-1-vschneid@redhat.com>
 <fefcd1a6-f146-4f3c-b28b-f907e7346ddd@intel.com>
 <20250430132047.01d48647@gandalf.local.home>
 <019f6713-cfbd-466b-8fb5-dcd982cf8644@intel.com>
 <20250430154228.1d6306b4@gandalf.local.home>
 <a6b3a331-1ff3-4490-b300-a62b3c21578d@intel.com>
Date: Fri, 02 May 2025 11:55:21 +0200
Message-ID: <xhsmhr0179w1i.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q-OhwZ1jYesiQpyFE5Dgux-GBq58v8PIU5WJy6XsScY_1746179726
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_105542_413705_2E2310E9 
X-CRM114-Status: GOOD (  27.66  )
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

On 30/04/25 13:00, Dave Hansen wrote:
> On 4/30/25 12:42, Steven Rostedt wrote:
>>> Look at the syscall code for instance:
>>>
>>>> SYM_CODE_START(entry_SYSCALL_64)
>>>>         swapgs
>>>>         movq    %rsp, PER_CPU_VAR(cpu_tss_rw + TSS_sp2)
>>>>         SWITCH_TO_KERNEL_CR3 scratch_reg=%rsp
>>> You can _trivially_ audit this and know that swapgs doesn't touch memory
>>> and that as long as PER_CPU_VAR()s and the process stack don't have
>>> their mappings munged and flushes deferred that this would be correct.
>> Hmm, so there is still a path for this?
>>
>> At least if it added more ways to debug it, and some other changes to make
>> the locations where vmalloc is dangerous smaller?
>
> Being able to debug it would be a good start. But, more generally, what
> we need is for more people to be able to run the code in the first
> place. Would a _normal_ system (without setups that are trying to do
> NOHZ_FULL) ever be able to defer TLB flush IPIs?
>
> If the answer is no, then, yeah, I'll settle for some debugging options.
>
> But if you shrink the window as small as I'm talking about, it would
> look very different from this series.
>
> For instance, imagine when a CPU goes into the NOHZ mode. Could it just
> unconditionally flush the TLB on the way back into the kernel (in the
> same SWITCH_TO_KERNEL_CR3 spot)? Yeah, it'll make entry into the kernel
> expensive for NOHZ tasks, but it's not *THAT* bad. And if the entire
> point of a NOHZ_FULL task is to minimize the number of kernel entries
> then a little extra overhead there doesn't sound too bad.
>

Right, so my thought per your previous comments was to special case the
TLB flush, depend on kPTI and do it uncondtionally in SWITCH_TO_KERNEL_CR3
just like you've described - but keep the context tracking mechanism for
other deferrable operations.

My gripe with that was having two separate mechanisms
- super early entry around SWITCH_TO_KERNEL_CR3)
- later entry at context tracking

Shifting everything to SWITCH_TO_KERNEL_CR3 means we lose the
context_tracking infra to dynamically defer operations (atomically reading
and writing to context_tracking.state), which means we unconditionally run
all possible deferrable operations. This doesn't scream scalable, even
though as you say NOHZ_FULL kernel entry is already a "you lose" situation.

Yet another option is to duplicate the context tracking state specifically
for IPI deferral and have it driven in/by SWITCH_TO_KERNEL_CR3, which is
also not super savoury.

I suppose I can start poking around running deferred ops in that
SWITCH_TO_KERNEL_CR3 region, and add state/infra on top. Let's see where
this gets me :-)

Again, thanks for the insight and the suggestions Dave!

> Also, about the new hardware, I suspect there's some mystery customer
> lurking in the shadows asking folks for this functionality. Could you at
> least go _talk_ to the mystery customer(s) and see which hardware they
> care about? They might already even have the magic CPUs they need for
> this, or have them on the roadmap. If they've got Intel CPUs, I'd be
> happy to help figure it out.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
