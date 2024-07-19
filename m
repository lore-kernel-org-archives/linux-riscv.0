Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34215C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHY11cI3qSrexvFyDqRUBjI8i5+rZ97YFa/ZlFwVrWg=; b=O9bXGxOYT4hsAE
	kxSb8+caYM/gnLp1ABv8uMqHCk0SX2o/LVxlLC48heRBP7vzHn7TpDnv7C4QkbSZUjpGiHpPfMDUV
	/OXPH7Wib5J82tum+MWxfwVPsEHZsvjX3js+2JmT8VVr/698+4nEhfpqmrylteyYKS7O/WzNbMyJv
	vpRexFSlimMrOmznEkGANnvgJAdbtbYma41trRgYRGWvUxQktcpj5l35Wv+/wgJgjekcD20+nNax7
	zv09clu/k2HqcHto/7gFqF8MwETQ755VUi3zOE5FQWR3k3oB3msX7X+anve7iFEba8fjY3o98Rjz+
	LxD0a9sDmnaXpGh/srag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUj4H-000000025gg-3vZ6;
	Fri, 19 Jul 2024 08:34:22 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUj4D-000000025fx-2rRc
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 08:34:19 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-25e80d68776so209499fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721378055; x=1721982855; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uj8DPqacGp8Z6VQ5rbqUkDNKZNPVfZO2R9kXSBhDfC8=;
        b=iiLVESAkQv/7whpf4Jvikjfu7bZ3bNfnRNr10whHiYecS4n0rW6+QcppdHg2bhKP0Q
         sYGV4fdadKRC4iMLzleqeAMN96wZlHXD2OIy1SRL/Y3M/f72mOpNtB8DtbxPVppH9gUN
         9u8WLjLDCU11PUDkrt+U+TZT7nbvNgsDifgXGMfeKULgcj49rriKenX2J0L7n8wF8Vu6
         rlpDuLVp5kiURtgCfxDVZCgIvuOuXjdvXiYNskmX5pn3ixqXbGCE3jszFBr1zXvAoxuY
         86wImeq8tstP+GmDKSfM9vacJNOMOHrdrhdhW5pP6+FjwiYpG2bkWCzvQHscS7qDVF90
         QrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721378055; x=1721982855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uj8DPqacGp8Z6VQ5rbqUkDNKZNPVfZO2R9kXSBhDfC8=;
        b=jwts4pTbnC6q5xYZyk5WyKDnzQOmsuK+k8YcGT0xXcFRlGheCOUK9Hza8gqvJeQkL1
         cSdJWjrbk4K7JKWzwg4zqZIcVVUEqTU9Ox8oAiqrSuqQrIlJ8XdFnz1VlwbFih9ZEekz
         aFvwEm1TLdLjMwmCBCvUo1ldwjWMCSPB0cFi+57xIlM9jWKFU2bScPhZqo85L7nwpSZV
         eZwDbX6GKSTJWZQjfawx1jfxTBGEjJ7mxV6gAIldf4msB4VV04a9OyaGng3+GRA/VaEJ
         +rOe3taNY7n7r/ui6+A7k0XTUlCV/Kj0sFP3KSkvXOEXvVPxvZLWVjkk0SatTok78NUB
         +gKA==
X-Forwarded-Encrypted: i=1; AJvYcCWMNnzqbxoBwuliuomnlZmmFlyFahEMHYHmmm0/1XuAxDpu/6q1Ly0QFw4zyKDQSb0JJl70lFbEeJah8kRYODi15oedu+O+4XlTCDGv6ebe
X-Gm-Message-State: AOJu0Yzw7OCdc+mjNLNGniK/J94ZiwC6r6MtSmFLQTNXzF9LZC0em6GF
	fuanbsAnPJsTiQ/FbP8jCptYr0k5S4XXXkv9oEG2y+mjU2fvkmdH1FfAYFV4W5Q=
X-Google-Smtp-Source: AGHT+IHgs5SdgJKYH+XZOn5uo/Fn1KOkFeiRW2axi78s+XuzXemiQ1sOMQsLxA12M+vHlJi5t/4dQQ==
X-Received: by 2002:a05:6358:2781:b0:1ac:a26c:a5e8 with SMTP id e5c5f4694b2df-1acb9e782e0mr117203555d.4.1721378055351;
        Fri, 19 Jul 2024 01:34:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79db9fc40f7sm633678a12.85.2024.07.19.01.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 01:34:14 -0700 (PDT)
Message-ID: <5923b26c-d73e-4b20-8431-fbc091bdb58a@rivosinc.com>
Date: Fri, 19 Jul 2024 10:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: cpufeature: Do not drop Linux-internal
 extensions
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
References: <20240718213011.2600150-1-samuel.holland@sifive.com>
 <20240718-a5097a4070f457529d2fff91@orel>
 <a36e07a1-f4da-4d6f-9e68-929b77b70836@rivosinc.com>
 <20240719-deity-squander-e17b4dfed649@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240719-deity-squander-e17b4dfed649@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_013418_135572_0F0A0C18 
X-CRM114-Status: GOOD (  12.01  )
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

