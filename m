Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EB2C3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOP+c+HDcvBAk45exCOg4Ednyk5Khp8YA3waqCPaMcs=; b=ZKCFgIXHJO9apI
	mGVMZZrzp+mXWZ0XnepsMFXv47AwXHEHbY/7d/U+ThcrwHm7v52Mwba/OU94Hb9abQX52IbhGcgpm
	sskaeR1ic7CPu+eObZOrN5+Ak69idoPgPs+191dHp0Tagr6DDzUXTlxHlU2w6718ygwdkoS6Dociv
	5oZLDsodWAFw9SLkXDc18JyGlu4q2lFzF/IKnNe6cqcth/cue8zckAAJKgOHM1lmbsc0EXm1StHsj
	0Hr05zUl9YTC3Ov3+TDDDhHcD/mbuJ396q9Z+Z9/zDp13JUJx0yt8+piZyXT8YNXhtmFkthBQV0tY
	miO/yOKJg3RvWHFABtfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ98Q-00328s-35;
	Thu, 24 Aug 2023 12:08:22 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ98O-003282-01
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 12:08:21 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-26b3f4d3372so3781456a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 05:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692878893; x=1693483693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ky+vs6UbfQtID7spa60NQprP0k6Ypw8/omK+bBONcH8=;
        b=EJ3Yr97hc2BjNISUj2PECF8bgq8PDsok/vUdWh5AiXz+q90HrqUAlkDKLv+4LFSU2G
         Fw/RqWykgSGHU2OSiaZAgwH9Ojr7hVconEiZP1RDJ8S16aCVQx4Gt+OqKv2O+GClrQBw
         jDvXJEXIcMSlYSPY/kn38dXECpIh8i6B8RgeocMg3MWhW7uYJQJKJAO/RA28AnoRG8Fw
         NF64wvT4A234I3xPccGG0p7KNDb6jQ8k3lf4UngYiftHMyTlo2fcglVDVseAHhD/gw2N
         jcimjB5+9s03G4vFr5pvTKNbGq/xMhi52J+VuKiYadD2+jW6cVbWTdD87Ba6uBuIejIh
         Fklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692878893; x=1693483693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ky+vs6UbfQtID7spa60NQprP0k6Ypw8/omK+bBONcH8=;
        b=UTWI1rd//KPMNDZ/OuqXkkovjnXxFZNFAzPv4cY6GFhMz9nvc27cKVcQB5QTiLRupW
         HpjWNDo1z+b9BVi/k8ufPS6FAsAs0pelZFixa8J5KhM31x9ucVwCU25PeZ4h7hQSJWTe
         wz6vtVAA8P3+WiVJrE0R5F7yT7Cf75WS6CjKhK5B066mtD77LIujHZ0h2WJpZkZZNJxE
         BJ9KV3WNM5ebGfz8C1tLqX1FGE5Gtpps5/7Pm4etrCFF0lT1HOSljkyqye+/j720+U+R
         Wu2dnN0ehPpOoZrQH9xHC3RrSufvD2XXSwtdCYg4JyX+DvpWAUrFVFKhxiB7VpD4S51T
         hmJw==
X-Gm-Message-State: AOJu0YyBW9RxnzLFnucrvUgaW+AF3C5uSTeVRcTPqFOPYW6NogEZIJIN
	mzoBkQQDmYAI9bMXfVcQg8nPIonPFYdBg3KJj0sgoQ==
X-Google-Smtp-Source: AGHT+IFaMR8PekS9ZuFU1f6lFYz9SgCJij2lDq+sitvoUYNExWt5ftewT4NgORzyLSjvq3sLN51P/q9NHvabqudaxBQ=
X-Received: by 2002:a17:90a:68c7:b0:268:2543:723 with SMTP id
 q7-20020a17090a68c700b0026825430723mr12526724pjj.5.1692878893503; Thu, 24 Aug
 2023 05:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230725070549.89810-1-luxu.kernel@bytedance.com>
 <mhng-a0239c56-385e-40a9-8a71-45d50e28b45d@palmer-ri-x1c9> <CAPYmKFvXf7q_8QzFe4VFL1s-j0P3ZGSZ8nG1q4HmtU4rzek77Q@mail.gmail.com>
