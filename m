Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE8AC021A3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scB1dO6dwrtjaqfQMSYOqZsU86M+AdGVoUgeyTFvFNU=; b=iBzrUeUuE+4cIe
	6eT1WKDcPe6jVczsK8aetP2MNS9CM0zGyLjsKbjwhIXnedWh2osV+LONaq4IQYsiOMGlQYEmmCz/A
	7BaPB2abYOlvWhWBdfGioBIc2azJgdKuqTFkrCIly5+FUZsr2qA9kECW4aXninvAnBC1DmzOPas+6
	0djU3mxdKiPXbdlIbgBsX3p00jpLi7I1H04Gt2l1TruHM9DtQvKB5E+ypY2/KzQKjNp1bzNgRSR29
	KhIuOj5RDLVwvcMmfTvrnW1uASjOL8/fKE6mzRdnN7baHOS8T21YFRciB4jTnx2Xwc1oTCvi7wKf4
	JQ5mQRwploOtQxq/TdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZeI-00000001AgM-3j7R;
	Mon, 10 Feb 2025 19:40:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYe1-00000000wj8-3ViL
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 18:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqE0jHaMjhCJShfdzgjb9zITCwMN+BQSAsP6fR/sVdA=;
	b=ACj5C/lkCx/g7pSA4O9OjkNRuDFvagchCtrMLr9qouzfhbfKJven+eaArGBS060vUUId+s
	algEGo83zpIlBlq54x17x5XMuY0P6zIDgB6UdAbEhn/LP+lzahh28439uvczz1EkX9Z1EO
	KztvIC8qWMyTTQ75XXVNtxXM+52eESY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-cDeBDKoDMge6-aFfq6DrjQ-1; Mon, 10 Feb 2025 13:36:31 -0500
X-MC-Unique: cDeBDKoDMge6-aFfq6DrjQ-1
X-Mimecast-MFC-AGG-ID: cDeBDKoDMge6-aFfq6DrjQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38dc32f753dso1694915f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 10:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212590; x=1739817390;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiJBK34xYsYFUmPZtAh8Dtmq/EliyHBgVCGizBc5us0=;
        b=nmBTdmMjPwr3taYyw1AO/vflZGKW0u3MD8RI8zm/ZvIeHyN4HojBzy7XHZ9smWIcSv
         98iLdqLOWaUEBwsqUYMAAhEeO3m4NEeU+oSsj6nGsKdiQYZP2VNDlG/ASyXJUTQVds1Z
         TIy1s7d8suqRQXcNvjGlrKkGeUfEGqjobwcL8PXMxkccdhQDN7cb5W3dVAQWXWNqFNQH
         vE5C1wYlPC6Xes58JUPpxcIff5+CL0vv5qHTlbAFJAUvMLN8N8afb85Og15iS9Yl9RY5
         EL8x2mZwRcPmDBMn6FNQpYej0jD30diP6IxqLxIxFgCSqNgapHDhb1Djezb7DodfdnNE
         2xlw==
X-Forwarded-Encrypted: i=1; AJvYcCXBaQ+qWGZdTzcQWuLP7/fNW3sUWyOOBaqwrYrTUaUMM/1X3T73w63glq1Q3V0pi8pTqK8aV2nfCwPKCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5MxRrh5gPZGaTHRARCwDdBc8mN40UMhTyq3WjE47rtPHMWun7
	lvaWEB6F6ppD5j0CW5hdLElujt6w1X2kfjPC8hXm4b70cEj34Pxo5P5a/VK7AHL4wNRyTAm2b03
	s7edvIUfEFYnykGUHQIJL5AjKl3BOBnLlajCqPZU7zVmBO+Lz+ChewTAFeRO1yyzJ7w==
