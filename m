Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5601CC021BF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 18:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOAHX/MXX0hfut7h77lrQ1AK7Ck+2NPSIL9VEt9STok=; b=VQuyvEWbEzLZJp
	+2EMl6uA4cHcXflAK+majiDn9ukGtKvKWcvzsqfZoFlVcDLqP7aw7RiqfZtFL4zABBHx0J5yQ+RMe
	LFeFRO/PeYh5fpyEZz4S6tsCr9znZSJBhvOjiZJeXzECisPi8twCHn8XRP+nLutD9akBAovUGAQZo
	/6ycUdp0LiACKjOpDS9wLYyF5Ne4YhDTAtIQIC67nWc/6aeVd8vgHdK9dDg3GyJhStWzgwC1kj8cJ
	W9eI8C1uHv0aA8Ow9B4nv4RtaYugvoEgB54fVHxMzH0oKF0ubru5AxZSBLhB1XhiIR51GEgm5xTMH
	3X/NkFyW5pp643pMbUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdFk-0000000EojK-0TiX;
	Mon, 24 Feb 2025 18:32:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmd4h-0000000EmWy-0Mok
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 18:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740421262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7xELZHJie6Fl0P2HGMVjkjGrKUGnwvDBmjOpl74Jkg=;
	b=Ok9bJu+mxucNk6k62LV80AJ9ShZiLvNN+XBroX0oWVB1IRsf8GLAmzAG+7c8t7sVOiyg7d
	5vAJ6yIjYDqybs4m/MG46vYVMh6xmTZfnt53iaB4T06BaXGg+SXlnM1zOeIW6D3S+ubbrS
	YVmfDEmm8kk3C5UjO9d1dTDjaISjaYU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-WQ0A8qr-N9mJ0_LdWXctMA-1; Mon, 24 Feb 2025 13:20:59 -0500
X-MC-Unique: WQ0A8qr-N9mJ0_LdWXctMA-1
X-Mimecast-MFC-AGG-ID: WQ0A8qr-N9mJ0_LdWXctMA_1740421258
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f4e6e004fso3610407f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 10:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421258; x=1741026058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7xELZHJie6Fl0P2HGMVjkjGrKUGnwvDBmjOpl74Jkg=;
        b=IINiCzTJHrNxWrZDlHa0Wwo8wuvR1lq0572DCNLFKoXIWBT9Cqh5z4Zn6WS/1F0hII
         513aktZGacHm+BrKjo+Ly9nm9T9rhLgNCuk53usRzqqVBZPpPKsQRp8b+lJbqmErbC9T
         BYCZBlg47yKCHxLZSFDle/zA2wX6KpEM44hhgfyvXe4PmnqkX6R7DX4j6UB/SvbtSPTo
         zahRk0swV9n0B81rnIfkS/ty3KyltFU1vQThihkHMAFBYZUnKfZcCGnlkAV+viPdlPSx
         xXkWRvkciDmSmqexpOZS3Tp3XiINbIwq6yyDYq/UfCy+N/WDYDrz4rGqX7yu6dykEJvy
         XzEg==
X-Forwarded-Encrypted: i=1; AJvYcCVG5r8SWtkd8ti9pCLCBMyh1XBnxqzGLssvH/ZT6RjN4QrB+v8yCU3HaGjthfPWKU2szVKFvLqmr339dg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6FpofeazEbgJA4OYM3tgDqpenySiEffrLTGjje1Zig0ya8735
	1K2bYUU7YGf/iw51uosmmYxNtsdpKXpo4tU+kkLc7Gn5ESC8+BKlbbt942EBSgS3sucI6dkfGJb
	H7PQEjFkF/DqxqTaLZO1lef00RhlewtSXUoiTjCHRL47p05N65pk8xg1oFg/73I8n28rsqSkMMT
	Fdz4M5kq+lfMc4SQWmCKHFmBKrmS3ta6nNcWyZb8tj
X-Gm-Gg: ASbGnctnELqTviR8YkNT96BxY8C7RH4L51K/J4JddNqaezueYIUOLn9bEySVjU4LL+T
	1+gKiN9lqVrN6K88yNGLmTlHeP2i1b8YVh5KkUTHFJ0W7tLTws8ocLKPOvYnk6WrsScYEt4NTHQ
	==
X-Received: by 2002:a5d:47cb:0:b0:38d:de92:adad with SMTP id ffacd0b85a97d-38f6e95c4aemr9698937f8f.22.1740421258493;
        Mon, 24 Feb 2025 10:20:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdoqcjY6M2ITOtK0J4C8ZZqwTjbsEXxZzmRUh3glHKJRit9eR6FaDOe3JruMVtsoM71Am043xhfFfSHW4WvTE=
