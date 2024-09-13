Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75B0EEE270
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 00:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mt7G4TA2GhNXc6rYe/fgAQa23xGSRFLA5xWektyTmQk=; b=1Czias/VAQhAjR
	uiOjKv/YXedII4XzSFizoc+ediCbvH2eqxVJUSQMuL5U00f3+8pxS7Hvak3gsecv48WmtTPq+5Ch1
	kj2cj9034UFUrtEVQPeM4eUb8RbZ558BlzWiiykxNlqfM4hCh9+SY+0lobsG9CGBaR/hcwwJfZfaq
	DFc9FuN3aivZir4K5sTcNjmd0RxpncaX+DNdWipUQDRMSuPtQSiqc84NbgzfLDQSBNDMAQfu7Zg1Q
	4RwZeo0Xul4Cb4lbF1s1uNZD88Y8CqkAOK+IWSoAyoHTgrjT3I++RnorSKSnLDva1wnqQsiSNLA+M
	Gm73aUTG0+dGQwF0ItiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souLF-0000000Ebiq-4Bxc;
	Fri, 13 Sep 2024 00:39:18 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souLC-0000000Ebi2-3nJY
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 00:39:16 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-82cdc21b5d8so76871839f.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 17:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1726187953; x=1726792753; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yq7jQvcHt7PS48CeNeYkOSKd0KSPF8mXYZUm141Cz7c=;
        b=FhjWdCPmQCGzgYzLoDhvtGBV6IpOMgC2BJInHJeV2yHOEyepfLXEn8mgJCounjuILF
         FJE7aDceIl0gM7qPewKZaRe3/v8LexZUJ3ox0muzsyIkOECBAnKJM0z0kayZPFcf2nVn
         vnM+LhBE6XiMOldffsk0X8vVTV4RLOl2R940PIkS6EM+rNrIK1LFjl3p3I6tXENdx7AP
         RMWozEAa2r4IuZWo30uZtd1/F5w6TBkh4TvYhiGvwfBXu+DfJ8Tb03SvUro+BOq0ue1Z
         XltipVa9P/l/Nn1KXSau1XvKVgAWxxOBqCsP1jMlzDf54CVUfedsCfFWI+YfVhtoT0SS
         HWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726187953; x=1726792753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yq7jQvcHt7PS48CeNeYkOSKd0KSPF8mXYZUm141Cz7c=;
        b=QXYB3FKmLf6WchNVqhipf9O/yghnz8qyt/og6sBV7NcFn+N0neEofQDIqRRQCKP5NS
         QNYlQz2Y3GN/YX0fMSu9ZExVi1VAHOsuE9u2Uf+loXqWh+N4qs6cvzycYYs+HiXuWfxr
         RzhbMQiAqdf/hG4HXw5wiRL0/t3ZO1YY98/Yoma3JfZBDoFuj6MnPRwEEU1eW2HnMwrj
         dAphgKG3S3Ea4OhyRu5Iph/11/HLFcPw8NP1eLwiXLYYYUZKoasPSiVlzaOlveVqSZBn
         G5f75lerxCMb9uL1w5wEoinBHETn+FDyh1oWKIakMDIQsD/qdKozllRsKDURO0omnfVv
         VZ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFLVm70urCflR49+hptYvJ86oODPNdXXNvsqo53Zo/Ws60lQwWyTRXjkq6UfPs2PWGziIkFTAtRADH6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXmnVKTOQt/JplIF9Vv87q5iaC9RgV6PwG9CjdGSpCltwe4vFp
	8my69E/+RaibT2Y47/lRSmxlJEOWm59iHtL6n+2Qe8rge0Tu41EWNMPUV8/MpC1FCh/Nydk5z2g
	MHoQ=
