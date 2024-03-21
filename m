Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57426C54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmCyhFyFTiTS3mDoz5a1Hb0F9astkNVDYqBfLrghtqg=; b=I+7LYIxStyAgD6
	Fsst9i1kA97pJ8HpZ4dfuVRghGHSRalj9tNrmQTmrxea3Yhs1tGnwccxNvZXabSZnjb7MZjf8p2ew
	xAchpOcm//tOc69VaR2P2sd2o6/Q9V/5BauiZumqa5fo7IrPqj1OyY8yNoq1QVK3iOT0sOgRgYRzW
	ZJZs2d4jqdMtxkVGkD1xggdd2t/m3CEcYG+Tzf1QH4xeKiPreZzJGUueAk3aexo0H0+1EDMlYINMI
	yGBGU9QEXK5PgSsT1mUPVSTyh61ziT0OKI1RjGUqfevuXVv7KrVVDse6zz9jnvNKaAAjfBSCVGp5e
	gWM6FJUxee74WC3i0/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE8f-00000002OKW-0X9u;
	Thu, 21 Mar 2024 08:51:05 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE8b-00000002OIJ-3eqB
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 08:51:03 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3c38f4e18eeso498109b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711011060; x=1711615860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pb2DImA394Xn1GF25dwWbz9ebhgojzvFgrEv+j58JQY=;
        b=eM2LREY++IXxS42wegmfir2ww+iNjGQ9rhzrPEz8vhr4mlr5Dg9nJ8fEBX8HoLzegp
         9Er1fjNVjUv65B+dVM0HF6S8m8BGk330I6xYHlF8w5LTWR3z+pgzRVeOXxQLe8tAWUkh
         AcAj4gdiclSBVwWx/Wuh2ZAnqxm8AURJdnsIdt9WhO9vEM1GVbbyG9QYmpXAziH1RaTO
         JpDU717dvWuWpEDPVdUQOJbNo0ZJ554d0aSrxZpopkpImQI4jWiO4Iff9VQbyZ7PEbLB
         RcAzJCQgCUtYTVnipQfKC+RfNESnwT2jZywkWGEZrdN30b1h7Xz6Ku7z5icOMtYbZv27
         f31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711011060; x=1711615860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb2DImA394Xn1GF25dwWbz9ebhgojzvFgrEv+j58JQY=;
        b=Tts4jS2I+r7vMl4ZEOmbR9O1d4qCua8NGvQqxaeQdMMPf/vtjxtMNv/83KsGtoum+1
         8rdKbYoM+IbGjB4wCOLKjByjsajPfF8PYmhNoQCRg7y6ztp2PHnIk2AV0AnVM8Q0bPrf
         RKE7h0KWmBpRMIX5dN9EW4jtK/O8Ex0dun81X02yKVfgFHlHaN1MIONBLqShb8gHvdN3
         bL5kGGxx22mzRJSQHSNuavT0qfMFg5l6wQMYq6XpGVzbaKbn9ElfDgaCdAFBcC1SKccF
         k2nibZh3wOH5FfuK8BtzwP0gMppI8PvbZrFbOdbQ7d3VRHHZ3+bH1y6IOwxZvKnDWE2S
         2kLg==
X-Forwarded-Encrypted: i=1; AJvYcCXbkKI6Cl9CrbemXnUP0iizOcNDA4qzOEK7GuW+XkAdKWbhUuv0PgK1q5mKaz5l4+nwU9TmRLD+XT15oCjQy4sQh4YMHwTRfkuHANc3XyE9
X-Gm-Message-State: AOJu0YxvZTuRSUDQCDFy+L0T2/V+YpZJ4MgTV/wJWpIJjf+/W2dSHHws
	+i2XyKPZzBrUOmvF3EiN1vlX3evvbK5N129npbeJwvY0sCXZ2x5Xkjqvb6mhhCE=
X-Google-Smtp-Source: AGHT+IFm6Yj6dZwM/TRCsKt+MMBPFQPRbWez6YSGqm2WUAe87j/A2qKzPB8fe5tq8WbjG6fC4RnUTA==
X-Received: by 2002:a05:6808:f90:b0:3c3:a696:c7e1 with SMTP id o16-20020a0568080f9000b003c3a696c7e1mr3806907oiw.3.1711011060344;
        Thu, 21 Mar 2024 01:51:00 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id x3-20020a544003000000b003c3753dd869sm2275409oie.58.2024.03.21.01.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 01:50:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] RISC-V: KVM: Fix APLIC setipnum_le/be write emulation
Date: Thu, 21 Mar 2024 14:20:40 +0530
Message-Id: <20240321085041.1955293-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321085041.1955293-1-apatel@ventanamicro.com>
References: <20240321085041.1955293-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_015101_958752_5329E2F9 
X-CRM114-Status: GOOD (  14.04  )
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

