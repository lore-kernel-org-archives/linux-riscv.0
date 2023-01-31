Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F451C54EAA
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 01:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5yBfmolkdYax5MNc+u9ugJWxDTVT4Tyjd/8Tu3fzDI=; b=rt9/mYo1KEYlab
	a7CunsDqHUJOyJXlUv+EE9VqyW/O4gQ92C58ma3ylVgHOt0kCadiuld6Lk0x7j2bFxjjW4zFQDyQ2
	AAOJZz1BWjYZ2FAToI9TMBJfQxFHUMuOsJ78ff5eZEwcv3IuxOXF1SfNjaqrVw0cCbW1ItJY2k8cL
	7w7ddLmjc1h2aghN7ki0UzlEwxpBHzGveWl3TLZ6mpYPAgeqG3tzxoMSwm1rwp+GVf293dque93EZ
	GQrnp+jgqmjo3dYQu6vwq8eufGxXsq2veO/f8pANDRviQ6Gc2so+ofduh6KD3BrxKoDM/o1m2hG91
	yTZpZRIemypIOVZ2G2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMf22-005xho-7k; Tue, 31 Jan 2023 01:01:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMf1w-005xgF-E9
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 01:01:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E176A61370
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 01:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5126FC433D2
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 01:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675126906;
	bh=UzLnPrMPazHKF5FDmXMINfM3VNFjMKPOrqYfwtwTj7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=utSkhiAjq8RYRL7YdBfRJSCvaSOoIDNzqdJVl7YbCvPAcCmeTtpQubvcXtjC5iS6q
	 bKQbhXEZu0v5netYKnh1kI+ICZ1mwukHKe4Y+HKXaw7e65E9Ch9fHnNRTptCix1zCQ
	 ySHqVqL7yqg+9o4eT0MTwsmjS/UXa2hdpoECnVxQdZaJikXjQdwMT+roXVZxGwEDWK
	 4KWdt29RJRqsjKxTlLjcaAjQzafQZnK72kadCoq4UmDRLWsHSbVi51BBxWcKZpdkX1
	 IAipht9OrRZeyUCoXrQ1VSpX6M/takynFv8fMckh1uqCirAV52IfS5ubfsV/ifxKG4
	 Lv72LILp2qYKg==
Received: by mail-ed1-f45.google.com with SMTP id v13so12871780eda.11
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 17:01:45 -0800 (PST)
X-Gm-Message-State: AFqh2kp15xamkZ3rDJ5fnVCkWx2CmU+9zUpF/4Wleq2YYkDhz+02Rji3
	23DCBAEWTyLnykZOk5a1z0qq9p00yRIXkpN9In8=
X-Google-Smtp-Source: AMrXdXsKBr0pwRj+GCNipEffTOOdYppyqly6yTeuyDvdDNL4THtiq0Fi+XdDzD4UtO4POv+Cj0RFjiCXIppquHzDlwY=
X-Received: by 2002:a05:6402:110e:b0:47f:55c8:ace2 with SMTP id
 u14-20020a056402110e00b0047f55c8ace2mr8986600edv.63.1675126903561; Mon, 30
 Jan 2023 17:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20230126161559.1467374-1-guoren@kernel.org> <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com> <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 31 Jan 2023 09:01:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
Message-ID: <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	mhiramat@kernel.org, conor.dooley@microchip.com, penberg@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_170148_591877_860046A5 
X-CRM114-Status: GOOD (  27.75  )
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

