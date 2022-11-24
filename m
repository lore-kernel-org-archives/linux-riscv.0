Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70584C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 02:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BM/2Bbckr4K9c7udO2HeyIr/kLYEtlxv6Q50APSZaFQ=; b=R/6fCWNMKq6QCP
	u5BRL4Kwmb2/tcqe2d3sHGdpsF8e0C/7i5X4m3T9nrojcAdeN7E74jXBhsDscx+riznkq/UHzjq4+
	erdZQAiezlk//xl9kwZv1x9VGWagqBkqQb3OqzG8cgbpZYNWVgxRPPka/g0OfCSGqhr+F73kKouxM
	22Pj8dct7fNCvQwCzqDklX7yM65KNrkdau/2wNsu6K6q0UJ4HTCmQxBljbt+IbtHT1qiMlF4qinUR
	oN0ra8Z8G5MWHxjOPDMHfzyptAlm1xhyK73F+GXaFLqW8nM+FqzojNpTcPQUBlKTkN5wcV9Nc7I9w
	ioBHAABYDfLqEPdjJ24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy1fG-003hOp-8Z; Thu, 24 Nov 2022 02:08:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy1fD-003hMD-C2
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 02:08:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1FB5BCE28E7
	for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EEEC4314D
	for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669255704;
	bh=HR8w//VHwZwvQaS0YJg6erH8I27q6vnRtZMxt1FAYzA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fuLFLmszeHWtvtJ3EUM/43KdoAnPg4LteW9PWtMTOqBrFh0nh0wRWysPfxHi9D/tz
	 gEDhg0DGGQ6pboWrYare6LqiEZbOdfMr2td5wpD2ZJVHtDJaqG1mc03CNIKcXybtps
	 JHuF4jBaJaYqlWBzUm/gQXIOCLtOOrKWH0OLtLy75pRXKC7TLEM8b450sWVP3gaEQh
	 600eWdODSu++vxVa3CX2LXGikkzk2uU0N0S5r7wdng79DUY7tOx5rPjoLKMEAzBveG
	 OIFUF/hSBSj622PL+c+U//W8aPjyHoLiQ2IAPjBLMJoJvZKCvBpYmnAFgzOTtgOhWz
	 s3iBamBQ0UB8w==
Received: by mail-ej1-f41.google.com with SMTP id e27so1079145ejc.12
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 18:08:23 -0800 (PST)
X-Gm-Message-State: ANoB5pm3yw/o73Vcv2vBK5o5kfpdllkwi7PeWTA5RX4NZaO+BwgY+Zbv
	qpyZvhXF0i9LCnNdocniNNLGJ6YQB27f/B6L/hw=
X-Google-Smtp-Source: AA0mqf7+jVujXIP+lyusS56nUJfILvJ+Hp/TSudQIeB4APkelF0/LZfiC4VbVnCdIYrSELTqk4ZXwVz9NxhPqHQaCp8=
X-Received: by 2002:a17:906:4e8c:b0:7ba:9c18:1204 with SMTP id
 v12-20020a1709064e8c00b007ba9c181204mr2773475eju.262.1669255702092; Wed, 23
 Nov 2022 18:08:22 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com>
 <20221123142025.1504030-2-suagrfillet@gmail.com> <CAJF2gTTwvApRaGhZJxOrdcjWUC9DN-WF_7EKcHXx5HZ9Jkd5EA@mail.gmail.com>
 <CAAYs2=ghhMmmrM4Bktvw9iGiajS5PLd1=Z61j2ZfhbhGUi4ekg@mail.gmail.com>
In-Reply-To: <CAAYs2=ghhMmmrM4Bktvw9iGiajS5PLd1=Z61j2ZfhbhGUi4ekg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 24 Nov 2022 10:08:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTgTfGAYTWbqqrdZg9bMjbpQfx8GzFzxoq3C4r9HDpz8Q@mail.gmail.com>
Message-ID: <CAJF2gTTgTfGAYTWbqqrdZg9bMjbpQfx8GzFzxoq3C4r9HDpz8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_180831_765480_3BD29D18 
X-CRM114-Status: GOOD (  29.36  )
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

