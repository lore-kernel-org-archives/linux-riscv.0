Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE3CD3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HtLMsA5qk2PnyJA9C9TxFIi0RrvKueMGmQTbvGIq5s=; b=PjMTmETCu1huZ4
	Y7YnLkZeVeOMoX3TzqtsngOfHsC2l/RwbYvkGxE7zkvqbtIO4KevtYM/wJ08tVh3C5JyWCSRX6gU9
	vRxE1ywGvvoVwCjs/VeB8E5UKReweldyvUAf+oeLzNPNQKWHq+QE/+GUg5TdS2TRGrl4xI5zow/PA
	4M52SknuHguQ0zkWm05+6ySYfCd5bnjdFOAfIsCcDG/POCGnuYMD8FWUuBn7jg/0NjV2ejKP2KZLs
	TE6a0U2unDklK887ct3qFfFHvvG4iYdr7ZszSjojWQcjIvjVD7TJBPxrr6RCCmeoOT1PRoEgZb/WW
	MM8me5oR4ouAXvxGF80Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Ylw-000000057N4-0OaY;
	Sun, 20 Oct 2024 16:27:16 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Ylr-000000057MD-33vF
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 16:27:14 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3a39f73a2c7so15251515ab.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1729441630; x=1730046430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlJnZ2dnH0yKZQoVb1MYW1Cw6i1APoJ7tUtFkvOa8R4=;
        b=d+aNGrcWp8PV7YD0x+OtVbkmdc9bGkiVL8lbXNVGrJ3xTWux2c2Z3JX9sjYq1SRqtn
         SpIupcpz/9PKOVdhiS+Y3sxsjmkbMjCR+537kHYUdkWtDZNozHHuxOCES+XbwcjYjnuM
         oYE1f2pxZP7CtdscwMUg25KGoDAdPQy1b0EpgfbA0gXNhcSHci016Q6W3DmJbkI0ao1I
         /B0Re5aHC0G7rL/OkWwCgFVzHv8WpBBAJoWq0oPMSFSyBTPoSUtvtoeWrn9P2sMELTru
         gcRoMe+4BNvSjHk0OtPe6dNpuL5zGTtnS9t0l/eVGXs622BDbbo9rFpS//TG91snBK+/
         oidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729441630; x=1730046430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlJnZ2dnH0yKZQoVb1MYW1Cw6i1APoJ7tUtFkvOa8R4=;
        b=drzYdptKBwn24DL5xiBcxrGn0hbNIGdiZSDmbEXGjbShSbNx1xdq4zPTjJKRL1aelz
         znqWWo6i8T3G3go77ZTbm4hZL0BXV0zAnslb6DFI5YsNrjcWiW1AOWLRra25Xni3OyZl
         LMowdTbhyuNq7LawbPSV2dQxfk46q2O0qNrL5uRoOVBFdougnUIYJvaQbxxHzixquosm
         V29Qqs3P8r9T/EAZ/qLT1sBdbhDDQ28xEcoINgupUM6oPiwSNnZoQBZQgVNRIPrklISI
         yAbO8W9ScEBOaAVRqNycZuTMXQV5IccQWdNdIlRUE0+uAsNHf3NFMNE8MDi8uQH07MXy
         kRdg==
X-Forwarded-Encrypted: i=1; AJvYcCWR7jelmh9krMU1Qhi72sfkX9RAcDch7VUnADxBmrHxbFnvfBZGA8La5bDJFX+coVixoaSLHdA3imqskg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr2s+KK4qvTJ1UNe5kcVBgS0hMBekv+F3OILvPgj3O9ozz8wIz
	/5QEmPZBqsmDYm1JhD8Ke4DfsYraFTelDKY3R/PdlB+kNgy62iLa7aZZTPJ0axdAVeXVUSOHH0W
	gChl3koDuNT7cIBzFPonw4z8XxA5mobGYn7IrdA==
X-Google-Smtp-Source: AGHT+IHut51aPnA4HRNe+5sFOzWqMYIfb+uEzsIdOlVQy40Ze9JNhMPONaOQfYNIMN+UGYB+CfdjzsYqyLXhrhld8kI=
X-Received: by 2002:a92:cd83:0:b0:3a3:96c4:29bc with SMTP id
 e9e14a558f8ab-3a3f406fe98mr81302935ab.11.1729441629798; Sun, 20 Oct 2024
 09:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241016202814.4061541-1-samuel.holland@sifive.com> <20241016202814.4061541-10-samuel.holland@sifive.com>
In-Reply-To: <20241016202814.4061541-10-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 20 Oct 2024 21:56:58 +0530
Message-ID: <CAAhSdy3FTjVUDBJtbsFwj6+DWjrQh3nWwvsm_1edDUO9SkXB2A@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions
 for guests
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, 
	linux-kselftest@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Shuah Khan <shuah@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, kvm-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	Evgenii Stepanov <eugenis@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_092712_231319_5F5CCB1D 
X-CRM114-Status: GOOD (  20.91  )
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