X-Gm-Gg: ASbGncu7bdynq8INQfAayqYyqM2+H8baimf4Kiy8iZPqQRcvKlCSNkGV+nM7FMxFxbf
	HyToYJqGDWIatMRvmSkzo/EVJqluX+MWq9hXXa0EUVy79tPmX7VxfhvVBBdB/x6pIAghxCuSlaA
	0UDhBewtS+PMvPnqO+aIq0wJoO0ItWJXUiUWxWtrOGw3tHOWJLWQOVQLmlbMBK/DSTnL3+CxAf4
	Vu3n1fZWiU7ucdnqrkV7B2O9KnNW+rXrU/UCP9/KUagVLB9ElSzwm1zF1CTW7ct2SIpKS6MF3Cv
	b2vhKEgNzZouIZfzqxn5wy/iIiOSCMWAZk/EAOfBjaxt8UnSddfrCc09JZ3JM7LkCQ==
X-Received: by 2002:a5d:47ac:0:b0:38d:db7b:5d7d with SMTP id ffacd0b85a97d-38de419476bmr505869f8f.32.1739212590291;
        Mon, 10 Feb 2025 10:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWifeCshW6jETL9TuYLjadqG7dtdSXfyo+9LdDhlWGx2V5vqBUb9lSHZiG4U0YoCHaPoMeeg==
X-Received: by 2002:a5d:47ac:0:b0:38d:db7b:5d7d with SMTP id ffacd0b85a97d-38de419476bmr505766f8f.32.1739212589672;
        Mon, 10 Feb 2025 10:36:29 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394328fcb8sm43783895e9.32.2025.02.10.10.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:36:29 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Jann Horn <jannh@google.com>
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
In-Reply-To: <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
Date: Mon, 10 Feb 2025 19:36:25 +0100
Message-ID: <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GJ2-Rt4ebuMi5xuH1we8eQud2cXcJIQiMD6Xl8FCVPM_1739212590
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_103633_945428_29E13552 
X-CRM114-Status: GOOD (  38.52  )
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

