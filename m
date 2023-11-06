Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278D6C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 17:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=WjzhaK4sli545wS1SQw3Dseuvhgms06WLdF5dKJpYbg=; b=comECYavtL8Tw+76630y/lDNgq
	JV56FHCnMQrGio7gpVJoOGVkjhnXc26PBWw9eqhQuUUjYQAWqBxqlosYjwpA3aCtwqpUAfkuH3V6s
	S2N8bepWyPz26vEiyOcI8EbQLk/RDVo5KN9iJOytnrxSbC8TgVFu9QDQLvERMgJcbB5SXOJWaCiq3
	AVqf8SDRtfyQGNKQYIBgkORSQqKHGlUXoNsx0eEfKFNeh2YTAwwfQduWFNVMStgS56u1a1PM/ViRW
	FUnpyilrOddVe6SdDLGU/+I4N9JnMOpSzmlmUDNm9dQA8yEdCqpB1SYzQj/iaqJbyaYWGpmhxcJvT
	l1EwGysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r03hQ-00HGUp-22;
	Mon, 06 Nov 2023 17:47:44 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r03hH-00HGR3-33
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 17:47:43 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3b3f938331fso2367182b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 09:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699292854; x=1699897654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQ7f64Te7UV7a0eNfYVfXMNv7AxvSVBIgEq09gK/fAc=;
        b=VMbfD3MgWizNRGI4QIKEmG/yK/w/jOboMd/EjiZF8fcTZnXFmrIjM3228+riZxh4NK
         YWTiHAJBmQteVZD58vYp+M3aBCRPOSWqQGGS4G0YMCETA930P/8bZ2W6gkyzdXOrzckC
         UfqNQ0d0bMLp3rP9AVgMD5W2N9fdNCxl8BhjJ2XHwYU8WbBwixNZQo5IybUNQxih78dx
         3/DN2cL5ZHthBaOzoZza+7XCbIdyS600rm3r36b6d1Ya8wErqbUMXLNzSKgIU4ySNMlm
         kCGbs+e4nNGEMOoUXnC8/2H90Zryt7vnHaKgEQXbRlncMz9kPjboH91+TtXKtP8FZgLt
         pKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699292854; x=1699897654;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQ7f64Te7UV7a0eNfYVfXMNv7AxvSVBIgEq09gK/fAc=;
        b=Z4LhD6IWve/ItYrApmnXXRoamAcMA1AtZCRFnqXX/0W4WAhoIl02THkpjGUscKd3ZJ
         Htj9q7wPqljc0lGU4aHqoqkJqS0BwSwZQMuAnITfn+CKL9bN2XeD85zIqPdKUpGCIqpr
         GvyzLs8tDfZ8MI7OyUdBp6/02so5AuxNhInAGAml9ZgxH+gjzU4R+yVnK4ak637uzCJ7
         xGNe1n25GzJfkG4BFKNr1KzjXU0EaW8HxViblSUfsQpUXTtrzscRzutEU4sWfbWzRGV3
         DrNdA2WBzn8N0kLYxCddVmJSfgqa+WV521c2LlEt6XIAKZdmEzQX7Iri0ISZAfRt3Ybv
         ZKng==
X-Gm-Message-State: AOJu0YzxsqPw1N6gH1MRM46XWpAxWEhnYKOcxcf0QedjMd2FEBWfx0th
	I85CI8O0wKTze0D+vKFnDePxRA==
X-Google-Smtp-Source: AGHT+IFHr/vXxQwSi3zZsGer8PYd3xCCktoo3g0EmkZqDUpLHtQYEs84mYx4Iau+Vf6CFV9h7vqNkA==
X-Received: by 2002:a05:6808:3846:b0:3a7:33bb:e5e2 with SMTP id ej6-20020a056808384600b003a733bbe5e2mr128284oib.16.1699292853715;
        Mon, 06 Nov 2023 09:47:33 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id e23-20020aca1317000000b003a8560a9d34sm1291179oii.25.2023.11.06.09.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 09:47:33 -0800 (PST)