X-Received: by 2002:a5d:47cb:0:b0:38d:de92:adad with SMTP id
 ffacd0b85a97d-38f6e95c4aemr9698920f8f.22.1740421258135; Mon, 24 Feb 2025
 10:20:58 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy0Wo4hQ=gnhpJGU-khA4g-0VkfkMECDjnAsq4Fg6xfWjw@mail.gmail.com>
In-Reply-To: <CAAhSdy0Wo4hQ=gnhpJGU-khA4g-0VkfkMECDjnAsq4Fg6xfWjw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 24 Feb 2025 19:20:46 +0100
X-Gm-Features: AWEUYZmirAbaCLPAASL9k1ey1yRhraHtQYqh2iKwvRPu6z7rtoFlwTs6G6HOStc
Message-ID: <CABgObfbKPQ807vchetgjdFbzFiBgSCXXHCTu-Qq-XgA2dzuDCg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.14 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z_MUawSG6zjUmKE55wHGizNQND5hSQj1XDglY2fpMSY_1740421258
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_102103_190611_0C58B5BF 
X-CRM114-Status: GOOD (  12.05  )
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgNjowOOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIGEgYnVuY2ggb2YgU0JJ
IHJlbGF0ZWQgZml4ZXMgYW5kIG9uZSBmaXggdG8gcmVtb3ZlCj4gYSByZWR1bmRhbnQgdmNwdSBr
aWNrIGZvciB0aGUgNi4xNCBrZXJuZWwuCj4KPiBQbGVhc2UgcHVsbC4KPgo+IFJlZ2FyZHMsCj4g
QW51cAo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwYWQyNTA3ZDVkOTNm
Mzk2MTlmYzQyMzcyYzM0N2Q2MDA2YjY0MzE5Ogo+Cj4gICBMaW51eCA2LjE0LXJjMyAoMjAyNS0w
Mi0xNiAxNDowMjo0NCAtMDgwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0Ogo+Cj4gICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0YWdz
L2t2bS1yaXNjdi1maXhlcy02LjE0LTEKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byBkMjUyNDM1YWNhNDRkNjQ3ZDU3Yjg0ZGU1MTA4NTU2ZjljOTc2MTRhOgo+Cj4gICByaXNjdjog
S1ZNOiBSZW1vdmUgdW5uZWNlc3NhcnkgdmNwdSBraWNrICgyMDI1LTAyLTIxIDE3OjI3OjMyICsw
NTMwKQoKUHVsbGVkLCB0aGFua3MuCgpQYW9sbwoKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gS1ZNL3Jpc2N2IGZpeGVz
IGZvciA2LjE0LCB0YWtlICMxCj4KPiAtIEZpeCBoYXJ0IHN0YXR1cyBjaGVjayBpbiBTQkkgSFNN
IGV4dGVuc2lvbgo+IC0gRml4IGhhcnQgc3VzcGVuZF90eXBlIHVzYWdlIGluIFNCSSBIU00gZXh0
ZW5zaW9uCj4gLSBGaXggZXJyb3IgcmV0dXJuZWQgYnkgU0JJIElQSSBhbmQgVElNRSBleHRlbnNp
b25zIGZvcgo+ICAgdW5zdXBwb3J0ZWQgZnVuY3Rpb24gSURzCj4gLSBGaXggc3VzcGVuZF90eXBl
IHVzYWdlIGluIFNCSSBTVVNQIGV4dGVuc2lvbgo+IC0gUmVtb3ZlIHVubmVjZXNzYXJ5IHZjcHUg
a2ljayBhZnRlciBpbmplY3RpbmcgaW50ZXJydXB0Cj4gICB2aWEgSU1TSUMgZ3Vlc3QgZmlsZQo+
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+IEFuZHJldyBKb25lcyAoNSk6Cj4gICAgICAgcmlzY3Y6IEtWTTogRml4IGhh
cnQgc3VzcGVuZCBzdGF0dXMgY2hlY2sKPiAgICAgICByaXNjdjogS1ZNOiBGaXggaGFydCBzdXNw
ZW5kX3R5cGUgdXNlCj4gICAgICAgcmlzY3Y6IEtWTTogRml4IFNCSSBJUEkgZXJyb3IgZ2VuZXJh
dGlvbgo+ICAgICAgIHJpc2N2OiBLVk06IEZpeCBTQkkgVElNRSBlcnJvciBnZW5lcmF0aW9uCj4g
ICAgICAgcmlzY3Y6IEtWTTogRml4IFNCSSBzbGVlcF90eXBlIHVzZQo+Cj4gQmlsbFhpYW5nICgx
KToKPiAgICAgICByaXNjdjogS1ZNOiBSZW1vdmUgdW5uZWNlc3NhcnkgdmNwdSBraWNrCj4KPiAg
YXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgICAgICAgIHwgIDEgLQo+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaV9oc20uYyAgICAgfCAxMSArKysrKystLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9yZXBsYWNlLmMgfCAxNSArKysrKysrKysrKystLS0KPiAgYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmlfc3lzdGVtLmMgIHwgIDMgKystCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
