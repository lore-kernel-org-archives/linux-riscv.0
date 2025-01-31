Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC19C0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jxw1ejvT1zWzJtvy/a5IiHCyv83kL0xo34mZ/NgJYc=; b=oX/VFnqXACak6t
	BINvMXmoMo3FFLEPkWUgIuumtM8x9mE5pznQEutg4sgNB34LLlJu3Gq3gzaWuyT2VqjjYvJRA7hMc
	MnmEVhIo2iAz+euVS5IL71BIJkmOeqoTFwNZA8M7uW0Ds7IGsM/VKdCQehGzsXk8/hWcob+Qg7VJQ
	2PM+WsYrX+aZY5kFxszjrgaa0dxQKclC7A2iMa7W+mIENRN9z96as7scLGFjX9j/M5e2Mly+DmOyj
	o7DjFekC47l79xqEoRc/QiuI/2m7d5hz15RcnCh5jviBN/trVRIG5u2SV95iKFAwH8EO9sP6CYO6v
	Jg6Y21QL+8Xqf31TjVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrz3-0000000AlsK-0S0i;
	Fri, 31 Jan 2025 14:27:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrz0-0000000Alrx-2FVG
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 14:26:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8A1CA41F65
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 14:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0339CC4CED3
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738333617;
	bh=ujZbR815iF3mj6tqoxuOtug/iMzC9IUM6fWGUVIusPM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mGMXW7mExNbU6bQmd93wQQt6d5ry/RynV1fHu4NmfUtnZ2aMTzz4vms5D4tW9Zrak
	 QUSSuUcRGuzzn9xWl0N5WsJiSOdHFDg51je7VrxAFD49GBjewW+jnvpivga4Ev8nek
	 Oqmfwl8/AsM6JXJgND7qxuzvlGGxCXtqsCuvTTPPmge8ovCfaSU/UZvFhUp063VxGD
	 vIihRqPOM4AyhiomBpxW5y63gdwoxtLdokcXEjyX37P9LazA69yYyDtX7yZtLegZ2Q
	 AYib8Pc/b7nDsaBYXesgZcZBtRqRuv9wcWwijIkHYDjUxUxToSvlWpU+2BVoDQpeAy
	 sIZuQZZ+MCx8A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54298ec925bso2200249e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 06:26:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpidTrIir/OPj/wQEyOyBHkzVzrsHX4Fyek3WM4sAOzRAMxIB1/g2dmRxPzuLt8GunGLa1UP9XSR+gQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxH8jE4iuy3bU+XJpOJ+8boiMyziSOjndIMuuvy1rVdrVd7/evL
	6+cTXTlhuRFZQlQcUJs5ZoAXEr28bqq5FjT0OE40bsJlRNaP2thavyT/8xOWYAmc8FlRcaEJC87
	fxxCy1GC+7ivs1nHI618NFevRjEY=
X-Google-Smtp-Source: AGHT+IF8Cac0tmWanGGOOlz/cEJMJMGdx7DSE2UBvSPqkABw3XevhQpnkCeE4SWfyIL/czLwtS22JNoqpCyu+dKdthA=
X-Received: by 2002:a05:6512:401e:b0:53e:385c:e86b with SMTP id
 2adb3069b0e04-543e4c031a5mr3787294e87.27.1738333615673; Fri, 31 Jan 2025
 06:26:55 -0800 (PST)
MIME-Version: 1.0
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com> <20250131035245.GA47826@ax162>
In-Reply-To: <20250131035245.GA47826@ax162>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 31 Jan 2025 23:26:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ809M8VKAOBfqSn_Sc8iPgTMVu5icOgnddH_YKDvOpzA@mail.gmail.com>
X-Gm-Features: AWEUYZmkrU5sHHDgWFjl5VPFUxom-aMzrXt8zBIX0wtQAy1LFt5U2X-q_7whJbo
Message-ID: <CAK7LNAQ809M8VKAOBfqSn_Sc8iPgTMVu5icOgnddH_YKDvOpzA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
To: Nathan Chancellor <nathan@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_062658_712559_FE7E7A91 
X-CRM114-Status: GOOD (  24.60  )
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

