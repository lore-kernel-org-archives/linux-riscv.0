Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714B2C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVop+Wj5eJ36nA8HpfG8p3zboSFuptxCuqCZEsj0Yxs=; b=DnK6MT3W5vy5Zk
	5yXmrsq6Qfs87u6qhupUEmX9Grcvsn0GQT+KEQQyCy7xCII9YXLXiPaX9+GwLJp3hqgvT1VNQcgz1
	G1QlmAUhg+DTFw/2ZoMB5ArzBSjY+Llc6wSEgagv/KWuI0EMCWTfB+oUWnzqJ7uJRRNMcE4RE66uG
	O5Qlx/8TcIOpwNsOboWkEU77Ad/MzhnmogyAivd74Mvg2E+L8vL1NshFnAbQ5DdtROtkEepC6hssy
	h/jpU1bNAZ1Wt7KnJs5jSRPsS9g4lvGWLqVukNkxwYf8jKiel/GEkvNk6xRZ6RkPHWgofmN6yjDVa
	MTk5BwZlxOv5QFeYFqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXV3-004t5j-0d;
	Fri, 22 Dec 2023 04:51:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXV0-004t4m-07
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 04:51:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DC1661B54
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 04:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEBAC433CC
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 04:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703220657;
	bh=0LsfsZZzBusgIAD3qQmmUaG27xjYEQSKO7z6xMBhlSE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=buDEjzPzJl2oOTCG4mR5hrq0Y5hBjbDkESelrGra7PVruT0KoN7WXmZfLmgG/pGo6
	 gO01+22n2/ktkp/IFnlDdlCkSqaFbtWbXPPkYBiu6eeE80rL5QVYNcNvA9jfU2KGq6
	 EU7Q6oo27Zm3n338viOKmNTfUKyULO6C1WpEXCJwVOh24KCDhrM5IW7jF1xar2CgWR
	 AbehwW4SSzEr21ppi49PQ4t+hWsGc/rMH2zD8RqastjxFe6+CkDHwq0AnSVqXwlF+j
	 2JCgvEMZEhw0zBZg70qUZBSHbsAMBCd9qZ5mj6rXCwZ/UKrgtxGC2lw9DsMTJVACX5
	 BxdmWvEWsu/Nw==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a2331caab22so161946266b.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 20:50:57 -0800 (PST)
X-Gm-Message-State: AOJu0YwUwklLUT97Bzl1F3Pw7R1rfWKnYGXptsW5o9GUBS6cP7ZGybQ5
	/MHtD3ayNX8xwBswTz9ENPpLILUEPmMTs4DkdK4=
X-Google-Smtp-Source: AGHT+IGWvwT64VgFovv+c7qqHAeH9Td6lUqhBKTKZF7USauEgYd1T/2cWvULuhrGCPCvy2nROY7kM+DKUTSU9Jfz6Q0=
X-Received: by 2002:a17:906:82:b0:a23:6fe5:affe with SMTP id
 2-20020a170906008200b00a236fe5affemr414814ejc.62.1703220656295; Thu, 21 Dec
 2023 20:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-3-guoren@kernel.org>
 <ZYUD4C1aXWt2oFJo@LeoBras> <CAJF2gTSiaNWkXS6rc+3OSZfnFqG2d7btzjrd-L1mBgAVu3ym3A@mail.gmail.com>
 <ZYUT22KmGJ1tJSWx@LeoBras>
In-Reply-To: <ZYUT22KmGJ1tJSWx@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 12:50:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRptBZyYbnY-mjn-AuQwVnekQtGY8nAOV7KVWLCY1WBcw@mail.gmail.com>
Message-ID: <CAJF2gTRptBZyYbnY-mjn-AuQwVnekQtGY8nAOV7KVWLCY1WBcw@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
To: Leonardo Bras <leobras@redhat.com>
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alexghiti@rivosinc.com, charlie@rivosinc.com, xiao.w.wang@intel.com, 
	david@redhat.com, panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com, 
	willy@infradead.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	cleger@rivosinc.com, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_205102_160455_13BCC2AB 
