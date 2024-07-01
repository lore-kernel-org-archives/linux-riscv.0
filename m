Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFFAC3065A
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 07:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDwt7crO05VGCB53NsaXkD1azAlDAuQ6Sby9LfzRojA=; b=jkCJK9HYvEkvKp
	6gD5w9hbVvoQgHR4DX+LXCC6hKF+NEub14xVyVT5UmIWuIWbNmBekdBttKQlfBPKgd+NvDzTFozM6
	kUEB9MVAxQ8wtZNa7H9TGFzOeQyuZn4qs357RSTN4lUUzQg5TpGYcEhfC/b5r+6+QGqnm+rWam7zE
	q4ho/OGug7YG8aAedAk+OaACixWBCFjlxRuLq7R73VONxAkQAmWm+ArpwyIXCYtUOwh8t/V6iXpgM
	EKuaGpBRS+Mvcgzp2w774OOXToZ0Yb7/cPUJEBxqXFTHloxDgcpDDAjklwwG4GqZtZbX7ZOHCMSXe
	DN0twct89del3Ca7wU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBFw-00000001zl3-3VFI;
	Mon, 01 Jul 2024 07:15:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBFr-00000001zgq-2dz5
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 07:15:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4212b102935so2171775e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 00:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719818113; x=1720422913; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VeQ0WXLl07NKq9f5p8mUnjZiEvy2m2C1+1ufISTpL0=;
        b=vaBdsri7QSPQH4+/IDmNRo6M+l9u5wy/ucz2vJklN3OxBVgBZhs4AW++munxRTKd2q
         7akWYyk7yV5xe2WdRwFIvKvJ5QBe1RU5ZHRN5zxgjRkPWrshFV9U1NqCeFWKp/9OMWGd
         pPTo1eaA5uYJ7rK10CzLzuQ+1Jk0ipY+/Ful+elLNpDfsxwOU3++iUoBDRvANEZ9WCF0
         DJJFBITuBF/oFK9sZDyQcRmiJ9XER4UFBHU7vfdUUJUOU4e1XFiSelTT6Z+If4RtlKMM
         0FSpxifkHj9Tz4H2GAVq2osq3ukDf+bdtpian8Y0PXg9RdVIEHwRg2YmQ7qz7L/3fz2E
         kFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719818113; x=1720422913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VeQ0WXLl07NKq9f5p8mUnjZiEvy2m2C1+1ufISTpL0=;
        b=r1UGwBGaeAJtdgTl/33xYOmAsIaASlpRWZxQBfNppsJSttPKSOW/DRxdV4dovoLf1J
         5IJIX6wZ79Udlc8+1e17KTVyS7F6CqCEgYsfU2qAsCVFoVXExvajo7PGA1sm8wu8zFcd
         jhgO+JKs/r4cWJ4Pu7RM+wiuLAfIKqxSChNDVivhNQ/4+MnXMuYmZBvZ8jgElDfS/oWl
         2JvnKll3ksSlbSVEf51rxBR6vXLbG1BFGaHuDrF3Hs62CGAtslIH6JMoP6e4vWQ21FLb
         UOGXTpnKsCZ87LXY6So33cFNa7TP2QG79teFV9ud4iEGURNvCG952w6bV01UFh9AH/s2
         tYIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUUBhucxoz4IKOg7MXh+6St+jVi2BAXuW1sKmA8bqLhX20cesUTlJUFvyp5gh44+kJJmJHiwC3T7xsSa790AI3GXIt+MUdLT2bP3Cb9j7c
X-Gm-Message-State: AOJu0YydgbNIdTft8WcnzgnwAxlOHS4SIBxlpaMuQAu5qYJ9CZr0H72G
	cGoVhkqKirkT0ef/tvqUA1nk/mwAT3MrAkl+8yiizD/cWpqIl+uvVzt29Y898Kg=
X-Google-Smtp-Source: AGHT+IHZQaXlqpMGgKtZhm65KqVJc9Mgo9OwA0jLJuAG0EVNKbRgsOyXl69tB7SHa+Zq4VyZ50I3kQ==
X-Received: by 2002:a05:600c:3ba6:b0:425:6742:9942 with SMTP id 5b1f17b1804b1-4257a0405c5mr34411435e9.2.1719818113559;
        Mon, 01 Jul 2024 00:15:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af55e61sm138652275e9.20.2024.07.01.00.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 00:15:12 -0700 (PDT)
