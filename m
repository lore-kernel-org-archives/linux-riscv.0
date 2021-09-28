Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF67EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 23:22:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99B2A613A9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 23:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99B2A613A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=M1QTcnHDllCC6Tu7fRxajVJ0W7+jx5YgLAxM0QALE8E=; b=geyNpl+uSAOdTd0G2JtQh24B3W
	M32FDk4OGgzb5NG3vCoYunj5cpmh2DyYLj/MwIjKGvGz91noRvAgkQ+wB+KkaEMzOkP1gou7SIom/
	1FcC04TamcRMPxjg/olhZtAfWVsx/4xknBiypr4Xc2MlZAkR44cVD1IZoJiAp3U+MOD+k5Emq3ef3
	XmQVLpAq7NBBQuRxv/asXJNXYrGbKER5h1O5AlqzZOCGNQq7gMGZxdbkUoA//mgqV30u/6BaJGrA0
	d8aP/d3UkNqj/af0SmLCPx8PDpiiLwldJpOavU3jk/23CRPiFEB0yQ1wuPf3JrK9XzFgMHUBDxjCK
	ftho5ZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVMQQ-009GL1-DJ; Tue, 28 Sep 2021 23:22:14 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLpP-0098ZB-A4
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 22:44:01 +0000
Received: by mail-pg1-x530.google.com with SMTP id n18so578954pgm.12
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 15:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=urWsCSbXbAi7tt9k/g8fL2fLWj6BNU1hEQXgsXHNZ/k=;
 b=6hU7w5SQ4GHQkye/F7Owfezll4lPc6u29TWkzVb1iMHKs6DC3qehAvJPVTKt86/gf8
 4CrG0+U3DB8kG8srI649NcdDis0zMC/rU0BEaPMoQMB1+rCJVkaqyH4cQHtwmlLWrHd3
 uVgjWpVVG+VAL8dNUM+3mtsjXH0pMISZSxbhQgmp0vhBiNK9gGkIahhUJFUzS/HZd+0B
 Ob2mqtCPKeeYzNbNjHIvAkaWDTYsFyABAYzKo1j83h01nxMEPkyucce4o/LdR5KDVkow
 bnSWES/9xVpuVYwJ5wWsJkg2Xwc1pU4Yk3bu5fwPiuF4I1g4BP8s/wR7/52CDmHVg17X
 t0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=urWsCSbXbAi7tt9k/g8fL2fLWj6BNU1hEQXgsXHNZ/k=;
 b=7iYT24caDfHkZ+rjD8bznNNIekfBdWE0STsU/oUIOmQSjGx/7SrNCq68BJ+dDKcrvr
 Ty3rU8iF/PzXSsmRH1kiYGPcuyDN3jPkHxt7Tbb2D8xZG9Pf8GOtygTU62Mq7P0HGY57
 miKbSkxzvjlC5nfkJKo+R6Bii4HkXms91z3aQLPcYLfN7Ej8PXlA6I5p24GCTeDyClIo
 1VjjRoAJ0yIOW1/zlFCFACMAFgDBSg9CxBlL0ptqNYKsGRIu9zw5VSr7lCOmDMAZFCDR
 w+pJe0pbcmj5Fz0WosqHce5YlZV/FXf8dz/FHxpyn8ERABk1AsTrjY2zcf8K3ECUqkoL
 LG3A==
X-Gm-Message-State: AOAM530OkXaM/zdBem6AKundvi1bee9EHFyDvvXnk4iSutinVJMZ5gbo
 8O3OGZR5fYJvS7GIcnvMZIQ9ww==
X-Google-Smtp-Source: ABdhPJxKBpQMmHvGJp9oteYrxNSA1vE4oYUcwERQDcZp0gwtDJnmX85Zk9ej+3xYgrGYDuvZn8wpVg==
X-Received: by 2002:a05:6a00:cd4:b0:44b:b523:4d7 with SMTP id
 b20-20020a056a000cd400b0044bb52304d7mr4197851pfv.72.1632869036159; 
 Tue, 28 Sep 2021 15:43:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b23sm164876pfi.135.2021.09.28.15.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 15:43:55 -0700 (PDT)
Date: Tue, 28 Sep 2021 15:43:55 -0700 (PDT)
X-Google-Original-Date: Tue, 28 Sep 2021 15:43:53 PDT (-0700)
Subject: Re: Status of the various RISC-V specification and policy
In-Reply-To: <CAOnJCUJp7-7UmekMsjjiEz3T1fa8-oA6-e-UgM2y5OrvkHV13g@mail.gmail.com>
CC: markhimelstein@riscv.org, linux-riscv@lists.infradead.org,
 u-boot@lists.denx.de, 
 ahs3@redhat.com, pbonzini@redhat.com, Christoph Hellwig <hch@lst.de>,
 drjones@redhat.com, xypron.glpk@gmx.de, tekkamanninja@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 ksankaran@ventanamicro.com, ptomsich@ventanamicro.com, anup@brainfault.org,
 stephano@riscv.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-23f0afb2-f714-42ad-bce1-0cfc928c2612@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_154359_402637_B02F63F1 
