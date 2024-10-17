Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EB2D3C52A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 17:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwKqiTWz9tVbqIqb+LtnItyn3zUwaKM7BZuIes32RUU=; b=UGyWK6vIHV//oP
	OpUau2mi+wgPPAUTMHixSQQkXtoJ6Eu3vknb0oJx036Kg9EpVIPHvd0H3AhtTowxNKY/V5s0mv6mM
	kMVkf3qwytSmxVCZfk8QFJz2ItiOeWWef4hqd2iUDf0/c3u3kPekDFd/YilQbLYjHz+BhZS1rPwPG
	d9f3Jy9bLu8BLjOd7B87pBM+alF9v7bgR179i0o+6Xm5r/l1RAOm4l9UjDnrzIxXRih3T5dE4x29H
	5mD4W5inePjvZsMiu0sw3k2w+5kQjIbycdZgK4jw49ozWI4rI0fnA8FhimLnmCzw2av5MLxiN7yiS
	s9JRvQjVE7rgSseylDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1UVu-0000000Fkit-1ria;
	Thu, 17 Oct 2024 17:42:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1UU3-0000000FkDV-0ugT
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 17:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729186822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Me+6kqYD5L+igZgkevVfUHfhQZBz6G5zZyQw2Dfa0gs=;
	b=F48djm0HxmmhxPi0d/6M9zsxnOxpICC7RXtPsvYeJOMNJ3Pcmgn9GA+LdDhmtp/ypaf5/B
	Byo1vFzPjHC9nhDJ6Ojy2vHuIajNAtH/XazyMHlGGYZ5h0LSACQVeBlQKgZcmUuHmfMMqd
	REcFciBEfhFwcjQw0ris+nJXp+U/zv4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-OgEUlhGoMOiUpTqON_lP5w-1; Thu, 17 Oct 2024 13:40:18 -0400
X-MC-Unique: OgEUlhGoMOiUpTqON_lP5w-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43151e4ef43so8349195e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 10:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729186817; x=1729791617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Me+6kqYD5L+igZgkevVfUHfhQZBz6G5zZyQw2Dfa0gs=;
        b=efVvrL8xZIcknN5rUbTFMT9gbSkPKzWBDGz6G1bXPhmlBbD6E3d1ppnBbGqGEWCTK7
         BjGE+jndOZ7u4yQeuuEBFi+vv3VjRzkxzG+c1dPTy/aUCqI7+uz5Oqp5XeRmxIB+/vuI
         v+S8IWIuWnnuMuJuGPowbciGYl0Jm/CmH0TocmTL6XMUadV8so70oDlHcLN60+el0mEZ
         WFCesuOmmtd2RpXa4FVcmEZ23YkulkuJjaqvsf3skocFNOL1ydnwcoRzlTyqAb0+HKmR
         X7PM8qXI1Hmp2LX8rALW4o60fVNiE9bIpZZ/Taz4KEUrRFIs4Hnu2r99VmHQVQugtx8M
         8GKA==
X-Forwarded-Encrypted: i=1; AJvYcCVeGQ9O7kAA9gynB8TpUxT9oDY9HXR/pcwLQuc8pfun1qDKFNr2y4d0Lg3LS3YcpEprpfT2KoOg5FsjjA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx0q6zLmPyXT+QhNb3BeZel0w2D9X5XCBLRaLF8G7pl8jb00MV
	4ub23P5AwIB8aXyQ/xn8S9+0+iuUEC5lSMaYkDbhzzTGiolopQIdD4O/Vm2sorz95X7PtDYyj5e
	X+egGhFb1+U9WTPy0YeJEl7myhj1H/bSF6yNtVa+uP8tgPpb0dPnCPr+3D5ZTAF5JTvXAxB0fC6
	rs1zeaN1obwMsybJaQ1O3QQbzXz9q5nbL/C0Z1NxwV
X-Received: by 2002:a05:600c:1d8e:b0:431:57d2:d7b4 with SMTP id 5b1f17b1804b1-43157d2d7b9mr36506935e9.26.1729186817331;
        Thu, 17 Oct 2024 10:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJXjIUBFBzWhc81QoCH/SVoEivw8XmjKVFXrcy86zA+s4Bvx/9zH7hnQ9Z4/zbRof1LT4xgUF82luj5UeBHDI=
X-Received: by 2002:a05:600c:1d8e:b0:431:57d2:d7b4 with SMTP id
 5b1f17b1804b1-43157d2d7b9mr36506735e9.26.1729186816975; Thu, 17 Oct 2024
 10:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Oct 2024 19:40:04 +0200
