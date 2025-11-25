Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CB1D0E6E5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMjCNkYgMJ4o/Y505Nz8UABBgvyYf32eHGc8lXpikjE=; b=DEhM7OXMbmSXb9
	XQFSpsOLI4qXnNmy2lptUODOX7rVohB0WMIhpmsjBDFNDdp51eWXrYV21q//TV4WoH/Sit9Fn+IZe
	K/IsY/9z5PGON7nqq3QG8lEj4eOEIq+TYt5PsEql/ZhKINnBT/ZKpQ5d8A0ThkwayQ/zuonyoqNXN
	t5OfODGSM3ophVZTZ9DWvnyjWhuU9ytqwtiQzJMlgZPr3wgDsoOrGkEOIumzOKjwUv59Z6iMcqa+E
	LTHMXlkxR945Nc0sE2LcOmMtN+syb9dtC/gXz+kDbegZ0f+JJNGmEAAs+iNTwNbnfV9oeYfgBknfG
	MVPK71PB92vZ05thDu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtns-0000000DPRP-3Rsr;
	Tue, 25 Nov 2025 14:14:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtno-0000000DPQR-2zsf
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 14:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764080034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wOE4pVZbQk3NRzTWk4bK9iK9S5Rl6Cg6Yr2VD/4CLLg=;
	b=T6F+SxOU9jXJyHqGqUaTS7RxEffwLSxS7ORIHjYPeEzjchlFyIZ8oQ1Qsg/Dwp5T7KLCcV
	586Kgzn9kg+gPk2pUOq3DMzdX7PVCQ95Pnrl6y4XfTeoAv6/FzTrFcBbeuQrFiHn895bUt
	4+7qSNVSgxJGD7xu1tewTO6oG7B/q4g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-ILh1EfzWMtO0sTywHi_EYQ-1; Tue, 25 Nov 2025 09:13:52 -0500
X-MC-Unique: ILh1EfzWMtO0sTywHi_EYQ-1
X-Mimecast-MFC-AGG-ID: ILh1EfzWMtO0sTywHi_EYQ_1764080031
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47777158a85so73346435e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Nov 2025 06:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080031; x=1764684831;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOE4pVZbQk3NRzTWk4bK9iK9S5Rl6Cg6Yr2VD/4CLLg=;
        b=CzGhe+N/28RGv2RpyEWqprNpflNapbDHtdExf/2JsA55YHFxnDYZ195Rk0aL7wUZjA
         rMmPKIwFVksVpIoqtzkbV3OgQ1VKL+bvPxXsS4H70DkJBxF7hnB+Z9BOBjrDRZ0dTXJM
         0kP57WYQTmds0ZaP4uskRuJqsPaUuv2s61hc7v8c5HWFsKe091yYrEviWjx3TIkmOiTM
         LqWSJ/orh0/OQu/j46KW6sIhxyGdiASdYLpU9xU9QF5IhD0acHHg/CUjjvNMc5ex8say
         lVyjJUpJ/sGnMwZV62ur8tJHg2IEP1+TGprgJiFqqDyfzxV9i20wUMFnrDiAC05kqSGP
         Y79Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsUJ/1m2hBPg3kSwPm8G9Jt5iKbwox86FTqatAKjpAoGtujrxfTdpw3vN4/fTQvpdX43YcYX8joRGOXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2snQHCmXL9rOVUbtR1m3KNgFUlLerxKephnMeNVBCdU4M3Kv4
	/MX80OU9LpU4XZ8Dxmkh0++UyzbM0DgWYzWctPpgXCUpT2kyx7cQ2S76JxFeNV0DEh9Xpzot+So
	ENpIsvjSGGBJqy8scC2pf2GIf/5dN6TPjPygMSt7qbaV0lBPCxaIkT2WeqyowPoWdTeTCMw==
X-Gm-Gg: ASbGnctfzTTREr18o/6UCWXyc6bMPavxHu4qwx4ALkCC8XGWJpJxMVSaCMfmpzGVcNZ
	ZHql8RjRza2T5djJ1/vs/00vjlw4zVigEvkKfoGpMEv21kIEfETmdAbNbjQPFE6aMi2O1ZCPa+3
	MS3QEEu85GNmH4uDpGCKG8WJPhsRGujn48AA+tw3CiG30YS1fBZeCHSJP/7UlkJCZckYuTMuf9k
	4svJeFJWZfZScAvCLvMoz1Y5JeVEGkxOxevcrCX+t+YNEL1HFINRGWxEGtlrp6F8OK6WVE4zV4E
	ZL45xwo5C5Mf1VjuyV90J6Ye/565PXSerKOHqfU0BovhM+dAgzR5aQX4gIoO1F837K9g5Rex6hw
	YijB1DrLwkz5hMFZM/dXwM28Xulm1L74rAE0LsCQcR1uj5taeEseGwIF1