Message-ID: <43941f48-9905-4b25-89ef-6ad75bf1a123@rivosinc.com>
Date: Mon, 1 Jul 2024 09:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] RISC-V: Check Zicclsm to set unaligned access
 speed
To: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
 Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-5-jesse@rivosinc.com>
 <20240626-march-abreast-83414e844250@spud> <Zn3XrLRl/yazsoZe@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Zn3XrLRl/yazsoZe@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_001515_942161_67E92BDF 
X-CRM114-Status: GOOD (  22.91  )
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

CgpPbiAyNy8wNi8yMDI0IDIzOjIwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gV2VkLCBK
dW4gMjYsIDIwMjQgYXQgMDM6Mzk6MTRQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiBP
biBNb24sIEp1biAyNCwgMjAyNCBhdCAwODo0OTo1N1BNIC0wNDAwLCBKZXNzZSBUYXViZSB3cm90
ZToKPj4+IENoZWNrIGZvciBaaWNjbHNtIGJlZm9yZSBjaGVja2luZyBmb3IgdW5hbGlnbmVkIGFj
Y2VzcyBzcGVlZC4gVGhpcyB3aWxsCj4+PiBncmVhdGx5IHJlZHVjZSB0aGUgYm9vdCB1cCB0aW1l
IGFzIGZpbmRpbmcgdGhlIGFjY2VzcyBzcGVlZCBpcyBubyBsb25nZXIKPj4+IG5lY2Vzc2FyeS4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+
Pj4gLS0tCj4+PiBWMiAtPiBWMzoKPj4+ICAtIE5ldyBwYXRjaCBzcGxpdCBmcm9tIHByZXZpb3Vz
IHBhdGNoCj4+PiAtLS0KPj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3Nw
ZWVkLmMgfCAyNiArKysrKysrKysrKysrKy0tLS0tLS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYwo+Pj4gaW5kZXggYTlhNmJjYjAyYWNmLi4zMjlmZDI4
OWI1YzggMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNz
X3NwZWVkLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3Bl
ZWQuYwo+Pj4gQEAgLTI1OSwyMyArMjU5LDMxIEBAIHN0YXRpYyBpbnQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19zcGVlZF9hbGxfY3B1cyh2b2lkKQo+Pj4gIAlrZnJlZShidWZzKTsKPj4+ICAJcmV0
dXJuIDA7Cj4+PiAgfQo+Pj4gKyNlbHNlIC8qIENPTkZJR19SSVNDVl9QUk9CRV9VTkFMSUdORURf
QUNDRVNTICovCj4+PiArc3RhdGljIGludCBjaGVja191bmFsaWduZWRfYWNjZXNzX3NwZWVkX2Fs
bF9jcHVzKHZvaWQpCj4+PiArewo+Pj4gKwlyZXR1cm4gMDsKPj4+ICt9Cj4+PiArI2VuZGlmCj4+
PiAgCj4+PiAgc3RhdGljIGludCBjaGVja191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKHZvaWQp
Cj4+PiAgewo+Pj4gLQlib29sIGFsbF9jcHVzX2VtdWxhdGVkID0gY2hlY2tfdW5hbGlnbmVkX2Fj
Y2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpOwo+Pj4gKwlib29sIGFsbF9jcHVzX2VtdWxhdGVkOwo+
Pj4gKwlpbnQgY3B1Owo+Pj4gKwo+Pj4gKwlpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2Vs
eShSSVNDVl9JU0FfRVhUX1pJQ0NMU00pKSB7Cj4+PiArCQlmb3JfZWFjaF9vbmxpbmVfY3B1KGNw
dSkgewo+Pj4gKwkJCXBlcl9jcHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSkgPSBSSVND
Vl9IV1BST0JFX01JU0FMSUdORURfRkFTVDsKPj4KPj4gLSBjb25zdDogemljY2xzbQo+PiAgIGRl
c2NyaXB0aW9uOgo+PiAgICAgVGhlIHN0YW5kYXJkIFppY2Nsc20gZXh0ZW5zaW9uIGZvciBtaXNh
bGlnbmVkIHN1cHBvcnQgZm9yIGFsbCByZWd1bGFyCj4+ICAgICBsb2FkIGFuZCBzdG9yZSBpbnN0
cnVjdGlvbnMgKGluY2x1ZGluZyBzY2FsYXIgYW5kIHZlY3RvcikgYnV0IG5vdCBBTU9zCj4+ICAg
ICBvciBvdGhlciBzcGVjaWFsaXplZCBmb3JtcyBvZiBtZW1vcnkgYWNjZXNzLiBEZWZpbmVkIGlu
IHRoZQo+PiAgICAgUklTQy1WIFJWQSBQcm9maWxlcyBTcGVjaWZpY2F0aW9uLiAKPj4KPj4gRG9l
c24ndCwgdW5mb3J0dW5hdGVseSwgc2F5IGFueXdoZXJlIHRoZXJlIHRoYXQgdGhleSdyZSBhY3R1
YWxseSBmYXN0IDooCj4gCj4gT2ggbm8hIFRoYXQgaXMgdW5mb3J0dW5hdGUgdGhhdCB0aGUgSVNB
IGRvZXMgbm90IGV4cGxpY2l0bHkgY2FsbCB0aGF0Cj4gb3V0LCBidXQgSSB0aGluayB0aGF0IGFj
Y2VwdGFibGUuCj4gCj4gSWYgYSB2ZW5kb3IgcHV0cyBaaWNjbHNtIGluIHRoZWlyIGlzYSBzdHJp
bmcsIHRoZXkgc2hvdWxkIGV4cGVjdAo+IHNvZnR3YXJlIHRvIHRha2UgYWR2YW50YWdlIG9mIG1p
c2FsaWduZWQgYWNjZXNzZXMuIEZBU1QgaXMgb3VyIHNpZ25hbCB0bwo+IHRlbGwgc29mdHdhcmUg
dGhhdCB0aGV5IHNob3VsZCBlbWl0IG1pc2FsaWduZWQgYWNjZXNzZXMuCgpBRkFJSywgWmljY2xz
bSBpcyBub3QgZXZlbiBhbiBJU0EgZXh0ZW5zaW9uLCBzaW1wbHkgYSBwcm9maWxlCnNwZWNpZmlj
YXRpb24gd2hpY2ggbWVhbnMgdGhhdCBvbmx5IHRoZSBleGVjdXRpb24gZW52aXJvbm1lbnQgd2hp
Y2gKcHJvdmlkZXMgdGhlIHByb2ZpbGUgc3VwcG9ydCBtaXNhbGlnbmVkIGFjY2Vzc2VzIChjZgpo
dHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtcHJvZmlsZXMvbWVzc2FnZS81NikuIEkgZG9u
J3QgdGhpbmsgd2UKY2FuIGV4dHJhcG9sYXRlIHRoYXQgdGhlIG1pc2FsaWduZWQgYWNjZXNzZXMg
d2lsbCBiZSBmYXN0IGF0IGFsbC4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IFRoaXMgYWxsb3dz
IGZvciBhIGdlbmVyaWMga2VybmVsLCBsaWtlIHRoZSBvbmUgYSBkaXN0cm8gd291bGQgY29tcGls
ZSwgdG8KPiBza2lwIHRoZSBwcm9iaW5nIHdoZW4gYm9vdGluZyBvbiBhIHN5c3RlbSB0aGF0IGV4
cGxpY2l0bHkgY2FsbGVkIG91dAo+IHRoYXQgdGhlIGhhcmR3YXJlIHN1cHBvcnRzIG1pc2FsaWdu
ZWQgYWNjZXNzZXMuCj4gCj4gLSBDaGFybGllCj4gCj4+Cj4+IFRoYW5rcywKPj4gQ29ub3IuCj4+
Cj4+PiArCQl9Cj4+PiArCQlyZXR1cm4gMDsKPj4+ICsJfQo+Pj4gKwo+Pj4gKwlhbGxfY3B1c19l
bXVsYXRlZCA9IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKTsKPj4+
ICAKPj4+ICAJaWYgKCFhbGxfY3B1c19lbXVsYXRlZCkKPj4+ICAJCXJldHVybiBjaGVja191bmFs
aWduZWRfYWNjZXNzX3NwZWVkX2FsbF9jcHVzKCk7Cj4+PiAgCj4+PiAgCXJldHVybiAwOwo+Pj4g
IH0KPj4+IC0jZWxzZSAvKiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VTUyAqLwo+
Pj4gLXN0YXRpYyBpbnQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cyh2b2lkKQo+Pj4g
LXsKPj4+IC0JY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cygpOwo+Pj4g
LQo+Pj4gLQlyZXR1cm4gMDsKPj4+IC19Cj4+PiAtI2VuZGlmCj4+PiAgCj4+PiAgYXJjaF9pbml0
Y2FsbChjaGVja191bmFsaWduZWRfYWNjZXNzX2FsbF9jcHVzKTsKPj4+IC0tIAo+Pj4gMi40NS4y
Cj4+Pgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
