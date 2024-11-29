Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540C1D70E01
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 00:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/s+SGmhCJEG8T8CTOxEXYTcDoVITH/ZtOoZWsxNBYps=; b=Ovnn2d6Ce1wX8U
	idDz+1k8R5VrVj4PyawmOuM3lZiYLvijvgJr75JP7Et6HUhMEge2fhVd2mh0dZvEqJbtdABKhiTLN
	oXGMNrWps9gibjDvvob+m6Ng3+5pAOOBT86rAcXjd0MiuvKdvYTHMwA/44HT6VPoZe89I0vbZL6f0
	IHAQK8P/1nQbYAh0tfz86xnZC1qnXdC40qaYP5XrimWt7Yeknn/EAtgQvmo3WR1eRSEuww1FJmZxj
	oEqPsgTjhCVzRzkTqJeMbuVUcwFrNJh0jkUPvbx6qmet3EmiUhPyp48cJLC+9mzDAW/TN5LAY0+qD
	F1jNLHt/Vdzar1Ny0jjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGpI6-0000000GeI1-1GXs;
	Fri, 29 Nov 2024 00:55:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGpI2-0000000GeHB-3rlJ
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 00:55:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87A505C5749
	for <linux-riscv@lists.infradead.org>; Fri, 29 Nov 2024 00:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7EBC4CECE
	for <linux-riscv@lists.infradead.org>; Fri, 29 Nov 2024 00:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732841721;
	bh=YGjyotpBwbfXL17yErbP8SKQ1ul5skOnjRIYm1O4IH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gENkKgIOX7riDYV3T6iW2kd/jBwqv61hgm7LJrq75Q6iW4MCw3yGaFRiOvNHHhcrD
	 b3lRs6VfbX0rOxbQpfoxsuUaHqrnqmEt6INJJ1NDdzD+45UzP49A7Nh/Yvhuaec6qa
	 bCekcDsobthnKyaZfM0xh6byzNUKwJOSSGJ2x0AAg2yWzKC11ejaUkC2/QeFL6gS9y
	 dA4H1QOw35YhMb4loHKJrq7b78UZ3ctaF8WwGuE3LeGeE4QjeKRtS1ihYB/I7RZgwV
	 8tU74v9UjvLWw+Xpj/+sEplaFI0Ng5qnYdY7/+SN6q65NTWsqGhWttFtlEpDpz7AN2
	 Ymlh4Y2+7zHsA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa545dc7105so179256766b.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 16:55:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVi0ylbmckae9v52RIDT9nqUniDCDZDILQqWIA2KuzRLzXq9OV9SlB7Bpv8l/V2utHM1hf17MxB080BhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGhEadoUO8mXETcZsTiwLnyMK4HDr2/uS/lnA+pjJuXyrn8PVa
	U96RzsqR+tMVtEfdKHa6cY7Gj0jRPu5MvwiapOzVGkCt/0F+XhoRygNuwbDBDdwegTl31ctqJsm
	IoVbe+LJpPy0JBXlIRhKVate8Z5w=
X-Google-Smtp-Source: AGHT+IFeDlqZOVMgOL8009xKZgLenXig1Ow6dpsDX7zAwO6rse3Q8pTl7jvVHnF/kSyfxU9JR7kitB7iCUYlXhcfUlE=
X-Received: by 2002:a17:906:6a27:b0:aa5:47f8:b923 with SMTP id
 a640c23a62f3a-aa58109a565mr781155366b.61.1732841719820; Thu, 28 Nov 2024
 16:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
 <20241103145153.105097-14-alexghiti@rivosinc.com> <20241128-whoever-wildfire-2a3110c5fd46@wendy>
 <20241128134135.GA3460@willie-the-truck> <20241128-uncivil-removed-4e105d1397c9@wendy>
 <90533aa9-186a-4f75-b3c5-d93d6682056b@ghiti.fr> <20241128-goggles-laundry-d94c23ab39a4@spud>
In-Reply-To: <20241128-goggles-laundry-d94c23ab39a4@spud>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 29 Nov 2024 08:55:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTST0kduYpuqd4mX0byetWMRJT-AAyH0GGiaysZG64Byhw@mail.gmail.com>
Message-ID: <CAJF2gTST0kduYpuqd4mX0byetWMRJT-AAyH0GGiaysZG64Byhw@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
	Will Deacon <will@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andrea Parri <parri.andrea@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_165523_051450_AFED5212 
X-CRM114-Status: GOOD (  32.93  )
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

