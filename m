Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B83AC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SGQ9V6k0ceb1ss1EHIB7x6sk4KhGxb7hmbLvzEL2+jM=; b=YrT8jMAccP5eRm
	Lb47KBQz16cA+h0qVzifhrdgM5TJDa/EoKEA7as/lCrnXJg9AqFI56kf4zPuvGKDou89Z/yhOaDUy
	hxqrzkeeaw8YWr1DbbJiQX5c2q8CsubMtvnS4gAnHWQ9aZLasg2CSuflNxF3ywEagdg18oQPzp/NI
	17kGARIrf2XpF6CQD9i3WnEb3pVpDcvTDtezAmJMgLTRv+2Zpp4qbvnTHGDi4btD0Pqw1gMZAazkm
	TbCD9PWixjdvPyJ7n/YPHvoEn8SunnQto4QfEVfmc9+eYE/c5k0eGvv81nZoBAaIGa7OpWjNRB8Ni
	6kYdz9C40w5lthlfBNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRVY-0000000AeTw-0S5S;
	Thu, 17 Jul 2025 16:30:56 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR8y-0000000AaRx-42wo
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 16:07:39 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-8797652b1f2so76316239f.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752768456; x=1753373256; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lgpunb85reZG9xTZwbNVBuO0rswFdgZzY975TX/jRuQ=;
        b=U9s866D2x2g4GxQsZ7Nj5bxGMx6y5dzhGkl5ZeTsjkECkGPoDHtoXty7LhStcx3N5T
         GHb9SXUVuF5mkQgwR8L5J++Wsy1ZrfkC7rLcoIopJl7rLpT26Og53s6RPdqfjvAnLjyp
         1QXp6/G+Lj6V4jedPp4RPNefK58R1fNbxAxDKaQrQ73EBUQla1vujse0aIi8eIZrar8D
         kKkIsAcq7USeZtSjzIX93lhVIyQBvx+SjIlD/R2jSKpL21RmmdTD8LfHJ9Fo8N6P663l
         I7H3ayjIJgca1wh3fvy1xkWd9R/xgByh4Q0mRnOyF+OSWl86ocCUjlYn5t6m9tKh2/0m
         b7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752768456; x=1753373256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lgpunb85reZG9xTZwbNVBuO0rswFdgZzY975TX/jRuQ=;
        b=XZ6uBDhxYZDPV2h8a05jBqnIR+N+HSOXA8ytJSToeGjgCdOapYqa/c9oMdeYFFfiV6
         Znvw//C/OAd+r51O5ZyJFF8g33d8tVBxP5A7bPYiDD5a0N7r9lk+NCoiHeLMMSOKevRL
         n93AAU1mFUEDVrASXWfAPHYh5wxj6sB9hWlf1g0bvWH404TJCJCfJlaTr4Ten1+yJ+7u
         QkveaJ5oPfZdrebtqV3/7OqXLML+hSmwerX/MS+UBmpl9OTmBJboBygvnLTv8J3771Pj
         W9yT/P4nYswtq8E1FPWOqF2InG5GoMjSy/cwOAryK1OejlWO+1zwRYTD0ZcZJz+z4vwB
         hs7w==
X-Forwarded-Encrypted: i=1; AJvYcCWDCm3E9RiuP27odwklBe64aiZpikdDILeLLORT6KjNxGaMqsQWVTCLU7GUrFmkSk6GB6nKD6QXrk1sjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqEjq0eHanloRR0qkN3ttNjtpta5bNCymdFtQisRGzsbKpk4Sj
	uLMTJnye88FORH6/JU9ym1zEmhgqS5vWstJMvGG1GEQvur1DKjx4c+sEbsLgBWfXxszhby+8U2G
	OSWszNXbJ19moDjDzrVyQZaW3Ou+MQZdE/fKR8sgljw==
X-Gm-Gg: ASbGncu0sFoGBpr6AmzJ/LWijP9Ey4/ouAeAdRphLl7wZ3W0YrTQ+BxI4y23mRiqrEU
	padPLO4CQ184mtMcbKPar3quzt2BOKsJNqTAm9BzN/dG7ZDfHIxBV+4//ujXJz5iISteyPBekKu
	+jeet5/HN27sh5siuZc7eDSb1a1304ceDNHsrJL7HpzN4cFM+4XllvijgIjW48cK2nnhnBWO3mE
	gCm7nLE
X-Google-Smtp-Source: AGHT+IEvFzIaLhWODX98bcuKZ7fOXM6ICF0D1a2FOT238qB2mbI8P4hj1EYgmfVXY5KwbAkFGmwNg5EwCX4keK/F3+g=
X-Received: by 2002:a05:6602:1688:b0:86d:f35:a100 with SMTP id
 ca18e2360f4ac-879c08a6227mr887776039f.5.1752768455796; Thu, 17 Jul 2025
 09:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 21:37:25 +0530
X-Gm-Features: Ac12FXzE6RMfrSSbSC6EtRsKNfdVOghcMO95e74CACCW8lH380ZKbHD2qUlzeo0
Message-ID: <CAAhSdy3UGPjrdzY2x6c=SCa11i1fKZUOna_vEf+8a=ieSvgPug@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] KVM: Add a helper function to validate vcpu gpa range
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_090737_005261_FF36F817 
X-CRM114-Status: GOOD (  21.45  )
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

