Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C30D0E3F7
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 19:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EV/dXBijyF5CXmvFoCGghpUV1N0SMmM8GByjFUD04lU=; b=tr+r0DuE7j5BBW
	m6Z36hWQI3tB4fPyUafR1sDgmxt5LwfBXDs6qBq2lP/CuuI/dCN9CTMQGIz9rr978xivbk2gDx4de
	mVduT6K1W3TGZjIptqwCmiORmib3gY5C0+vcieFEkSgC1kYvN+iHf9lqhnEMx+Vdosn8A5cLU8JA+
	nNL7jLvmUMHqzHzK7cmlssDOi/TSEppid/ib4eo23SxQe/M11jr3evuPqWRutwJyO+mCX+x3g8pjV
	Qf4dZI/8FEs0JoVwYIDIqT/mjoFvm2l+cTEeEEnUqkp3uRqmNpTchUGGOlhqH6tHbxq8kEWgd60j2
	63JLblbO0wk2dSR2KDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t43nL-00000001ddm-3JMo;
	Thu, 24 Oct 2024 19:46:55 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t43KT-00000001ZOZ-011g
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 19:17:06 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3a4d8e55af2so4984075ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2024 12:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1729797423; x=1730402223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMVuNP7DptisRZKMAE62XcZxOQ0ITSLxzIbBe9rphWg=;
        b=Z0SnBu/ADb2qqpRkfUqhRQLm8DiqfNYq75ub4l8MOjGu6ED87kI8HyldO/ep74t3vM
         5z7vELSg6NzXMTghJ+pVMXoGRjFH3qAxqgx3FdJJqQGtNpxIzahbmwAZH+IfJ0sEU6In
         UbA9UkjkF9olv4NKIj8jaWvKM2qK53vx6snvlJu/DOJAO9L//t554SMc0OfNxWLfJDU2
         2YD5XJqT6H87TlqaN834Hj8gb+sHuNa89vsVQxs0xALkB+xp1F+AvsGSaEpuivhtbpjQ
         FQRTFoinhfVEZCBzvMUBfUu6PQsx3ZjtjQghBeT7LQvDf/OGCmZQ0X3GBRhpC7GmCVIu
         noiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729797423; x=1730402223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMVuNP7DptisRZKMAE62XcZxOQ0ITSLxzIbBe9rphWg=;
        b=EbhBF+tRxgssfNVCIfHSNzpi/t1LvTr7irGfARyYphaKbdfxBCw8ixJkLS8HhNuMZN
         IIWtl5ZituWD9hj8uGZJB0xUJmSpCna2H8zXDxGo6PTp+Fi4yKVfUi+QZ3b3pbhLTpp+
         +l7xliTaQjjNMLuglsIYFFEJ93hFyltOH9c1TwxbUYS85oYXsWakNCj4Xr8Jb35a1Fkh
         dgvhtehNBV0Gejz5wnKbk2FYf9oUhRxJEbjALM4oPfoMxVGW2+CYJ5zeKCzMTgAJqLLJ
         fbQ+frIXehyC7uWl4eifsNl7T9G3AYGpzkrNFNgg1T0R97EePO20Db/uWxupgBO4w3fO
         mRvA==
X-Forwarded-Encrypted: i=1; AJvYcCWeyTC3E729b9ei+BJSSOWYfuE4tmcusXXe3noS2GkbCS1s9/rUx3Nl2jgHEs+fC2UNUgzbpUWKtaNY6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSEbf6f351DIs7Cw2nsAadffeZJl+eSRb/pelK7AjKT2Oyix38
	8Yp8bI0nTNilb+HXQBRWWA6puXBbsafkCIi1TlZ0yEVAiWXhck8FyMedBjF6uGdtEwaFIsReaS4
	FUski00QeSqrPX99wMb+HuldGaDQVdFkeeKpLFw==