T24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgMTE6MjggUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JpdGVzOgo+
Cj4gPj4gSW4gdGhlIHNlcmllIG9mIFJJU0NWIE9QVFBST0JFUyBbMV0sIGl0IHBhdGNoZXMgYSBs
b25nLWp1bXAgaW5zdHJ1Y3Rpb25zIHBhaXIKPiA+PiBBVUlQQy9KQUxSIGluIGtlcm5lbCB0ZXh0
LCBzbyBpbiBvcmRlciB0byBlbnN1cmUgb3RoZXIgQ1BVcyBkb2VzIG5vdCBleGVjdXRlCj4gPj4g
aW4gdGhlIGluc3RydWN0aW9ucyB0aGF0IHdpbGwgYmUgbW9kaWZpZWQsIGl0IGlzIHN0aWxsIG5l
ZWQgdG8gc3RvcCBvdGhlciBDUFVzCj4gPj4gdmlhIHBhdGNoX3RleHQgQVBJLCBvciB5b3UgaGF2
ZSBhbnkgYmV0dGVyIHNvbHV0aW9uIHRvIGFjaGlldmUgdGhlIHB1cnBvc2U/Cj4gPiAgLSBUaGUg
c3RvcF9tYWNoaW5lIGlzIGFuIGV4cGVuc2l2ZSB3YXkgYWxsIGFyY2hpdGVjdHVyZXMgc2hvdWxk
Cj4gPiBhdm9pZCwgYW5kIHlvdSBjb3VsZCBrZWVwIHRoYXQgaW4geW91ciBPUFRQUk9CRVMgaW1w
bGVtZW50YXRpb24gZmlsZXMKPiA+IHdpdGggc3RhdGljIGZ1bmN0aW9ucy4KPiA+ICAtIFRoZSBz
dG9wX21hY2hpbmUgY291bGRuJ3Qgd29yayB3aXRoIFBSRUVNUFRJT04sIHNvIHlvdXIKPiA+IGlt
cGxlbWVudGF0aW9uIG5lZWRzIHRvIHdvcmsgd2l0aCAhUFJFRU1QVElPTi4KPgo+IC4uLmFuZCBz
dG9wX21hY2hpbmUoKSB3aXRoICFQUkVFTVBUSU9OIGlzIGJyb2tlbiBhcyB3ZWxsLCB3aGVuIHlv
dSdyZQo+IHJlcGxhY2luZyBtdWx0aXBsZSBpbnN0cnVjdGlvbnMgKHNlZSBNYXJrJ3MgcG9zdCBh
dCBbMV0pLiBUaGUKPiBzdG9wX21hY2hpbmUoKSBkYW5jZSBtaWdodCB3b3JrIHdoZW4geW91J3Jl
IHJlcGxhY2luZyAqb25lKiBpbnN0cnVjdGlvbiwKPiBub3QgbXVsdGlwbGUgYXMgaW4gdGhlIFJJ
U0MtViBjYXNlLiBJJ2xsIGV4cGFuZCBvbiB0aGlzIGluIGEgY29tbWVudCBpbgo+IHRoZSBPUFRQ
Uk9CRVMgdjYgc2VyaWVzLgo+Cj4gPj4gPiAgc3RhdGljIHZvaWQgX19rcHJvYmVzIGFyY2hfcHJl
cGFyZV9zaW11bGF0ZShzdHJ1Y3Qga3Byb2JlICpwKQo+ID4+ID4gQEAgLTExNCwxNiArMTIwLDIz
IEBAIHZvaWQgKmFsbG9jX2luc25fcGFnZSh2b2lkKQo+ID4+ID4gIC8qIGluc3RhbGwgYnJlYWtw
b2ludCBpbiB0ZXh0ICovCj4gPj4gPiAgdm9pZCBfX2twcm9iZXMgYXJjaF9hcm1fa3Byb2JlKHN0
cnVjdCBrcHJvYmUgKnApCj4gPj4gPiAgewo+ID4+ID4gLSAgICAgaWYgKChwLT5vcGNvZGUgJiBf
X0lOU05fTEVOR1RIX01BU0spID09IF9fSU5TTl9MRU5HVEhfMzIpCj4gPj4gPiAtICAgICAgICAg
ICAgIHBhdGNoX3RleHQocC0+YWRkciwgX19CVUdfSU5TTl8zMik7Cj4gPj4gPiAtICAgICBlbHNl
Cj4gPj4gPiAtICAgICAgICAgICAgIHBhdGNoX3RleHQocC0+YWRkciwgX19CVUdfSU5TTl8xNik7
Cj4gPj4gPiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfQwo+ID4+ID4gKyAgICAgdTMyIG9wY29k
ZSA9IF9fQlVHX0lOU05fMTY7Cj4gPj4gPiArI2Vsc2UKPiA+PiA+ICsgICAgIHUzMiBvcGNvZGUg
PSBfX0JVR19JTlNOXzMyOwo+ID4+ID4gKyNlbmRpZgo+ID4+ID4gKyAgICAgcGF0Y2hfdGV4dF9u
b3N5bmMocC0+YWRkciwgJm9wY29kZSwgR0VUX0lOU05fTEVOR1RIKG9wY29kZSkpOwo+ID4+Cj4g
Pj4gU291bmRzIGdvb2QsIGJ1dCBpdCB3aWxsIGxlYXZlIHNvbWUgUlZJIGluc3RydWN0aW9uIHRy
dW5jYXRlZCBpbiBrZXJuZWwgdGV4dCwKPiA+PiBpIGRvdWJ0IGtlcm5lbCBiZWhhdmlvciBkZXBl
bmRzIG9uIHRoZSByZXN0IG9mIHRoZSB0cnVuY2F0ZWQgaW5zdHJ1Y3Rpb24sIHdlbGwsCj4gPj4g
aXQgbmVlZHMgbW9yZSBzdHJpY3QgdGVzdGluZyB0byBwcm92ZSBteSBjb25jZXJuIDopCj4gPiBJ
IGRvIHRoaXMgb24gcHVycG9zZSwgYW5kIGl0IGRvZXNuJ3QgY2F1c2UgYW55IHByb2JsZW1zLiBE
b24ndCB3b3JyeTsKPiA+IElGVSBodyBtdXN0IGVuZm9yY2UgdGhlIGZldGNoIHNlcXVlbmNlLCBh
bmQgdGhlcmUgaXMgbm8gd2F5IHRvIGV4ZWN1dGUKPiA+IGJyb2tlbiBpbnN0cnVjdGlvbnMgZXZl
biBpbiB0aGUgc3BlY3VsYXRpdmUgZXhlY3V0aW9uIHBhdGguCj4KPiBUaGlzIGlzIHN0cmV0Y2hp
bmcgcmVhbGl0eSBhIGJpdCBtdWNoLiBBUk12OCwgZS5nLiwgaGFzIGEgY2hhcHRlciBpbiB0aGUK
PiBBcm0gQVJNIFsyXSBBcHBlbmRpeCBCICJDb25jdXJyZW50IG1vZGlmaWNhdGlvbiBhbmQgZXhl
Y3V0aW9uIG9mCj4gaW5zdHJ1Y3Rpb25zIiAoQ01PRFgpLiAqU29tZSogaW5zdHJ1Y3Rpb25zIGNh
biBiZSByZXBsYWNlZCBjb25jdXJyZW50bHksCj4gYW5kIG90aGVycyBjYW5ub3Qgd2l0aG91dCBj
YXV0aW9uLiBBc3N1bWluZyB0aGF0IHRoYXQgYWxsIFJJU0MtVgo+IGltcGxlbWVudGF0aW9ucyBj
YW4sIGlzIGEgc3RyZXRjaC4gUklTQy1WIGhhc24ndCBldmVuIHNwZWNpZmllZCB0aGUKPiBiZWhh
dmlvciBvZiBDTU9EWCAod2hpY2ggaXMgcHJvYmxlbWF0aWMpLgpIZXJlIHdlIG9ubHkgdXNlIG9u
ZSBzdy9zaCBpbnN0cnVjdGlvbiB0byBzdG9yZSBhIDMyYml0LzE2Yml0IGFsaWduZWQgZWxlbWVu
dDoKCklOU05fMCA8LSBlYnJlYWsgKDE2Yml0LzMyYml0IGFsaWduZWQpCklOU05fMQpJTlNOXzIK
ClRoZSBlYnJlYWsgd291bGQgY2F1c2UgYW4gZXhjZXB0aW9uIHdoaWNoIGltcGxpZXMgYSBodWdl
IGZlbmNlIGhlcmUuCk5vIG1hY2hpbmUgY291bGQgZ2l2ZSBhIHNwZWN1bGF0aXZlIGV4ZWN1dGlv
biBmb3IgdGhlIGVicmVhayBwYXRoLgoKPgo+IElmIGFueXRoaW5nIGl0IHdvdWxkIGJlIG1vcmUg
bGlrZWx5IHRoYXQgdGhlIGV4aXN0aW5nCj4gInN0b3BfbWFjaGluZSgpLXRvLXJlcGxhY2Utd2l0
aC1lYnJlYWsiIHdvcmtzIChhZ2FpbiwgcmVwbGFjaW5nIG9uZQo+IGluc3RydWN0aW9uIGRvZXMg
bm90IGhhdmUgdGhlICFQUkVFTVBUSU9OIGlzc3VlcykuIFRoZW4gYWdhaW4sIG5vIHNwZWMsCj4g
c28gbW9zdGx5IGd1ZXNzaW5nIGZyb20gbXkgc2lkZS4gOi0oCj4KPiBPaCwgYnV0IHRoZSBleGlz
dGluZyAiZWJyZWFrIHJlcGxhY2UiIG1pZ2h0IGJlIGJyb2tlbiBsaWtlIFszXS4KPgo+Cj4gQmrD
tnJuCj4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9ZNyUyRjZB
dFg1WDArNXFGNllARlZGRjc3UzBRMDVOLwo+IFsyXSBodHRwczovL2RldmVsb3Blci5hcm0uY29t
L2RvY3VtZW50YXRpb24vZGRpMDQ4Ny9sYXRlc3QKPiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyMzAxMjYxNzA2MDcuMTQ4OTE0MS0yLWd1b3JlbkBrZXJuZWwub3Jn
LwoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
