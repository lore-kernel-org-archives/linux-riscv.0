Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820A0C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqR2/iVtTk43yUXIrW8b/n0KFOcLV3y6Pjrt84LyU1A=; b=JZSqM08ppZCRIR
	2uq+sC4lnqSp8legRoioVLcboHJ5jYlQxPspo3AExIhTKBbCSRX6KNQq3elPz0rWknTCofPD9jNXH
	RnVF2g51MTWjjpWtonFsZa9DZq1FP4qF13BYPTGctwarlA3MX9ISNDNYgpMio6WI4dHyNIc5Q5erq
	BXbtl10YM3euQKQppbyZuTlH+Wmvjm3Y6x35k3nMTXEIqZvmLeNcGJ39s3ghXW+p52CRQapVfvop5
	LaSAmMwbgN9nbox3UEknPQ6kIVeZoH5XG2yBwP6/2G3BxwppqOYnj7DdvIHZcFHB1binjRGE+vXg9
	ut5hoy7B+NQj7ymAL45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknpt-0000000E5T4-1ycg;
	Wed, 19 Feb 2025 17:26:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmmG-0000000DltL-0Gzx
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 16:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739981903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/+vVVMJTXnY0V8Ji7GQili3vpyK+jYVcqRgGTJ9UsZo=;
	b=dPseWBCvxEUKGDAnomFowcrLJELXuEiy++mfoGO8OMblO4FfO5fQpLhTQ2HMsFyhS53JxK
	Nmk1y7ifHVV2rQ8gxzcyAJ0dd+ARXJ5Z1z3ShTSlM8U+bBfXItsSksvh48kXzxjX2uTkUt
	k14H/X0lah3aMmBRufhrfaXJ2nsWzoU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-TMti4hZzOLKUxhFXSqDN8w-1; Wed, 19 Feb 2025 11:18:21 -0500
X-MC-Unique: TMti4hZzOLKUxhFXSqDN8w-1
X-Mimecast-MFC-AGG-ID: TMti4hZzOLKUxhFXSqDN8w_1739981900
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43947a0919aso58392205e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 08:18:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981899; x=1740586699;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b38N2G5pI18KXCo6dYoQ0A/4T04VhxVdQ6rNeU31Ph8=;
        b=Ys7i3ehvMgPXu7m7bQdRJH7CJ80h0ui7+Tvc9F6ktb50+/14fhb7rYqVF+oCfPiefU
         voEBhku2y5vmCHnBXMXdYo0JPUi+P+f0CEIZVZu6gTLDL0pA2cZzlb/oMRo8XffsgHnl
         W29tXusGbzgblNFhpBC7oVLrc0U5qUDzPS+lTTjHOQbxzyzgBx+CL5YFn/rszHN0+ocH
         VEHhv78aua7ouc5K/1vKrrcHIA/rEECpFkjRRy0l5tUmyEWGsASWPtTpvntjKyS336sZ
         PKUerJTUGcrizUHJ8vMDYR1OGTLM7WLoa42oLgG6/y4jJ/KzhdbptDC5/j9UIxfHE6AD
         XdLg==
X-Forwarded-Encrypted: i=1; AJvYcCUtYoguJQ19G8B+DzGSbpe2giP+hLMEyY1BYo8Q9CvuR5sSvxD7lcl9jDWkHV9etZElLzs+3BOtPrrW9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyNeHpM7kMmMM2c8gP7qVJv1aL5l5sqqdiwJnDdmGPApzVVIvR
	ZnsMZq/JixYUukJ6LDksAdCzVnOBinAZdyDAWr3qwEiTJgVcRXPR2GMkS18HNjgMwThzVMVmwYL
	fPoA8Z2pYShu2ssklZoBypc9G/m/RKBii6o3bFGVn6/+8FObv9kMDUME1GbdNpU2Eug==
X-Gm-Gg: ASbGncuARBPx0sloXqbef7aOIRjMw0QDphlTg88F468nxd42GTbSTCyy19DynWj4sxK
	gTeb/XxEKCuLQ5uBYSdN3IL5hBEy+mwtiBXfIglHFsjI3jvSJh9aH9lyCeFhCdxwjRerP+68qkq
	GXwwy1kMaDaV8ToC3SED/JoHxM0hWcd7ljHLwVAGOKXw0pjdYFMAu3GmJughZSS186PxuGYcVM3
	uZ+v87A/oyYGWKrKnvpYo9JXXty9UYFEfSjZGTyqZmvOqrVXXvT2mK8v+vvW9qFB8MGxrxk6b5x
	qEE/GbhzwZpO9B4wZFzslvPPwVX0xIqBj5eFm+wegGFq+R/SXJ4FZoXCCGb+RBNYbA==