VGhlIHdyaXRlcyB0byBzZXRpcG51bV9sZS9iZSByZWdpc3RlciBmb3IgQVBMSUMgaW4gTVNJLW1v
ZGUgaGF2ZSBzcGVjaWFsCmNvbnNpZGVyYXRpb24gZm9yIGxldmVsLXRyaWdnZXJlZCBpbnRlcnJ1
cHRzIGFzLXBlciB0aGUgc2VjdGlvbiAiNC45LjIKU3BlY2lhbCBjb25zaWRlcmF0aW9uIGZvciBs
ZXZlbC1zZW5zaXRpdmUgaW50ZXJydXB0IHNvdXJjZXMiIG9mIHRoZSBSSVNDLVYKQUlBIHNwZWNp
ZmljYXRpb24uCgpQYXJ0aWN1bGFybHksIHRoZSBiZWxvdyB0ZXh0IGZyb20gdGhlIFJJU0MtViBB
SUEgc3BlY2lmaWNhdGlvbiBkZWZpbmVzCnRoZSBiZWhhdmlvdXIgb2Ygd3JpdGVzIHRvIHNldGlw
bnVtX2xlL2JlIHJlZ2lzdGVyIGZvciBsZXZlbC10cmlnZ2VyZWQKaW50ZXJydXB0czoKCiJBIHNl
Y29uZCBvcHRpb24gaXMgZm9yIHRoZSBpbnRlcnJ1cHQgc2VydmljZSByb3V0aW5lIHRvIHdyaXRl
IHRoZQpBUExJQ+KAmXMgc291cmNlIGlkZW50aXR5IG51bWJlciBmb3IgdGhlIGludGVycnVwdCB0
byB0aGUgZG9tYWlu4oCZcwpzZXRpcG51bSByZWdpc3RlciBqdXN0IGJlZm9yZSBleGl0aW5nLiBU
aGlzIHdpbGwgY2F1c2UgdGhlIGludGVycnVwdOKAmXMKcGVuZGluZyBiaXQgdG8gYmUgc2V0IHRv
IG9uZSBhZ2FpbiBpZiB0aGUgc291cmNlIGlzIHN0aWxsIGFzc2VydGluZwphbiBpbnRlcnJ1cHQs
IGJ1dCBub3QgaWYgdGhlIHNvdXJjZSBpcyBub3QgYXNzZXJ0aW5nIGFuIGludGVycnVwdC4iCgpG
aXggc2V0aXBudW1fbGUvYmUgd3JpdGUgZW11bGF0aW9uIGZvciBpbi1rZXJuZWwgQVBMSUMgYnkg
aW1wbGVtZW50aW5nCnRoZSBhYm92ZSBiZWhhdmlvdXIgaW4gYXBsaWNfd3JpdGVfcGVuZGluZygp
IGZ1bmN0aW9uLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKRml4ZXM6IDc0OTY3YWEyMDhl
MiAoIlJJU0MtVjogS1ZNOiBBZGQgaW4ta2VybmVsIGVtdWxhdGlvbiBvZiBBSUEgQVBMSUMiKQpT
aWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYyB8IDE2ICsrKysrKysrKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKaW5k
ZXggMzllNzJhYTAxNmE0Li41ZTg0MmI5MmRjNDYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3Zt
L2FpYV9hcGxpYy5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCkBAIC0xMzcsMTEg
KzEzNywyMSBAQCBzdGF0aWMgdm9pZCBhcGxpY193cml0ZV9wZW5kaW5nKHN0cnVjdCBhcGxpYyAq
YXBsaWMsIHUzMiBpcnEsIGJvb2wgcGVuZGluZykKIAlyYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmly
cWQtPmxvY2ssIGZsYWdzKTsKIAogCXNtID0gaXJxZC0+c291cmNlY2ZnICYgQVBMSUNfU09VUkNF
Q0ZHX1NNX01BU0s7Ci0JaWYgKCFwZW5kaW5nICYmCi0JICAgICgoc20gPT0gQVBMSUNfU09VUkNF
Q0ZHX1NNX0xFVkVMX0hJR0gpIHx8Ci0JICAgICAoc20gPT0gQVBMSUNfU09VUkNFQ0ZHX1NNX0xF
VkVMX0xPVykpKQorCWlmIChzbSA9PSBBUExJQ19TT1VSQ0VDRkdfU01fSU5BQ1RJVkUpCiAJCWdv
dG8gc2tpcF93cml0ZV9wZW5kaW5nOwogCisJaWYgKHNtID09IEFQTElDX1NPVVJDRUNGR19TTV9M
RVZFTF9ISUdIIHx8CisJICAgIHNtID09IEFQTElDX1NPVVJDRUNGR19TTV9MRVZFTF9MT1cpIHsK
KwkJaWYgKCFwZW5kaW5nKQorCQkJZ290byBza2lwX3dyaXRlX3BlbmRpbmc7CisJCWlmICgoaXJx
ZC0+c3RhdGUgJiBBUExJQ19JUlFfU1RBVEVfSU5QVVQpICYmCisJCSAgICBzbSA9PSBBUExJQ19T
T1VSQ0VDRkdfU01fTEVWRUxfTE9XKQorCQkJZ290byBza2lwX3dyaXRlX3BlbmRpbmc7CisJCWlm
ICghKGlycWQtPnN0YXRlICYgQVBMSUNfSVJRX1NUQVRFX0lOUFVUKSAmJgorCQkgICAgc20gPT0g
QVBMSUNfU09VUkNFQ0ZHX1NNX0xFVkVMX0hJR0gpCisJCQlnb3RvIHNraXBfd3JpdGVfcGVuZGlu
ZzsKKwl9CisKIAlpZiAocGVuZGluZykKIAkJaXJxZC0+c3RhdGUgfD0gQVBMSUNfSVJRX1NUQVRF
X1BFTkRJTkc7CiAJZWxzZQotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
