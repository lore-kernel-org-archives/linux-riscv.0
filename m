Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9298AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 23:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8d+FP10E9hJJqyKUumdfhA0Unb+OuSSs3RemhmG4rGw=; b=iPFwPDXYDKAv3yUTuxPF4WEqVh
	T51g9Gqs3O5bQFaRQ3+kYQ3IMgoWo+x3k69UdklepRwfPx1MKSpWQ363JQMSWeFiAjwvEy493dnaq
	ZZ9/WoSEOlnhLIkFz8JSSibi82EAPi4IQGe0mSn17LBZ5ehrX0/OgPGHUz9ENeqc21Ai9qUoN7/2w
	89oCmqi45lvRNB0jHehJ/7hxc6RHuq2BGEHCumpvHHZGVXlMbqg9aKO1UizIj8euy2Qtar/CIDnfZ
	erdAeAlik6KvP8RCqpcE8RCHU70fao3QXtnCtCRp1a13cjMnHLhfgwyUUIjNFsVtbNexq+O0QVCpE
	Q5oh9jgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDCRd-00D49n-0B;
	Tue, 12 Dec 2023 23:45:45 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDCRZ-00D47V-2H
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 23:45:43 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5e2b8f480b3so380897b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 15:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702424740; x=1703029540; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyjaDMcAOxN0dCLePetIVRjmx5K1JwIuU6FTTfYueuY=;
        b=MLPUTC8IwDtW6dD/FRXuOTD4/uiWCy++bWSaEj3Vm+4KapkqMMjYfgapa0Wcj664g+
         4xjou6pD4aGMj37PO8k5apnL0QoLWqc92zgGKUqgYKr0n8IRCn1z82oashajILcuCeKu
         +ocy9OjiKt8iTz9VhLlov+9ioSDw+o0ZEU6SsqwXfXArolijiOmi2oA42bmEa0E+5q7g
         +/LMEQn76PrDgyPPBER9AMm6wNEgGQf/w/l/rW/RZtslw9Ce8kaxqNrhkvYbC+uvpahV
         tgKwWlAy49B4qiKVYrEO14Oom0C7acpvPsL9vUw9tyYfMePHDN3NQh0BHX0ZMWiZ305w
         1abA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702424740; x=1703029540;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyjaDMcAOxN0dCLePetIVRjmx5K1JwIuU6FTTfYueuY=;
        b=DX9eSnNJiJ3Ok9OKIU/2wrRH8gxN5qdmNfQwS4k+WgmfCJk0DYEsPIFfW5pgXEU1EH
         u683JjG0KEVpAir3NMFFkeAHZxik0+60g7U9KxWqBzdIaMCKDnOzzm3Oy9gQe5ZIJVas
         boSN1GQ/zTJzNPJnZTqnq7JkA64UCSLIwKeD85heIMRv6443RMf81RCIjy4JOwVIocP2
         BwRWiykC7POFuWJte+Tu39RlwngxKYFKLHqJSqtw+md31/+/3Vfol+X1tFIGo3yS0cbj
         byi+MCu0QVXYnZczKwP6ErvSwF9psdGPu3UQ8w7RNqTOXU5KHskPNRPCB+u/NCHyxMmI
         1/6w==
X-Gm-Message-State: AOJu0YwFSwyVbKEtHPztOd5VgYrPhuyyBMv1pV2imv60A6TeTACf8kLK
	jRopxVViaAcUa044i8IxWe7s/UxW4epOrV0IEt8TWg==
X-Received: by 2002:a5b:889:0:b0:db9:e78d:7eff with SMTP id
 e9-20020a5b0889000000b00db9e78d7effmt942245ybq.59.1702424739879; Tue, 12 Dec
 2023 15:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20231212234310.2034900-1-debug@rivosinc.com>
In-Reply-To: <20231212234310.2034900-1-debug@rivosinc.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 12 Dec 2023 15:45:28 -0800
Message-ID: <CAKC1njTpVN51j=xFHkbZBY6PDeGp8tVRBcgATTZPVHMuaGEz8A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] riscv: abstract envcfg CSR
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>, 
	Evan Green <evan@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_154541_749623_39EE7CF7 
X-CRM114-Status: GOOD (  25.59  )
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

