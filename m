Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B105C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 04:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfDptwuZnkOhY7CPihy4hD9VqORaulbOd/DjhTovGVc=; b=ANbxNEXhciza/W
	h5CQvJLAC278ZNhMQtw4jf3BZ3hEtoKbS8DGep/edWGDuKiGEfx0G0GPF1iES10cnCjBO8xCFW/Yu
	XHBcQApep1K1yNTYk54wkwRtz4Fc+oBqQjIDeVKUvmmqdDajm1T0ES2KpN9PZZUDj2kHkMStzpVxz
	QH5yUf1LMkAb+GUHLrXrao2NZGxxyXKP8LjDPM4DjLuXpP+kBwZmCFeQ0PYM97MFBg5+lJU3PNAUi
	6WRl1DOvtchfZVwDETurqYoe3Ix9D0NQBGq8D+ClivMRhZz7OK01BiDQD9MC4dnFSarKHlDKQDjZ9
	acztEV8cRKk111Rk40bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roy6S-00000002zvl-2arq;
	Tue, 26 Mar 2024 04:08:00 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roy6O-00000002zuh-3FgL
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 04:07:58 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-368650da308so25979055ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 21:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1711426070; x=1712030870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZR8vGousVKLTwUEi/21KojnQf3J0MYLn3UhiAu3VJo=;
        b=InXwmtj3Ah2arT42MFkq8wRko4UIA8LOWMsvVfsi9CyNDwCQy/ZwVYvVe3WPdImHXR
         kGnY1wMXp7IlwkD4cCu456HGZBUoxbOI9UlKqnwcLpMfZHOfNIYIx8MFkmf20y2fJQ9g
         EM6WKWcSUsWCFIDbqB3mVYRAHA/CWJDbc1TxYjL9CA6MC4pKrsDOO0jD9D1OCsX/mu+D
         ZBokIzJtWacMzmY1aHGAbvmUEqQQyMiiUqTPxKGKbIWQPWH481psr1lDFdNc28Cg5S6t
         qI8xHZvx/f86HXPK6jqwdyVL62Cy1Ft85ZmOHzBVgnMSDqdTN2kt4TYUSaBo7viGS/su
         i6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711426070; x=1712030870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZR8vGousVKLTwUEi/21KojnQf3J0MYLn3UhiAu3VJo=;
        b=NvoOd5omZDI8r/ihS7zs8Cq22uY7h12awF4TvAnBw9VtI7QM52UMqmE3xkNnienvUj
         eBwac/Th4m6LzLHrWZ08lL+Ygn/66aEtDKFt0wsNi5BeNWNKB8xHRiRyCV7HRdLyjIvp
         CUQspNoqANQ8lzml3dG72fHO3m7R5HQ6APr/K896Gf4poUhNqg5EJbAPis9UqReCX/K7
         DjhlJpXG37dIO6ZLeK7G/UA9EUvYVew5eJtpP8tD+owFooy2jZncJN7H/pTjlttPDtMK
         mbmFNWTU2cht1vx3lAL/y8wYvPbaxjd4dxCxYY3gGs5f1YCXPdCqpYomnTSGuqz9QBSD
         dK2w==
X-Forwarded-Encrypted: i=1; AJvYcCWREM4EeEtUk4KMJKgmm6a3xD73giVa+R+yhoeGYvsoxPEs3mC9sL3sWYtw0PrG/Ady+KU8hmtppakgPwtMGR7ORqCaQpD/NhYPG5zvybl3
X-Gm-Message-State: AOJu0Yyvs+d4rsydpdYE3XVqSDxOuvbWAvn7Ad6NWpCJi9kORXjMh86i
	ydfGgwUiW0Asnx6FllLhv9VFIVmjDZbOwMiSFQPwScSXwOsJE18R0tu3ywuLvFsTK30X0WQZwVV
	/dV9IeU6UMfjB42TG+zxYOKKekRGs2PcjKED/nw==
X-Google-Smtp-Source: AGHT+IGt0bGGYQWpx67EJCwTtVelUSMNY0t2MZE8NdaGGuCuPZUdwQH0ix+HnbyiD5ovliqTKGlpmL5Ocw1jnFJWOTM=
X-Received: by 2002:a92:d782:0:b0:368:9850:82c1 with SMTP id
 d2-20020a92d782000000b00368985082c1mr36365iln.13.1711426070652; Mon, 25 Mar
 2024 21:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240321085041.1955293-1-apatel@ventanamicro.com>
In-Reply-To: <20240321085041.1955293-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Mar 2024 09:37:39 +0530
Message-ID: <CAAhSdy1jAjGJR=+ZtfLpfzgctJ4cA==nCXJ0FEDBF_vJLNJBWA@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM RISC-V APLIC fixes
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_210757_083930_FF8FAB4E 
X-CRM114-Status: UNSURE (   9.49  )
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

T24gVGh1LCBNYXIgMjEsIDIwMjQgYXQgMjoyMOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEZldyBmaXhlcyBmb3IgS1ZNIFJJU0MtViBpbi1rZXJu
ZWwgQVBMSUMgZW11bGF0aW9uIHdoaWNoIHdlcmUgZGlzY292ZXJlZAo+IGR1cmluZyBMaW51eCBB
SUEgZHJpdmVyIHBhdGNoIHJldmlld3MuCj4KPiBUaGVzZSBwYXRjaGVzIGNhbiBhbHNvIGJlIGZv
dW5kIGluIHRoZSByaXNjdl9rdm1fYXBsaWNfZml4ZXNfdjEKPiBicmFuY2ggYXQ6IGh0dHBzOi8v
Z2l0aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAo+Cj4gQW51cCBQYXRlbCAoMik6Cj4gICBSSVND
LVY6IEtWTTogRml4IEFQTElDIHNldGlwbnVtX2xlL2JlIHdyaXRlIGVtdWxhdGlvbgo+ICAgUklT
Qy1WOiBLVk06IEZpeCBBUExJQyBpbl9jbHJpcFt4XSByZWFkIGVtdWxhdGlvbgoKUXVldWVkIHRo
aXMgc2VyaWVzIGZvciBMaW51eC02LjkgZml4ZXMuCgpUaGFua3MsCkFudXAKCj4KPiAgYXJjaC9y
aXNjdi9rdm0vYWlhX2FwbGljLmMgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