In-Reply-To: <CAPYmKFvXf7q_8QzFe4VFL1s-j0P3ZGSZ8nG1q4HmtU4rzek77Q@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Thu, 24 Aug 2023 20:08:02 +0800
Message-ID: <CAPYmKFvqpe48zaLKrTz085cJcO9fwL+BtHujU4p48onR1Nodfw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: Fix local irq restore when flags
 indicates irq disabled
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_050820_197890_0C6878BC 
X-CRM114-Status: GOOD (  28.62  )
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCAyOjU44oCvUE0g5pet6LevIDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDksIDIwMjMgYXQgMjowNeKAr1BNIFBh
bG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwg
MjUgSnVsIDIwMjMgMDA6MDU6NDkgUERUICgtMDcwMCksIGx1eHUua2VybmVsQGJ5dGVkYW5jZS5j
b20gd3JvdGU6Cj4gPiA+IFdoZW4gYXJjaF9sb2NhbF9pcnFfcmVzdG9yZSgpIGlzIGNhbGxlZCB3
aXRoIGZsYWdzIGluZGljYXRpbmcgaXJxcwo+ID4gPiBkaXNhYmxlZCwgd2UgbmVlZCB0byBjbGVh
ciBTUl9JRSBiaXQgaW4gQ1NSX1NUQVRVUywgd2hlcmVhcyBjdXJyZW50Cj4gPiA+IGltcGxlbWVu
dGF0aW9uIGJhc2VkIG9uIGNzcl9zZXQoKSBmdW5jdGlvbiBvbmx5IHNldHMgU1JfSUUgYml0IG9m
Cj4gPiA+IENTUl9TVEFUVVMgd2hlbiBTUl9JRSBiaXQgb2YgZmxhZ3MgaXMgaGlnaCBhbmQgZG9l
cyBub3RoaW5nIHdoZW4KPiA+ID4gU1JfSUUgYml0IG9mIGZsYWdzIGlzIGxvdy4KPiA+ID4KPiA+
ID4gVGhpcyBjb21taXQgc3VwcGxpZXMgY3NyIGNsZWFyIG9wZXJhdGlvbiB3aGVuIGNhbGxpbmcg
aXJxIHJlc3RvcmUKPiA+ID4gZnVuY3Rpb24gd2l0aCBmbGFncyBpbmRpY2F0aW5nIGlycSBkaXNh
YmxlZC4KPiA+ID4KPiA+ID4gRml4ZXM6IDZkNjBiNmVlMGM5NyAoIlJJU0MtVjogRGV2aWNlLCB0
aW1lciwgSVJRcywgYW5kIHRoZSBTQkkiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8bHV4
dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2lycWZsYWdzLmggfCA1ICsrKystCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZs
YWdzLmgKPiA+ID4gaW5kZXggMDhkNGQ2YTViN2U5Li43YzMxZmMzYzM1NTkgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJxZmxhZ3MuaAo+ID4gPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmgKPiA+ID4gQEAgLTQ5LDcgKzQ5LDEwIEBAIHN0
YXRpYyBpbmxpbmUgaW50IGFyY2hfaXJxc19kaXNhYmxlZCh2b2lkKQo+ID4gPiAgLyogc2V0IGlu
dGVycnVwdCBlbmFibGVkIHN0YXR1cyAqLwo+ID4gPiAgc3RhdGljIGlubGluZSB2b2lkIGFyY2hf
bG9jYWxfaXJxX3Jlc3RvcmUodW5zaWduZWQgbG9uZyBmbGFncykKPiA+ID4gIHsKPiA+ID4gLSAg
ICAgY3NyX3NldChDU1JfU1RBVFVTLCBmbGFncyAmIFNSX0lFKTsKPiA+ID4gKyAgICAgaWYgKGZs
YWdzICYgU1JfSUUpCj4gPiA+ICsgICAgICAgICAgICAgY3NyX3NldChDU1JfU1RBVFVTLCBTUl9J
RSk7Cj4gPiA+ICsgICAgIGVsc2UKPiA+ID4gKyAgICAgICAgICAgICBjc3JfY2xlYXIoQ1NSX1NU
QVRVUywgU1JfSUUpOwo+ID4KPiA+IFVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcsIHRoZSBv
cmlnaW5hbCB2ZXJzaW9uIGlzIGNvcnJlY3Q6Cj4gPiBsb2NhbF9pcnFfcmVzdG9yZSgpIG11c3Qg
YmUgcGFpcmVkIHdpdGggYSBsb2NhbF9pcnFfc2F2ZSgpLCBzbyB3ZSBjYW4KPiA+IG9ubHkgZ2V0
IGhlcmUgd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkLgo+Cj4gWWVzLCBpdCBpcyBjb3JyZWN0IGlm
IGxvY2FsX2lycV9zYXZlKCkgaXMgY2FsbGVkIHdoZW4gaXJxIGlzIGVuYWJsZWQgYmVmb3JlLgo+
IFRoZSBmbGFncyByZXR1cm5lZCB3aWxsIGJlIFNSX0lFLiBBbmQgaXQgaXMgc2FmZSB0byBjYWxs
IGxvY2FsX2lycV9yZXN0b3JlKCkKPiB3aXRoIGZsYWcgU1JfSUUgaW4gYW55IGNhc2UuCj4KPiBI
b3dldmVyLCBpZiBsb2NhbF9pcnFfc2F2ZSgpIGlzIGNhbGxlZCB3aGVuIGlycSBpcyBkaXNhYmxl
ZC4gVGhlIFNSX0lFIGJpdCBvZgo+IGZsYWcgcmV0dXJuZWQgaXMgY2xlYXIuIElmIHNvbWUgY29k
ZSBiZXR3ZWVuIGxvY2FsX2lycV9zYXZlKCkgYW5kCj4gbG9jYWxfaXJxX3Jlc3RvcmUoKSByZWVu
YWJsZXMgaXJxLCBjYXVzaW5nIHRoZSBTUl9JRSBiaXQgb2YgQ1NSX1NUQVRVUwo+IGJhY2sgdG8g
MSwgdGhlbiBsb2NhbF9pcnFfcmVzdG9yZSgpIGNhbiBub3QgcmVzdG9yZSBpcnEgc3RhdHVzIGJh
Y2sgdG8gZGlzYWJsZWQuCj4KPiBIZXJlIGlzIGFuIGV4YW1wbGUgaW4gZXhpc3RpbmcgZHJpdmVy
IChtYXkgbm90IGJlbG9uZyB0byByaXNjdiBhcmNoKSBpbgo+IGRyaXZlcnMvbmV0L3dpcmVsZXNz
L3JlYWx0ZWsvcnRsd2lmaS9ydGw4NzIzYWUvaHcuYy4gVGhlIHBzZXVkbyBjb2RlCj4gYmVoYXZl
cyBsaWtlOgo+Cj4gaW50IHJ0bDg3MjNlX2h3X2luaXQoc3RydWN0IGllZWU4MDIxMV9odyAqaHcp
Cj4gewo+ICAgICAgaW50IGVycjsKPiAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gICAgICAu
Li4KPiAgICAgIGxvY2FsX2lycV9zYXZlX2ZsYWdzKGZsYWdzKTsKPiAgICAgIGxvY2FsX2lycV9l
bmFibGUoKTsKPiAgICAgIC4uLgo+ICAgICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOwo+ICAg
ICAgLi4uCj4gICAgICByZXR1cm4gZXJyOwo+IH0KPgo+Cj4gPgo+ID4gPiAgfQo+ID4gPgo+ID4g
PiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfSVJRRkxBR1NfSCAqLwoKQSBnZW50bGUgcGluZy4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
