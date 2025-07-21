Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176A6C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12yzt+mnnCcN3loPXrw+9IpkDJRp2DxT/LAFNcuIPpA=; b=2bdu2qZIV3cYej
	fZmRGXu3Md20848gzkfOQyzzFNwU+fjNTGWVhtz6mkjQrbd1k6TCcJB2Vmnkshf7+nv7OSid0Am3x
	rSTj1pSO8p3Qq34eEAZiV0ivUYAHAbuhXTtwIDmp+PPjzJLH3njkMRqYuzyKxd0BN/2YEdpNmF42d
	kjT3lXdXbat/SqvMinhJip5CZP7Tagjkd7QTDpb2oPz4kMF3XEiuzNbgxH90HLvTe09IedQeDRZjd
	Kg9QXkAM63XQB8CcMT5iHl8tXfzVjCqSaWh3QD4/o7FRleNEz7d2xQnnesUXQIhMsaZEA21uJGxwG
	+vigiIFQ5iFJ+ty2bmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtba-00000000ChS-1BX4;
	Mon, 21 Jul 2025 16:43:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udruN-000000000Vy-3Go7
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 14:54:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-456127fa3d6so1789455e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Jul 2025 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753109666; x=1753714466; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPgUDPT1QtTlhrXqgycplGAAUMCbMxWO7skkaLEHnJ4=;
        b=S/O1X2cNo2NE6TOPDgZ9TEmRThozCJAuJaCTPzZoMJvXuSl9v6bpo6RNAkZFFZDCYo
         y+17bHOVI8peilsNkYbzfex9VuBmKrxBrBPINwSiP2e2EvmmkTYKCrnaHVBovThS3LAQ
         u1kcvKyQMwgEU6+MmQmMHN3fJ/+SITsGc8F7Z6jjL4TMJx5ddrcZ9wWVI+kJy3aq/FnS
         /zXJDJye01wojU4vEFu3YQ26yt/l3fdtbFLQAa32BRHPZEkpEe6dxoisXrmn/wC6nJiO
         PFbp8UiD5Qz9Ks6o3Gd8e1EFiNJ1YX8ki9n/mkKST5AQe6QHzSUOBLOqqM56DCNDfEZ2
         SnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753109666; x=1753714466;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OPgUDPT1QtTlhrXqgycplGAAUMCbMxWO7skkaLEHnJ4=;
        b=kJA7F5+4vvq27a9TrXnnpPnoi0t2UvPJgCZEtCYC6r+6Ki8F21fRvlIo5J4TTz+rHR
         45eFiBKfQi5pt+ni6Qero1VCLzda1KsGtwS7EnmNUvpd0IiJLp87MmAxtWi06jNiEqs3
         g9ENOxMOyjaC3oHmt9nbHcgXK8w6cfnQ09yMfPI4zUlMRUj1DHYtIO2aGFPVFj00UY46
         TW5fgfmwSpGvdQkDXvTFadoVZn9DCe+9ggL3aXW5m3sy91g4+eAR+HxcybUaNwulEeVJ
         c3HC73n6GA2FIro9yIrPES5vk+0mf4bO7tda/Av8hKdpH4sRIuGri1640UMQEA99QL2g
         QrLg==
X-Forwarded-Encrypted: i=1; AJvYcCWB1H31kltih8/F4idR+JVlWZ25e9lzpkEhSaLGG6MWc6VdXZHtir1Bd9HSE37uFqlgbXSmw5XCCO34Uw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfb0bF/V0ZG6jxkkEr4mFCO2ucFRwOH5jD/Xj9T7h0IamxHI14
	zSctJePLURLcUp4JAOud9KY9DywnOEyKUL+4u9Q9Zg2t0FfOqB/EVLa3K1mGhbGvJ9Q=
X-Gm-Gg: ASbGncug/wE0T7Ck14it2HywBFNOKx4EQeM7wyHE2zQt95gOq9VGm3mJ7rYiI6KZTjE
	v8vvm5Qn1D8mpIB2TPX4IMbfX8Bg7KjLbIAzBI35Heg8pT3Pt8YoANFzSR9QieB4SwY5eJbEYbK
	thxAs0wLjhUEZ/iTWpQYHzEYZg+UT7sw33C4MnNiNZDk1UTE3l8b2vofIsfw0oSRvM+rwaJh3Mr
	eFUEo7Y2xECOZ8P4ubQ5xb6vF+kFEswAb35YeucEjdDhR5oCqMQjMV/3E7q2UkQ7ra7+YgKOaLS
	g7Geiba0Y8FYiE0+6671sn+477gdCdJgd71GuAQoQjnniNDCoYa7ThEsGGKgi8LEYiGPALqGvFL
	myDEAiZN29gOVhRDou+Uzn8FvOszu7Q==
X-Google-Smtp-Source: AGHT+IFB4AvyvQNHh9zFnz+txnd7YiW5vkLPTVzzu8Lge3qC27BCgs7ueXBXbFWRBZzVsv1n9pCaCg==
X-Received: by 2002:a05:600c:1c21:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-4563b422b13mr48484025e9.8.1753109666105;
        Mon, 21 Jul 2025 07:54:26 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:25d5:2321:c8db:1609])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b61ca5c8c9sm10755685f8f.85.2025.07.21.07.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 07:54:25 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 21 Jul 2025 16:54:25 +0200
