Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C2AC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EoiW6v+JT10X6u4qgMpgAN5ysvPLcm8HWkYsMs/at4=; b=FOdxobwlnf3hgR
	4OCAgsMbxi26jgIFJBTfjYeO5mGRYDVxACnFep/z6NGfQxSQ6HWw8DHsXZiH5CPIqRYcrTMLDc+bp
	V9kHQJ2EbfNm/ujZ4G3eKaDK9HQxPc48MGispOJ7z5OctTlbXphzYw/xboQpVvFKphnofbjeE0nKw
	qDzYS7ozP9OvJ6fucKcBQZ4FvrbhbceAuKUwY6YyCdmimj8YozrHouuZ6pN8p+2f8ECGi4bAXSuiZ
	kI2RYfHho93W/9f80dn6VvavOn4srV1radZaeZGss2m7+b6x+nPR6x3FyQE7rc2dfQb6W/QFOnE21
	2IQ4PDF/+oApg+t/fvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp72I-00000008XGL-1odo;
	Wed, 29 Jul 2026 16:21:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp72F-00000008XFO-3Cu0
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:21:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1246507f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 09:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785342094; cv=none;
        d=google.com; s=arc-20260327;
        b=ZIyPskQ0cGyoWOcIVdcZTF2+YbTX5+V5wQthVFXQWhSKlmuZOhfagskCZkajWpiZqe
         6BNY0GLQScUCp8NrJPzE5kXubDFwcO0mvA/hqKj0VN1GBITCaK7TNJlKziGx9TEo3Zqo
         sGLJokW+Sxg4UiHSdHB/BMzfnZtL8yFdVF3IcQiiRin1uAyUo3wQnwXxzjI8O5A7ge6y
         4UilYqislrvDymC0ego64Gxw+ZYX+vjjPHb7z2DTEVQp6fhCz8JBGbuJgGNQAmz5nYYD
         OsMdHIPGub1y0wNsymHkHqgptb/AisPwrHImctbPVKkdkmULGOdZ6lEemREhcl8da8oP
         4Qdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xlNUGStHPcM9h7uZ5gMcfZsRgLFM6lwcIC3C63GbVXU=;
        fh=nPybv04ehb/U/mBRCs9NVHUI8WnqadJFIN0cz5dORKo=;
        b=WwgHS2sYwakPtDDbjMkETz2DzXMqUgVwZdsYAQbLxF0p97lFgiQF2mfh9JDGQtyLT1
         EGqdgUHH6k0jRb16b46h3sk7AzHnW11kYp8xWBCc+KXbz5wZmFYr9CpC+pWdIddJukjm
         F9W9rih3t6vNFFGTSpbPMHyh3XwNYrVvHVwho2r+yV0A/0hJUWtrRLsWUG/CWHFPqmXj
         KYXbnIA5AM4sSEf1QBMlYzYwBOw+1LcSXFlXXYZVLvAxvIZF51RPSUheDfXuEQSfS92f
         1K8ROIhI5yRAud7fL5PrN0V8CrGXaz644tScAdzJNkC0m0dd5KG7JXLfKsutg52icX+g
         edlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785342094; x=1785946894; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xlNUGStHPcM9h7uZ5gMcfZsRgLFM6lwcIC3C63GbVXU=;
        b=f1eu/psXn/h128Mp2VSsxGI0hcVXPFXSLcjwUDYeA1A6zMqwinkDlROog0MoKwUoFX
         rzY1EAqXlOw9NCqBbvfynC3MEj4/j1KOZYgI+UdTN5hHn2UKJ4t/2yRMAPawKO/yFPaf
         /vz6cMT4Cs3Lymix8m8b2YDm2i7kOtJChcHf/xNZYredgSrCTQAFtcGVvXCFvi9NxEZ/
         0k2wwzKM28XC3fIOr5aVFgSbje0OLUB4JdbVgHJnDmr3ePUnRTZI2dq6su1evfakBm7S
         mcl9Nzt7h/MfE6Az4xW7MsZGGoHJ8hKaWCjESzuhlmZoY6CTlvpuOHCvjXUi8nDUxiS7
         lhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342094; x=1785946894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlNUGStHPcM9h7uZ5gMcfZsRgLFM6lwcIC3C63GbVXU=;
        b=S5QTtHEFFWoO0Aa8qXmsKvjnDkgY0dd/d1FqTn+RAtPJGkBo7YJaFUqb5fDj3vsK2V
         AnchpUw2Q26XTWsOTeShjyL5ogKTiPOLXYlB1Dcj5rbhU1KK6H9r16Qfa9Ta7i3PmF7b
         TMc8lb5g5Q4cAn0bJTdfyz6Bxwo1C94hyZSRWVnWjQdHQBIkBAZ4VazAP4434MX5VR/J
         fAff3PtruV23xHSW8w3C8FSUeFsiHyl9WIQZhdAFlJ9cecaNGHbjl7NhFR5J2SkLBEUx
         dLBPPBSeaw1prUQn2N12UEeciyBRJoA0K20gBdjnCCyokviMVvXPScs7sIWs5v26CuVs
         sxjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAl7OAxVcbmEHi+7GiSvA1DZe5ZPuxwh3KSbVlp/rj90xg0NC3cE14RjmhhCatyXhWOnB/fhvhY1xELg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTWxTMexy1rfBFTsbYUSq7CyjEOOq20JbwR8OkX5Eyb06AVj6K
	QJEYmRH32c2R+w5JcU+jzfoeUuuQEIvN0tdVa5vF7YDmzGFsxznzkxAQn8+Fv6YmkBHVqdd7sFo
	sYkoo3DoQYFwK26YFnaOPThyy2liOzVF0nboM5AVntg==
