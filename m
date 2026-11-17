Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B6A606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ozY3TGOW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fc+6uiBm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aIGBH6OB7CCb+bHigWVL1tLZtKXpj/23GJGSrDxM9ZI=; b=ozY3TGOWVJYCx1SYekWkXnSmIS
	+KdOmR4X3Ak1hGKJLaPLOmqDD1wzh58nENyQOEWBWfEz6YbVzRPstfVLOY6y+M+I4y51sh7BX9Ts+
	zTcg0nQarQiUvs2mXZTU12wicTaSkxQkRrlf8OE8B1kI3dJ3MwEJtw9JkDH3/QevNVajMOxEaMJYX
	WULfrSB+8caRsfvHBBq2W4CZdQUt4pdp3i5uV93kAhNlvhsHj51EDvREeZllx/AivWr79V9ePIy+Q
	VYI7L5g8jftXnLMOA871lHR8h9/Znm+bqNeJUbJri3HmMLXSg5iAo+i+z+ZczghiwwYpCrZkB/24Q
	DT7XeOZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR2A-00000007AEj-1vfL;
	Tue, 17 Nov 2026 21:48:10 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTR27-00000007ADs-49PF
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:48:09 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-8b4d6981c67so1815497b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 13:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952087; x=1795556887; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
        b=Fc+6uiBmJ6URtU8FnEhp2/CYgbUwV6/6GV3raDZF7TwMyZsdEztqXsa/c8ZgrXG0QN
         2MwfIGxle+llf7Ie+i5K7YyMeYXIyqGPZWl/kiEV/mNtF9KZGiZp1l04yHgqF9mruj7j
         vqnJw+E2RYUYhb8DqNP3EHxePD7A1fsEpp08O0Sr5GjaoMz87Y7ltU80wiS+wkTg6pZB
         oGu3H/GbqJMqPbR7delbq5tWroaobMLb4nJuYtQaKYkeNKHT1oFT1ObJCjBtt3KKgJRq
         aMXOZ8Q/dEOdeb9QCt4hxjusjHGlQ4aS/pe/N/3gbn1yZJYTeeKBkEwO128D1gzuOFTm
         xYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952087; x=1795556887;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWhTP+MsEZH11Xk/IKOvm1ABoNQtFuyWT71ie9/W1Ho=;
        b=X2B5GWyMn/8Cx/HXE6YfRnrH6Fslb1TZFlYdYowPGglze0zaOFP76QQEzet69vJvh5
         jw7Ox5Oc/S7Bs8OOSfOePI61QDhBxNF8UvYJJBFM5h34m/ffSfS8vXOcZzXSXAaoBT+d
         +3SD2wx9LHgLnIzhPGZBvpH0oy8hd3UsG2OSZDLKIh2xs5GRAWbS85chOEPRLYcJvufD
         RffNcg2izrrqc/LGD7EiuKeCAhtsFBj6P9YDMoB118tj7rqGxNbMLvCpid48rYdThPq6
         GRIIusgbiOYA3MmEy8FVwv2CvyU8VYD4IHGyzjZ0lE/cu7P7KfJiNOhS6Cc9/e1bcSpU
         wF+A==
X-Forwarded-Encrypted: i=1; AL+hErHGA63zAzv5kWoUT5v0bbqCoF7VvnSTgj9nDdtFUW0ASzsYKox6WrbJmf6CihGxyTorFWnuQkzAAHGeTw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8V18Z2w/IFOZAs4cY1Lh6NmwahLudFKuHmJGFTSpICS90MRKQ5
	Febka2N6+j9gGdjIoBujc8RbAaNgvc7TD1aKNh1Jxy9gIitlg6pP2xGY
X-Gm-Gg: AZFdTZep4ucYouu4/VOzUPuBsMvY+0nq/l5KPiGdOGbal+G4/LwPOju890+yImG2QPS
	70HHSUSPEbEQ6lFXBaF0oDBmAJgWa7gm3G0i2TkkyfYxx/6RrMCBrs5fqwOmrTAsBStwb+VlCh1
	9PVsFDsCJUSTFarA81ejaAE8Ak1478gT2JtcmjoiWI5F98mvFNbbJQqx5B9/0U9lutV4alh+osF
	Zza81ZI/tf6RFYXHs0NHP9aR/oqCqRl26Je3SpfZD5tQkGZcT5erv5hjqpqoKfs7GwgcNa7gXDn
	8llh9B7S/s0RNPUMtgLOEJh/mP/zXLE/wcqj/VjR4OKWW2FMxEKPrch2CyrsH4GghyC7ACyQktR
	mzjRunqlWCmD+Rb3i1/5xdlQ3Nc9D737LRLJ2y5st2unjyvp7WtZ05kOsy1LhuetOePitKw0Itm
	ylb3uyEw4PK/Ffumjk4o/afNq383nFTEvq/yrrkEOK+fZR0HTesK7lr/Hh7I/zdLJEfwND9OyjE
	g2LX5V6PiDToB6vXKV8bAvPnm/u/XdEdXWLOBdVRK1gs6ii+aUfEJ03WzHd5tp6L2RagQzLr4gW
	fyWnEBIzJc9KbuHW2iDWL+TM
