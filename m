Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5A4C3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 05:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqMGlM1JExeNgib/8F3H9Ue3+VvCeQXwNhzH6gZ0cUM=; b=ewgp59nc3u+zoX
	LJfTAhfu7Ia8aQ+utSmpT5rwqwjxNF7uP5H5K+mLFg3k8FTAcADHproXWkuuZeQP5i+yZTpR7XzjF
	ReR6aGuTaWg/Et/bt8Ekn3f5JEHU1J8jpMBN6hM456z3UkwdOEtSKvIfOcR9Te7lz+HrkapUVaFdH
	kzkYeZ1dfkCF/pq9+6x4k23h29vlAXDh+SBW31Ds1rfqLMUjXgY3O1P9REmADOcLzQEMXNSOGEbHS
	0RxUxXwlEiQXS5DMSOYrEbg13pPa1jajv8KB8C7l2kHarmm2hg6iISUu6EXZVADs9U8eII3HVAQwa
	jQbpRfZ5GZae+YHVCu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDG3M-00000002V2g-32Mn;
	Fri, 09 May 2025 05:13:44 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDG3K-00000002V1Y-1Oke
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 05:13:43 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso14664901fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 22:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746767620; x=1747372420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDLCK0Uz19/Y7Q6HkSbcnfKNXhJp+XeOV0z584wVfeg=;
        b=JtRxTRIaJRe7/82G/Fou87lRBRdbGdq3pHX3kgTn6qBlYiioVUD8fXKrPm4JkxXD9S
         PhKjptS6DYXXLPAhfJ30c0naF57BFuhEk2tArY8FXfdN1DwoF3aZGGLLg+P/PGDFZT1I
         RvRtBI6qGfZBX4u5XSXF2dLt3C9T++qUzQs9bAjw+i4bJQ8fGJIFKzcthv4fuvo3jw1s
         gWXZzSBZuJut9C4DRNj1cI7ByzCB8ziYuv7UIpewP8T/kBGNOxkmV7edNsaRHD27g4fr
         KkkSLnlmOZznGKGJFXvdWyOwaGq/U1Qp9mjkE/IHUW2WI5JzoAbu5swcsV3J6F/CTt9S
         lWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746767620; x=1747372420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDLCK0Uz19/Y7Q6HkSbcnfKNXhJp+XeOV0z584wVfeg=;
        b=oEUkquhgurpi/1kgDUXTLW3NJFJP5fSTlnEiaF8qTxWC/v+VWFQ5cgm8tJv1t50XLI
         x6B04N8cBNwUWCNdR3kftLLLA+BhJj3LSn4A81XlLsZYyGJjcrNv2THPZrxNfnGbNzJl
         AU1P9PtZm7nkK9HVDqrXque+9s41hJmgD9rGScO2LS/y662IPIZ/7+gB59qkoqbdMYJ4
         QOxVhgFIhggQ/6vYI0VF5kiHJQrvaNta3fLHpeUNY4iZ0krUKXSDDLQoSJIja0IBNMW7
         XPrT7t2rxL0nWFZzgVVPQ4k4y3W6mwDimrtP8/+Sshu/KawA10l6A4avX252nhMCjzQ0
         lImw==
X-Forwarded-Encrypted: i=1; AJvYcCVeeFR9ny2LtTOKJxFPM/gbYtbGcvkmDkRTAPCc/CL6vLjy78udgdZUjJekQCeHpimE4yMnJSxzEJ68Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrVT0BHy/5n9kLj39DjqurIvPF0/qhfZvgXfG6UmvswNTi149G
	BJcTDlhh2gmd2xtz+SMKO0ndQkuXRRTufqwSLISjAz0uQF9mQFgECWy1M3Z5SnYCALzFSOzDqDM
	tNw86cqUAUS/k8nIYX3A8qNK471u/Uks2CUeRZA==
X-Gm-Gg: ASbGncvkIBnqAw0UfC85NcXgmprsjsA+3FTTYm65jm96q6DJF4xXomWrEK2acBuruOs
	AXoiVo5ERtrwwdWEeGnw23feC1eciE95Y9Cdi0+/1wTWnKCZjfegtFjlpmb27Bb4+2TzqDdPyPM
	26Lm13CBkluB8JNZyfTUU0SXQ=
