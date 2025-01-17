Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBD7C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+btLDWYQxDa/QsrBjk9E41EpEZEhdEDzt4r13EY0eM=; b=rFpaxjnpPVt2oy
	xz8ceVJVdzd1Ofj/PC2v4pLAlxVO1S68Wv724NVsbt2JD5VJ7peoJrgDVPEpYE86dYccTlS/Tvp3u
	OW+D4esUuYL1YRlw2n15sh6Zqx5VWUMGxTF2i14WxOiJKSurk5WrBfT45DxpVbhoJ8pe8cGGKJNfM
	9WXEt2fpVWk0IxXS7idgOyGR/kDuBlbRx6Wa/RW7vA4t3ePslJJ1wvvVGUUw/L9PDHF4ox/2rk82R
	mSJxQQS5SR1/lN8EU9FuzyimK6nf2OUk73UxSa6tHBJGPDPTGMH87h7bQCXfkMY4RZ3tJDu3slFwn
	Mu/cI6SlczlXZ42yT8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYixO-0000000HTtV-0jKa;
	Fri, 17 Jan 2025 09:48:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYixL-0000000HTqJ-02Rv
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 09:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737107276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VvR9KfuLK5jT/0k1YGBwcApH+9cF5PsvBxGMV+DYi4c=;
	b=A6tK/8KhRQ9XMbSHXn7b5FCof71m9Nz66+F3lTZOpjmBhLvLfDkuafP9csPHxi6ibgXlmA
	odXr377rBr7gxIYAXJCILlv4Qo6Fgqt8l31LZtzZy5NQMwudsySR0rPzqoyDucmtwib/t3
	QSY23AtGRzyG9yN5iLngePVHHe8gxJY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-MAg2cc2qNVKW1aIoZAfI0Q-1; Fri, 17 Jan 2025 04:47:55 -0500
X-MC-Unique: MAg2cc2qNVKW1aIoZAfI0Q-1
X-Mimecast-MFC-AGG-ID: MAg2cc2qNVKW1aIoZAfI0Q
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361eb83f46so13350045e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 01:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737107274; x=1737712074;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvR9KfuLK5jT/0k1YGBwcApH+9cF5PsvBxGMV+DYi4c=;
        b=hYPv+NIbD6UkN3FvEGM15ze22tNLMKwEmb08a/ffkRoqjkik8DUsCXsmASJ6eL+PUp
         vNbVuv/kbYFBPLyjQBEHhb5Ik0vAUE8v90hJIHCiQQIkT38p/yqVNFSKzOmqg6pzPGyp
         S5BkH9a8uLblp+qvrpfGyMgbLZL4PEhagIHBQZH8J/il/Fw17Ll4ffJf68LhA5pGvofe
         SHyPN4LCszoLAGRFPQ0Xrdgn8bcEAlS324RVvjvzq4anUsRtRQePjgWAa35Lsz9bNq5J
         B/bEzfQUVjL81NZUgmi7Aj/lTeEubVhSxLfuO7Mf//cY3lC4zbMVqwYxIY7X9vhcFLfm
         x87w==
X-Forwarded-Encrypted: i=1; AJvYcCV9lXTPu76TJr8//cLQeEHmg9hzIpqW8whZvo8gu9+odMDtmIPFQmVAaNyh10nICcVYbp7siCxrJ23maw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpGoC3wFUmg2vrA4k3Xqhm/1wn2VaSW7u5pcDq8r/pVcCJi/dL
	0Krc9rLAiNsTlLhxddygdIUn7E6ODddYX6vfz0QyqyJfca1yiaYbFxl9jxhvO6pFbEZKfx8p57N
	JGwad4otFkdk79beiGul1lhWDoJxWgmKUVxZwOt6xfLnFTlq1gub1kfHABprVWsEFew==
X-Gm-Gg: ASbGncvM3vhLhiRm9O4BP4cmLoG7XwlWEq+PHAm803YhEcdShH1Y2OhLe7uBExyd0Xk
	vavl8p8tzWkSgS30Co2Y+NNQF4F+QoFMEfP0VYv4CIW4quFiLdIxviOBddhjPVs2nl6KcQ/VUSj
	9Ru8KqccNx0r0Ii/xFpSza/keoLkx2opvK6FJ6OHLKuSP/jPuxLdrsAsE0sBQL4hWiknyCG3QSU
	17sgH7IS1kLPVrXEsQyTbJEyG6LKqicenlywUGottY8bdiD9yas7/+nV+84ROoZJUvgR6un+QOD
	TY8HK6H97xNIjCCt9m+UJJJCobGh+O9BoWDsZmtYiw==
X-Received: by 2002:a05:600c:9a3:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-4389191b819mr16314235e9.13.1737107273780;
        Fri, 17 Jan 2025 01:47:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHToHDxXT5KMOIEW1byUZUSn/LchRidR5pJg2ZFHbUxu07B2Q/njknWrWkjTXhDYHkp8NfwWQ==
