Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E3C44512
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 02:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQnqx73nmbKYhqY9hKwzHjkAOLrfIyKR5oUWc5Jprhk=; b=5BUScv1CVD1lke
	/HdhNYkAyNFiLapArBJ2HN0mwFl41DNX282QsWK6zCNB3uInoTJazXrz16MNFHFaG7WG4nv0uSALC
	HRnIDNszr83hj5xG71i4zkRmzCK9lDsGZJFiZhUb8M7cF5QRWBybx3KeOAQ832sNFXma4SYFAMbsM
	o51Pz5paIFD9kt8CSNWf2SmBO66E62fpTzw/MSuH8ot1M6yQeX6QWIdmrks8dgeSuLSZM4IFpxMTE
	VheCaeDIexEGw+Bl+rH8A5D3p+g2BqbRnaiBzQ4yKgu5KtRCdIBe4DiVGqt8tuhjIRPgcwKxYNU+T
	3WuCaNkRRnRIEcYyPWuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkY3i-00000000wcb-0ZkN;
	Fri, 17 Jul 2026 02:12:14 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkY3d-00000000wbB-3f8A
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 02:12:12 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-90327237340so9568706d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 19:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784254325; cv=none;
        d=google.com; s=arc-20260327;
        b=XlLPSNOedt5ITozDPdRl3wA6z01bVcWHsrPGZr5vXLcLm85IATZfI+zjgn3vNw6bVS
         y/soI6z6wJfS9d5RgujTI6zoRpW0xl2Nyg7Cqf5827xJcsdavyXmw9aJDvd58kTaqH0n
         VGKAITh490pitguYAdeV7YAkAhC+Zx50tLAystrD8gwQDu/2c+x76QENHSabu+1FLKRF
         dMntT8KvYt1RVroestEZUJyjUzPCe8Mlz0PE/VUXTf3Sx9yHd76XIhwhiKfW8SgcHbv5
         SaBoYSrvO++2pEzccoJN8ixRUypACRxnMPiAgBsXzST91BufXcoDObyBYYQ/X7OQHZFR
         UdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ImLajRzvDVLFSrRo+VoDXuG0v/zjA73TDW/n/TraEL0=;
        fh=IF7+gcEV4xQ4htwmSX+HULs6Cg0ya0MnqvWkbEW0RpU=;
        b=E6oYI8z8Jx4RxLsKGHcVWNU2aUS+fzyu9tewFnWtIVQZXEJBh4UeiblsRxcOv3OdEz
         HLj6aL7BptV5BH7GQr5WB85wdbj2GubDF7p4GbM88miCFZc7ZzM93gYSPher/aBDXoOn
         kCRYHARAYwN70YtlLMKwDX4UtwLidS+Hcb2tTpuixitQ+33lUcIcHeZZBBBeMnS6FsL/
         hlrvjA6A6MKfEkn+nDy+Mn0TebO819/zpn7N8BEsErSt7/+xlHRwBohpCeKjVMuBa1+j
         i8WVMlPDyt5pan3W8DcIyY0Hxutace13u9g2aBrAi0agHDB+ktsrDGQOqeNcEU3obl4U
         6MpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784254325; x=1784859125; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ImLajRzvDVLFSrRo+VoDXuG0v/zjA73TDW/n/TraEL0=;
        b=VOFqE+y4RuyBnzR3GJ8MNl++xD2IdGlTva3un4BWQ1Qzwd/i9u0Ic0AkmCO6QUDcPZ
         YoYCSIu2QxefaN2NieG/aKv2f2BWIzo7cboCShDslcXr4pW50yuw8CXEdCH3Hw1VhbsY
         lLzu8LC3yz9XSXaiRufQZdEHi1/I4yZF0r6CwhftzuPe769hWii/lNEM7WnNPYICnP4a
         R7a4Kqj+y1nG7z+UrMZU2qIV7fcjMw+fQG+KZB4a+4+aj5l2CxGV1tAhXHsJ38mCgXcn
         moYmJqeHphwl4moq3iIVLOxRpNgawJZsyrCgCnIUo8Gq/bWed9GpFj6On2t9rUoU8kT3
         pajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784254325; x=1784859125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImLajRzvDVLFSrRo+VoDXuG0v/zjA73TDW/n/TraEL0=;
        b=b7wf7DNyn5EWRZjcwpHDMrdbhiFQPNq2pZi9u7ddGAoaMIP33RR3PT3sD/Rr2Mlh3o
         dWlpU8OxaWPomfLlhJHkkxSUmx48bBpnlnOJHEpqezICu6tohiZLBf7kEamAnv4Y4CW8
         Ma7UN8k/Hx0rG6bb7kkcpBr8cm+Nac2AwvsXyjiPzJ+69szIJzqRC6yuZm58mRCRdQeN
         bAVQSlM9IBzjvnbispqzCQsAoWiBwrZjQ2UILjRmn7Dt7tLx72hh6q7GcLq5Zx3J5mlf
         tg0D3KBVRVjLccup3qWW2fTfGww2Qv/VtvZGI2gDjfaVO7igQmCV+em4X1vkO73O0RBz
         yzVw==