Date: Mon, 06 Nov 2023 09:47:33 -0800 (PST)
X-Google-Original-Date: Mon, 06 Nov 2023 09:47:27 PST (-0800)
Subject: Re: [PATCH] riscv: CONFIG_EFI should not depend on CONFIG_RISCV_ISA_C
In-Reply-To: <20231024192648.25527-1-bjorn@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bjorn@kernel.org
Message-ID: <mhng-7bef396f-1601-4934-8c85-08196c54aa76@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_094735_984219_4F0C206D 
X-CRM114-Status: GOOD (  29.63  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, atishp@atishpatra.org, Atish Patra <atishp@rivosinc.com>, Bjorn Topel <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyNCBPY3QgMjAyMyAxMjoyNjo0OCBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBV
RUZJL1BFIG1hbmRhdGVzIHRoYXQgdGhlIGtlcm5lbCBJbWFnZSBzdGFydHMgd2l0aCAiTVoiIEFT
Q0lJCj4gKDB4NUE0RCkuIENvbnZlbmllbnQgZW5vdWdoLCAiTVoiIGlzIGEgdmFsaWQgY29tcHJl
c3NlZCBSSVNDLVYKPiBpbnN0cnVjdGlvbi4gVGhpcyBtZWFucyB0aGF0IGEgbm9uLVVFRkkgbG9h
ZGVyIGNhbiBzaW1wbHkganVtcCB0bwo+ICJjb2RlMCIgaW4gdGhlIEltYWdlIGhlYWRlciBbMV0g
YW5kIHN0YXJ0IGV4ZWN1dGluZy4KPgo+IFRoZSBJbWFnZSBzcGVjaWZpY2F0aW9uIFsxXSBzYXlz
IHRoZSBmb2xsb3dpbmcgYWJvdXQgImNvZGUwIjoKPiAgIHwgICBUaGlzIGhlYWRlciBpcyBhbHNv
IHJldXNlZCB0byBzdXBwb3J0IEVGSSBzdHViIGZvciBSSVNDLVYuIEVGSQo+ICAgfCAgIHNwZWNp
ZmljYXRpb24gbmVlZHMgUEUvQ09GRiBpbWFnZSBoZWFkZXIgaW4gdGhlIGJlZ2lubmluZyBvZiB0
aGUKPiAgIHwgICBrZXJuZWwgaW1hZ2UgaW4gb3JkZXIgdG8gbG9hZCBpdCBhcyBhbiBFRkkgYXBw
bGljYXRpb24uIEluIG9yZGVyCj4gICB8ICAgdG8gc3VwcG9ydCBFRkkgc3R1YiwgY29kZTAgaXMg
cmVwbGFjZWQgd2l0aCAiTVoiIG1hZ2ljIHN0cmluZwo+ICAgfCAgIGFuZCByZXMzKGF0IG9mZnNl
dCAweDNjKSBwb2ludHMgdG8gdGhlIHJlc3Qgb2YgdGhlIFBFL0NPRkYKPiAgIHwgICBoZWFkZXIu
Cj4KPiAiTVoiIGlzIG5vdCBhIHZhbGlkIGluc3RydWN0aW9uIGZvciBpbXBsZW1lbnRhdGlvbnMg
d2l0aG91dCB0aGUgQwo+IGV4dGVuc2lvbi4KPgo+IEEgbm9uLVVFRkkgbG9hZGVyLCBsb2FkaW5n
IGEgbm9uLUMgVUVGSSBpbWFnZSBoYXZlIHRoZSBmb2xsb3dpbmcKPiBvcHRpb25zOgo+ICAgMS4g
VHJhcCBhbmQgZW11bGF0ZSAiY29kZTAiCj4gICAyLiBBdm9pZCAiY29kZTAiIGlmIGl0IGlzICJN
WiIsIGFuZCBoYXZlIHRoZSBrZXJuZWwgZW50cnkgYXQKPiAgICAgICJjb2RlMSIuCj4KPiBSZXBs
YWNlIHRoZSBjb21wcmVzc2VkIGluc3RydWN0aW9uIHdpdGggYSBoZXggY29kZSB2YXJpYW50LCB0
aGF0IHdvcmtzCj4gZm9yIENPTkZJR19SSVNDVl9JU0FfQz1uIGJ1aWxkcy4gRnVydGhlciwgdGhp
cyBjaGFuZ2UgYWxzbyBtYWtlIHN1cmUKPiB0aGF0IHRoZSAiY29kZTAiIGluc3RydWN0aW9uIGlz
IDMyYiBhbGlnbmVkLgoKSU1PIHRoaXMgYnJlYWtzIHRoZSBJbWFnZSBmb3JtYXQgb24gbm9uLUMg
c3lzdGVtczogdGhleSdsbCBqdW1wIHN0cmFpZ2h0IAp0byB0aGUgc3RhcnQgKGFzIHRoZXJlJ3Mg
bm8gc3ltYm9scyBsZWZ0IG9yIGFueXRoaW5nKSBhbmQgdGhlbiBqdXN0IGZhaWwgCnRvIGV4ZWN1
dGUgdGhlIEMgaW5zdHJ1Y3Rpb25zLgoKV2UgY291bGQgYW1lbmQgdGhlIEltYWdlIGZvcm1hdCB0
byByZXF1aXJlIGJvb3Rsb2FkZXJzIHRvIGhhbmRsZSB0aGlzIAooaWUsIGxvb2sgYXQgdGhlIGZp
cnN0IGluc3RydWN0aW9ucyBhbmQgZW11bGF0ZSB0aGVtIGlmIHRoZXJlJ3Mgbm8gQyksIAp0aGF0
IHdvdWxkIHJlcXVpcmUgc29tZSBib290bG9hZGVyIHVwZGF0ZXMgYnV0IGdpdmVuIHRoaXMgZG9l
c24ndCB3b3JrIAptYXliZSB0aGF0J3MgZmluZS4KCldlIGNvdWxkIGFsc28ganVzdCBzdG9wIHBy
b2R1Y2luZyBJbWFnZStQRSBiaW5hcmllcyBvbiBub24tQyBzeXN0ZW1zIAooaWUsIGp1c3QgcHJv
ZHVjZSBQRSkuCgo+IFsxXSBEb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJz
dAo+Cj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+
IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgfCAxIC0KPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvaGVhZC5TIHwgOCArKysrKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCBkNjA3YWIwZjdjNmQuLjljNWJiYmM5Mzk1MSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiBAQCAtNzk5LDcgKzc5OSw2IEBAIGNvbmZpZyBFRkkKPiAgCXNlbGVjdCBFRklfUlVOVElNRV9X
UkFQUEVSUwo+ICAJc2VsZWN0IEVGSV9TVFVCCj4gIAlzZWxlY3QgTElCRkRUCj4gLQlzZWxlY3Qg
UklTQ1ZfSVNBX0MKPiAgCXNlbGVjdCBVQ1MyX1NUUklORwo+ICAJaGVscAo+ICAJICBUaGlzIG9w
dGlvbiBwcm92aWRlcyBzdXBwb3J0IGZvciBydW50aW1lIHNlcnZpY2VzIHByb3ZpZGVkCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2hl
YWQuUwo+IGluZGV4IDM3MTBlYTVkMTYwZi4uMzNkNjliNTY5ODQzIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+
IEBAIC0yNyw5ICsyNywxMyBAQCBFTlRSWShfc3RhcnQpCj4gIAkgKi8KPiAgI2lmZGVmIENPTkZJ
R19FRkkKPiAgCS8qCj4gLQkgKiBUaGlzIGluc3RydWN0aW9uIGRlY29kZXMgdG8gIk1aIiBBU0NJ
SSByZXF1aXJlZCBieSBVRUZJLgo+ICsJICogVGhlIGNvbXByZXNzZWQgKEMgZXh0ZW5zaW9uKSAi
Yy5saSBzNCwtMTMiIGluc3RydWN0aW9uCj4gKwkgKiBkZWNvZGVzIHRvIDB4NWE0ZC8iTVoiIChB
U0NJSSksIHdoaWNoIGlzIHJlcXVpcmVkIGJ5IFVFRkkuCj4gKwkgKgo+ICsJICogSW4gb3JkZXIg
dG8gc3VwcG9ydCBub24tY29tcHJlc3NlZCBFRkkga2VybmVscywgdGhlCj4gKwkgKiBpbnN0cnVj
dGlvbiBpcyB3cml0dGVuIGluIGhleC4KPiAgCSAqLwo+IC0JYy5saSBzNCwtMTMKPiArCS53b3Jk
IDB4NWE0ZDVhNGQKPiAgCWogX3N0YXJ0X2tlcm5lbAo+ICAjZWxzZQo+ICAJLyoganVtcCB0byBz
dGFydCBrZXJuZWwgKi8KPgo+IGJhc2UtY29tbWl0OiBkODg1MjBhZDczYjc5ZTcxZTNkZGYwOGRl
MzM1Yjg1MjBhZTQxYzVjCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
