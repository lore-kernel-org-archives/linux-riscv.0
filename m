Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4035EC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boPfWF3q40Wmd9jNQZvcOlI9BAkYKp464ZZqNf21DN0=; b=as0mrGxLFXvYxP
	xtS+RliCxEeEU/1SSq35nnpe8FHiHz2JvySiB77VevlvT7Q9mYfhfdPQqXYACDe3wRGNv5uPxOH7V
	TZgMtWrVL020+LJykue4ciYyOpZGH3mD49frSm7l5zOFBSFwX29DFBBP3qMqkCKleqkoOmvAXEjiR
	S0G01l3eAN2ZjtzMmOdUGiY2GSQ+jqGcMSIoB3PNovNhaFSZ26KuS2cgB+f25quJR2ykzlMJHC0uZ
	ERo/Y/riFP+Qx9SgaG/nZap3udR4ZBlSyhMuHPFP1m1fUSyKYCwMB4FRuB9vLcLIpjzIkmpvgjJFi
	uAyWvhrNomTKNx9KuLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1gn-00000005q6Y-1oKT;
	Tue, 12 Mar 2024 12:57:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1gk-00000005q66-1zuw
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:57:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33e9115d501so825372f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710248220; x=1710853020; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDEpqH4Q4KeZpFC1ZgAtAyQfsztw7Yr9EVuaDsid0TA=;
        b=bwh6KceyAsAU03xe6VqDQahjYOMGV/OIhM4JPDvOJYzRbWW0Whp22nhPBttKlo4lq5
         jRl1L/rhR+4bml3lo/otR/hMKwfNb2rF/EktHSrwTTqwopljZdYp30o2JGnLtbpu+FS0
         II1PYSKaE0CFleNG2n8L0gjlK6ElouVpwc0JoEJXUNmWpIBYdc3uiQkwNJi70jmp//7W
         3QUWkgdvhWq+mlANB8B1rDfqBk85tyObIZZVQbxf1ZfGTCuZ2bDTlVtdPfmwrbSEWYVi
         7kbo5wNQg4HykXwLnL+USK1hqilTat8ysyr+KVipDbrHWoZe7kUcQ/LINMGNGNepY4iJ
         Vq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710248220; x=1710853020;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDEpqH4Q4KeZpFC1ZgAtAyQfsztw7Yr9EVuaDsid0TA=;
        b=PFjWpjL9uv7/hS3mbidjUdcuqEf61+4oFGWdfzbli5GHts6sFWKZDEkr9J8sDac+WQ
         DV6GG7I0cpsqoraSiE649okmxdYC8LqeEKkbgbW53MHamp2fHzoWcfVZRnuYNRMYuTBR
         SXrB4XTIkLn+SjPo5183RTQdRcPUQKrSgmBmDki94lKVEG05PGnZChYh6ZUC4M/RmpHt
         lHfIa4m4Vxf9nvSRHMHVeWoWK+QPOqcbsIO2V4MBnQpN+hhgfUslZaRiZo57hf6o+/mT
         FMNAHdOsFj/O/mt+/yTNmtON2CvNcPfjdCy6xfNpMULCLoJFHj2ZX2LHcDYWy4W1HYOc
         qxWg==
X-Forwarded-Encrypted: i=1; AJvYcCVD0QTg9Ns8p952PBs6Ay3ElNtSOEbikiFFRrvdexP4JpeG/15EA9jWOC3YZHnXKHKg6tzN6Fa475AKFaTp505AWKx+MhGzJIlNDdpwKyBM
X-Gm-Message-State: AOJu0YwMELJKLtfsCkXJcYx+fTP7/elYWQ69bV67yyJQSAd0bMr9TDLg
	JsVt4zq374GiES9lIaVWc4yW6p1ik9Qo/rsgPSrYmKrNsZ0qWgtK4sW+RXOJti+oSywECORx/1i
	MWQ0=
X-Google-Smtp-Source: AGHT+IH5ChVjnJ6ULDEIdaK0UF0GEjGF0mjgKTD7DU480+UpRMsV43ke/KzyX9tIIqCAaQcdu71yHQ==
X-Received: by 2002:a5d:5182:0:b0:33e:4503:3ba4 with SMTP id k2-20020a5d5182000000b0033e45033ba4mr1409949wrv.7.1710248220310;
        Tue, 12 Mar 2024 05:57:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:e160:2f4e:a2e4:b720? ([2a01:e0a:999:a3a0:e160:2f4e:a2e4:b720])
        by smtp.gmail.com with ESMTPSA id bh27-20020a05600c3d1b00b004132901d73asm7529172wmb.46.2024.03.12.05.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 05:56:59 -0700 (PDT)