X-Forwarded-Encrypted: i=1; AHgh+RoWyOHH7VdEYlAaP1cKFVDGtfwuyBo3EToLuJnfmw9KpBh7HvZQ4ESeHjehbA9+JM9x0jfeooFXpgHi+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDCTRRpHlJ6cCcv5c/aSMMOfuv/tBkifeES8KotGfMAJoqXNjP
	7kYrnbYjn/f0FXqLASTCMeW44rnbUqnP8mzkQ2nCyYQ58WEQcWYbB4bO0O1983hIMpTbc1qPPf7
	0if1Rip0SQ9hmofpumtkpjnZxM7KDTeLVguk9XXklDw==
X-Gm-Gg: AfdE7cnu6e7mDieL0PeuDLq6AL0C87vtnIbe3E5bBuEULYMXXEIsYVs+XZ2t3ED8QgR
	OkDr+2PTSiTP9ZemPjUwIYHGtkX43CVNzkbNDNjL1wIoqHUvunRpC7kmqYwqshBuukwNuyGRi83
	0raX6Ctn0HRK4Rhjm67K20inRPtGDpECMoskVjyWBQvkgV0ojWdnUc2sK3zygSPzwzYEaZm4MYR
	UvbW7+EKqS5s2VqAgzLDefJSJd5CXK6FIKXz4Uq4v/PSn+vMtJiMBv6ERNHc1em1J/LHh/pw89d
	4wtnULk88lIXLb4lau+KCMUJ8mLCUrU=
X-Received: by 2002:a05:6214:2388:b0:8f1:5e32:9b06 with SMTP id
 6a1803df08f44-90768de6caemr58949036d6.13.1784254324697; Thu, 16 Jul 2026
 19:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
 <20260715132009.10634-2-luxu.kernel@bytedance.com> <alkD_YBF1HhbycqX@soda.int.kasm.eu>
In-Reply-To: <alkD_YBF1HhbycqX@soda.int.kasm.eu>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 17 Jul 2026 10:11:53 +0800
X-Gm-Features: AUfX_mxkP05q-KEcoW2k-XA5HoxeIOH6yLsfKxaFQxYfTk-L303EuYmW-WRPleU
Message-ID: <CAPYmKFsA=fFKK5RtsCo1GQA0JqdxQ4h8O=GS+QXOBGPPcJrtuQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: mm: Use ASID in update_mmu_cache()
To: Klara Modin <klarasmodin@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apw@canonical.com, joe@perches.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_191210_268745_CFC53ADB 
X-CRM114-Status: GOOD (  26.13  )
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

