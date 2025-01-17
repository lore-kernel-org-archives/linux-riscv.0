Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027E4C02185
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 13:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STAofUpIPYAFC0npfMLcl13/4/YreZOErvshL2UQQMU=; b=itji82rDvGXLeV
	hgKk3lYdkXk0YL6rmGzKNxfADTkosSnKtqFdXpMxpsL1Vp6SrfsUw4D4wSqjTfffXrYuuSDv1XVK0
	4AL5RRYB8AaPR/Tx2mW0bdNm9eiJkDlZegp9DfUz4G7ZZoxwOhq8VQwozMg2TQBppNSq9Q6PyKyjU
	SrfnAL8hm5ADSxrn7VrhPzUYUVbvA1FsHsc1A4H1gOTs/3aYCKiDdvTuYMNxoG4k/mqdHb8JdIHyi
	GSBoXRh4MUo3OSdyeYeIDhj/Wg6Mq36mWs+wVVHybe0i3diL4JdLqitNUiXxtwfh2DmyQgPDze9iq
	X1NebPfkG7y5lnR5XgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYmek-00000000Nid-3GB5;
	Fri, 17 Jan 2025 13:45:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYmeh-00000000Nge-3nw2
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 13:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737121499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HEKKhsO2kOL/qF9SHnIE9a8dcD47/tUh4wLid3vzvOo=;
	b=dHjdNyLax0qZVxM9TIJC6GF6oJJeIcbVv3BEyemoowgxe3PJIrBsA7l8Ktyvd5P5emCgVd
	PEHTgRd538zCRI+sHUdDKDRqRcoBmxgg9z/A3YMmE2j0ehxAnOuOGW6bEz99LM1Akwt8ut
	zuGD+qxG2M8Y9BO54zSvwAuyaSxxx+Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-pxfg4s89P2ujcoavvD6Q_Q-1; Fri, 17 Jan 2025 08:44:58 -0500
X-MC-Unique: pxfg4s89P2ujcoavvD6Q_Q-1
X-Mimecast-MFC-AGG-ID: pxfg4s89P2ujcoavvD6Q_Q
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467b19b5641so42993641cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 05:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737121497; x=1737726297;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEKKhsO2kOL/qF9SHnIE9a8dcD47/tUh4wLid3vzvOo=;
        b=uQI+k86BU0fYGrj+NDvlaokKauqaDHpUd0oxTSXtIxtdfoPOZxvGg24WrGYZ7J6MNu
         dZcNHMAgjeOEN15TLQMFWypokw3wEdRPNU70wzMOgcqNYykSu5VA0Z77yj/Eq4hy7YAC
         vKIn+aQ5JRWfft+95L1ZA0SVDRa55aEb7Z9OvcvyroNkUwy6B2KWLMYFOhfWu2qIrT15
         YqVgDKV0JkoLnZ11R2UvNlaeE0kJjQoB00UllgnTXTe1/OaOgXgr1oFaahaS97xkrgaZ
         Z1J3bVe7SRBKSU+zb3Qr7uiVS+PYmG5sUhjqbmpFQGfHhrfIhW7FwrSY7GSt1rwdoSlN
         khQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVESMoK8glLF4RirQsSxkToE0Qd4Y9gbj94qt2Fi/zmL9qyiKXTx/5xv4CWOKTqEavagYOZHrEhx4DmSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2fUgAA6hAU1Fn61cESG4eqtZVER8aNPSBD5sQ6I0ryVFPaXzF
	opBL7qvTmexELCr9lg1TWfXyfe4vwPztcNoVLS0o3jr2lghkgaEnawhVi6X1LnQfT5NfQQADKSU
	ETV+XEGG0V4/6q3S+3B9EAG/U2llND4kJ+c73DkWyB9uBqEov1ZQ/J/jIHYJU7v26Qw==
