Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64AEC021A4
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6IeHMWXxBMFoBq/dV/w5vnpQj0gSR8PEqCiRGOSo4s=; b=NLxTJ+pB7xV+Fa
	UmFa2AE8CnOlrOKyUUSjOL1iIjJpnnfSGf0m8pr48wJi34yyEg//nGC17UYATy6mX2i91pdhtxrvA
	TVfWBDL9VbARmw0JDfCJFbTK9bju5mYaTSp4cP36LFHfH5c+ryD1lvO7nEmqSTHEmsod4t+9Ujg6a
	miD+YalccGEnkOo9Zk86eCuXrW8pldKSjLsgtmAzQbbVxWkyUnkbJtsF3OEsPP/QTqQN+FkQAPdFM
	WpI+RBOWN9R4H45/qiArWU/FPx7LGg9dlNEh1zwQNV6QA/+GHEJb8ihusqB0o4x9ftUnrVbty9mcx
	W34sSp9JfBf96yG1G7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tht4D-00000004Uad-2ApW;
	Tue, 11 Feb 2025 16:24:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsph-00000004QrF-2QcF
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 16:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739290196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlqDgCP2DAkslcpgDFYXdlhhng4EN6BqWt/KN1sHhDc=;
	b=NMHkjWmUgZquI7XNkmgx5ylybMsR4LnFUGx1BP6Dea78xg57/b0E6vBVoCuNtROJz9I3wd
	hiKAXbcj5qSHH+9f8dsKviKAt5vN70N54A74V3b5fbufmI4cit0LgrvUspyW0DVFQAN5Ej
	sVJSBotux5i8ftUv3bx0YqKdKWBfKuc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-Xhwopk9aPAeijtQ91Hjc2A-1; Tue, 11 Feb 2025 11:09:55 -0500
X-MC-Unique: Xhwopk9aPAeijtQ91Hjc2A-1
X-Mimecast-MFC-AGG-ID: Xhwopk9aPAeijtQ91Hjc2A
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38dd1bdf360so1525301f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 08:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290194; x=1739894994;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqBw0fvuK6HvmV212DNXANVYi4ije8UDstIz77BqBKI=;
        b=xM0P5fW+B+MqzhbnE6XOvdkgvD8p/bIOMG2BzdEJpUUYMptc84K+HfLHa0tqqYv4ER
         +5bBw9ddaEf3VrzZhHLI8T70+A6WY5GNB8p1V59kBkzP0fkiV/hbrSlECa291v6jKa/+
         lEuecnvLTCQkx/99h6aEfeiV16kQSFbvbE7hzsLp+q7TmrrRUIB3k6t3HtbEka+zSdoz
         VIKZkTWJ2t8Ihwuc1cAvchVlVS76JN3wChw9YFZSUKHzdafJxOKxqWBJ1lUg7h/MvK/K
         GCZF8yhMdqti1E+KIL75fWEOw6FwmtvVTaMV/e5Lbz1Focq/IdMHJC5zF2vGKUzL53LR
         v+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWcJW3pAubeMJA3scMICZ/+kSjjT1P/COSRicsHiEBtALWLlrowil4wBGXePl9wQiNKP/6iO/wWn9rtmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyttqTelDzSdzQ5o8+N6O9Ry03mNz6bpsgdIHFB+hy2rJu2Keaj
	m6X5cfpiJK24QTpwZg2tTSSnkzoiirsgpsP9fvxJEf4fd3D94So7yfRc6kG9KpTv7ulPLrtBJ+p
	LiwcxOqzjeq+VXc7NAFaoNTm9qVO86jM/XNNSGZXTMIrn0YMwekRkr645NUoC9snQow==
X-Gm-Gg: ASbGnct5zb/VjQPm7ruIOvM1qDbyiMZBtfeyjjUMPUVqhx3GVAqUkQSAurJkbvY7iDA
	a3liWyG3BGSHtGx9+Kq1CJdmUmUF/1ZgNWm0d2OyCMijAO7ZciQLas0nSZe/9ke208duyhw7LYk
	owpdGoiFAovNNSR+88BZYLCdRAoG2vChS9sc1ZFWfpHZleF14AUKfskmLZa7uMLjv/19XEne3+5
	B7Cqz1MYTqzChr4e/xac7EcXOENQUJbKPF3NR6jHzLyumodbvCLWPkCgG7JJim2QsIxGX8FIbpL
	AwG/hrI/EXhsvitCiBjSBAjT0qlnqNcc8y2hrneEz9H+1SzuwfGxGKNqnAehD1M61w==
X-Received: by 2002:adf:b60f:0:b0:38d:b113:eb8 with SMTP id ffacd0b85a97d-38de918b920mr304863f8f.20.1739290193764;
        Tue, 11 Feb 2025 08:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK1ASMUo9/0VqOa8FhznHehFcHh+h1fB2eK6UH8SCGRKzMX4fpRgybDSM9A1NmLLMyPAzxtg==
