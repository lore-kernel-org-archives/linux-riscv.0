Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36A6CD4853
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 14:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3z114bFMieykq7vpOug3hP6KEFSqi4zzZuC3Mgbw40=; b=HfDzo07dLoz3IM
	zR4q+QaAV/+Ed3v1meiERuWWBsSQ3X0u31374LwZwMXYiTxQyGlX/JBr6y+g/2O2Zz3pW1tcepWZa
	9QroYleNh7BZX6DhEYhmMWiqGCpz3+rioD5ST07FSwWyBsiDNHGapvLaR6PH0axHfU0ljl3RiY+Cz
	eLyCtmQeuUEIZL6rcCs8Iz7zORUBPTFNerdqcWTUd+auKG+EaJsRdD+WkXk+J1p14EZU9qNUdxYBO
	wpcCw+qHX/3VXQ8/lDJhfB6dv8EobmWpB1TgPBokQKd7Pe7ov5F/nBjhIu6iFnivYrueVcAWWNP0b
	jQRt8iAZqH78OxVJzCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrTG-00000004tuR-3EnZ;
	Wed, 04 Sep 2024 14:58:58 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrRd-00000004tTC-0XUW
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 14:57:18 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-39fd6a9acb6so2500325ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1725461836; x=1726066636; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0ZQXgyDP6PEcKiBn5OcVA7Fwl0wFC8E7Z3K9IfpZ0M=;
        b=Bn6chuecUGa6epz6MeXVYUCrK0+vpRVbMaCvF/1mjwf9bzTDC6XZyS1t32JPdzgMS0
         od9mzXA2ARLxGxogI39H1tyi5v0r65EUjxzs6cXIu+GUNAOpFbAMSu9C4UeNguxEjVpt
         9Qc8h6PZhwvo/uD70UYuqnCS2AvRrbyx0Gbd4/fsgUTsJ9N1YtuQajJffRjsgSzfKirb
         3fofr83FqFMipvcgZLb9k+BGGIZwstHKyRS1NECZs0rqrLTTp1jwjaiL5cxbzwvo9wxs
         cs/oK/6W8HRQj4xA+cyAqeWHUOz89+Ew2WkNssj/w/AII99wPVRtLbLYIDkvcbNXD1M7
         2Ejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461836; x=1726066636;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0ZQXgyDP6PEcKiBn5OcVA7Fwl0wFC8E7Z3K9IfpZ0M=;
        b=NQhRJR/g2sf4uT3tjqB+kXcN2kwJ5OfMzmGmHThuupU4d+Ila3ieLgRbiKoumflY/W
         oFWwd6X6P0H7LhsEQpgblgKS8g64nFOPR5UbKGINSysDOFJBErvJi0371/ssCGVh5bHU
         w84qamye706KdNK8eQZe0ZNLRBkq0FYwwKkFh98L0BMLAL0z3RG/Qww25cwj7Rb/E2Z7
         kUYwykfeGVU83dUg0yxPhzFhcsLrX0D25B6dLYziIXgFL6Z7GF6Bn3MupV3YX4ox+s18
         Ze8PBYsM5wDhfwx2mNUOA8nlLK6cR6LeMZKfBIlTCdsefcg9lHURewZqGXO4u8QcQYBS
         PwRg==
X-Forwarded-Encrypted: i=1; AJvYcCV8ldkQP3oYCGDMgIAmaMJNybX38k0phn+XSVOErxH8MziSBA2rXlwctiYMkulByfJZTVivDxvoSii8hQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8EUZcpUk9KCRgNuB2MJyShwzP1+ENJgOsCenPc9pBTq80LffT
	CzkSG4a93h6bzonQauLPKkccGDvnEG4ZxzyWhiQUy02R4xC56X9Bi5B1jvAnOoQ=
