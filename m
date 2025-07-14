Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303B2C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 17:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1jr43d9+O7Ia7FjJoEwXoTHulTXS7Ht++SqhQklZ2E=; b=24f9aNuatmFdYB
	spJNjTaIB5mUI6DZl870jCdsceKwvAifgztBFe3sXMgR0TcUzzqBj1KkZLgS0KEu43gnFuZsmvrU5
	IBVpPUU4UqLYfiS+cuhju2BK34NynXI0WfKq4glHPmR2AdRSCZ5VMPX9IyapLZBVeOZfp26rfHsr7
	qvR8UqK+tQudj67Ex0uhEcQvQrructbngpai6wE5xIcWwkv/N173On24FfuVZ0pszW14tEoTWFSYS
	8DzpMU3Ye/0uXJQrKQGGtO5z/K/Ly9ue0xyWH/F2651D//oTTXvjjrb3G5M599CMtj/QSlWAo+Ry2
	ItEqIIHzmi602VGOw7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubNBy-00000002zVY-3IWm;
	Mon, 14 Jul 2025 17:42:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLsa-00000002oW2-3LRR
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 16:18:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso32575935e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752509891; x=1753114691; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wC6A1qDuM61Boa2KQZ/UgUYnzAlF4JWnuO5cBexQuGM=;
        b=OSz5mjlMD23kAcpjzSRsd1sJifUrGVET+8cekD5JOpck2yq67lsoWsrOEfwBWIsE91
         ijlPU4Enl+kNeXu760l1E7DH1LASPaH6JUSNoHVRK6PGrJkJkJ4oDstr508a4AHEFrhs
         4f3iJzCcrZ5EJMhJQqEWNgqg1e7YOSnFff+lAtGCgVkjEv7T2QtLeFX6B8OSMzMLiADE
         Lwhp+zkpCj05pd9BGK9+syun5ivzBx2V+SZ8vAbuoO8ooLfnraEu/fzZcreMd00bVc4B
         xFb0RQ1zpClZ3LYpeqnKhcVf9bcedYTPlFJBJK7wLLY1bWTeOAWsGa56I9g6rVKOZEty
         5U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509891; x=1753114691;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC6A1qDuM61Boa2KQZ/UgUYnzAlF4JWnuO5cBexQuGM=;
        b=wUDkFVTzxBSpsNCkbkR+0P4jrkjomiuHeUZMkqdM4Qbsa7Wa7jv5gr0KwtK1ihUwDr
         PaxUR81zjjBv9yufULBYxEHuuxHnkxXLrwrsFgd0f8Hl32fb7GJq65VxCB5w9oU7aad9
         Iky0n+TmKJDBpZiX4iXG3A8+/ch/n6LRe3m45hln65FSswzNmHoW/Fbq1MApDALtab/Z
         n5uIsKduf9WZbleSreU5hfWbVDos4S9/4XfxB0uYObF6oJsUAw2GczWesL9ZxS4gteeG
         yJZzYfhRpEG44U6btlk9oHA+XhO1rmVYj/3hun/3OiAb979FuweUlyZr2y5BeU2keFIQ
         QgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3fv49SyZXPp+Ue6E6lq+V9SzrFr7lQdjRul6SzFtQXqqvJKpYLth+1tqBlWHSLD1afF3oPqG15sOy1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj8/VMiTgQ9MeMfLkE45bFZIJqvtux3RLtUFOHfTXogUUwec6x
	wNig1ocDtoy8BI656fyCeNIV2kNYEdJ5QVihbSCjXeWEvGopuUQJ9wna1M8q+55D+T4=
X-Gm-Gg: ASbGncsmouAP0+v7oBfMoP9gsQrf0sdxIVUTd4BzjLpO2eKSPh4aUblpRAlMbISZnCc
	NTrgCjXn+Ic5NoncUpmNvd9C5TfjpvLQRMrKyaUooeBvcOteyrDkKHNu3EsstlUL7TDWlP3mX5a
	VFwZ4dgz26n4bUw/LZROQdc+PTqk6xyDCYHAOtHBmqVHU5znPOu3ImRS4UEwChsILyTgMArKc+Z
	hNG3Dbj8JBLA9dc6pBTdCAjOiRXsJmWJ+m0c25XwLllDAeWdlH65KTWCajJ2GABB/hjaeEd+S/s
	pGxoUd1ng96noZKLdJnKPGgVU6+LOT5N0q9NNS5tPIkNOWgyiNlawV1aOU6UkV+wCTESBOw9Dy9
	pPPqEbkjsRrBF/9NA3nrb5gfZJkpnIBErLMzY3w0kdDLA3UdZOZVotJZObFxw
X-Google-Smtp-Source: AGHT+IEkmiG1TNOouwwaTX0kWCFB9A80b7BdQ4qTqaPbflHAQ00Io1IBCtMbf19ehPEJdtKq4KcxZA==
X-Received: by 2002:a05:600c:5406:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-45600771e4dmr84656845e9.5.1752509890844;
        Mon, 14 Jul 2025 09:18:10 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5103c2asm173612365e9.33.2025.07.14.09.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:18:10 -0700 (PDT)
Date: Mon, 14 Jul 2025 18:18:08 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: arnd@arndb.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	soc@lists.linux.dev, tim609@andestech.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: timer: add Andes machine timer
Message-ID: <aHUtwMnUwHIPn-sD@mai.linaro.org>
References: <20250711133025.2192404-1-ben717@andestech.com>
 <20250711133025.2192404-6-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711133025.2192404-6-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_091812_837562_791D7C30 
X-CRM114-Status: UNSURE (   9.23  )
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

T24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgMDk6MzA6MjFQTSArMDgwMCwgQmVuIFpvbmctWW91IFhp
ZSB3cm90ZToKPiBBZGQgdGhlIERUIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgQW5kZXMgbWFj
aGluZSB0aW1lci4KPiAKPiBUaGUgUklTQy1WIGFyY2hpdGVjdHVyZSBkZWZpbmVzIGEgbWFjaGlu
ZSB0aW1lciB0aGF0IHByb3ZpZGVzIGEgcmVhbC10aW1lCj4gY291bnRlciBhbmQgZ2VuZXJhdGVz
IHRpbWVyIGludGVycnVwdHMuIEFuZGVzIG1hY2hpbmVyIHRpbWVyIChQTE1UMCkgaXMKPiB0aGUg
aW1wbGVtZW50YXRpb24gb2YgdGhlIG1hY2hpbmUgdGltZXIsIGFuZCBpdCBjb250YWlucyBtZW1v
cnktbWFwcGVkCj4gcmVnaXN0ZXJzIChtdGltZSBhbmQgbXRpbWVjbXApLiBUaGlzIGRldmljZSBz
dXBwb3J0cyB1cCB0byAzMiBjb3Jlcy4KPiAKPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCZW4gWm9uZy1Zb3UgWGll
IDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4KPiAtLS0KCkFwcGxpZWQgcGF0Y2ggNS85LCB0aGFua3MK
Ci0tIAoKIDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNl
Ym9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEv
bGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+
IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