X-Google-Smtp-Source: AGHT+IFvrXsansubjNKmfH96tpet9MMQHobUfK5ZcIImam7/5J5d7xDWJDRwrnj478owALsMz4iHEg==
X-Received: by 2002:a05:6602:2c88:b0:82d:461:703e with SMTP id ca18e2360f4ac-82d1f8c3477mr641631739f.3.1726187953271;
        Thu, 12 Sep 2024 17:39:13 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-82aa76aac56sm343052539f.44.2024.09.12.17.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 17:39:12 -0700 (PDT)
Message-ID: <380f4da9-50e9-4632-bdc8-b1723eb19ca5@sifive.com>
Date: Thu, 12 Sep 2024 19:39:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: Redirect instruction access fault trap to
 guest
To: Quan Zhou <zhouquan@iscas.ac.cn>, anup@brainfault.org,
 ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <83c2234d582b7e823ce9ac9b73a6bbcf63971a29.1724911120.git.zhouquan@iscas.ac.cn>
 <b5128162-278a-4284-8271-b2b91dc446e1@iscas.ac.cn>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <b5128162-278a-4284-8271-b2b91dc446e1@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_173914_994973_B3F988D6 
X-CRM114-Status: GOOD (  16.55  )
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

T24gMjAyNC0wOS0xMiA0OjAzIEFNLCBRdWFuIFpob3Ugd3JvdGU6Cj4gCj4gT24gMjAyNC84LzI5
IDE0OjIwLCB6aG91cXVhbkBpc2Nhcy5hYy5jbiB3cm90ZToKPj4gRnJvbTogUXVhbiBaaG91IDx6
aG91cXVhbkBpc2Nhcy5hYy5jbj4KPj4KPj4gVGhlIE0tbW9kZSByZWRpcmVjdHMgYW4gdW5oYW5k
bGVkIGluc3RydWN0aW9uIGFjY2Vzcwo+PiBmYXVsdCB0cmFwIGJhY2sgdG8gUy1tb2RlIHdoZW4g
bm90IGRlbGVnYXRpbmcgaXQgdG8KPj4gVlMtbW9kZShoZWRlbGVnKS4gSG93ZXZlciwgS1ZNIHJ1
bm5pbmcgaW4gSFMtbW9kZQo+PiB0ZXJtaW5hdGVzIHRoZSBWUy1tb2RlIHNvZnR3YXJlIHdoZW4g
YmFjayBmcm9tIE0tbW9kZS4KPj4KPj4gVGhlIEtWTSBzaG91bGQgcmVkaXJlY3QgdGhlIHRyYXAg
YmFjayB0byBWUy1tb2RlLCBhbmQKPj4gbGV0IFZTLW1vZGUgdHJhcCBoYW5kbGVyIGRlY2lkZSB0
aGUgbmV4dCBzdGVwLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlz
Y2FzLmFjLmNuPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgfCAxICsK
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4+
IGluZGV4IGZhOThlNWMwMjRiMi4uNjk2YjYyODUwZDBiIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X2V4aXQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+
PiBAQCAtMTgyLDYgKzE4Miw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9leGl0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwgc3RydWN0Cj4+IGt2bV9ydW4gKnJ1biwKPj4gwqDCoMKgwqDCoCByZXQgPSAt
RUZBVUxUOwo+PiDCoMKgwqDCoMKgIHJ1bi0+ZXhpdF9yZWFzb24gPSBLVk1fRVhJVF9VTktOT1dO
Owo+PiDCoMKgwqDCoMKgIHN3aXRjaCAodHJhcC0+c2NhdXNlKSB7Cj4+ICvCoMKgwqAgY2FzZSBF
WENfSU5TVF9BQ0NFU1M6Cj4gCj4gQSBnZW50bGUgcGluZywgdGhlIGluc3RydWN0aW9uIGFjY2Vz
cyBmYXVsdCBzaG91bGQgYmUgcmVkaXJlY3RlZCB0bwo+IFZTLW1vZGUgZm9yIGhhbmRsaW5nLCBp
cyBteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3Q/CgpZZXMsIHRoaXMgbG9va3MgY29ycmVjdC4gSG93
ZXZlciwgSSBiZWxpZXZlIGl0IHdvdWxkIGJlIGVxdWl2YWxlbnQgKGFuZCBtb3JlCmVmZmljaWVu
dCkgdG8gYWRkIEVYQ19JTlNUX0FDQ0VTUyB0byBLVk1fSEVERUxFR19ERUZBVUxUIGluIGFzbS9r
dm1faG9zdC5oLgoKSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBzb21lIGV4Y2VwdGlvbnMgYXJlIGRl
bGVnYXRlZCB3aXRoIGhlZGVsZWcgYW5kIG90aGVycyBhcmUKY2F1Z2h0IGFuZCByZWRpcmVjdGVk
IGhlcmUgd2l0aCBubyBmdXJ0aGVyIHByb2Nlc3NpbmcuIE1heWJlIHNvbWVvbmUgdGhvdWdodAp0
aGF0IGl0IHdhc24ndCB2YWxpZCB0byBzZXQgYSBiaXQgaW4gaGVkZWxlZyBpZiB0aGUgY29ycmVz
cG9uZGluZyBiaXQgd2FzCmNsZWFyZWQgaW4gbWVkZWxlZz8gQnV0IHRoaXMgZG9lc24ndCBtYWtl
IHNlbnNlLCBhcyBTLW1vZGUgY2Fubm90IGtub3cgd2hpY2gKYml0cyBhcmUgc2V0IGluIG1lZGVs
ZWcgKG1heWJlIG5vbmUgYXJlISkuCgpTbyB0aGUgaHlwZXJ2aXNvciBtdXN0IGVpdGhlcjoKIDEp
IGFzc3VtZSBNLW1vZGUgZmlybXdhcmUgY2hlY2tzIGhlZGVsZWcgYW5kIHJlZGlyZWN0cyBleGNl
cHRpb25zIHRvIFZTLW1vZGUKICAgIHJlZ2FyZGxlc3Mgb2YgbWVkZWxlZywgaW4gd2hpY2ggY2Fz
ZSBhbGwgZm91ciBvZiB0aGVzZSBleGNlcHRpb25zIGNhbiBiZQogICAgbW92ZWQgdG8gS1ZNX0hF
REVMRUdfREVGQVVMVCBhbmQgcmVtb3ZlZCBmcm9tIHRoaXMgc3dpdGNoIHN0YXRlbWVudCwgb3IK
CiAyKSBhc3N1bWUgTS1tb2RlIG1pZ2h0IG5vdCBjaGVjayBoZWRlbGVnIGFuZCByZWRpcmVjdCBl
eGNlcHRpb25zIHRvIFZTLW1vZGUsCiAgICBhbmQgc2luY2Ugbm8gYml0cyBhcmUgZ3VhcmFudGVl
ZCB0byBiZSBzZXQgaW4gbWVkZWxlZywgYW55IGJpdCBzZXQgaW4KICAgIGhlZGVsZWcgbXVzdCBf
YWxzb18gYmUgaGFuZGxlZCBpbiB0aGUgc3dpdGNoIGNhc2UgaGVyZS4KCkFudXAsIEF0aXNoLCB0
aG91Z2h0cz8KClJlZ2FyZHMsClNhbXVlbAoKPiAKPj4gwqDCoMKgwqDCoCBjYXNlIEVYQ19JTlNU
X0lMTEVHQUw6Cj4+IMKgwqDCoMKgwqAgY2FzZSBFWENfTE9BRF9NSVNBTElHTkVEOgo+PiDCoMKg
wqDCoMKgIGNhc2UgRVhDX1NUT1JFX01JU0FMSUdORUQ6Cj4+Cj4+IGJhc2UtY29tbWl0OiA3YzYy
NmNlNGJhZTFhYzE0ZjYwMDc2ZDAwZWFmZTcxYWYzMDQ1MGJhCj4gCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