SGkgUGF1bCwKCktsYXJhIGZvdW5kIHRoYXQgbGludXgtbmV4dCBjaGVycnktcGlja3MgdGhlIG5l
dyB2ZXJzaW9uIG9mIHBhdGNoIDIKd2hpbGUgcGlja2luZyB0aGUgb2xkIHZlcnNpb24gb2YgcGF0
Y2ggMSwgd2hpY2ggbGVhZHMgdG8gYW4KdW5pbml0aWFsaXplZCBhc2lkLiBDb3VsZCB5b3UgcGxl
YXNlIGhlbHAgY29ycmVjdCB0aGlzPwoKQmVzdCByZWdhcmRzLApYdSBMdQoKT24gRnJpLCBKdWwg
MTcsIDIwMjYgYXQgMTI6MjXigK9BTSBLbGFyYSBNb2RpbiA8a2xhcmFzbW9kaW5AZ21haWwuY29t
PiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMjAyNi0wNy0xNSAyMToyMDowNyArMDgwMCwgWHUgTHUg
d3JvdGU6Cj4gPiBPbmx5IGZsdXNoIFRMQiBlbnRyaWVzIGZvciB0aGUgc3BlY2lmaWVkIG1tIGlu
IHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2UoKS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8
bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oICB8IDQgKysrLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxi
Zmx1c2guaCB8IDUgKysrKysKPiA+ICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgICAgICAgICAg
fCA1IC0tLS0tCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IGluZGV4IDVkNTc1NmJk
YTgyZS4uOTkyNjU1NjA5OWFlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4g
PiBAQCAtNTY4LDYgKzU2OCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X2NhY2hl
X3JhbmdlKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+ID4gICAgICAgICAgICAgICBzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyZXNzLAo+ID4gICAgICAgICAgICAg
ICBwdGVfdCAqcHRlcCwgdW5zaWduZWQgaW50IG5yKQo+ID4gIHsKPiA+ICsgICAgIHVuc2lnbmVk
IGxvbmcgYXNpZCA9IGdldF9tbV9hc2lkKHZtYS0+dm1fbW0pOwo+ID4gKwo+Cj4gSXQgc2VlbXMg
dGhlIG9sZCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggaXMgc3RpbGwgdXNlZCAoYXQgbGVhc3QgaW4K
PiBuZXh0LTIwMjY1MDcxNiwgMTVjZTFkN2M0ZGRmZTBkZmYwMGZjYWVlNGNjYWVlZjNlZmJjNjJj
NiksIHdoaWNoIG1lYW5zCj4gYXNpZCBpcyBub3QgaW5pdGlhbGlzZWQgaGVyZS4gV2UgaW5zdGVh
ZCBoYXZlOgo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBpbmRleCA1ZDU3NTZiZGE4MmUu
Ljc1NTQ5NWE1NDJjYyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gQEAgLTU2OCw2
ICs1NjgsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1
Y3Qgdm1fZmF1bHQgKnZtZiwKPiAgICAgICAgICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKPiAgICAgICAgICAgICAgICAgcHRlX3QgKnB0
ZXAsIHVuc2lnbmVkIGludCBucikKPiAgewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBhc2lkOwo+
ICsKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBTdnZwdGMgZ3VhcmFudGVlcyB0aGF0IHRoZSBu
ZXcgdmFsaWQgcHRlIHdpbGwgYmUgdmlzaWJsZSB3aXRoaW4KPiAgICAgICAgICAqIGEgYm91bmRl
ZCB0aW1lZnJhbWUsIHNvIHdoZW4gdGhlIHVhcmNoIGRvZXMgbm90IGNhY2hlIGludmFsaWQKPiBA
QCAtNTgzLDEwICs1ODUsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGVf
cmFuZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4gICAgICAgICAgKiBSZWx5aW5nIG9uIGZsdXNo
X3RsYl9maXhfc3B1cmlvdXNfZmF1bHQgd291bGQgc3VmZmljZSwgYnV0Cj4gICAgICAgICAgKiB0
aGUgZXh0cmEgdHJhcHMgcmVkdWNlIHBlcmZvcm1hbmNlLiAgU28sIGVhZ2VybHkgU0ZFTkNFLlZN
QS4KPiAgICAgICAgICAqLwo+ICsgICAgICAgYXNpZCA9IGdldF9tbV9hc2lkKHZtYS0+dm1fbW0p
Owo+ICAgICAgICAgd2hpbGUgKG5yLS0pCj4gLSAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX3Rs
Yl9wYWdlKGFkZHJlc3MgKyBuciAqIFBBR0VfU0laRSk7Cj4gLQo+ICsgICAgICAgICAgICAgICBs
b2NhbF9mbHVzaF90bGJfcGFnZV9hc2lkKGFkZHJlc3MgKyBuciAqIFBBR0VfU0laRSwgYXNpZCk7
Cj4gIH0KPiArCj4gICNkZWZpbmUgdXBkYXRlX21tdV9jYWNoZSh2bWEsIGFkZHIsIHB0ZXApIFwK
PiAgICAgICAgIHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2UoTlVMTCwgdm1hLCBhZGRyLCBwdGVwLCAx
KQo+Cj4KPiBUaGlzIG1lYW5zIHRoYXQgcGF0Y2ggMiBvZiB0aGlzIHNlcmllcyB3aWxsIHVzZSB0
aGUgdW5pbml0aWFsaXNlZCBhc2lkCj4gZm9yIGxvY2FsX3N2aW52YWxfdm1hKCkgYW5kIEkgZ2V0
IHRoZSBzYW1lIGJlaGF2aW91ciBhcyBiZWZvcmUgKGhhbmcgb24KPiBpbml0cmFtZnMpLiBJZiBJ
IHJldmVydCB0aGUgdHdvIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMgd2hpY2ggYXJlIGluIG5leHQK
PiBhbmQgYXBwbHkgdGhpcyBhZ2FpbiBpdCdzIGZpbmUuCj4KPiBSZWdhcmRzLAo+IEtsYXJhIE1v
ZGluCj4KPiA+ICAgICAgIC8qCj4gPiAgICAgICAgKiBTdnZwdGMgZ3VhcmFudGVlcyB0aGF0IHRo
ZSBuZXcgdmFsaWQgcHRlIHdpbGwgYmUgdmlzaWJsZSB3aXRoaW4KPiA+ICAgICAgICAqIGEgYm91
bmRlZCB0aW1lZnJhbWUsIHNvIHdoZW4gdGhlIHVhcmNoIGRvZXMgbm90IGNhY2hlIGludmFsaWQK
PiA+IEBAIC01ODQsNyArNTg2LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2Fj
aGVfcmFuZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4gPiAgICAgICAgKiB0aGUgZXh0cmEgdHJh
cHMgcmVkdWNlIHBlcmZvcm1hbmNlLiAgU28sIGVhZ2VybHkgU0ZFTkNFLlZNQS4KPiA+ICAgICAg
ICAqLwo+ID4gICAgICAgd2hpbGUgKG5yLS0pCj4gPiAtICAgICAgICAgICAgIGxvY2FsX2ZsdXNo
X3RsYl9wYWdlKGFkZHJlc3MgKyBuciAqIFBBR0VfU0laRSk7Cj4gPiArICAgICAgICAgICAgIGxv
Y2FsX2ZsdXNoX3RsYl9wYWdlX2FzaWQoYWRkcmVzcyArIG5yICogUEFHRV9TSVpFLCBhc2lkKTsK
PiA+Cj4gPiAgfQo+ID4gICNkZWZpbmUgdXBkYXRlX21tdV9jYWNoZSh2bWEsIGFkZHIsIHB0ZXAp
IFwKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiA+IGluZGV4IGVlZDBhYmM0MDUxNC4u
N2MyY2Q1Y2M5MmQzIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJm
bHVzaC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiA+IEBA
IC0xNSw2ICsxNSwxMSBAQAo+ID4gICNkZWZpbmUgRkxVU0hfVExCX05PX0FTSUQgICAgICAgKCh1
bnNpZ25lZCBsb25nKS0xKQo+ID4KPiA+ICAjaWZkZWYgQ09ORklHX01NVQo+ID4gK3N0YXRpYyBp
bmxpbmUgdW5zaWduZWQgbG9uZyBnZXRfbW1fYXNpZChzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiA+
ICt7Cj4gPiArICAgICByZXR1cm4gbW0gPyBjbnR4MmFzaWQoYXRvbWljX2xvbmdfcmVhZCgmbW0t
PmNvbnRleHQuaWQpKSA6IEZMVVNIX1RMQl9OT19BU0lEOwo+ID4gK30KPiA+ICsKPiA+ICBzdGF0
aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxiX2FsbCh2b2lkKQo+ID4gIHsKPiA+ICAgICAg
IF9fYXNtX18gX192b2xhdGlsZV9fICgic2ZlbmNlLnZtYSIgOiA6IDogIm1lbW9yeSIpOwo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxi
Zmx1c2guYwo+ID4gaW5kZXggODQwNDUzMGVjMDBmLi43M2MyMjZmNzE5YzcgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxi
Zmx1c2guYwo+ID4gQEAgLTExMCwxMSArMTEwLDYgQEAgc3RhdGljIHZvaWQgX19pcGlfZmx1c2hf
dGxiX3JhbmdlX2FzaWQodm9pZCAqaW5mbykKPiA+ICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9yYW5n
ZV9hc2lkKGQtPnN0YXJ0LCBkLT5zaXplLCBkLT5zdHJpZGUsIGQtPmFzaWQpOwo+ID4gIH0KPiA+
Cj4gPiAtc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGdldF9tbV9hc2lkKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tKQo+ID4gLXsKPiA+IC0gICAgIHJldHVybiBtbSA/IGNudHgyYXNpZChhdG9taWNf
bG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCkpIDogRkxVU0hfVExCX05PX0FTSUQ7Cj4gPiAtfQo+
ID4gLQo+ID4gIHN0YXRpYyB2b2lkIF9fZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBjcHVtYXNr
ICpjbWFzaywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0
YXJ0LCB1bnNpZ25lZCBsb25nIHNpemUsCj4gPiAtLQo+ID4gMi4zOS41Cj4gPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
