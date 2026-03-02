Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A038D58E79
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 07:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNwjXoDvqH2z8mXzcJU5B4pn0cv/M8cIuM1ENXKyY+k=; b=l3goF6NsksFpbw
	Qf0HwyF3QTJ61PSZjbaixFBRmmjucMM7MzFqfUl5i+Q5dFiqm8PziKH1od4qHGNjDCn8Js7vl6j10
	LAGqFJ71wZ+AVIYjWBEblMyomJmGYMMfryLJpXBZta44X1Zl/jNxC4JYrmw6r5lE1Y7su2fXMCAZN
	1BOrPxrePNeufyunoCzbR5nvIaliPE8GwUmwMJ0NUAUMEkgTqhkSvdIwLzyso6epc8gLr2JJfqzku
	v7TQAU06ZtnvI/qmKR+HsgGkrFknnFrCL+/a6OgGx7zYnSoM/VzTwlya5LT/2I7HltXizLMWJCySU
	A2RnVBU1hOTs8q5ERb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwy9U-0000000CRi6-1dQK;
	Mon, 02 Mar 2026 07:57:16 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwy9R-0000000CRhG-0wqe
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 07:57:15 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-45f09874c4cso3088130b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 01 Mar 2026 23:57:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772438232; cv=none;
        d=google.com; s=arc-20240605;
        b=hhGcm4hNhmGUJ1XYAAIRF6Iqk+7ZA0y9EFrvki2a0LUektAAH49fdRG4x9jrWhI7GO
         Eq5fHngLZ4ge/0bQm/5csgdmKS7gx58BZM0Xuwyq1FS9aHIp0lSD5p5XPEKxiJtaNWg+
         vcMEQOMcgpykjifWql4fG8CJkC9AStvbBJa0FK6M0Y+PTgjtXLdrCuVScbwtT+oJyB72
         pK/8RNV1lBaPOWnvWF7Yar4J6wJNd4aWgivpYPSNBlfxG29BY3IA2uJCf1N3xu+WX+iG
         G29KjrYmuELg3aYU739xgVLF5qZ2KL3kZwCWp7KLfJnumoe6TJ3StmukkhBFB4JhI3qj
         ec2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sYw7BzIszduQmcIAASuAjoew5S5p7hWuqNEaXkq1rV0=;
        fh=ufBSwlETvp+B10Uptkp340n55lenStj3g/BbEVZh9do=;
        b=C+yCDc4SeCRcZEsoxfqU/3x4FFsAVssgvUBB/s4KILEYQNSENCWpf0c4KJEfusFbsf
         mWB06y6NzeYn17nm6zSP8y+3bsXqqmdxIEAqi1THQKV7yk5v7U8B9bh+0G/xxgIVA+7T
         53g9f10WItEyWAo5b16JCAvOneRu51dd8sEibcQHzEIWB9y/HfGzCpgslWypLjWZUekl
         8FjqrbL5uYaXKB1p25RSsTyd0K3vrzTKHskwlw2HffRsGX7Y7+7JuZ5IQ1erNZMFwifj
         DtDoDigxWJolmsZXvFliiHtefKhSTuwWFNIhTv/ooXG76gYr9CLxDMVUy427BmUlVssa
         P7IA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772438232; x=1773043032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYw7BzIszduQmcIAASuAjoew5S5p7hWuqNEaXkq1rV0=;
        b=wehS1ZPsj85pGpmpk7t7OdH5ZhJCOYVbK7pzIcMxhlb6SlLa6dMBviJ+Z9lGQvZr73
         vtAtiXklFPUC5HK27CLnmP3NQam4OTXSOnOWJ7V6oEesW2sXfPoJPTh7640n5iS1TjyN
         +JYeFQTD+lThx+rL3UbAEwMokTl1pNb6M7PjZ6KDvupHWGgmBiPG1Vq/UVuCoVhTv+Nd
         14HrPujDiRetmOxpkk5XaZUQwUnb1UKFroz65v3It8mLGZTD9j3Sjj8F2VXfrRdfE/yX
         JbfZEVzkC0gY4SycLZhLvoDu+tVszDUbZtalJBmHvnlo8zuDoUMptUAeU8yH7FR+YrvN
         6LAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772438232; x=1773043032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sYw7BzIszduQmcIAASuAjoew5S5p7hWuqNEaXkq1rV0=;
        b=hWdg5foFTUAmUe/mJBSZZNOYb+29TiFhEVQusFLlmt5EGinUy73bu2zt/+Js2FAucr
         wfNjXOCRo5DXoQcakT0WLBlNo4I9NJaQD50yvstm7d/g+VKe+39KUCHRiejXwWlmmGEw
         lUogIp7gZbNlgaszi7sPrOs6Or9MRGPgjHpC6uksimNWbRvuSdeCKK2Qi8j5JhhoS6xO
         /EPgwgRSSYgDNDtG/IGALgBm2VP46l1db5ZIkqBHcNNT2X+EJOalOi3Cn+TSLjFAMRZZ
         +ECqZdqXxLK8e6FltTIjJHXK9brAab+qWtG8WmCG3DVjAihXD1JH1tFFJVX1YneTnVeu
         9how==
