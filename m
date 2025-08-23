Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A5CCA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJ1hGv5NzgnVRR17RGFbTGf901dev07EUNmty2yUlns=; b=JnDTMvRwGurF65
	gJRGcKcf8Tbg86XmIFiLlVZxFlHR0yM11J1db+qew0sEf2J90bBXG847pelLaYH/ABm3XKak0Qptx
	qLv7PUjryBZnUt1bJ00/GAbXmWSfwVYZeEBeIu+WvNyaziHVLn/z9DgyQbCA2iKmLqTClFDVtYGdS
	Ks1+1Hr1Y5wQMPonlPv3yhGvHQdN9uIDkfaoNCRDHIIkcgqSS6qwomIREj7V0IatPcmaFKtM8IjiR
	K8CF6xaYrUKMXPou9eAyOEcqb7Q7pW8WuSgO7k3+vg7tm4g2PI3q5kjK6PUq5sh5KvsEZJGCgu5l0
	R7wiqwStqonIxJLdAMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upp7G-00000004q3P-2zVS;
	Sat, 23 Aug 2025 14:21:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upp79-00000004q2j-2k8E
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 14:21:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-246180dc32cso4273665ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 23 Aug 2025 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755958862; x=1756563662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKS13Ls82GgTKoYQ+noL3pXMTArz0NPS6LMA322WeXw=;
        b=ANuAdNoDu15kNiJqN7+kb6PljwEmBc4FlZHKXRYXme+MC22X40xVB2M2aUiJ2inwcB
         /qJxQ4EB4UiE/oRZ36Zx8iVoTFqxxzR01WPSQc3s0JlfNpu2wgqupcaNziS1QRYtIIQE
         lT0AdniLH/s/6e7UcJkwO1nV5O4k2Vc5hVBL7/4gnAm8qo943hCZiEpoNf68OGzYH8BA
         zLloKQBp0HOPaAAS9ccQxGiyPlOBvI52Rm4amQAVUEwmP6h/YxqKi2miDVLrJzFiccJJ
         I4T5mF+jUpO1CwnB2dB+H5WVXA9YDyOEHnsRPwpdIQyx5tlCjw5JIIAbRrEAB0GlHGfc
         kN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755958862; x=1756563662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKS13Ls82GgTKoYQ+noL3pXMTArz0NPS6LMA322WeXw=;
        b=ww8dGzbfk1aodcLOumNFI8Wv7dINGHJQIJZf+8jAJ3LEvoTsO3L6VGQx/iVv/u9/7k
         sUue9CWACdQRwo4hHQKpF40HTJ0ivf0cZKqFAHeYqiYReH2sXvNBraN+6fsYDvTpYTUc
         hLG++jKVjjvxrR7GnjRP9k91xpGpTRF7CIhCgcnXoMA52+Bf2F0ksepVnDLJ/97YZtZv
         jkDzgDqNZ77SayB4zdM/djhGAqap6WLlLcuC23YylWNVqG7uK+rZUEDwaXDUde2pU4cn
         gH46b/qGFLkPzLugkZp9kximW9FbcQU6raeRFTd2k7H6MqqUkb3OSJ+xUDoM96wt/HAE
         JAUw==
X-Forwarded-Encrypted: i=1; AJvYcCXS2i9EpEXpVWzSzEFqJvgtCwwrGtUiHUJ/7fAVfK9iyjWZaAOKoil2o4kzcCvi4QZhn8OK/hutbFLjgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJHvUKK4sZvFmqai0EtfxrSTmkk4B8iYSZowIchpc6RheUpICi
	0ZuuudgehclRBKA0z47DnxJ6VxAeHFQHixiNJ5z3U1YTABWmK0IrvSqQlA+tYkny4xcTs/nChdZ
	MeJ9Z5U1J5SjlNeX4XBQqixI5svD45Qk=