X-Received: by 2002:a05:600c:5246:b0:439:9d75:9e92 with SMTP id 5b1f17b1804b1-4399d75b257mr27951645e9.28.1739981899399;
        Wed, 19 Feb 2025 08:18:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrgaKWzB18Ksr+NPSQeT1o3+i2kAVUfh7lIILUz6n7wULpVTIiD8VAP1UIlBXohEkgY6+FYQ==
X-Received: by 2002:a05:600c:5246:b0:439:9d75:9e92 with SMTP id 5b1f17b1804b1-4399d75b257mr27950675e9.28.1739981898863;
        Wed, 19 Feb 2025 08:18:18 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f2591570esm18461449f8f.59.2025.02.19.08.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:18:17 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
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
In-Reply-To: <20250219145302.GA480110@joelnvbox>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmhzfjpfkky.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <20250219145302.GA480110@joelnvbox>
Date: Wed, 19 Feb 2025 17:18:14 +0100
Message-ID: <xhsmhecztj4c9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3oHJHdrdtzqx9wQYvpG3oauJLypU8U71TnVBDPd8_Bc_1739981900
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_081824_181313_486FB4DF 
X-CRM114-Status: GOOD (  37.07  )
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

T24gMTkvMDIvMjUgMTA6MDUsIEpvZWwgRmVybmFuZGVzIHdyb3RlOgo+IE9uIEZyaSwgSmFuIDE3
LCAyMDI1IGF0IDA1OjUzOjMzUE0gKzAxMDAsIFZhbGVudGluIFNjaG5laWRlciB3cm90ZToKPj4g
T24gMTcvMDEvMjUgMTY6NTIsIEphbm4gSG9ybiB3cm90ZToKPj4gPiBPbiBGcmksIEphbiAxNywg
MjAyNSBhdCA0OjI14oCvUE0gVmFsZW50aW4gU2NobmVpZGVyIDx2c2NobmVpZEByZWRoYXQuY29t
PiB3cm90ZToKPj4gPj4gT24gMTQvMDEvMjUgMTk6MTYsIEphbm4gSG9ybiB3cm90ZToKPj4gPj4g
PiBPbiBUdWUsIEphbiAxNCwgMjAyNSBhdCA2OjUx4oCvUE0gVmFsZW50aW4gU2NobmVpZGVyIDx2
c2NobmVpZEByZWRoYXQuY29tPiB3cm90ZToKPj4gPj4gPj4gdnVubWFwKCkncyBpc3N1ZWQgZnJv
bSBob3VzZWtlZXBpbmcgQ1BVcyBhcmUgYSByZWxhdGl2ZWx5IGNvbW1vbiBzb3VyY2Ugb2YKPj4g
Pj4gPj4gaW50ZXJmZXJlbmNlIGZvciBpc29sYXRlZCBOT0haX0ZVTEwgQ1BVcywgYXMgdGhleSBh
cmUgaGl0IGJ5IHRoZQo+PiA+PiA+PiBmbHVzaF90bGJfa2VybmVsX3JhbmdlKCkgSVBJcy4KPj4g
Pj4gPj4KPj4gPj4gPj4gR2l2ZW4gdGhhdCBDUFVzIGV4ZWN1dGluZyBpbiB1c2Vyc3BhY2UgZG8g
bm90IGFjY2VzcyBkYXRhIGluIHRoZSB2bWFsbG9jCj4+ID4+ID4+IHJhbmdlLCB0aGVzZSBJUElz
IGNvdWxkIGJlIGRlZmVycmVkIHVudGlsIHRoZWlyIG5leHQga2VybmVsIGVudHJ5Lgo+PiA+PiA+
Pgo+PiA+PiA+PiBEZWZlcnJhbCB2cyBlYXJseSBlbnRyeSBkYW5nZXIgem9uZQo+PiA+PiA+PiA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiA+PiA+Pgo+PiA+PiA+PiBUaGlz
IHJlcXVpcmVzIGEgZ3VhcmFudGVlIHRoYXQgbm90aGluZyBpbiB0aGUgdm1hbGxvYyByYW5nZSBj
YW4gYmUgdnVubWFwJ2QKPj4gPj4gPj4gYW5kIHRoZW4gYWNjZXNzZWQgaW4gZWFybHkgZW50cnkg
Y29kZS4KPj4gPj4gPgo+PiA+PiA+IEluIG90aGVyIHdvcmRzLCBpdCBuZWVkcyBhIGd1YXJhbnRl
ZSB0aGF0IG5vIHZtYWxsb2MgYWxsb2NhdGlvbnMgdGhhdAo+PiA+PiA+IGhhdmUgYmVlbiBjcmVh
dGVkIGluIHRoZSB2bWFsbG9jIHJlZ2lvbiB3aGlsZSB0aGUgQ1BVIHdhcyBpZGxlIGNhbgo+PiA+
PiA+IHRoZW4gYmUgYWNjZXNzZWQgZHVyaW5nIGVhcmx5IGVudHJ5LCByaWdodD8KPj4gPj4KPj4g
Pj4gSSdtIG5vdCBzdXJlIGlmIHRoYXQgd291bGQgYmUgYSBwcm9ibGVtIChub3QgYW4gbW0gZXhw
ZXJ0LCBwbGVhc2UgZG8KPj4gPj4gY29ycmVjdCBtZSkgLSBsb29raW5nIGF0IHZtYXBfcGFnZXNf
cmFuZ2UoKSwgZmx1c2hfY2FjaGVfdm1hcCgpIGlzbid0Cj4+ID4+IGRlZmVycmVkIGFueXdheS4K
Pj4gPgo+PiA+IGZsdXNoX2NhY2hlX3ZtYXAoKSBpcyBhYm91dCBzdHVmZiBsaWtlIGZsdXNoaW5n
IGRhdGEgY2FjaGVzIG9uCj4+ID4gYXJjaGl0ZWN0dXJlcyB3aXRoIHZpcnR1YWxseSBpbmRleGVk
IGNhY2hlczsgdGhhdCBkb2Vzbid0IGRvIFRMQgo+PiA+IG1haW50ZW5hbmNlLiBXaGVuIHlvdSBs
b29rIGZvciBpdHMgZGVmaW5pdGlvbiBvbiB4ODYgb3IgYXJtNjQsIHlvdSdsbAo+PiA+IHNlZSB0
aGF0IHRoZXkgdXNlIHRoZSBnZW5lcmljIGltcGxlbWVudGF0aW9uIHdoaWNoIGlzIHNpbXBseSBh
biBlbXB0eQo+PiA+IGlubGluZSBmdW5jdGlvbi4KPj4gPgo+PiA+PiBTbyBhZnRlciB2bWFwcGlu
ZyBzb21ldGhpbmcsIEkgd291bGRuJ3QgZXhwZWN0IGlzb2xhdGVkIENQVXMgdG8gaGF2ZQo+PiA+
PiBpbnZhbGlkIFRMQiBlbnRyaWVzIGZvciB0aGUgbmV3bHkgdm1hcHBlZCBwYWdlLgo+PiA+Pgo+
PiA+PiBIb3dldmVyLCB1cG9uIHZ1bm1hcCdpbmcgc29tZXRoaW5nLCB0aGUgVExCIGZsdXNoIGlz
IGRlZmVycmVkLCBhbmQgdGh1cwo+PiA+PiBzdGFsZSBUTEIgZW50cmllcyBjYW4gYW5kIHdpbGwg
cmVtYWluIG9uIGlzb2xhdGVkIENQVXMsIHVwIHVudGlsIHRoZXkKPj4gPj4gZXhlY3V0ZSB0aGUg
ZGVmZXJyZWQgZmx1c2ggdGhlbXNlbHZlcyAoSU9XIGZvciB0aGUgZW50aXJlIGR1cmF0aW9uIG9m
IHRoZQo+PiA+PiAiZGFuZ2VyIHpvbmUiKS4KPj4gPj4KPj4gPj4gRG9lcyB0aGF0IG1ha2Ugc2Vu
c2U/Cj4+ID4KPj4gPiBUaGUgZGVzaWduIGlkZWEgd3J0IFRMQiBmbHVzaGVzIGluIHRoZSB2bWFw
IGNvZGUgaXMgdGhhdCB5b3UgZG9uJ3QgZG8KPj4gPiBUTEIgZmx1c2hlcyB3aGVuIHlvdSB1bm1h
cCBzdHVmZiBvciB3aGVuIHlvdSBtYXAgc3R1ZmYsIGJlY2F1c2UgZG9pbmcKPj4gPiBUTEIgZmx1
c2hlcyBhY3Jvc3MgdGhlIGVudGlyZSBzeXN0ZW0gb24gZXZlcnkgdm1hcC92dW5tYXAgd291bGQg
YmUgYQo+PiA+IGJpdCBjb3N0bHk7IGluc3RlYWQgeW91IGp1c3QgZG8gYmF0Y2hlZCBUTEIgZmx1
c2hlcyBpbiBiZXR3ZWVuLCBpbgo+PiA+IF9fcHVyZ2Vfdm1hcF9hcmVhX2xhenkoKS4KPj4gPgo+
PiA+IEluIG90aGVyIHdvcmRzLCB0aGUgYmFzaWMgaWRlYSBpcyB0aGF0IHlvdSBjYW4ga2VlcCBj
YWxsaW5nIHZtYXAoKSBhbmQKPj4gPiB2dW5tYXAoKSBhIGJ1bmNoIG9mIHRpbWVzIHdpdGhvdXQg
ZXZlciBkb2luZyBUTEIgZmx1c2hlcyB1bnRpbCB5b3UgcnVuCj4+ID4gb3V0IG9mIHZpcnR1YWwg
bWVtb3J5IGluIHRoZSB2bWFwIHJlZ2lvbjsgdGhlbiB5b3UgZG8gb25lIGJpZyBUTEIKPj4gPiBm
bHVzaCwgYW5kIGFmdGVyd2FyZHMgeW91IGNhbiByZXVzZSB0aGUgZnJlZSB2aXJ0dWFsIGFkZHJl
c3Mgc3BhY2UgZm9yCj4+ID4gbmV3IGFsbG9jYXRpb25zIGFnYWluLgo+PiA+Cj4+ID4gU28gaWYg
eW91ICJkZWZlciIgdGhhdCBiYXRjaGVkIFRMQiBmbHVzaCBmb3IgQ1BVcyB0aGF0IGFyZSBub3QK
Pj4gPiBjdXJyZW50bHkgcnVubmluZyBpbiB0aGUga2VybmVsLCBJIHRoaW5rIHRoZSBjb25zZXF1
ZW5jZSBpcyB0aGF0IHRob3NlCj4+ID4gQ1BVcyBtYXkgZW5kIHVwIHdpdGggaW5jb2hlcmVudCBU
TEIgc3RhdGUgYWZ0ZXIgYSByZWFsbG9jYXRpb24gb2YgdGhlCj4+ID4gdmlydHVhbCBhZGRyZXNz
IHNwYWNlLgo+PiA+Cj4+Cj4+IEFoLCBnb3RjaGEsIHRoYW5rIHlvdSBmb3IgbGF5aW5nIHRoaXMg
b3V0ISBJbiB3aGljaCBjYXNlIHllcywgYW55IHZtYWxsb2MKPj4gdGhhdCBvY2N1cnJlZCB3aGls
ZSBhbiBpc29sYXRlZCBDUFUgd2FzIE5PSFotRlVMTCBjYW4gYmUgYW4gaXNzdWUgaWYgc2FpZAo+
PiBDUFUgYWNjZXNzZXMgaXQgZHVyaW5nIGVhcmx5IGVudHJ5Owo+Cj4gU28gdGhlIGlzc3VlIGlz
Ogo+Cj4gQ1BVMTogdW5tYXBwZXMgdm1hbGxvYyBwYWdlIFggd2hpY2ggd2FzIHByZXZpb3VzbHkg
bWFwcGVkIHRvIHBoeXNpY2FsIHBhZ2UKPiBQMS4KPgo+IENQVTI6IGRvZXMgYSB3aG9sZSBidW5j
aCBvZiB2bWFsbG9jIGFuZCB2ZnJlZSBldmVudHVhbGx5IGNyb3NzaW5nIHNvbWUgbGF6eQo+IHRo
cmVzaG9sZCBhbmQgc2VuZGluZyBvdXQgSVBJcy4gSXQgdGhlbiBnb2VzIGFoZWFkIGFuZCBkb2Vz
IGFuIGFsbG9jYXRpb24KPiB0aGF0IG1hcHMgdGhlIHNhbWUgdmlydHVhbCBwYWdlIFggdG8gcGh5
c2ljYWwgcGFnZSBQMi4KPgo+IENQVTMgaXMgaXNvbGF0ZWQgYW5kIGV4ZWN1dGVzIHNvbWUgZWFy
bHkgZW50cnkgY29kZSBiZWZvcmUgcmVjZXZpbmcgc2FpZCBJUElzCj4gd2hpY2ggYXJlIHN1cHBv
c2VkbHkgZGVmZXJyZWQgYnkgVmFsZW50aW4ncyBwYXRjaGVzLgo+Cj4gSXQgZG9lcyBub3QgcmVj
ZWl2ZSB0aGUgSVBJIGJlY3Vhc2UgaXQgaXMgZGVmZXJyZWQsIHRodXMgYWNjZXNzIGJ5IGVhcmx5
Cj4gZW50cnkgY29kZSB0byBwYWdlIFggb24gdGhpcyBDUFUgcmVzdWx0cyBpbiBhIFVBRiBhY2Nl
c3MgdG8gUDEuCj4KPiBJcyB0aGF0IHRoZSBpc3N1ZT8KPgoKUHJldHR5IG11Y2ggc28geWVhaC4g
VGhhdCBpcywgKmlmKiB0aGVyZSBzdWNoIGEgdm1hbGxvYydkIGFkZHJlc3MgYWNjZXNzIGluCmVh
cmx5IGVudHJ5IGNvZGUgLSB0ZXN0aW5nIHNheXMgaXQncyBub3QgdGhlIGNhc2UsIGJ1dCBJIGhh
dmVuJ3QgZm91bmQgYQp3YXkgdG8gaW5zdHJ1bWVudGFsbHkgdmVyaWZ5IHRoaXMuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
