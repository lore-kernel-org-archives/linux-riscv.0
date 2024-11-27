Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C66D6ACF4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISe2ThIniuEuHosZmxn+O/aVdwvnL5CrRyeG5fySWl8=; b=EP+A+5DHasYBxi
	2xt09FzpKBxKxmQOtCtt++koD+K02MLicVvKXviMOdHeQDlPvNAki7vNcekRX4B5Wl56i71eKc4l4
	PNTcuXGYBbkMCpP9A6XfuTL0VmhgFzY41pv1sPrJPT+I9AMXlH7MCY8OEEm7uXb8fbhufKO4N1q/x
	/H01dqbSv0T8F9XbX2TpfFQ4fvVXX4D6iwVzz4p8SVRgLk5s0mM/NawvlsM3cgVfpJ9Qs0y9i6Utl
	qfvJMnwYTeafjQRQpGv2+wWts11cMQegXTg+WK7LREQcmHTazVDK6vyvmT5eL4Vq7ev0BNKrcKpNI
	pwlRLWuoCv2h98CApirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLOg-0000000Di7b-1gF9;
	Wed, 27 Nov 2024 17:00:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLOe-0000000Di6Y-0Hzj
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 17:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732726811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJR3B0odsZQHf7sVwTNPbyRTbyljXTxWTLBZbD2FzwQ=;
	b=czPSKx4lzC9VW0gCVdn2DJ4fOy24cnG7jQnHJeBir2U9voojg48zcvibiNY/awqZQzAOss
	aNEWq0WGeukpIjThBalEEX9YvjRgBLAhPz7l6bk1AcaeO2YRVxTqXcB381h86M6RzpsCCV
	AwxNvPTMbC299nBNCcta9jvgYQLudF4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-5q2t02-LMPekUFNgoreWIg-1; Wed, 27 Nov 2024 12:00:09 -0500
X-MC-Unique: 5q2t02-LMPekUFNgoreWIg-1
X-Mimecast-MFC-AGG-ID: 5q2t02-LMPekUFNgoreWIg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-434a876d15cso5588945e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 09:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732726808; x=1733331608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJR3B0odsZQHf7sVwTNPbyRTbyljXTxWTLBZbD2FzwQ=;
        b=mffRTbJCEfz7YN+9HJS4N3QduHrm3fgTapT8vHVjPOhd31mxscs44aJLfRCKyZvQVK
         oykDSagnraufdiS69tJd7CvMmttu8QfdvzZ9/7S0PEjqTQ0MFRXtxlBIbPnJYbfMNqbL
         2LMOBrEQP16dzD9mtNSLHNc5M9RY7pR4s+kpICk0MmPa3uQNg0ryDqjh6iC7qtOnNr55
         rb+ze/BNXx0/t50IoOK86x8cayWi4T6tax9WCtiQ5BleQZRXw5Do7tGFJR51JrO+yeim
         xUMAtw+f1/JvZE+4MeVF6jI7NNJrRJMlqRrpifauWTLlH+0NNONvXoLSkh3zMxBcG5aG
         QOnw==
X-Forwarded-Encrypted: i=1; AJvYcCUr3ANcdzbpo5LLOqE5U0pjITVJSQl1UcbmOodTyk7i5Hd5hdl1GfRQk1Tdbw+oLYO44FsPEroFu4YSTA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6aljxudoFdUS5W9qnwQVUkqATjGrCWew0tn0WBgB38JNU3V7t
	fg8kvNSqVcbZHUsP8dGYvuLKDreGak05E78k2kTGT0upaJMzoqkg6CN1SyXS+qQM4ItsGXGVBd4
	PXGiBuKgBJXmjwuiTLX5mwzAbthtf+gwtlWeEm6edbEqkCDQzqgrSJPTFDFqsEz0QYP7GpPCF3Q
	7qR5eEyYctLqnFYstfsQz09mZ1vfdVs+0Yb1kNwEnqiah58S4SJtU=
X-Gm-Gg: ASbGncsJiHZVDI+SdMUiljo/TCvSagnxCiLNQuXxnFIbMWVqixCHltgxzBRcdlSXay8
	II6dyRNpq17fPM0VUXCtmmA+ttgLLC0yU
X-Received: by 2002:a05:600c:4fcc:b0:42c:b67b:816b with SMTP id 5b1f17b1804b1-434afb8dea4mr965155e9.1.1732726806766;
        Wed, 27 Nov 2024 09:00:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsYftJoVLH6XXc7eLyOZ8Xs3Ne7AzojxCTrGoIVZMgf+087kJMy68qK3SgXjDP+ni5zf++bz5A32H+CqPJmDs=
X-Received: by 2002:a05:600c:4fcc:b0:42c:b67b:816b with SMTP id
 5b1f17b1804b1-434afb8dea4mr963975e9.1.1732726804984; Wed, 27 Nov 2024
 09:00:04 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy2mLBzE63wpQrOaHtOV0rwqkaxTUMBA9oMZsk68o0EHMg@mail.gmail.com>
 <CABgObfacuB-8KN1+Czt5DaXQbaiw9=jP5zYGatw6CGooLnz9Sg@mail.gmail.com>
 <CAAhSdy1eYZc__ynDrF8sQCk8Rj+CRj+LBBbGnV+Hc4qHfYiEOA@mail.gmail.com>
 <CABgObfbKYc0Dqcq36dHsV=uopV+TAGu9-SuZF+QP=u6x0uMiHg@mail.gmail.com> <CAAhSdy1QCeg82kQsPHJx1+Oc=L7BoOUTpeLUNoeApao8rZDE+Q@mail.gmail.com>
