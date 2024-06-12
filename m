Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D6CC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Y+rgkXjuQ14AGM4jSBYsSTT1ohKabXtZ1VdIx1gIWI=; b=o2e8f7i3XPHKD6
	A1YvgT43T70QfDHHzC998mq5QDQCmL5pm7XvPMxJoCAlEI3aDXsRBuJ4RALtMB5S5B10NSfDv4R1d
	bQUXgNpgvcNx9LCUXDcSDmgeQsmBT5qU9CL1u4XgfjxwCmbWabBub5XtGXeBkS4D1/bs66v/C6hVb
	flD4ZVxWqSavy9Wd4EPs4m4N3ULNAxzNHo4fXK/N1L356E9DiIlCmiR+jRA18tsjt8ofQUcdvlH0e
	yBXximYln+pZggK99//7h3baL7+OzXCy1Fq0JMZ7DXw9JIkFkcQfQZnaluYgnSp+g9hh3x0PyZeaQ
	B3hNOhjPpwqnaOVgu9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIim-0000000BWKL-08q9;
	Wed, 12 Jun 2024 07:48:40 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIii-0000000BWJU-1gvq
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 07:48:37 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso5482884e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 00:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718178513; x=1718783313; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBUAuCh6WQTSc26sbqbHcPEdHufPV6icZ6onUz+5Vaw=;
        b=quzRIUP/x7rpjRo+yJVfrgq08Jc13q64FzeLYbupqRQwcv0//RRvN6APFX3YW9DhVX
         broI9Zkp3RUDo+qNhfDhAbPDEn//wd+w2tWeoFdB6VeW1nUq0N0eQ4ie5wRwf/sCyUz9
         HLBtyWaU2dljCsqP+bEW13dXN9dbKjWcopk13m7Vxb51C1HY5FgsrN9WKKe0uBn92/Fn
         /FV7hBnjmHJWiwfG/Hi8rAlYAvNXoUE8c4lg2wGrrzjvN5Lw1T/GHVJZeWEZXlX5CKd7
         7oB6r/x9eP4FULtx1yl/HpWeHtA4ajbPDuLlJ2dU6Bs4E5pc+vBv+OxWT1G6eP6inol/
         2MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178513; x=1718783313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBUAuCh6WQTSc26sbqbHcPEdHufPV6icZ6onUz+5Vaw=;
        b=rpwZRQLEmzMJhrK6N+dB/gr5CTlKzd9PFCVmrL1qD0gFMTLE6uRkNA7X0ueOLL8SXa
         xazO8U6NGooVQ1LYEy/sXw1OsZjD+frwTtxwCS/tKJzGuyiBDy86vBLxBxhjedGiMhrj
         JmryW5zD+trAEYcXgHNIZQC240cohH1qkVmvFEKXkvJ7DJQq+YExTIaUj9wrqYHB3vG7
         4nvjuw8c+PH01CJGPLsnTOwtctYzDXYiF8wD31n4vPclAHTyBbOB9MDop4A+sS+KafWf
         NsxugQCzYi792Y6XvgUWqa1tJqAbUBpXPlTCnra3mgo074Xvj4H3827ipKrIHksvSDny
         EAmw==
X-Forwarded-Encrypted: i=1; AJvYcCXLzIfFylctW8RNTdL6s3cNPbcj8aT0NuX5BPK+URY4KWY2URjh/7kWBv5zPBuVv6Pofw3w54lViRqrgWLMPnVwMy0fyKWFpaMHdHJQLJJv
X-Gm-Message-State: AOJu0Yy1EJRIHHT7oKvyAeEFEzYCfOUGhrnBeGbMX1KmU6Lyzj1qIoAK
	4PBLNFCq/ZHmd+DIG2UhE1n4YoRouINCrcwWiZnhD8mPiPoaroUc20F31WH6lv0E6gupp5jksyW
	q/UTEYoDE4r/dLW0bYqwkde5z0c8DEOgI61FBbQ==