X-Gm-Gg: AR+sD13Mcz4VWxYnz3x9ylGYHTqf3gk9WMx0HMh86i/g/IvZp64MfTCwLe+lGdu6n2q
	p2zLRmKD3D4cJRdJVhPMQDRQ5oa5SFkm4ICmXUyMvaN/P8N3ty57GOP7Z3SZ7WG96QOjXfkTfYA
	U866iCRrCoVUmdwxFHp+EqQFStbJpK52Xbb/Ync7+yRrdnjNyE3zLx4EvRWrLZ4yQBH+fJUIJj8
	H0odk5w2Whdnq3s/G4920GTEBUssECYkltOA2YIiJGFbVlvvp/HJ7fBUqovL3spx9JDNoGOEIn2
	jKUgBkl62WsVYr0t/gvDChS1IPg5JxWX4SROOgagKKn6EeaHO9aUhU5cXKQhxLoURvi0pkMZwkL
	9pL3wEDpyJ6iHXZle/TCNXeyV8GL/ztUANsrPXU+CIYz0xSYgRdnIPa0n0/9NwPSH
X-Received: by 2002:a5d:5f51:0:b0:47f:91eb:342 with SMTP id
 ffacd0b85a97d-47fb1e89ab3mr9574371f8f.13.1785342093792; Wed, 29 Jul 2026
 09:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260729075230.743030-1-shanbeeyoo@gmail.com> <20260729120733.829457-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-4-shanbeeyoo@gmail.com>