SGkgUGFvbG8sCgpPbiBGcmksIE1heSAyMywgMjAyNSBhdCAxMjozM+KAr0FNIEF0aXNoIFBhdHJh
IDxhdGlzaHBAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBhcmNoIHNwZWNpZmljIGNvZGUg
bWF5IG5lZWQgdG8gdmFsaWRhdGUgYSBncGEgcmFuZ2UgaWYgaXQgaXMgYSBzaGFyZWQKPiBtZW1v
cnkgYmV0d2VlbiB0aGUgaG9zdCBhbmQgdGhlIGd1ZXN0LiBDdXJyZW50bHksIHRoZXJlIGFyZSBm
ZXcgcGxhY2VzCj4gd2hlcmUgaXQgaXMgdXNlZCBpbiBSSVNDLVYgaW1wbGVtZW50YXRpb24uIEdp
dmVuIHRoZSBuYXR1cmUgb2YgdGhlIGZ1bmN0aW9uCj4gaXQgbWF5IGJlIHVzZWQgZm9yIG90aGVy
IGFyY2hpdGVjdHVyZXMuIEhlbmNlLCBhIGNvbW1vbiBoZWxwZXIgZnVuY3Rpb24KPiBpcyBhZGRl
ZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+
IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggfCAgMiArKwo+ICB2aXJ0L2t2bS9rdm1f
bWFpbi5jICAgICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9z
dC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gaW5kZXggMjkxZDQ5YjliZjA1Li5hZGRh
NjFjYzQwNzIgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gKysrIGIv
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gQEAgLTEzODMsNiArMTM4Myw4IEBAIHN0YXRpYyBp
bmxpbmUgaW50IGt2bV92Y3B1X21hcF9yZWFkb25seShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdw
YV90IGdwYSwKPgo+ICB1bnNpZ25lZCBsb25nIGt2bV92Y3B1X2dmbl90b19odmEoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4pOwo+ICB1bnNpZ25lZCBsb25nIGt2bV92Y3B1X2dmbl90
b19odmFfcHJvdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdmbl90IGdmbiwgYm9vbCAqd3JpdGFi
bGUpOwo+ICtpbnQga3ZtX3ZjcHVfdmFsaWRhdGVfZ3BhX3JhbmdlKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgZ3BhX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGxlbiwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJvb2wgd3JpdGVfYWNjZXNzKTsKPiAgaW50IGt2bV92Y3B1X3JlYWRfZ3Vl
c3RfcGFnZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdmbl90IGdmbiwgdm9pZCAqZGF0YSwgaW50
IG9mZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBsZW4pOwo+ICBpbnQg
a3ZtX3ZjcHVfcmVhZF9ndWVzdF9hdG9taWMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBn
cGEsIHZvaWQgKmRhdGEsCj4gZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0
L2t2bS9rdm1fbWFpbi5jCj4gaW5kZXggZTg1YjMzYTkyNjI0Li4zZjUyZjU1NzFmYTYgMTAwNjQ0
Cj4gLS0tIGEvdmlydC9rdm0va3ZtX21haW4uYwo+ICsrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMK
PiBAQCAtMzMwMSw2ICszMzAxLDI3IEBAIGludCBrdm1fdmNwdV93cml0ZV9ndWVzdChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgY29uc3Qgdm9pZCAqZGF0YSwKPiAgfQo+ICBFWFBP
UlRfU1lNQk9MX0dQTChrdm1fdmNwdV93cml0ZV9ndWVzdCk7Cj4KPiAraW50IGt2bV92Y3B1X3Zh
bGlkYXRlX2dwYV9yYW5nZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgdW5zaWdu
ZWQgbG9uZyBsZW4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHdyaXRl
X2FjY2VzcykKPiArewo+ICsgICAgICAgZ2ZuX3QgZ2ZuID0gZ3BhID4+IFBBR0VfU0hJRlQ7Cj4g
KyAgICAgICBpbnQgc2VnOwo+ICsgICAgICAgaW50IG9mZnNldCA9IG9mZnNldF9pbl9wYWdlKGdw
YSk7Cj4gKyAgICAgICBib29sIHdyaXRhYmxlID0gZmFsc2U7Cj4gKyAgICAgICB1bnNpZ25lZCBs
b25nIGh2YTsKPiArCj4gKyAgICAgICB3aGlsZSAoKHNlZyA9IG5leHRfc2VnbWVudChsZW4sIG9m
ZnNldCkpICE9IDApIHsKPiArICAgICAgICAgICAgICAgaHZhID0ga3ZtX3ZjcHVfZ2ZuX3RvX2h2
YV9wcm90KHZjcHUsIGdmbiwgJndyaXRhYmxlKTsKPiArICAgICAgICAgICAgICAgaWYgKGt2bV9p
c19lcnJvcl9odmEoaHZhKSB8fCAod3JpdGFibGUgXiB3cml0ZV9hY2Nlc3MpKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRVBFUk07Cj4gKyAgICAgICAgICAgICAgIG9mZnNldCA9
IDA7Cj4gKyAgICAgICAgICAgICAgIGxlbiAtPSBzZWc7Cj4gKyAgICAgICAgICAgICAgICsrZ2Zu
Owo+ICsgICAgICAgfQo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9H
UEwoa3ZtX3ZjcHVfdmFsaWRhdGVfZ3BhX3JhbmdlKTsKPiArCgpDYW4geW91IHBsZWFzZSByZXZp
ZXcgdGhpcyBjb21tb24gaGVscGVyIHNpbmNlIGl0IGlzIGluIHZpcnQva3ZtID8KCj4gIHN0YXRp
YyBpbnQgX19rdm1fZ2ZuX3RvX2h2YV9jYWNoZV9pbml0KHN0cnVjdCBrdm1fbWVtc2xvdHMgKnNs
b3RzLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBnZm5f
dG9faHZhX2NhY2hlICpnaGMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ3BhX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGxlbikKPgo+IC0tCj4gMi40My4wCj4KClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