X-Google-Smtp-Source: AGHT+IHWXOJ9zxK0Krc87a/DuMPE/dT5eubjqMnGYirztcGtqyAnVDLkEa2c9eodnVUEVB7B066Wp+GO25Q/2WayE1w=
X-Received: by 2002:a05:6512:1284:b0:52c:7a2d:5d5d with SMTP id
 2adb3069b0e04-52c9a3b9e12mr725836e87.3.1718178513041; Wed, 12 Jun 2024
 00:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240531162327.2436962-1-jesse@rivosinc.com> <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr> <20240603-stinking-roster-cfad46696ae5@spud>
 <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com> <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
 <20240610-qualm-chalice-72d0cc743658@wendy> <01547275-8c8c-43cf-9da0-64825c234707@rivosinc.com>
 <Zmdq6kszPBxAvLdD@debug.ba.rivosinc.com> <20240610-earplugs-anybody-ebd04a5fa777@spud>
 <Zmht+h75GgxP3ocz@debug.ba.rivosinc.com> <c1f5a958-1130-4bdb-a154-0c0eeb06c8f9@rivosinc.com>
In-Reply-To: <c1f5a958-1130-4bdb-a154-0c0eeb06c8f9@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 12 Jun 2024 00:48:23 -0700
Message-ID: <CAHBxVyEpfdpnazufL-oC=r1BoMzyXGdUhSbHPMOZfOj=cb6XkA@mail.gmail.com>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_004836_473561_9DC283A8 
X-CRM114-Status: GOOD (  48.72  )
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

