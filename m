Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B11BC27C55
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qt9hQRXrvxxAcmUu/qUGfS6AemN0xbWS39uCccCMsOk=; b=KlB+qS34+3SKdw
	quMwwXHz7iicEhDgcr+dsnRpDh81gUV6Tpmvzg0VKxYY2DKaMSoMSZUoFQxO0T+IUBngazeYoZmGl
	bWaBt46lb7nrA4EfvSY186ic5JMmmx2DETUaEfDrpELoukw9CfjMykuQ7UddQQFuvJ55OKsF1jGVw
	l5jmz1ywQ5nkdDQEM8guiEaAdR1T48gtx61gveUhAvjfGysIQZ3GShLw/PDl9gVGaTZ9UUyxX9ASc
	0FzJ149NjFGalfnc7b2/KIYZkIOjODn/kBu8Vur35q4PIpUTRja0vh6+BFrulyPlZ3cUQi0OzZikP
	e/n/eJBnQh47RFSaFsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFFOT-0000000ANGp-06cp;
	Thu, 06 Jun 2024 15:51:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFFOP-0000000ANFW-203K
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 15:51:11 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2c20eed350fso918453a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717689066; x=1718293866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDmlKGnxhvteIYdGoZUuN1H/FeEZVR1GpReejN7otNE=;
        b=2tG2FsQXQQF5jDQUHT12QZYNeNBYkBy8kgudr3LYtigigeY2NkGAOZT9VBQOwrRR7J
         Ggbl2HcaAgycP0qADtNiPOoZwx3C40DPrJK5XUVXWKQHyHrytj0KmHB92I6uOBvo+28C
         fDz4YMz6gcNE+znMN99o0K67tVTbYFuwGM54WYbINoRRoeMLtDYc5W6Y6oRZQi87uMlc
         hVGRESRG9yRkC+zFahWRqL4Q/hCLMD/AbY6o0bnemd/f5t4/9yD+L3wt90oxAmMIXgMX
         NIRe4U2MnEODMBGkCeAB2fn4eBeXGKVJO+Doy8AN0R3W2wdyiQL22F0ttPbVKJcodPu2
         PdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717689066; x=1718293866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDmlKGnxhvteIYdGoZUuN1H/FeEZVR1GpReejN7otNE=;
        b=OFhkprIY3pU5IEYDAsIffSJsaydOO0ZdtBJo6OV0We/dcoUyM3UDD/tF6PV+KpgYuF
         eNQ6y5KlsbQIzg+gSPhO9rGHevttliZqtGlovkh0vMVyrelYQuZ3hxA+1jtp30WQHW50
         j2pv6tyhBSsKzAeNu/jnM3guqclFKsxCZfDqmPZWCorq3aGtAZXL20/Ct1fRk2t0ROI+
         7JtEV+J1kFIIOxp4b1zoF6zkN6xFzWii3z38B4tETXFPlMM7bPRfOY2QGAnRwll+nKcx
         5yPO7igv173YJbOYQ4qAr95Dby0dD30yYlxF1FNGTCZky6KPWczBVrO5v25terNDnHZW
         OOVA==
X-Gm-Message-State: AOJu0YzKx37kvrFy54P3i3h67cC6RU/klOUZcBlQWA0+m+hD9bEaT2tR
	a4wwAQBHP2gYcYP34BPU04vG45z+zr6o0Kr42QAZRNYc6EvqOps7bqbFd/ihU0Y=
X-Google-Smtp-Source: AGHT+IGDNf+n2WEFOQ3uys+exa6v8+p9xOEthb5+b/G77zFZwY+Wcx90+vRsnhUCfmsd12xUa2qWiA==
X-Received: by 2002:a17:90a:9ac:b0:2c2:5341:7ed6 with SMTP id 98e67ed59e1d1-2c27db58f5dmr6165630a91.38.1717689066272;
        Thu, 06 Jun 2024 08:51:06 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28063a7fcsm3756281a91.7.2024.06.06.08.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 08:51:05 -0700 (PDT)
