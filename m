Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E4BC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTCfPt9Qm8gUCJagjoj5HQQFVTHwQmlTFDHSdnNuSFw=; b=bxxjhhmuxEoJqO
	ks7eVdRxhxxKouOsZwy8j1YBQ+OxfmXew2FsCoHs5zmexoJDoQGjQ9cu/kNeJ+ZPI1KrkMLJNquvf
	+nihBW6KC96Gil0mt7zIih394C0dA+GUM5QVYQHWt64mpcdOAbf27cJCpn89mGaJ8xtfPL/eeeCyu
	FzJofciTmWqYRXBJ9B849v0oVlGuYHKsm+ul5wbRTovRJIFHAR8XxcIAQCYPBXU8Ed/I6n29Qyhfw
	TX8Od+eK1Mb/XbIjjdQCv0ogqrIF6DTxqJJKeb9DHoL1EPMLv+29AJmSb4F5KwRDZXkaSVXMxzZvV
	YhpHH0XKzWETFO0g+tgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q024j-00Gbdy-31;
	Fri, 19 May 2023 15:31:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q024g-00GbcZ-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 15:31:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DD07658C7
	for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 15:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF19C433AF
	for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684510280;
	bh=LutjUTbti1HeouoWBzB8ND73lnDjx3NcWfIcsLJYYmE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AMOrYWyg6OaQgH8gau7KnuU4B6CV3WiREPoOkTofba8Ayky0BGRYjhyYI5+LPgZCW
	 /DgDUYjjMBpUb6Cwvq7Zy/cxeTkGoqqSf4h1ZjSukKkeXgA/PeioMuH0QjQruIy0rx
	 7tgoV8VvhgDD7TtuIyYXpJc2nq31k5JaFjBitZE5JZkN1Ib284TjJOzHJ8SYPIYwzE
	 M6awRaz4TZ9wlqW+Pr0G/LYSHJ6QYVnsBqCSbspjFq7fesfynNVv8A03szXsDrwvLH
	 FulyfmvZMoetpAh9/pSJrcck6HxdTI39sqToiibJ7SizImJ4ojCQ72NtkZc2OqmiuJ
	 /cHfqjzhIxebg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-510d8ead2f1so4510225a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 08:31:20 -0700 (PDT)
X-Gm-Message-State: AC+VfDyfpubw4Lkl6W7AUKzAdDXDh7os+xF6XJqSIJn3RhxL27+mNRfg
	s0/Lfp1DzupUrjoRiwMkNhZvpgh9kexpyFmrirw=
X-Google-Smtp-Source: ACHHUZ6F1jwrc+hZPGVqYVC1J42+KZlyJm5HnfvuwPB72oAO64/VLWKkZr5Pm+u+bUmC5e6fQM9QCiYbzPCxU4SEr7c=
X-Received: by 2002:a05:6402:1217:b0:50b:faa1:e1d5 with SMTP id
 c23-20020a056402121700b0050bfaa1e1d5mr1842334edw.39.1684510278533; Fri, 19
 May 2023 08:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-24855381-7da8-4c77-bcaf-a3a53c8cb38b@palmer-ri-x1c9> <556bebad-3150-4fd5-8725-e4973fd6edd1@app.fastmail.com>
In-Reply-To: <556bebad-3150-4fd5-8725-e4973fd6edd1@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 19 May 2023 23:31:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRO8Qcz2EXz-ZAczpTj=Lm=GPO-UQMPqCRdqrfjg8sXbA@mail.gmail.com>
Message-ID: <CAJF2gTRO8Qcz2EXz-ZAczpTj=Lm=GPO-UQMPqCRdqrfjg8sXbA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/22] riscv: s64ilp32: Running 32-bit Linux kernel on
 64-bit supervisor mode
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Jisheng Zhang <jszhang@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mike Rapoport <rppt@kernel.org>, Anup Patel <anup@brainfault.org>, 
	shihua@iscas.ac.cn, jiawei@iscas.ac.cn, liweiwei@iscas.ac.cn, 
	luxufan@iscas.ac.cn, chunyu@iscas.ac.cn, tsu.yubo@gmail.com, wefu@redhat.com, 
	wangjunqiang@iscas.ac.cn, kito.cheng@sifive.com, 
	Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Jonathan Corbet <corbet@lwn.net>, wuwei2016@iscas.ac.cn, 
	Jessica Clarke <jrtc27@jrtc27.com>, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_083122_620806_95F32BF2 
X-CRM114-Status: GOOD (  37.33  )
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