X-Google-Smtp-Source: AGHT+IFmN6vbfzT5PWKujAvPK3c+gxIQ3iKyoamdrVQqiSlA8y4anU+BlKP4BnDY91w5JpizW9/g2Q==
X-Received: by 2002:a05:6e02:1fed:b0:39e:78d9:ebfc with SMTP id e9e14a558f8ab-39f6a9f5455mr82847405ab.17.1725461835688;
        Wed, 04 Sep 2024 07:57:15 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ced2e17ba7sm3122962173.77.2024.09.04.07.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 07:57:15 -0700 (PDT)
Message-ID: <20ab0fa2-d5dd-446d-9fff-a3ef82e8db35@sifive.com>
Date: Wed, 4 Sep 2024 09:57:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions
 for guests
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 kasan-dev@googlegroups.com, Atish Patra <atishp@atishpatra.org>,
 Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 kvm-riscv@lists.infradead.org
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-10-samuel.holland@sifive.com>
 <CAK9=C2WjraWjuQCeU2Y4Jhr-gKkOcP42Sza7wVp0FgeGaD923g@mail.gmail.com>
 <b6de8769-7e4e-4a19-b239-a39fd424e0c8@sifive.com>
 <CAAhSdy08SoDoZCii9R--BK7_NKLnRciW7V3mo2aQRKW1dbOgNg@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAAhSdy08SoDoZCii9R--BK7_NKLnRciW7V3mo2aQRKW1dbOgNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_075717_214848_B7D32470 
X-CRM114-Status: GOOD (  28.52  )
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

