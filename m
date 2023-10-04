Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75117E7B610
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCsHhxHnDi8XManhmLSLlSfQal3QKeAognQJgRzNfUk=; b=CW55uidmcIRVwQ
	jcpfTFoJCWWm8D11DbJdNnyvJGkHLOJYwwnOdri1oB8ynhyq1GvfSOuadFcjFRq+kOTq3xQVtTUWX
	VFnBnwaSZ01OLxvfCfnU5Sz82kKX3RLSaQuJVkDYepo9GWtfLWvpl9OhN5LhK73YZagaAcz3UxHDR
	ayzbQrFYqbYC7vEUzL2+E9RAPPb5G5D4g5MTYxYFi1Nsy74ffwHcTcZ9H79wscYnASiL35OVPjvMz
	m+2QcDDFtbPA0fXovrbjhnGMXtuL8LrEBKUirsngaz5dAt23jX1xpQvfARkj2OnWx0cUeSdieTunL
	sK8IgiJ80RbSTvtSfUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo1X3-0004x0-0n;
	Wed, 04 Oct 2023 13:03:17 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo1Wz-0004uj-37
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 13:03:15 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-49d39f07066so892996e0c.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696424583; x=1697029383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSv0fnQiWGKznN7qc7Hk8Fhlm64nM7lW3Q5OIBrznfA=;
        b=hCnaboMAvOJS0SXrxwx+18vzmMRvdMU1EubAP7Px5nx7E40BmsoeFx//d8CXBP9o4a
         qTeVDaLeuoHXhQQfqCWPB3UOkmD9p63I8TPEYTyvznnyF+hEURDBjJaT4uJa+YgAa0sR
         s95690ROMbCI6GIAbtJp6Gt48MuLDSg80oWce0vJ4EKGgBcig0GA9sBht9Pp3fF71INI
         Zv09ARWB+5ARwMm18c5F7VXTMwkepCoxXURzYiMXLy2vhtsg0qglAhqvYvbE7azu/LBc
         37Jhuy1+VtQ1y5nUatvDw6/odA86kwPYkUnayxMtS155to36OGjGzXQeY5dDTaCAnLWX
         W8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424583; x=1697029383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSv0fnQiWGKznN7qc7Hk8Fhlm64nM7lW3Q5OIBrznfA=;
        b=lRJBBkPRLEmGF65Qx8d+8rR8CblAmDB7DXGUQCrADShwEn4f/DkPRx3VlaPfvB5j37
         0ZiNDtGSjyga0aWr4mYwScnsQSNwoi3eFZVG5QKDejIBr97WIh/OG3xstDG83pXUL1bP
         oalsxsOx0ihBV40pVi39mKHs9OdrBeC+Ew8Jn9pcIFxDqASxrKuRi/kPfmX0MYsW2PBx
         IvEfiORMF+PwTmpkdqdrXMp6Tq/21KPaWxJgZmIakY3niCJvKgiW9PsB08EIu8IZZ6uw
         xMGKxxn66Go7NNySf7pB1QA3f2ULfvn++u1Wej8SmK7oJG+wWWWlYS2mF2GKCpwvi6bC
         tW/w==
X-Gm-Message-State: AOJu0YweGU9UNwW7/gPTJoFk+hK25runIQ+pzGHzSJ4s/QIom7EocVpx
	JeWHShkvgNTN2FJj6ANG0PyJ337fFEJMwxP5ONs=
X-Google-Smtp-Source: AGHT+IEmmj5kDwjfmLxuhp+KqCie3sEBZRH8qhFF3JL8qvtcD8WJmGUdKav7/FUfeLhBloT9LJ8hb0kuH7HP2pQD718=
X-Received: by 2002:a1f:4bc4:0:b0:47e:8a9:478c with SMTP id
 y187-20020a1f4bc4000000b0047e08a9478cmr1789874vka.16.1696424582835; Wed, 04
 Oct 2023 06:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
 <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker>
