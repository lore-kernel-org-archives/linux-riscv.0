Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0C9C02181
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 13:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szELYuMP+j4j6O8pXJURVH7L+zSxx9I5+EfI0GnmW4Q=; b=LcL11nwJNKrzsu
	VH6SA0c9uLCi23XMOjUuiKPO++ZR02l/q6FFbPlI2uPy/p4EV65UL6MkR3wNEGluYEZj/BXPOobjE
	hMyO7FWP904hIPUZeUus55VMZSaRdEvrWslsdgHDqqt9CABFgrDwhtpH9nkVoSN9CCMN9NQEPuJ+y
	/nFu9WrZRBndYkwzzaR23+b7lwCe57U+ZIRvhCDyLRBwYYEWC5AdLacBw8OvlIhtbXZS2aiJEvbVa
	x/+//RgleA8+dBk5X3KKXtc+OEwyseR4B4hVCdsyRuzJusie+J+44bWuu/cONhnKkYZ68qGQC5Bbt
	VwQ0Qtq40bY2JsaE5sNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsDd-00000005iRZ-1Rgy;
	Mon, 20 Jan 2025 13:53:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZsDb-00000005iPv-0N1T
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 13:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737381209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6OUKdt6VXAQzpOTUFB26LmXUDO8O/oST+Zn2uKcAtKs=;
	b=HbMtC92IGEx8a976wcxW0kDoKugHnljw5CJ/V3bldO3EleSl4f8dkr/UxaQd0pGkdw7Vvs
	FLaOvwZFsd3RnEuOP3KbFH5VZ/Mo3jfZrt9VEpg7hpZnAL1LxkF1kfKPvTMoqshvadb4YN
	4Ooo0u4GxuufcBnly1qGnkquaO6lzww=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-QvUHZsGhMOeDuITEXrQETQ-1; Mon, 20 Jan 2025 08:53:27 -0500
X-MC-Unique: QvUHZsGhMOeDuITEXrQETQ-1
X-Mimecast-MFC-AGG-ID: QvUHZsGhMOeDuITEXrQETQ
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4675749a982so79057151cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jan 2025 05:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737381207; x=1737986007;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OUKdt6VXAQzpOTUFB26LmXUDO8O/oST+Zn2uKcAtKs=;
        b=VKXwwANUWDEVKp/CiVGO0WuZnAxQExyZUet187WpH96s74fMVYBDvbmAwqtdQT+24n
         T4n99FJ/zINMMs55vk23X29pPuoAY/9pyDxafM4svkgyijtOY330BMpEp1bOUlzQ4bKE
         CzQbByDUAou377rW7QTyNYfXxQbGFp4OqMh5EkAQkXQ0X2SZi1aBE0zQkMmXFvEolEdF
         pn5JggFsnczzP005bkVWZ/yP+sCrb9hNOad4rNhHCkR4gB6CeNO1V2kGAGYTotiP9Gb7
         8TImsFeblyllx2KbyIYhNri3xcXlZazmLC8QN0ayxGwyjdZm6acE2WWc9yzUom8n/K5Z
         deFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTcJ5c6FPGpHRlSnsPIH2iUGbUZS3OjWTBd7aniHxYUsmwPz5m54NNTmIk4PC33CssnS6WJ2CpWp+KNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFykm/IJltIQbln/kLTzdUlgZQqBOdEJwZ2jeX7KRzFyNtSotU
	oOeC+x6qo3SAETmrtMPux93XP49SXPESr+87dw0gckFT2W5W2CZzV2XsP39TPBVt8PncWBfVVoG
	MLn6a4AD5LUHDKxkJtzGkspd4EFPq5VzNYzKSiUxCoKTghyuzQFzN2LHlT2GJ8G7luA==
