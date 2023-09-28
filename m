Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5625CE7B09
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 07:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKptj9AtRfPCXrjv3cfP1hTAg7em4Tq9M/ZIpEgW/Ps=; b=MGZE140jrEPXnW
	EvJ1qTPLchSIH+MsAi8K7JxoRdqAt8t+5HHMXLE7nsgATJ6QUz68y4M7ORUhOVUNEYSRHXFK4nKYD
	o2mv8J7SGmYd+guCpOAlWG8Vx9JP+x8CZWCZrF1cowc267xKQkVA0YAjDsuOVwvzBu/LjqNyFXE8f
	E6mIZQYJnHDQDiYaHytUF//t9NZAnlMfLGLyfUWdyClENlyQ12fYJ55oulAGoSehgaJvegKQ1djGl
	gWF2JjoxXZF9+oBsYfe6gvA6TD/Bv8jmDSnsqlU8DJLZ9fqhrrvQ1LoihSKaSLdE0l9fkK2HQO/1l
	PC0wmLM2kM4oK7HQuBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlllr-002Yjf-0u;
	Thu, 28 Sep 2023 07:49:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qllll-002YiR-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 07:49:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405d70d19bcso14419585e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695887347; x=1696492147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bs5ot7FeCsBm13VIPZe46Wdlh4ukmrcJmP2lb7/PRVE=;
        b=wDptKVLqfhT7XRFyQzsqw7ZCcTGGV2gWv1vn/CtdFmzfKt2yc5ZJw6ft0jOw/uFvMg
         HY/1uDL5zXGpxfin2lyM2eT9Lej2x5cdvpJwNJAzURR9PPnENdxLjH3BzCI/U1fW2nsf
         G86pwVUWxUNuvZiznnJEcl1Z6bHIFDejtG0I2qu95AEt5uUGu+YdL51n+ILB71kL5Fyv
         viovOfK1YPLTznKPZ/lNkxZd6mEMY4oSGLPZo7Wr1/K2M3lfY5dSZsAjtsunIFoCVK6R
         sJ//JWN88PUBfZYDPdV2dZ08Cbi7U11DmcodSLbB1zkxACxyINTSAKZhw62Gqv5zsJ+p
         AVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695887347; x=1696492147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs5ot7FeCsBm13VIPZe46Wdlh4ukmrcJmP2lb7/PRVE=;
        b=UFlRxCHTInoMUuPFDcTpQmQcJeoHxE0mHIGc1bUb/jbDucoDp4Q3lB/J6JIVBicOC+
         9183BK5AKBbV22JtA4piFMDHyF1C3SPLdGLUfM1C++wq0tBSe6OuMUElViVJl4LQGbij
         xozquynULupASCDjUQ03HwcYggglM01vztvIMmui8CbqVUg5WiDiwG8VtHjli97N5xnq
         LxY/Qa//z4clbXyOQYwQgSTimELXQ2vJQ696YRpqLRcCDDHLGPHNoNYen9Qslr/dDOVz
         fTaaznvwSeRvRNE/leZ5SbfM2zPiLW9jtdImLd4q7+CVk6PWGtYOqaWmmxGV9UKoJ+D1
         PyTA==
X-Gm-Message-State: AOJu0Yz/LjZt+V+UvDhyaakVWgmKzpzNpupt/6VQgosiHRs/FEs7W85F
	aW0BwhNHbbr9qVLrF/HzRVRkgg==
X-Google-Smtp-Source: AGHT+IEwNFAmjNW91EMUnvbAC7XSuWTt0XxQR7RBhnV/RK6Ucnhre0DyD88YoIFJ+heFaendSSHICA==
X-Received: by 2002:a05:600c:3b88:b0:405:1ba2:4fcf with SMTP id n8-20020a05600c3b8800b004051ba24fcfmr455146wms.4.1695887346703;
        Thu, 28 Sep 2023 00:49:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:866e:3285:a245:a33f? ([2a01:e0a:999:a3a0:866e:3285:a245:a33f])
        by smtp.gmail.com with ESMTPSA id z4-20020a1c4c04000000b004063ee0b10esm4923477wmf.46.2023.09.28.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 00:49:06 -0700 (PDT)
