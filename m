Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E053F1098783
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 13:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFHO1+cISA+5XcUOjSQoKMNVgok97+geenNgYNCfkO4=; b=Fyt1hjKMC3xzwO
	uOsdI7nr2AyD3BL1j+6zhoUKAwaqlyolsj7wuUkZvToRwfZa9hURxvoD9wrv9AIMngpkyRAakHD/8
	V5JzNVzYKIuqMtOktTYvbg+wtkkXPpHMTH9xd1DGVBfCnrN7cqvaaI5cGbtOgjv19l4dIfhwvNjtO
	V/iQEtZ+LrSmYfufkMLc9lYK0/ei1SL716VivlWsaAVPYRrklM4sCsCs7/5YhNLU1HFfyIr7AOf9j
	bKynngFTal8ql+ZvbnNfl2/45Y61a+nRcuzQ3J62c93EobpGCMtDz7bCV3wQ0x+I/I6ns5i4febBH
	W4OKmUK7CKaKtuJWtn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZTu-0000000Cosg-0BLA;
	Fri, 20 Mar 2026 13:01:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZTs-0000000Cos9-0YnI
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 13:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E791E4456B
	for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 13:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A29C2BCB8
	for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774011694;
	bh=ft9rf8Rf5SBMUWLWL9lzNo9iFxMUnMLxk5mkkO6wvkc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p2FyKNYorQ1gZLgklkjlwb9uy1me9keQ2o80e1E6oIcNKVGmXVZyxSKrfXKNFP0Jw
	 qlUST9ymdNR0GiUQPC+CQhXBVj9GD6vPOQrgtgWZcJ4Q4QVPyBprjXdZXxmPQCNTFF
	 yKfV+mDBf5db2gC3mg66839cM52dvud/ny+H54C8aitmBjvncoHfdT1ryYLnVb5jHZ
	 HMOV+7mPYKvRKi9m9BZTTiQJBGt1lDDaYcLMpZOYSNI8tzw87+xYZ5bWanSsIABSuI
	 UfuUXS381wMOxkiAyY39rjiaav+/jabCgbRtaTj2xJJCvtIemCbHop15OJQDM8rdA+
	 hCAmIqg8AGKUw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78fc4425b6bso19678237b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 06:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxhmC4yWPHIK+NR2knsGj4AvGgf0WeoDfnW7kiMEXfr95rz3p6YtGgwWvXBODUoUEftxHqWleMzSlSNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpr3vscRVvcHEQxGBJG8jGJFz0WnUutfihEGeJCnaTbRH7oUkv
	u0/7AV4VWlXJmf/+khTRr0sTo2WtPnTGKsVrU3QkamMtybqh40gVP867J9N6K0Gaeb8O5FyiZSV
	PU7RuhZThr0bFLhN2IBBt9/yNdUrUzDs=
X-Received: by 2002:a05:690c:e059:b0:79a:8e70:e3e2 with SMTP id
 00721157ae682-79a90c1da1dmr24585607b3.50.1774011694012; Fri, 20 Mar 2026
 06:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-gift-nearest-fd3ef3e4819b@spud> <20260318-fondly-tradition-90b8241f0cc8@spud>
In-Reply-To: <20260318-fondly-tradition-90b8241f0cc8@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:01:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLncq3YPeAOi=2A+mVV=Z0nuoWS_1cGJP3gPUQ1C2=Nczw@mail.gmail.com>
X-Gm-Features: AaiRm53Ce2l7MamKLYOuY5ZyQXcZOamVTEaSdvWkIylypWTwGTBZlqqQvGq_X8Y
Message-ID: <CAD++jLncq3YPeAOi=2A+mVV=Z0nuoWS_1cGJP3gPUQ1C2=Nczw@mail.gmail.com>
Subject: Re: [PATCH v13 1/5] dt-bindings: gpio: fix microchip,mpfs-gpio
 interrupt documentation
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_060136_209958_40354C77 
X-CRM114-Status: GOOD (  17.20  )
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

