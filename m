Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A891C02185
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jVm/JMBWeIUIAMgsQHgPoLADbmawEUKpQRQh3HT69k=; b=YhjSG/VAFcpaHT
	1m0X5iPRo+4ucJBfH35FXKGaRoquazklM65sUhxyXR3j8LAzdariXUWpoS5eQfJ14pyXAXaklp1Vj
	1jyis8rsQS0L7hVURH7cfUQYEmTt7EcfMUj+ZxrKpX5fJslIcS5nmyy3VEXRpLaJvQwxehDD9Klw+
	E2DGjIjr5aRjRFfvFk2slRpH4G1a5SY8wOPH/rvAO2BrYB6CCE0TYbA9VxpyajE8aYHHqIeVc126Q
	ox34Eayi7tbkYIRdS6WSEnR02eOUDLQ3xM2VP1ffoCP2rvIZYX1v97LuGIpWG4VnDp4LO5LbKVs/y
	UOLnrLSXdGL9dsciqltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpkC-00000000tRr-1VlY;
	Fri, 17 Jan 2025 17:02:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpbJ-00000000rde-05Os
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 16:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737132820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N/IFo0/H4hlssGmiFiddM6Zrvy7F7bLkhW3DK1UInsM=;
	b=QEeLCMX/oNZYqE/f8zniWr+O3tTGE7QzyOo76ZLV1xaKZ7Sswa1q64nQ7NEl2L4882SJnI
	Y5gAa+uHyhYbtg4WaUyE97RLvPoddPSC2ve+KEFdnYybpCb/Yqfx9SMZ0SZa+C0F+6jRGV
	8j3l5ytcmSbal3aAmTJSYg7sF1xNzSg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-f2GkdpMYM-6dyOU3No8qfA-1; Fri, 17 Jan 2025 11:53:38 -0500
X-MC-Unique: f2GkdpMYM-6dyOU3No8qfA-1
X-Mimecast-MFC-AGG-ID: f2GkdpMYM-6dyOU3No8qfA
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38634103b0dso1466753f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 08:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132817; x=1737737617;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS2KlTiZnGu6aQKTYj9yMifWHTI073WZ1gonGb0ZMuU=;
        b=steCtJFU6dnEy6dBmTaVsS1EQGMRvZQs32cmXXDTl5PewZ/dbJi6NuuN4AuTCVLu/Y
         X5/nGvV5IW8B+SoEY/G/ctL1RVxYYDf+II4hXSPf74eKRIF1YtQerMmkSwD7fUjl5+Q+
         9y3Ol8yGtfw6E1pXUHVmvNXk5LCOSysRbvLUM4CimKdaqcDNSN9XonPHALtmMajafeKd
         ubzEcSAcrob9FE5+dkKocXx9xUYFgC+XbBWdluhd++cRof0pgAJcLMGYh6Z30JgHYVgd
         ZOSHQMjMV6VYK4unHJLTbXEtTqVCmtFeBOct/q4dy3gwpNR/uXhYwQlOZwHX2vlmoP7/
         aepQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiZX2cGglxmU7hed9iXyqPiw6ydWdq7YF9NjSSWA38g7n+er8EQTS3g9T8/f5+EZMU9mt8ijfQrfSCPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxdtKU6yN2tQAJynvie7tN4+nkNBEtx5OTJ49MMwMMAny/o9yU
	+Z+w3oe184vRH15BWSW0W40+ZBlryzLvwR8727DueI2KcyBUjQuFZfuq7fWSPJywb+lc8M8MsMR
	dZPYWz85EDn3wSmOnI1aNSb7Weia3eyRwOqTu7nnX8as8jCpigxx5Oa+SyYGhaLf34A==
X-Gm-Gg: ASbGncsq5RZ7oBLoMYK8TvACsRV0nsg0qlKPwO6KX0jKZ+5prh78iENJMrqSRWSgb4p
	SbCA/WPGKg6YHR2WLPPMWpGv+Ajdg4jmVa0uPNeF1lpb4VM3wutdhpxqkXGE4DskA+qdw7V//aL
	JDtx1xDGstheJ/QIrI53SekbdjuO2f3LkREovdI0CT4snkC+fUQGl400GKSXrEYyF019cp6ak71
	OEAwShx/jA5S+BHtY6Kx9MVNOKd6tlTynj461dMroAyowV1jqNVNa059M8dGYjxnp8EJia+foqE
	ZpiUK4gVBcUrkCW83lgOVHq6lu3kQGtSeaWMcsvjgg==