T24gRnJpLCBKYW4gMzEsIDIwMjUgYXQgMTI6NTLigK9QTSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMjIsIDIwMjUgYXQgMDc6MTc6
MjZQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gT24gcmlzY3YsIGtlcm5lbCBt
b2R1bGVzIGVuZCB1cCB3aXRoIGEgc2lnbmlmaWNhbnQgbnVtYmVyIG9mIGxvY2FsCj4gPiBzeW1i
b2xzLiBUaGlzIGJlY29tZXMgYXBwYXJlbnQgd2hlbiBjb21waWxpbmcgbW9kdWxlcyB3aXRoIGRl
YnVnIHN5bWJvbHMKPiA+IGVuYWJsZWQuIFVzaW5nIGFtZGdwdS5rbyBhcyBhbiBleGFtcGxlIG9m
IGEgbGFyZ2UgbW9kdWxlLCBvbiByaXNjdiB0aGUKPiA+IHNpemUgaXMgNzU0TUIgKG5vIHN0cmlw
cGluZyksIDUzTUIgKC0tc3RyaXAtZGVidWcpLCBhbmQgMjFNQgo+ID4gKC0tc3RyaXAtdW5uZWVk
ZWQpLiBPTiB4ODYsIGFtZGdwdS5rbyBpcyA0ODJNQiAobm8gc3RyaXBwaW5nKSwgMjFNQgo+ID4g
KC0tc3RyaXAtZGVidWcpLCBhbmQgMjBNQiAoLS1zdHJpcC11bm5lZWRlZCkuCj4gPgo+ID4gVXNl
IC0tc3RyaXAtdW5uZWVkZWQgaW5zdGVhZCBvZiAtLXN0cmlwLWRlYnVnIHRvIHN0cmlwIG1vZHVs
ZXMgc28KPiA+IGRlY3JlYXNlIHRoZSBzaXplIG9mIHRoZSByZXN1bHRpbmcgbW9kdWxlcy4gVGhp
cyBpcyBwYXJ0aWN1bGFybHkKPiA+IHJlbGV2YW50IGZvciByaXNjdiwgYnV0IGFsc28gbWFyZ2lu
YWxseSBhaWRzIG90aGVyIGFyY2hpdGVjdHVyZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPgo+IElzIHRoZXJlIGFueSBzb3J0
IG9mIHJlZ3Jlc3Npb24gcmlzayB3aXRoIHRoaXMgcGF0Y2g/IElmIHNvLCBhbm90aGVyCj4gb3B0
aW9uIG1heSBiZSB0byBnaXZlIGFub3RoZXIgbGV2ZWwgdG8gSU5TVEFMTF9NT0RfU1RSSVAgbGlr
ZSAyIHNvIHRoYXQKPiBJTlNUQUxMX01PRF9TVFJJUD0xIGNvbnRpbnVlcyB0byBiZWhhdmUgYXMg
YmVmb3JlIGJ1dCBwZW9wbGUgY2FuIGVhc2lseQo+IG9wdCBpbnRvIHRoaXMgb3B0aW9uLiBObyBz
dHJvbmcgb3BpbmlvbiBiZWNhdXNlIEkgYW0gbm90IHN1cmUgYnV0IHdhcwo+IG5vdCBzdXJlIGlm
IGl0IHdhcyBjb25zaWRlcmVkLgoKCkkgZG8gbm90IHRoaW5rIElOU1RBTExfTU9EX1NUUklQPTIg
aXMgd29ydGggc3VwcG9ydGluZyBiZWNhdXNlCml0IGlzIGVxdWl2YWxlbnQgdG8gSU5TVEFMTF9N
T0RfU1RSSVA9LS1zdHJpcC11bm5lZWRlZAoKCkRvY3VtZW50YXRpb24va2J1aWxkL2tidWlsZC5y
c3QgZXhwbGFpbnMgdGhhdAphbnkgdmFsdWUgb3RoZXIgdGhhbiAnMScgaXMgcGFzc2VkIHRvIHRo
ZSBzdHJpcCBjb21tYW5kLgoKCklOU1RBTExfTU9EX1NUUklQCi0tLS0tLS0tLS0tLS0tLS0tCklO
U1RBTExfTU9EX1NUUklQLCBpZiBkZWZpbmVkLCB3aWxsIGNhdXNlIG1vZHVsZXMgdG8gYmUKc3Ry
aXBwZWQgYWZ0ZXIgdGhleSBhcmUgaW5zdGFsbGVkLiAgSWYgSU5TVEFMTF9NT0RfU1RSSVAgaXMg
JzEnLCB0aGVuCnRoZSBkZWZhdWx0IG9wdGlvbiAtLXN0cmlwLWRlYnVnIHdpbGwgYmUgdXNlZC4g
IE90aGVyd2lzZSwKSU5TVEFMTF9NT0RfU1RSSVAgdmFsdWUgd2lsbCBiZSB1c2VkIGFzIHRoZSBv
cHRpb25zIHRvIHRoZSBzdHJpcCBjb21tYW5kLgoKCgpSSVNDViB1c2VycyBjYW4gcGFzcyBJTlNU
QUxMX01PRF9TVFJJUD0tLXN0cmlwLXVubmVlZGVkLgoKClNvLCB0aGUgcXVlc3Rpb24gaXMsIGlz
IGl0IGJldHRlciB0byBjaGFuZ2UgdGhlIGRlZmF1bHQgb3B0aW9uCm9mIElOU1RBTExfTU9EX1NU
UklQPTEgPwoKCgoKCj4KPiBSZWdhcmRsZXNzOgo+Cj4gUmV2aWV3ZWQtYnk6IE5hdGhhbiBDaGFu
Y2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPgo+ID4gLS0tCj4gPiAgc2NyaXB0cy9NYWtlZmls
ZS5tb2RpbnN0IHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxlLm1vZGluc3Qg
Yi9zY3JpcHRzL01ha2VmaWxlLm1vZGluc3QKPiA+IGluZGV4IGY5N2M5OTI2ZWQzMWIyYjE0NjAx
ZmY3NzczYTJlYTQ4YjIyNTYyOGIuLmMyMmYzNWY2YjlkYjNjYWMzOTIzYjllNzg3YjIxOWY3NTI1
NzA2NDIgMTAwNjQ0Cj4gPiAtLS0gYS9zY3JpcHRzL01ha2VmaWxlLm1vZGluc3QKPiA+ICsrKyBi
L3NjcmlwdHMvTWFrZWZpbGUubW9kaW5zdAo+ID4gQEAgLTgwLDcgKzgwLDcgQEAgcXVpZXRfY21k
X2luc3RhbGwgPSBJTlNUQUxMICRACj4gPiAgaWZkZWYgSU5TVEFMTF9NT0RfU1RSSVAKPiA+Cj4g
PiAgaWZlcSAoJChJTlNUQUxMX01PRF9TVFJJUCksMSkKPiA+IC1zdHJpcC1vcHRpb24gOj0gLS1z
dHJpcC1kZWJ1Zwo+ID4gK3N0cmlwLW9wdGlvbiA6PSAtLXN0cmlwLXVubmVlZGVkCj4gPiAgZWxz
ZQo+ID4gIHN0cmlwLW9wdGlvbiA6PSAkKElOU1RBTExfTU9EX1NUUklQKQo+ID4gIGVuZGlmCj4g
Pgo+ID4gLS0tCj4gPiBiYXNlLWNvbW1pdDogZmZkMjk0ZDM0NmQxODViNzBlMjhiMWEyOGFiZTM2
N2JiZmU1M2MwNAo+ID4gY2hhbmdlLWlkOiAyMDI1MDEyMi1zdHJpcF91bm5lZWRlZC1jYWI3Mjkz
MTAwNTYKPiA+IC0tCj4gPiAtIENoYXJsaWUKPiA+CgoKCi0tCkJlc3QgUmVnYXJkcwpNYXNhaGly
byBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