T24gV2VkLCBNYXIgMTgsIDIwMjYgYXQgMTI6MDTigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+Cj4gVGhlIG1pY3JvY2hpcCxtcGZzLWdwaW8gYmluZGluZyBzdWZmZXJlZCBn
cmVhdGx5IGR1ZSB0byBiZWluZyB3cml0dGVuCj4gd2l0aCBhIG5hcnJvdyBtaW5kZWQgdmlldyBv
ZiB0aGUgY29udHJvbGxlciwgYW5kIHRoZSBpbnRlcnJ1cHQgYml0cwo+IGVuZGVkIHVwIGluY29y
cmVjdC4gSXQgd2FzIG1pc3Rha2VubHkgYXNzdW1lZCB0aGF0IHRoZSBpbnRlcnJ1cHQKPiBjb25m
aWd1cmF0aW9uIHdhcyBzZXQgYnkgcGxhdGZvcm0gZmlybXdhcmUsIGJhc2VkIG9uIHRoZSBGUEdB
Cj4gY29uZmlndXJhdGlvbiwgYW5kIHRoYXQgdGhlIEdQSU8gRFQgbm9kZXMgd2VyZSB0aGUgb25s
eSB3YXkgdG8gcmVhbGx5Cj4gY29tbXVuaWNhdGUgaW50ZXJydXB0IGNvbmZpZ3VyYXRpb24gdG8g
c29mdHdhcmUuCj4KPiBJbnN0ZWFkLCB0aGUgbXV4IHNob3VsZCBiZSBhIGRldmljZSBpbiBpdHMg
b3duIHJpZ2h0LCBhbmQgdGhlIEdQSU8KPiBjb250cm9sbGVycyBzaG91bGQgYmUgY29ubmVjdGVk
IHRvIGl0LCByYXRoZXIgdGhhbiB0byB0aGUgUExJQy4KPiBOb3cgdGhhdCBhIGJpbmRpbmcgZXhp
c3RzIGZvciB0aGF0IG11eCwgdHJ5IHRvIGZpeCB0aGUgbWlzY29uY2VwdGlvbnMKPiBpbiB0aGUg
R1BJTyBjb250cm9sbGVyIGJpbmRpbmcuCj4KPiBGaXJzdGx5LCBpdCdzIG5vdCBwb3NzaWJsZSBm
b3IgdGhpcyBjb250cm9sbGVyIHRvIGhhdmUgZmV3ZXIgdGhhbiAxNAo+IEdQSU9zLCBhbmQgdGh1
cyAxNCBpbnRlcnJ1cHRzIGFsc28uIFRoZXJlIGFyZSB0aHJlZSBjb250cm9sbGVycywgd2l0aAo+
IDE0LCAyNCAmIDMyIEdQSU9zIGVhY2guIFRoZSBmYWJyaWMgY29yZSwgQ29yZUdQSU8sIGNhbiBv
ZiBjb3Vyc2UgaGF2ZQo+IGEgY3VzdG9taXNhYmxlIG51bWJlciBvZiBHUElPcy4KPgo+IFRoZSBl
eGFtcGxlIGlzIHdhY2t5IHRvbyAtIGl0IGZvbGxvd3MgZnJvbSB0aGUgaW5jb3JyZWN0IHVuZGVy
c3RhbmRpbmcKPiB0aGF0IHRoZSBHUElPIGNvbnRyb2xsZXJzIGFyZSBjb25uZWN0ZWQgdG8gdGhl
IFBMSUMgZGlyZWN0bHkuIFRoZXkgYXJlCj4gbm90IGhvd2V2ZXIsIHdpdGggYSBtdXggc2l0dGlu
ZyBpbiBiZXR3ZWVuLiBVcGRhdGUgdGhlIGV4YW1wbGUgdG8gdXNlCj4gdGhlIG11eCBhcyBhIHBh
cmVudCwgYW5kIHRoZSBpbnRlcnJ1cHQgbnVtYmVycyBhdCB0aGUgbXV4IGZvciBHUElPMiBhcwo+
IHRoZSBleGFtcGxlIC0gcmF0aGVyIHRoYW4gdGhlIHN0cmFuZ2UgbG9va2luZywgcmVwZWF0ZWQg
PDUzPi4KPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+CgpNYWtlcyBzZW5zZSB0byBtZSEKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzd0BrZXJuZWwub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