CgpPbiAxOS8wNy8yMDI0IDEwOjI1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gRnJpLCBKdWwg
MTksIDIwMjQgYXQgMDk6MTE6MjBBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxOC8wNy8yMDI0IDIzOjU3LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBUaHUs
IEp1bCAxOCwgMjAyNCBhdCAwMjoyOTo1OVBNIEdNVCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+
Pj4gVGhlIExpbnV4LWludGVybmFsIFhsaW51eGVudmNmZyBJU0EgZXh0ZW5zaW9uIGlzIG9taXR0
ZWQgZnJvbSB0aGUKPj4+PiByaXNjdl9pc2FfZXh0IGFycmF5IGJlY2F1c2UgaXQgaGFzIG5vIERU
IGJpbmRpbmcgYW5kIHNob3VsZCBub3QgYXBwZWFyCj4+Pj4gaW4gL3Byb2MvY3B1aW5mby4gVGhl
IGxvZ2ljIGFkZGVkIGluIGNvbW1pdCA2MjUwMzRhYmQ1MmEgKCJyaXNjdjogYWRkCj4+Pj4gSVNB
IGV4dGVuc2lvbnMgdmFsaWRhdGlvbiBjYWxsYmFjayIpIGFzc3VtZXMgYWxsIGV4dGVuc2lvbnMg
YXJlIGluY2x1ZGVkCj4+Pj4gaW4gcmlzY3ZfaXNhX2V4dCwgYW5kIHNvIHJpc2N2X3Jlc29sdmVf
aXNhKCkgd3JvbmdseSBkcm9wcyBYbGludXhlbnZjZmcKPj4+PiBmcm9tIHRoZSBmaW5hbCBJU0Eg
c3RyaW5nLiBJbnN0ZWFkLCBhY2NlcHQgc3VjaCBMaW51eC1pbnRlcm5hbCBJU0EKPj4+PiBleHRl
bnNpb25zIGFzIGlmIHRoZXkgaGF2ZSBubyB2YWxpZGF0aW9uIGNhbGxiYWNrLgo+Pj4KPj4+IFRo
aXMgYXNzdW1lcyB3ZSdsbCBuZXZlciBuZWVkIGEgdmFsaWRhdGlvbiBjYWxsYmFjayBmb3IgYSBM
aW51eC1pbnRlcm5hbAo+Pj4gSVNBIGV4dGVuc2lvbi4gV2UgY2FuIG1ha2UgdGhhdCBhc3N1bXB0
aW9uIG5vdyBhbmQgY2hhbmdlIG91ciBtaW5kCj4+PiBsYXRlciwgYnV0IHdlIGNvdWxkIGFsc28g
YWRkIFhsaW51eGVudmNmZyB0byByaXNjdl9pc2FfZXh0IG5vdyBhbmQKPj4+IG1vZGlmeSB0aGUg
cGxhY2VzIHdoZXJlIGl0IG1hdHRlcnMgKGp1c3QgcHJpbnRfaXNhPykuIElmIHdlIGFkZAo+Pj4g
WGxpbnV4ZW52Y2ZnIHRvIHRoZSBhcnJheSB3aXRoIGEgTlVMTCBuYW1lIHRoZW4gd2UgY291bGQg
ZG8gc29tZXRoaW5nCj4+PiBsaWtlCj4+Pgo+Pj4gIHByaW50X2lzYSgpCj4+PiAgewo+Pj4gICAg
IGZvciAoLi4uKSB7Cj4+PiAgICAgICAgIC4uLgo+Pj4gICAgICAgICBpZiAoIXJpc2N2X2lzYV9l
eHRbaV0ubmFtZSkKPj4+IAkgICBjb250aW51ZTsKPj4+ICAgICB9Cj4+PiAgfQo+Pgo+PiBJIHdv
dWxkIHJhdGhlciBhZGQgaXQgdG8gdGhlIHJpc2N2X2lzYV9leHRbXSBhcnJheSBhbmQgYXZvaWQg
aGFuZGxpbmcgaXQKPj4gZGlmZmVyZW50bHkuIFRoZXJlIGlzIGFscmVhZHkgdGhlIHhhbmRlc3Bt
dSBleHRlbnNpb24gaW4gdGhpcyBhcnJheSBzbwo+PiB4bGludXhlbnZjZmcgY2FuIGJlIGFkZGVk
IGFzIHdlbGwuCj4gCj4geGFuZGVzcG11IGFuZCB4bGludXhlbnZjZmcgYXJlIGZ1bmRhbWVudGFs
bHkgZGlmZmVyZW50LCB0aGUgZm9ybWVyIGlzCj4gcGFyc2VkIGZyb20gZGV2aWNldHJlZSBhbmQg
aXMgYSByZWFsIGV4dGVuc2lvbi4geGxpbnV4ZW5nY2ZnIGlzIGFuCj4gaW50ZXJuYWwgZmxhZy4g
SSBkb24ndCB0aGluayB3ZSBzaG91bGQgYmUgcHJpbnRpbmcgaXQuCgpTb3JyeSwgSSBkaWQgbm90
IG1lYW50IGl0IHdhcyB0byBiZSBkaXNwbGF5ZWQuIE9ubHkgYWRkZWQgdG8KcmlzY3ZfaXNhX2V4
dFtdIGFzIHBvaW50ZWQgb3V0IGJ5IEFuZHJldy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