U29tZSBpc3N1ZXMgaW4gd29ya2Zsb3cuIFBhdGNoZXMgZGlkbid0IGNvbWUgb3V0IHNlcGFyYXRl
bHkuCgpJZ25vcmUgdGhpcy4KCk9uIFR1ZSwgRGVjIDEyLCAyMDIzIGF0IDM6NDPigK9QTSBEZWVw
YWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFic3Ry
YWN0cyBlbnZjZmcgQ1NSIGluIGtlcm5lbCAoYXMgaXMgZG9uZSBmb3Igb3RoZXIgaG9tb255bgo+
IENTUnMpLiBDU1JfRU5WQ0ZHIGlzIHVzZWQgYXMgYWxpYXMgZm9yIENTUl9TRU5WQ0ZHIG9yIENT
Ul9NRU5WQ0ZHIGRlcGVuZGluZwo+IG9uIGhvdyBrZXJuZWwgaXMgY29tcGlsZWQuCj4KPiBBZGRp
dGlvbmFsbHkgaXQgY2hhbmdlcyBDQlpFIGVuYWJsaW5nIHRvIHN0YXJ0IHVzaW5nIENTUl9FTlZD
RkcgaW5zdGVhZCBvZgo+IENTUl9TRU5WQ0ZHLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1
cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmggICB8IDIgKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMiArLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Nzci5oCj4gaW5kZXggMzA2YTE5YTU1MDljLi5iMzQwMDUxN2IwYTkgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3NyLmgKPiBAQCAtNDE1LDYgKzQxNSw3IEBACj4gICMgZGVmaW5lIENTUl9TVEFU
VVMgICAgQ1NSX01TVEFUVVMKPiAgIyBkZWZpbmUgQ1NSX0lFICAgICAgICAgICAgICAgIENTUl9N
SUUKPiAgIyBkZWZpbmUgQ1NSX1RWRUMgICAgICBDU1JfTVRWRUMKPiArIyBkZWZpbmUgQ1NSX0VO
VkNGRyBDU1JfTUVOVkNGRwo+ICAjIGRlZmluZSBDU1JfU0NSQVRDSCAgIENTUl9NU0NSQVRDSAo+
ICAjIGRlZmluZSBDU1JfRVBDICAgICAgIENTUl9NRVBDCj4gICMgZGVmaW5lIENTUl9DQVVTRSAg
ICAgQ1NSX01DQVVTRQo+IEBAIC00MzksNiArNDQwLDcgQEAKPiAgIyBkZWZpbmUgQ1NSX1NUQVRV
UyAgICBDU1JfU1NUQVRVUwo+ICAjIGRlZmluZSBDU1JfSUUgICAgICAgICAgICAgICAgQ1NSX1NJ
RQo+ICAjIGRlZmluZSBDU1JfVFZFQyAgICAgIENTUl9TVFZFQwo+ICsjIGRlZmluZSBDU1JfRU5W
Q0ZHIENTUl9TRU5WQ0ZHCj4gICMgZGVmaW5lIENTUl9TQ1JBVENIICAgQ1NSX1NTQ1JBVENICj4g
ICMgZGVmaW5lIENTUl9FUEMgICAgICAgQ1NSX1NFUEMKPiAgIyBkZWZpbmUgQ1NSX0NBVVNFICAg
ICBDU1JfU0NBVVNFCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IGluZGV4IGIzNzg1ZmZjMTU3MC4u
OTg2MjMzOTNmZDFmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IEBAIC03MjUsNyArNzI1
LDcgQEAgYXJjaF9pbml0Y2FsbChjaGVja191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKTsKPiAg
dm9pZCByaXNjdl91c2VyX2lzYV9lbmFibGUodm9pZCkKPiAgewo+ICAgICAgICAgaWYgKHJpc2N2
X2NwdV9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KHNtcF9wcm9jZXNzb3JfaWQoKSwgUklTQ1ZfSVNB
X0VYVF9aSUNCT1opKQo+IC0gICAgICAgICAgICAgICBjc3Jfc2V0KENTUl9TRU5WQ0ZHLCBFTlZD
RkdfQ0JaRSk7Cj4gKyAgICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX0VOVkNGRywgRU5WQ0ZHX0NC
WkUpOwo+ICB9Cj4KPiAgI2lmZGVmIENPTkZJR19SSVNDVl9BTFRFUk5BVElWRQo+IC0tCj4gMi40
My4wCj4KPgo+IEZyb20gMmFkNWI5MWJkYTk3ZjZkYmM5ZjQ4YTJlMGU4YzZlYWU1Yjg0NTJjYSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9z
aW5jLmNvbT4KPiBEYXRlOiBUdWUsIDEyIERlYyAyMDIzIDE0OjI4OjU5IC0wODAwCj4gU3ViamVj
dDogW1BBVENIIHYxIDIvMl0gcmlzY3Y6IGVudmNmZyBzYXZlIGFuZCByZXN0b3JlIG9uIHRyYXAg
ZW50cnkvZXhpdAo+Cj4gZW52Y2ZnIENTUiBkZWZpbmVzIGVuYWJsaW5nIGJpdHMgZm9yIGNhY2hl
IG1hbmFnZW1lbnQgaW5zdHJ1Y3Rpb25zIGFuZCBzb29uCj4gd2lsbCBjb250cm9sIGVuYWJsaW5n
IGZvciBjb250cm9sIGZsb3cgaW50ZWdyaXR5IGFuZCBwb2ludGVyIG1hc2tpbmcgZmVhdHVyZXMu
Cj4KPiBDb250cm9sIGZsb3cgaW50ZWdyaXR5IGFuZCBwb2ludGVyIG1hc2tpbmcgZmVhdHVyZXMg
bmVlZCB0byBiZSBlbmFibGVkIG9uIHBlcgo+IHRocmVhZCBiYXNpcy4gQWRkaXRpb25hbGx5LCBJ
IGJlbGlldmUgY2FjaGUgbWFuYWdlbWVudCBpbnN0cnVjdGlvbnMgbmVlZCB0byBiZQo+IGVuYWJs
ZWQgb24gcGVyIHRocmVhZCBiYXNpcy4gQXMgYW4gZXhhbXBsZSBhIHNlY2NvbXBlZCB0YXNrIG9u
IHJpc2N2IG1heSBiZQo+IHJlc3RyaWN0ZWQgdG8gbm90IHVzZSBjYWNoZSBtYW5hZ2VtZW50IGlu
c3RydWN0aW9ucwo+Cj4gVGhpcyBwYXRjaCBjcmVhdGVzIGEgcGxhY2UgaG9sZGVyIGZvciBlbnZj
ZmcgQ1NSIGluIGB0aHJlYWRfaW5mb2AgYW5kIGFkZHMKPiBsb2dpYyB0byBzYXZlIGFuZCByZXN0
b3JlIG9uIHRyYXAgZW50cnkgYW5kIGV4aXRzLiBUaGlzIGFsbG93cyBzdWNoIGlzYSBmZWF0dXJl
Cj4gdG8gYmUgZW5hYmxlZCBvbiBwZXIgdGhyZWFkIGJhc2lzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
RGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGhyZWFkX2luZm8uaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zm
c2V0cy5jICAgICAgfCAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgICAg
IHwgNiArKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiBpbmRleCA1NzQ3Nzk5MDBiZmIuLjMyMGJjODk5
YTYzYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPiBAQCAtNTcsNiAr
NTcsNyBAQCBzdHJ1Y3QgdGhyZWFkX2luZm8gewo+ICAgICAgICAgbG9uZyAgICAgICAgICAgICAg
ICAgICAgdXNlcl9zcDsgICAgICAgIC8qIFVzZXIgc3RhY2sgcG9pbnRlciAqLwo+ICAgICAgICAg
aW50ICAgICAgICAgICAgICAgICAgICAgY3B1Owo+ICAgICAgICAgdW5zaWduZWQgbG9uZyAgICAg
ICAgICAgc3lzY2FsbF93b3JrOyAgIC8qIFNZU0NBTExfV09SS18gZmxhZ3MgKi8KPiArICAgICAg
IHVuc2lnbmVkIGxvbmcgZW52Y2ZnOwo+ICAjaWZkZWYgQ09ORklHX1NIQURPV19DQUxMX1NUQUNL
Cj4gICAgICAgICB2b2lkICAgICAgICAgICAgICAgICAgICAqc2NzX2Jhc2U7Cj4gICAgICAgICB2
b2lkICAgICAgICAgICAgICAgICAgICAqc2NzX3NwOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9hc20tb2Zmc2V0cy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwo+
IGluZGV4IGEwMzEyOWY0MGM0Ni4uY2RkOGYwOTVjMzBjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zm
c2V0cy5jCj4gQEAgLTM5LDYgKzM5LDcgQEAgdm9pZCBhc21fb2Zmc2V0cyh2b2lkKQo+ICAgICAg
ICAgT0ZGU0VUKFRBU0tfVElfUFJFRU1QVF9DT1VOVCwgdGFza19zdHJ1Y3QsIHRocmVhZF9pbmZv
LnByZWVtcHRfY291bnQpOwo+ICAgICAgICAgT0ZGU0VUKFRBU0tfVElfS0VSTkVMX1NQLCB0YXNr
X3N0cnVjdCwgdGhyZWFkX2luZm8ua2VybmVsX3NwKTsKPiAgICAgICAgIE9GRlNFVChUQVNLX1RJ
X1VTRVJfU1AsIHRhc2tfc3RydWN0LCB0aHJlYWRfaW5mby51c2VyX3NwKTsKPiArICAgICAgIE9G
RlNFVChUQVNLX1RJX0VOVkNGRywgdGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLmVudmNmZyk7Cj4g
ICNpZmRlZiBDT05GSUdfU0hBRE9XX0NBTExfU1RBQ0sKPiAgICAgICAgIE9GRlNFVChUQVNLX1RJ
X1NDU19TUCwgdGFza19zdHJ1Y3QsIHRocmVhZF9pbmZvLnNjc19zcCk7Cj4gICNlbmRpZgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwv
ZW50cnkuUwo+IGluZGV4IDU0Y2E0NTY0YTkyNi4uYTFkODcwMTNmMTVhIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRy
eS5TCj4gQEAgLTY0LDEyICs2NCwxNCBAQCBTWU1fQ09ERV9TVEFSVChoYW5kbGVfZXhjZXB0aW9u
KQo+ICAgICAgICAgY3NyciBzMywgQ1NSX1RWQUwKPiAgICAgICAgIGNzcnIgczQsIENTUl9DQVVT
RQo+ICAgICAgICAgY3NyciBzNSwgQ1NSX1NDUkFUQ0gKPiArICAgICAgIGNzcnIgczYsIENTUl9F
TlZDRkcKPiAgICAgICAgIFJFR19TIHMwLCBQVF9TUChzcCkKPiAgICAgICAgIFJFR19TIHMxLCBQ
VF9TVEFUVVMoc3ApCj4gICAgICAgICBSRUdfUyBzMiwgUFRfRVBDKHNwKQo+ICAgICAgICAgUkVH
X1MgczMsIFBUX0JBREFERFIoc3ApCj4gICAgICAgICBSRUdfUyBzNCwgUFRfQ0FVU0Uoc3ApCj4g
ICAgICAgICBSRUdfUyBzNSwgUFRfVFAoc3ApCj4gKyAgICAgICBSRUdfUyBzNiwgVEFTS19USV9F
TlZDRkcodHApCj4KPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBTZXQgdGhlIHNjcmF0Y2ggcmVn
aXN0ZXIgdG8gMCwgc28gdGhhdCBpZiBhIHJlY3Vyc2l2ZSBleGNlcHRpb24KPiBAQCAtMTI5LDYg
KzEzMSwxMCBAQCBTWU1fQ09ERV9TVEFSVF9OT0FMSUdOKHJldF9mcm9tX2V4Y2VwdGlvbikKPiAg
ICAgICAgIGFkZGkgczAsIHNwLCBQVF9TSVpFX09OX1NUQUNLCj4gICAgICAgICBSRUdfUyBzMCwg
VEFTS19USV9LRVJORUxfU1AodHApCj4KPiArICAgICAgIC8qIHJlc3RvcmUgZW52Y2ZnIGJpdHMg
Zm9yIGN1cnJlbnQgdGhyZWFkICovCj4gKyAgICAgICBSRUdfTCBzMCwgVEFTS19USV9FTlZDRkco
dHApCj4gKyAgICAgICBjc3J3IENTUl9FTlZDRkcsIHMwCj4gKwo+ICAgICAgICAgLyogU2F2ZSB0
aGUga2VybmVsIHNoYWRvdyBjYWxsIHN0YWNrIHBvaW50ZXIgKi8KPiAgICAgICAgIHNjc19zYXZl
X2N1cnJlbnQKPgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