X-Received: by 2002:a05:690c:6502:b0:8b4:e2dc:3f2e with SMTP id 00721157ae682-8b4febccf0fmr3038007b3.8.1794952086607;
        Tue, 17 Nov 2026 13:48:06 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030a65sm7195267b3.15.2026.11.17.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:48:06 -0800 (PST)
Date: Tue, 17 Nov 2026 16:48:02 -0500
Message-ID: <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Cody Kang <codykang.hk@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
In-Reply-To: <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_134808_038261_05C4153C 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSWNlbm93eSwKCk9uIFRodSwgMDMgU2VwIDIwMjYgMjA6MDg6MTAgKzA4MDAsIEljZW5vd3kg
Wmhlbmcgd3JvdGU6Cj4g5ZyoIDIwMjYtMDgtMDnml6XnmoQgMjE6MTQgKzA4MDDvvIxDb2R5IEth
bmcgdmlhIEI0IFJlbGF55YaZ6YGT77yaCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9zcGFjZW1pdC9k
cHUvc2F0dXJuX3JlZ3MvZHB1X2ludC5oIHzCoCAyNSArKwo+Cj4gSXMgdGhlIHNsaWdodGx5IGRp
ZmZlcmVudCBLMSBTYXR1cm4gRFBVIHJlZ2lzdGVycyBjb25zaWRlcmVkPwoKSSBjb21wYXJlZCB0
aGVtIHdpdGggdGhlIEsxIEJTUCB5b3UgbWVudGlvbmVkIG9mZmxpbmUgWzFdLiBKdWRnaW5nIGJ5
CnRoZSBibG9jaywgZmllbGQgYW5kIGludGVycnVwdCBtYWNybyBuYW1lcywgSSBhZ3JlZSB3aXRo
IHlvdSB0aGF0IHRoZQpLMSBhbmQgdGhlIEszIHVzZSBzaW1pbGFyIElQLiBCdXQgdGhlcmUgYXJl
IGFsc28gaW1wb3J0YW50CmRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIEsxIGFuZCBLMyByZWdpc3Rl
cnMsIHdoaWNoIGlzIHdoeSBJIHdvdWxkIG5vdApwcm9wb3NlIHJldXNpbmcgdGhlc2UgdGFibGVz
LgoKRm9yIGV4YW1wbGUsIHRoZSBibG9ja3Mgc2l0IGF0IGRpZmZlcmVudCBhZGRyZXNzZXMsIGFu
ZCBtb3N0IGZpZWxkcwphcmUgYXQgYSBkaWZmZXJlbnQgd29yZCBvciBiaXQuIEluIGRwdV9pbnQu
aCwgQ0ZHX1JEWV9DTFIgaXMgYml0IDQgb24KdGhlIEsxIGFuZCBiaXQgNSBvbiB0aGUgSzMsIGFu
ZCB0aGUgdW5kZXJydW4gYml0IGlzIDkgYW5kIDguCgpJTUhPIGEgSzEgcG9ydCBzaG91bGQgYWRk
IGl0cyBvd24gY29tcGF0aWJsZSwgaXRzIG93biBmaWVsZCBoZWFkZXIKYW5kIGl0cyBvd24gYmFj
a2VuZCBmaWxlIG5leHQgdG8gdGhlIEszIG9uZXMuIFdoYXQgZG8geW91IHRoaW5rPwpIb3BlZnVs
bHkgeW91IGFncmVlIHdpdGggbWUuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3NwYWNlbWl0LWNv
bS9saW51eC02LjYvdHJlZS9rMS1ibC12Mi4yLnkvZHJpdmVycy9ncHUvZHJtL3NwYWNlbWl0L2Rw
dS9zYXR1cm5fcmVncwoKR3VvZG9uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
