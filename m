Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0B9C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmggS1Kbf1KpOR0tLMsuFA1TnYa5pnDURXutRxU3eqQ=; b=d0lcVEMkY7VYRr
	1LHsCpWC6zIMHS6kWruvWn5uvBhkCqtNQaTwqGMuR4Zqt2cCKiR+Zqd0vuOAxR11Ib+rYfBcHDXoK
	XUOoGLBuwQDcGCaPiLBiKQdvpnOchd3bOktm+P7J4Lp1KwbX6FfUTfTJOAPzov2ghoZoq/9mcJzDW
	H5O9wlY9xUYQVcqm4i3PJt7yKsISq8nqyCaAE1bfXsLSNk2xcHdb0LPNw6qhlj1DbPJ6CPVVNnGvb
	0wAIA2CFazRRqzNxKKfZuqGpgJhKD9lR6h/WsgKsui02pVYVEzBeXVIlk4bRFN4zLc6trdQxiKUuT
	JSGWXszWDZkmf4SKOkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVEt-00000004FXd-32yv;
	Tue, 01 Jul 2025 07:17:11 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUVc-000000049i8-3MMm
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 06:30:26 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553b6a349ccso3233390e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 23:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751351422; x=1751956222; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jymfu3xRxUL4nTv5dvSQBmcbQG4COg2M3oUtazcjnU=;
        b=Rsc5VRHqeAE5Y8VndIekRFspZPbyzkg+0yn9JRvaU/+oSIExx1ikytRVMWgUAAzhMr
         qArJuadF4CFthFfqL2yoUM27VGQr+CeLQBR9ko7Nv0txp7PXZdhW9vp+972U7Mt0tFjF
         t3pQgaW9s593sNVyb+B+zZb6SysxI5u47fykE3EjAHDOy/rl9GICdA9p91Z+VLdalnMM
         lvLXAw2AE48zcoWaemTKSoPZIEI4XuOEa9nZ/I8my+5OtbmNZhF4f4qwXSG0zfsdFnt/
         qIpLVw4AWg/Vla8kCXMqhk46rPKc/5ZrKsDBUV5Om86uSh2KroFYDKlhJDkgG5tGQQQ5
         /Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751351422; x=1751956222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jymfu3xRxUL4nTv5dvSQBmcbQG4COg2M3oUtazcjnU=;
        b=lkYXr6U6vq8IXv+wp0WcSYvljUeif3QlY6fOD0bZE+Dqg7O04zhY8dP3mWxhhQt6fV
         EopHwfUVX7zsr2Y1zPdkVc5hHZWzpMVYTW6cXu+Ai3GrvM9SIMnq3ykp7Fst+CRxXhqO
         ZIvZRJQr6gDFhJR7/PjdMQidmf6rJzh/pVvRGdM/95YZgT31IdqADBU28GfNaxgAfdZ9
         nfvi/mdek+Ej7RlDP4JfelBkO5EOrxpUkMbKuRW9H1a0jhltWLLCrBUMObY+JDtsfa3X
         fcjF2qkXdz8f+Nw2vHa6/7V/Sehud3HOOVGQznfG2AcXiQUGyWTco09sPXU+1bx1huYb
         VwjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeivkCHe2ejHM0XWX0tsGNHp8VUeySwzp9muoYgZAK5yJi8dKAGHtdg7mH2eWUlzNRIHUlYAVnsAwQng==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKXjxPLNJFn7afMld4XZ4gPdKY/yMh6Sm28x5q8cmVOTXVP3xh
	igrsXj8yoqESxlbXwLd5YiTdWskAVAxPVq4TjFx5BpUHuVn+1W6xDZauHa0t6lL2DufdYgnKAXm
	ndjkKoUzJtyZo5pTeQoDrVpzYRyKq0Ax77jzK8kuWEg==
X-Gm-Gg: ASbGnctvKwZlZ0+Gk7E2KkOnt6a2Kpo1AYuX+LXO2UCxDqcrnQ5cdacM0kIHNMfhqZo
	NAth99+9ZblTtSYN0CBh9RuhmINQPxFpYX/8xHxat4Yh0bX1FSn5aTqS7wLY7dqQQ52wDexg/os
	c/5z76OObRass0vx7QTXFY/XAjMZl8oCzTlPXxg57j5n/4
X-Google-Smtp-Source: AGHT+IGH+LGsRYJu48HNl0J1fqNWuehHDcqXDQ2apcZ5zy2p4HTOSTuf2WNZWxIzC2FQvJFiTjte6PqMiOdGmU15sTY=
X-Received: by 2002:a05:6512:acd:b0:550:d4f3:84a6 with SMTP id
 2adb3069b0e04-5550b89706bmr5181580e87.33.1751351421803; Mon, 30 Jun 2025
 23:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250625161715.1003948-1-apatel@ventanamicro.com> <87wm8tmcsr.ffs@tglx>