X-Forwarded-Encrypted: i=1; AJvYcCVv5zLnS7ajYgQe5m9R5uHHSXAjnFwRIcrkq3cJPmG9HKkYbZZ/mvesdENAq5pcVfbc0Lvbe46mFzG9YA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXeq0IXvP4kmju9jlr7RL/dmpO9JkTLqE8KoPOo82ePJHpOaQ5
	kjLkHrYm+nY//H57QmjVce21gvHD2hHR59AenD0l0s5HmiDIR7aX1/otn70cIvfu4s3kiRBCt1D
	XKsEjNGa/w/9ctA91kr+i3Q5FbU3kEUBTBW9AagPqXQ==
X-Gm-Gg: ATEYQzwMDSnxAxbct/KvF0QJxbnYvboyNuW7462LM0Foa6t926V9sJjGPlAa+BILuUK
	P0Ed1vSpOJlZHFFWOCAmmKefjHWbXhvB6lEDvUBSNhzHyEYXi6+h+QFOZrFk0VO/IQffUo3jITg
	otdFOjPIRigtm5FV4NauFjlLFZvepY0Sk0Dk32Rc5scUax24nIbQ4aO3xzYXeeuo5NBw3hQDSAp
	gOlP9ulKzGJM8TYMsf7C+F+/JnHiuaAubbldzVaqMSG8t1IQZdn3GcL9pobwfZLjbwAQ8BuTML+
	yJyEqyWTupTFUvn2bPNA0zZofgSPZMfXPd6Z8JvkW6gYDUJN4EqtjXcVwEa2gME87hdyKN56gvv
	+7np3tvzjfiyyG7yMNRdylEyYFgo=
X-Received: by 2002:a05:6820:2083:b0:663:f65:1c92 with SMTP id
 006d021491bc7-679faef9814mr7063277eaf.49.1772438231609; Sun, 01 Mar 2026
 23:57:11 -0800 (PST)
