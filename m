Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269D1EB64D7
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jun 2023 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxa5wsv90Og/jD6fmMMmcNurx0yirmBsNcdx3MeZJZA=; b=Wgg0/2iAi30ND1
	7xpxClQzLFj32kKSq4/ovaKECJ+gwlNUQA8vgURYI1x8ui8YrYWkXGwsGbvCFb47/UAu9DQ1YnWOu
	52sCv0cQRJ8U43BH4u+WwOSLKa6JXPAEnMEHfrq8OTyNhD0ryt4pfWaxEcSmlac3PVysMXSTfxWN2
	6480NFGRPfl4YMVNj1rg/xGKWQSQ8wE6GzvfRjkUUFtYJOEcREOdH+uyqYDFolS7i5L2aWyOHBzQV
	bApII36PGFBapMdefLC1vVewGLm4jh6Zvbmbb+CjpXvPXkMs9ELrpg3C2/rSe93fvfcS1aQGxkcLb
	DrnedtTq+pCdDjmej11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAurK-006DPO-2Z;
	Sun, 18 Jun 2023 16:02:34 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAurG-006DNd-2i
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jun 2023 16:02:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso3772072a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jun 2023 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1687104144; x=1689696144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tk69zSZBq69irQ6KXTUmFnUhhXE2H+D4z+iALKYIPbg=;
        b=5ExsAWaueLejYhbjVuFgF9fLjy9aWDlVfEnQwmoK7Asl4V2KYyGvLQvsnTWp4gqq6J
         pbxKuB2cFYwoaOnNGhYecK3+AyrbCgWGtS9Ef2zGA+eSFRokvsOtidXHQPptDUg1MgwA
         bhbjq0KTXFrMHHhxl6UlOEJmsG/7wr9S1TE7WszAxtfOg39hY8lFucCgOzU4gs5u0uul
         Ky+SSi1QSWo3+bAskKWltpwg3K5Bdb/HEhmhifsvZ8VB8gMnkW+FMbD9SUzWtaVWiccd
         MEtF93ChTUoxV2P/8Yc1EgdrnsbAFkE5o4dQvSw2XPIlk43PskK54sMS+BWsSA9XS8MQ
         OqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687104144; x=1689696144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tk69zSZBq69irQ6KXTUmFnUhhXE2H+D4z+iALKYIPbg=;
        b=i4zzQ+aJPiKcs06/0B9CcrU5rZ2O8hNaVBjGhy8f0BsxSFy6L1yhvU4K/vOVnYbkTY
         AqKzjXhFERin6VkXUUe7QOk5+G0wf9h3olItKzJrqT8b2zUmFvHqWau14F7gT1d0Mmiv
         kqR9qS4aX2XHKy6b6IiGZtNtlCx8ROC1jyrBW5FP2SzYI4xQl+IQYn0YrdFuYLJCS3fx
         M18ZuKXjIfKvfV2VWLkLFaWT20CRudumDfXdBujO4zYf9538K0NtiT+uWxZ3ARFjgoXS
         Ec9FGDCz4lgFbDJKkXdsZ5NoPsmRG3qqk0rRDLj+8eR7nkQr2MMEn9DZrXjs1kvayidj
         IcWw==
X-Gm-Message-State: AC+VfDwXPFnUbnlvCgZRu/nnEhjAdsAkAIY5AERU9ubvt7kfcbu2uOHR
	6fjM25vrJzj0ejx+ZGaBPEW8RJwgTBBDTv4pbTAY037HVnmiTqe4
X-Google-Smtp-Source: ACHHUZ6pEuJe8TtsnRFY0sITQcWqM15hbBlRIOS926qG/437YFWkJnqH4ZQfBz5ivkzz052KxyOt+e/IrbO31r9GXb0=
X-Received: by 2002:aa7:c992:0:b0:51a:1f10:8a79 with SMTP id
 c18-20020aa7c992000000b0051a1f108a79mr5278054edt.31.1687104144358; Sun, 18
 Jun 2023 09:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230615073353.85435-1-apatel@ventanamicro.com>