X-CRM114-Status: GOOD (  31.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyOCBTZXAgMjAyMSAxMzowNTo1MyBQRFQgKC0wNzAwKSwgYXRpc2hwQGF0aXNocGF0
cmEub3JnIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDI4LCAyMDIxIGF0IDExOjM0IEFNIFBhbG1lciBE
YWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+Pgo+PiBPbiBNb24sIDI3IFNlcCAy
MDIxIDA4OjU3OjE1IFBEVCAoLTA3MDApLCBtYXJraGltZWxzdGVpbkByaXNjdi5vcmcgd3JvdGU6
Cj4+ID4gdGhlIHdvcmRzIGluIHRoaXMgZG9jdW1lbnQgOgo+PiA+Cj4+ID4gaHR0cHM6Ly93aWtp
LnJpc2N2Lm9yZy9wbHVnaW5zL3NlcnZsZXQvbW9iaWxlP2NvbnRlbnRJZD0xMzA5ODIzMCNjb250
ZW50L3ZpZXcvMTMwOTgyMzAKPj4gPgo+PiA+IG1ha2UgaXQgdmVyeSBjbGVhciB3aGVuIGNoYW5n
ZXMgYXJlIGFsbG93ZWQgb3Igbm90IGFuZCBsaWtlbHkgb3Igbm90Lgo+PiA+Cj4+ID4gaWYgeW91
IHRoaW5rIHRoZSB2ZXJiaWFnZSBpcyBzb21laG93IGFtYmlndW91cyBwbGVhc2UgaGVscCB1cyBt
YWtlIGl0IGJldHRlci4KPj4KPj4gSSdtIG5vdCByZWFsbHkgd29ycmllZCBhYm91dCBjaGFuZ2Vz
LCBJJ20gd29ycmllZCBhYm91dCBhIGNvbW1pdHRtZW50IHRvCj4+IGZ1dHVyZSBjb21wYXRpYmls
aXR5LiAgV2hlbiB3ZSB0YWtlIGNvZGUgaW50byB0aGUga2VybmVsIChhbmQgbW9zdCBvdGhlcgo+
PiBjb3JlIHN5c3RlbXMgcHJvamVjdHMpIHdlJ3JlIHRha2luZyBvbiB0aGUgYnVyZGVuIG9mIHN1
cHBvcnRpbmcgKHVudGlsCj4+IHNvbWVvbmUgY2FuIHByb3ZlIHRoZXJlIGFyZSBubyBtb3JlIHVz
ZXJzKSwgd2hpY2ggaXMgdmVyeSBkaWZmaWN1bHQgdG8KPj4gZG8gd2hlbiB0aGUgSVNBIGNoYW5n
ZXMgaW4gYW4gaW5jb21wYXRpYmxlIGZhc2hpb24uICBUaGUgd2hvbGUgcG9pbnQgb2YKPj4gYWdy
ZWVpbmcgb24gdGhlIGZyb3plbiB0aGluZyB3YXMgdGhhdCBpdCBnYXZlIHVzIGEgY29tbWl0dG1l
bnQgZnJvbSB0aGUKPj4gc3BlY2lmY2F0aW9uIGF1dGhvcnMgdGhhdCB0aGUgZnV0dXJlIElTQSB3
b3VsZCBiZSBjb21wYXRpYmxlIHdpdGggdGgKPj4gZnJvemVuIGV4dGVuc2lvbnMuCj4+Cj4+IFdl
J3JlIGFscmVhZHkgaW4gdGhpcyBzcG90IHdpdGggdGhlIFYgZXh0ZW5zaW9uIGFuZCB0aGUgd2hv
bGUgc3RhYmxlCj4+IHRoaW5nLCB0aGlzIGRlZmluaXRhaW9uIG9mIGZyb3plbiBsb29rcyB2ZXJ5
IG11Y2ggbGlrZSB3aGF0IHdhcyBoYXMgbGVkCj4+IHRvIHRoZSBpc3N1ZXMgdGhlcmUuICBTYXlp
bmcgdGhlIHNwZWMgd29uJ3QgY2hhbmdlIHJlYWxseSBpc24ndAo+PiBtZWFuaW5nZnVsLCBpdCdz
IHNheWluZyBmdXR1cmUgc3BlY3Mgd2lsbCBiZSBjb21wYXRpYmxlIHRoYXQncwo+PiBpbXBvcnRh
bnQuICBOb3RoaW5nIGluIHRoaXMgd2hvbGUgcnVsZSB0b3VjaGVzIG9uIGNvbXBhdGliaWxpdHks
IGFuZCBJCj4+IHJlYWxseSBkb24ndCB3YW50IHRvIGVuZCB1cCBpbiBhIGJpZ2dlciBtZXNzIHRo
YW4gd2UncmUgYWxyZWFkeSBpbi4KPj4KPj4gKEFsc286IHNvbWUgUEdFIHN1YmNvbnRyYWN0b3Ig
ZHJvdmUgYSBjcmFuZSBpbnRvIG15IGhvdXNlLCBzbyB0aGluZ3MgYXJlCj4+IGEgYml0IGNoYW90
aWMgb24gbXkgZW5kLiAgSWYgeW91IGhhdmUgdGhhdCBsaXN0IG9mIHdoYXQncyBvZmZpY2lhbGx5
Cj4+IGZyb3plbiwgY2FuIHlvdSBzZW5kIGl0IG91dD8gIEknbGwgdHJ5IHRvIHRha2UgYSBsb29r
IEFTQVAsIGFzIHRoZW4gSQo+PiBjYW4gYXQgbGVhc3QgZm9jdXMgdGhlIGRpc2N1c3Npb24gb24g
d2hhdCdzIHJlbGV2YW50IHJpZ2h0IG5vdy4pCj4KPiBIZXJlIGlzIHRoZSBsaXN0IG9mIHRoZSBz
cGVjcyB0aGF0IGFyZSBmcm96ZW4uCj4gaHR0cHM6Ly93aWtpLnJpc2N2Lm9yZy9kaXNwbGF5L1RF
Q0gvSVNBK0V4dGVuc2lvbnMrT24rRGVjaytmb3IrRnJlZXplK01pbGVzdG9uZQoKSG93IGRvZXMg
dGhhdCBpbmRpY2F0ZSB3aGF0IGlzIGZyb3plbj8gIEkgc2VlICJJU0EgRXh0ZW5zaW9ucyBPbiBE
ZWNrIApmb3IgRnJlZXplIE1pbGVzdG9uZSIgYXMgdGhlIHRpdGxlLCB3aGljaCBtYWtlcyBpdCBz
b3VuZCBsaWtlIHRoZXNlIGFyZSAKZXh0ZW5zaW9uIHRoYXQgYXJlIG5vdCB5ZXQgZnJvemVuIGJ1
dCB3aWxsIGJlIGV2ZW50dWFsbHkuCgpTY3JvbGxpbmcgZG93biB0byB0aGUgZW5kIG9mIHRoYXQg
bGlzdCwgaXQgbGlzdHMgcG9pbnRlciBtYXNraW5nLiAgVGhlIApiZXN0IEkgY2FuIGZpbmQgaXMg
Cmh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1qLWV4dGVuc2lvbi9ibG9iL21hc3Rlci9w
b2ludGVyLW1hc2tpbmctcHJvcG9zYWwuYWRvYyAKLCB3aGljaCBzYXlzICJWZXJzaW9uOiB2MC4x
LWRyYWZ0Iiwgd2hpY2ggZGVmaW5hdGVseSBkb2Vzbid0IHNvdW5kIApmcm96ZW4uICBUaGUgUkVB
RE1FIHNheXMgIldvcmtpbmcgRHJhZnQgb2YgdGhlIFJJU0MtViBKIEV4dGVuc2lvbiAKU3BlY2lm
aWNhdGlvbiIsIHdoaWNoIGFsc28gZG9lc24ndCBzb3VuZCBmcm96ZW4uCgo+IEkgd2lsbCBsZXQg
TWFyayBjb21tZW50IG9uIHRoZSBjb21wYXRpYmlsaXR5IHRoaW5nLgo+Cj4+Cj4+ID4KPj4gPiBN
YXJrCj4+ID4gLS0tLS0tLS0KPj4gPiBzZW50IGZyb20gYSBtb2JpbGUgZGV2aWNlLiBwbGVhc2Ug
Zm9yZ2l2ZSBhbnkgdHlwb3MuCj4+ID4KPj4gPj4gT24gU2VwIDI3LCAyMDIxLCBhdCA4OjUwIEFN
LCBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPj4gPj4KPj4gPj4g
77u/T24gVHVlLCAyMSBTZXAgMjAyMSAxNzoyMDoxNyBQRFQgKC0wNzAwKSwgYXRpc2hwQGF0aXNo
cGF0cmEub3JnIHdyb3RlOgo+PiA+Pj4gSGkgQWxsLAo+PiA+Pj4gUGxlYXNlIGZpbmQgdGhlIGJl
bG93IGVtYWlsIGZyb20gU3RlcGhhbm8gYWJvdXQgdGhlIGZyZWV6ZSBhbm5vdW5jZW1lbnQgZm9y
Cj4+ID4+PiB2YXJpb3VzIFJJU0MtViBzcGVjaWZpY2F0aW9ucyB0aGF0IHdpbGwgYmUgcGFydCBv
ZiBwcml2aWxlZ2Ugc3BlY2lmaWNhdGlvbgo+PiA+Pj4gdjEuMTIuCj4+ID4+PiBBbGwgdGhlIHJl
dmlldyBkaXNjdXNzaW9ucyBhcmUgaGFwcGVuaW5nIGluIHRoZSBpc2EtZGV2IG1haWxpbmcgbGlz
dC4gVGhlCj4+ID4+PiByZXZpZXcgcGVyaW9kIHdpbGwgYmUgb3BlbiBmb3IgNDUgZGF5cyBlbmRp
bmcgU3VuZGF5IE9jdG9iZXIgMzEsIDIwMjEuCj4+ID4+Pgo+PiA+Pj4gSSBqdXN0IHdhbnQgdG8g
aGlnaGxpZ2h0IHRoZSBmYWN0IHRoYXQgdGhlICpIKiwgKlYsIFN2UEJNVCwgQ01PIGV4dGVuc2lv
bnMKPj4gPj4+IGFyZSBmcm96ZW4gbm93LiAqVGhpcyB3aWxsIGhlbHAgdXMgbWVyZ2Ugc29tZSBw
YXRjaGVzIHRoYXQgaGF2ZSBiZWVuCj4+ID4+PiBwcmVzZW50IGluIHRoZSBtYWlsaW5nIGxpc3Qg
Zm9yIGEgd2hpbGUuCj4+ID4+Pgo+PiA+Pj4gSGVyZSBhcmUgdGhlIHJhdGlmaWNhdGlvbiBwb2xp
Y3kgYW5kIGV4dGVuc2lvbiBsaWZlIGN5Y2xlIGRvY3VtZW50cyBwcmVzZW50Cj4+ID4+PiBpbiB0
aGUgcHVibGljLiBJZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIHJlZ2FyZGluZyB0aGlzLCBwbGVh
c2UgY2hlY2sgd2l0aAo+PiA+Pj4gTWFyay9TdGVwaGFubyAoY2MnZCkuCj4+ID4+Pgo+PiA+Pj4g
UmF0aWZpY2F0aW9uIHBvbGljeToKPj4gPj4+IGh0dHBzOi8vZG9jcy5nb29nbGUuY29tL2RvY3Vt
ZW50L2QvMS1VbGFTR3FrNTlfbXlldVBNclY5Z3l1YUlnbm1GekdoNUdmeV90cFZpd00vZWRpdAo+
PiA+Pj4KPj4gPj4+IEV4dGVuc2lvbiBsaWZlIGN5Y2xlOgo+PiA+Pj4gaHR0cHM6Ly9kb2NzLmdv
b2dsZS5jb20vcHJlc2VudGF0aW9uL2QvMW5RNXVGYjM5S0E2Z3ZVaTVTUmVXZklRU2lSTjdocDZ6
N1pQZmN0RTRtS2svZWRpdCNzbGlkZT1pZC5wMQo+PiA+Pgo+PiA+PiBJJ20gc3RpbGwgYnVyaWVk
IGFmdGVyIFBsdW1iZXJzLCBidXQgb25lIG9mIHRoZSBiaXRzIG9uIG15IFRPRE8gbGlzdCB3YXMg
dG8gbG9vayB0aHJvdWdodCB0aGUgbmV3IGRlZmluaXRpb25zIGZvciBmcm96ZW4gYW5kIHN0YWJs
ZS4gIE5vdGhpbmcgaW4gdGhpcyBleHRlbnNpb24gbGlmZSBjeWNsZSB0YWxrcyBhYm91dCB0aGUg
cG9pbnQgYXQgd2hpY2ggY29tcGF0aWJpbGl0eSB3aWxsIGJlIG1haW50YWluZWQsIHdoaWNoIHdh
cyByZWFsbHkgdGhlIGNlbnRyYWwgcG9pbnQgYmVoaW5kIGZyb3plbiBiZWZvcmUuCj4+ID4+Cj4+
ID4+IEFyZSB0aGVyZSBtb3JlIGNvbmNyZXRlIGRlZmluaXRpb25zIHNvbWV3aGVyZT8KPgo+Cj4K
PiAtLSAKPiBSZWdhcmRzLAo+IEF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
