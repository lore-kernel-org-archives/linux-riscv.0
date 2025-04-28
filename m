Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D0AC369D9
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JFsz/H8Rrr5rTD0QZ03cJDmdySzj8H1XLfVpmnYUCY=; b=sXycVJAkhv2Ju9
	XWaL48qyJj+AbnN4uO1POytQpY7vkplUumYtUFgBPMkgD7XHv2Uw7UuYPAPEfAg5M47ZXyT1tvaq1
	inf2hXP9w2etIDDFhUbdkAWm9g4U3/KiKByzUFIeZ4fRKebvRxUw/Yh43/NfR7QapxhGHLSpc9+U4
	ZmNR4J+nqP9pCKiM2vIJjQVsukxmr3gOSjadWtRLg+opgt9IT+U2hIEo32VclIIjKmCTPItaqGLm3
	ZprvjM3G5fV5XowLvJDy0Ub26CXsfXYsxZmIllOx++4THC/r15+v5TVeLHqli9DG3mn4NhfU8cTha
	lxRFLMX7LeXbRQ+LtE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SZI-000000078Ht-40Hc;
	Mon, 28 Apr 2025 17:47:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SY8-000000078Bb-1jdD
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Apr 2025 17:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=v/CANhKWFmJawB0p8jQ/NyjybjgGkYzY/3LSqUuDHX0=; b=NquvwAO2O0i3XjtXNQ8IfbpevV
	A8AQhDFa7SLTNPhjAet4F2Aze830zy77vitXFmXiupwyiq4/tyg9FSeXfJPL8f3i2EzTLuO4700VY
	rqwZ9HJszyO0XuYRG4cSkXrvbE55MOAvbJjEd4k+Ef7GZujt+MRtTx1T9sqAJx5nbUDBD5ED3AJw8
	qKnUm5vOngKwjAPBg+gLIDLKFY5E3Zbdsess9tRRNMB6/TkS2mrUAAB1ULs6zADkg3Qlv7NPW8Za5
	t/K6PssRbwxcKMnZz8vNrbmEHgdt+bKOAvmZkXJmztvs4hak5l+oheBNwwT4p/D+a+xRrKDhFC63z
	VDOoiGOw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9SY5-0000000Cw9f-1v5j
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 17:45:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so6677825e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 10:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745862342; x=1746467142; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/CANhKWFmJawB0p8jQ/NyjybjgGkYzY/3LSqUuDHX0=;
        b=ZOE9Vjm/94eqnlUKf1piYxvjOkImGw/iG2vNmPv6d/AFDEVpum9qDVv+Xb+3eloSnp
         Zr9vD65PD9VbGtMoTBkUFVTW0VPm1zAUqSGTulz9nDcymHdlTVJkTOVLgrESkTNF9MZ/
         MNJeOlLhf80aUAY3ff3EIkWIr4/jnEj4zncCDhZPLGe6OJRlhy4jproaG816zr7j0rw8
         O4dI+NHZ247d0h9KJfL/Xqqv2xAS7N+MFFEMHAYMtTNeOG1Ujb0hOaGFsK6+qRumlvCB
         ECaPgXOPj+Hz/hjarxPmGru+pB60/RLI2I+LfNgQFgTs+NIT7kUpnGkV2MX63tlIQBgb
         z41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862342; x=1746467142;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v/CANhKWFmJawB0p8jQ/NyjybjgGkYzY/3LSqUuDHX0=;
        b=HNbjLkFdBlGBi4+lpayWMrREmBwwypk+zineEUhSZFE/zKNT1r7gtdSaDobKgTdLQE
         wYeK/gH/OP3JccxehsZxqpYsadvxLQl6MagQgwtV6Yn3n0/gHqdWjkwpbec0L1gWK1A9
         CvJEEQEpIBV1oMNCzI4FPmVgx5688zOlF0rhEIWOjjnSOBx8TflhIhSdis/6fpaNZFHF
         QVvaLKghhOeSe/J/V/bwaEw+Io/uDzHPxTOhH8O5QNl6v4LXaTwVYXUmUHegNCja7qjd
         ilvyEOPpFKbePUWXesKoiujDGYlpEYw5xrM3M4oZ7MBoJ7IXfloUWcgrN7QMBEeA6bkf
         hD2g==
X-Forwarded-Encrypted: i=1; AJvYcCVLGaN5NBlg4yIgTTCXgjH80L6IVBtfIRQjdIIqL+M5ZgSXTZwoIE2KYI9rAAhG9E1kFl6y8V/1X8+prQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAS2c7wnkdrUckpcSuiIJua8puMQWUCPFdwJny9n3xHC3QjSDB
	S8XDw58rThuWI4zr5lhL9C3+uTlapjp7qUvUX0BqTc82Q8boEGrZs9UAHRhouz8=
