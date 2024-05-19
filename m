Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052EAC25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 19 May 2024 18:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJu6jEN4NOMozkY3Id4NeVkWR6iZlw1jq+Ck1UEFCLs=; b=KIgRQPZkWirR9V
	0mc0YiK+rSf4wWcKbnvEYoMOuTsrUFf00vAoHxChvWnMhwJa0PCVt8LitRhYIYchQvL1t6N+4o/rH
	6t9dNqTFZ4kc07Bn/LVVk6GCQwpEUoBVmcbB4HxyoVq82Gum87N2cCSCqox+8ZcxNneRHh70NlC35
	W+2Zo9hjV8lT1dBjW0hxivKI1V3mDbJTitqmSTaRgKnwOsrMGCFWvnskmBfDSuL3wPOeszxGo2t5q
	KRgtAA8uHpKWoPjneL6LfPkV20+pbJ5klZSR7sLnjsl+QXPKjNfiYg6gHYdVN106DefsYWiYA/Jpc
	B5p5lzok8Wv8Ep0t4vIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8ksZ-0000000CSTH-1BQZ;
	Sun, 19 May 2024 18:03:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8ksW-0000000CSSi-2fSm
	for linux-riscv@lists.infradead.org;
	Sun, 19 May 2024 18:03:25 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-572669fd9f9so6758296a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 19 May 2024 11:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716141802; x=1716746602; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/YRdnvMtWMhxlbEh050IDdP/xmTW8QB38Z1f1o0cz0=;
        b=mivFJaIr57fpA6oVVHViWdG3EZENd9V1K+8P9hN3rrGlYtpWGCBcgCL2Sy5VkUFXDk
         HbV6PoOx2zwHk7SAQ+ZV/eJprCGOiD2L+gs7sNzc+TCifWuiXFLfvk7wDWJLDqQxpijp
         uKahRshryouHECyjcFiptPTFaJJqdwCGGQC45dUJMU2bK1io9DTzjVFcBWjEAcCSEaPm
         jG4hRfMr11UXdsicE4aaDFTPD6xMrHQ1LfvL3Qp+ztaRRWAyAoMiKdmKq/R6u6V9rgvY
         b7FErCMvyMG9L6Mc5VVbwwyrahsDRT3yVFX4qqEyAcA9u+Jx06OmhpQa2Kte4V8X4sQX
         XFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716141802; x=1716746602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/YRdnvMtWMhxlbEh050IDdP/xmTW8QB38Z1f1o0cz0=;
        b=mpfqjRzfzTfTYheq3tWbMNMLT8TY/E7YCfI9DnXboZtB/oG23VPR/ZRCBpzeWTmUV7
         vZ1QdnCl2d+y64w+cnP8KioqAaagvJ2eO6RIzib9s+oLGzLtZUe39YLbxn41riRlbXoM
         fDBiAUXnpG1uO6yWL0G3O5auox3mL9M9o7GaHdLuIeCre5J/PhcGhok9GbIGdQWnJ1rQ
         f5/Zr1y9WMJBqh+F0KXySrhmUJ+9J6bV0UT5mXsPYT4YgITRhPSHru6kqzPA41n93A5n
         NzYnlAfC8axcrALRVAhQ6IbaIdYiQ7NHy9xk0Wyu1Gua6ibDjgjKt4YyVzxbzWtG+AMB
         uwjw==
X-Forwarded-Encrypted: i=1; AJvYcCVdw+MvFr6+0XDpQpMbE9cKzeTVYCHRxuGqNOE9iDnxqxHYZk1ybDmVCZihSbpaxnQEqQFSwn8Y7aYivnuW7J34YNp64n61xsFPzXNBAN0L
X-Gm-Message-State: AOJu0Yw8Y9ET6bDbiO+zvNK5VBFW6MLwNBS/rZ1eB8L9cY44CmtRhzfr
	hyRK9SYGrRrAMhV87Ug5h4sbKIPQhmiL2Dcbb9ALGdmPZ+L/cXamdRRR25+XrtxtWLkqSB3t58v
	uYhrDgi7X0hhlKc+rXPhC6EOqjK8=
X-Google-Smtp-Source: AGHT+IHVtG0K3UlTS0c2FjdhwQXLY6J7tGPhlwYRSFokMmUU2X3FUGCIHNd3a7VofRVJUhFDf+h4G4S2/KpV6v1hYZo=
X-Received: by 2002:a50:d653:0:b0:572:7d75:a715 with SMTP id
 4fb4d7f45d1cf-5734d6b4120mr17882439a12.28.1716141801886; Sun, 19 May 2024
 11:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240518061925.43549-1-kanakshilledar111@protonmail.com>
 <20240519-ideology-nervous-eb30a92e1e42@spud> <CAGLn_=ugjbdszvN1PQ2eN-pLFQmz-EUmhj=2kOUKWWEsbFMKNg@mail.gmail.com>
 <CAGLn_=uuTOXRGYJGe4wV6u77Ew9aBakg99TNRRcAxo4W_khuGA@mail.gmail.com>