X-Gm-Gg: ASbGnctjEtrfrMHeZRFBoEZ+1OY2T4MuQeuCbBzfDLBHmtEik5m4wEKCgkez6+lSp3p
	FMMk4govGJvLy5wqb2GlIgh16eb7Kg/fYB0G6fkaDUcHGQjk/hpkMN4vY+vq++5cLgNNQxcPVq0
	jmd9XuYpoWbknGBzKYaaFvSfLsSXDAQxyPWSaHYUltWE6Ur84sAawTjYZJjqTRKNMEeymDCV0QG
	rRhnCPatOaZSR/N8xvMq4NbPCTSKC01YLkHIAXAKYnQdtRUZ+ciaVSBz9LNuXRV8I/N6J0xJKVB
	2a2dw00GLTrwzu+kyOv1HQQPkqrGTUXfPFw8OI89qvoFxxjR+x2pJh0=
X-Received: by 2002:ac8:7d82:0:b0:467:5e61:c116 with SMTP id d75a77b69052e-46e12a1e36cmr160728731cf.7.1737381207203;
        Mon, 20 Jan 2025 05:53:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCbxGDy6CHUSfOLqTxGL3gA1S6wKRHlUvydXAdXodFBspL8+Pdog+OKdfN6k1jzDkgqmOx+A==
X-Received: by 2002:ac8:7d82:0:b0:467:5e61:c116 with SMTP id d75a77b69052e-46e12a1e36cmr160728291cf.7.1737381206799;
        Mon, 20 Jan 2025 05:53:26 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e1030da00sm42651971cf.33.2025.01.20.05.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 05:53:25 -0800 (PST)
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
In-Reply-To: <Z4qQL89GZ_gk0vpu@google.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-26-vschneid@redhat.com>
 <Z4bTlZkqihaAyGb4@google.com>
 <xhsmhed11hiuy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4qQL89GZ_gk0vpu@google.com>
Date: Mon, 20 Jan 2025 14:53:13 +0100
Message-ID: <xhsmhtt9tfv7a.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: It69GsNvPPKcz5uNyAzTVg8wLtAlkfDbH_2LJHn7y3I_1737381207
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_055331_193214_852C39EE 
X-CRM114-Status: GOOD (  21.96  )
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

On 17/01/25 09:15, Sean Christopherson wrote:
> On Fri, Jan 17, 2025, Valentin Schneider wrote:
>> On 14/01/25 13:13, Sean Christopherson wrote:
>> > On Tue, Jan 14, 2025, Valentin Schneider wrote:
>> >> +/**
>> >> + * is_kernel_noinstr_text - checks if the pointer address is located in the
>> >> + *                    .noinstr section
>> >> + *
>> >> + * @addr: address to check
>> >> + *
>> >> + * Returns: true if the address is located in .noinstr, false otherwise.
>> >> + */
>> >> +static inline bool is_kernel_noinstr_text(unsigned long addr)
>> >> +{
>> >> +	return addr >= (unsigned long)__noinstr_text_start &&
>> >> +	       addr < (unsigned long)__noinstr_text_end;
>> >> +}
>> >
>> > This doesn't do the right thing for modules, which matters because KVM can be
>> > built as a module on x86, and because context tracking understands transitions
>> > to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
>> > being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
>> > or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
>> > patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
>> > use the wrong static path.
>>>
>> AFAICT guest_state_{enter,exit}_irqoff() are only used in noinstr functions
>> and thus such a static key usage should at the very least be caught and
>> warned about by objtool - when this isn't built as a module.
>
> That doesn't magically do the right thing though.  If KVM is built as a module,
> is_kernel_noinstr_text() will get false negatives even for static keys/branches
> that are annotaed as NOINSTR.

Quite so.

I've been looking at mod_mem_type & friends, I'm thinking adding a
MOD_NOINSTR_TEXT type might be overkill considering modules really
shouldn't be involved with early entry, KVM being the one exception.

Your suggestion to have a KVM-module-specific noinstr section sounds good
to me, I'll have a look at that.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