Message-Id: <DBHTIDY0HRM0.2B8L1WG7IBCXM@ventanamicro.com>
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Drew Fustini" <fustini@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@rivosinc.com>, "Alexandre Ghiti" <alex@ghiti.fr>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Samuel Holland" <samuel.holland@sifive.com>,
 "Drew Fustini" <dfustini@tenstorrent.com>, "Andy Chiu"
 <andybnac@gmail.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250719033912.1313955-1-fustini@kernel.org>
 <DBHQK4W9CL9F.1WM8JFVDQZ44F@ventanamicro.com>
In-Reply-To: <DBHQK4W9CL9F.1WM8JFVDQZ44F@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_075427_820697_0A44B9DA 
X-CRM114-Status: UNSURE (   9.34  )
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

MjAyNS0wNy0yMVQxNDozNTozOCswMjowMCwgUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRh
bmFtaWNyby5jb20+Ogo+IFNob3VsZG4ndCB0aGUgUklTQy1WIExpbnV4IHN5c2NhbGwgQUJJIGJl
IGRlZmluZWQgc29tZXdoZXJlPwoKVG8gY2xhcmlmeSB0aGlzIHBvaW50LiAgTXkgaXNzdWUgaXMg
d2l0aCB0aGUgZm9sbG93aW5nIHBhcnQgaW4KRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L3ZlY3Rv
ci5yc3Q6Cgo+PiAgQXMgaW5kaWNhdGVkIGJ5IHZlcnNpb24gMS4wIG9mIHRoZSBWIGV4dGVuc2lv
biBbMV0sIHZlY3RvciByZWdpc3RlcnMgYXJlCj4+ICBjbG9iYmVyZWQgYnkgc3lzdGVtIGNhbGxz
Lgo+PiAgWy4uLl0KPj4gIDE6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi12LXNwZWMv
YmxvYi9tYXN0ZXIvY2FsbGluZy1jb252ZW50aW9uLmFkb2MKClRoZSBJU0EgZG9lcyBub3Qgc2F5
IHRoYXQgdmVjdG9yIHJlZ2lzdGVycyBhcmUgY2xvYmJlcmVkIGJ5IHN5c3RlbQpjYWxscy4gIEFs
bCB0aGUgSVNBIHNheXMgaXM6CgogICJUaGlzIEFwcGVuZGl4IGlzIG9ubHkgYSBwbGFjZWhvbGRl
ciB0byBoZWxwIGV4cGxhaW4gdGhlIGNvbnZlbnRpb25zCiAgIHVzZWQgaW4gdGhlIGNvZGUgZXhh
bXBsZXMsIGFuZCBpcyBub3QgY29uc2lkZXJlZCBmcm96ZW4gb3IKICAgcGFydCBvZiB0aGUgcmF0
aWZpY2F0aW9uIHByb2Nlc3MuICBUaGUgb2ZmaWNpYWwgUklTQy1WIHBzQUJJIGRvY3VtZW50CiAg
IGlzIGJlaW5nIGV4cGFuZGVkIHRvIHNwZWNpZnkgdGhlIHZlY3RvciBjYWxsaW5nIGNvbnZlbnRp
b25zLiIKCndoaWxlIHRoZSBSSVNDLVYgcHNBQkkgc2F5czoKCiAgIlRoZSBjYWxsaW5nIGNvbnZl
bnRpb24gZm9yIHN5c3RlbSBjYWxscyBkb2VzIG5vdCBmYWxsIHdpdGhpbiB0aGUKICAgc2NvcGUg
b2YgdGhpcyBkb2N1bWVudC4gUGxlYXNlIHJlZmVyIHRvIHRoZSBkb2N1bWVudGF0aW9uIG9mIHRo
ZQogICBSSVNDLVYgZXhlY3V0aW9uIGVudmlyb25tZW50IGludGVyZmFjZSAoZS5nIE9TIGtlcm5l
bCBBQkksIFNCSSkuIgoKV2UgbWFkZSBhIGNpcmN1bGFyIGRlcGVuZGVuY3ksIG1pc2ludGVycHJl
dGVkIHRoZSBJU0EsIGFuZCBwcm9iYWJseQppbXBsZW1lbnRlZCBhIHN1Ym9wdGltYWwgc3lzY2Fs
bCBBQkkgLS0gcHJlc2VydmluZyB2ZWN0b3IgcmVnaXN0ZXJzCnNlZW1zIHN0cmljdGx5IGJldHRl
ci4KCj4gSG93IGNvbWUgd2UgY291bGQgaGF2ZSBicm9rZW4gaXQgd2l0aCA5NjU3ZTliN2QyNTM/
CgpXZSBjaGFuZ2VkIHRoZSBBQkkgb25jZSwgc28gbWF5YmUgd2UgY2FuIGNoYW5nZSBpdCBiYWNr
PwoKVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