In-Reply-To: <CAGLn_=uuTOXRGYJGe4wV6u77Ew9aBakg99TNRRcAxo4W_khuGA@mail.gmail.com>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Sun, 19 May 2024 23:33:11 +0530
Message-ID: <CAGLn_=sqQPnAN+y10j1P9y9JP8thkhOZaTtZ7R+ZktO=NxNZBQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: riscv,cpu-intc:
 convert to dtschema
To: Conor Dooley <conor@kernel.org>
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_110324_701192_958C4069 
X-CRM114-Status: GOOD (  17.39  )
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

T24gU3VuLCBNYXkgMTksIDIwMjQgYXQgNzoyOeKAr1BNIEthbmFrIFNoaWxsZWRhcgo8a2FuYWtz
aGlsbGVkYXJAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gPiBPbiBTYXQsIE1heSAxOCwgMjAyNCBh
dCAxMTo0OToyMUFNICswNTMwLCBLYW5hayBTaGlsbGVkYXIgd3JvdGU6Cj4gPiA+ID4gK2FsbE9m
Ogo+ID4gPiA+ICsgIC0gJHJlZjogL3NjaGVtYXMvcmlzY3YvY3B1cy55YW1sIy9wcm9wZXJ0aWVz
L2ludGVycnVwdC1jb250cm9sbGVyCj4gPiA+ID4gKwo+ID4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4g
PiA+ICsgIGNvbXBhdGlibGU6Cj4gPiA+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9yaXNjdi9jcHVz
LnlhbWwjL3Byb3BlcnRpZXMvaW50ZXJydXB0LWNvbnRyb2xsZXIvcHJvcGVydGllcy9jb21wYXRp
YmxlCj4gPiA+Cj4gPiA+Cj4gPiA+IFVuZm9ydHVuYXRlbHksIHRoaXMgaXMgc3RpbGwgbm90IHdo
YXQgSSB3YXMgYXNraW5nIHlvdSB0byBkbyA6Lwo+ID4gPiBJIHNhaWQgdG8gbWFrZSB0aGUgY29w
eSBpbiBjcHVzLnlhbWwgYSByZWZlcmVuY2UgdG8gdGhpcyBiaW5kaW5nLgo+ID4KPiA+IFNvcnJ5
IGZvciBtaXNpbnRlcnByZXRpbmcgdGhlIGNvbW1lbnRzLiBJIHdpbGwgZml4IGl0IHJpZ2h0IGF3
YXkuCj4gPiA+IENoZWVycywKPiA+ID4gQ29ub3IuCj4KPiBJIGhhdmUgZG9uZSB0aGUgY2hhbmdl
cyBhbmQgY3JlYXRlZCB0d28gY29tbWl0cyBmb3IgdGhlIHJlc3BlY3RpdmUKPiBmaWxlcyBjcHVz
LnlhbWwgYW5kIHJpc2N2LGNwdS1pbnRjLnlhbWwuCj4gSSBhbSBoYXZpbmcgdjMgZm9yIHRoZSBy
aXNjdixjcHUtaW50Yy55YW1sIGJ1dCBjcHVzLnlhbWwgd2lsbCBiZSBvbgo+IHYxLiBTbyBzaGFs
bCBJIG1haWwgdGhlbSBzZXBhcmF0ZWx5IG9yCj4gbWVyZ2UgYm90aCB0aGUgY29tbWl0cyBpbiBh
IHNpbmdsZSBvbmU/Cj4KPiBUaGFua3MgYW5kIFJlZ2FyZHMsCj4gS2FuYWsgU2hpbGxlZGFyCgpJ
IHJlZmVycmVkIHRvIHRoZSBkb2N1bWVudGF0aW9uIGFuZCBjcmVhdGVkIGEgcGF0Y2hzZXQgd2l0
aCBhIGNvdmVyCmxldHRlciB0byBoYXZlIGJvdGggdGhlIGNvbW1pdHMgc2VwYXJhdGVkCmluIGRp
ZmZlcmVudCBwYXRjaGVzLgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVl
LzIwMjQwNTE5MTc1OTA2LjEzODQxMC0xLWthbmFrc2hpbGxlZGFyMTExQHByb3Rvbm1haWwuY29t
L1QvI3QKClRoYW5rcyBhbmQgUmVnYXJkcywKS2FuYWsgU2hpbGxlZGFyCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