X-Google-Smtp-Source: AGHT+IFZzEb2zN7h96lApR8DYauv53XlH5oPpoX1QtB4zj0x/HOggQdCeZlKWS+cP9VVlhcXp5Qae/4W4hrCmVnyZps=
X-Received: by 2002:a05:6e02:1564:b0:3a0:c15f:7577 with SMTP id
 e9e14a558f8ab-3a4d5945f99mr81465345ab.9.1729797423093; Thu, 24 Oct 2024
 12:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240927-dev-maxh-svukte-rebase-2-v2-0-9afe57c33aee@sifive.com> <20240927-dev-maxh-svukte-rebase-2-v2-3-9afe57c33aee@sifive.com>
In-Reply-To: <20240927-dev-maxh-svukte-rebase-2-v2-3-9afe57c33aee@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Oct 2024 00:46:51 +0530
Message-ID: <CAAhSdy0ncLTAjEE1s-GWL95sscxwQFsKn1rXyA1_VVfk1bQBiw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] riscv: KVM: Add Svukte extension support for Guest/VM
To: Max Hsu <max.hsu@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@sifive.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_121705_301028_66F5A01E 
X-CRM114-Status: GOOD (  15.37  )
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

T24gRnJpLCBTZXAgMjcsIDIwMjQgYXQgNzoxMuKAr1BNIE1heCBIc3UgPG1heC5oc3VAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBBZGQgS1ZNIElTQSBleHRlbnNpb24gT05FX1JFRyBpbnRlcmZhY2Ug
dG8gYWxsb3cgVk1NIHRvb2xzIHRvCj4gZGV0ZWN0IGFuZCBlbmFibGUgU3Z1a3RlIGV4dGVuc2lv
biBmb3IgR3Vlc3QvVk0uCj4KPiBSZXZpZXdlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWF4IEhzdSA8bWF4LmhzdUBzaWZp
dmUuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAxICsK
PiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgIHwgMSArCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5k
ZXggZTk3ZGIzMjk2NDU2ZTE5Zjc5Y2EwMmU0YzRmNzBhZTFiNGFiYjQ4Yi4uNDFiNDY2YjdmZmFl
YzQyMWU4Mzg5ZDNmNWIxNzg1ODAwOTFhMmM5OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
a3ZtLmgKPiBAQCAtMTc1LDYgKzE3NSw3IEBAIGVudW0gS1ZNX1JJU0NWX0lTQV9FWFRfSUQgewo+
ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkNGLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9F
WFRfWkNNT1AsCj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aQVdSUywKPiArICAgICAgIEtW
TV9SSVNDVl9JU0FfRVhUX1NWVUtURSwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX01BWCwK
PiAgfTsKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IGluZGV4IGIzMTljNGMxM2M1NGNlMjJkMmE3NTUy
ZjRjOWYyNTZhMGM1MDc4MGUuLjY3MjM3ZDZlNTM4ODJhOWZjZDJjZjI2NWFhMTcwNGYyNWNjNGE3
MDEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiBAQCAtNDEsNiArNDEsNyBAQCBzdGF0aWMgY29u
c3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9hcnJbXSA9IHsKPiAgICAgICAgIEtWTV9JU0Ff
RVhUX0FSUihTVklOVkFMKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVk5BUE9UKSwKPiAg
ICAgICAgIEtWTV9JU0FfRVhUX0FSUihTVlBCTVQpLAo+ICsgICAgICAgS1ZNX0lTQV9FWFRfQVJS
KFNWVUtURSksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkFDQVMpLAo+ICAgICAgICAgS1ZN
X0lTQV9FWFRfQVJSKFpBV1JTKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQkEpLAoKVGhl
IEtWTV9SSVNDVl9JU0FfRVhUX1NWVUtURSBzaG91bGQgYmUgYWRkZWQgdG8gdGhlCnN3aXRjaC1j
YXNlIGluIGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQoKSBiZWNhdXNlCmh5cGVy
dmlzb3Igc2VlbXMgdG8gaGF2ZSBubyB3YXkgdG8gZGlzYWJsZSBTdnVrdGUgZm9yIHRoZSBHdWVz
dAp3aGVuIGl0J3MgYXZhaWxhYmxlIG9uIHRoZSBIb3N0LgoKUmVnYXJkcywKQW51cAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