X-Received: by 2002:a5d:6da4:0:b0:38b:e32a:10a6 with SMTP id ffacd0b85a97d-38bf57a9932mr3394932f8f.41.1737132817357;
        Fri, 17 Jan 2025 08:53:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgg/tn25OOVaMMDMlg+FUQ1oxKEYFZYFbhCFaXXhI5w4vXLbPHJsNwkMnyD4aTZ+GRHXAAGg==
X-Received: by 2002:a5d:6da4:0:b0:38b:e32a:10a6 with SMTP id ffacd0b85a97d-38bf57a9932mr3394815f8f.41.1737132816637;
        Fri, 17 Jan 2025 08:53:36 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221db2sm2893201f8f.29.2025.01.17.08.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:53:36 -0800 (PST)
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
Date: Fri, 17 Jan 2025 17:53:33 +0100
Message-ID: <xhsmhzfjpfkky.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t0pMtb_8dgwHhtHz8ehCKHgVi7UU-eS0c10T-2DVQqA_1737132818
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_085341_126773_F9120B43 
X-CRM114-Status: GOOD (  34.83  )
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
ZXNzIHNwYWNlLgo+CgpBaCwgZ290Y2hhLCB0aGFuayB5b3UgZm9yIGxheWluZyB0aGlzIG91dCEg
SW4gd2hpY2ggY2FzZSB5ZXMsIGFueSB2bWFsbG9jCnRoYXQgb2NjdXJyZWQgd2hpbGUgYW4gaXNv
bGF0ZWQgQ1BVIHdhcyBOT0haLUZVTEwgY2FuIGJlIGFuIGlzc3VlIGlmIHNhaWQKQ1BVIGFjY2Vz
c2VzIGl0IGR1cmluZyBlYXJseSBlbnRyeTsKCj4gQWN0dWFsbHksIEkgdGhpbmsgdGhpcyB3b3Vs
ZCBtZWFuIHRoYXQgeW91ciBvcHRpbWl6YXRpb24gaXMgZGlzYWxsb3dlZAo+IGF0IGxlYXN0IG9u
IGFybTY0IC0gSSdtIG5vdCBzdXJlIGFib3V0IHRoZSBleGFjdCB3b3JkaW5nLCBidXQgYXJtNjQK
PiBoYXMgYSAiYnJlYWsgYmVmb3JlIG1ha2UiIHJ1bGUgdGhhdCBmb3JiaWRzIGNvbmZsaWN0aW5n
IHdyaXRhYmxlCj4gYWRkcmVzcyB0cmFuc2xhdGlvbnMgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
PgoKT24gdGhlIGJyaWdodCBzaWRlIG9mIHRoaW5ncywgYXJtNjQgaXMgbm90IGFzIGJhZCBhcyB4
ODYgd2hlbiBpdCBjb21lcyB0bwpJUEknaW5nIGlzb2xhdGVkIENQVXMgOi0pIEknbGwgYWRkIHRo
YXQgdG8gbXkgbm90ZXMsIHRoYW5rcyEKCj4gKEkgc2FpZCAidW50aWwgeW91IHJ1biBvdXQgb2Yg
dmlydHVhbCBtZW1vcnkgaW4gdGhlIHZtYXAgcmVnaW9uIiwgYnV0Cj4gdGhhdCdzIG5vdCBhY3R1
YWxseSB0cnVlIC0gc2VlIHRoZSBjb21tZW50IGFib3ZlIGxhenlfbWF4X3BhZ2VzKCkgZm9yCj4g
YW4gZXhwbGFuYXRpb24gb2YgdGhlIGFjdHVhbCBoZXVyaXN0aWMuIFlvdSBtaWdodCBiZSBhYmxl
IHRvIHR1bmUgdGhhdAo+IGEgYml0IGlmIHlvdSdkIGJlIHNpZ25pZmljYW50bHkgaGFwcGllciB3
aXRoIGxlc3MgZnJlcXVlbnQKPiBpbnRlcnJ1cHRpb25zLCBvciBzb21ldGhpbmcgYWxvbmcgdGhv
c2UgbGluZXMuKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