T24gRnJpLCBNYXkgMTksIDIwMjMgYXQgMjoyOeKAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMTgsIDIwMjMsIGF0IDE3OjM4LCBQYWxtZXIg
RGFiYmVsdCB3cm90ZToKPiA+IE9uIFRodSwgMTggTWF5IDIwMjMgMDY6MDk6NTEgUERUICgtMDcw
MCksIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4+IEZyb206IEd1byBSZW4gPGd1b3JlbkBs
aW51eC5hbGliYWJhLmNvbT4KPiA+Pgo+ID4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgczY0aWxw
MzIgc3VwcG9ydCB0byByaXNjdi4gVGhlIHRlcm0gczY0aWxwMzIKPiA+PiBtZWFucyBzbW9kZS14
bGVuPTY0IGFuZCAtbWFiaT1pbHAzMiAoaW50cywgbG9uZ3MsIGFuZCBwb2ludGVycyBhcmUgYWxs
Cj4gPj4gMzItYml0KSwgaS5lLiwgcnVubmluZyAzMi1iaXQgTGludXgga2VybmVsIG9uIHB1cmUg
NjQtYml0IHN1cGVydmlzb3IKPiA+PiBtb2RlLiBUaGVyZSBoYXZlIGJlZW4gbWFueSA2NGlscDMy
IGFiaXMgZXhpc3RpbmcsIHN1Y2ggYXMgbWlwcy1uMzIgWzFdLAo+ID4+IGFybS1hYXJjaDY0aWxw
MzIgWzJdLCBhbmQgeDg2LXgzMiBbM10sIGJ1dCB0aGV5IGFyZSBhbGwgYWJvdXQgdXNlcnNwYWNl
Lgo+ID4+IFRodXMsIHRoaXMgc2hvdWxkIGJlIHRoZSBmaXJzdCB0aW1lIHJ1bm5pbmcgYSAzMi1i
aXQgTGludXgga2VybmVsIHdpdGgKPiA+PiB0aGUgNjRpbHAzMiBBQkkgYXQgc3VwZXJ2aXNvciBt
b2RlIChJZiBub3QsIGNvcnJlY3QgbWUpLgo+ID4KPiA+IERvZXMgYW55b25lIGFjdHVhbGx5IHdh
bnQgdGhpcz8gIEF0IGEgYmFyZSBtaW5pbXVtIHdlJ2QgbmVlZCB0byBhZGQgaXQKPiA+IHRvIHRo
ZSBwc0FCSSwgd2hpY2ggd291bGQgcHJlc3VtYWJseSBhbHNvIGJlIHJlcXVpcmVkIG9uIHRoZSBj
b21waWxlcgo+ID4gc2lkZSBvZiB0aGluZ3MuCj4gPgo+ID4gSXQncyBub3QgZXZlbiBjbGVhciBh
bnlvbmUgd2FudHMgcnY2NC9pbHAzMiBpbiB1c2Vyc3BhY2UsIHRoZSBrZXJuZWwKPiA+IHNlZW1z
IGxpa2UgaXQnZCBiZSBldmVuIGxlc3Mgd2lkZWx5IHVzZWQuCj4KPiBXZSBoYXZlIGhhZCBsb25n
IGRpc2N1c3Npb25zIGFib3V0IHN1cHBvcnRpbmcgaWxwMzIgdXNlcnNwYWNlIG9uCj4gYXJtNjQs
IGFuZCBJIHRoaW5rIGFsbW9zdCBldmVyeW9uZSBpcyBnbGFkIHdlIG5ldmVyIG1lcmdlZCBpdCBp
bnRvCj4gdGhlIG1haW5saW5lIGtlcm5lbCwgc28gd2UgZG9uJ3QgaGF2ZSB0byB3b3JyeSBhYm91
dCBzdXBwb3J0aW5nIGl0Cj4gaW4gdGhlIGZ1dHVyZS4gVGhlIGNvc3Qgb2Ygc3VwcG9ydGluZyBh
biBleHRyYSB1c2VyIHNwYWNlIEFCSQo+IGlzIGh1Z2UsIGFuZCBJJ20gc3VyZSB5b3UgZG9uJ3Qg
d2FudCB0byBnbyB0aGVyZS4gVGhlIG90aGVyIHR3bwo+IGNpdGVkIGV4YW1wbGVzIChtaXBzLW4z
MiBhbmQgeDg2LXgzMikgYXJlIHByZXR0eSBtdWNoIHVudXNlZCBub3cKPiBhcyB3ZWxsLCBidXQg
c3RpbGwgaGF2ZSBhIG1haW50ZW5hbmNlIGJ1cmRlbiB1bnRpbCB0aGV5IGNhbiBmaW5hbGx5Cj4g
Z2V0IHJlbW92ZWQuCj4KPiBJZiBmb3Igc29tZSBjcmF6eSByZWFzb24geW91J2Qgc3RpbGwgd2Fu
dCB0aGUgNjRpbHAzMiBBQkkgaW4gdXNlcgo+IHNwYWNlLCBydW5uaW5nIHRoZSBrZXJuZWwgdGhp
cyB3YXkgaXMgcHJvYmFibHkgc3RpbGwgYSBiYWQgaWRlYSwKPiBidXQgdGhhdCBvbmUgaXMgbGVz
cyBjbGVhci4gVGhlcmUgaXMgY2xlYXJseSBhIHNtYWxsIG1lbW9yeQo+IHBlbmFsdHkgb2YgcnVu
bmluZyBhIDY0LWJpdCBrZXJuZWwgZm9yIGxhcmdlciBkYXRhIHN0cnVjdHVyZXMKPiAocGFnZSwg
aW5vZGUsIHRhc2tfc3RydWN0LCAuLi4pIGFuZCB2bWxpbnV4LCBhbmQgdGhlcmUgaXMgbm8KSSBk
b24ndCB0aGluayBpdCdzIGEgc21hbGwgbWVtb3J5IHBlbmFsdHksIG91ciBtZWFzdXJlbWVudCBp
cyBhYm91dAoxNiUgd2l0aCBkZWZjb25maWcsIHNlZSAiV2h5IDMyLWJpdCBMaW51eD8iIHNlY3Rp
b24uClRoaXMgcGF0Y2ggc2VyaWVzIGRvZXNuJ3QgYWRkIDY0aWxwMzIgdXNlcnNwYWNlIGFiaSwg
YnV0IGl0IHNlZW1zIHlvdQphbHNvIGRvbid0IGxpa2UgdG8gcnVuIDMyLWJpdCBMaW51eCBrZXJu
ZWwgb24gNjQtYml0IGhhcmR3YXJlLCByaWdodD8KClRoZSBtb3RpdmF0aW9uIG9mIHM2NGlscDMy
IChydW5uaW5nIDMyLWJpdCBMaW51eCBrZXJuZWwgb24gNjQtYml0IHMtbW9kZSk6CiAtIFRoZSB0
YXJnZXQgaGFyZHdhcmUgKENhbmFhbiBLZW5kcnl0ZSBrMjMwKSBvbmx5IHN1cHBvcnRzIE1YTD02
NCwKU1hMPTY0LCBVWEw9NjQvMzIuCiAtIFRoZSA2NC1iaXQgTGludXggKyBjb21wYXQgMzItYml0
IGFwcCBjYW4ndCBzYXRpc2Z5IHRoZSA2NC8xMjhNQiBzY2VuYXJpb3MuCgo+IGh1Z2UgYWRkaXRp
b25hbCBtYWludGVuYW5jZSBjb3N0IG9uIHRvcCBvZiB0aGUgQUJJIGl0c2VsZgo+IHRoYXQgeW91
J2QgbmVlZCBlaXRoZXIgd2F5LCBidXQgdXNpbmcgYSA2NC1iaXQgYWRkcmVzcyBzcGFjZQo+IGlu
IHRoZSBrZXJuZWwgaGFzIHNvbWUgaW1wb3J0YW50IGFkdmFudGFnZXMgZXZlbiB3aGVuIHJ1bm5p
bmcKPiAzMi1iaXQgdXNlcmxhbmQ6IHByb2Nlc3NlcyBjYW4gdXNlIHRoZSBlbnRpcmUgNEdCIHZp
cnR1YWwKPiBzcGFjZSwgd2hpbGUgdGhlIGtlcm5lbCBjYW4gYWRkcmVzcyBtb3JlIHRoYW4gNzY4
TUIgb2YgbG93bWVtLAo+IGFuZCBLQVNMUiBoYXMgbW9yZSBiaXRzIHRvIHdvcmsgd2l0aCBmb3Ig
cmFuZG9taXphdGlvbi4gT24KPiBSSVNDViwgc29tZSBhZGRpdGlvbmFsIGZlYXR1cmVzIChWTUFQ
X1NUQUNLLCBLQVNBTiwgS0ZFTkNFLAo+IC4uLikgZGVwZW5kIG9uIDY0LWJpdCBrZXJuZWxzIGV2
ZW4gdGhvdWdoIHRoZXkgZG9uJ3QKPiBzdHJpY3RseSBuZWVkIHRoYXQuCgpJIGFncmVlIHRoYXQg
dGhlIDY0LWJpdCBsaW51eCBrZXJuZWwgaGFzIG1vcmUgZnVuY3Rpb25hbGl0aWVzLCBidXQ6CiAt
IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGxpbnV4IG9uIGEgNjQvMTI4TUIgU29DPyBDb3VsZCBp
dCBiZQphZmZvcmRhYmxlIHRvIFZNQVBfU1RBQ0ssIEtBU0FOLCBLRkVOQ0U/CiAtIEkgdGhpbmsg
MzItYml0IExpbnV4ICYgUlRPUyBoYXZlIG1vbm9wb2xpemVkIHRoaXMgbWFya2V0ICg2NC8xMjhN
QgpzY2VuYXJpb3MpLCByaWdodD8KCj4KPiAgICAgIEFybmQKCgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