Message-ID: <bd3b89cb-07fc-4b9f-9f10-9b0f3664ec5e@rivosinc.com>
Date: Thu, 6 Jun 2024 11:50:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
To: Zong Li <zong.li@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <CANXhq0pYNWvMxkkNPpYW4OrOXK19Rehdy3yO8u1sforyVjdTZg@mail.gmail.com>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <CANXhq0pYNWvMxkkNPpYW4OrOXK19Rehdy3yO8u1sforyVjdTZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_085109_637140_DE88020E 
X-CRM114-Status: GOOD (  34.10  )
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

CgpPbiA2LzUvMjQgMDA6NTEsIFpvbmcgTGkgd3JvdGU6Cj4gT24gU2F0LCBKdW4gMSwgMjAyNCBh
dCAxMjoyM+KAr0FNIEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Pgo+
PiBEZWN0ZWN0IHRoZSBaa3IgZXh0ZW5zaW9uIGFuZCB1c2UgaXQgdG8gc2VlZCB0aGUga2VybmVs
IGJhc2UgYWRkcmVzcy4KPj4KPj4gRGV0ZWN0aW9uIG9mIHRoZSBleHRlbnNpb24gY2FuIG5vdCBi
ZSBkb25lIGluIHRoZSB0eXBpY2FsIGZhc2hpb24sIGFzCj4+IHRoaXMgaXMgdmVyeSBlYXJseSBp
biB0aGUgYm9vdCBwcm9jZXNzLiBJbnN0ZWFkLCBhZGQgYSB0cmFwIGhhbmRsZXIKPj4gYW5kIHJ1
biBpdCB0byBzZWUgaWYgdGhlIGV4dGVuc2lvbiBpcyBwcmVzZW50Lgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4gICBhcmNoL3Jp
c2N2L2tlcm5lbC9waS9NYWtlZmlsZSAgICAgICAgICAgfCAgMiArLQo+PiAgIGFyY2gvcmlzY3Yv
a2VybmVsL3BpL2FyY2hyYW5kb21fZWFybHkuYyB8IDcxICsrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgfCAgMyArKwo+
PiAgIDMgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9waS9hcmNocmFuZG9tX2Vhcmx5
LmMKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3BpL01ha2VmaWxlIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcGkvTWFrZWZpbGUKPj4gaW5kZXggNTBiYzVlZjdkZDJmLi45MDI1ZWI1
Mjk0NWEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3BpL01ha2VmaWxlCj4+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3BpL01ha2VmaWxlCj4+IEBAIC0zMiw1ICszMiw1IEBAICQo
b2JqKS9zdHJpbmcubzogJChzcmN0cmVlKS9saWIvc3RyaW5nLmMgRk9SQ0UKPj4gICAkKG9iaikv
Y3R5cGUubzogJChzcmN0cmVlKS9saWIvY3R5cGUuYyBGT1JDRQo+PiAgICAgICAgICAkKGNhbGwg
aWZfY2hhbmdlZF9ydWxlLGNjX29fYykKPj4KPj4gLW9iai15ICAgICAgICAgIDo9IGNtZGxpbmVf
ZWFybHkucGkubyBmZHRfZWFybHkucGkubyBzdHJpbmcucGkubyBjdHlwZS5waS5vIGxpYi1mZHQu
cGkubyBsaWItZmR0X3JvLnBpLm8KPj4gK29iai15ICAgICAgICAgIDo9IGNtZGxpbmVfZWFybHku
cGkubyBmZHRfZWFybHkucGkubyBzdHJpbmcucGkubyBjdHlwZS5waS5vIGxpYi1mZHQucGkubyBs
aWItZmR0X3JvLnBpLm8gYXJjaHJhbmRvbV9lYXJseS5waS5vCj4+ICAgZXh0cmEteSAgICAgICAg
ICAgICAgICA6PSAkKHBhdHN1YnN0ICUucGkubywlLm8sJChvYmoteSkpCj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9waS9hcmNocmFuZG9tX2Vhcmx5LmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9waS9hcmNocmFuZG9tX2Vhcmx5LmMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi4zMTFiZTkzODhiNWMKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9waS9hcmNocmFuZG9tX2Vhcmx5LmMKPj4gQEAgLTAsMCArMSw3MSBA
QAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+PiArCj4+ICsv
Kgo+PiArICogVG8gYXZvaWQgcmV3cml0ZWluZyBjb2RlIGluY2x1ZGUgYXNtL2FyY2hyYW5kb20u
aCBhbmQgY3JlYXRlIG1hY3Jvcwo+PiArICogZm9yIHRoZSBmdW5jdGlvbnMgdGhhdCB3b24ndCBi
ZSBpbmNsdWRlZC4KPj4gKyAqLwo+PiArCj4+ICsjZGVmaW5lIHJpc2N2X2hhc19leHRlbnNpb25f
bGlrZWx5KC4uLikgZmFsc2UKPj4gKyNkZWZpbmUgcHJfZXJyX29uY2UoLi4uKQo+PiArCj4+ICsj
aW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4gKyNpbmNsdWRlIDxhc20vaHdjYXAuaD4KPj4gKyNp
bmNsdWRlIDxhc20vYXJjaHJhbmRvbS5oPgo+PiArCj4+ICsvKgo+PiArICogQXNtIGdvdG8gaXMg
bmVlZGVkIHNvIHRoYXQgdGhlIGNvbXBpbGVyIGRvZXMgbm90IHJlbW92ZSB0aGUgbGFiZWwuCj4+
ICsgKi8KPj4gKwo+PiArI2RlZmluZSBjc3JfZ290b19zd2FwKGNzciwgdmFsKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyh7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgX192OyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18gZ290
bygiY3NycncgJTAsICIgX19BU01fU1RSKGNzcikgIiwgJTEiICAgIFwKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDogIj1yIiAoX192KSA6ICJySyIgKCYmdmFsKSAgICAgICAg
ICAgXAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAibWVtb3J5IiA6IHZh
bCk7ICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAgICAgX192OyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gK30pCj4+ICsK
Pj4gKy8qCj4+ICsgKiBEZWNsYXJlIHRoZSBmdW5jdGlvbnMgdGhhdCBhcmUgZXhwb3J0ZWQgKGJ1
dCBwcmVmaXhlZCkgaGVyZSBzbyB0aGF0IExMVk0KPj4gKyAqIGRvZXMgbm90IGNvbXBsYWluIGl0
IGxhY2tzIHRoZSAnc3RhdGljJyBrZXl3b3JkICh3aGljaCwgaWYgYWRkZWQsIG1ha2VzCj4+ICsg
KiBMTFZNIGNvbXBsYWluIGJlY2F1c2UgdGhlIGZ1bmN0aW9uIGlzIGFjdHVhbGx5IHVudXNlZCBp
biB0aGlzIGZpbGUpLgo+PiArICovCj4+ICsKPj4gK3U2NCBnZXRfa2FzbHJfc2VlZF96a3Iodm9p
ZCk7Cj4+ICsKPj4gKy8qCj4+ICsgKiBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBieSBzZXR1cF92
bSB0byBjaGVjayBpZiB0aGUga2VybmVsIGhhcyB0aGUgWktSLgo+PiArICogVHJhcHMgaGF2ZW4n
dCBiZWVuIHNldCB1cCB5ZXQsIGJ1dCBzYXZlIGFuZCByZXN0b3JlIHRoZSBUVkVDIHRvIGF2b2lk
Cj4+ICsgKiBhbnkgc2lkZSBlZmZlY3RzLgo+PiArICovCj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCBfX211c3RfY2hlY2sgcmlzY3ZfaGFzX3prcih2b2lkKQo+PiArewo+PiArICAgICAgIHVu
c2lnbmVkIGxvbmcgdHZlYzsKPj4gKwo+PiArICAgICAgIHR2ZWMgPSBjc3JfZ290b19zd2FwKENT
Ul9UVkVDLCBub3RfemtyKTsKPj4gKyAgICAgICBjc3Jfc3dhcChDU1JfU0VFRCwgMCk7Cj4+ICsg
ICAgICAgY3NyX3dyaXRlKENTUl9UVkVDLCB0dmVjKTsKPj4gKyAgICAgICByZXR1cm4gdHJ1ZTsK
Pj4gK25vdF96a3I6Cj4+ICsgICAgICAgY3NyX3dyaXRlKENTUl9UVkVDLCB0dmVjKTsKPj4gKyAg
ICAgICByZXR1cm4gZmFsc2U7Cj4+ICt9Cj4+ICsKPj4gK3U2NCBnZXRfa2FzbHJfc2VlZF96a3Io
dm9pZCkKPj4gK3sKPj4gKyAgICAgICBjb25zdCBpbnQgbmVlZGVkX3NlZWRzID0gc2l6ZW9mKHU2
NCkgLyBzaXplb2YobG9uZyk7Cj4+ICsgICAgICAgaW50IGkgPSAwOwo+PiArICAgICAgIHU2NCBz
ZWVkID0gMDsKPj4gKyAgICAgICBsb25nICplbnRyb3B5ID0gKGxvbmcgKikoJnNlZWQpOwo+PiAr
Cj4+ICsgICAgICAgaWYgKCFyaXNjdl9oYXNfemtyKCkpCj4+ICsgICAgICAgICAgICAgICByZXR1
cm4gMDsKPj4gKwo+PiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBuZWVkZWRfc2VlZHM7IGkrKykg
ewo+PiArICAgICAgICAgICAgICAgaWYgKCFjc3Jfc2VlZF9sb25nKCZlbnRyb3B5W2ldKSkKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4+ICsgICAgICAgfQo+PiArCj4+ICsg
ICAgICAgcmV0dXJuIHNlZWQ7Cj4+ICt9Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2lu
aXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+IGluZGV4IDk5NDAxNzFjNzlmMC4uOGVmMWVk
ZDJjZGRkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+PiArKysgYi9hcmNo
L3Jpc2N2L21tL2luaXQuYwo+PiBAQCAtMTAyNSw2ICsxMDI1LDcgQEAgc3RhdGljIHZvaWQgX19p
bml0IHB0X29wc19zZXRfbGF0ZSh2b2lkKQo+PiAgICNpZmRlZiBDT05GSUdfUkFORE9NSVpFX0JB
U0UKPj4gICBleHRlcm4gYm9vbCBfX2luaXQgX19waV9zZXRfbm9rYXNscl9mcm9tX2NtZGxpbmUo
dWludHB0cl90IGR0Yl9wYSk7Cj4+ICAgZXh0ZXJuIHU2NCBfX2luaXQgX19waV9nZXRfa2FzbHJf
c2VlZCh1aW50cHRyX3QgZHRiX3BhKTsKPj4gK2V4dGVybiB1NjQgX19pbml0IF9fcGlfZ2V0X2th
c2xyX3NlZWRfemtyKHZvaWQpOwo+Pgo+PiAgIHN0YXRpYyBpbnQgX19pbml0IHByaW50X25va2Fz
bHIoY2hhciAqcCkKPj4gICB7Cj4+IEBAIC0xMDQ5LDYgKzEwNTAsOCBAQCBhc21saW5rYWdlIHZv
aWQgX19pbml0IHNldHVwX3ZtKHVpbnRwdHJfdCBkdGJfcGEpCj4+ICAgICAgICAgICAgICAgICAg
dTMyIGtlcm5lbF9zaXplID0gKHVpbnRwdHJfdCkoJl9lbmQpIC0gKHVpbnRwdHJfdCkoJl9zdGFy
dCk7Cj4+ICAgICAgICAgICAgICAgICAgdTMyIG5yX3BvczsKPj4KPj4gKyAgICAgICAgICAgICAg
IGlmIChrYXNscl9zZWVkID09IDApCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGthc2xyX3Nl
ZWQgPSBfX3BpX2dldF9rYXNscl9zZWVkX3prcigpOwo+IAo+IENvdWxkIHlvdSBlbGFib3JhdGUg
b24gd2h5IHdlIHRyeSB0byBnZXQgdGhlIHNlZWQgZnJvbSBEVCBmaXJzdCwKPiByYXRoZXIgdGhh
biBmcm9tIFpLUj8gCgpUaGUgb3JkZXJpbmcgcHJlZmVyZW5jZSBkb2Vzbid0IG1hdHRlciB0byBt
dWNoLApidXQgbXkgdGhvdWdodCB3YXMgaWYgc29tZW9uZSB3YW50ZWQgdG8gc2V0IGEgc2VlZCB0
aGV5IGNvdWxkIG92ZXJyaWRlCnRoZSBaa3IgcHJvdmlkZWQgc2VlZC4gQWxleGFuZHJlIHNhaWQg
cHJpdmF0ZWx5IHRvIHVzZSB0aGUgRFQgYXMgYQpmYWxsYmFjayByYXRoZXIgdGhhbiB0aGUgd2F5
IHdlIGhhdmUgaXQgbm93LgoKPiBBbHNvLCBJIHdhcyB3b25kZXJpbmcgaWYsIGJ5IGFueSBjaGFu
Y2UsIGl0IGNhbgo+IGxldmVyYWdlIGFyY2hfZ2V0X3JhbmRvbV9zZWVkX2xvbmdzKCkgdG8gZ2V0
IHRoZSBzZWVkIGluc3RlYWQgb2YKPiBfX3BpX2dldF9rYXNsZXJfc2VlZF96a3IoKT8gVGhhbmtz
CgoKYXJjaF9nZXRfcmFuZG9tX3NlZWRfbG9uZ3MoKSBpcyBhbG1vc3QgZXF1aXZhbGVudCB0bwpf
X3BpX2dldF9rYXNsZXJfc2VlZF96a3IoKQppbiB0aGUgc2Vuc2UgdGhleSBkbyB0aGV5IHdpbGwg
Ym90aCB1c2UgWmtyIGZvciBlbnRyb3B5CmlmIGl0cyBhY2Nlc3NpYmxlLgoKVGhlIHByb2JsZW0g
aXMgdGhhdCB3ZSBhcmUgdmVyeSBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzIHNvIHRoZSBjaGVj
ayAKYXJjaF9nZXRfcmFuZG9tX3NlZWRfbG9uZ3MgdXNlcyB0byBkZXRlY3QgaWYgWmtyIGlzIHBy
ZXNlbnQgCihfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKSBpcyBub3Qgc2V0IHVwIHll
dC4gVGhpcyBpcyB3aHkgCnJpc2N2X2hhc196a3IgaXMgdXNlZCB0byBjaGVjayBpZiBaa3IgaXMg
cHJlc2VudC4gVW5mb3J0dW5hdGVseSwgd2hpY2ggSSAKZGlkbid0IHJlYWxpemUgaXMgdGhhdCBo
b3cgcmlzY3ZfaGFzX3prciB3b3JrcyBpc24ndCBhIHZhbGlkIHdheSB0byAKY2hlY2sgaWYgWmty
IGlzIHByZXNlbnQuCgpUaGUgb25seSBzb2x1dGlvbiBzZWVtcyB0byBiZSBwYXJzaW5nIHRoZSBJ
U0Egc3RyaW5nIGZyb20gRFQgYW5kIEFDUEkuClRoZSBoYXJkIHBhcnQgaXMgcGFyc2luZyBBQ1BJ
IHRoaXMgZWFybHkgaW4gYm9vdC4KClRoYW5rcywKSmVzc2UgVGF1YmUKCj4gCj4+ICAgICAgICAg
ICAgICAgICAgLyoKPj4gICAgICAgICAgICAgICAgICAgKiBDb21wdXRlIHRoZSBudW1iZXIgb2Yg
cG9zaXRpb25zIGF2YWlsYWJsZTogd2UgYXJlIGxpbWl0ZWQKPj4gICAgICAgICAgICAgICAgICAg
KiBieSB0aGUgZWFybHkgcGFnZSB0YWJsZSB0aGF0IG9ubHkgaGFzIG9uZSBQVUQgYW5kIHdlIG11
c3QKPj4gLS0KPj4gMi40My4wCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