X-Received: by 2002:a05:600c:3111:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-477c10deffamr169342185e9.12.1764080030968;
        Tue, 25 Nov 2025 06:13:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtA8JzDWqwpv+zLW5Ygo6VxUlFOBnDYO5W2Qk6szEUT54U+0BafPLKh5CrRqs4rY7IKqQsQw==
X-Received: by 2002:a05:600c:3111:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-477c10deffamr169341405e9.12.1764080030289;
        Tue, 25 Nov 2025 06:13:50 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1e86b3sm306305045e9.6.2025.11.25.06.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:13:49 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [RFC PATCH v7 30/31] x86/mm, mm/vmalloc: Defer kernel TLB flush
 IPIs under CONFIG_COALESCE_TLBI=y
In-Reply-To: <2837ea3e-c0b8-46b0-b8da-bf06906d124d@intel.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-10-vschneid@redhat.com>
 <bad9eaaa-561a-498a-90d1-fe3a3ab8ba37@intel.com>
 <xhsmh5xb3thh6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <2837ea3e-c0b8-46b0-b8da-bf06906d124d@intel.com>
Date: Tue, 25 Nov 2025 15:13:47 +0100
Message-ID: <xhsmh3462td2c.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DpO6h7LkZ1x_oO7NY0VCMSFS4ASYIgMgvcr5td_oauE_1764080031
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_061356_824990_23DF5BD2 
X-CRM114-Status: GOOD (  27.06  )
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

On 21/11/25 09:50, Dave Hansen wrote:
> On 11/21/25 09:37, Valentin Schneider wrote:
>> On 19/11/25 10:31, Dave Hansen wrote:
>>> On 11/14/25 07:14, Valentin Schneider wrote:
>>>> +static bool flush_tlb_kernel_cond(int cpu, void *info)
>>>> +{
>>>> +	return housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) ||
>>>> +	       per_cpu(kernel_cr3_loaded, cpu);
>>>> +}
>>>
>>> Is it OK that 'kernel_cr3_loaded' can be be stale? Since it's not part
>>> of the instruction that actually sets CR3, there's a window between when
>>> 'kernel_cr3_loaded' is set (or cleared) and CR3 is actually written.
>>>
>>> Is that OK?
>>>
>>> It seems like it could lead to both unnecessary IPIs being sent and for
>>> IPIs to be missed.
>>>
>>
>> So the pattern is
>>
>>   SWITCH_TO_KERNEL_CR3
>>   FLUSH
>>   KERNEL_CR3_LOADED := 1
>>
>>   KERNEL_CR3_LOADED := 0
>>   SWITCH_TO_USER_CR3
>>
>>
>> The 0 -> 1 transition has a window between the unconditional flush and the
>> write to 1 where a remote flush IPI may be omitted. Given that the write is
>> immediately following the unconditional flush, that would really be just
>> two flushes racing with each other,
>
> Let me fix that for you. When you wrote "a remote flush IPI may be
> omitted" you meant to write: "there's a bug." ;)
>

Something like that :-)

> In the end, KERNEL_CR3_LOADED==0 means, "you don't need to send this CPU
> flushing IPIs because it will flush the TLB itself before touching
> memory that needs a flush".
>
>    SWITCH_TO_KERNEL_CR3
>    FLUSH
>    // On kernel CR3, *AND* not getting IPIs
>    KERNEL_CR3_LOADED := 1
>
>> but I could punt the kernel_cr3_loaded
>> write above the unconditional flush.
>
> Yes, that would eliminate the window, as long as the memory ordering is
> right. You not only need to have the KERNEL_CR3_LOADED:=1 CPU set that
> variable, you need to ensure that it has seen the page table update.
>

I assumed the page table update would be a self-synchronizing operation,
but that betrays how little I know about x86; /me goes back to reading

>> The 1 -> 0 transition is less problematic, worst case a remote flush races
>> with the CPU returning to userspace and it'll get interrupted back to
>> kernelspace.
>
> It's also not just "returning to userspace". It could well be *in*
> userspace by the point the IPI shows up. It's not the end of the world,
> and the window isn't infinitely long. But there certainly is still a
> possibility of getting spurious interrupts for the precious NOHZ_FULL
> task while it's in userspace.

IME it's okay if the application is just starting as it needs to do some
initialization anyway (mlockall & friends), i.e. it's not executing actual
useful payload from the get go.

If it's resuming from an interference, well we'd be making things worse.

I'm thinking the worst case is if this becomes a repeating pattern, but
then that means even without those deferral hacks the isolated CPUs would
be bombarded by IPIs in the first place.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
