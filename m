Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9F6C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLFbzIPxWt9A+7OvfU5GkiShbx5hcb/CLeYzf5V1S8M=; b=JtEg6gm2BSOjak
	jWSbb4bO6fnqZ2ov7mL9OBXxz0srfWKE8b6knk1dmyCyYWESA4C0OcF8a96lD6SqVKTkL4XtHJDMA
	cirpYn+fMxOQ2TuAUYn/5VRH8nIul3FG2WrgVL6Zqc07T0BVWSoKmMPz6+AH5Kc1t8i/QffAUdvHz
	1jmuf9xZOnBH0dcCtVwqsys0fSI8lOqPb3TnQ0kDmqF9OD+eZfRzGzbrW0aJ+7f1F0tKdYMTToBEz
	WzcD2Alv5INstR0630qYShFMRHpV/Ox8cQl5Jf4u/RfsW2eWzjdk5lqfZNC4ZzXEDbVO9z9G1A7/c
	Lm1i3FOPN0EsvR3wQ24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkdM-000FeS-2C;
	Thu, 14 Dec 2023 12:16:08 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDkdJ-000FdD-1u
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 12:16:06 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-59082c4aadaso4334236eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 04:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702556160; x=1703160960; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBseVdrDFlP3wbP7vJYL9hvjzRVN+OTQXpZ+CsBu3pI=;
        b=qHicI/zLVZkWH/igrClIFw3e+FUZyNW/n/nLVI7/tqwMy7Vt2F9g6FX+3UE4vsH9Zw
         hQKlbWINdE4g0JM1jWLM/q5fj74+4FkqiyB2FiY8ULuGM2owB+d4yrrtDSbgG3sjd/L3
         KW477feAHaLEfZTV1De6wipt1OvjU6skJFW/RdELSBFbm9zEtlnElbhscDT5feuxMUmX
         RH87w/JcfDxA0xInkUPW5NQTPubaegyzg/QjCDOqaseZEJZ7T9vkaAOYJbV4yeHWk9ry
         EJ4vmlVK9nUMnZ69cr2FFM67N0qRosP3Bs48IADx36v/fQgxr7hgo+7LUoLuFjAlT4o0
         vjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702556160; x=1703160960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBseVdrDFlP3wbP7vJYL9hvjzRVN+OTQXpZ+CsBu3pI=;
        b=AUNsCM88761O14EsKLyE4TzBzbPeo5HhdHLP/Y1DiobYU3jR1BoONkmgGeq941yxr/
         UDohuU2RZLuX4tkoF2XHvu7HZyl03a+2EB9Hw4P77phrgGrsSz46zW66sUd3T/troNnz
         FQQchH8qcXPTWiXrsqNptSYQC+hMJKXEHWnOCAfxop1VcUKHT6V5yhI3kM/t2o5XovIy
         MB9FfquJ5yxuX1l4diWvp/vEhIWbkNKcoKp/kz2sXpJfQjfoExEDN84lCEIajDjPj3VX
         8+syasWy9wFJMBhI6NZaGHg4nf7j5QouhPydrD1nnDh0dey8BGqN2tGEdop0mNGZc7Ar
         JoBg==
X-Gm-Message-State: AOJu0YzQt2VdSpHIXBIMfEkfkMq/lItXNVaI1HoFPjpWVf9Ri3Y0KKJ0
	3RSMNFHz/0MEU2HFNFWGHgFlONMMOoL10kE0L5ez5Q==
X-Google-Smtp-Source: AGHT+IEj9LpcHY6hPKfn4REgUhGo85Mz6E/WR3+z/9PsY0zYZ3nuIGu4wDt6mM+Ma9Kl8FbXjzNz7S4MPf/SQnJvxkk=
X-Received: by 2002:a05:6358:6f07:b0:170:17eb:14b6 with SMTP id
 r7-20020a0563586f0700b0017017eb14b6mr8323474rwn.38.1702556159958; Thu, 14 Dec
 2023 04:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-3-atishp@rivosinc.com>
 <20231207-professed-component-84128c06befa@wendy>
