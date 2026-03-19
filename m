Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9190B1090220
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xd1LPxwCRdD90daZ73dojnKX5mNoI6PfBd1ZH15nBTw=; b=YVayCQnQpSt5Kd
	dHkvtuQeGpEHeiyMnCgwvLO63ECapxbE57fOdToibnj2NrhfUnEBZG/3TIHiFqFvsI5bpy1epfO2z
	ZbdyzNkcUgppdLwYbLxz3JgswN+dRG0F9ZmoKoeHe9S0AD7fEmCVv4sR/rYhT+iNlOv965kUbRkkc
	ngozfXwqwnAz+1jKklxmvmNCFP4S/QerypYQUXHhe1VkWcmoI+m6FwUbNl3hgPooy5dB6gbVHXmay
	sju+k38DuOH/BABrexsaozBjmhDznDzl9doK4xJVS1jFLyXioRFGRl1snU2iSsgnAkoTeH1YpziCS
	113EhJAJubrRGnZWjo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DZk-0000000AhSt-0Wu4;
	Thu, 19 Mar 2026 13:38:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DZi-0000000AhSk-2VTW
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 13:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE4F360097
	for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 13:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652C7C2BCB1
	for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773927489;
	bh=u0WZcBFjGfVVXTR+0klsgR/jkNeMF8nCZsqQ5gYd60g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KeL9dqCgwJZ5VvGWvCrCaH57QKHEMs57V78gGtqDMeSWyf1iBR6Vhh+DXCYGFQZrT
	 4ySWgP5/Q60fqCrZy5+0go57lMRJ5vMdCPPq2qGA7Sme/E7wM8zt6y1SR5Jc4IQVrC
	 yDjPAF2EGkTZI5uYkVSaO6RmejMbg70Y1eiL7ycsxojvqOMMtfP9WVSQmDG4S46Et5
	 SttpOlQKnlLPy72UwANXXm1/fdcROyXOr+LtUSuwL/zo0i6MhO30J1rc3YJcAlO3Lb
	 u2Xf/iMz3RsN3Y22by/a+GWP+it4IcF4IzUuhwo2GgmiS4Cq3N3MJg6SFLIO0HKr3q
	 1AOj2b6JiRKiA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-797ab169454so11136077b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 06:38:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV79b+ZnU37o4K7adgXH+WuOm9P/Ku1g3Cwp+iaRvLWnES/aihzTmUP3tZc+nKwhscZy1N/n3TtPfghyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+kmKru8KbCpzUU4HzwYX2fyxRv6tA33+AVmalMBtP1p+IntHx
	7MwM8pLi2LKAzk+oYL93B2fKMte3zNQPs9EsWvHyXxp9evXHB+ruC3qDdqfairTwEg2AyQOJzRL
	rdsjcaFQ3GC9bE6vkWdCQ0ymp9saaMko=
X-Received: by 2002:a05:690c:9988:b0:79a:5961:c804 with SMTP id
 00721157ae682-79a71abd766mr77845987b3.37.1773927488750; Thu, 19 Mar 2026
 06:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-vigorous-steadfast-04afdcc9e524@spud>
 <CAD++jLnXBW7FDdGRt3rN5Up6GdRvu-Ywsg8jfepjEf4rBjPQ6A@mail.gmail.com> <20260316-verify-revise-c0ad49fc208e@spud>
In-Reply-To: <20260316-verify-revise-c0ad49fc208e@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:37:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLkdDs+KjKq6BVT6e1zEtNwVZGiM7ZDS3e7AmiD39+d5WQ@mail.gmail.com>
X-Gm-Features: AaiRm51u5GOrVKK05VvMFBE_XzpbQvYNev3NWNBlgtGjZsi_ytfM5HqScEcM800
Message-ID: <CAD++jLkdDs+KjKq6BVT6e1zEtNwVZGiM7ZDS3e7AmiD39+d5WQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] soc: microchip: add mpfs gpio interrupt mux driver
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTE6NTnigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBJJ20gZ3Vlc3NpbmcgeW91J3JlIG5vdCBsb29raW5nIGZvciBs
b29raW5nIGZvciBtZSB0byBiZSB0aGUgYXJiaXRlciwKPiBidXQgSSdkIHNheSB0aGF0IHRoZSBt
dXhpbmcgYXNwZWN0IGlzIHByZXR0eSBpbXBvcnRhbnQhCj4gT24gYSBzZXJpb3VzIG5vdGUgdGhv
dWdoLCB0aGUgbGFjayBvZiBhbnl0aGluZyBpbiB0aGUgaGFyZHdhcmUgdG8gZG8KPiBtYXNraW5n
IGV0YyBpcyBrZXksIGl0J2QgaGF2ZSB0byBiZSBub3RoaW5nIG1vcmUgdGhhbiBhIHJlZ2lzdGVy
IHRoYXQKPiBkZXRlcm1pbmVzIHJvdXRpbmcuCj4gVGhhdCBzYWlkLCBldmVuIHRoZSBzaW1wbGVz
dCBtdXggc2hvdWxkIGJlIGFuIGlycWNoaXAgaWYgcmVjb25maWd1cmF0aW9uCj4gYWZ0ZXIgcHJv
YmUgaXMgdG8gYmUgc3VwcG9ydGVkLgo+IFRoYXQnZCBtYWtlIHRoZSBkZWxpbWl0ZXIgImEgc2lt
cGxlIG11eCB0aGF0IHlvdSBzZXQgYXQgcHJvYmUgYW5kIG5ldmVyCj4gdG91Y2ggYWdhaW4iPwoK
VGhpcyBkZWZpbml0aW9uIHdvcmtzIGZvciBtZSwgYXMgbWFpbnRhaW5lciBJIHJlYWxseSB3YW50
IHRvIGJlCmFibGUgdG8gZGV0ZXJtaW5lIGhvdyBhIGNvbnRyaWJ1dGlvbiBzaG91bGQgbG9vayBm
b3IgZWFjaCBjYXNlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