In-Reply-To: <20230615073353.85435-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 18 Jun 2023 21:32:12 +0530
Message-ID: <CAAhSdy3UL97dnBttjedFv3EztC0oyrNOLuTQK+JituLY7h0FYA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] RISC-V KVM in-kernel AIA irqchip
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_090230_881227_2103CFFC 
X-CRM114-Status: GOOD (  18.30  )
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMTowNOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgaW4ta2VybmVsIEFJQSBp
cnFjaGlwIHRvIEtWTSBSSVNDLVYgd2hpY2ggdHJhcC1uLWVtdWxhdGUKPiBJTVNJQyBhbmQgQVBM
SUMgTVNJLW1vZGUgZm9yIEd1ZXN0LiBUaGUgQVBMSUMgTVNJLW1vZGUgdHJhcC1uLWVtdWxhdGUg
aXMKPiBvcHRpb25hbCBzbyBLVk0gdXNlciBzcGFjZSBjYW4gZW11bGF0ZSBBUExJQyBlbnRpcmVs
eSBpbiB1c2VyIHNwYWNlLgo+Cj4gVGhlIHVzZSBvZiBJTVNJQyBIVyBndWVzdCBmaWxlcyB0byBh
Y2NlbGVyYXRlIElNU0lDIHZpcnR1YWxpemF0aW9uIHdpbGwgYmUKPiBkb25lIGFzIHNlcGFyYXRl
IHNlcmllcyBzaW5jZSB0aGlzIGRlcGVuZHMgb24gQUlBIGlycWNoaXAgZHJpdmVycyB0byBiZQo+
IHVwc3RyZWFtZWQuIFRoaXMgc2VyaWVzIGhhcyBubyBkZXBlbmRlbmN5IG9uIHRoZSBBSUEgaXJx
Y2hpcCBkcml2ZXJzLgo+Cj4gVGhlcmUgaXMgYWxzbyBhIEtWTSBBSUEgaXJxLWJ5cGFzcyAob3Ig
ZGV2aWNlIE1TSSB2aXJ0dWFsaXphdGlvbikgc2VyaWVzCj4gdW5kZXIgZGV2ZWxvcG1lbnQgd2hp
Y2ggZGVwZW5kcyBvbiB0aGlzIHNlcmllcyBhbmQgdXBjb21pbmcgSU9NTVUgZHJpdmVyCj4gc2Vy
aWVzLgo+Cj4gVGhlc2UgcGF0Y2hlcyAob3IgdGhpcyBzZXJpZXMpIGNhbiBhbHNvIGJlIGZvdW5k
IGluIHRoZQo+IHJpc2N2X2t2bV9haWFfaXJxY2hpcF92MyBicmFuY2ggYXQ6IGh0dHBzOi8vZ2l0
aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAo+Cj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAgLSBBZGRl
ZCBLVk1fQ0FQX0lSUUNISVAgaW4gUEFUQ0g1Cj4gIC0gRml4IGNoZWNrIGZvciBLVk1fREVWX1JJ
U0NWX0FJQV9DT05GSUdfSURTIHdyaXRlIGluIFBBVENINgo+ICAtIEZpeCBBUExJQ19JUlFfU1RB
VEVfRU5QRU5EIHVzYWdlIGluIFBBVENINwo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgLSBSZWJh
c2VkIG9uIExpbnV4LTYuNC1yYzYKPiAgLSBBZGRyZXNzZWQgQXRpc2gncyBjb21tZW50IGluIFBB
VENINgo+ICAtIEFkZGVkIGNvbW1lbnRzIGluIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaCBhYm91dCBBUExJQyBhbmQKPiAgICBJTVNJQyBkZXZpY2UgYXR0cmlidXRlIHR5cGUKPgo+
IEFudXAgUGF0ZWwgKDEwKToKPiAgIFJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgZ3Vlc3QgZXh0ZXJu
YWwgaW50ZXJydXB0IGxpbmUgbWFuYWdlbWVudAo+ICAgUklTQy1WOiBLVk06IEFkZCBJTVNJQyBy
ZWxhdGVkIGRlZmluZXMKPiAgIFJJU0MtVjogS1ZNOiBBZGQgQVBMSUMgcmVsYXRlZCBkZWZpbmVz
Cj4gICBSSVNDLVY6IEtWTTogU2V0IGt2bV9yaXNjdl9haWFfbnJfaGdlaSB0byB6ZXJvCj4gICBS
SVNDLVY6IEtWTTogU2tlbGV0YWwgaW4ta2VybmVsIEFJQSBpcnFjaGlwIHN1cHBvcnQKPiAgIFJJ
U0MtVjogS1ZNOiBJbXBsZW1lbnQgZGV2aWNlIGludGVyZmFjZSBmb3IgQUlBIGlycWNoaXAKPiAg
IFJJU0MtVjogS1ZNOiBBZGQgaW4ta2VybmVsIGVtdWxhdGlvbiBvZiBBSUEgQVBMSUMKPiAgIFJJ
U0MtVjogS1ZNOiBFeHBvc2UgQVBMSUMgcmVnaXN0ZXJzIGFzIGF0dHJpYnV0ZXMgb2YgQUlBIGly
cWNoaXAKPiAgIFJJU0MtVjogS1ZNOiBBZGQgaW4ta2VybmVsIHZpcnR1YWxpemF0aW9uIG9mIEFJ
QSBJTVNJQwo+ICAgUklTQy1WOiBLVk06IEV4cG9zZSBJTVNJQyByZWdpc3RlcnMgYXMgYXR0cmli
dXRlcyBvZiBBSUEgaXJxY2hpcAoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciA2LjUKClJlZ2FyZHMs
CkFudXAKCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmggICAgICAgfCAgMTA3
ICsrLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWFfYXBsaWMuaCB8ICAgNTggKysK
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhX2ltc2ljLmggfCAgIDM4ICsKPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICAgfCAgICA0ICsKPiAgYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgfCAgIDcyICsrCj4gIGFyY2gvcmlzY3Yva3Zt
L0tjb25maWcgICAgICAgICAgICAgICAgIHwgICAgNCArCj4gIGFyY2gvcmlzY3Yva3ZtL01ha2Vm
aWxlICAgICAgICAgICAgICAgIHwgICAgMyArCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAg
ICAgICAgICAgICAgIHwgIDI3NCArKysrKy0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMg
ICAgICAgICAgICAgfCAgNjE5ICsrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9k
ZXZpY2UuYyAgICAgICAgICAgIHwgIDY3MyArKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9r
dm0vYWlhX2ltc2ljLmMgICAgICAgICAgICAgfCAxMDgzICsrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgICAgICAgICAgICAgICAgICB8ICAgIDMgKy0KPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICAgfCAgICAyICsKPiAgYXJjaC9y
aXNjdi9rdm0vdm0uYyAgICAgICAgICAgICAgICAgICAgfCAgMTE4ICsrKwo+ICBpbmNsdWRlL3Vh
cGkvbGludXgva3ZtLmggICAgICAgICAgICAgICB8ICAgIDIgKwo+ICAxNSBmaWxlcyBjaGFuZ2Vk
LCAzMDI3IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhX2FwbGljLmgKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYV9pbXNpYy5oCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYwo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+Cj4gLS0KPiAyLjM0LjEKPgo+Cj4gLS0KPiBrdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cj4ga3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