Message-ID: <02914a7d-b7ef-4866-9bed-9dc97156b6d7@rivosinc.com>
Date: Tue, 12 Mar 2024 13:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1, 5/6] riscv: hwprobe: add zve Vector subextesnions into
 hwprobe interface
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>,
 Andrew Jones <ajones@ventanamicro.com>,
 Costa Shulyupin <costa.shul@redhat.com>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
 <20240312123627.9285-6-andy.chiu@sifive.com>
 <1049078b-74f8-4461-a530-af1c4992dd9b@rivosinc.com>
In-Reply-To: <1049078b-74f8-4461-a530-af1c4992dd9b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_055702_697049_29A35B5E 
X-CRM114-Status: GOOD (  18.79  )
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

T2ggYW5kIG9uZSBvdGhlciB0aGluZywgdGhlcmUgaXMgYSB0eXBvIGluIHRoZSBjb21taXQgdGl0
bGU6CiJzdWJleHRlc25pb25zIiBpbnN0ZWFkIG9mICJzdWJleHRlbnNpb25zIgoKVGhhbmtzICEK
CkNsw6ltZW50CgpPbiAxMi8wMy8yMDI0IDEzOjQyLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4g
Cj4gCj4gT24gMTIvMDMvMjAyNCAxMzozNiwgQW5keSBDaGl1IHdyb3RlOgo+PiBUaGUgZm9sbG93
aW5nIFZlY3RvciBzdWJleHRlbnNpb25zIGZvciAiZW1iZWRkZWQiIHBsYXRmb3JtcyBhcmUgYWRk
ZWQKPj4gaW50byBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzA6Cj4+ICAtIFpWRTMyWAo+PiAg
LSBaVkUzMkYKPj4gIC0gWlZFNjRYCj4+ICAtIFpWRTY0Rgo+PiAgLSBaVkU2NEQKPj4KPj4gRXh0
ZW5zaW9ucyBlbmQgd2l0aCBYIG1lYW4gdGhlIHBsYXRmb3JtIGRvbid0IGhhdmUgYSBWZWN0b3Ig
RlBVLgo+PiBFeHRlbnNpb25zIGVuZCB3aXRoIEYvRCBtZWFuIHdoZXRoZXIgc2luZ2xlIChGKSBv
ciBkb3VibGUgKEQpIHByZWNpc2lvbgo+PiBWZWN0b3Igb3BlcmF0aW9uIGlzIHN1cHBvcnRlZC4K
Pj4KPj4gVGhlIG51bWJlciAzMiBvciA2NCBmb2xsb3dzIGZyb20gWlZFIHRlbGxzIHRoZSBtYXhp
bXVtIGVsZW1lbnQgbGVuZ3RoLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHku
Y2hpdUBzaWZpdmUuY29tPgo+PiAtLS0KPj4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3By
b2JlLnJzdCAgfCAxNSArKysrKysrKysrKysrKysKPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9od3Byb2JlLmggfCAgNSArKysrKwo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJv
YmUuYyAgICAgICB8ICA1ICsrKysrCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJz
dCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+PiBpbmRleCBiMmJjYzll
ZWQ5YWEuLmQwYjAyZTAxMmU1ZCAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jp
c2N2L2h3cHJvYmUucnN0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2Jl
LnJzdAo+PiBAQCAtMTg4LDYgKzE4OCwyMSBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmlu
ZWQ6Cj4+ICAgICAgICAgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDk1Y2YxZjkgKCJBZGQg
Y2hhbmdlcyByZXF1ZXN0ZWQgYnkgVmVkCj4+ICAgICAgICAgZHVyaW5nIHNpZ25vZmYiKQo+PiAg
Cj4+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRTMyWGA6IFRoZSBWZWN0b3Ig
c3ViLWV4dGVuc2lvbiBadmUzMnggaXMKPj4gKyAgICBzdXBwb3J0ZWQsIGFzIGRlZmluZWQgYnkg
dmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4KPj4gKwo+
PiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkUzMkZgOiBUaGUgVmVjdG9yIHN1
Yi1leHRlbnNpb24gWnZlMzJmIGlzCj4+ICsgICAgc3VwcG9ydGVkLCBhcyBkZWZpbmVkIGJ5IHZl
cnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lvbiBtYW51YWwuCj4+ICsKPj4g
KyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZFNjRYYDogVGhlIFZlY3RvciBzdWIt
ZXh0ZW5zaW9uIFp2ZTY0eCBpcwo+PiArICAgIHN1cHBvcnRlZCwgYXMgZGVmaW5lZCBieSB2ZXJz
aW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFudWFsLgo+PiArCj4+ICsg
ICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRTY0RmA6IFRoZSBWZWN0b3Igc3ViLWV4
dGVuc2lvbiBadmU2NGYgaXMKPj4gKyAgICBzdXBwb3J0ZWQsIGFzIGRlZmluZWQgYnkgdmVyc2lv
biAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4KPj4gKwo+PiArICAq
IDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkU2NERgOiBUaGUgVmVjdG9yIHN1Yi1leHRl
bnNpb24gWnZlNjRkIGlzCj4+ICsgICAgc3VwcG9ydGVkLCBhcyBkZWZpbmVkIGJ5IHZlcnNpb24g
MS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lvbiBtYW51YWwuCj4+ICsKPj4gICogOmM6
bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRh
aW5zIHBlcmZvcm1hbmNlCj4+ICAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQg
b2YgcHJvY2Vzc29ycy4KPj4gIAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgK
Pj4gaW5kZXggOWYyYThlM2ZmMjA0Li5iOWEwODc2ZTk2OWYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+PiBAQCAtNTksNiArNTksMTEgQEAgc3RydWN0IHJpc2N2
X2h3cHJvYmUgewo+PiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlRTTwkJKDFVTEwgPDwg
MzMpCj4+ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUNBUwkJKDFVTEwgPDwgMzQpCj4+
ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUNPTkQJKDFVTEwgPDwgMzUpCj4+ICsjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkUzMlgJKDFVTEwgPDwgMzYpCj4+ICsjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aVkUzMkYJKDFVTEwgPDwgMzcpCj4+ICsjZGVmaW5lCQlSSVNDVl9I
V1BST0JFX0VYVF9aVkU2NFgJKDFVTEwgPDwgMzgpCj4+ICsjZGVmaW5lCQlSSVNDVl9IV1BST0JF
X0VYVF9aVkU2NEYJKDFVTEwgPDwgMzkpCj4+ICsjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
VkU2NEQJKDFVTEwgPDwgNDApCj4+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZf
MAk1Cj4+ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAw
KQo+PiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDAp
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+PiBpbmRleCBhN2M1NmI0MWVmZDIuLjI1MDBkMTc1
ZWQ2NiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+PiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4+IEBAIC0xMTEsNiArMTExLDEx
IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBh
aXIsCj4+ICAJCUVYVF9LRVkoWlRTTyk7Cj4+ICAJCUVYVF9LRVkoWkFDQVMpOwo+PiAgCQlFWFRf
S0VZKFpJQ09ORCk7Cj4+ICsJCUVYVF9LRVkoWlZFMzJYKTsKPj4gKwkJRVhUX0tFWShaVkUzMkYp
Owo+PiArCQlFWFRfS0VZKFpWRTY0WCk7Cj4+ICsJCUVYVF9LRVkoWlZFNjRGKTsKPj4gKwkJRVhU
X0tFWShaVkU2NEQpOwo+IAo+IEhpIEFuZHksCj4gCj4gSSdtIG5vdCBzdXJlIGJ1dCBzaW5jZSB0
aGVzZSBleHRlbnNpb25zIGFyZSBjb25kaXRpb25lZCBieSB0aGUgZmFjdAo+IHZlY3RvciBzaG91
bGQgYmUgc3VwcG9ydGVkIGJ5IHRoZSBrZXJuZWwsIHRoZXkgcHJvYmFibHkgbmVlZHMgdG8gYmUg
cHV0Cj4gdW5kZXIgdGhlIGlmIGJlbG93Ogo+IAo+PiAgCj4+ICAJCWlmIChoYXNfdmVjdG9yKCkp
IHsKPiAKPiAJCQk8LS0tIEhlcmUgLS0tPgo+PiAgCQkJRVhUX0tFWShaVkJCKTsKPiAKPiBUaGFu
a3MgIQo+IAo+IENsw6ltZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