X-Received: by 2002:adf:b60f:0:b0:38d:b113:eb8 with SMTP id ffacd0b85a97d-38de918b920mr304770f8f.20.1739290193306;
        Tue, 11 Feb 2025 08:09:53 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm15387623f8f.90.2025.02.11.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:09:52 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, rcu@vger.kernel.org,
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
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Alexander Shishkin
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
In-Reply-To: <Z6tYnOEBkOlT_ehp@J2N7QTR9R3>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z6tYnOEBkOlT_ehp@J2N7QTR9R3>
Date: Tue, 11 Feb 2025 17:09:49 +0100
Message-ID: <xhsmhwmdwihte.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oidLxZVV4gp1nbFPqhIQ9tDAB6bO6WRR0s_vgJlGjyc_1739290194
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080957_691226_1BFC1AC0 
X-CRM114-Status: GOOD (  30.27  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMDIvMjUgMTQ6MDMsIE1hcmsgUnV0bGFuZCB3cm90ZToKPiBPbiBUdWUsIEZlYiAxMSwg
MjAyNSBhdCAwMjozMzo1MVBNICswMTAwLCBWYWxlbnRpbiBTY2huZWlkZXIgd3JvdGU6Cj4+IE9u
IDEwLzAyLzI1IDIzOjA4LCBKYW5uIEhvcm4gd3JvdGU6Cj4+ID4gMi4gSXQncyB3cm9uZyB0byBh
c3N1bWUgdGhhdCBUTEIgZW50cmllcyBhcmUgb25seSBwb3B1bGF0ZWQgZm9yCj4+ID4gYWRkcmVz
c2VzIHlvdSBhY2Nlc3MgLSB0aGFua3MgdG8gc3BlY3VsYXRpdmUgZXhlY3V0aW9uLCB5b3UgaGF2
ZSB0bwo+PiA+IGFzc3VtZSB0aGF0IHRoZSBDUFUgbWlnaHQgYmUgcG9wdWxhdGluZyByYW5kb20g
VExCIGVudHJpZXMgYWxsIG92ZXIKPj4gPiB0aGUgcGxhY2UuCj4+Cj4+IEdvdHRhIGxvdmUgc3Bl
Y3VsYXRpb24uIE5vdyBpdCBpcyBzdXBwb3NlZCB0byBiZSBsaW1pdGVkIHRvIGdlbnVpbmVseQo+
PiBhY2Nlc3NpYmxlIGRhdGEgJiBjb2RlLCByaWdodD8gU2F5IHRoZW9yZXRpY2FsbHkgd2UgaGF2
ZSBhIGZ1bGwgVExCaSBhcwo+PiBsaXRlcmFsbHkgdGhlIGxhc3QgdGhpbmcgYmVmb3JlIGRvaW5n
IHRoZSByZXR1cm4tdG8tdXNlcnNwYWNlLCBzcGVjdWxhdGlvbgo+PiBzaG91bGQgYmUgbGltaXRl
ZCB0byBleGVjdXRpbmcgbWF5YmUgYml0cyBvZiB0aGUgcmV0dXJuLWZyb20tdXNlcnNwYWNlCj4+
IGNvZGU/Cj4KPiBJIHRoaW5rIGl0J3MgZWFzaWVyIHRvIGlnbm9yZSBzcGVjdWxhdGlvbiBlbnRp
cmVseSwgYW5kIGp1c3QgYXNzdW1lIHRoYXQKPiB0aGUgTU1VIGNhbiBhcmJpdHJhcmlseSBmaWxs
IFRMQiBlbnRyaWVzIGZyb20gYW55IHBhZ2UgdGFibGUgZW50cmllcwo+IHdoaWNoIGFyZSB2YWxp
ZC9hY2Nlc3NpYmxlIGluIHRoZSBhY3RpdmUgcGFnZSB0YWJsZXMuIEhhcmR3YXJlCj4gcHJlZmV0
Y2hlcnMgY2FuIGRvIHRoYXQgcmVnYXJkbGVzcyBvZiB0aGUgc3BlY2lmaWMgcGF0aCBvZiBzcGVj
dWxhdGl2ZQo+IGV4ZWN1dGlvbi4KPgo+IFRodXMgVExCIGZpbGxzIGFyZSBub3QgbGltaXRlZCB0
byBWQXMgd2hpY2ggd291bGQgYmUgdXNlZCBvbiB0aGF0Cj4gcmV0dXJuLXRvLXVzZXJzcGFjZSBw
YXRoLgo+Cj4+IEZ1cnRoZXJtb3JlLCBJIHdvdWxkIGhvcGUgdGhhdCBvbmNlIGEgQ1BVIGlzIGV4
ZWN1dGluZyBpbiB1c2Vyc3BhY2UsIGl0J3MKPj4gbm90IGdvaW5nIHRvIHBvcHVsYXRlIHRoZSBU
TEIgd2l0aCBrZXJuZWwgYWRkcmVzcyB0cmFuc2xhdGlvbnMgLSBBSVVJIHRoZQo+PiB3aG9sZSB2
dWxuZXJhYmlsaXR5IG1pdGlnYXRpb24gZGViYWNsZSB3YXMgYWJvdXQgcHJldmVudGluZyB0aGlz
IHNvcnQgb2YKPj4gdGhpbmcuCj4KPiBUaGUgQ1BVIGNhbiBkZWZpbml0ZWx5IGRvIHRoYXQ7IHRo
ZSB2dWxuZXJhYmlsaXR5IG1pdGlnYXRpb25zIGFyZSBhbGwKPiBhYm91dCB3aGF0IHVzZXJzcGFj
ZSBjYW4gb2JzZXJ2ZSByYXRoZXIgdGhhbiB3aGF0IHRoZSBDUFUgY2FuIGRvIGluIHRoZQo+IGJh
Y2tncm91bmQuIEFkZGl0aW9uYWxseSwgdGhlcmUgYXJlIGZlYXR1cmVzIGxpa2UgU1BFIGFuZCBU
UkJFIHRoYXQgdXNlCj4ga2VybmVsIGFkZHJlc3NlcyB3aGlsZSB0aGUgQ1BVIGlzIGV4ZWN1dGlu
ZyB1c2Vyc3BhY2UgaW5zdHJ1Y3Rpb25zLgo+Cj4gVGhlIGxhdGVzdCBBUk0gQXJjaGl0ZWN0dXJl
IFJlZmVyZW5jZSBNYW51YWwgKEFSTSBEREkgMDQ4NyBMLmEpIGlzIGZhaXJseSBjbGVhcgo+IGFi
b3V0IHRoYXQgaW4gc2VjdGlvbiBEOC4xNiAiVHJhbnNsYXRpb24gTG9va2FzaWRlIEJ1ZmYiLCB3
aGVyZSBpdCBzYXlzCj4gKGFtb25nIG90aGVyIHRoaW5ncyk6Cj4KPiAgIFdoZW4gYWRkcmVzcyB0
cmFuc2xhdGlvbiBpcyBlbmFibGVkLCBpZiBhIHRyYW5zbGF0aW9uIHRhYmxlIGVudHJ5Cj4gICBt
ZWV0cyBhbGwgb2YgdGhlIGZvbGxvd2luZyByZXF1aXJlbWVudHMsIHRoZW4gdGhhdCB0cmFuc2xh
dGlvbiB0YWJsZQo+ICAgZW50cnkgaXMgcGVybWl0dGVkIHRvIGJlIGNhY2hlZCBpbiBhIFRMQiBv
ciBpbnRlcm1lZGlhdGUgVExCIGNhY2hpbmcKPiAgIHN0cnVjdHVyZSBhdCBhbnkgdGltZToKPiAg
IOKAoiBUaGUgdHJhbnNsYXRpb24gdGFibGUgZW50cnkgaXRzZWxmIGRvZXMgbm90IGdlbmVyYXRl
IGEgVHJhbnNsYXRpb24KPiAgICAgZmF1bHQsIGFuIEFkZHJlc3Mgc2l6ZSBmYXVsdCwgb3IgYW4g
QWNjZXNzIGZsYWcgZmF1bHQuCj4gICDigKIgVGhlIHRyYW5zbGF0aW9uIHRhYmxlIGVudHJ5IGlz
IG5vdCBmcm9tIGEgdHJhbnNsYXRpb24gcmVnaW1lCj4gICAgIGNvbmZpZ3VyZWQgYnkgYW4gRXhj
ZXB0aW9uIGxldmVsIHRoYXQgaXMgbG93ZXIgdGhhbiB0aGUgY3VycmVudAo+ICAgICBFeGNlcHRp
b24gbGV2ZWwuCj4KPiBIZXJlICJwZXJtaXR0ZWQgdG8gYmUgY2FjaGVkIGluIGEgVExCIiBhbHNv
IGltcGxpZXMgdGhhdCB0aGUgSFcgaXMKPiBhbGxvd2VkIHRvIGZldGNoIHRoZSB0cmFuc2xhdGlv
biB0YWJsIGVudHJ5ICh3aGljaCBpcyB3aGF0IEFSTSBjYWxsIHBhZ2UKPiB0YWJsZSBlbnRyaWVz
KS4KPgoKVGhhdCdzIGFjdHVhbGx5IGZhaXJseSBjbGVhciBhbGwgdGhpbmdzIGNvbnNpZGVyZWQs
IHRoYW5rcyBmb3IgdGhlCmVkdWNhdGlvbiBhbmQgZm9yIGZpc2hpbmcgb3V0IHRoZSByZWxldmFu
dCBEREkgc2VjdGlvbiEKCj4gVGhlIFBERiBjYW4gYmUgZm91bmQgYXQ6Cj4KPiAgIGh0dHBzOi8v
ZGV2ZWxvcGVyLmFybS5jb20vZG9jdW1lbnRhdGlvbi9kZGkwNDg3L2xhLz9sYW5nPWVuCj4KPiBN
YXJrLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
