Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55540C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 23:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZwtRlW/PBX0sIGkTNvcFp2xqlPOYh6fmkv/PoVwz318=; b=481lXX0WQhRSNCS22ora225m6r
	2dPyr/XmoUG+Zi9MZzTle6qPNHfF6ir/41XKbggsA957Xnr8XCM2/97ZK/vLG1ser+g5+loJEoFBQ
	kwR5SbjHdmsDsF+ynKQ9R1kUZ+fp3tFfBPD7xayg6asWLD5xoM8Np6SQ6kk5yXF3D4Qr0d9xfRr4j
	EJH7TCufnepQFHnvySBDxixw6AHi6ior6rVDEfDPLTR+nBUIBXDETB354iqmBqvvIz1QReIQiIwU8
	W42an6B7irXBkIwWsoT7YmqMYfPQUjvPS8SwIXKzPdLVtgS9wIxhbrBvW7e4hrwsKw6fioIseWnIK
	OtgZjHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxcc7-00DKD1-1g;
	Fri, 12 May 2023 23:55:55 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxcc4-00DKBu-0t
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 23:55:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-643a1fed360so6304575b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 16:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683935751; x=1686527751;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcNIRUhv+RhxIe3njwEg9ROFrX7nFCGf82l67ZiH+3Q=;
        b=Gy+itav7j/qsAOntNoimOzYNlIuwJG0bLT9KoJcrXMWkJMZLu/O1Nyvbwuc8VbtD8q
         n5dVuPEXHClBA0OsHQwknJPoUBdriMnZV2BfZfEthARd3HZRVq9kaz+oGcFMVNvQMVBS
         VV9nugXpf0w78Caap9LmI7q8cnwuWAr1tqGeVh9Q2sKSQ/eonKzFtZ5bhlQqhdAwU92V
         2mfkCEO6wfKeKlOuCQjQWTOyUHJ8joXB0PulWOPZ6cKNViNQehmY1QbN4Axm30CrNCUk
         Y7desikLXtf3rih/RMnlIro2jMs0PrqT5OjvpK8WOCkGWl8q4H+iu3EBtedG4KD76cU8
         zRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683935751; x=1686527751;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcNIRUhv+RhxIe3njwEg9ROFrX7nFCGf82l67ZiH+3Q=;
        b=Vqc9ojWuN7xYrUyTY28pq8uJtTD1hW6L3EToyyo78BdEKd6FBgPvUGqHHGcPbQtZtt
         i3+h3W9MKVOUtpN5VsDk7NFskEvCB5vzt1QtroL52uvnHzLvEkSeG5nFa0OZ+Yo/HPua
         iRylIwVauzwsBod04Zg+BaKgC4VnGGr/qxyoknXkWv0wOXux/qwF+p0PSH4X9NanW2s2
         /CHwsQyyLGeLLqTxSejd2wpYEI5uRO9FCqaThrrwj+tkgb9r/62jwfAQ6nm/CDVMDh2B
         82FqmjR3QMI8rF6RklJcdm42uHafEt7P7rpirzCMBLzFCGWdvyC7EGge25X/McDYvdtR
         nmyg==
X-Gm-Message-State: AC+VfDwdct5lYkmrAflXIVx4qlD9DhZ1KJ1H0gMdEbsAB+l1t9u7/X6G
	tVhfWP5IA/WhfjNBczuu4cxBiA==
X-Google-Smtp-Source: ACHHUZ687fApdtfHuVTyBhy8kzysLSXqYITe1SVQAL9hJOmZGlPJB8gncLxkGSYUfSoUAvrOj8NWOw==
X-Received: by 2002:a17:902:f552:b0:1ac:a058:555e with SMTP id h18-20020a170902f55200b001aca058555emr18633709plf.8.1683935750891;
        Fri, 12 May 2023 16:55:50 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id t12-20020a170902a5cc00b001ab016e7916sm8528652plq.234.2023.05.12.16.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 16:55:50 -0700 (PDT)
Date: Fri, 12 May 2023 16:55:50 -0700 (PDT)
X-Google-Original-Date: Fri, 12 May 2023 16:55:47 PDT (-0700)
Subject: Re: [RFC 0/6] Deprecate riscv,isa DT property?
In-Reply-To: <20230512-exhume-unfold-f104dd4c4cbf@spud>
CC: atishp@atishpatra.org, linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de, cyy@cyyself.name,
  Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com, krste@sifive.com, Andrew Waterman <andrew@sifive.com>,
  gfavor@ventanamicro.com, markhimelstein@riscv.org, philipp.tomsich@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-e6406e20-3be9-480f-a42d-87a7b535f297@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_165552_558686_9CDB2853 
