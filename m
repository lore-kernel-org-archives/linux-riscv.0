Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4AAC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjgdDK3tgplO/UQQNi8VDGqk3T/kW59ohJNeEQM++II=; b=jLyqSYcdYlAN0r
	E7rfLQupEHbH783XuoZPR8irqyAO8BDHnOwBZnuBKZC/w0IEJUOrsYbaIMY1i19fgeyFg2B5J7lsY
	I1guJjPUmW6OSWc5doPd+c2bw45bPU9JYaL4BZFiGFHvhwmIZUT1wXGP1ntXSCQuY1rTJ2cIDnE2c
	XgToKQe34K0Fn6pDGYBvcqV9q6yb5W2pjEhvd8UEmdXz5T5NI4rmorQdg94HEHDkSk3MJkPwX6DuF
	ezOPmQ8UuvUt0D05YCbwQJoNEQXOjU5pKwdFHygZJGcU7a5dTXXzs64qlHTVzpmKIYA/u9FvlR2aA
	G1W5yNotrkVGzy6RkMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNANc-007vXQ-2c;
	Tue, 09 Jan 2024 11:34:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNANa-007vUg-1P
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 11:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704800085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GUN+/Kn6FQWRmlqVv9nbikCrbachpkInN5wWcNO9XHM=;
	b=aArYvIKPakj0xNjdQ4UhYnfb9lEYPu68fTgmwddKdf8CInb3dUAAh/VPcX8SlpOQGKssEV
	0gXG73lRbmSDH6Ta05+gQAtxWSqV7HjX2Vm5rS4v8uDUXmq9PmVI+vRtEh2W/t5GZaduJ8
	3O8V7SYMPHnlLd2C0QWVsJCmBEJZl1U=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-NPZ5S74HMAuXZauI0gyN-A-1; Tue, 09 Jan 2024 06:34:43 -0500
X-MC-Unique: NPZ5S74HMAuXZauI0gyN-A-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5e9a02c6d49so48446017b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 03:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704800083; x=1705404883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUN+/Kn6FQWRmlqVv9nbikCrbachpkInN5wWcNO9XHM=;
        b=Xt1fRa8ZHt8OwrAyTLiIiMte+yE2WBBRL4rbKsyUqEJNYVvAu8x+++MF17ehqpdiC1
         BHzRdlAEw/Zn0n8jx9q5Jc/zDyl1OhSXFkCVSDajnYrUHWLd4eSoZmVSq0fqxcwG0Qu7
         e6wVvag0r3FZMzdb3cIBXikQyvJGMdf0/37v5rXccbD68m3/rvG4w5pVlcZZ7wQRRE5k
         qBtgrRuOYG6rvEOwIsa64xOYW5qSukdTRI563Tbbrupv1HaNi6krUIsmCVYDjmgu8td9
         2QpVLDHmfpaXPy9WzVNgZxQN8sKH4LOJjj9HdaOVQXDBhHWuoATfACIbeKk0xPq1TEi8
         iu1w==
X-Gm-Message-State: AOJu0YxN9qUuFTY+u2i8ftj/vbfPZBr6USWYkiVoEe+82h88pE818Rch
	fUR7TBLasBi0ytRJXWchePVqXzE3AhySlqDTid7kkYTdgRtpBCnN4ZUXOEtqi3OmBKK0GTr5lfR
	YOGQEEKpz9qaXznM4vHCApw9gfwcuR/fQlkuKVizOKqBlHOdjXR7X
X-Received: by 2002:a81:a151:0:b0:5ea:5573:78d6 with SMTP id y78-20020a81a151000000b005ea557378d6mr3086092ywg.33.1704800083406;
        Tue, 09 Jan 2024 03:34:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1hcgt6oRHbR/RjEpDAqM7iEdTO4DnRabG9ZjF0lgirNmr9/Bpj6VCQkN0AmvDDe5uKzdDfwgU9scOEoBOq1g=
