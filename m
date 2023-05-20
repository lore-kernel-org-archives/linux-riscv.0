Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89034C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 01:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cg1tTbqL7dK8+LzgHELqc0IE6zFR57S6uPKgdPepgig=; b=kusFWUeuT1gRTs
	nNjgVWomdLj27l/pLbOfMvjtc3XgLa/VBDQ8eTAA9Y11lNC/L+E5d3RHyoSx1yluFln6UOZeBAPvg
	jDMnFJTBbi6PJKbGd2tzqRpdNjL/TcyhUHLz5FiHNE1F44b8ROEP/xcvvJDF38FE3kB+IDKGuR+p6
	3MUv4FT12QA0KHczGzzWTScGLlCSeKAX4q8f71bGgrFiBvlrh5x5UVXyA8foXkkVk/uNa38mamnQC
	Y+eTnPesnsmY/DvPcfsOM655dDMXd2ooGOWpCCsyDKVI/EchEK8dPgL2ORvtRt7F9ksUNN5HXF42j
	llc4j4Gvu4icTWD2hfTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0BdY-000Oy3-13;
	Sat, 20 May 2023 01:44:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0BdT-000OxI-0D
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 01:43:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98CAF64A14
	for <linux-riscv@lists.infradead.org>; Sat, 20 May 2023 01:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EEFC433A0
	for <linux-riscv@lists.infradead.org>; Sat, 20 May 2023 01:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684547034;
	bh=/MFAlDt0wtJT6ilnMT0hH/mEXV8rXc92ftjgCpnLA3s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h2zoj4WIIqf1y3gDpPN1FD5eTvZAhQ2NxcOcF1MU4+K6WRIwYZbzgs+1AdWY9SMkt
	 wmEihANFP8MzHHECEX5XQbs+m0HfAOKNAJcTjzlf58vC1TLsrwiF8R9Whtv74tKgXo
	 CShtNmh9yiGjbQ50e8vbMGMSuHGvLub5YQj4tIiCJQqg3g7pJ9KAtSg0CBFoXMJnbk
	 2JY8odcEr+nWrPXZJx8o4WfGqdOWLJ08lxRtiBj6KH+uVOlkggPTR4CR97VX/NWxBX
	 7kZNkLOY0+ms0YM0a9r1II1vyBiBjN7OK/BxBSDo7ecYiRPp39UOsDf7XZFiCI52Fw
	 YtkjHSYN4Y9FA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50bcb4a81ceso6843002a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 18:43:53 -0700 (PDT)
X-Gm-Message-State: AC+VfDzPKYi/CtoNGhzjYpdPBYLoOUUlNBpGoFL2r7u06p4fD9YHK8G5
	48lq3VKO5ceZiBEBjYjXRBtLaAIdvhuEBbGQNE4=
X-Google-Smtp-Source: ACHHUZ7NXAqlZZPtIfnAbts8fbQ84+TJlZoNY4/JP72g+NSV4DhtWHHrkOiBofCFGBDO+RuN07qx8nKyurA8K30+ZxE=
X-Received: by 2002:a17:906:a143:b0:960:f1a6:6a12 with SMTP id
 bu3-20020a170906a14300b00960f1a66a12mr3138956ejb.55.1684547032269; Fri, 19
 May 2023 18:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-24855381-7da8-4c77-bcaf-a3a53c8cb38b@palmer-ri-x1c9>
 <556bebad-3150-4fd5-8725-e4973fd6edd1@app.fastmail.com> <CAJF2gTRO8Qcz2EXz-ZAczpTj=Lm=GPO-UQMPqCRdqrfjg8sXbA@mail.gmail.com>
 <a9fcf1ad-a387-42a7-957a-e5a6a36fb3d7@app.fastmail.com>
In-Reply-To: <a9fcf1ad-a387-42a7-957a-e5a6a36fb3d7@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 20 May 2023 09:43:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRCW7h+PXz4JnNJVQ4cEEnNkcMfy8BUgGXuPZXJV6Q+Tg@mail.gmail.com>
Message-ID: <CAJF2gTRCW7h+PXz4JnNJVQ4cEEnNkcMfy8BUgGXuPZXJV6Q+Tg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230519_184355_206617_8335C634 
X-CRM114-Status: GOOD (  45.96  )
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