T24gV2VkLCBKdW4gMTIsIDIwMjQgYXQgMTI6MTXigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDExLzA2LzIwMjQgMTc6MzIsIERlZXBh
ayBHdXB0YSB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDEwLCAyMDI0IGF0IDEwOjU2OjM1UE0gKzAx
MDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+PiBPbiBNb24sIEp1biAxMCwgMjAyNCBhdCAwMjow
Njo1MFBNIC0wNzAwLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gPj4+IE9uIE1vbiwgSnVuIDEwLCAy
MDI0IGF0IDExOjE2OjQyQU0gKzAyMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPiA+Pj4gPiBP
biAxMC8wNi8yMDI0IDExOjAyLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPj4+ID4gPiBPbiBNb24s
IEp1biAxMCwgMjAyNCBhdCAxMDozMzozNEFNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4gPj4+ID4gPiA+IE9uIDA3LzA2LzIwMjQgMjA6NTEsIERlZXBhayBHdXB0YSB3cm90ZToKPiA+
Pj4gPiA+ID4gPiBPbiBNb24sIEp1biAwMywgMjAyNCBhdCAwMTo0Nzo0MFBNICswMTAwLCBDb25v
ciBEb29sZXkgd3JvdGU6Cj4gPj4+ID4gPiA+ID4gPiBPbiBNb24sIEp1biAwMywgMjAyNCBhdCAx
MToxNDo0OUFNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkKPiA+Pj4gd3JvdGU6Cj4gPj4+ID4gPiA+
ID4gSSBkb24ndCBrbm93IGFsbCB0aGUgZGV0YWlscyBidXQgb24gZmlyc3QgZ2xhbmNlIGl0IHNl
ZW1zCj4gPj4+IGxpa2UgaW5zdGVhZAo+ID4+PiA+ID4gPiA+IG9mIEFDUEksCj4gPj4+ID4gPiA+
ID4gbWF5IGJlIEZXRlQgaXMgYSBiZXR0ZXIgcGxhY2UgZm9yIGRpc2NvdmVyeSA/Cj4gPj4+ID4g
PiA+ID4KPiA+Pj4gaHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90ZWNoLXBycy90b3BpYy9wYXRj
aF92MTJfYWRkX2Zpcm13YXJlLzEwNjQ3OTU3MQo+ID4+PiA+ID4gPgo+ID4+PiA+ID4gPiBJTUhP
LCBkb2luZyBkaXNjb3ZlcnkgaW4gRldGVCBpcyBub3QgdGhlIGdvYWwgb2YgdGhpcwo+ID4+PiBl
eHRlbnNpb24uIEkgdGhpbmsKPiA+Pj4gPiA+ID4gdGhlICJyZWFsIiBzb2x1dGlvbiB3b3VsZCBi
ZSB0byB3YWl0IGZvciB0aGUgdW5pZmllZCBkaXNjb3ZlcnkKPiA+Pj4gdGFzawo+ID4+PiA+ID4g
PiBncm91cCB0byBjb21lIHVwIHdpdGggc29tZXRoaW5nIGZvciB0aGF0ICh3aGljaCBpcyB0aGVp
ciBnb2FsIEkKPiA+Pj4gdGhpbmspIFsxXQo+ID4+Pgo+ID4+PiBZZWFoIEkgdW5kZXJzdGFuZCB0
aGUgY29udW5kcnVtIGhlcmUuCj4gPj4+Cj4gPj4+ID4gPgo+ID4+PiA+ID4gSSdtIGN1cmlvdXMg
dG8gc2VlIGhvdyB0aGF0IHdvcmtzIG91dC4gVGhlIHByb3Bvc2FsIGRvY3VtZW50cyBhbgo+ID4+
PiBtLW1vZGUKPiA+Pj4gPiA+IGNzciwgc28gd2UnZCBoYXZlIHRvIHNtdWdnbGUgdGhlIGluZm9y
bWF0aW9uIHRvIHMtbW9kZSBzb21laG93Li4uCj4gPj4+ID4KPiA+Pj4gPiBBaGVtLCB5ZWFoLCBJ
IHNwb2tlIGEgYml0IHRvbyBmYXN0LiBMb29rZWQgYXQgdGhlIHByb3Bvc2FsIGFuZCB0aGUKPiA+
Pj4gPiBtY29uZmlncHRyIENTUiB3aWxsIGJlIGFjY2Vzc2libGUgYnkgTS1tb2RlIG9ubHkgc28g
SSBndWVzcyB3ZSB3aWxsCj4gPj4+IGhhdmUKPiA+Pj4gPiB0byBmaW5kIGFub3RoZXIgd2F5Li4u
Cj4gPj4+Cj4gPj4+IFRoYXQncyBub3QgdGhlIG9ubHkgcHJvYmxlbS4gRXZlbiBpZiB5b3UgZ2V0
IG1jb25maWdwdHIgYWNjZXNzLAo+ID4+PiBwYXJzaW5nIHRoZSBmb3JtYXQKPiA+Pj4gaXMgYW5v
dGhlciB0aGluZyB0aGF0IGhhcyB0byBiZSBkb25lLiBUaGlzIGlzIGVhcmx5IGluIGJvb3QuIEFs
dGhvdWdoCj4gPj4+IGl0cyBzdHJpY3RseSAocHVuCj4gPj4+IGludGVuZGVkKSBub3QgYSBmaXJt
d2FyZSBmZWF0dXJlIGV4dGVuc2lvbiwgSSB0aGluayBpdCdzIG11Y2ggZWFzaWVyCj4gPj4+IHRv
IGFzayB1bmRlcmx5aW5nCj4gPj4+IGZpcm13YXJlIGlmIHBsYXRmb3JtIGlzIGBTc3RyaWN0YC4g
b3IgbWF5IGJlIGV4cG9zZSBzb21ldGhpbmcgbGlrZSBiZWxvdwo+ID4+Pgo+ID4+PiBgRU5BQkxF
X1NTVFJJQ1RgLgo+ID4+PiBQbGF0Zm9ybXMgd2hpY2ggc3VwcG9ydCBgU3N0cmljdGAgY2FuIHJl
dHVybiBzdWNjZXNzIGZvciB0aGlzIHdoaWxlCj4gPj4+IHBsYXRmb3JtcyB3aGljaCBkb24ndAo+
ID4+PiBoYXZlIGBTc3RyaWN0YCBjYW4gcmV0dXJuIGVycm9yIGNvZGUgKG5vdCBzdXBwb3J0ZWQg
b3Igbm90IGltcGxlbWVudGVkKS4KPiA+Pj4gVGhpcyB3YXkgaXRzIG5vdCBmZWF0dXJlIGRpc2Nv
dmVyeS4KPiA+Pgo+ID4+IEkgbWVhbiwgaXQncyBmZWF0dXJlIGRpc2NvdmVyeSBpbiBhbGwgYnV0
IG5hbWUuIFlvdSdyZSBjYWxsaW5nIGl0Cj4gPj4gZW5hYmxlLCBidXQgdGhlIGJlaGF2aW91ciB5
b3UgZGVzY3JpYmUgaXMgZmVhdHVyZSBkaXNjb3ZlcnkgLSBub3QgdGhhdCBJCj4gPj4gYW0gYWdh
aW5zdCB0aGlzIGJlaW5nIGZlYXR1cmUgZGlzY292ZXJ5IHNpbmNlIGl0IGdldHMgdXMgb3V0IG9m
IGFuCj4gPj4gYW5ub3lpbmcgYmluZC4KPiA+Cj4gPiBZZXMgSSBrbm93IGl0J3MgY2hlYXRpbmcg
YnV0IGF0IGxlYXN0IGZvciB0aGlzIGNhc2UsIGl0IHNlZW1zIGxpa2UgZWFzeQo+ID4gc29sdXRp
b24gd2hpY2gKPiA+IGRvZXNuJ3QgYnJlYWsgYW55dGhpbmcuIE5laXRoZXIgSSBzZWUgaXQgY3Jl
YXRpbmcgYW55IGZ1dHVyZSBwcm9ibGVtcwo+ID4gKGV4Y2VwdCBGV0ZUIGJlY29taW5nCj4gPiB0
byBsb29rIGxpa2UgZGlzY292ZXJ5IG1lY2hhbmlzbSA6LSkgYW5kIENsZW1lbnQvQXRpc2ggaGF0
aW5nIG1lIGZvciB0aGF0KQo+Cj4gQWhhaCBubyB3b3JyaWVzOykgVGhpbmtpbmcgYSBiaXQgbW9y
ZSBhYm91dCBpdCwgaWYgd2UgbmVlZCBvbmx5IGEgZmV3Cj4gZXh0ZW5zaW9ucyB0byBiZSBkaXNj
b3ZlcmFibGUsIGl0IHNlZW1zIG1hbmFnZWFibGUgKGllIGFkZCBhICJsb2NrZWQiCj4gZmVhdHVy
ZSB0aGF0IHJlcG9ydCB0aGUgZXh0ZW5zaW9uIGF2YWlsYWJpbGl0eSBpdHNlbGYsIGdldCBvbmx5
IHdpbGwKPiB3b3JrLCBzZXQgd2lsbCByZXR1cm4gU0JJX0VERU5JRUQpLiBCdXQgaWYgbmVlZCBt
b3JlIG9mIHRoZW0sIHRoZW4gYQo+IGRlZGljYXRlZCBtZWNoYW5pc20gc2hvdWxkIHByb2JhYmx5
IGJlIGRlc2lnbmVkLgo+ClJldHJ5aW5nIGFnYWluIGFzIGdtYWlsIHN3aXRjaGVkIG15IGRlZmF1
bHQgdG8gaHRtbCBhZ2FpbiA6KC4gU29ycnkKZm9yIHRoZSBzcGFtLgoKWWVzLiBPbmNlIGl0IGlz
IGFsbG93ZWQsIHRoZXJlIHdpbGwgYmUgbWFueSBtb3JlIGluIHRoZSBmdXR1cmUgOikuClJlYWRp
bmcgdGhpcyB0aHJlYWQsIGl0IHNlZW1zIHdlIG5lZWQgZWFybHkgZGV0ZWN0aW9uIGZvciB0aGVz
ZSAzIG5vdy4KClphYmhhL1phY2FzL1prcgoKSXMgdGhlcmUgYW55IHVzZSBjYXNlIGZvciBvYnRh
aW5pbmcgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiByZWxhdGVkIHRvCmFuIElTQSBvciBqdXN0IGV4
dGVuc2lvbiBwcmVzZW5jZSBpcyBlbm91Z2ggPworU3VuaWwgKGluIGNhc2UgaGUgaGFzIHNvbWUg
dHJpY2tzIGluIEFDUEkgbGFuZCBmb3IgZWFybHkgcGFyc2luZykuCgpPdGhlcndpc2UsIHdlIG1h
eSBoYXZlIHRvIGNvbWUgdXAgd2l0aCBhIHNlcGFyYXRlIG1lY2hhbmlzbSBmb3IgZWFybHkgZGV0
ZWN0aW9uLgoKPiBDbMOpbWVudAo+Cj4gPgo+ID4gQW5vdGhlciBzb2x1dGlvbiB0byB0aGlzIGNv
dWxkIGJlIGludHJvZHVjaW5nIGEgcmlzY3YgY29uZmlnCj4gPiBgQ09ORklHX1JJU0NWX1NTVFJJ
Q1RgLgo+ID4gQnkgZGVmYXVsdCBhbHdheXMgc2VsZWN0IGBDT05GSUdfUklTQ1ZfU1NUUklDVGAg
YW5kIGFueSBwbGF0Zm9ybSBvd25lcgo+ID4gd2hvIGFyZSBub3QKPiA+IHNzdHJpY3QsIHRoZXkg
Y2FuIGJ1aWxkIHRoZWlyIG93bi4KPiA+IEkgZXhwZWN0IGRpc3RybyAodWJ1bnR1LCByZWQgaGF0
LCBldGMpIHdvdWxkIHdhbnQgYnkgZGVmYXVsdAo+ID4gYENPTkZJR19SSVNDVl9TU1RSSUNUYC4K
PiA+Cj4gPj4KPiA+PiBJIGZvcmdldCB3aGljaCBleHRlbnNpb24gQWxleCBhbmQgSSBkaXNjdXNz
ZWQgcHJldmlvdXNseSwgYnV0IHRoZXJlJ3MKPiA+PiBzb21lIG1tLXJlbGF0ZWQgdGhpbmdzIHRo
YXQgeW91J3JlIGdvbm5hIGhhdmUgdG8gcHJvYmUgc3VwZXIgZWFybHkgYW5kCj4gPj4gd2UgbmVl
ZCB0byBmaWd1cmUgb3V0IGlmIHdlIGNhbiBnZXQgdGhhdCBpbmZvIGZyb20gQUNQSSBvciBub3Qu
IEkga25vdwo+ID4+IHdlIGRpc2N1c3NlZCBpdCB3LnIudC4gb25lIG9mIHRoZSBULUhlYWQgdmVu
ZG9yIGV4dGVuc2lvbnMsIGJ1dCBJIHRoaW5rCj4gPj4gYW5vdGhlciBzdGFuZGFyZCBvbmUgZ290
IG1lbnRpb25lZCB0b28uCj4gPj4KPiA+Pj4gSXQgc2VlbXMgbGlrZSBhcm02NCBwYXJzZXMgZmR0
IGFuZCBpdCByZWFkcyBjZXJ0YWluIENTUnMgdG9vCj4gPj4+IChgYXJjaC9hcm02NC9rZXJuZWwv
cGkva2FzbHJfZWFybHkuY2ApLiBBbHRob3VnaCBpdCBkb2Vzbid0IGxvb2sgbGlrZQo+ID4+PiBp
dCBoYXMgdG8gZG8gYW55Cj4gPj4+IGRpc2NvdmVyeSBmb3IgdGhlbS4KPiA+Pgo+ID4+IEEgZGVj
cmVlIGZyb20gdGhlIFBhbG1lciB0aGF0IHdlIGRvbid0IHN1cHBvcnQgdGhpbmdzIHRoYXQgZG8g
bm90IGNvbmZvcm0KPiA+PiBpbiB0aGlzIG1hbm5lciB3b3VsZCBhbGxvdyB1cyB0byBkbyB3aGF0
IGFybTY0IGRvZXMuIEkgYnJvdWdodCB0aGlzIHVwCj4gPj4gb3JpZ2luYWxseSBiZWNhdXNlIGl0
J3MgYmVlbiBkaXNjdXNzZWQgYmVmb3JlIHRoYXQgd2UgY2Fubm90IHJlbHkgb24KPiA+PiBjb25m
b3JtYW5jZSBiZWNhdXNlIHdlIHdhbnQgdG8gc3VwcG9ydCBwZW9wbGUncyBwbGF0Zm9ybXMsIHdo
ZXRoZXIgdGhleQo+ID4+IGNvbXBseSBvciBub3QuIEknZCBiZSB3YXJ5IG9mIG1ha2luZyB0aGlz
IGFuIGV4Y2VwdGlvbiBub3csIGFuZCB0aGVuCj4gPj4gbGF0ZXIgb24gc29tZW9uZSBtYWtlcyBh
IHBsYXRmb3JtIHdlIHdhbnQgdG8gc3VwcG9ydCB0aGF0IGRvZXNuJ3QKPiA+PiBjb25mb3JtIGFu
ZCBoZXkgcHJlc3RvLCB3ZSByZWdyZXNzIEtBU0xSIHN1cHBvcnQgLSBldmVuIGlmIEkgdGhpbmsg
aXQgaXMKPiA+PiBwcmV0dHkgdW5saWtlbHkgdGhhdCBzb21lb25lIGlzIGdvaW5nIHRvIHJlcHVy
cG9zZSB0aGUgWmtyIENTUnMuCj4gPj4KPiA+PiBPbmUgb2YgdGhlIHByb2JsZW1zIHdpdGggb25s
eSBzdXBwb3J0aW5nIGNvbmZvcm1pbmcgcGxhdGZvcm1zIGlzIHRoYXQKPiA+PiB0aGUgZGVmaW5p
dGlvbiBvZiBjb25mb3JtaW5nIGNoYW5nZXMgb3ZlciB0aW1lISBUaGlzIGhhcyBoYXBwZW5lZCB3
aXRoCj4gPj4gdGhlIEFuZGVzIFBNVSBmb3IgZXhhbXBsZSwgd2hpY2ggSSBiZWxpZXZlIHVzZXMg
YW4gaW50ZXJydXB0IG51bWJlciB0aGF0Cj4gPj4gd2FzIGxhdGVyIGNvLW9wdGVkIGJ5IEFJQSBz
cGVjLiBUaGF0IGNvbmZvcm1lZCBhdCB0aGUgdGltZSwgYnV0IGRvZXNuJ3QKPiA+PiBhbnltb3Jl
IC0gZG8gdGhleSBnZXQgdG8gbWFyayB0aGVtc2VsdmVzIGFzIFNzdHJpY3Q/Cj4gPj4KPiA+PiBN
YXliZSB3ZSBjYW4gZG8gdGhpcyBvbiBhIGNhc2UtYnktY2FzZSBiYXNpcywgYnV0IGl0J3MgdXAg
dG8gUGFsbWVyCj4gPj4gd2hldGhlciBvciBub3Qgd2UgY2FuIGRvIHRoYXQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