X-Received: by 2002:a81:a151:0:b0:5ea:5573:78d6 with SMTP id
 y78-20020a81a151000000b005ea557378d6mr3086079ywg.33.1704800083167; Tue, 09
 Jan 2024 03:34:43 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
 <CABgObfZN4_xvOHr8aukZZGZj5teWZ7rt5RJU5Y0YFewQk19FRw@mail.gmail.com>
 <20240102-c07d32a585f11ee80bd7b70b@orel> <CAAhSdy2_STfVNb6PB0o-hW+rn-K+U5BcYJWJO3m8vbeQEQ9BFw@mail.gmail.com>
 <CAAhSdy0GO=5N2Fz0O-=xMqJ1ZK3GoqsW76kt8UevxhJRbEYmtw@mail.gmail.com>
In-Reply-To: <CAAhSdy0GO=5N2Fz0O-=xMqJ1ZK3GoqsW76kt8UevxhJRbEYmtw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 9 Jan 2024 12:34:30 +0100
Message-ID: <CABgObfZnTRGYcACubYyjNesaiQD_6rE_utusbFANyvE3F6R7Sw@mail.gmail.com>
Subject: Re: Re: [GIT PULL] KVM/riscv changes for 6.8 part #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_033446_543787_CFED8D70 
X-CRM114-Status: GOOD (  14.99  )
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

T24gVHVlLCBKYW4gOSwgMjAyNCBhdCA3OjAy4oCvQU0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSmFuIDAyLCAyMDI0IGF0IDA3OjI0OjI2UE0g
KzAxMDAsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gPiA+ID4gT24gU3VuLCBEZWMgMzEsIDIwMjMg
YXQgNjozM+KAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4g
PiA+ID4gV2UgaGF2ZSB0aGUgZm9sbG93aW5nIEtWTSBSSVNDLVYgY2hhbmdlcyBmb3IgNi44Ogo+
ID4gPiA+ID4gMSkgS1ZNX0dFVF9SRUdfTElTVCBpbXByb3ZlbWVudCBmb3IgdmVjdG9yIHJlZ2lz
dGVycwo+ID4gPiA+ID4gMikgR2VuZXJhdGUgSVNBIGV4dGVuc2lvbiByZWdfbGlzdCB1c2luZyBt
YWNyb3MgaW4gZ2V0LXJlZy1saXN0IHNlbGZ0ZXN0Cj4gPiA+ID4gPiAzKSBTdGVhbCB0aW1lIGFj
Y291bnQgc3VwcG9ydCBhbG9uZyB3aXRoIHNlbGZ0ZXN0Cj4gPiA+ID4KPiA+ID4gPiBKdXN0IG9u
ZSBzbWFsbCB0aGluZyBJIG5vdGljZWQgb24gKDMpLCBkbyB5b3UgcmVhbGx5IG5lZWQgY3B1X3Rv
X2xlNjQKPiA+ID4gPiBhbmQgbGU2NF90b19jcHUgb24gUklTQy1WPyBJdCBzZWVtcyB0aGF0IGl0
IHdhcyBjb3BpZWQgZnJvbSBhYXJjaDY0Lgo+ID4gPiA+IE5vIG5lZWQgdG8gcmVzZW5kIHRoZSBQ
UiBhbnl3YXksIG9mIGNvdXJzZS4KPgo+IEZyaWVuZGx5IHBpbmcgPwoKSGksIEkgaGFkIGFscmVh
ZHkgcHVsbGVkIGJ1dCBJIHdhcyB3YWl0aW5nIGZvciB0aGUgbGFzdCB4ODYgdGVzdHMgdG8KZmlu
aXNoLiBFdmVyeXRoaW5nIGlzIG5vdyBpbiBrdm0uZ2l0LgoKSSdsbCBzZW5kIHRoZSBQUiB0byBM
aW51cyBvbmNlIGEgYnVuY2ggb2YgY29uZmxpY3RpbmcgdHJlZXMgaGF2ZSBiZWVuIHB1bGxlZC4K
ClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