Message-ID: <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Yan Zhao <yan.y.zhao@intel.com>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_104023_335868_98D42341 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgODoyNOKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiB2MTM6Cj4gIC0gUmViYXNlZCBvbnRvIHY2LjEyLXJj
Mgo+ICAtIENvbGxlY3QgcmV2aWV3cy4gW0FsZXggYW5kIG90aGVyc10KPiAgLSBGaXggYSB0cmFu
c2llbnQgYnVnIGluIGFybTY0IGFuZCBSSVNDLVYgd2hlcmUgS1ZNIHdvdWxkIGxlYWsgYSBwYWdl
Cj4gICAgcmVmY291bnQuIFtPbGl2ZXJdCj4gIC0gRml4IGEgZGFuZ2xpbmcgY29tbWVudC4gW0Fs
ZXhdCj4gIC0gRHJvcCBrdm1fbG9va3VwX3BmbigpLCBhcyB0aGUgeDg2IHRoYXQgIm5lZWRlZCIg
aXQgd2FzIHN0dXBpZCBhbmQgaXMgKHdhcz8pCj4gICAgZWxpbWluYXRlZCBpbiB2Ni4xMi4KPiAg
LSBEcm9wIGNoZWNrX3VzZXJfcGFnZV9od3BvaXNvbigpLiBbUGFvbG9dCj4gIC0gRHJvcCB0aGUg
YXJtNjQgTVRFIGZpeGVzIHRoYXQgd2VudCBpbnRvIDYuMTIuCj4gIC0gU2xpZ2h0bHkgcmVkbyB0
aGUgZ3Vlc3RfbWVtZmQgaW50ZXJhY3Rpb24gdG8gYWNjb3VudCBmb3IgNi4xMiBjaGFuZ2VzLgoK
SGVyZSBpcyBteSBvd24gc3VtbWFyeSBvZiB0aGUgY2hhbmdlczoKCnBhdGNoZXMgcmVtb3ZlZCBm
cm9tIHYxMjoKMDEvMDIgLSBhbHJlYWR5IHVwc3RyZWFtCjA5IC0gbW92ZWQgdG8gc2VwYXJhdGUg
QS9EIHNlcmllcyBbMV0KMzQgLSBub3QgbmVlZGVkIGR1ZSB0byBuZXcgcGF0Y2ggMzYKMzUgLSBn
b25lIGFmdGVyIDYyMDUyNTczOTUyMTM3NmE2NWE2OTBkZjg5OWUxNTk2ZDU2NzkxZjgKCnBhdGNo
ZXMgYWRkZWQgb3Igc3Vic3RhbnRpYWxseSBjaGFuZ2VkIGluIHYxMzoKMDUvMDYvMDcgLSBuZXcs
IHN1Z2dlc3RlZCBieSBZYW4gWmhhbwowOCAtIGNvZGUgd2FzIGZvbGRlZCBmcm9tIG1tdV9zcHRl
X2FnZSBpbnRvIGt2bV9ybWFwX2FnZV9nZm5fcmFuZ2UKMTQgLSBuZXcsIHN1Z2dlc3RlZCBieSBt
ZSBpbiByZXBseSB0byA4NC84NCAoeXVjaykKMTUgLSBuZXcsIHN1Z2dlc3RlZCBieSBtZSBpbiBy
ZXBseSB0byA4NC84NAoxOSAtIHNvbWV3aGF0IHJld3JpdHRlbiBmb3IgbmV3IGZvbGxvd19wZm5t
YXAgQVBJCjI3IC0gc21hbGxlciBjaGFuZ2VzIGR1ZSB0byBuZXcgZm9sbG93X3Bmbm1hcCBBUEkK
MzYgLSByZXdyaXR0ZW4sIHN1Z2dlc3RlZCBieSBtZQo0NSAtIG5ldywgY2xlYW51cAo0NiAtIG11
Y2ggc2ltcGxpZmllZCBkdWUgdG8gbmV3IHBhdGNoIDQ1CgpMb29rcyBnb29kIHRvIG1lLCB0aGFu
a3MgYW5kIGNvbmdyYXR1bGF0aW9ucyEhIFNob3VsZCB3ZSBtZXJnZSBpdCBpbgprdm0vbmV4dCBh
c2FwPwoKUGFvbG8KClsxXSBodHRwczovL3BhdGNoZXcub3JnL2xpbnV4LzIwMjQxMDExMDIxMDUx
LjE1NTc5MDItMS1zZWFuamNAZ29vZ2xlLmNvbS8yMDI0MTAxMTAyMTA1MS4xNTU3OTAyLTUtc2Vh
bmpjQGdvb2dsZS5jb20vCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