SGkgQW51cCwKCk9uIDIwMjQtMDktMDQgOTo0NSBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBX
ZWQsIFNlcCA0LCAyMDI0IGF0IDg6MDHigK9QTSBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxh
bmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+IE9uIDIwMjQtMDktMDQgNzoxNyBBTSwgQW51cCBQYXRl
bCB3cm90ZToKPj4+IE9uIFRodSwgQXVnIDI5LCAyMDI0IGF0IDY6MzLigK9BTSBTYW11ZWwgSG9s
bGFuZAo+Pj4gPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gVGhl
IGludGVyZmFjZSBmb3IgY29udHJvbGxpbmcgcG9pbnRlciBtYXNraW5nIGluIFZTLW1vZGUgaXMg
aGVudmNmZy5QTU0sCj4+Pj4gd2hpY2ggaXMgcGFydCBvZiB0aGUgU3NucG0gZXh0ZW5zaW9uLCBl
dmVuIHRob3VnaCBwb2ludGVyIG1hc2tpbmcgaW4KPj4+PiBIUy1tb2RlIGlzIHByb3ZpZGVkIGJ5
IHRoZSBTbW5wbSBleHRlbnNpb24uIEFzIGEgcmVzdWx0LCBlbXVsYXRpbmcgU21ucG0KPj4+PiBp
biB0aGUgZ3Vlc3QgcmVxdWlyZXMgKG9ubHkpIFNzbnBtIG9uIHRoZSBob3N0Lgo+Pj4+Cj4+Pj4g
U2luY2UgdGhlIGd1ZXN0IGNvbmZpZ3VyZXMgU21ucG0gdGhyb3VnaCB0aGUgU0JJIEZpcm13YXJl
IEZlYXR1cmVzCj4+Pj4gaW50ZXJmYWNlLCB0aGUgZXh0ZW5zaW9uIGNhbiBiZSBkaXNhYmxlZCBi
eSBmYWlsaW5nIHRoZSBTQkkgY2FsbC4gU3NucG0KPj4+PiBjYW5ub3QgYmUgZGlzYWJsZWQgd2l0
aG91dCBpbnRlcmNlcHRpbmcgd3JpdGVzIHRvIHRoZSBzZW52Y2ZnIENTUi4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+
Pj4+IC0tLQo+Pj4+Cj4+Pj4gKG5vIGNoYW5nZXMgc2luY2UgdjIpCj4+Pj4KPj4+PiBDaGFuZ2Vz
IGluIHYyOgo+Pj4+ICAtIE5ldyBwYXRjaCBmb3IgdjIKPj4+Pgo+Pj4+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmggfCAyICsrCj4+Pj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25l
cmVnLmMgICAgICB8IDMgKysrCj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4+Pj4gaW5kZXggZTk3ZGIzMjk2
NDU2Li40ZjI0MjAxMzc2YjEgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
Cj4+Pj4gQEAgLTE3NSw2ICsxNzUsOCBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKPj4+
PiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDRiwKPj4+PiAgICAgICAgIEtWTV9SSVNDVl9J
U0FfRVhUX1pDTU9QLAo+Pj4+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkFXUlMsCj4+Pj4g
KyAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9TTU5QTSwKPj4+PiArICAgICAgIEtWTV9SSVNDVl9J
U0FfRVhUX1NTTlBNLAo+Pj4+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAo+Pj4+ICB9
Owo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4+Pj4gaW5kZXggYjMxOWM0YzEzYzU0Li42Zjgz
M2VjMjM0NGEgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+
Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPj4+PiBAQCAtMzQsOSArMzQs
MTEgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10gPSB7Cj4+
Pj4gICAgICAgICBbS1ZNX1JJU0NWX0lTQV9FWFRfTV0gPSBSSVNDVl9JU0FfRVhUX20sCj4+Pj4g
ICAgICAgICBbS1ZNX1JJU0NWX0lTQV9FWFRfVl0gPSBSSVNDVl9JU0FfRVhUX3YsCj4+Pj4gICAg
ICAgICAvKiBNdWx0aSBsZXR0ZXIgZXh0ZW5zaW9ucyAoYWxwaGFiZXRpY2FsbHkgc29ydGVkKSAq
Lwo+Pj4+ICsgICAgICAgW0tWTV9SSVNDVl9JU0FfRVhUX1NNTlBNXSA9IFJJU0NWX0lTQV9FWFRf
U1NOUE0sCj4+Pgo+Pj4gV2h5IG5vdCB1c2UgS1ZNX0lTQV9FWFRfQVJSKCkgbWFjcm8gaGVyZSA/
Cj4+Cj4+IEJlY2F1c2UgdGhlIGV4dGVuc2lvbiBuYW1lIGluIHRoZSBob3N0IGRvZXMgbm90IG1h
dGNoIHRoZSBleHRlbnNpb24gbmFtZSBpbiB0aGUKPj4gZ3Vlc3QuIFBvaW50ZXIgbWFza2luZyBm
b3IgSFMgbW9kZSBpcyBwcm92aWRlZCBieSBTbW5wbS4gUG9pbnRlciBtYXNraW5nIGZvciBWUwo+
PiBtb2RlIGlzIHByb3ZpZGVkIGJ5IFNzbnBtIGF0IHRoZSBoYXJkd2FyZSBsZXZlbCwgYnV0IHRo
aXMgbmVlZHMgdG8gYXBwZWFyIHRvIHRoZQo+PiBndWVzdCBhcyBpZiBTbW5wbSB3YXMgaW1wbGVt
ZW50ZWQsIHNpbmNlIHRoZSBndWVzdCB0aGlua3MgaXQgaXMgcnVubmluZyBvbiBiYXJlCj4+IG1l
dGFsLgo+IAo+IE9rYXksIG1ha2VzIHNlbnNlLgo+IAo+Pgo+Pj4+ICAgICAgICAgS1ZNX0lTQV9F
WFRfQVJSKFNNU1RBVEVFTiksCj4+Pj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1NBSUEpLAo+
Pj4+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNTQ09GUE1GKSwKPj4+PiArICAgICAgIEtWTV9J
U0FfRVhUX0FSUihTU05QTSksCj4+Pj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1NUQyksCj4+
Pj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCksCj4+Pj4gICAgICAgICBLVk1fSVNB
X0VYVF9BUlIoU1ZOQVBPVCksCj4+Pj4gQEAgLTEyOSw2ICsxMzEsNyBAQCBzdGF0aWMgYm9vbCBr
dm1fcmlzY3ZfdmNwdV9pc2FfZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQo+Pj4+
ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9NOgo+Pj4+ICAgICAgICAgLyogVGhlcmUg
aXMgbm90IGFyY2hpdGVjdHVyYWwgY29uZmlnIGJpdCB0byBkaXNhYmxlIHNzY29mcG1mIGNvbXBs
ZXRlbHkgKi8KPj4+PiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1NDT0ZQTUY6Cj4+
Pj4gKyAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NTTlBNOgo+Pj4KPj4+IFdoeSBub3Qg
YWRkIEtWTV9SSVNDVl9JU0FfRVhUX1NNTlBNIGhlcmUgPwo+Pj4KPj4+IERpc2FibGluZyBTbW5w
bSBmcm9tIEtWTSB1c2VyIHNwYWNlIGlzIHZlcnkgZGlmZmVyZW50IGZyb20KPj4+IGRpc2FibGlu
ZyBTbW5wbSBmcm9tIEd1ZXN0IHVzaW5nIFNCSSBGV0ZUIGV4dGVuc2lvbi4KPj4KPj4gVW50aWwg
YSBzdWNjZXNzZnVsIFNCSSBGV0ZUIGNhbGwgdG8gS1ZNIHRvIGVuYWJsZSBwb2ludGVyIG1hc2tp
bmcgZm9yIFZTIG1vZGUsCj4+IHRoZSBleGlzdGVuY2Ugb2YgU21ucG0gaGFzIG5vIHZpc2libGUg
ZWZmZWN0IG9uIHRoZSBndWVzdC4gU28gZmFpbGluZyB0aGUgU0JJCj4+IGNhbGwgaXMgc3VmZmlj
aWVudCB0byBwcmV0ZW5kIHRoYXQgdGhlIGhhcmR3YXJlIGRvZXMgbm90IHN1cHBvcnQgU21ucG0u
Cj4+Cj4+PiBUaGUgS1ZNIHVzZXIgc3BhY2Ugc2hvdWxkIGFsd2F5cyBhZGQgU21ucG0gaW4gdGhl
Cj4+PiBHdWVzdCBJU0Egc3RyaW5nIHdoZW5ldmVyIHRoZSBIb3N0IElTQSBzdHJpbmcgaGFzIGl0
Lgo+Pgo+PiBJIGRpc2FncmVlLiBBbGxvd2luZyB1c2Vyc3BhY2UgdG8gZGlzYWJsZSBleHRlbnNp
b25zIGlzIHVzZWZ1bCBmb3IgdGVzdGluZyBhbmQKPj4gdG8gc3VwcG9ydCBtaWdyYXRpb24gdG8g
aG9zdHMgd2hpY2ggZG8gbm90IHN1cHBvcnQgdGhvc2UgZXh0ZW5zaW9ucy4gU28gSSB3b3VsZAo+
PiBvbmx5IGFkZCBleHRlbnNpb25zIHRvIHRoaXMgbGlzdCBpZiB0aGVyZSBpcyBubyBwb3NzaWJs
ZSB3YXkgdG8gZGlzYWJsZSB0aGVtLgo+IAo+IEkgYW0gbm90IHNheWluZyB0byBkaXNhbGxvdyBL
Vk0gdXNlciBzcGFjZSBkaXNhYmxpbmcgU21ucG0uCgpUaGVuIEknbSBjb25mdXNlZC4gVGhpcyBp
cyB0aGUgInJldHVybiBmYWxzZTsiIHN3aXRjaCBjYXNlIGluc2lkZQprdm1fcmlzY3ZfdmNwdV9p
c2FfZGlzYWJsZV9hbGxvd2VkKCkuIElmIEkgYWRkIEtWTV9SSVNDVl9JU0FfRVhUX1NNTlBNIGhl
cmUsCnRoZW4gKHVubGVzcyBJIGFtIG1pc3JlYWRpbmcgdGhlIGNvZGUpIEkgYW0gZGlzYWxsb3dp
bmcgS1ZNIHVzZXJzcGFjZSBmcm9tCmRpc2FibGluZyBTbW5wbSBpbiB0aGUgZ3Vlc3QgKGkuZS4g
cHJldmVudGluZyBLVk0gdXNlcnNwYWNlIGZyb20gcmVtb3ZpbmcgU21ucG0KZnJvbSB0aGUgZ3Vl
c3QgSVNBIHN0cmluZykuIElmIHRoYXQgaXMgbm90IGRlc2lyZWQsIHRoZW4gd2h5IGRvIHlvdSBz
dWdnZXN0IEkKYWRkIEtWTV9SSVNDVl9JU0FfRVhUX1NNTlBNIGhlcmU/Cgo+IFRoZSBwcmVzZW5j
ZSBvZiBTbW5wbSBpbiBJU0Egb25seSBtZWFucyB0aGF0IGl0IGlzIHByZXNlbnQgaW4gSFcKPiBi
dXQgaXQgbmVlZHMgdG8gYmUgZXhwbGljaXRseSBjb25maWd1cmVkL2VuYWJsZWQgdXNpbmcgU0JJ
IEZXRlQuCj4gCj4gS1ZNIHVzZXIgc3BhY2UgY2FuIGNlcnRhaW5seSBkaXNhYmxlIGV4dGVuc2lv
bnMgYnkgbm90IGFkZGluZyBpdCB0bwo+IElTQSBzdHJpbmcgYmFzZWQgb24gdGhlIEtWTVRPT0wv
UUVNVS1LVk0gY29tbWFuZCBsaW5lIG9wdGlvbi4KPiBBZGRpdGlvbmFsbHksIHdoZW4gU0JJIEZX
RlQgaXMgYWRkZWQgdG8gS1ZNIFJJU0MtVi4gSXQgd2lsbCBoYXZlIGl0cwo+IG93biB3YXkgdG8g
ZXhwbGljaXRseSBkaXNhYmxlIGZpcm13YXJlIGZlYXR1cmVzIGZyb20gS1ZNIHVzZXIgc3BhY2Uu
CgpJIHRoaW5rIHdlIGFncmVlIG9uIHRoaXMsIGJ1dCB5b3VyIGV4cGxhbmF0aW9uIGhlcmUgYXBw
ZWFycyB0byBjb25mbGljdCB3aXRoCnlvdXIgc3VnZ2VzdGVkIGNvZGUgY2hhbmdlLiBBcG9sb2dp
ZXMgaWYgSSdtIG1pc3Npbmcgc29tZXRoaW5nLgoKUmVnYXJkcywKU2FtdWVsCgo+Pj4gVGhlIEd1
ZXN0IG11c3QgZXhwbGljaXRseSB1c2UgU0JJIEZXRlQgdG8gZW5hYmxlCj4+PiBTbW5wbSBvbmx5
IGFmdGVyIGl0IHNlZXMgU21ucG0gaW4gSVNBIHN0cmluZy4KPj4KPj4gWWVzLCBleGFjdGx5LCBh
bmQgdGhlIHB1cnBvc2Ugb2Ygbm90IGluY2x1ZGluZyBTbW5wbSBpbiB0aGUgc3dpdGNoIGNhc2Ug
aGVyZSBpcwo+PiBzbyB0aGF0IEtWTSB1c2VyIHNwYWNlIGNhbiBjb250cm9sIHdoZXRoZXIgb3Ig
bm90IGl0IGFwcGVhcnMgaW4gdGhlIElTQSBzdHJpbmcuCj4+Cj4+IFJlZ2FyZHMsCj4+IFNhbXVl
bAo+Pgo+Pj4+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU1RDOgo+Pj4+ICAgICAg
ICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TVklOVkFMOgo+Pj4+ICAgICAgICAgY2FzZSBLVk1f
UklTQ1ZfSVNBX0VYVF9TVk5BUE9UOgo+Pj4+IC0tCj4+Pj4gMi40NS4xCj4+Pj4KPj4+Pgo+Pj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+Pj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKPj4+Cj4+PiBSZWdhcmRzLAo+Pj4gQW51cAo+Pgo+IAo+IFJlZ2FyZHMsCj4gQW51cAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