MIME-Version: 1.0
References: <20260224104438.57727-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260224104438.57727-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Mar 2026 13:27:00 +0530
X-Gm-Features: AaiRm50pyr6g5dnPfdIYyaLubJSF_te9LsJuAngs7UB_FiwXT0ux5z9Q5yJiHLM
Message-ID: <CAAhSdy38=Ho1H21AboHyN3AgqskRxqrPfrzP-uJmv80QjBPRrg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix use-after-free in kvm_riscv_aia_aplic_has_attr()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_235713_385918_917F3324 
X-CRM114-Status: GOOD (  28.02  )
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

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgNDoxNOKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEZ1enplciByZXBvcnRzIGEgS0FTQU4gdXNlLWFmdGVy
LWZyZWUgYnVnIHRyaWdnZXJlZCBieSBhIHJhY2UKPiBiZXR3ZWVuIEtWTV9IQVNfREVWSUNFX0FU
VFIgYW5kIEtWTV9TRVRfREVWSUNFX0FUVFIgaW9jdGxzIG9uIHRoZSBBSUEKPiBkZXZpY2UuIFRo
ZSByb290IGNhdXNlIGlzIHRoYXQgYWlhX2hhc19hdHRyKCkgaW52b2tlcwo+IGt2bV9yaXNjdl9h
aWFfYXBsaWNfaGFzX2F0dHIoKSB3aXRob3V0IGhvbGRpbmcgZGV2LT5rdm0tPmxvY2ssIHdoaWxl
Cj4gYSBjb25jdXJyZW50IGFpYV9zZXRfYXR0cigpIG1heSBjYWxsIGFpYV9pbml0KCkgdW5kZXIg
dGhhdCBsb2NrLiBXaGVuCj4gYWlhX2luaXQoKSBmYWlscyBhZnRlciBrdm1fcmlzY3ZfYWlhX2Fw
bGljX2luaXQoKSBoYXMgc3VjY2VlZGVkLCBpdAo+IGNhbGxzIGt2bV9yaXNjdl9haWFfYXBsaWNf
Y2xlYW51cCgpIGluIGl0cyBmYWlsX2NsZWFudXBfaW1zaWNzIHBhdGgsCj4gd2hpY2ggZnJlZXMg
Ym90aCBhcGxpY19zdGF0ZSBhbmQgYXBsaWNfc3RhdGUtPmlycXMuIFRoZSBjb25jdXJyZW50Cj4g
aGFzX2F0dHIgcGF0aCBjYW4gdGhlbiBkZXJlZmVyZW5jZSB0aGUgZnJlZWQgYXBsaWMtPmlycXMg
aW4KPiBhcGxpY19yZWFkX3BlbmRpbmcoKToKPiAgICAgICAgIGlycWQgPSAmYXBsaWMtPmlycXNb
aXJxXTsgICAvKiBVQUYgaGVyZSAqLwo+Cj4gS0FTQU4gcmVwb3J0Ogo+ICBCVUc6IEtBU0FOOiBz
bGFiLXVzZS1hZnRlci1mcmVlIGluIGFwbGljX3JlYWRfcGVuZGluZwo+ICAgICAgICAgICAgICBh
cmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzoxMTkgW2lubGluZV0KPiAgQlVHOiBLQVNBTjogc2xh
Yi11c2UtYWZ0ZXItZnJlZSBpbiBhcGxpY19yZWFkX3BlbmRpbmdfd29yZAo+ICAgICAgICAgICAg
ICBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzozNTEgW2lubGluZV0KPiAgQlVHOiBLQVNBTjog
c2xhYi11c2UtYWZ0ZXItZnJlZSBpbiBhcGxpY19tbWlvX3JlYWRfb2Zmc2V0Cj4gICAgICAgICAg
ICAgIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjQwNgo+ICBSZWFkIG9mIHNpemUgOCBhdCBh
ZGRyIGZmNjAwMDAwYmE5NjVkNTggYnkgdGFzayA5NDk4Cj4gIENhbGwgVHJhY2U6Cj4gICBhcGxp
Y19yZWFkX3BlbmRpbmcgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmM6MTE5IFtpbmxpbmVdCj4g
ICBhcGxpY19yZWFkX3BlbmRpbmdfd29yZCBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzozNTEg
W2lubGluZV0KPiAgIGFwbGljX21taW9fcmVhZF9vZmZzZXQgYXJjaC9yaXNjdi9rdm0vYWlhX2Fw
bGljLmM6NDA2Cj4gICBrdm1fcmlzY3ZfYWlhX2FwbGljX2hhc19hdHRyIGFyY2gvcmlzY3Yva3Zt
L2FpYV9hcGxpYy5jOjU2Ngo+ICAgYWlhX2hhc19hdHRyIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZp
Y2UuYzo0NjkKPiAgYWxsb2NhdGVkIGJ5IHRhc2sgOTQ3MzoKPiAgIGt2bV9yaXNjdl9haWFfYXBs
aWNfaW5pdCBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzo1ODMKPiAgIGFpYV9pbml0IGFyY2gv
cmlzY3Yva3ZtL2FpYV9kZXZpY2UuYzoyNDggW2lubGluZV0KPiAgIGFpYV9zZXRfYXR0ciBhcmNo
L3Jpc2N2L2t2bS9haWFfZGV2aWNlLmM6MzM0Cj4gIGZyZWVkIGJ5IHRhc2sgOTQ3MzoKPiAgIGt2
bV9yaXNjdl9haWFfYXBsaWNfY2xlYW51cCBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzo2NDQK
PiAgIGFpYV9pbml0IGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYzoyOTIgW2lubGluZV0KPiAg
IGFpYV9zZXRfYXR0ciBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmM6MzM0Cj4KPiBUaGUgcGF0
Y2ggcmVwbGFjZXMgdGhlIGFjdHVhbCBNTUlPIHJlYWQgaW4ga3ZtX3Jpc2N2X2FpYV9hcGxpY19o
YXNfYXR0cigpCj4gd2l0aCBhIG5ldyBhcGxpY19tbWlvX2hhc19vZmZzZXQoKSB0aGF0IG9ubHkg
dmFsaWRhdGVzIHdoZXRoZXIgdGhlIGdpdmVuCj4gb2Zmc2V0IGZhbGxzIHdpdGhpbiBhIGtub3du
IEFQTElDIHJlZ2lvbiwgd2l0aG91dCB0b3VjaGluZyBhbnkKPiBkeW5hbWljYWxseSBhbGxvY2F0
ZWQgc3RhdGUuIFRoaXMgaXMgY29uc2lzdGVudCB3aXRoIHRoZSBLVk0gQVBJCj4gZG9jdW1lbnRh
dGlvbiBmb3IgS1ZNX0hBU19ERVZJQ0VfQVRUUjoKPiAgICJUZXN0cyB3aGV0aGVyIGEgZGV2aWNl
IHN1cHBvcnRzIGEgcGFydGljdWxhciBhdHRyaWJ1dGUuIEEgc3VjY2Vzc2Z1bAo+ICAgIHJldHVy
biBpbmRpY2F0ZXMgdGhlIGF0dHJpYnV0ZSBpcyBpbXBsZW1lbnRlZC4gSXQgZG9lcyBub3QgbmVj
ZXNzYXJpbHkKPiAgICBpbmRpY2F0ZSB0aGF0IHRoZSBhdHRyaWJ1dGUgY2FuIGJlIHJlYWQgb3Ig
d3JpdHRlbiBpbiB0aGUgZGV2aWNlJ3MKPiAgICBjdXJyZW50IHN0YXRlLiIKClRoaXMgaXMgbm90
IGEgaGFyZCByZXF1aXJlbWVudC4KCj4gVGhlIHVwcGVyIGJvdW5kcyBvZiBlYWNoIHJlZ2lvbiBh
cmUgdGFrZW4gZGlyZWN0bHkgZnJvbSB0aGUKPiBSSVNDLVYgQUlBIHNwZWNpZmljYXRpb24sIHNv
IHRoZSBjaGVjayBpcyBpbmRlcGVuZGVudCBvZiB0aGUgcnVudGltZQo+IHZhbHVlcyBvZiBucl9p
cnFzIGFuZCBucl93b3Jkcy4KPgo+IFRoaXMgcGF0Y2ggYm90aCBmaXhlcyB0aGUgdXNlLWFmdGVy
LWZyZWUgYW5kIG1ha2VzIHRoZSBoYXNfYXR0cgo+IGltcGxlbWVudGF0aW9uIHNlbWFudGljYWxs
eSBjb3JyZWN0Lgo+Cj4gRml4ZXM6IDI4OWEwMDdiOThiMDZkICgiUklTQy1WOiBLVk06IEV4cG9z
ZSBBUExJQyByZWdpc3RlcnMgYXMgYXR0cmlidXRlcyBvZiBBSUEgaXJxY2hpcCIpCj4gU2lnbmVk
LW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFudXRAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2t2bS9haWFfYXBsaWMuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFf
YXBsaWMuYwo+IGluZGV4IGY1OWQxYzBjOGM0M2EuLjVlN2ExMDU1YjJkZTYgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFf
YXBsaWMuYwo+IEBAIC01MjcsNiArNTI3LDMxIEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX2lvX2Rldmlj
ZV9vcHMgYXBsaWNfaW9kb2V2X29wcyA9IHsKPiAgICAgICAgIC53cml0ZSA9IGFwbGljX21taW9f
d3JpdGUsCj4gIH07Cj4KPiArc3RhdGljIGludCBhcGxpY19tbWlvX2hhc19vZmZzZXQoc3RydWN0
IGt2bSAqa3ZtLCBncGFfdCBvZmYpCj4gK3sKPiArICAgICAgIGlmICgob2ZmICYgMHgzKSAhPSAw
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gKwo+ICsgICAgICAgaWYg
KChvZmYgPT0gQVBMSUNfRE9NQUlOQ0ZHKSB8fAo+ICsgICAgICAgICAgICAgICAob2ZmID49IEFQ
TElDX1NPVVJDRUNGR19CQVNFICYmIG9mZiA8IChBUExJQ19TT1VSQ0VDRkdfQkFTRSArIDEwMjMg
KiA0KSkgfHwKPiArICAgICAgICAgICAgICAgKG9mZiA+PSBBUExJQ19TRVRJUF9CQVNFICYmIG9m
ZiA8IChBUExJQ19TRVRJUF9CQVNFICsgMzIgKiA0KSkgfHwKPiArICAgICAgICAgICAgICAgKG9m
ZiA9PSBBUExJQ19TRVRJUE5VTSkgfHwKPiArICAgICAgICAgICAgICAgKG9mZiA+PSBBUExJQ19D
TFJJUF9CQVNFICYmIG9mZiA8IChBUExJQ19DTFJJUF9CQVNFICsgMzIgKiA0KSkgfHwKPiArICAg
ICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19DTFJJUE5VTSkgfHwKPiArICAgICAgICAgICAgICAg
KG9mZiA+PSBBUExJQ19TRVRJRV9CQVNFICYmIG9mZiA8IChBUExJQ19TRVRJRV9CQVNFICsgMzIg
KiA0KSkgfHwKPiArICAgICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19TRVRJRU5VTSkgfHwKPiAr
ICAgICAgICAgICAgICAgKG9mZiA+PSBBUExJQ19DTFJJRV9CQVNFICYmIG9mZiA8IChBUExJQ19D
TFJJRV9CQVNFICsgMzIgKiA0KSkgfHwKPiArICAgICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19D
TFJJRU5VTSkgfHwKPiArICAgICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19TRVRJUE5VTV9MRSkg
fHwKPiArICAgICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19TRVRJUE5VTV9CRSkgfHwKPiArICAg
ICAgICAgICAgICAgKG9mZiA9PSBBUExJQ19HRU5NU0kpIHx8Cj4gKyAgICAgICAgICAgICAgIChv
ZmYgPj0gQVBMSUNfVEFSR0VUX0JBU0UgJiYgb2ZmIDwgKEFQTElDX1RBUkdFVF9CQVNFICsgMTIw
MyAqIDQpKQo+ICsgICAgICAgKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArICAgICAg
IGVsc2UKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gK30KPiArCgpUaGlzIGlz
IGNoYW5naW5nIHRoZSBmdW5jdGlvbmFsIGJlaGF2aW9yIG9mIEtWTV9IQVNfREVWSUNFX0FUVFIK
Zm9yIEFQTElDIGJlY2F1c2Ugbm93IEtWTV9IQVNfREVWSUNFX0FUVFIgd2lsbCByZXR1cm4gMCBl
dmVuCmZvciBub24tZXhpc3RlbnQgQVBMSUMgcmVnaXN0ZXJzLgoKSW5zdGVhZCwgdGhlIGNvcnJl
Y3QgZml4IGlzIHRvIGp1c3QgdGFrZSBkZXYtPmt2bS0+bG9jayBpbiBhaWFfaGFzX2F0dHIoKQpq
dXN0IGxpa2UgYWlhX2dldF9hdHRyKCkgYW5kIGFpYV9wdXRfYXR0cigpLgoKPiAgaW50IGt2bV9y
aXNjdl9haWFfYXBsaWNfc2V0X2F0dHIoc3RydWN0IGt2bSAqa3ZtLCB1bnNpZ25lZCBsb25nIHR5
cGUsIHUzMiB2KQo+ICB7Cj4gICAgICAgICBpbnQgcmM7Cj4gQEAgLTU1OCwxMiArNTgzLDExIEBA
IGludCBrdm1fcmlzY3ZfYWlhX2FwbGljX2dldF9hdHRyKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWdu
ZWQgbG9uZyB0eXBlLCB1MzIgKnYpCj4gIGludCBrdm1fcmlzY3ZfYWlhX2FwbGljX2hhc19hdHRy
KHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlKQo+ICB7Cj4gICAgICAgICBpbnQg
cmM7Cj4gLSAgICAgICB1MzIgdmFsOwo+Cj4gICAgICAgICBpZiAoIWt2bS0+YXJjaC5haWEuYXBs
aWNfc3RhdGUpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+Cj4gLSAgICAgICBy
YyA9IGFwbGljX21taW9fcmVhZF9vZmZzZXQoa3ZtLCB0eXBlLCAmdmFsKTsKPiArICAgICAgIHJj
ID0gYXBsaWNfbW1pb19oYXNfb2Zmc2V0KGt2bSwgdHlwZSk7Cj4gICAgICAgICBpZiAocmMpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiByYzsKPgo+IC0tCj4gMi4zNC4xCj4KClJlZ2FyZHMsCkFu
dXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