In-Reply-To: <20231207-professed-component-84128c06befa@wendy>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 17:45:48 +0530
Message-ID: <CAAhSdy1vqGHeEMStu8Ft2Cz-_c=9e8ciwo9nBh=CDnEejEvp9w@mail.gmail.com>
Subject: Re: [RFC 2/9] drivers/perf: riscv: Add a flag to indicate SBI v2.0 support
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_041605_636215_DEF87209 
X-CRM114-Status: GOOD (  20.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBEZWMgNywgMjAyMyBhdCA1OjM54oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAwNCwgMjAyMyBhdCAwNjo0
MzowM1BNIC0wODAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+IFNCSSB2Mi4wIGFkZGVkIGZldyBm
dW5jdGlvbnMgdG8gaW1wcm92ZSBTQkkgUE1VIGV4dGVuc2lvbi4gSW4gb3JkZXIKPiA+IHRvIGJl
IGJhY2t3YXJkIGNvbXBhdGlibGUsIHRoZSBkcml2ZXIgbXVzdCB1c2UgdGhlc2UgZnVuY3Rpb25z
IG9ubHkKPiA+IGlmIFNCSSB2Mi4wIGlzIGF2YWlsYWJsZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPgo+IElNTyB0aGlzIGRvZXMgbm90
IG1ha2Ugc2Vuc2UgaW4gYSBwYXRjaCBvZiBpdHMgb3duIGFuZCBzaG91bGQgcHJvYmFibHkKPiBi
ZSBzcXVhc2hlZCB3aXRoIHRoZSBmaXJzdCB1c2VyIGZvciBpdC4KCkkgYWdyZWUuIFRoaXMgcGF0
Y2ggc2hvdWxkIGJlIHNxdWFzaGVkIGludG8gcGF0Y2g0IHdoZXJlIHRoZQpmbGFnIGlzIGZpcnN0
IHVzZWQuCgpSZWdhcmRzLApBbnVwCgo+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3BlcmYvcmlzY3Zf
cG11X3NiaS5jIHwgNSArKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+IGluZGV4IDE2YWNkNGRjZGI5Ni4uNDBhMzM1MzUw
ZDA4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gKysr
IGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gQEAgLTM1LDYgKzM1LDggQEAKPiA+
ICBQTVVfRk9STUFUX0FUVFIoZXZlbnQsICJjb25maWc6MC00NyIpOwo+ID4gIFBNVV9GT1JNQVRf
QVRUUihmaXJtd2FyZSwgImNvbmZpZzo2MyIpOwo+ID4KPiA+ICtzdGF0aWMgYm9vbCBzYmlfdjJf
YXZhaWxhYmxlOwo+ID4gKwo+ID4gIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpyaXNjdl9hcmNo
X2Zvcm1hdHNfYXR0cltdID0gewo+ID4gICAgICAgJmZvcm1hdF9hdHRyX2V2ZW50LmF0dHIsCj4g
PiAgICAgICAmZm9ybWF0X2F0dHJfZmlybXdhcmUuYXR0ciwKPiA+IEBAIC0xMTA4LDYgKzExMTAs
OSBAQCBzdGF0aWMgaW50IF9faW5pdCBwbXVfc2JpX2RldmluaXQodm9pZCkKPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gPiAgICAgICB9Cj4gPgo+ID4gKyAgICAgaWYgKHNiaV9zcGVjX3Zl
cnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkpCj4gPiArICAgICAgICAgICAgIHNiaV92Ml9h
dmFpbGFibGUgPSB0cnVlOwo+ID4gKwo+ID4gICAgICAgcmV0ID0gY3B1aHBfc2V0dXBfc3RhdGVf
bXVsdGkoQ1BVSFBfQVBfUEVSRl9SSVNDVl9TVEFSVElORywKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJwZXJmL3Jpc2N2L3BtdTpzdGFydGluZyIsCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbXVfc2JpX3N0YXJ0aW5nX2NwdSwgcG11X3Ni
aV9keWluZ19jcHUpOwo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