T24gVGh1LCBPY3QgMTcsIDIwMjQgYXQgMTo1OOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoZSBpbnRlcmZhY2UgZm9yIGNvbnRyb2xs
aW5nIHBvaW50ZXIgbWFza2luZyBpbiBWUy1tb2RlIGlzIGhlbnZjZmcuUE1NLAo+IHdoaWNoIGlz
IHBhcnQgb2YgdGhlIFNzbnBtIGV4dGVuc2lvbiwgZXZlbiB0aG91Z2ggcG9pbnRlciBtYXNraW5n
IGluCj4gSFMtbW9kZSBpcyBwcm92aWRlZCBieSB0aGUgU21ucG0gZXh0ZW5zaW9uLiBBcyBhIHJl
c3VsdCwgZW11bGF0aW5nIFNtbnBtCj4gaW4gdGhlIGd1ZXN0IHJlcXVpcmVzIChvbmx5KSBTc25w
bSBvbiB0aGUgaG9zdC4KPgo+IFRoZSBndWVzdCBjb25maWd1cmVzIFNtbnBtIHRocm91Z2ggdGhl
IFNCSSBGaXJtd2FyZSBGZWF0dXJlcyBleHRlbnNpb24sCj4gd2hpY2ggS1ZNIGRvZXMgbm90IHll
dCBpbXBsZW1lbnQsIHNvIGN1cnJlbnRseSB0aGUgSVNBIGV4dGVuc2lvbiBoYXMgbm8KPiB2aXNp
YmxlIGVmZmVjdCBvbiB0aGUgZ3Vlc3QsIGFuZCB0aHVzIGl0IGNhbm5vdCBiZSBkaXNhYmxlZC4g
U3NucG0gaXMKPiBjb25maWd1cmVkIHVzaW5nIHRoZSBzZW52Y2ZnIENTUiB3aXRoaW4gdGhlIGd1
ZXN0LCBzbyB0aGF0IGV4dGVuc2lvbgo+IGNhbm5vdCBiZSBoaWRkZW4gZnJvbSB0aGUgZ3Vlc3Qg
d2l0aG91dCBpbnRlcmNlcHRpbmcgd3JpdGVzIHRvIHRoZSBDU1IuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KCkxHVE0uCgpSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAK
Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHY1Ogo+ICAtIERvIG5vdCBhbGxvdyBTbW5wbSB0byBiZSBk
aXNhYmxlZCwgYXMgc3VnZ2VzdGVkIGJ5IEFudXAKPgo+IENoYW5nZXMgaW4gdjI6Cj4gIC0gTmV3
IHBhdGNoIGZvciB2Mgo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCB8IDIg
KysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgIHwgNCArKysrCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
Cj4gaW5kZXggZTk3ZGIzMjk2NDU2Li40ZjI0MjAxMzc2YjEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oCj4gQEAgLTE3NSw2ICsxNzUsOCBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhU
X0lEIHsKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDRiwKPiAgICAgICAgIEtWTV9SSVND
Vl9JU0FfRVhUX1pDTU9QLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkFXUlMsCj4gKyAg
ICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9TTU5QTSwKPiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhU
X1NTTlBNLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAo+ICB9Owo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X29uZXJlZy5jCj4gaW5kZXggYjMxOWM0YzEzYzU0Li41YjY4NDkwYWQ5YjcgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfb25lcmVnLmMKPiBAQCAtMzQsOSArMzQsMTEgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxv
bmcga3ZtX2lzYV9leHRfYXJyW10gPSB7Cj4gICAgICAgICBbS1ZNX1JJU0NWX0lTQV9FWFRfTV0g
PSBSSVNDVl9JU0FfRVhUX20sCj4gICAgICAgICBbS1ZNX1JJU0NWX0lTQV9FWFRfVl0gPSBSSVND
Vl9JU0FfRVhUX3YsCj4gICAgICAgICAvKiBNdWx0aSBsZXR0ZXIgZXh0ZW5zaW9ucyAoYWxwaGFi
ZXRpY2FsbHkgc29ydGVkKSAqLwo+ICsgICAgICAgW0tWTV9SSVNDVl9JU0FfRVhUX1NNTlBNXSA9
IFJJU0NWX0lTQV9FWFRfU1NOUE0sCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU01TVEFURUVO
KSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU0FJQSksCj4gICAgICAgICBLVk1fSVNBX0VY
VF9BUlIoU1NDT0ZQTUYpLAo+ICsgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNTTlBNKSwKPiAgICAg
ICAgIEtWTV9JU0FfRVhUX0FSUihTU1RDKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVklO
VkFMKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVk5BUE9UKSwKPiBAQCAtMTI3LDggKzEy
OSwxMCBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2FfZGlzYWJsZV9hbGxvd2VkKHVu
c2lnbmVkIGxvbmcgZXh0KQo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9DOgo+ICAg
ICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9JOgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1Zf
SVNBX0VYVF9NOgo+ICsgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TTU5QTToKPiAgICAg
ICAgIC8qIFRoZXJlIGlzIG5vdCBhcmNoaXRlY3R1cmFsIGNvbmZpZyBiaXQgdG8gZGlzYWJsZSBz
c2NvZnBtZiBjb21wbGV0ZWx5ICovCj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1NT
Q09GUE1GOgo+ICsgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU05QTToKPiAgICAgICAg
IGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1NUQzoKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lT
QV9FWFRfU1ZJTlZBTDoKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZOQVBPVDoK
PiAtLQo+IDIuNDUuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