In-Reply-To: <CAAhSdy1QCeg82kQsPHJx1+Oc=L7BoOUTpeLUNoeApao8rZDE+Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Nov 2024 17:59:52 +0100
Message-ID: <CABgObfZ1iqNGqb+MW84_tgZEnSoAjMqzXFcoq0s58iTZDPMKgg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.13, part #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, samuel.holland@sifive.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jip9iWEz5-FfrauNBV-AqOrPJT8nHqLR02IB1ikd4jc_1732726809
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_090012_173652_BCD97982 
X-CRM114-Status: GOOD (  16.32  )
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

T24gV2VkLCBOb3YgMjcsIDIwMjQgYXQgNTo1MeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+ID4gT2ssIHdpbGwgZG8uIEJ1dCBJJ2QgbGlrZSB0byB1bmRlcnN0
YW5kIGlmIEtWTSBwYXRjaGVzIG5lZWRlZCB0aGUgYmFyZQo+ID4gbWV0YWwgc3VwcG9ydC4gSWYg
bm90LCBhbmQgdGhlIG9ubHkgcmVhc29uIHRvIHNraXAgaXQgaW4gNi4xMiB3YXMgdGhlCj4gPiBo
d2NhcC5oIGNvbnN0YW50cywgdGhlbiB0aGVyZSB3YXMgbm8gcmVhc29uIHRvIGRlbGF5IGl0LiBK
dXN0IHNlbmQgdGhlCj4gPiBod2NhcC5oIHVwZGF0ZSBhcyBhIHB1bGwgcmVxdWVzdCB0byBib3Ro
IG1lIGFuZCBQYWxtZXIsIGFuZCB3ZSdsbAo+ID4gbWVyZ2UgaXQgZnJvbSB0aGUgc2FtZSBjb21t
aXQgaW50byBvdXIgdHJlZXMuCj4KPiBJdCB3YXMgc2tpcHBlZCBpbiA2LjEyIGR1ZSB0byBjb25m
dXNpb24gYmV0d2VlbiBteXNlbGYgYW5kIFBhbG1lcgo+IGFib3V0IHdoaWNoIHRyZWUgdGhlc2Ug
cGF0Y2hlcyB3aWxsIGdvIHRocm91Z2ggYW5kIHdlIGRpZCBub3QgcmVzb2x2ZQo+IHRoaXMgaW4g
dGltZS4KCkkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCBpZiBLVk0gcGF0Y2hlcyBuZWVkIGFueSBi
YXJlIG1ldGFsIGNvZGUgdGhvdWdoLiA6KQoKSXQncyBhbHNvIHVuY2xlYXIgdG8gbWUgd2h5ICJS
SVNDLVY6IEtWTTogQWxsb3cgU21ucG0gYW5kIFNzbnBtCmV4dGVuc2lvbnMgZm9yIGd1ZXN0cyIg
Y2FtZSB0aHJvdWdoIHRoZSBSSVNDLVYgdHJlZSwgdGh1cyBjYXVzaW5nCmNvbmZsaWN0cyBpbiB0
aGUgS1ZNX1JJU0NWX0lTQV9FWFRfSUQgZW51bS4gIEl0IGRvZXNuJ3Qgc2VlbSB0byBuZWVkCmJh
cmUgbWV0YWwgc3VwcG9ydCwgc28gaXQgc2hvdWxkIGhhdmUgY29tZSB0aHJvdWdoIHlvdXIgdHJl
ZS4KClRoaXMgc3BsaXQgYmV0d2VlbiBwYXRjaGVzIHRoYXQgeW91IHNlbmQgdG8gbWUgYW5kIHRo
b3NlIHRoYXQgb3RoZXJzCnNlbmQgdG8gc29tZW9uZSBlbHNlIGlzIG5vdCB5b3VyIGZhdWx0IGJ1
dCBpdCdzIGEgbWVzcywgYW5kIHRoZSBSSVNDLVYKbWFpbnRhaW5lcnMgc2hvdWxkIG5vdCBoYXZl
IGdvbmUgZm9yIHRoZSBsZWFzdC13b3JrIG9wdGlvbi4gSWYKYW55dGhpbmcgaGFzIGEgYmFyZSBt
ZXRhbCBhbmQgYSBLVk0gcGFydCBpdCdzIHRvdGFsbHkgb2theSB0aGF0IHlvdQpzZW5kIGl0IHRv
IG1lIGFzIGEgc2VwYXJhdGUgcHVsbCByZXF1ZXN0LCBidXQgdGhlIHJpZ2h0IHdheSB0byBkbyBp
dAppcyB0byAqaW5jbHVkZSBhIHRvcGljIGJyYW5jaCBmcm9tIHRoZSBSSVNDLVYgdHJlZSogYW5k
IGJhc2UgdGhlIEtWTQpjaGFuZ2VzIG9uIHRvcC4gTm90IHRvIGxldCBMaW51cyBhbmQgbXlzZWxm
IHNvcnQgb3V0IHRoZSBjb25mbGljdHMuCgpQYW9sbwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