X-CRM114-Status: GOOD (  42.62  )
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

T24gRnJpLCAxMiBNYXkgMjAyMyAxNTowNToyNCBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+ICtDQyBHcmVnLCBNYXJrLCBLcnN0ZSwgUGhpbGlwcCwgQW5kcmV3LAo+Cj4gKHRoaXMg
aXMgTEtNTCBub3csIG5vIHRvcCBwb3N0aW5nIG9yIGh0bWwgcmVwbGllcykKPgo+IE9uIEZyaSwg
TWF5IDEyLCAyMDIzIGF0IDA4OjQwOjEwUE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPj4g
T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgMTE6MDE6MDlBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4+ID4gT24gVGh1LCAxMSBNYXkgMjAyMyAxNTozODoxMCBQRFQgKC0wNzAwKSwgQ29u
b3IgRG9vbGV5IHdyb3RlOgo+PiA+ID4gT24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgMDM6MzQ6MjRQ
TSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+ID4gPiA+IE9uIFRodSwgTWF5IDExLCAyMDIz
IGF0IDI6NDfigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+
ID4gPiA+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDAyOjI3OjQ0UE0gLTA3MDAsIEF0aXNoIFBh
dHJhIHdyb3RlOgo+PiA+ID4gCj4+ID4gPiA+ID4gVGhhdCdzIG1vcmUgdGhhbiBsYXN0IHllYXIg
YXQgdGhpcyBwb2ludCwgYW5kIG5vdGhpbmcgaGFzIGNoYW5nZWQgaW4gdGhlCj4+ID4gPiA+ID4g
ZG9jdW1lbnRhdGlvbiEgVGFsaydzIGNoZWFwLCBlaGg/Cj4+ID4gPiA+ID4KPj4gPiA+ID4gCj4+
ID4gPiA+IFl1cC4gSSB3aWxsIHBva2UgUlZJIGZvbGtzIHRvIGNoZWNrIGlmIGl0IHN0aWxsIGlz
IHRoZSBwbGFuIG9yIGNoYW5nZWQgISEKPj4gPiA+IAo+PiA+ID4gU291bmRzIGdvb2QsIHRoYW5r
cyEKPj4gCj4+IFRoZXJlIGhhcyBiZWVuIHNvbWUgbW92ZW1lbnQgb24gdGhhdCBmcm9udCwgc2hh
bGwgc2VlIHdoZXJlIGl0IGdvZXMKPj4gOnVwc2lkZWRvd25fc21pbGU6Cj4KPiBUaGVyZSdzIGJl
ZW4gc29tZSBvZmYtbGlzdCBkaXNjdXNzaW9uIHByb21wdGVkIGJ5IEF0aXNoIHdpdGggc29tZSBv
ZiB0aGUKPiBSVkkgc3BlYyBmb2xrLCBmcm9tIHdoaWNoIHRoZSB1cHNob3QgX19hcHBlYXJzX18g
dG8gYmUgYW4gdW5kZXJzdGFuZGluZwo+IHRoYXQgdXNpbmcgdmVyc2lvbiBudW1iZXJpbmcgdG8g
aW5kaWNhdGUgcmVtb3ZhbCBvZiBJU0EgZmVhdHVyZXMgaXMgYSBiYWQKPiBpZGVhLgo+IEknbSBo
b3BpbmcgdGhhdCB0aGlzIHJlc3VsdHMgaW4gdGhlIGVuc2hyaW5lbWVudCBvZiB0aGlzIGluIHRo
ZSBJU0EKPiBzcGVjcywgc28gdGhhdCB3ZSBoYXZlIHNvbWV0aGluZyBjb25jcmV0ZSB0byBwb2lu
dCB0byBhcyB0aGUgYmFzaXMgZm9yCj4gbm90IG5lZWRpbmcgdG8gaGFuZGxlIHZlcnNpb24gbnVt
YmVyaW5nLiAKPiBDZXJ0YWlubHkgdGhhdCdkIGJlIGdyZWF0IGZvciBBQ1BJIGFuZCByZW1vdmUg
Y29uY2VybnMgdGhlcmUuCj4KPj4gPiA+ID4gV2Ugd2lsbCBsaWtlbHkgaGF2ZSBhIHZlbmRvciBz
cGVjaWZpYyBzdHJpbmcgcGFyc2luZyBsb2dpYy4KPj4gPiA+IAo+PiA+ID4gQ29tcGxpY2F0aW5n
IHRoZSBwYXJzaW5nIGxvZ2ljIGlzIHRoZSBleGFjdCBzb3J0IG9mIGNyYXAgdGhhdCBJIHdhbnQK
Pj4gPiA+IHRvIGF2b2lkLgo+PiA+IAo+PiA+IFlhLCBJIHRoaW5rIHdlJ3JlIHJlYWxsbHkgb3Zl
cmNvbXBsaWNhdGluZyB0aGluZ3Mgd2l0aCB0aGUgSVNBIHN0cmluZ3MuCj4+ID4gTGV0J3MganVz
dCBkZXByZWNhdGUgdGhlbSBhbmQgbW92ZSB0byBzb21ldGhpbmcgdGhhdCBkb2Vzbid0IG5lZWQg
YWxsIHRoZQo+PiA+IGJlc3Bva2Ugc3RyaW5nIHBhcnNpbmcuCj4+IAo+PiBWZXJzaW9uaW5nIGFz
aWRlLCBhbHRob3VnaCB0aGF0IHJlbW92ZXMgYSBsYXJnZSBwYXJ0IG9mIHRoZSBtb3RpdmF0aW9u
LAo+PiB0aGUgaW50ZXJmYWNlIGJlY29tZXMgcXVpdGUgbmljZToKPj4gb2ZfcHJvcGVydHlfcHJl
c2VudChub2RlLCAicmlzY3YsaXNhLWV4dGVuc2lvbi16aWNib20iKQo+Cj4gTXkgY3VycmVudCBm
ZWVsaW5nIGlzIHRoYXQsIHJhdGhlciB0aGFuIGludHJvZHVjaW5nIGEga2V5LXZhbHVlIHR5cGUg
b2YKPiBwcm9wZXJ0eSwgYWRkaW5nIGJvb2xlYW4gcHJvcGVydGllcyBmb3IgZXh0ZW5zaW9ucyBp
cyB0aGUgd2F5IHRvIGdvCj4gaGVyZS4gVGhlICJyaXNjdixpc2EiIHBhcnQgb2YgdGhlIERUIEFC
SSBwcmUtZGF0ZXMgZXZlbiB0aGUgcmF0aWZpY2F0aW9uCj4gb2YgdGhlIGJhc2UgZXh0ZW5zaW9u
cyAoYW5kIHRodXMgdGhlIHJlbW92YWwgb2Ygc29tZSBmZWF0dXJlcy4uLikuCj4gU3RhcnRpbmcg
YWdhaW4gd2l0aCBhIG5ldyBwcm9wZXJ0eSB3b3VsZCBhbGxvdyB1cyB0byBkZWZpbmUgZXh0ZW5z
aW9ucwo+IGFzIHBlciB0aGVpciByYXRpZmllZCBzdGF0ZSwgcmF0aGVyIHRoYW4gdGhlIGludGVy
bWVkaWF0ZSAmIGluY29tcGF0aWJsZQo+IHN0YXRlcyB0aGF0IHdlIGhhdmUgY3VycmVudGx5IGdv
dCB3aXRoICJyaXNjdixpc2EiLgo+IFN1Y2ggYSBtb2RlbCBkb2VzIHJlbHkgb24gdGhlIHN0cmVu
Z3RoZW5pbmcgb2YgdGhlIHdvcmRpbmcgaW4gdGhlCj4gc3BlY2lmaWNhdGlvbi4KCklNTyB0aGUg
aW1wb3J0YW50IHBhcnQgaXMgdGhhdCB3ZSBlbmNvZGUgYW4gZXhhY3QgdmVyc2lvbiAob3IgY29t
bWl0IGlmIAp0aGV5J3JlIGdvaW5nIHRvIHN0b3AgZG9pbmcgdmVyc2lvbnMpIG9mIHRoZSBzcGVj
IGluIHRoZSBEVC4gIFdlJ3ZlIApnb3R0ZW4gYnVybmVkIGVub3VnaCB0aW1lcyBieSBqdXN0IHRy
eWluZyB0byBwb2ludCBhdCB0aGUgbGF0ZXN0IHNwZWMgCmFuZCB0cnVzdGluZyB0aGF0IGNvbXBh
dGliaWxpdHkgd2lsbCBiZSBoYW5kbGVkIGluIHRoZSBzcGVjcywgaW4gCnByYWN0aWNlIHRoYXQg
ZG9lc24ndCB3b3JrLgoKR2l2ZW4gaG93IGluY29uc2lzdGVudCB0aGUgUklTQy1WIHZlcnNpb24g
c2NoZW1lcyBoYXZlIGJlZW4sIHdlIHJlYWxseSAKY2FuJ3QgYXNzaWduIGFueSBzZW1hbnRpYyBt
ZWFuaW5nIHRvIHZlcnNpb24gbnVtYmVycy4gIFNvIEkgZG9uJ3QgdGhpbmsgCml0IG1hdHRlcnMg
YWxsIHRoYXQgbXVjaCBpZiB3ZSBlbmNvZGUgdGhpcyBhcwoKICAgIHJpc2N2LCRTUEVDID0gWyJ2
MS4wIiwgInYxLjEiXQoKb3IKCiAgICByaXNjdiwkU1BFQyA9IHRydWUgLy8gd2l0aCB0aGUgYmlu
ZGluZyBzYXlpbmcgdjEuMCBvciAkU0hBLi4uCiAgICByaXNjdiwkU1BFQy0xLjEgPSB0cnVlIC8v
IHdpdGggdGhlIGJpbmRpbmcgc2F5aW5nIHYxLjEgb3IgJFNIQS4uLgoKU2luY2Ugd2UgY2FuJ3Qg
YXNjcmliZSBhbnkgbWVhbmluZyB0byB0aG9zZSB2ZXJzaW9uIG51bWJlcnMgdGhlcmUncyAKbm90
aGluZyB0byBwYXJzZSBpbiB0aGVtLCBzbyBpdCdzIGp1c3QgZ29pbmcgdG8gcGx1bWIgaW50byBz
b21lIGxvb2t1cCAKdGFibGUgaW4gdGhlIGtlcm5lbCBlaXRoZXIgd2F5LiAgVGhlIGltcG9ydGFu
dCBwYXJ0IGlzIGp1c3QgdGhhdCB3ZSAKZG9jdW1lbnQgZXhhY3RseSB3aGF0IHNwZWMgdmVyc2lv
biB3ZSdyZSBlbmNvZGluZywgYXMgdGhhdCB3YXkgd2UgY2FuIAphdm9pZCBnZXR0aW5nIGJ1cm5l
ZCBieSB0aGVzZSBjaGFuZ2VzIGFnYWluIGluIHRoZSBmdXR1cmUuCgo+IFRoaXMgaGFkIHRoZSBh
ZHZhbnRhZ2Ugb2YgYmVpbmcsIGFzIEkgbWVudGlvbiBhYm92ZSwgZXZlbiBlYXNpZXIgdG8KPiBw
YXJzZSBpbiBzb2Z0d2FyZSB0aGFuIHRoZSBrZXktdmFsdWUgcGFpciBidXNpbmVzcyAtIGJ1dCBh
bHNvIGlzCj4gdHJpdmlhbGx5IGltcGxlbWVudGVkIGluIGEgZHQtYmluZGluZy4gV2hhdCBJIGhh
dmUgYmVlbiB0cnlpbmcgdG8gZG8KPiB3aXRoIHRoZSB2YWxpZGF0aW9uIG9mIHRoZSBrZXktdmFs
dWUgc3R1ZmYgZG9lcyBub3QgYXBwZWFyIHRvIGJlIHJlYWRpbHkKPiBkb2FibGUhCgpJTU8gdGhh
dCdzIHRoZSBtb3N0IGltcG9ydGFudCBkZWNpZGluZyBmYWN0b3Igb24gaG93IHRoZXNlIHNob3Vs
ZCBiZSAKZW5jb2RlZC4gIFdlJ3JlIG5vdCB0cmFja2luZyB0aGUgSVNBIHN0cmluZyBhbnkgbW9y
ZSwgc28gaXQgZG9lc24ndCAKbWF0dGVyIGhvdyBjbG9zZWx5IHRob3NlIGxpbmUgdXAuICBXZSBk
byBoYXZlIGEgY2hhbmNlIHRvIGFjdHVhbGx5IAp2YWxpZGF0ZSB0aGUgaW50ZXJmYWNlLCB0aG91
Z2gsIHdoaWNoIHdhcyBhIGJpZyBwcm9ibGVtIHdpdGggdGhlIElTQSAKc3RyaW5ncy4KCkZyb20g
dGFsa2luZyBpdCBzb3VuZHMgbGlrZSB0aGUgZm9ybSB5b3UncmUgcHJvcG9zaW5nIGlzIGVhc2ll
ciB0byAKZW5jb2RlIGluIGR0LXNjaGVtYSB0aGFuIHdoYXQgSSdkIHByb3Bvc2VkLiAgSSBkaWRu
J3QgbG9vayBhdCBkdC1zY2hlbWEgCmF0IGFsbCBiZWZvcmUgdGhpbmtpbmcgdXAgdGhlIGludGVy
ZmFjZSwgc28geW91J3JlIHByb2JhYmx5IHJpZ2h0IDspLgoKQXNzdW1pbmcgdGhhdCdzIHRoZSBj
YXNlIGl0IHNlZW1zIGxpa2UgdGhlIHdheSB0byBnbyBhcyBmb3IgYXMgSSdtIApjb25jZXJuZWQu
Cgo+IChBbm90aGVyIGRyYXdiYWNrIHRoYXQgaGFzIGNvbWUgdG8gbWluZCBpcyB0aGF0IHdlIGhh
dmUgbm8gd2F5IHRvCj4gdmFsaWRhdGUgd2hldGhlciBtdXR1YWxseSBleGNsdXNpdmUgZXh0ZW5z
aW9ucyBoYXZlIGJlZW4gYWRkZWQgd2l0aAo+ICJyaXNjdixpc2EiKQo+Cj4+IFRoYXQgYWxzbyBn
aXZlcyB1cyB0aGUgYWJpbGl0eSB0byBkZWZpbmUgd2hhdCBzdXBwb3J0ZWQgdmVuZG9yCj4+IGV4
dGVuc2lvbnMgYWN0dWFsbHkgbWVhbiBpbiBhIGR0LWJpbmRpbmcsIHdoaWNoIHRvIG1lIGlzIGEg
YmlnIHdpbiBpbgo+PiB0ZXJtcyBvZiB0aGUgYWZvcmVtZW50aW9uZWQgIndpbGQgd2VzdCIuCj4K
PiBWZW5kb3IgZXh0ZW5zaW9ucyBldGMgYXJlIG9mdCBxdW90ZWQgYXMgb25lIG9mIHRoZSBzdHJl
bmd0aHMgb2YgUklTQy1WLAo+IGFuZCBteSBmZWVsaW5nIGlzIHRoYXQgInJpc2N2LGlzYSIgaXMg
bm90IGEgbWVjaGFuaXNtIHdoZXJlIHdlIGNhbgo+IGVhc2lseSBoYW5kbGUgbWVhbmluZ3MgLSBl
c3BlY2lhbGx5IGZvciB2ZW5kb3Igc3R1ZmYgd2hlcmUgdGhlcmUgaXMKPiBvdGhlcndpc2Ugbm8g
Y2VudHJhbGlzZWQgbG9jYXRpb24gZm9yIF94Zm9vIC0+IGZlYXR1cmUgbWFwcGluZ3MuCgpJTU8g
dGhlcmUncyBub3QgYW55IGZ1bmRhbWVudGFsIGRpZmZlcmVuY2U6IGl0J3Mgbm90IGxpa2UgdGhl
IHN0YW5kYXJkIApleHRlbnNpb25zIGhhdmUgYW55IG1lYW5pbmdmdWwgbmFtaW5nL3ZlcnNpb25p
bmcgc2NoZW1lLCBzbyBpdCdzIHN0aWxsIAphbGwganVzdCBsb29rdXAgdGFibGVzLgoKV2UgZG8g
Z2V0IHRoZSBzYW1lIGJlbmVmaXRzIGZyb20gc2NoZW1hIHZhbGlkYXRpb24gdGhhdCB3ZSdkIGdl
dCBmb3IgCnN0YW5kYXJkIGV4dGVuc2lvbnMsIHRob3VnaC4gIFRoYXQncyBwcm9iYWJseSBhIHdh
eSBiaWdnZXIgd2luIGZvciAKdmVuZG9yIGV4dGVuc2lvbnMsIGFzIGl0J2xsIGNsb3NlIGEgYmln
IGxvb3Bob2xlIGluIG91ciBEVCB2YWxpZGF0aW9uIApyaWdodCBub3cgd2hlcmUgdXNlcnMgY2Fu
IGNyYW0gYXJiaXRyYXJ5IHN0dWZmIGludG8gInJpc2N2LGlzYSIgYW5kIHRoZW4gCndlIGhhdmUg
dG8ganVzdCBkZWFsIHdpdGggaXQuCgo+IENoZWVycywKPiBDb25vci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