X-Gm-Gg: ASbGnctwk1E7s+MfshqRmwHSYylj8ZEHAfF5gAmgRUmuZAWgSyYv7RPPEubSHUqplhE
	E4NOjV081ASsQRM8gGu8Mc88Yxqxiljl0ajgLjaSJdIRPLKY9BCOaJL1oMfw+QvmiQdwrh7Mnas
	0mR7JEea5zHe5TeN4MH665LVic80wq+yTg9rSD5xz3bVlumkIlgTujJKqAH7D3BkHn+hlTDiPSH
	ROPaIPslTWPQL64cWAJ/V6Tmg9PF1Z1bAuujAOBoCMOcgwfptqYFmj7LyLCgPzkB7YSCz3uzPeO
	9KbdHtkbUvotxrflYmt6ZxlideerjWkF/LPZr39hnNA2ymE=
X-Google-Smtp-Source: AGHT+IEvyyRwv+siNkS/+KKa7cPTZaQ24k7dR1L6NM8zAaZ/ZacC5UiUMQME2xFD4O4sKzfsTBeP0Q==
X-Received: by 2002:a05:600c:3b82:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-440a634912dmr44268285e9.0.1745862342603;
        Mon, 28 Apr 2025 10:45:42 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:785:f3a7:1fbb:6b76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46a54sm11977490f8f.67.2025.04.28.10.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:45:42 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 28 Apr 2025 19:45:41 +0200
Message-Id: <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
In-Reply-To: <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_184545_630732_EA621E20 
X-CRM114-Status: GOOD (  13.22  )
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

MjAyNS0wNC0yOFQxNzo1MjoyNSswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxy
a3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiBGb3IgYSBjbGVhbmVyIHNvbHV0aW9u
LCB3ZSBzaG91bGQgYWRkIGludGVyZmFjZXMgdG8gcGVyZm9ybSB0aGUgS1ZNLVNCSQo+PiByZXNl
dCByZXF1ZXN0IG9uIHVzZXJzcGFjZSBkZW1hbmQuICBJIHRoaW5rIGl0IHdvdWxkIGFsc28gYmUg
bXVjaCBiZXR0ZXIKPj4gaWYgdXNlcnNwYWNlIHdhcyBpbiBjb250cm9sIG9mIHRoZSBwb3N0LXJl
c2V0IHN0YXRlLgo+Cj4gQXBhcnQgZnJvbSBicmVha2luZyBLVk0gdXNlci1zcGFjZSwgdGhpcyBw
YXRjaCBpcyBpbmNvcnJlY3QgYW5kCj4gZG9lcyBub3QgYWxpZ24gd2l0aCB0aGU6Cj4gMSkgU0JJ
IHNwZWMKPiAyKSBPUyBib290IHByb3RvY29sLgo+Cj4gVGhlIFNCSSBzcGVjIG9ubHkgZGVmaW5l
cyB0aGUgZW50cnkgc3RhdGUgb2YgY2VydGFpbiBDUFUgcmVnaXN0ZXJzCj4gKG5hbWVseSwgUEMs
IEEwLCBhbmQgQTEpIHdoZW4gQ1BVIGVudGVycyBTLW1vZGU6Cj4gMSkgVXBvbiBTQkkgSFNNIHN0
YXJ0IGNhbGwgZnJvbSBzb21lIG90aGVyIENQVQo+IDIpIFVwb24gcmVzdW1pbmcgZnJvbSBub24t
cmV0ZW50aXZlIFNCSSBIU00gc3VzcGVuZCBvcgo+ICAgICBTQkkgc3lzdGVtIHN1c3BlbmQKPgo+
IFRoZSBTLW1vZGUgZW50cnkgc3RhdGUgb2YgdGhlIGJvb3QgQ1BVIGlzIGRlZmluZWQgYnkgdGhl
Cj4gT1MgYm9vdCBwcm90b2NvbCBhbmQgbm90IGJ5IHRoZSBTQkkgc3BlYy4gRHVlIHRvIHRoaXMs
IHJlYXNvbgo+IEtWTSBSSVNDLVYgZXhwZWN0cyB1c2VyLXNwYWNlIHRvIHNldCB1cCB0aGUgUy1t
b2RlIGVudHJ5Cj4gc3RhdGUgb2YgdGhlIGJvb3QgQ1BVIHVwb24gc3lzdGVtIHJlc2V0LgoKV2Ug
Y2FuIGhhbmRsZSB0aGUgaW5pdGlhbCBzdGF0ZSBjb25zaXN0ZW5jeSBpbiBvdGhlciBwYXRjaGVz
LgpXaGF0IG5lZWRzIGFkZHJlc3NpbmcgaXMgYSB3YXkgdG8gdHJpZ2dlciB0aGUgS1ZNIHJlc2V0
IGZyb20gdXNlcnNwYWNlLApldmVuIGlmIG9ubHkgdG8gY2xlYXIgdGhlIGludGVybmFsIEtWTSBz
dGF0ZS4KCkkgdGhpbmsgbXBfc3RhdGUgaXMgY3VycmVudGx5IHRoZSBiZXN0IHNpZ25hbGl6YXRp
b24gdGhhdCBLVk0gc2hvdWxkCnJlc2V0LCBzbyBJIGFkZGVkIGl0IHRoZXJlLgoKV2hhdCB3b3Vs
ZCBiZSB5b3VyIHByZWZlcnJlZCBpbnRlcmZhY2UgZm9yIHRoYXQ/CgpUaGFua3MuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