X-Received: by 2002:a05:600c:9a3:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-4389191b819mr16313255e9.13.1737107273291;
        Fri, 17 Jan 2025 01:47:53 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904131f5sm27135155e9.11.2025.01.17.01.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 01:47:52 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra
 <peterz@infradead.org>, Nicolas Saenz Julienne <nsaenzju@redhat.com>,
 Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.amakhalov@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Tomas Glozar <tglozar@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Kees Cook <kees@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, Shuah
 Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Miguel
 Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Mike
 Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 25/30] context_tracking,x86: Defer kernel text
 patching IPIs
In-Reply-To: <Z4bTlZkqihaAyGb4@google.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-26-vschneid@redhat.com>
 <Z4bTlZkqihaAyGb4@google.com>
Date: Fri, 17 Jan 2025 10:47:49 +0100
Message-ID: <xhsmhed11hiuy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZbK0Q4mw8zfJYOxrrJDkaQBy36LFKiOzIBgrTwT1kvg_1737107274
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_014759_123085_A58B1675 
X-CRM114-Status: GOOD (  32.31  )
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

On 14/01/25 13:13, Sean Christopherson wrote:
> On Tue, Jan 14, 2025, Valentin Schneider wrote:
>> text_poke_bp_batch() sends IPIs to all online CPUs to synchronize
>> them vs the newly patched instruction. CPUs that are executing in userspace
>> do not need this synchronization to happen immediately, and this is
>> actually harmful interference for NOHZ_FULL CPUs.
>
> ...
>
>> This leaves us with static keys and static calls.
>
> ...
>
>> @@ -2317,11 +2334,20 @@ static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries
>>       * First step: add a int3 trap to the address that will be patched.
>>       */
>>      for (i = 0; i < nr_entries; i++) {
>> -		tp[i].old = *(u8 *)text_poke_addr(&tp[i]);
>> -		text_poke(text_poke_addr(&tp[i]), &int3, INT3_INSN_SIZE);
>> +		void *addr = text_poke_addr(&tp[i]);
>> +
>> +		/*
>> +		 * There's no safe way to defer IPIs for patching text in
>> +		 * .noinstr, record whether there is at least one such poke.
>> +		 */
>> +		if (is_kernel_noinstr_text((unsigned long)addr))
>> +			cond = NULL;
>
> Maybe pre-check "cond", especially if multiple ranges need to be checked?  I.e.
>
>               if (cond && is_kernel_noinstr_text(...))
>> +
>> +		tp[i].old = *((u8 *)addr);
>> +		text_poke(addr, &int3, INT3_INSN_SIZE);
>>      }
>>
>> -	text_poke_sync();
>> +	__text_poke_sync(cond);
>>
>>      /*
>>       * Second step: update all but the first byte of the patched range.
>
> ...
>
>> +/**
>> + * is_kernel_noinstr_text - checks if the pointer address is located in the
>> + *                    .noinstr section
>> + *
>> + * @addr: address to check
>> + *
>> + * Returns: true if the address is located in .noinstr, false otherwise.
>> + */
>> +static inline bool is_kernel_noinstr_text(unsigned long addr)
>> +{
>> +	return addr >= (unsigned long)__noinstr_text_start &&
>> +	       addr < (unsigned long)__noinstr_text_end;
>> +}
>
> This doesn't do the right thing for modules, which matters because KVM can be
> built as a module on x86, and because context tracking understands transitions
> to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
> being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
> or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
> patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
> use the wrong static path.
>

AFAICT guest_state_{enter,exit}_irqoff() are only used in noinstr functions
and thus such a static key usage should at the very least be caught and
warned about by objtool - when this isn't built as a module.

I never really thought about noinstr sections for modules; I can get
objtool to warn about a non-noinstr allowed key being used in
e.g. vmx_vcpu_enter_exit() just by feeding it the vmx.o:

arch/x86/kvm/vmx/vmx.o: warning: objtool: vmx_vcpu_enter_exit.isra.0+0x0: dummykey: non-RO static key usage in noinstr

...but that requires removing a lot of code first because objtool stops
earlier in its noinstr checks as it hits functions it doesn't have full
information on, e.g.

arch/x86/kvm/vmx/vmx.o: warning: objtool: vmx_vcpu_enter_exit+0x21c: call to __ct_user_enter() leaves .noinstr.text section

__ct_user_enter() *is* noinstr, but you don't get that from just the header prototype.

> I don't expect this to ever cause problems in practice, because patching code in
> KVM's VM-Enter/VM-Exit path that has *functional* implications, while CPUs are
> actively running guest code, would be all kinds of crazy.  But I do think we
> should plug the hole.
>
> If this issue is unique to KVM, i.e. is not a generic problem for all modules (I
> assume module code generally isn't allowed in the entry path, even via NMI?), one
> idea would be to let KVM register its noinstr section for text poking.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
