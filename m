Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C34EC54E67
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 09:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+l+u1bMYsGY1pgnh21gkZoTnATLe0Oh6+Nsf1t5+BM=; b=WJIgvu0JrDIIK5
	a8WMD3i72UASTBYSOqdw1rrnNOa9qpfeK7KBUEZe7fCRRdEnmAsfW25X8G1kCaG05pEaOSkEELLLw
	fPCHpvJY9RHJWArq9jxZDtIYVEdpJvxsrYAM/bK1QP6Br3AWH7/rwHK6w4FvmBFd9tUsSmePddaNu
	NSPayxzBwiGx6OnV8Y0rc0Lywx7Vjf5SwYeo6Yp6IWvuibXSJd46JelNAavETt/xtDvEKqBWX8UtK
	0O3yPNjA+H6OcEPYUHVaPDgLLzqBVcbo6zrLNC4ud2dkIagixO+nNCI8X+LEy16OcQGfHD3MKMKRJ
	ZP0S6qwADGe6KSUNAAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnxn0-0000000A5Bq-2YDs;
	Sat, 23 Mar 2024 09:35:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnxmy-0000000A5BS-0VKW
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 09:35:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41482f250e6so639845e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2024 02:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711186541; x=1711791341; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gifRQ1PeHTOYVEFwRFqeQ4RDDqpypI+PitbwyUwiMWU=;
        b=Twrqn65t3t2e+iZhTF5a+LhMLQReun+yc9UJe38h6qqkFgpFOvrod2f1ZtKvOxd7z2
         8aBkUlJeSrBVZ7XOSIKK54jdfgjGMm2La4HNgHDdhEVO4Q9aO77MvmCPBOPIBA+Q6CIq
         H80ZIiueDJY3zr6Uz+Z+gBhWtD3q11qqeI8u77V8vaIw0NcZjBLMfVCqKy6Cx/lVOzph
         EWKJzw8gvgWl9JrFZKi7m5oJQJp9G9PgnIF1JsjIwk8UCrHfhrrBnLQtoE38n5zQkV7g
         uBceUYpxjHHKNGAWYsgov0Oy5s+rn6lyD9wdNIPrfPu9WMIHYi4EyeuI4XUYvx04pAmb
         Rg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711186541; x=1711791341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gifRQ1PeHTOYVEFwRFqeQ4RDDqpypI+PitbwyUwiMWU=;
        b=JfDLVnzuCth9yi3GGJ5pYNp4RPXQn6i9/zJr5EFBKRmdozeu2Fbpgk+L98gh3RRuHM
         sE42+96Q6dqvStLwOZAahs2bTqnruJ8TrLYoU9Ox04ioffMV26QMWpNhC6CFaCf43lzy
         Z0fYLVo+T0ocJPxh/nRKTsRXAy+M+brxNmDAVE8EMYyICsnOFw9hzpKJjvAaGS2nFB/z
         sV3T4rFbHiz389sjV4scvUtjkwcxkEsb/x3bYyml0dfaoBMFsUdNtFMZ1q39EZsW4TA/
         5saduGfwJsfwQw4Ze8UyO78ChSjFNM1beXhsFs/T9vIxTo1bTqG8pjr7XY2GklM0uJPY
         c1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWde5g9sZNj0Am+ztHUMKxz75O20cJRLcsQxNDK3Bp9Wqj0SjWu3YN4pq9X+5K/iUrtNefnvgz1GH9V/BoTn9nU5VgY8Bjs/GBsiqFx7kx+
X-Gm-Message-State: AOJu0YwOWbtytwFIM4fvEK/2O1LXdHwT/JXsatWGlHXGX7eF0q4RQ4f/
	5GFnAPrEkAtXsQAOl9vtH/hJyh2AR117X07SFw+ZGgSZIj1gC38fCaBU4olTytZyfzjrSdMpSpG
	V
X-Google-Smtp-Source: AGHT+IFbwgqGndQ/tq89s59sI9i70gnFLDdzQdyEVv7eywiPzA9nOZyyH6mD6Ek/HoPjrrEzETlg/w==
X-Received: by 2002:a5d:40d2:0:b0:33e:78d5:848e with SMTP id b18-20020a5d40d2000000b0033e78d5848emr1084783wrq.12.1711186540910;
        Sat, 23 Mar 2024 02:35:40 -0700 (PDT)