T24gMTcvMDEvMjUgMTY6NTIsIEphbm4gSG9ybiB3cm90ZToKPiBPbiBGcmksIEphbiAxNywgMjAy
NSBhdCA0OjI14oCvUE0gVmFsZW50aW4gU2NobmVpZGVyIDx2c2NobmVpZEByZWRoYXQuY29tPiB3
cm90ZToKPj4gT24gMTQvMDEvMjUgMTk6MTYsIEphbm4gSG9ybiB3cm90ZToKPj4gPiBPbiBUdWUs
IEphbiAxNCwgMjAyNSBhdCA2OjUx4oCvUE0gVmFsZW50aW4gU2NobmVpZGVyIDx2c2NobmVpZEBy
ZWRoYXQuY29tPiB3cm90ZToKPj4gPj4gdnVubWFwKCkncyBpc3N1ZWQgZnJvbSBob3VzZWtlZXBp
bmcgQ1BVcyBhcmUgYSByZWxhdGl2ZWx5IGNvbW1vbiBzb3VyY2Ugb2YKPj4gPj4gaW50ZXJmZXJl
bmNlIGZvciBpc29sYXRlZCBOT0haX0ZVTEwgQ1BVcywgYXMgdGhleSBhcmUgaGl0IGJ5IHRoZQo+
PiA+PiBmbHVzaF90bGJfa2VybmVsX3JhbmdlKCkgSVBJcy4KPj4gPj4KPj4gPj4gR2l2ZW4gdGhh
dCBDUFVzIGV4ZWN1dGluZyBpbiB1c2Vyc3BhY2UgZG8gbm90IGFjY2VzcyBkYXRhIGluIHRoZSB2
bWFsbG9jCj4+ID4+IHJhbmdlLCB0aGVzZSBJUElzIGNvdWxkIGJlIGRlZmVycmVkIHVudGlsIHRo
ZWlyIG5leHQga2VybmVsIGVudHJ5Lgo+PiA+Pgo+PiA+PiBEZWZlcnJhbCB2cyBlYXJseSBlbnRy
eSBkYW5nZXIgem9uZQo+PiA+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+
PiA+Pgo+PiA+PiBUaGlzIHJlcXVpcmVzIGEgZ3VhcmFudGVlIHRoYXQgbm90aGluZyBpbiB0aGUg
dm1hbGxvYyByYW5nZSBjYW4gYmUgdnVubWFwJ2QKPj4gPj4gYW5kIHRoZW4gYWNjZXNzZWQgaW4g
ZWFybHkgZW50cnkgY29kZS4KPj4gPgo+PiA+IEluIG90aGVyIHdvcmRzLCBpdCBuZWVkcyBhIGd1
YXJhbnRlZSB0aGF0IG5vIHZtYWxsb2MgYWxsb2NhdGlvbnMgdGhhdAo+PiA+IGhhdmUgYmVlbiBj
cmVhdGVkIGluIHRoZSB2bWFsbG9jIHJlZ2lvbiB3aGlsZSB0aGUgQ1BVIHdhcyBpZGxlIGNhbgo+
PiA+IHRoZW4gYmUgYWNjZXNzZWQgZHVyaW5nIGVhcmx5IGVudHJ5LCByaWdodD8KPj4KPj4gSSdt
IG5vdCBzdXJlIGlmIHRoYXQgd291bGQgYmUgYSBwcm9ibGVtIChub3QgYW4gbW0gZXhwZXJ0LCBw
bGVhc2UgZG8KPj4gY29ycmVjdCBtZSkgLSBsb29raW5nIGF0IHZtYXBfcGFnZXNfcmFuZ2UoKSwg
Zmx1c2hfY2FjaGVfdm1hcCgpIGlzbid0Cj4+IGRlZmVycmVkIGFueXdheS4KPgo+IGZsdXNoX2Nh
Y2hlX3ZtYXAoKSBpcyBhYm91dCBzdHVmZiBsaWtlIGZsdXNoaW5nIGRhdGEgY2FjaGVzIG9uCj4g
YXJjaGl0ZWN0dXJlcyB3aXRoIHZpcnR1YWxseSBpbmRleGVkIGNhY2hlczsgdGhhdCBkb2Vzbid0
IGRvIFRMQgo+IG1haW50ZW5hbmNlLiBXaGVuIHlvdSBsb29rIGZvciBpdHMgZGVmaW5pdGlvbiBv
biB4ODYgb3IgYXJtNjQsIHlvdSdsbAo+IHNlZSB0aGF0IHRoZXkgdXNlIHRoZSBnZW5lcmljIGlt
cGxlbWVudGF0aW9uIHdoaWNoIGlzIHNpbXBseSBhbiBlbXB0eQo+IGlubGluZSBmdW5jdGlvbi4K
Pgo+PiBTbyBhZnRlciB2bWFwcGluZyBzb21ldGhpbmcsIEkgd291bGRuJ3QgZXhwZWN0IGlzb2xh
dGVkIENQVXMgdG8gaGF2ZQo+PiBpbnZhbGlkIFRMQiBlbnRyaWVzIGZvciB0aGUgbmV3bHkgdm1h
cHBlZCBwYWdlLgo+Pgo+PiBIb3dldmVyLCB1cG9uIHZ1bm1hcCdpbmcgc29tZXRoaW5nLCB0aGUg
VExCIGZsdXNoIGlzIGRlZmVycmVkLCBhbmQgdGh1cwo+PiBzdGFsZSBUTEIgZW50cmllcyBjYW4g
YW5kIHdpbGwgcmVtYWluIG9uIGlzb2xhdGVkIENQVXMsIHVwIHVudGlsIHRoZXkKPj4gZXhlY3V0
ZSB0aGUgZGVmZXJyZWQgZmx1c2ggdGhlbXNlbHZlcyAoSU9XIGZvciB0aGUgZW50aXJlIGR1cmF0
aW9uIG9mIHRoZQo+PiAiZGFuZ2VyIHpvbmUiKS4KPj4KPj4gRG9lcyB0aGF0IG1ha2Ugc2Vuc2U/
Cj4KPiBUaGUgZGVzaWduIGlkZWEgd3J0IFRMQiBmbHVzaGVzIGluIHRoZSB2bWFwIGNvZGUgaXMg
dGhhdCB5b3UgZG9uJ3QgZG8KPiBUTEIgZmx1c2hlcyB3aGVuIHlvdSB1bm1hcCBzdHVmZiBvciB3
aGVuIHlvdSBtYXAgc3R1ZmYsIGJlY2F1c2UgZG9pbmcKPiBUTEIgZmx1c2hlcyBhY3Jvc3MgdGhl
IGVudGlyZSBzeXN0ZW0gb24gZXZlcnkgdm1hcC92dW5tYXAgd291bGQgYmUgYQo+IGJpdCBjb3N0
bHk7IGluc3RlYWQgeW91IGp1c3QgZG8gYmF0Y2hlZCBUTEIgZmx1c2hlcyBpbiBiZXR3ZWVuLCBp
bgo+IF9fcHVyZ2Vfdm1hcF9hcmVhX2xhenkoKS4KPgo+IEluIG90aGVyIHdvcmRzLCB0aGUgYmFz
aWMgaWRlYSBpcyB0aGF0IHlvdSBjYW4ga2VlcCBjYWxsaW5nIHZtYXAoKSBhbmQKPiB2dW5tYXAo
KSBhIGJ1bmNoIG9mIHRpbWVzIHdpdGhvdXQgZXZlciBkb2luZyBUTEIgZmx1c2hlcyB1bnRpbCB5
b3UgcnVuCj4gb3V0IG9mIHZpcnR1YWwgbWVtb3J5IGluIHRoZSB2bWFwIHJlZ2lvbjsgdGhlbiB5
b3UgZG8gb25lIGJpZyBUTEIKPiBmbHVzaCwgYW5kIGFmdGVyd2FyZHMgeW91IGNhbiByZXVzZSB0
aGUgZnJlZSB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgZm9yCj4gbmV3IGFsbG9jYXRpb25zIGFnYWlu
Lgo+Cj4gU28gaWYgeW91ICJkZWZlciIgdGhhdCBiYXRjaGVkIFRMQiBmbHVzaCBmb3IgQ1BVcyB0
aGF0IGFyZSBub3QKPiBjdXJyZW50bHkgcnVubmluZyBpbiB0aGUga2VybmVsLCBJIHRoaW5rIHRo
ZSBjb25zZXF1ZW5jZSBpcyB0aGF0IHRob3NlCj4gQ1BVcyBtYXkgZW5kIHVwIHdpdGggaW5jb2hl
cmVudCBUTEIgc3RhdGUgYWZ0ZXIgYSByZWFsbG9jYXRpb24gb2YgdGhlCj4gdmlydHVhbCBhZGRy
ZXNzIHNwYWNlLgo+Cj4gQWN0dWFsbHksIEkgdGhpbmsgdGhpcyB3b3VsZCBtZWFuIHRoYXQgeW91
ciBvcHRpbWl6YXRpb24gaXMgZGlzYWxsb3dlZAo+IGF0IGxlYXN0IG9uIGFybTY0IC0gSSdtIG5v
dCBzdXJlIGFib3V0IHRoZSBleGFjdCB3b3JkaW5nLCBidXQgYXJtNjQKPiBoYXMgYSAiYnJlYWsg
YmVmb3JlIG1ha2UiIHJ1bGUgdGhhdCBmb3JiaWRzIGNvbmZsaWN0aW5nIHdyaXRhYmxlCj4gYWRk
cmVzcyB0cmFuc2xhdGlvbnMgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KPgo+IChJIHNhaWQgInVu
dGlsIHlvdSBydW4gb3V0IG9mIHZpcnR1YWwgbWVtb3J5IGluIHRoZSB2bWFwIHJlZ2lvbiIsIGJ1
dAo+IHRoYXQncyBub3QgYWN0dWFsbHkgdHJ1ZSAtIHNlZSB0aGUgY29tbWVudCBhYm92ZSBsYXp5
X21heF9wYWdlcygpIGZvcgo+IGFuIGV4cGxhbmF0aW9uIG9mIHRoZSBhY3R1YWwgaGV1cmlzdGlj
LiBZb3UgbWlnaHQgYmUgYWJsZSB0byB0dW5lIHRoYXQKPiBhIGJpdCBpZiB5b3UnZCBiZSBzaWdu
aWZpY2FudGx5IGhhcHBpZXIgd2l0aCBsZXNzIGZyZXF1ZW50Cj4gaW50ZXJydXB0aW9ucywgb3Ig
c29tZXRoaW5nIGFsb25nIHRob3NlIGxpbmVzLikKCkkndmUgYmVlbiB0aGlua2luZyBzb21lIG1v
cmUgKHRoaXMgaXMgeW91ciBjdWUgdG8gZ3JhYiBhIGJyb3duIHBhcGVyIGJhZykuLi4KCkV4cGVy
aW1lbnRhdGlvbiAodW5tYXAgdGhlIHdob2xlIFZNQUxMT0MgcmFuZ2UgdXBvbiByZXR1cm4gdG8g
dXNlcnNwYWNlLApzZWUgd2hhdCBleHBsb2RlcyB1cG9uIGVudHJ5IGludG8gdGhlIGtlcm5lbCkg
c3VnZ2VzdHMgdGhhdCB0aGUgZWFybHkgZW50cnkKImRhbmdlciB6b25lIiBzaG91bGQgb25seSBh
Y2Nlc3MgdGhlIHZtYXBlZCBzdGFjaywgd2hpY2ggaXRzZWxmIGlzbid0IGFuCmlzc3VlLgoKVGhh
dCBpcyBvYnZpb3VzbHkganVzdCBhIHRlc3Qgb24gb25lIHN5c3RlbSBjb25maWd1cmF0aW9uLCBh
bmQgdGhlIHByb2JsZW0KSSdtIGZhY2luZyBpcyB0cnlpbmcgcHV0IGluIHBsYWNlIC9zb21lLyBm
b3JtIG9mIGluc3RydW1lbnRhdGlvbiB0aGF0IHdvdWxkCmF0IHRoZSB2ZXJ5IGxlYXN0IGNhdXNl
IGEgd2FybmluZyBmb3IgYW55IGZ1dHVyZSBwYXRjaCB0aGF0IHdvdWxkIGludHJvZHVjZQphIHZt
YXAnZCBhY2Nlc3MgaW4gZWFybHkgZW50cnkgY29kZS4gVGhhdCwgb3IgYSBjb21wbGV0ZSBtaXRp
Z2F0aW9uIHRoYXQKcHJldmVudHMgdGhvc2UgYWNjZXNzZXMgYWx0b2dldGhlci4KCldoYXQgaWYg
aXNvbGF0ZWQgQ1BVcyB1bmNvbmRpdGlvbmFsbHkgZGlkIGEgVExCaSBhcyBsYXRlIGFzIHBvc3Np
YmxlIGluCnRoZSBzdGFjayByaWdodCBiZWZvcmUgcmV0dXJuaW5nIHRvIHVzZXJzcGFjZT8gVGhp
cyB3b3VsZCBtZWFuIHRoYXQgdXBvbgpyZS1lbnRlcmluZyB0aGUga2VybmVsLCBhbiBpc29sYXRl
ZCBDUFUncyBUTEIgd291bGRuJ3QgY29udGFpbiBhbnkga2VybmVsCnJhbmdlIHRyYW5zbGF0aW9u
IC0gd2l0aCB0aGUgZXhjZXB0aW9uIG9mIHdoYXRldmVyIGxpZXMgYmV0d2VlbiB0aGUKbGFzdC1t
aW51dGUgZmx1c2ggYW5kIHRoZSBhY3R1YWwgdXNlcnNwYWNlIGVudHJ5LCB3aGljaCBzaG91bGQg
YmUgZmVhc2libGUKdG8gdmV0PyBUaGVuIEFGQUlDVCB0aGVyZSB3b3VsZG4ndCBiZSBhbnkgd29y
ay9mbHVzaCB0byBkZWZlciwgdGhlIElQSQpjb3VsZCBiZSBlbnRpcmVseSBzaWxlbmNlZCBpZiBp
dCB0YXJnZXRzIGFuIGlzb2xhdGVkIENQVS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