X-Gm-Gg: ASbGncvn7PsMwOpXneYg2ywdWPzit0dxKScnLjZ1Rl2YqZczKtUduiu6ZUf0furvpPY
	FgMAnG+zdQU/wJ28wCp9MBbuA4c7HFJaS1bkmtzQrQj4pgTi+lepD1sUt9CdCNxr46bZ3gP2vds
	cnrYrheSz2H1K5FCLxkBp6NYOLVkkheChd9YBBTOa2vKf3Ezen33NSnz0vl/ygKzKXtS2C1aPt8
	yUswg+jfpqFqH/y+6PWs25jTe/iLIBQoglGBp/tJXBa76JdiYSAnaDpi+R+nZwsziuIsBO0F4/G
	rZs2O52mc+wGqXrssHb38nrPQAjRJdCXef2tDH2YDw==
X-Received: by 2002:a05:622a:1387:b0:467:674d:237f with SMTP id d75a77b69052e-46e12ad5f7bmr40519531cf.11.1737121496660;
        Fri, 17 Jan 2025 05:44:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmIl4MCDkHkFsxi8fUyXS99BtrKRZsY+6w06Ii3eQgKuqou3xcsKirOxy10aWGIFujuL9O5w==
X-Received: by 2002:a05:622a:1387:b0:467:674d:237f with SMTP id d75a77b69052e-46e12ad5f7bmr40518371cf.11.1737121496270;
        Fri, 17 Jan 2025 05:44:56 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e1042ef63sm11228641cf.71.2025.01.17.05.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:44:55 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Cc: Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
 <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
 <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
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
 <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, Nicolas Saenz
 Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Yosry Ahmed <yosryahmed@google.com>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 26/30] x86,tlb: Make __flush_tlb_global()
 noinstr-compliant
In-Reply-To: <52311c3d-83cf-4dc4-bbcb-5fbca8eb249c@intel.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-27-vschneid@redhat.com>
 <52311c3d-83cf-4dc4-bbcb-5fbca8eb249c@intel.com>
Date: Fri, 17 Jan 2025 14:44:42 +0100
Message-ID: <xhsmh5xmdh7w5.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EGgRmHiMDvQWJzuv8bvxA9AYet_kwxxqeI4QAlNkSG8_1737121497
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_054500_019001_C335B88A 
X-CRM114-Status: GOOD (  17.77  )
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

On 14/01/25 13:45, Dave Hansen wrote:
> On 1/14/25 09:51, Valentin Schneider wrote:
>> +	cr4 = this_cpu_read(cpu_tlbstate.cr4);
>> +	asm volatile("mov %0,%%cr4": : "r" (cr4 ^ X86_CR4_PGE) : "memory");
>> +	asm volatile("mov %0,%%cr4": : "r" (cr4) : "memory");
>> +	/*
>> +	 * In lieu of not having the pinning crap, hard fail if CR4 doesn't
>> +	 * match the expected value. This ensures that anybody doing dodgy gets
>> +	 * the fallthrough check.
>> +	 */
>> +	BUG_ON(cr4 != this_cpu_read(cpu_tlbstate.cr4));
>
> Let's say someone managed to write to cpu_tlbstate.cr4 where they
> cleared one of the pinned bits.
>
> Before this patch, CR4 pinning would WARN_ONCE() about it pretty quickly
> and also reset the cleared bits.
>
> After this patch, the first native_flush_tlb_global() can clear pinned
> bits, at least until native_write_cr4() gets called the next time. That
> seems like it'll undermine CR4 pinning at least somewhat.
>

The BUG_ON() should still catch any pinned bit mishandling, however...

> What keeps native_write_cr4() from being noinstr-compliant now? Is it
> just the WARN_ONCE()?
>

I don't think that's even an issue since __WARN_printf() wraps the print in
instrumentation_{begin,end}(). In v3 I made native_write_cr4() noinstr and
added a non-noinstr wrapper to be used in existing callsites.

AFAICT if acceptable we could make the whole thing noinstr and stick with
that; Peter, is there something I missed that made you write the handmade
noinstr CR4 RMW?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