T24gVGh1LCBOb3YgMjQsIDIwMjIgYXQgMToyNyBBTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLl
ubQxMeaciDIz5pel5ZGo5LiJIDIzOjAy5YaZ6YGT77yaCj4gPgo+ID4gQ29vbCBqb2IsIHRoeC4K
PiA+Cj4gPiBPbiBXZWQsIE5vdiAyMywgMjAyMiBhdCAxMDoyMCBQTSBTb25nIFNodWFpIDxzdWFn
cmZpbGxldEBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBhZGRzIERZTkFN
SUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIHN1cHBvcnQgZm9yIFJJU0MtVi4KPiA+Pgo+ID4+
IHNlbGVjdCB0aGUgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgdG8gcHJvdmlkZSB0
aGUKPiA+PiByZWdpc3Rlcl9mdHJhY2VfZGlyZWN0W19tdWx0aV0gaW50ZXJmYWNlcyBhbGxvd2lu
ZyB1c2VycyB0byByZWdpc3Rlcgo+ID4+IHRoZSBjdXN0b21lZCB0cmFtcG9saW5lIChkaXJlY3Rf
Y2FsbGVyKSBhcyB0aGUgbWNvdW50IGZvciBvbmUgb3IKPiA+PiBtb3JlIHRhcmdldCBmdW5jdGlv
bnMuIEFuZCBtb2RpZnlfZnRyYWNlX2RpcmVjdFtfbXVsdGldIGFyZSBhbHNvCj4gPj4gcHJvdmlk
ZWQgZm9yIG1vZGlmeWluZyBkaXJlY3RfY2FsbGVyLgo+ID4+Cj4gPj4gVG8gbWFrZSB0aGUgZGly
ZWN0X2NhbGxlciBhbmQgdGhlIG90aGVyIGZ0cmFjZSBob29rcyAoZWcuIGZ1bmN0aW9uL2ZncmFw
aAo+ID4+IHRyYWNlciwga1tyZXRdcHJvYmVzKSBjby1leGlzdCwgYSB0ZW1wb3JhcnkgcmVnaXN0
ZXIgaXMgbm9taW5hdGVkIHRvCj4gPj4gc3RvcmUgdGhlIGFkZHJlc3Mgb2YgZGlyZWN0X2NhbGxl
ciBpbiBmdHJhY2VfcmVnc19jYWxsZXIuIEFmdGVyIHRoZQo+ID4+IHNldHRpbmcgb2YgdGhlIGFk
ZHJlc3MgZGlyZWN0X2NhbGxlciBieSBkaXJlY3Rfb3BzLT5mdW5jIGFuZCB0aGUKPiA+PiBSRVNU
T1JFX1JFR1MgaW4gZnRyYWNlX3JlZ3NfY2FsbGVyLCBkaXJlY3RfY2FsbGVyIHdpbGwgYmUganVt
cGVkIHRvCj4gPj4gYnkgdGhlIGBqcmAgaW5zdC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFNv
bmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiA+PiAtLS0KPiA+PiAgYXJjaC9yaXNj
di9LY29uZmlnICAgICAgICAgICAgICB8IDEgKwo+ID4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Z0cmFjZS5oIHwgNiArKysrKysKPiA+PiAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5T
ICB8IDQgKysrKwo+ID4+ICAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiA+Pgo+
ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+PiBpbmRleCAzOWVjOGQ2MjhjZjYuLmQwODNlYzA4ZDBiNiAxMDA2NDQKPiA+PiAtLS0gYS9h
cmNoL3Jpc2N2L0tjb25maWcKPiA+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+PiBAQCAt
Mjc4LDYgKzI3OCw3IEBAIGNvbmZpZyBBUkNIX1JWNjRJCj4gPj4gICAgICAgICBzZWxlY3QgQVJD
SF9TVVBQT1JUU19JTlQxMjggaWYgQ0NfSEFTX0lOVDEyOAo+ID4+ICAgICAgICAgc2VsZWN0IEhB
VkVfRFlOQU1JQ19GVFJBQ0UgaWYgIVhJUF9LRVJORUwgJiYgTU1VICYmICQoY2Mtb3B0aW9uLC1m
cGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTgpCj4gPj4gICAgICAgICBzZWxlY3QgSEFWRV9EWU5B
TUlDX0ZUUkFDRV9XSVRIX1JFR1MgaWYgSEFWRV9EWU5BTUlDX0ZUUkFDRQo+ID4+ICsgICAgICAg
c2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMKPiA+PiAgICAgICAg
IHNlbGVjdCBIQVZFX0ZUUkFDRV9NQ09VTlRfUkVDT1JEIGlmICFYSVBfS0VSTkVMCj4gPj4gICAg
ICAgICBzZWxlY3QgSEFWRV9GVU5DVElPTl9HUkFQSF9UUkFDRVIKPiA+PiAgICAgICAgIHNlbGVj
dCBIQVZFX0ZVTkNUSU9OX1RSQUNFUiBpZiAhWElQX0tFUk5FTCAmJiAhUFJFRU1QVElPTgo+ID4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4+IGluZGV4IDAxYmViYjI4ZWFiZS4uYmU0ZDU3NTY2
MTM5IDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiA+
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gPj4gQEAgLTExNCw2ICsx
MTQsMTIgQEAgc3RydWN0IGZ0cmFjZV9yZWdzOwo+ID4+ICB2b2lkIGZ0cmFjZV9ncmFwaF9mdW5j
KHVuc2lnbmVkIGxvbmcgaXAsIHVuc2lnbmVkIGxvbmcgcGFyZW50X2lwLAo+ID4+ICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wLCBzdHJ1Y3QgZnRyYWNlX3JlZ3Mg
KmZyZWdzKTsKPiA+PiAgI2RlZmluZSBmdHJhY2VfZ3JhcGhfZnVuYyBmdHJhY2VfZ3JhcGhfZnVu
Ywo+ID4+ICsKPiA+PiArc3RhdGljIGlubGluZSB2b2lkIGFyY2hfZnRyYWNlX3NldF9kaXJlY3Rf
Y2FsbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gPj4gK3sK
PiA+PiArICAgICAgICAgICAgICAgcmVncy0+dDEgPSBhZGRyOwo+ID4KPiA+IEhvdyBhYm91dCBy
ZWdzLT50MCA9IGFkZHI7ID8KPiA+IEFuZCBkZWxldGUgYWxsIG1jb3VudC1keW4uUyBtb2RpZmlj
YXRpb24uCj4gPgo+IFRoZSBkaXJlY3RfY2FsbGVyIGhhcyB0aGUgc2FtZSBwcm9ncmFtIGxheW91
dCBhcyB0aGUgZnRyYWNlX2NhbGxlciwgd2hpY2ggbWVhbnMKPiB0aGUgcmVnIHQwIHdpbGwgbmV2
ZXIgYmUgY2hhbmdlZCB3aGVuIGRpcmVjdF9jYWxsZXIgcmV0dXJucy4KPgo+IElmIHJlZ3MtPnQw
IGNoYW5nZXMgaGVyZSBhbmQgZnRyYWNlX3JlZ3NfY2FsbGVyIGV4ZWN1dGVzIGBqciB0MGAsCj4g
ZGlyZWN0X2NhbGxlciB3aWxsIGVudGVyIHRoZSBkZWFkIGxvb3AuCj8KCmZ0cmFjZV9yZWdzX2Nh
bGxlci0+Y2FsbF9kaXJlY3RfZnVuY3MtPgphcmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2NhbGxlci0+
IGZ0cmFjZV9yZWdzX2NhbGxlciBqciB0MC4KCk9ubHkgY2FsbF9kaXJlY3RfZnVuY3MgY2FsbCBh
cmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2NhbGxlciAhCgpzdGF0aWMgdm9pZCBjYWxsX2RpcmVjdF9m
dW5jcyh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBpcCwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wcywgc3RydWN0IGZ0cmFjZV9yZWdz
ICpmcmVncykKewogICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzID0gZnRyYWNlX2dldF9yZWdz
KGZyZWdzKTsKICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHI7CgogICAgICAgIGFkZHIgPSBmdHJh
Y2VfZmluZF9yZWNfZGlyZWN0KGlwKTsKICAgICAgICBpZiAoIWFkZHIpCiAgICAgICAgICAgICAg
ICByZXR1cm47CgogICAgICAgIGFyY2hfZnRyYWNlX3NldF9kaXJlY3RfY2FsbGVyKHJlZ3MsIGFk
ZHIpOwp9Cgo+Cj4gQWN0dWFsbHkgdGhlIHJlZyB0MCBhbHdheXMgc2F2ZXMgdGhlIGFkZHJlc3Mg
b2YgZnVuY3Rpb24gZW50cnkgd2l0aCA4Qgo+IG9mZnNldCwgaXQgc2hvdWxkIG9ubHkKPiBjaGFu
Z2VkIGJ5IHRoZSBJUE1PRElGWSBvcHMgaW5zdGVhZCBvZiB0aGUgZGlyZWN0X29wcy4KPiA+Pgo+
ID4+ICt9Cj4gPj4gKwo+ID4+ICAjZW5kaWYgLyogQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhf
UkVHUyAqLwo+ID4+Cj4gPj4gICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiA+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TIGIvYXJjaC9yaXNjdi9rZXJuZWwv
bWNvdW50LWR5bi5TCj4gPj4gaW5kZXggNDY2YzZlZjIxN2IxLi5iODljODVhNTg1NjkgMTAwNjQ0
Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4gPj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4gPj4gQEAgLTIzMyw2ICsyMzMsNyBAQCBFTkRQ
Uk9DKGZ0cmFjZV9jYWxsZXIpCj4gPj4gICNlbHNlIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9X
SVRIX1JFR1MgKi8KPiA+PiAgRU5UUlkoZnRyYWNlX3JlZ3NfY2FsbGVyKQo+ID4+ICAgICAgICAg
U0FWRV9BQklfUkVHUyAxCj4gPj4gKyAgICAgICBSRUdfUyAgIHgwLCBQVF9UMShzcCkKPiA+PiAg
ICAgICAgIFBSRVBBUkVfQVJHUwo+ID4+Cj4gPj4gIGZ0cmFjZV9yZWdzX2NhbGw6Cj4gPj4gQEAg
LTI0MSw3ICsyNDIsMTAgQEAgZnRyYWNlX3JlZ3NfY2FsbDoKPiA+Pgo+ID4+Cj4gPj4gICAgICAg
ICBSRVNUT1JFX0FCSV9SRUdTIDEKPiA+PiArICAgICAgIGJuZXogICAgdDEsLkxkaXJlY3QKPiA+
PiAgICAgICAgIGpyIHQwCj4gPj4gKy5MZGlyZWN0Ogo+ID4+ICsgICAgICAganIgdDEKPiA+PiAg
RU5EUFJPQyhmdHJhY2VfcmVnc19jYWxsZXIpCj4gPj4KPiA+PiAgRU5UUlkoZnRyYWNlX2NhbGxl
cikKPiA+PiAtLQo+ID4+IDIuMjAuMQo+ID4+Cj4gPgo+ID4KPiA+IC0tCj4gPiBCZXN0IFJlZ2Fy
ZHMKPiA+ICBHdW8gUmVuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