X-Google-Smtp-Source: AGHT+IH932onN3LtbuDsB2zIJMZAB7zVyXn9SdYNT5bEdTdpbtKDjtpG9xMpkEjuL1jvH3p5mBmUHA70IkrkqZGMWFs=
X-Received: by 2002:a05:651c:a11:b0:31a:466a:4746 with SMTP id
 38308e7fff4ca-326c4626122mr9560221fa.28.1746767619980; Thu, 08 May 2025
 22:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com> <20250508142842.1496099-3-rkrcmar@ventanamicro.com>
In-Reply-To: <20250508142842.1496099-3-rkrcmar@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 9 May 2025 10:43:28 +0530
X-Gm-Features: ATxdqUEv61ChnZUOzx7yPdXINdl80n6Z4DSE8-_2d7Qt3jd-BEsqt9upnD2bVHQ
Message-ID: <CAK9=C2XpNMmYu_MxcA390+SBm5fMSXYYJ37JeYGHa8OHjWmYqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: RISC-V: reset smstateen in a better place
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_221342_376650_7ECB40F8 
X-CRM114-Status: GOOD (  14.80  )
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

T24gVGh1LCBNYXkgOCwgMjAyNSBhdCA4OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhpcyBnb3QgbWlzc2VkIHdoZW4gdGhlIHNl
cmllcyB3YXMgYXBwbGllZCBvdXQgb2Ygb3JkZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYWRpbSBL
csSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiBGZWVsIGZyZWUgdG8g
c3F1YXNoIHRoaXMgcGF0Y2ggd2l0aCAzNzZlM2MwZjhhYTUgKCJLVk06IFJJU0MtVjogcmVtb3Zl
Cj4gdW5uZWNlc3NhcnkgU0JJIHJlc2V0IHN0YXRlIikuCgpJIGhhdmUgc3F1YXNoZWQgdGhpcyBw
YXRjaCBpbnRvIGNvbW1pdCAzNzZlM2MwZjhhYTUKClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBpbmRleCA3Y2MwNzk2OTk5ZWIuLmE3OGY5ZWMy
ZmEwZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1LmMKPiBAQCAtNjAsNiArNjAsNyBAQCBzdGF0aWMgdm9pZCBrdm1fcmlzY3Zf
dmNwdV9jb250ZXh0X3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAgbWVt
c2V0KGNudHgsIDAsIHNpemVvZigqY250eCkpOwo+ICAgICAgICAgbWVtc2V0KGNzciwgMCwgc2l6
ZW9mKCpjc3IpKTsKPiArICAgICAgIG1lbXNldCgmdmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyLCAw
LCBzaXplb2YodmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyKSk7Cj4KPiAgICAgICAgIC8qIFJlc3Rv
cmUgZGF0YXAgYXMgaXQncyBub3QgYSBwYXJ0IG9mIHRoZSBndWVzdCBjb250ZXh0LiAqLwo+ICAg
ICAgICAgY250eC0+dmVjdG9yLmRhdGFwID0gdmVjdG9yX2RhdGFwOwo+IEBAIC0xMDEsOCArMTAy
LDYgQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3Jlc2V0X3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQo+Cj4gICAgICAgICBrdm1fcmlzY3ZfdmNwdV9jb250ZXh0X3Jlc2V0KHZjcHUpOwo+Cj4g
LSAgICAgICBtZW1zZXQoJnZjcHUtPmFyY2guc21zdGF0ZWVuX2NzciwgMCwgc2l6ZW9mKHZjcHUt
PmFyY2guc21zdGF0ZWVuX2NzcikpOwo+IC0KPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X2ZwX3Jl
c2V0KHZjcHUpOwo+Cj4gICAgICAgICBrdm1fcmlzY3ZfdmNwdV92ZWN0b3JfcmVzZXQodmNwdSk7
Cj4gLS0KPiAyLjQ5LjAKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