X-Gm-Gg: ASbGncvBLwyNTem1KJHlxJIeObqBOz/GGE4WWq0PiQfaVO7c0r3lFt/R5BwLchUJACY
	WlgwP+QiSk+kfEXwtdo5aaJLXoDv42Us/6Gse3mWfuM/EI/TiH0/geGnrnJoCkmgi+QQxeYGYPE
	vM+ZGohJWtJZLFyrsuQVdUfLh0J6tZqPXz+PVKUPumxkXoEZ5dUqpR+EqjV7rIU2yRF146xUuRU
	5Xh3B8zGIJwfUlt1DMYZSC0sh+ITo+qZI0SRWiRfusyp5HpdK+iCxVuQ/d5wokbFWi/l5Vzr2To
	bfg23qZBnFKiImThzZb9V2TlXA==
X-Google-Smtp-Source: AGHT+IGVLaR8SAQwEUxUiy2CqfQseM2OkihMRfGlZd9/MU0z/dJwNrzQwurGCFk0ttB0GCjmTXBnJ39be3FpGZZbACA=
X-Received: by 2002:a17:902:e5d1:b0:246:9df4:d10 with SMTP id
 d9443c01a7336-2469df4127fmr3166135ad.8.1755958862532; Sat, 23 Aug 2025
 07:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
 <CGME20250820083548eucas1p2a40775d53dfd9f8608671cc20003fd7d@eucas1p2.samsung.com>
 <20250820-rust-next-pwm-working-fan-for-sending-v14-7-df2191621429@samsung.com>
 <aKjXzyyYd9QneIKf@x1> <3aa6f79e-2ebf-4aff-a23c-7e79929a85f9@samsung.com>
In-Reply-To: <3aa6f79e-2ebf-4aff-a23c-7e79929a85f9@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Aug 2025 16:20:51 +0200
X-Gm-Features: Ac12FXxJkYUU9nh5gGCQzR8dqN6e3fVSP-8HKfD18-Z-F1n5Giy4FK7WbmAKogU
Message-ID: <CANiq72kAVmfSyAs71pmmVCq8f-rA1BECZ9iCTcTxiLfsO9-V6g@mail.gmail.com>
Subject: Re: [PATCH v14 7/7] riscv: dts: thead: Add PWM fan and thermal control
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <fustini@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_072103_691372_1C286B87 
X-CRM114-Status: UNSURE (   8.29  )
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

T24gU2F0LCBBdWcgMjMsIDIwMjUgYXQgMTI6MTTigK9QTSBNaWNoYWwgV2lsY3p5bnNraQo8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEhvd2V2ZXIgYXMgcG9pbnRlZCBpbiB0
aGUgZGlzY3Vzc2lvbiBjdXJyZW50bHkgUnVzdAo+IHJlcXVpcmVzIExMVk0sIHNvIHBlb3BsZSBj
b21waWxpbmcgd2l0aCBnY2Mgd2lsbCBub3QgYmUgYWJsZSB0byBjb21waWxlCj4gdGhlIGRyaXZl
ciBmb3Igc29tZSB0aW1lIHVudGlsIHRoZSBnY2Mgc3VwcG9ydCBiZWNvbWVzIGJldHRlci4KCklu
IGNhc2UgaXQgaGVscHMvY2xhcmlmaWVzOiB0aGUgQyBzaWRlIGNhbiBiZSBidWlsdCB3aXRoIEdD
QyAoaS5lLgpidWlsZGluZyB3aXRob3V0IGBMTFZNPTFgLCB3aXRoIFJ1c3QgdXNpbmcgaXRzIExM
Vk0gYmFja2VuZCksIGJ1dCBpdAppcyBhIGJlc3QtZWZmb3J0IGhhY2sgYW5kIHRoZSBnb2FsIGlz
IHRvIGV2ZW50dWFsbHkgdXNlCmBydXN0Y19jb2RlZ2VuX2djY2AgYW5kL29yIEdDQyBSdXN0LiBT
b21lIHVzZXJzL2Rpc3RyaWJ1dGlvbnMgdXNlIGl0Cm5ldmVydGhlbGVzcy4KCkNoZWVycywKTWln
dWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