In-Reply-To: <20260729120733.829457-4-shanbeeyoo@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 21:51:19 +0530
X-Gm-Features: AUfX_mw18Ate4H7RNWrC9_sDszX8h_ptllZ_3py1A1MYtGllTZvUWlrvnw0-9-Y
Message-ID: <CAAhSdy0y-K3_-=_SCDwAqEiCb0PKmNHVcNDgyY+pGGF4N3gEGQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] RISC-V: KVM: Widen G-stage fault address to gpa_t
To: "Bingyu.Xian" <shanbeeyoo@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_092135_843139_43F2F0C0 
X-CRM114-Status: GOOD (  20.17  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgNTozN+KAr1BNIEJpbmd5dS5YaWFuIDxzaGFuYmVleW9v
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBmYXVsdF9hZGRyIGluIGdzdGFnZV9wYWdlX2ZhdWx0KCkg
YW5kIHRoZSBmYXVsdF9hZGRyIHBhcmFtZXRlciBvZgo+IGt2bV9yaXNjdl92Y3B1X21taW9fbG9h
ZC9zdG9yZSgpIGFyZSB1bnNpZ25lZCBsb25nLiAgT24gUlYzMiB3aXRoCj4gU3YzMng0LCBndWVz
dCBwaHlzaWNhbCBhZGRyZXNzZXMgYXJlIDM0IGJpdHMsIHNvIGEgMzItYml0IHVuc2lnbmVkCj4g
bG9uZyB0cnVuY2F0ZXMgYml0cyAzMi8zMyBhdCB0d28gcG9pbnRzOgo+Cj4gICAtIHJlY29uc3Ry
dWN0aW9uOiBmYXVsdF9hZGRyID0gKHRyYXAtPmh0dmFsIDw8IDIpIHwgLi4uIGlzIGV2YWx1YXRl
ZAo+ICAgICBpbiAzMi1iaXQgYXJpdGhtZXRpYywgZHJvcHBpbmcgYml0cyAzMi8zMyBiZWZvcmUg
d2lkZW5pbmc7Cj4gICAtIHRoZSBNTUlPIGhhbmRsZXIgY2FsbDogZXZlbiB3aXRoIHRoZSBsb2Nh
bCB3aWRlbmVkLCB0aGUgaGFuZGxlcidzCj4gICAgIHVuc2lnbmVkIGxvbmcgcGFyYW1ldGVyIG5h
cnJvd3MgaXQgYmFjayB0byAzMiBiaXRzLCBhbGlhc2luZwo+ICAgICBhY2Nlc3NlcyBhYm92ZSA0
IEdCIGludG8gdGhlIGxvdyA0IEdCLgo+Cj4gV2lkZW4gZmF1bHRfYWRkciB0byBncGFfdCBlbmQg
dG8gZW5kOiB0aGUgbG9jYWwgaW4gZ3N0YWdlX3BhZ2VfZmF1bHQoKSwKPiB0aGUgKGdwYV90KSBj
YXN0IGJlZm9yZSB0aGUgPDwyIHNoaWZ0LCBhbmQgdGhlIGZhdWx0X2FkZHIgcGFyYW1ldGVycyBv
Zgo+IGt2bV9yaXNjdl92Y3B1X21taW9fbG9hZC9zdG9yZSgpLiAgVGhlIGhhbmRsZXJzJyBpbnRl
cm5hbCB1c2VzCj4gKHJ1bi0+bW1pby5waHlzX2FkZHIgaXMgX191NjQsIGt2bV9pb19idXNfcmVh
ZC93cml0ZSgpIHRha2UgZ3BhX3QpIGFyZQo+IGFscmVhZHkgNjQtYml0LCBzbyBubyBmdXJ0aGVy
IGNoYW5nZXMgYXJlIG5lZWRlZC4KPgo+IEFsc28gaW4gcHJlcGFyYXRpb24gZm9yIHNoYXJpbmcg
YSBjb21tb24gc3RydWN0IGt2bV9wYWdlX2ZhdWx0IGFjcm9zcwo+IGFyY2hpdGVjdHVyZXMsIHdo
ZXJlIGZhdWx0X2FkZHIgaXMgZ3BhX3QuICBObyBmdW5jdGlvbmFsIGNoYW5nZSBvbiBSVjY0Lgo+
Cj4gRml4ZXM6IDlkMDVjMWZlZTgzNyAoIlJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgc3RhZ2UyIHBh
Z2UgdGFibGUgcHJvZ3JhbW1pbmciKQo+IEFzc2lzdGVkLWJ5OiBZdWFuU2hlbmc6IGRlZXBzZWVr
LXY0LXBybwo+IENvLWRldmVsb3BlZC1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5j
bj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+IFNp
Z25lZC1vZmYtYnk6IEJpbmd5dSBYaWFuIDxzaGFuYmVleW9vQGdtYWlsLmNvbT4KCkxHVE0uCgpS
ZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlz
IHBhdGNoIGZvciBMaW51eC03LjMKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdmNwdV9pbnNuLmggfCA0ICsrLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNw
dV9leGl0LmMgICAgICAgICAgICAgfCA1ICsrKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5z
bi5jICAgICAgICAgICAgIHwgNCArKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX3ZjcHVfaW5zbi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9pbnNu
LmgKPiBpbmRleCAzNTAwMTFjODM1ODEuLmE1YzUwZGQ0YTg4NCAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X2luc24uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX3ZjcHVfaW5zbi5oCj4gQEAgLTM4LDEwICszOCwxMCBAQCBpbnQga3ZtX3Jp
c2N2X3ZjcHVfdmlydHVhbF9pbnNuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9y
dW4gKnJ1biwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fY3B1
X3RyYXAgKnRyYXApOwo+Cj4gIGludCBrdm1fcmlzY3ZfdmNwdV9tbWlvX2xvYWQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBmYXVsdF9hZGRyLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ3BhX3QgZmF1bHRfYWRkciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgaHRpbnN0KTsKPiAgaW50IGt2bV9yaXNjdl92Y3B1X21taW9fc3RvcmUo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmF1bHRfYWRkciwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBncGFfdCBmYXVsdF9hZGRyLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaHRpbnN0KTsKPiAgaW50IGt2bV9yaXNjdl92Y3B1
X21taW9fcmV0dXJuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1bik7
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4IDZjODUzMGI5ZjI5ZS4uMjhjZjliMjdiYjA3IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9leGl0LmMKPiBAQCAtMTcsMTIgKzE3LDEzIEBAIHN0YXRpYyBpbnQgZ3N0YWdlX3Bh
Z2VfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICB7
Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX2dzdGFnZV9tYXBwaW5nIGhvc3RfbWFwOwo+ICAgICAgICAg
c3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdDsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcg
aHZhLCBmYXVsdF9hZGRyOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBodmE7Cj4gKyAgICAgICBn
cGFfdCBmYXVsdF9hZGRyOwo+ICAgICAgICAgYm9vbCB3cml0YWJsZTsKPiAgICAgICAgIGdmbl90
IGdmbjsKPiAgICAgICAgIGludCByZXQ7Cj4KPiAtICAgICAgIGZhdWx0X2FkZHIgPSAodHJhcC0+
aHR2YWwgPDwgMikgfCAodHJhcC0+c3R2YWwgJiAweDMpOwo+ICsgICAgICAgZmF1bHRfYWRkciA9
ICgoZ3BhX3QpdHJhcC0+aHR2YWwgPDwgMikgfCAodHJhcC0+c3R2YWwgJiAweDMpOwo+ICAgICAg
ICAgZ2ZuID0gZmF1bHRfYWRkciA+PiBQQUdFX1NISUZUOwo+ICAgICAgICAgbWVtc2xvdCA9IGdm
bl90b19tZW1zbG90KHZjcHUtPmt2bSwgZ2ZuKTsKPiAgICAgICAgIGh2YSA9IGdmbl90b19odmFf
bWVtc2xvdF9wcm90KG1lbXNsb3QsIGdmbiwgJndyaXRhYmxlKTsKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYwo+IGlu
ZGV4IGYwOWY5MjUxZDFmMC4uNjUwNjQxMWEzZjc4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfaW5zbi5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPiBAQCAt
MzcxLDcgKzM3MSw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV92aXJ0dWFsX2luc24oc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgKiBSZXR1cm5zIDwgMCB0byBy
ZXBvcnQgZmFpbHVyZSBhbmQgZXhpdCBydW4tbG9vcAo+ICAgKi8KPiAgaW50IGt2bV9yaXNjdl92
Y3B1X21taW9fbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4s
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZhdWx0X2FkZHIs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBncGFfdCBmYXVsdF9hZGRyLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBodGluc3QpCj4gIHsKPiAgICAg
ICAgIHU4IGRhdGFfYnVmWzhdOwo+IEBAIC00OTQsNyArNDk0LDcgQEAgaW50IGt2bV9yaXNjdl92
Y3B1X21taW9fbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4s
Cj4gICAqIFJldHVybnMgPCAwIHRvIHJlcG9ydCBmYWlsdXJlIGFuZCBleGl0IHJ1bi1sb29wCj4g
ICAqLwo+ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfbW1pb19zdG9yZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBmYXVsdF9hZGRyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdwYV90IGZhdWx0X2FkZHIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBodGluc3QpCj4gIHsKPiAgICAgICAgIHU4IGRhdGE4Owo+IC0tCj4gMi41NC4wCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