T24gRnJpLCBOb3YgMjksIDIwMjQgYXQgMTI6MTnigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMjgsIDIwMjQgYXQgMDM6NTA6MDlQTSAr
MDEwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gT24gMjgvMTEvMjAyNCAxNToxNCwgQ29u
b3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBPbiBUaHUsIE5vdiAyOCwgMjAyNCBhdCAwMTo0MTozNlBN
ICswMDAwLCBXaWxsIERlYWNvbiB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE5vdiAyOCwgMjAyNCBh
dCAxMjo1Njo1NVBNICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+ID4gPiBPbiBTdW4s
IE5vdiAwMywgMjAyNCBhdCAwMzo1MTo1M1BNICswMTAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6
Cj4gPiA+ID4gPiA+IEluIG9yZGVyIHRvIHByb2R1Y2UgYSBnZW5lcmljIGtlcm5lbCwgYSB1c2Vy
IGNhbiBzZWxlY3QKPiA+ID4gPiA+ID4gQ09ORklHX0NPTUJPX1NQSU5MT0NLUyB3aGljaCB3aWxs
IGZhbGxiYWNrIGF0IHJ1bnRpbWUgdG8gdGhlIHRpY2tldAo+ID4gPiA+ID4gPiBzcGlubG9jayBp
bXBsZW1lbnRhdGlvbiBpZiBaYWJoYSBvciBaaWNjcnNlIGFyZSBub3QgcHJlc2VudC4KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gTm90ZSB0aGF0IHdlIGNhbid0IHVzZSBhbHRlcm5hdGl2ZXMgaGVy
ZSBiZWNhdXNlIHRoZSBkaXNjb3Zlcnkgb2YKPiA+ID4gPiA+ID4gZXh0ZW5zaW9ucyBpcyBkb25l
IHRvbyBsYXRlIGFuZCB3ZSBuZWVkIHRvIHN0YXJ0IHdpdGggdGhlIHFzcGlubG9jawo+ID4gPiA+
ID4gPiBpbXBsZW1lbnRhdGlvbiBiZWNhdXNlIHRoZSB0aWNrZXQgc3BpbmxvY2sgaW1wbGVtZW50
YXRpb24gd291bGQgcG9sbHV0ZQo+ID4gPiA+ID4gPiB0aGUgc3BpbmxvY2sgdmFsdWUsIHNvIGxl
dCdzIHVzZSBzdGF0aWMga2V5cy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhpcyBpcyBsYXJn
ZWx5IGJhc2VkIG9uIEd1bydzIHdvcmsgYW5kIExlb25hcmRvIHJldmlld3MgYXQgWzFdLgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDIzMTIyNTEyNTg0Ny4yNzc4NjM4LTEtZ3VvcmVuQGtlcm5lbC5vcmcvIFsxXQo+ID4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPgo+ID4gPiA+ID4gVGhpcyBwYXRjaCAobm93IGNvbW1pdCBhYjgzNjQ3ZmFkYWUyICgicmlz
Y3Y6IEFkZCBxc3BpbmxvY2sgc3VwcG9ydCIpKQo+ID4gPiA+ID4gYnJlYWtzIGJvb3Qgb24gcG9s
YXJmaXJlIHNvYy4gSXQgZGllcyBiZWZvcmUgb3V0cHV0dGluZyBhbnl0aGluZyB0byB0aGUKPiA+
ID4gPiA+IGNvbnNvbGUuIE15IC5jb25maWcgaGFzOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICMgQ09O
RklHX1JJU0NWX1RJQ0tFVF9TUElOTE9DS1MgaXMgbm90IHNldAo+ID4gPiA+ID4gIyBDT05GSUdf
UklTQ1ZfUVVFVUVEX1NQSU5MT0NLUyBpcyBub3Qgc2V0Cj4gPiA+ID4gPiBDT05GSUdfUklTQ1Zf
Q09NQk9fU1BJTkxPQ0tTPXkKPiA+ID4gPiBJIHBvaW50ZWQgb3V0IHNvbWUgb2YgdGhlIGZyYWdp
bGl0eSBkdXJpbmcgcmV2aWV3Ogo+ID4gPiA+Cj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjQxMTExMTY0MjU5LkdBMjAwNDJAd2lsbGllLXRoZS10cnVjay8KPiA+ID4gPgo+
ID4gPiA+IHNvIEknbSBraW5kYSBzdXJwcmlzZWQgaXQgZ290IG1lcmdlZCB0YmggOi8KPiA+ID4g
TWF5YmUgaXQgY291bGQgYmUgcmV2ZXJ0ZWQgcmF0aGVyIHRoYW4gaGF2aW5nIGEgYnJva2VuIGJv
b3Qgd2l0aCB0aGUKPiA+ID4gZGVmYXVsdCBzZXR0aW5ncyBpbiAtcmMxLgo+ID4KPiA+Cj4gPiBO
byBuZWVkIHRvIHJ1c2ggYmVmb3JlIHdlIGtub3cgd2hhdCdzIGhhcHBlbmluZyxJIGd1ZXNzIHlv
dSBiaXNlY3RlZCB0byB0aGlzCj4gPiBjb21taXQgcmlnaHQ/Cj4KPiBUaGUgc3ltcHRvbSBpcyBh
IGZhaWx1cmUgdG8gYm9vdCwgd2l0aG91dCBhbnkgY29uc29sZSBvdXRwdXQsIG9mIGNvdXJzZQo+
IEkgYmlzZWN0ZWQgaXQgYmVmb3JlIGJsYW1pbmcgc29tZXRoaW5nIHNwZWNpZmljLiBCdXQgSSBk
b24ndCB0aGluayBpdCBpcwo+ICJydXNoaW5nIiBhcyBoYXZpbmcgLXJjMSBicm9rZW4gd2l0aCBh
biBvcHRpb24ncyBkZWZhdWx0IGlzIGEgbWFzc2l2ZSBwYWluCj4gaW4gdGhlIGFyc2Ugd2hlbiBp
dCBjb21lcyB0byB0ZXN0aW5nLgo+Cj4gPiBJIGRvbid0IGhhdmUgdGhpcyBzb2MsIHNvIGNhbiB5
b3UgcHJvdmlkZSAkc3R2YWwvJHNlcGMvJHNjYXVzZSwgYSBjb25maWcsIGEKPiA+IGtlcm5lbCwg
YW55dGhpbmc/Cj4KPiBJIGRvbid0IGhhdmUgdGhlIGZvcm1lciBjb3MgaXQgZGllZCBpbW1lZGlh
dGVseSBvbiBib290LiBjb25maWcgaXMKPiBhdHRhY2hlZC4gSXQgcmVwcm9kdWNlcyBpbiBRRU1V
IHNvIHlvdSBkb24ndCBuZWVkIGFueSBoYXJkd2FyZS4KSWYgUUVNVSBjb3VsZCByZXByb2R1Y2Us
IGNvdWxkIHlvdSBwcm92aWRlIGEgZG1lc2cgYnkgdGhlIGJlbG93IG1ldGhvZD8KClFlbXUgY21k
IGFwcGVuZDogLXMgLVMKcmVmOiBodHRwczovL3FlbXUtcHJvamVjdC5naXRsYWIuaW8vcWVtdS9z
eXN0ZW0vZ2RiLmh0bWwKCkNvbm5lY3QgZ2RiIGFuZCBpbiBjb25zb2xlOgoxLiBmaWxlIHZtbGlu
dXgKMi4gc291cmNlIC4vRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZHVtcC9nZGJtYWNyb3Mu
dHh0CjMuIGRtZXNnCgpUaGVuLCB3ZSBjb3VsZCBnZXQgdGhlIGtlcm5lbCdzIGVhcmx5IGJvb3Qg
bG9ncyBmcm9tIG1lbW9yeS4KCj4KPiA+IERvZXMgdGhlIHBvbGFyZmlyZSBzb2MgcHJvdmlkZSBa
aWNjcnNlPwo+Cj4gSSBkb24ndCB0aGluayB0aGF0IGlzIHJlbGV2YW50IGJlY2F1c2UgemljY3Jz
ZSBpcyBub3QgbGlzdGVkIGluIHRoZSBkdHMsCj4gc28gdGhlIGtlcm5lbCBzaG91bGQgbm90IGJl
IGFzc3VtaW5nIHRoYXQgTFIvU0MgaGFzIGEgZm9yd2FyZCBwcm9ncmVzcwo+IGd1YXJhbnRlZS4g
SXQncyBub3QgZXZlbiBnZXR0aW5nIGFzIGZhciBhcyByaXNjdl9zcGlubG9ja19pbml0KCkgZ2l2
ZW4KPiBzZXZlcmFsIHRoaW5ncyBiZWZvcmUgdGhhdCBzaG91bGQgYmUgZW1pdHRpbmcgbG9ncywg
c28gaXQgZG9lc24ndCBldmVuCj4gZ2V0IHRvIG1ha2UgYW55IGRlY2lzaW9ucyBhYm91dCBaaWNj
cnNlLgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