In-Reply-To: <87wm8tmcsr.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 1 Jul 2025 12:00:09 +0530
X-Gm-Features: Ac12FXxY7r-9px3Hqf4aneQ_IL7BH8XKIbw1hzdqfKKMngLAn19g0L7LHBLnNaM
Message-ID: <CAK9=C2Ue36iF8X17n-D70BkMk69bGKb+8dSmro6SEo5i2d+OSg@mail.gmail.com>
Subject: Re: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_233024_840946_51A61DA1 
X-CRM114-Status: GOOD (  20.85  )
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

T24gTW9uLCBKdW4gMzAsIDIwMjUgYXQgOTozOeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDI1IDIwMjUgYXQgMjE6NDcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4KPiAkU3ViamVjdC4uLgo+Cj4gaHR0cHM6Ly93d3cua2VybmVsLm9y
Zy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9tYWludGFpbmVyLXRpcC5odG1sI3BhdGNoLXN1Ympl
Y3QKPgo+IElzIGl0IHRoYXQgaGFyZD8KCk5vdCBzdXJlIHdoeSBJIGNob3NlIGEgZGlmZmVyZW50
IHN1YmplY3QgcHJlZml4IHRoaXMgdGltZS4gSSB3aWxsIHVwZGF0ZQp0aGlzIGluIHRoZSBuZXh0
IHJldmlzaW9uLgoKPgo+ID4gV2hlbiBpbmplY3RpbmcgSVBJcyB0byBhIHNldCBvZiBoYXJ0cywg
dGhlIElNU0lDIElQSSBzdXBwb3J0IHdpbGwKPiA+IGRvIGEgc2VwYXJhdGUgTU1JTyB3cml0ZSB0
byBTRVRJUE5VTV9MRSByZWdpc3RlciBvZiBlYWNoIHRhcmdldAo+ID4gaGFydC4gVGhpcyBtZWFu
cyBvbiBhIHBsYXRmb3JtIHdoZXJlIElNU0lDIGlzIHRyYXAtbi1lbXVsYXRlZCwKPiA+IHRoZXJl
IHdpbGwgYmUgTiBNTUlPIHRyYXBzIHdoZW4gaW5qZWN0aW5nIElQSSB0byBOIHRhcmdldCBoYXJ0
cwo+ID4gaGVuY2UgSVBJcyBiYXNlZCBvbiBJTVNJQyBzb2Z0d2FyZSBpbmplY3RlZCBNU0kgaXMg
c2xvdyBjb21wYXJlZAo+ID4gdG8gdGhlIFNCSSBJUEkgZXh0ZW5zaW9uLgo+ID4KPiA+IEFkZCBh
IGtlcm5lbCBwYXJhbWV0ZXIgdG8gZGlzYWJsZSBJUElzIGluIElNU0lDIGRyaXZlciBmb3IgcGxh
dGZvcm1zCj4gPiB3aXRoIHRyYXAtbi1lbXVsYXRlZCBJTVNJQy4KPgo+IFdoeSBkbyB5b3UgbmVl
ZCBhIGtlcm5lbCBwYXJhbWV0ZXIgZm9yIHRoYXQuIElmIHRoZSBwbGF0Zm9ybSB1c2VzIHRyYXAt
bgo+IGVtdWxhdGlvbiwgdGhlbiBkaXNhYmxlIHRoZSBJUEkgbXVjayBhdXRvbWF0aWNhbGx5LCBu
bz8KPgoKVW5mb3J0dW5hdGVseSwgd2UgZG9uJ3QgaGF2ZSBEVCwgQUNQSSwgb3IgYW55IG90aGVy
IHdheSBvZiBkaXNjb3ZlcmluZwp3aGV0aGVyIHVuZGVybHlpbmcgSU1TSUMgaXMgdHJhcC1uLWVt
dWxhdGVkLiBJbiBmYWN0LCB0aGUgRFQgb3IgQUNQSQpwYXNzZWQgdG8gYSBLVk0gR3Vlc3QgaXMg
dGhlIHNhbWUgaXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIgdW5kZXJseWluZwpJTVNJQyBpcyB0cmFw
LW4tZW11bGF0ZWQgb3IgYmFja2VkIGJ5IGhhcmR3YXJlIElNU0lDIFZTLWZpbGUuCgpVc2luZyBz
b2Z0d2FyZSBpbmplY3RlZCBNU0lzIGFzIElQSXMgaXMgcHVyZWx5IGEgc29mdHdhcmUgY2hvaWNl
IGluIHRoZQpJTVNJQyBkcml2ZXIgc28gdGhpcyBuZXcga2VybmVsIHBhcmFtZXRlciBhbGxvd3Mg
dXNlcnMgdG8gb3ZlcnJpZGUgaXQuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