T24gU2F0LCBNYXkgMjAsIDIwMjMgYXQgMTI6NTTigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDE5LCAyMDIzLCBhdCAxNzozMSwgR3VvIFJl
biB3cm90ZToKPiA+IE9uIEZyaSwgTWF5IDE5LCAyMDIzIGF0IDI6MjnigK9BTSBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPiA+PiBPbiBUaHUsIE1heSAxOCwgMjAyMywgYXQg
MTc6MzgsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+ID4+ID4gT24gVGh1LCAxOCBNYXkgMjAyMyAw
NjowOTo1MSBQRFQgKC0wNzAwKSwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPj4KPiA+PiBJ
ZiBmb3Igc29tZSBjcmF6eSByZWFzb24geW91J2Qgc3RpbGwgd2FudCB0aGUgNjRpbHAzMiBBQkkg
aW4gdXNlcgo+ID4+IHNwYWNlLCBydW5uaW5nIHRoZSBrZXJuZWwgdGhpcyB3YXkgaXMgcHJvYmFi
bHkgc3RpbGwgYSBiYWQgaWRlYSwKPiA+PiBidXQgdGhhdCBvbmUgaXMgbGVzcyBjbGVhci4gVGhl
cmUgaXMgY2xlYXJseSBhIHNtYWxsIG1lbW9yeQo+ID4+IHBlbmFsdHkgb2YgcnVubmluZyBhIDY0
LWJpdCBrZXJuZWwgZm9yIGxhcmdlciBkYXRhIHN0cnVjdHVyZXMKPiA+PiAocGFnZSwgaW5vZGUs
IHRhc2tfc3RydWN0LCAuLi4pIGFuZCB2bWxpbnV4LCBhbmQgdGhlcmUgaXMgbm8KPiA+IEkgZG9u
J3QgdGhpbmsgaXQncyBhIHNtYWxsIG1lbW9yeSBwZW5hbHR5LCBvdXIgbWVhc3VyZW1lbnQgaXMg
YWJvdXQKPiA+IDE2JSB3aXRoIGRlZmNvbmZpZywgc2VlICJXaHkgMzItYml0IExpbnV4PyIgc2Vj
dGlvbi4KPiA+Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBkb2Vzbid0IGFkZCA2NGlscDMyIHVzZXJz
cGFjZSBhYmksIGJ1dCBpdCBzZWVtcyB5b3UKPiA+IGFsc28gZG9uJ3QgbGlrZSB0byBydW4gMzIt
Yml0IExpbnV4IGtlcm5lbCBvbiA2NC1iaXQgaGFyZHdhcmUsIHJpZ2h0Pwo+Cj4gT2ssIEknbSBz
b3JyeSBmb3IgbWlzc2luZyB0aGUgaW1wb3J0YW50IGJpdCBoZXJlLiBTbyBpZiB0aGlzIGNhbgo+
IHN0aWxsIHVzZSB0aGUgbm9ybWFsIDMyLWJpdCB1c2VyIHNwYWNlLCB0aGUgY29zdCBvZiB0aGlz
IHBhdGNoIHNldAo+IGlzIG5vdCBodWdlLCBhbmQgaXQncyBzb21ldGhpbmcgdGhhdCBjYW4gYmUg
YmVuZWZpY2lhbCBpbiBhIGZldwo+IGNhc2VzLCB0aG91Z2ggSSBzdXNwZWN0IG1vc3QgdXNlcnMg
YXJlIHN0aWxsIGJldHRlciBvZmYgcnVubmluZwo+IDY0LWJpdCBrZXJuZWxzLgo+Cj4gPiBUaGUg
bW90aXZhdGlvbiBvZiBzNjRpbHAzMiAocnVubmluZyAzMi1iaXQgTGludXgga2VybmVsIG9uIDY0
LWJpdCBzLW1vZGUpOgo+ID4gIC0gVGhlIHRhcmdldCBoYXJkd2FyZSAoQ2FuYWFuIEtlbmRyeXRl
IGsyMzApIG9ubHkgc3VwcG9ydHMgTVhMPTY0LAo+ID4gU1hMPTY0LCBVWEw9NjQvMzIuCj4gPiAg
LSBUaGUgNjQtYml0IExpbnV4ICsgY29tcGF0IDMyLWJpdCBhcHAgY2FuJ3Qgc2F0aXNmeSB0aGUg
NjQvMTI4TUIgc2NlbmFyaW9zLgo+ID4KPiA+PiBodWdlIGFkZGl0aW9uYWwgbWFpbnRlbmFuY2Ug
Y29zdCBvbiB0b3Agb2YgdGhlIEFCSSBpdHNlbGYKPiA+PiB0aGF0IHlvdSdkIG5lZWQgZWl0aGVy
IHdheSwgYnV0IHVzaW5nIGEgNjQtYml0IGFkZHJlc3Mgc3BhY2UKPiA+PiBpbiB0aGUga2VybmVs
IGhhcyBzb21lIGltcG9ydGFudCBhZHZhbnRhZ2VzIGV2ZW4gd2hlbiBydW5uaW5nCj4gPj4gMzIt
Yml0IHVzZXJsYW5kOiBwcm9jZXNzZXMgY2FuIHVzZSB0aGUgZW50aXJlIDRHQiB2aXJ0dWFsCj4g
Pj4gc3BhY2UsIHdoaWxlIHRoZSBrZXJuZWwgY2FuIGFkZHJlc3MgbW9yZSB0aGFuIDc2OE1CIG9m
IGxvd21lbSwKPiA+PiBhbmQgS0FTTFIgaGFzIG1vcmUgYml0cyB0byB3b3JrIHdpdGggZm9yIHJh
bmRvbWl6YXRpb24uIE9uCj4gPj4gUklTQ1YsIHNvbWUgYWRkaXRpb25hbCBmZWF0dXJlcyAoVk1B
UF9TVEFDSywgS0FTQU4sIEtGRU5DRSwKPiA+PiAuLi4pIGRlcGVuZCBvbiA2NC1iaXQga2VybmVs
cyBldmVuIHRob3VnaCB0aGV5IGRvbid0Cj4gPj4gc3RyaWN0bHkgbmVlZCB0aGF0Lgo+ID4KPiA+
IEkgYWdyZWUgdGhhdCB0aGUgNjQtYml0IGxpbnV4IGtlcm5lbCBoYXMgbW9yZSBmdW5jdGlvbmFs
aXRpZXMsIGJ1dDoKPiA+ICAtIFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGxpbnV4IG9uIGEgNjQv
MTI4TUIgU29DPyBDb3VsZCBpdCBiZQo+ID4gYWZmb3JkYWJsZSB0byBWTUFQX1NUQUNLLCBLQVNB
TiwgS0ZFTkNFPwo+Cj4gSSB3b3VsZCBkZWZpbml0ZWx5IHJlY29tbWVuZCBWTUFQX1NUQUNLLCBi
dXQgdGhhdCBjYW4gYmUgaW1wbGVtZW50ZWQKPiBhbmQgaXMgdXNlZCBvbiBvdGhlciAzMi1iaXQg
YXJjaGl0ZWN0dXJlcyAocHBjMzIsIGFybTMyKSB3aXRob3V0IGEKPiBodWdlIGNvc3QuIFRoZSBs
YXJnZXIgdmlydHVhbCB1c2VyIGFkZHJlc3Mgc3BhY2UgY2FuIGhlbHAgZXZlbiBvbgo+IG1hY2hp
bmVzIHdpdGggMTI4TUIsIHRob3VnaCBtb3N0IGFwcGxpY2F0aW9ucyBwcm9iYWJseSBkb24ndCBj
YXJlIGF0Cj4gdGhhdCBwb2ludC4KR29vZCBwb2ludCwgSSB3b3VsZCBzdXBwb3J0IFZNQVBfU1RB
Q0sgaW4gQVJDSF9SVjY0SUxQMzIuCgoKPgo+ID4gIC0gSSB0aGluayAzMi1iaXQgTGludXggJiBS
VE9TIGhhdmUgbW9ub3BvbGl6ZWQgdGhpcyBtYXJrZXQgKDY0LzEyOE1CCj4gPiBzY2VuYXJpb3Mp
LCByaWdodD8KPgo+IFRoZSBtaW5pbXVtIGFtb3VudCBvZiBSQU0gdGhhdCBtYWtlcyBhIHN5c3Rl
bSB1c2FibGUgZm9yIExpbnV4IGlzCj4gY29uc3RhbnRseSBnb2luZyB1cCwgc28gSSB0aGluayB3
aXRoIDY0TUIsIG1vc3QgbmV3IHByb2plY3RzIGFyZQo+IGFscmVhZHkgYmV0dGVyIG9mZiBydW5u
aW5nIHNvbWUgUlRPUyBrZXJuZWwgaW5zdGVhZCBvZiBMaW51eC4KPiBUaGUgb25lcyB0aGF0IGFy
ZSBzdGlsbCB1c2FibGUgdG9kYXkgcHJvYmFibHkgd29uJ3QgbGFzdCBhIGxvdAo+IG9mIGRpc3Ry
byB1cGdyYWRlcyBiZWZvcmUgdGhlIGJsb2F0IGNhdGNoZXMgdXAgd2l0aCB0aGVtLCBidXQgSQo+
IGNhbiBzZWUgaG93IHlvdXIgcGF0Y2ggc2V0IGNhbiBnaXZlIHRoZW0gYSBmZXcgZXh0cmEgeWVh
cnMgb2YKPiB1cGRhdGVzLgpMaW51eCBkZXZlbG9wbWVudCBjb3N0cyBtdWNoIGNoZWFwZXIgdGhh
biBSVE9TLCBzbyB0aGUgdmVuZG9ycyB3b3VsZApmaXJzdCBkZXZlbG9wIGEgTGludXggdmVyc2lv
bi4gSWYgaXQgc3VjY2VlZHMgaW4gdGhlIG1hcmtldCwgdGhlCnZlbmRvcnMgd2lsbCBjcmVhdGUg
YSBjb3N0LWRvd24gc29sdXRpb24uIFNvIHRoZWlyIGZpcnN0IGNob2ljZSBpcyB0bwpjdXQgZG93
biB0aGUgbWVtb3J5IGZvb3RwcmludCBvZiB0aGUgZmlyc3QgTGludXggdmVyc2lvbiBpbnN0ZWFk
IG9mCm1vdmluZyB0byBSVE9TLgoKV2l0aCB0aGUgcHJpY2Ugb2YgMTI4TUItRERSMyAmIDY0TUIt
RERSMiBiZWluZyBtb3JlIGFuZCBtb3JlIHNpbWlsYXIsCjMyYml0LUxpbnV4IGhhcyBtb3JlIG9w
cG9ydHVuaXRpZXMgdG8gaW5zdGVhZCBvZiBSVE9TLgoKPgo+IEZvciB0aGUgMjU2TUIrIHN5c3Rl
bXMsIEkgd291bGQgZXhwZWN0IHRoZSBzZW5zaXRpdmUga2VybmVsCj4gYWxsb2NhdGlvbnMgdG8g
YmUgc21hbGwgZW5vdWdoIHRoYXQgdGhlIHNlcmllcyBtYWtlcyBsaXR0bGUKPiBkaWZmZXJlbmNl
LiBUaGUgMTI4TUIgc3lzdGVtcyBhcmUgdGhlIG1vc3QgaW50ZXJlc3Rpbmcgb25lcwo+IGhlcmUs
IGFuZCBJJ20gY3VyaW91cyB0byBzZWUgd2hlcmUgeW91IHNwb3QgbW9zdCBvZiB0aGUKPiBtZW1v
cnkgdXNhZ2UgZGlmZmVyZW5jZXMsIEknbGwgYWxzbyByZXBseSB0byB5b3VyIGluaXRpYWwKPiBt
YWlsIGZvciB0aGF0LgpUaHgsIEkgYXNsbyByZWNvbW1hbmQgeW91IHJlYWQgYWJvdXQgIldoeSBz
NjRpbHAzMiBoYXMgYmV0dGVyCnBlcmZvcm1hbmNlPyIgc2VjdGlvbiA6KQpIb3cgZG8geW91IHRo
aW5rIHJ1bm5pbmcgYXJtMzItTGludXggb24gY29yZXRleC1BMzUvQTUzL0E1NT8KCj4KPiAgICAg
ICAgQXJuZAoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