Message-ID: <10997d30-e6b7-4a24-a43e-e22679e8d450@rivosinc.com>
Date: Thu, 28 Sep 2023 09:49:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
Content-Language: en-US
To: Evan Green <evan@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Topel?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ron Minnich <rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
 <CALs-Hss+OK-vJy_ZKjVbGh7rTBZA+GditWcdM1XjDDskGF76Dw@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-Hss+OK-vJy_ZKjVbGh7rTBZA+GditWcdM1XjDDskGF76Dw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_004909_804679_C604153F 
X-CRM114-Status: GOOD (  19.51  )
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

CgpPbiAyNi8wOS8yMDIzIDIzOjQzLCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDI2
LCAyMDIzIGF0IDg6MDPigK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
IHdyb3RlOgo+Pgo+PiBTaW5jZSBjb21taXQgNjFjYWRiOSAoIlByb3ZpZGUgbmV3IGRlc2NyaXB0
aW9uIG9mIG1pc2FsaWduZWQgbG9hZC9zdG9yZQo+PiBiZWhhdmlvciBjb21wYXRpYmxlIHdpdGgg
cHJpdmlsZWdlZCBhcmNoaXRlY3R1cmUuIikgaW4gdGhlIFJJU0MtViBJU0EKPj4gbWFudWFsLCBp
dCBpcyBzdGF0ZWQgdGhhdCBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgbWlnaHQgbm90IGJlIHN1cHBv
cnRlZC4KPj4gSG93ZXZlciwgdGhlIFJJU0MtViBrZXJuZWwgdUFCSSBkZXNjcmliZXMgdGhhdCBt
aXNhbGlnbmVkIGFjY2Vzc2VzIGFyZQo+PiBzdXBwb3J0ZWQuIEluIG9yZGVyIHRvIHN1cHBvcnQg
dGhhdCwgdGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBTLW1vZGUKPj4gaGFuZGxpbmcgb2Yg
bWlzYWxpZ25lZCBhY2Nlc3NlcyBhcyB3ZWxsIHN1cHBvcnQgZm9yIHByY3RsKFBSX1VOQUxJR04p
Lgo+Pgo+PiBIYW5kbGluZyBtaXNhbGlnbmVkIGFjY2VzcyBpbiBrZXJuZWwgYWxsb3dzIGZvciBh
IGZpbmVyIGdyYWluIGNvbnRyb2wKPj4gb2YgdGhlIG1pc2FsaWduZWQgYWNjZXNzZXMgYmVoYXZp
b3IsIGFuZCB0aGFua3MgdG8gdGhlIHByY3RsIGNhbGwsIGNhbgo+PiBhbGxvdyBkaXNhYmxpbmcg
bWlzYWxpZ25lZCBhY2Nlc3MgZW11bGF0aW9uIHRvIGdlbmVyYXRlIFNJR0JVUy4gVXNlcgo+PiBz
cGFjZSBjYW4gdGhlbiBvcHRpbWl6ZSBpdHMgc29mdHdhcmUgYnkgcmVtb3Zpbmcgc3VjaCBhY2Nl
c3MgYmFzZWQgb24KPj4gU0lHQlVTIGdlbmVyYXRpb24uCj4+Cj4+IEN1cnJlbnRseSwgdGhpcyBz
ZXJpZXMgaXMgdXNlZnVsIGZvciBwZW9wbGUgdGhhdCB1c2VzIGEgU0JJIHRoYXQgZG9lcwo+PiBu
b3QgaGFuZGxlZCBtaXNhbGlnbmVkIHRyYXBzLiBJbiBhIG5lYXIgZnV0dXJlLCB0aGlzIHNlcmll
cyB3aWxsIG1ha2UKPj4gdXNlIGEgU0JJIGV4dGVuc2lvbiBbMV0gYWxsb3dpbmcgdG8gcmVxdWVz
dCBkZWxlZ2F0aW9uIG9mIHRoZQo+PiBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgdHJhcHMgdG8gdGhl
IFMtbW9kZSBzb2Z0d2FyZS4gVGhpcyBleHRlbnNpb24gaGFzCj4+IGJlZW4gc3VibWl0dGVkIGZv
ciByZXZpZXcgdG8gdGhlIHJpc2N2IHRlY2gtcHJzIGdyb3VwLiBBbiBPcGVuU0JJCj4+IGltcGxl
bWVudGF0aW9uIGZvciB0aGlzIHNwZWMgaXMgYXZhaWxhYmxlIGF0IFsyXS4KPiAKPiBGb3IgbXkg
b3duIGVkdWNhdGlvbiwgaG93IGRvZXMgdGhlIG5ldyBTQkkgY2FsbCBiZWhhdmUgd2l0aCByZXNw
ZWN0IHRvCj4gbXVsdGlwbGUgaGFydHM/IERvZXMgYSBjYWxsIHRvIGNoYW5nZSBhIGZlYXR1cmUg
cGVyZm9ybSB0aGF0IGNoYW5nZQo+IGFjcm9zcyBhbGwgaGFydHMsIG9yIGp1c3QgdGhlIGhhcnQg
dGhlIFNCSSBjYWxsIHdhcyBtYWRlIG9uPyBJZiB0aGUKPiBhbnN3ZXIgaXMgImFsbCBoYXJ0cyIs
IHdoYXQgaWYgbm90IGFsbCBoYXJ0cyBhcmUgZXhhY3RseSB0aGUgc2FtZSwgYW5kCj4gc29tZSBj
YW4gZW5hYmxlIHRoZSBmZWF0dXJlIHN3aXRjaCB3aGlsZSBvdGhlcnMgY2Fubm90PyBBbHNvIGlm
IHRoZQo+IGFuc3dlciBpcyAiYWxsIGhhcnRzIiwgZG9lcyBpdCBhbHNvIGFwcGx5IHRvIGhvdHBs
dWdnZWQgY3B1cywgd2hpY2gKPiBtYXkgbm90IGhhdmUgZXZlbiBleGlzdGVkIGF0IGJvb3QgdGlt
ZT8KCkRlcGVuZGluZyBvbiB0aGUgZmVhdHVyZSwgdGhleSBjYW4gYmUgZWl0aGVyIGdsb2JhbCAo
YWxsIGhhcnRzKSBvcgpsb2NhbCAoY2FsbGluZyBoYXJ0KS4gVGhlIG1lZGVsZWcgcmVnaXN0ZXIg
aXMgcGVyIGhhcnQgYW5kIHRodXMKbWlzYWxpZ25lZCBsb2FkL3N0b3JlIGRlbGVnYXRpb24gZm9y
IFMtbW9kZSBpcyBhbHNvIHBlciBoYXJ0LgoKCj4gCj4gV2hhdCBoYXBwZW5zIGlmIGEgaGFydCBn
b2VzIHRocm91Z2ggYSBjb250ZXh0IGxvc3MgZXZlbnQsIGxpa2UKPiBzdXNwZW5kL3Jlc3VtZT8g
SXMgdGhlIHNldHRpbmcgZXhwZWN0ZWQgdG8gYmUgc3RpY2t5LCBvciBpcyB0aGUga2VybmVsCj4g
ZXhwZWN0ZWQgdG8gcmVwbGF5IHRoZXNlIGNhbGxzPwoKVGhhdCBpcyBhIGdvb2QgcXVlc3Rpb24g
dGhhdCB3ZSBkaWQgbm90IGFjdHVhbGx5IGNsYXJpZmllZCB5ZXQuIFRoYW5rcwpmb3IgcmFpc2lu
ZyBpdCAhCgpDbMOpbWVudAoKPiAKPiAtRXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