Received: from localhost ([2a00:11b1:10c0:1192:d048:e3e1:1749:7466])
        by smtp.gmail.com with ESMTPSA id cl1-20020a5d5f01000000b0033e72e104c5sm3007561wrb.34.2024.03.23.02.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 02:35:40 -0700 (PDT)
Date: Sat, 23 Mar 2024 10:35:38 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, tech-j-ext@lists.risc-v.org, 
	kasan-dev@googlegroups.com, Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
Message-ID: <20240323-28943722feb57a41fb0ff488@orel>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com>
 <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
 <CAKC1njQYZHbQJ71mapeG1DEw=A+aGx77xsuQGecsNFpoJ=tzGQ@mail.gmail.com>
 <d9452ab4-a783-4bcf-ac25-40baa4f31fac@sifive.com>
 <CAKC1njRBbzM+gWowg1LOjq5GzVn4q+vJP9JUswVYfWmEw+yHSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKC1njRBbzM+gWowg1LOjq5GzVn4q+vJP9JUswVYfWmEw+yHSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_023544_211580_272BFFB3 
X-CRM114-Status: GOOD (  37.13  )
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

T24gRnJpLCBNYXIgMjIsIDIwMjQgYXQgMTA6MTM6NDhBTSAtMDcwMCwgRGVlcGFrIEd1cHRhIHdy
b3RlOgo+IE9uIFRodSwgTWFyIDIxLCAyMDI0IGF0IDU6MTPigK9QTSBTYW11ZWwgSG9sbGFuZAo+
IDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAyMDI0LTAzLTE5
IDExOjM5IFBNLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gPiA+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKPiA+ID4+Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9zd2l0Y2hfdG8uaAo+ID4gPj4+PiBAQCAtNjksNiArNjksMTcgQEAgc3RhdGljIF9fYWx3
YXlzX2lubGluZSBib29sIGhhc19mcHUodm9pZCkgeyByZXR1cm4gZmFsc2U7IH0KPiA+ID4+Pj4g
ICNkZWZpbmUgX19zd2l0Y2hfdG9fZnB1KF9fcHJldiwgX19uZXh0KSBkbyB7IH0gd2hpbGUgKDAp
Cj4gPiA+Pj4+ICAjZW5kaWYKPiA+ID4+Pj4KPiA+ID4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBz
eW5jX2VudmNmZyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spCj4gPiA+Pj4+ICt7Cj4gPiA+Pj4+
ICsgICAgICAgY3NyX3dyaXRlKENTUl9FTlZDRkcsIHRoaXNfY3B1X3JlYWQocmlzY3ZfY3B1X2Vu
dmNmZykgfCB0YXNrLT50aHJlYWQuZW52Y2ZnKTsKPiA+ID4+Pj4gK30KPiA+ID4+Pj4gKwo+ID4g
Pj4+PiArc3RhdGljIGlubGluZSB2b2lkIF9fc3dpdGNoX3RvX2VudmNmZyhzdHJ1Y3QgdGFza19z
dHJ1Y3QgKm5leHQpCj4gPiA+Pj4+ICt7Cj4gPiA+Pj4+ICsgICAgICAgaWYgKHJpc2N2X2NwdV9o
YXNfZXh0ZW5zaW9uX3VubGlrZWx5KHNtcF9wcm9jZXNzb3JfaWQoKSwgUklTQ1ZfSVNBX0VYVF9Y
TElOVVhFTlZDRkcpKQo+ID4gPj4+Cj4gPiA+Pj4gSSd2ZSBzZWVuIGByaXNjdl9jcHVfaGFzX2V4
dGVuc2lvbl91bmxpa2VseWAgZ2VuZXJhdGluZyBicmFuY2h5IGNvZGUKPiA+ID4+PiBldmVuIGlm
IEFMVEVSTkFUSVZFUyB3YXMgdHVybmVkIG9uLgo+ID4gPj4+IENhbiB5b3UgY2hlY2sgZGlzYXNt
IG9uIHlvdXIgZW5kIGFzIHdlbGwuICBJTUhPLCBgZW50cnkuU2AgaXMgYSBiZXR0ZXIKPiA+ID4+
PiBwbGFjZSB0byBwaWNrIHVwICplbnZjZmcuCj4gPiA+Pgo+ID4gPj4gVGhlIGJyYW5jaGluZXNz
IGlzIHNvcnQgb2YgZXhwZWN0ZWQsIHNpbmNlIHRoYXQgZnVuY3Rpb24gaXMgaW1wbGVtZW50ZWQg
YnkKPiA+ID4+IHN3aXRjaGluZyBvbi9vZmYgYSBicmFuY2ggaW5zdHJ1Y3Rpb24sIHNvIHRoZSBh
bHRlcm5hdGUgY29kZSBpcyBuZWNlc3NhcmlseSBhCj4gPiA+PiBzZXBhcmF0ZSBiYXNpYyBibG9j
ay4gSXQncyBhIHRyYWRlb2ZmIHNvIHdlIGRvbid0IGhhdmUgdG8gd3JpdGUgYXNzZW1ibHkgY29k
ZQo+ID4gPj4gZm9yIGV2ZXJ5IGJpdCBvZiBjb2RlIHRoYXQgZGVwZW5kcyBvbiBhbiBleHRlbnNp
b24uIEhvd2V2ZXIsIHRoZSBjb3N0IHNob3VsZCBiZQo+ID4gPj4gc29tZXdoYXQgbG93ZXJlZCBz
aW5jZSB0aGUgYnJhbmNoIGlzIHVuY29uZGl0aW9uYWwgYW5kIHNvIGVudGlyZWx5IHByZWRpY3Rh
YmxlLgo+ID4gPj4KPiA+ID4+IElmIHRoZSBicmFuY2ggdHVybnMgb3V0IHRvIGJlIHByb2JsZW1h
dGljIGZvciBwZXJmb3JtYW5jZSwgdGhlbiB3ZSBjb3VsZCB1c2UKPiA+ID4+IEFMVEVSTkFUSVZF
IGRpcmVjdGx5IGluIHN5bmNfZW52Y2ZnKCkgdG8gTk9QIG91dCB0aGUgQ1NSIHdyaXRlLgo+ID4g
Pgo+ID4gPiBZZWFoIEkgbGVhbiB0b3dhcmRzIHVzaW5nIGFsdGVybmF0aXZlcyBkaXJlY3RseS4K
PiA+Cj4gPiBPbmUgdGhpbmcgdG8gbm90ZSBoZXJlOiB3ZSBjYW4ndCB1c2UgYWx0ZXJuYXRpdmVz
IGRpcmVjdGx5IGlmIHRoZSBiZWhhdmlvciBuZWVkcwo+ID4gdG8gYmUgZGlmZmVyZW50IG9uIGRp
ZmZlcmVudCBoYXJ0cyAoaS5lLiBhIHN1YnNldCBvZiBoYXJ0cyBpbXBsZW1lbnQgdGhlIGVudmNm
Zwo+ID4gQ1NSKS4gSSB0aGluayB3ZSBuZWVkIHNvbWUgcG9saWN5IGFib3V0IHdoaWNoIElTQSBl
eHRlbnNpb25zIGFyZSBhbGxvd2VkIHRvIGJlCj4gPiBhc3ltbWV0cmljIGFjcm9zcyBoYXJ0cywg
b3IgZWxzZSB3ZSBhZGQgdG9vIG11Y2ggY29tcGxleGl0eS4KPiAKPiBBcyBJJ3ZlIHJlc3BvbmRl
ZCBvbiB0aGUgc2FtZSB0aHJlYWQgLiBXZSBhcmUgYWRkaW5nIHRvbyBtdWNoCj4gY29tcGxleGl0
eSBieSBhc3N1bWluZwo+IHRoYXQgaGV0ZXJvZ2VuZW91cyBJU0EgZXhpc3RzICh3aGljaCBpdCBk
b2Vzbid0IHRvZGF5KS4gQW5kIGV2ZW4gaWYgaXQKPiBleGlzdHMsIGl0IHdvdWxkbid0IHdvcmsu
Cj4gTm9ib2R5IHdhbnRzIHRvIHNwZW5kIGEgbG90IG9mIHRpbWUgZmlndXJpbmcgb3V0IHdoaWNo
IGhhcnRzIGhhdmUKPiB3aGljaCBJU0EgYW5kIHdoaWNoCj4gcGFja2FnZXMgYXJlIGNvbXBpbGVk
IHdpdGggd2hpY2ggSVNBLiBNb3N0IG9mIHRoZSBlbmQgdXNlcnMgZG8gYHN1ZG8KPiBhcHQgZ2V0
IGluc3RhbGwgYmxhaCBibGFoYAo+IEFuZCB0aGVuIGV4cGVjdCBpdCB0byBqdXN0IHdvcmsuCgpU
aGF0IHdpbGwgc3RpbGwgd29yayBpZiB0aGUgYXBwbGljYXRpb25zIGFuZCBsaWJyYXJpZXMgaW5z
dGFsbGVkIGFyZQpoZXRlcm9nZW5lb3VzLXBsYXRmb3JtIGF3YXJlLCBpLmUuIHRoZXkgZG8gdGhl
IGZpZ3VyaW5nIG91dCB3aGljaCBoYXJ0cwpoYXZlIHdoaWNoIGV4dGVuc2lvbnMgdGhlbXNlbHZl
cy4gQXBwbGljYXRpb25zL2xpYnJhcmllcyBzaG91bGQgYWxyZWFkeQpiZSBwcm9iaW5nIGZvciBJ
U0EgZXh0ZW5zaW9ucyBiZWZvcmUgdXNpbmcgdGhlbS4gSXQncyBub3QgYSBodWdlIGxlYXAgdG8K
YWxzbyBjaGVjayB3aGljaCBoYXJ0cyBzdXBwb3J0IHRob3NlIGV4dGVuc2lvbnMgYW5kIHRoZW4g
ZW5zdXJlIGFmZmluaXR5CmlzIHNldCBhcHByb3ByaWF0ZWx5LgoKPiBJdCBkb2Vzbid0IHdvcmsg
Zm9yIG90aGVyCj4gYXJjaGl0ZWN0dXJlcyBhbmQgZXZlbiB3aGVuIHNvbWVvbmUKPiB0cmllZCwg
dGhleSBoYWQgdG8gZGlzYWJsZSBjZXJ0YWluIElTQSBmZWF0dXJlcyB0byBtYWtlIHN1cmUgdGhh
dCBhbGwKPiBjb3JlcyBoYXZlIHRoZSBzYW1lIElTQSBmZWF0dXJlCj4gKHNlYXJjaCBBVlgxMiBJ
bnRlbCBBbGRlciBMYWtlIERpc2FibGUpLgoKVGhlIFJJU0MtViBzb2Z0d2FyZSBlY29zeXN0ZW0g
aXMgc3RpbGwgYmVpbmcgZGV2ZWxvcGVkLiBXZSBoYXZlIGFuCm9wcG9ydHVuaXR5IHRvIGRyb3Ag
YXNzdW1wdGlvbnMgbWFkZSBieSBvdGhlciBhcmNoaXRlY3R1cmVzLgoKCkFzIEkgc2FpZCBpbiBh
IGRpZmZlcmVudCByZXBseSwgaXQncyByZWFzb25hYmxlIGZvciBMaW51eCB0byBub3QgYWRkIHRo
ZQpjb21wbGV4aXR5IHVudGlsIGEgdXNlIGNhc2UgY29tZXMgYWxvbmcgdGhhdCBMaW51eCB3b3Vs
ZCBsaWtlIHRvIHN1cHBvcnQsCmJ1dCBJIHRoaW5rIGl0IHdvdWxkIGJlIHByZW1hdHVyZSBmb3Ig
TGludXggdG8gcHV0IGEgc3Rha2UgaW4gdGhlIHNhbmQuCgpTbywgaG93IGFib3V0IHdlIGFkZCBj
b2RlIHRoYXQgY29uZmlybXMgWmljYm96IGlzIG9uIGFsbCBoYXJ0cy4gSWYgYW55CmhhcnQgZG9l
cyBub3QgaGF2ZSBpdCwgdGhlbiB3ZSBjb21wbGFpbiBsb3VkbHkgYW5kIGRpc2FibGUgaXQgb24g
YWxsCnRoZSBvdGhlciBoYXJ0cy4gSWYgaXQgd2FzIGp1c3QgYSBoYXJkd2FyZSBkZXNjcmlwdGlv
biBidWcsIHRoZW4gaXQnbGwKZ2V0IGZpeGVkLiBJZiB0aGVyZSdzIGFjdHVhbGx5IGEgcGxhdGZv
cm0gd2hpY2ggZG9lc24ndCBoYXZlIFppY2JvegpvbiBhbGwgaGFydHMsIHRoZW4sIHdoZW4gdGhl
IGlzc3VlIGlzIHJlcG9ydGVkLCB3ZSBjYW4gZGVjaWRlIHRvIG5vdApzdXBwb3J0IGl0LCBzdXBw
b3J0IGl0IHdpdGggZGVmY29uZmlnLCBvciBzdXBwb3J0IGl0IHVuZGVyIGEgS2NvbmZpZwpndWFy
ZCB3aGljaCBtdXN0IGJlIGVuYWJsZWQgYnkgdGhlIHVzZXIuCgpUaGFua3MsCmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
