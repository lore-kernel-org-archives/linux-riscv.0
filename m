Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C94BC48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6VnF3BIq5dBHYs9Fdqz9e3dYRmzCOT++3XsPP860KA=; b=becTBcStcZN7vJ
	vs27Tk3PBNImrR2XElrdYgXN/L88ZbEJRwTZuULaCRXU5HMmgM4/5832Jj4BICjgx5+rfGl3S3R+Y
	+4E0+lPautQre/jJ/UNnsJ1mHR1+8KKUy23FczkqVzyd1W91sKAlDjxIIuC/pzV7mLapbagU59AkH
	XkXjZwF9G+tj0GFZz2Uf7islz+ZuEgY2yb1JgfQaA1qSC/vGYuCedIfoVfKbWN9El7V8cZADOLNXQ
	AGUTwtfg+oGt38YuWj969Khj8J/UKcLtnkvZh0a4DaUVwa62FkCj3VeBd/ry4j10jfrzih31wkzvS
	/nAzFBE6nKgxFOI5Af8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raJBE-0000000DlPQ-2Ms4;
	Wed, 14 Feb 2024 17:36:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raJBC-0000000DlOq-1KJT
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 17:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707932177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GcHMMWy+FZF1FwbsgoWJxHZU4oMtx7MWWdSce+ajXI=;
	b=bk9rclME/BaM+USXqCL4j/wpkpZbk9wy1CY26PH6sWWxqvvMEbo6B8Ck8vt6gGj99VI609
	Ju4oGAZKNy6M3N1Kj4Xik12c/56EzjPu+WE7ji2GidZAPPiZ+bQlRuMOzV71aUFYyci1d7
	S1kTc4bqkGjsYn3n4NwbmczMrtJeSyg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-mpD0L2-wOBS8iA9kvrutqw-1; Wed, 14 Feb 2024 12:36:11 -0500
X-MC-Unique: mpD0L2-wOBS8iA9kvrutqw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33ce2ba4ee6so486713f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 09:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707932170; x=1708536970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GcHMMWy+FZF1FwbsgoWJxHZU4oMtx7MWWdSce+ajXI=;
        b=O7DtdXeda9vMf8iEpm+IdvuZr5lH7FpwHbj3SFAg9srXaoxttYGRPTqIxfYj9Hq7Wb
         JGWMAvPP8mRIL50b45bDr31NeWICyImqfYKHysNjyNThTGGeAtgDeZrHguj1Evd1Jeid
         9M3jE3f4a3gvDh0Xca8KqMWLcL94Jjd8nZISqZVId52g5ZS5jSA19PCP/Un4jMj8xixw
         U7CG9OS3/J3xp98ZvFn9ot0rNruKpXofx2njGBYqJ/y3q5ROHQiVrsfYr/fLMByD1qvb
         CnBsbW2s7OMz/HvQL49HFNTBvLQRlZ3ryepEyekbVcLOqnEGPCHQv+BSfhHfJ5IEs1j4
         sTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFcjScia1e2Z9D5KWHc9q2HvOZ8DAZSjPos/FTTCdHPVhHAF6CiVy+rJl/8/g/otjJPTni8u4F5bn3OJjGDNL/OjO8RAimcACsfv+pqh3w
X-Gm-Message-State: AOJu0YxIxsYCtlBZdwaldnMwaTwXiSLtyW7ctt+LqTSacXnH4kFCN28B
	5eoP1vav2zS3WOMjcT7vqZeBYNXhcC5FlyEMI1TBsT3XBqjziY/aUWMH9Or7cUpxZ8Gdq1OHgvA
	KKZinFPnn89I0mp4jI0x1UJTjlIHSkhxNErrw88nMGQXagvm9wfXlte9pduFC99+jo0OUmpz28P
	VzZBnFGRsuOtQPOY12DdgYB2uP0fdnjAqTSRFRJfkZ
X-Received: by 2002:adf:ef43:0:b0:33c:e365:dfaa with SMTP id c3-20020adfef43000000b0033ce365dfaamr2503463wrp.3.1707932170353;
        Wed, 14 Feb 2024 09:36:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFZOhzVtUAb05AYTKuZO41g2mr2YF2D8O/7ofLzT6isxa88O5eZzk0s55C3wmXmWoc3MFv5ywXwSxLAb/77Kw=
X-Received: by 2002:adf:ef43:0:b0:33c:e365:dfaa with SMTP id
 c3-20020adfef43000000b0033ce365dfaamr2503445wrp.3.1707932170085; Wed, 14 Feb
 2024 09:36:10 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy3TXDCnA+hqJyNq3CiJD9LTtL_OOqX0N=GqScL1VU8FeQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3TXDCnA+hqJyNq3CiJD9LTtL_OOqX0N=GqScL1VU8FeQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 14 Feb 2024 18:35:58 +0100
Message-ID: <CABgObfZXYLTnaK3b24Uui2nMMrZGXgpCU8KaRM=rjC32vLGJKg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.8, take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_093618_436806_4D0554E2 
X-CRM114-Status: GOOD (  11.62  )
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

T24gRnJpLCBGZWIgOSwgMjAyNCBhdCAxMjo1N+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRocmVlIGZpeGVzIGZv
ciA2Ljggd2hpY2ggYWRkcmVzcyBzdGVhbC10aW1lCj4gcmVsYXRlZCBzcGFyc2Ugd2FybmluZ3Mu
Cj4KPiBQbGVhc2UgcHVsbC4KPgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4gVGhlIGZvbGxvd2luZyBj
aGFuZ2VzIHNpbmNlIGNvbW1pdCA1NGJlNmM2YzVhZThlMGQ5M2E2YzQ2NDFjYjc1MjhlYjBiNmJh
NDc4Ogo+Cj4gICBMaW51eCA2LjgtcmMzICgyMDI0LTAyLTA0IDEyOjIwOjM2ICswMDAwKQo+Cj4g
YXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8vZ2l0
aHViLmNvbS9rdm0tcmlzY3YvbGludXguZ2l0IHRhZ3Mva3ZtLXJpc2N2LWZpeGVzLTYuOC0xCj4K
PiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZjA3MmIyNzJhYTI3ZDU3Y2Y3ZmU2ZmRl
ZGIzMGZiNTBmMzkxOTc0ZToKPgo+ICAgUklTQy1WOiBLVk06IFVzZSBjb3JyZWN0IHJlc3RyaWN0
ZWQgdHlwZXMgKDIwMjQtMDItMDkgMTE6NTM6MTMgKzA1MzApCgpQdWxsZWQgKGJ1dCBub3QgcHVz
aGVkKSwgdGhhbmtzLgoKUGFvbG8KCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gS1ZNL3Jpc2N2IGZpeGVzIGZvciA2
LjgsIHRha2UgIzEKPgo+IC0gRml4IHN0ZWFsLXRpbWUgcmVsYXRlZCBzcGFyc2Ugd2FybmluZ3MK
Pgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiBBbmRyZXcgSm9uZXMgKDMpOgo+ICAgICAgIFJJU0MtVjogcGFyYXZpcnQ6
IHN0ZWFsX3RpbWUgc2hvdWxkIGJlIHN0YXRpYwo+ICAgICAgIFJJU0MtVjogcGFyYXZpcnQ6IFVz
ZSBjb3JyZWN0IHJlc3RyaWN0ZWQgdHlwZXMKPiAgICAgICBSSVNDLVY6IEtWTTogVXNlIGNvcnJl
Y3QgcmVzdHJpY3RlZCB0eXBlcwo+Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0LmMgIHwg
IDYgKysrLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jIHwgMjAgKysrKysrKysr
KysrLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