In-Reply-To: <ZR1M3FcdXrDmIGu2@xhacker>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Oct 2023 14:02:36 +0100
Message-ID: <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
To: Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_060314_008858_2F9977DD 
X-CRM114-Status: GOOD (  40.50  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Drew Fustini <dfustini@baylibre.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Han Gao <gaohan@iscas.ac.cn>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jason Kridner <jkridner@beagleboard.org>, Paul Walmsley <paul.walmsley@sifive.com>, Robert Nelson <robertcnelson@gmail.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Robin Murphy <robin.murphy@arm.com>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

KyBDQyBsaW51eC1tbSBhbmQgUm9iaW4gTXVycGh5CgpPbiBXZWQsIE9jdCA0LCAyMDIzIGF0IDEy
OjQy4oCvUE0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9u
IE1vbiwgT2N0IDAyLCAyMDIzIGF0IDA5OjM3OjQ0UE0gLTA3MDAsIERyZXcgRnVzdGluaSB3cm90
ZToKPiA+IE9uIEZyaSwgU2VwIDIyLCAyMDIzIGF0IDA1OjQ4OjIxUE0gLTA1MDAsIFJvYmVydCBO
ZWxzb24gd3JvdGU6Cj4gPiA+IE9uIEZyaSwgU2VwIDIyLCAyMDIzIGF0IDI6MDjigK9QTSBSb2Jl
cnQgTmVsc29uIDxyb2JlcnRjbmVsc29uQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4g
PiBPbiBUaHUsIFNlcCAyMSwgMjAyMyBhdCA4OjUx4oCvUE0gRHJldyBGdXN0aW5pIDxkZnVzdGlu
aUBiYXlsaWJyZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgc2VyaWVzIGFk
ZHMgc3VwcG9ydCBmb3IgdGhlIGVNTUMgb24gdGhlIEJlYWdsZVYgQWhlYWQgYW5kIHRoZQo+ID4g
PiA+ID4gU2lwZWVkIExpY2hlZVBpIDRBLiBUaGlzIGFsbG93cyB0aGUga2VybmVsIHRvIGJvb3Qg
d2l0aCB0aGUgcm9vdGZzIG9uCj4gPiA+ID4gPiBlTU1DLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkg
dGVzdGVkIG9uIHRvcCBvZiB2Ni42LXJjMiB3aXRoIHRoaXMgY29uZmlnIFsxXS4gSSB3YXMgYWJs
ZSB0byBib290Cj4gPiA+ID4gPiBib3RoIHRoZSBBaGVhZCBbMl0gYW5kIExQaTRhIFszXSBmcm9t
IGVNTUMuIFRoZSBmb2xsb3dpbmcgcHJlcmVxdWlzaXRlcwo+ID4gPiA+ID4gYXJlIHJlcXVpcmVk
Ogo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgW1BBVENIIHYyXSByaXNjdjogZHRzOiB0aGVhZDogc2V0
IGRtYS1ub25jb2hlcmVudCB0byBzb2MgYnVzIFs0XQo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgcHVz
aGVkIGEgYnJhbmNoIFs1XSB3aXRoIHRoaXMgcGF0Y2ggc2VyaWVzIGFuZCB0aGUgYWJvdmUgcGF0
Y2ggZm9yCj4gPiA+ID4gPiB0aG9zZSB0aGF0IGZpbmQgYSBnaXQgYnJhbmNoIGVhc2llciB0byB0
ZXN0Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFBsZWFzZSBub3RlIHRoYXQgb25seSB0aGUgTU1DIGNv
bnRyb2xsZXIgY29ubmVjdGVkIHRvIHRoZSBlTU1DIGRldmljZQo+ID4gPiA+ID4gaXMgZW5hYmxl
ZCBpbiB0aGUgZGV2aWNlIHRyZWVzIGZvciB0aGVzZSB0d28gYm9hcmRzLiBJIGRpZCBub3QgeWV0
Cj4gPiA+ID4gPiBhdHRlbXB0IHRvIGNvbmZpZ3VyZSBhbmQgdXNlIHRoZSBtaWNyb1NEIGNhcmQg
c2xvdC4gTXkgcHJlZmVyZW5jZSBpcyB0bwo+ID4gPiA+ID4gYWRkcmVzcyB0aGF0IGluIGEgZnV0
dXJlIHBhdGNoIHNlcmllcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBSZWZlcmVuY2VzOgo+ID4gPiA+
ID4gWzFdIGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3BkcDcvNWZiZGNmMmE2NWViMWFiZGQzYTI5
ZDUxOWMxOWNkZDIKPiA+ID4gPiA+IFsyXSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9wZHA3Lzkx
YTgwMWE1ZjhkMTA3MGM1MzUwOWVkYTk4MDBhZDc4Cj4gPiA+ID4gPiBbM10gaHR0cHM6Ly9naXN0
LmdpdGh1Yi5jb20vcGRwNy8xNDQ1YzNjOTkxZTg4ZmQ2OWM2MDE2NWNlZjY1NzI2YQo+ID4gPiA+
ID4gWzRdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwOTEyMDcyMjMy
LjI0NTUtMS1qc3poYW5nQGtlcm5lbC5vcmcvCj4gPiA+ID4gPiBbNV0gaHR0cHM6Ly9naXRodWIu
Y29tL3BkcDcvbGludXgvdHJlZS9iNC90aDE1MjAtbW1jCj4gPiA+ID4KPiA+ID4gPiBUaGlzIHBh
dGNoc2V0IGNhbWUgb3V0IHZlcnkgbmljZSEKPiA+ID4gPgo+ID4gPiA+IHY2LjYtcmMyIHdpdGgg
TGFzdCBSRkMgdjI6Cj4gPiA+ID4KPiA+ID4gPiBbICAgIDQuMDY2NjMwXSBtbWMwOiBTREhDSSBj
b250cm9sbGVyIG9uIGZmZTcwODAwMDAubW1jCj4gPiA+ID4gW2ZmZTcwODAwMDAubW1jXSB1c2lu
ZyBQSU8KPiA+ID4gPgo+ID4gPiA+IGRlYmlhbkBCZWFnbGVWOn4kIHN1ZG8gaGRwYXJtIC10VCAv
ZGV2L21tY2JsazAKPiA+ID4gPgo+ID4gPiA+IC9kZXYvbW1jYmxrMDoKPiA+ID4gPiAgVGltaW5n
IGNhY2hlZCByZWFkczogICAxNTE2IE1CIGluICAyLjAwIHNlY29uZHMgPSA3NTguMDkgTUIvc2Vj
Cj4gPiA+ID4gIFRpbWluZyBidWZmZXJlZCBkaXNrIHJlYWRzOiAgODQgTUIgaW4gIDMuMDEgc2Vj
b25kcyA9ICAyNy45NCBNQi9zZWMKPiA+ID4gPgo+ID4gPiA+IHZzIHY2LjYtcmMyIHdpdGggdGhp
cyBwYXRjaHNldDoKPiA+ID4gPgo+ID4gPiA+ICBbICAgIDQuMDk2ODM3XSBtbWMwOiBTREhDSSBj
b250cm9sbGVyIG9uIGZmZTcwODAwMDAubW1jCj4gPiA+ID4gW2ZmZTcwODAwMDAubW1jXSB1c2lu
ZyBETUEKPiA+ID4gPgo+ID4gPiA+IGRlYmlhbkBCZWFnbGVWOn4kIHN1ZG8gaGRwYXJtIC10VCAv
ZGV2L21tY2JsazAKPiA+ID4gPgo+ID4gPiA+IC9kZXYvbW1jYmxrMDoKPiA+ID4gPiAgVGltaW5n
IGNhY2hlZCByZWFkczogICAxNTgwIE1CIGluICAyLjAwIHNlY29uZHMgPSA3OTAuOTcgTUIvc2Vj
Cj4gPiA+ID4gIFRpbWluZyBidWZmZXJlZCBkaXNrIHJlYWRzOiA0MTggTUIgaW4gIDMuMDAgc2Vj
b25kcyA9IDEzOS4xMSBNQi9zZWMKPiA+ID4KPiA+ID4gRHJldyBwb2ludGVkIG91dCBvbiBTbGFj
aywgdGhpcyB3YXMgbm90IHF1aXRlIHJpZ2h0Li4gQWZ0ZXIgbW9yZQo+ID4gPiBkaWdnaW5nIGJ5
IERyZXcsIENPTkZJR19ETUFfR0xPQkFMX1BPT0wgaXMgY2F1c2luZyBhIERNQSBsaW1pdGF0aW9u
Cj4gPiA+IHdpdGggdGhlIG11bHRpcGxhdGZvcm0gZGVmY29uZmlnLiBzbyB3aXRoLAo+ID4gPgo+
ID4gPiAuL3NjcmlwdHMvY29uZmlnIC0tZGlzYWJsZSBDT05GSUdfQVJDSF9SOUEwN0cwNDMKPiA+
ID4KPiA+ID4gKHRvIHJlbW92ZSBDT05GSUdfRE1BX0dMT0JBTF9QT09MKS4uLiBhbm90aGVyIDJ4
IGluIGJ1ZmZlcmVkIHJlYWRzLi4KPiA+ID4KPiA+ID4gWyAgICA0LjA1OTI0Ml0gbW1jMDogU0RI
Q0kgY29udHJvbGxlciBvbiBmZmU3MDgwMDAwLm1tYwo+ID4gPiBbZmZlNzA4MDAwMC5tbWNdIHVz
aW5nIEFETUEgNjQtYml0Cj4gPiA+Cj4gPiA+IGRlYmlhbkBCZWFnbGVWOn4kIHN1ZG8gaGRwYXJt
IC10VCAvZGV2L21tY2JsazAKPiA+ID4KPiA+ID4gL2Rldi9tbWNibGswOgo+ID4gPiAgVGltaW5n
IGNhY2hlZCByZWFkczogICAxNjAwIE1CIGluICAyLjAwIHNlY29uZHMgPSA4MDAuOTMgTUIvc2Vj
Cj4gPiA+ICBUaW1pbmcgYnVmZmVyZWQgZGlzayByZWFkczogODkyIE1CIGluICAzLjAwIHNlY29u
ZHMgPSAyOTcuMDYgTUIvc2VjCj4gPgo+ID4gSXQgc2VlbXMgQ09ORklHX0RNQV9HTE9CQUxfUE9P
TD15IGNhdXNlcyBBRE1BIGJ1ZmZlciBhbGxvYyB0byBmYWlsIFsxXToKPiA+Cj4gPiAgIG1tYzA6
IFVuYWJsZSB0byBhbGxvY2F0ZSBBRE1BIGJ1ZmZlcnMgLSBmYWxsaW5nIGJhY2sgdG8gc3RhbmRh
cmQgRE1BCj4gPgo+ID4gUHJhYmhha2FyJ3MgQVg0NU1QIG5vbi1jb2hlcmVudCBETUEgc3VwcG9y
dCBbMl0gc2VyaWVzIGludHJvZHVjZWQgdGhlCj4gPiBzZWxlY3Rpb24gb2YgRE1BX0dMT0JBTF9Q
T09MIGZvciBBUkNIX1I5QTA3RzA0MyBhbmQgdGhlIHJpc2N2IGRlZmNvbmZpZwo+ID4gc2VsZWN0
cyBBUkNIX1I5QTA3RzA0My4KPiA+Cj4gPiBQYXRjaCA1IGluIHRoZSBzZXJpZXMgWzNdIHN0YXRl
cyB0aGF0Ogo+ID4KPiA+ICAgV2l0aCBETUFfR0xPQkFMX1BPT0wgZW5hYmxlZCBhbGwgRE1BIGFs
bG9jYXRpb25zIGhhcHBlbiBmcm9tIHRoaXMKPiA+ICAgcmVnaW9uIGFuZCBzeW5jaHJvbml6YXRp
b24gY2FsbGJhY2tzIGFyZSBpbXBsZW1lbnRlZCB0byBzeW5jaHJvbml6ZQo+ID4gICB3aGVuIGRv
aW5nIERNQSB0cmFuc2FjdGlvbnMuCj4gPgo+ID4gVGhpcyBleGFtcGxlIG9mIGEgInNoYXJlZC1k
bWEtcG9vbCIgbm9kZSB3YXMgZ2l2ZW46Cj4gPgo+ID4gICAgICAgICBwbWFfcmVzdjBANTgwMDAw
MDAgewo+ID4gICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+ID4g
ICAgICAgICAgICAgcmVnID0gPDB4MCAweDU4MDAwMDAwIDB4MCAweDA4MDAwMDAwPjsKPiA+ICAg
ICAgICAgICAgIG5vLW1hcDsKPiA+ICAgICAgICAgICAgIGxpbnV4LGRtYS1kZWZhdWx0Owo+ID4g
ICAgICAgICB9Owo+ID4KPiA+IEkndmUgY29waWVkIHRoYXQgdG8gdGgxNTIwLWJlYWdsZXYtYWhl
YWQuZHRzLiBUaGUgYWRkcmVzcyBvZiAweDU4MDAwMDAwCj4gPiBoYXMgbm8gc2lnbmlmaWNhbmNl
IG9uIHRoMTUyMCwgYnV0IHRoZSBleGlzdGVuY2Ugb2Ygc2hhcmVkLWRtYS1wb29sCj4gPiBzZWVt
cyB0byBmaXggdGhlIHByb2JsZW0uIEFETUEgbW9kZSBbNF0gaXMgbm93IHdvcmtpbmcgZXZlbiB0
aG91Z2gKPiA+IENPTkZJR19ETUFfR0xPQkFMX1BPT0w9eS4KPgo+ICsgQ2hyaXN0b3BoLCBMYWQK
Pgo+IElNSE8sIHRoaXMgaXMgbm90IFRIMTUyMCBzcGVjaWZpYyBidXQgYSBnZW5lcmljIGlzc3Vl
Lgo+Cj4gSSBiZWxpZXZlIGNvbW1pdCA0ODQ4NjFlMDlmM2UgKCJzb2M6IHJlbmVzYXM6IEtjb25m
aWc6IFNlbGVjdCB0aGUKPiByZXF1aXJlZCBjb25maWdzIGZvciBSWi9GaXZlIFNvQyIpIGNhbiBj
YXVzZSByZWdyZXNzaW9uIG9uIGFsbAo+IG5vbi1kbWEtY29oZXJlbnQgcmlzY3YgcGxhdGZvcm1z
IHdpdGggZ2VuZXJpYyBkZWZjb25maWcuIFRoaXMgaXMKPiBhIGNvbW1vbiBpc3N1ZS4gVGhlIGxv
Z2ljIGhlcmUgaXM6IGdlbmVyaWMgcmlzY3YgZGVmY29uZmlnIHNlbGVjdHMKPiBBUkNIX1I5QTA3
RzA0MyB3aGljaCBzZWxlY3RzIERNQV9HTE9CQUxfUE9PTCwgd2hpY2ggYXNzdW1lcyBhbGwKPiBu
b24tZG1hLWNvaGVyZW50IHJpc2N2IHBsYXRmb3JtcyBoYXZlIGEgZG1hIGdsb2JhbCBwb29sLCB0
aGlzIGFzc3VtcHRpb24KPiBzZWVtcyBub3QgY29ycmVjdC4gQW5kIEkgYmVsaWV2ZSBETUFfR0xP
QkFMX1BPT0wgc2hvdWxkIG5vdCBiZQo+IHNlbGVjdGVkIGJ5IEFSQ0hfU09DRkFNSUxJWSwgaW5z
dGVhZCwgb25seSBBUkNIIHVuZGVyIHNvbWUgc3BlY2lmaWMKPiBjb25kaXRpb25zIGNhbiBzZWxl
Y3QgaXQgZ2xvYmFseSwgZm9yIGV4YW1wbGUgTk9NTVUgQVJNIGFuZCBzbyBvbi4KPgo+IFNpbmNl
IHRoaXMgaXMgYSByZWdyZXNzaW9uLCB3aGF0J3MgcHJvcGVyIGZpeD8gYW55IHN1Z2dlc3Rpb24g
aXMKPiBhcHByZWNpYXRlZC4KPgo+IFRoYW5rcwo+Cj4gPgo+ID4gVGhhbmtzLAo+ID4gRHJldwo+
ID4KPiA+IFsxXSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9wZHA3LzczMDQxZWQ4MDhiYmM3ZGQ0
NDU4MzZmYjkwNTc0OTc5Cj4gPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvMjAyMzA4MTgxMzU3MjMuODA2MTItMS1wcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVu
ZXNhcy5jb20vCj4gPiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAy
MzA4MTgxMzU3MjMuODA2MTItNi1wcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20vCj4gPiBbNF0gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vcGRwNy85MWU3MmE2NjNkM2JiNzNl
YjI4MTgyMzM3YWQ4YmJjYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