X-CRM114-Status: GOOD (  33.00  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6NDPigK9QTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFz
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6MjY6MTlQ
TSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+IE9uIEZyaSwgRGVjIDIyLCAyMDIzIGF0IDExOjM1
4oCvQU0gTGVvbmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6NDY6NTlBTSAtMDUwMCwgZ3VvcmVuQGtlcm5l
bC5vcmcgd3JvdGU6Cj4gPiA+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEu
Y29tPgo+ID4gPiA+Cj4gPiA+ID4gV2hlbiB0aGUgdGFzayBpcyBpbiBDT01QQVQgbW9kZSwgdGhl
IGFyY2hfZ2V0X21tYXBfZW5kIHNob3VsZCBiZSAyR0IsCj4gPiA+ID4gbm90IFRBU0tfU0laRV82
NC4gVGhlIFRBU0tfU0laRSBoYXMgY29udGFpbmVkIGlzX2NvbXBhdF9tb2RlKCkKPiA+ID4gPiBk
ZXRlY3Rpb24sIHNvIGNoYW5nZSB0aGUgZGVmaW5pdGlvbiBvZiBTVEFDS19UT1BfTUFYIHRvIFRB
U0tfU0laRQo+ID4gPiA+IGRpcmVjdGx5Lgo+ID4gPgo+ID4gPiBvawo+ID4gPgo+ID4gPiA+Cj4g
PiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiBGaXhlczogYWRkMmNjNmI2
NTE1ICgiUklTQy1WOiBtbTogUmVzdHJpY3QgYWRkcmVzcyBzcGFjZSBmb3Igc3YzOSxzdjQ4LHN2
NTciKQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJh
LmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
PiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8
IDYgKystLS0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+
ID4gPiBpbmRleCBmMTlmODYxY2RhNTQuLjFmNTM4ZmM0NDQ4ZCAxMDA2NDQKPiA+ID4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiA+ID4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ID4gPiA+IEBAIC0xNiwxNSArMTYsMTMgQEAK
PiA+ID4gPgo+ID4gPiA+ICAjaWZkZWYgQ09ORklHXzY0QklUCj4gPiA+ID4gICNkZWZpbmUgREVG
QVVMVF9NQVBfV0lORE9XICAgKFVMKDEpIDw8IChNTUFQX1ZBX0JJVFMgLSAxKSkKPiA+ID4gPiAt
I2RlZmluZSBTVEFDS19UT1BfTUFYICAgICAgICAgICAgICAgIFRBU0tfU0laRV82NAo+ID4gPiA+
ICsjZGVmaW5lIFNUQUNLX1RPUF9NQVggICAgICAgICAgICAgICAgVEFTS19TSVpFCj4gPiA+Cj4g
PiA+IEl0IG1lYW5zIFNUQUNLX1RPUF9NQVggd2lsbCBiZSBpbiA2NEJJVDoKPiA+ID4gLSBUQVNL
X1NJWkVfMzIgaWYgY29tcGF0X21vZGU9eQo+ID4gPiAtIFRBU0tfU0laRV82NCBpZiBjb21wYXRf
bW9kZT1uCj4gPiA+Cj4gPiA+IE1ha2VzIHNlbnNlIGZvciBtZS4KPiA+ID4KPiA+ID4gPgo+ID4g
PiA+ICAjZGVmaW5lIGFyY2hfZ2V0X21tYXBfZW5kKGFkZHIsIGxlbiwgZmxhZ3MpICAgICAgICAg
ICAgICAgICAgXAo+ID4gPiA+ICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgbW1h
cF9lbmQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICAgICAgIHR5
cGVvZihhZGRyKSBfYWRkciA9IChhZGRyKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gPiA+IC0gICAgIGlmICgoX2FkZHIpID09IDAgfHwgKElTX0VOQUJMRUQoQ09ORklHX0NPTVBB
VCkgJiYgaXNfY29tcGF0X3Rhc2soKSkpIFwKPiA+ID4gPiAtICAgICAgICAgICAgIG1tYXBfZW5k
ID0gU1RBQ0tfVE9QX01BWDsgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiAtICAgICBl
bHNlIGlmICgoX2FkZHIpID49IFZBX1VTRVJfU1Y1NykgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ID4gPiArICAgICBpZiAoKF9hZGRyKSA9PSAwIHx8IChfYWRkcikgPj0gVkFfVVNFUl9TVjU3
KSAgICAgICAgICAgIFwKPiA+ID4gPiAgICAgICAgICAgICAgIG1tYXBfZW5kID0gU1RBQ0tfVE9Q
X01BWDsgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiAgICAgICBlbHNlIGlmICgoKChf
YWRkcikgPj0gVkFfVVNFUl9TVjQ4KSkgJiYgKFZBX0JJVFMgPj0gVkFfQklUU19TVjQ4KSkgXAo+
ID4gPiA+ICAgICAgICAgICAgICAgbW1hcF9lbmQgPSBWQV9VU0VSX1NWNDg7ICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gPgo+ID4gPgo+ID4gPiBJIGRvbid0IHRoaW5rIEkgZ290IHRoaXMg
Y2hhbmdlLCBvciBob3cgaXQncyBjb25uZWN0ZWQgdG8gdGhlIGNvbW1pdCBtc2cuCj4gPiBUaGUg
YWJvdmUgaXMganVzdCBjb2RlIHNpbXBsaWZpY2F0aW9uOyBpZiBTVEFDS19UT1BfTUFYIGlzIFRB
U0tfU0laRSwgdGhlbgo+ID4KPiA+ICAgICAgaWYgKChfYWRkcikgPT0gMCB8fCAoSVNfRU5BQkxF
RChDT05GSUdfQ09NUEFUKSAmJiBpc19jb21wYXRfdGFzaygpKSkgXAo+ID4gICAgICAgICAgICAg
IG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAg
ICBlbHNlIGlmICgoX2FkZHIpID49IFZBX1VTRVJfU1Y1NykgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+Cj4gPiBpcyBlcXVhbCB0bzoKPiA+Cj4gPiAgICAgIGlmICgoX2FkZHIpID09IDAgfHwg
KF9hZGRyKSA+PSBWQV9VU0VSX1NWNTcpICAgICAgICAgICAgXAo+Cj4gSSBhbSBmYWlsaW5nIHRv
IHVuZGVyc3RhbmQgZXhhY3RseSBob3cgYXJlIHRoZXkgZXF1YWwuCj4gSSBtZWFuLCB3aGF0IGlu
IHlvdXIgU1RBQ0tfVE9QX01BWCBjaGFuZ2UgbWFkZSB0aGVtIGVxdWFsPwojZGVmaW5lIFNUQUNL
X1RPUF9NQVggVEFTS19TSVpFCiNkZWZpbmUgVEFTS19TSVpFICAgICAgIChpc19jb21wYXRfdGFz
aygpID8gVEFTS19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQoKPgo+IFNlZSBiZWxvdywgdGhlIGJl
aGF2aW9yIGNoYW5nZWQ6Cj4gPgo+ID4gPgo+ID4gPiBCZWZvcmU6Cj4gPiA+IC0gYWRkciA9PSAw
LCBvciBhZGRyID4gMl41Nywgb3IgY29tcGF0OiBtbWFwX2VuZCA9IFNUQUNLX1RPUF9NQVgKPiA+
ID4gLSAyXjQ4IDwgYWRkciA8IDJeNTc6IG1tYXBfZW5kID0gMl40OAo+ID4gPiAtIDAgPCBhZGRy
IDwgMl40OCA6IG1tYXBfZW5kID0gMl4zOQo+ID4gPgo+ID4gPiBOb3c6Cj4gPiA+IC0gYWRkciA9
PSAwLCBvciBhZGRyID4gMl41NzogbW1hcF9lbmQgPSBTVEFDS19UT1BfTUFYCj4gPiA+IC0gMl40
OCA8IGFkZHIgPCAyXjU3OiBtbWFwX2VuZCA9IDJeNDgKPiA+ID4gLSAwIDwgYWRkciA8IDJeNDgg
OiBtbWFwX2VuZCA9IDJeMzkKPiA+ID4KPiA+ID4gSUlVQyBjb21wYXQgbW9kZSBhZGRyIHdpbGwg
YmUgPCAyXjMyLCBzbyB3aWxsIGFsd2F5cyBoYXZlIG1tYXBfZW5kID0gMl4zOQo+ID4gPiBpZiBh
ZGRyICE9IDAuIElzIHRoYXQgZGVzaXJlYWJsZT8KPiA+ID4gKGlmIG5vdCwgYWJvdmUgY2hhbmdl
IGlzIHVubmVlZGVkKQo+ID4gPgo+Cj4gXgo+Cj4gV2l0aCB5b3VyIGNoYW5nZSBvbiBTVEFDS19U
T1BfTUFYIG9ubHkgKG5vdCBjaGFuZ2luZyBhcmNoX2dldF9tbWFwX2VuZCksCj4geW91IHdvdWxk
IGhhdmU6Cj4KPiAtIGNvbXBhdF9tb2RlICYgKDAgPCBhZGRyIDwgMl4zMikgICAgICAgLT4gbW1h
cF9lbmQgPSAyXjMyCmNvbXBhdF9tb2RlICAgICAgLT4gbW1hcF9lbmQgPSAyXjMyCgo+IC0gbm9u
LWNvbXBhdCwgYWRkciA9PSAwLCBvciBhZGRyID4gMl41NyAtPiBtbWFwX2VuZCA9IFRBU0tfU0la
RV82NAo+IC0gbm9uLWNvbXBhdCwgKDJeNDggPCBhZGRyIDwgMl41NykgICAgICAtPiBtbWFwX2Vu
ZCA9IDJeNDgKPiAtIG5vbi1jb21wYXQsICgwIDwgYWRkciA8IDJeNDgpICAgICAgICAgLT4gbW1h
cF9lbmQgPSAyXjM5Cj4KPiBXaGljaCBzZWVtcyBtb3JlIGxpa2VseSwgYmFzZWQgb24gQ2hhcmxp
ZSBjb21tZW50cy4KPgo+IFRoYW5rcywKPiBMZW8KPgo+ID4gPiBBbHNvLCB1bnJlbGF0ZWQgdG8g
dGhlIGNoYW5nZToKPiA+ID4gLSAyXjQ4IDwgYWRkciA8IDJeNTc6IG1tYXBfZW5kID0gMl40OAo+
ID4gPiBJcyB0aGUgYWJvdmUgY29ycmVjdD8KPiA+ID4gSXQgbG9va3MgbGlrZSBpdCBzaG91bGQg
YmUgMl41NyBpbnN0ZWFkLCBhbmQgYSBuZXcgaWYgY2xhdXNlIGZvcgo+ID4gPiAyXjMyIDwgYWRk
ciA8IDJeNDggc2hvdWxkIGhhdmUgbW1hcF9lbmQgPSAyXjQ4Lgo+ID4gPgo+ID4gPiBEbyBJIGdl
dCBpdCB3cm9uZz8KPiA+IE1heWJlIEkgc2hvdWxkIG1vdmUgdGhpcyBpbnRvIHRoZSBvcHRpbWl6
YXRpb24gcGFydC4KPiA+Cj4gPiA+Cj4gPiA+IChJIHdpbGwgc2VuZCBhbiBSRkMgJ2ZpeGluZycg
dGhlIGNvZGUgdGhlIHdheSBJIGFtIHdoaW5raW5nIGl0IHNob3VsZCBsb29rCj4gPiA+IGxpa2Up
Cj4gPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gTGVvCj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+Cj4g
PiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjQwLjEKPiA+ID4gPgo+ID4gPgo+ID4KPiA+Cj4gPiAt
LQo+ID4gQmVzdCBSZWdhcmRzCj4gPiAgR3VvIFJlbgo+ID4KPgoKCi0tIApCZXN0IFJlZ2FyZHMK
IEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
