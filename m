Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93253C7115C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 09:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCb4iSH00KtFsebP2qQG9r2V0xI27PvmoHGZS5h8gUI=; b=LV6fiDIPgoMBw4
	Sc/hu8LI+JXC5zL0gLhgAtRWVoWJojiATZEHYCm4Y0EWgawkSoU7Xa1jwTL60BJEj/dNaucIqSAln
	c3q9K1WZN9Zb0+oVmRSadLgnWq+Etm269LEY9ggtzbenfSe3qbBAgRf6ljqXR9wlRS/EfbvmgWlBX
	KiC3Nb1JRkTlbefK3BXdSJrhc7o+JHX9E9IzTPzZy9ZVasQnVMekgq/xoMXY6KPP3EBUfIJTD6DVD
	4Dnl4+kPxRIHHmUnlefB1kRh/GhN6bQu8cbbRJiKqXArTdPuMJ3X6anZ7GYaEAlqiu7F1pdWNAf/H
	IiVGt9RhYHQ3tI8gm9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6VC-00000003yHu-0qYq;
	Mon, 16 Jun 2025 09:51:42 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5rZ-00000003spR-0LRT
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 09:10:46 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553b9eb2299so1263002e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 02:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750065043; x=1750669843; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmDMMMFI5G4DNwFWGn674MZ5D9eFoURbFcL3QvAF4Ig=;
        b=RW1BseD/abx9yTL9rnhScqIF2I43A+zRgJElEpHy2RDSX3zlfPA4h7fEae0r/bjRus
         6Dswah3jougc9Fk22t9HOiL1n3UDmeuovIWOu+G/sJVLiSa56JCFqN28cByVBdvGvdj9
         Ohi+HJQmO9dzKQT8zXflbqu7RCw7CvR4/J+0gdRHrwgsk9xxB0gjgJ0GVhlLTfdSC7Pq
         MMTXej3TVxVhsxBpAOLzOGxMm5G78AMp0pgWsESGI5DXvXysf8GXMrUmSi0Xq8t3yXAw
         +VujZgDfa+ZqmrMD3pgY8kIjNHaDdyIxyxSe8HkyQOflV3W3ekJcEAPHxEqK/iN178GT
         l2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065043; x=1750669843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmDMMMFI5G4DNwFWGn674MZ5D9eFoURbFcL3QvAF4Ig=;
        b=UI2qXUvmGFPNUscv/uYVIxfpe+giRwM4leKJeu5B3XaJOktR8PqN9+Vbg9ITEBCh4C
         gQclk7yZ1P25mPtYHrUVrZ5WFFqcSp8VS46IfyzuYfy0fLA+IIQkwH0QJoWCa8clrzQu
         oC9CPo9gFvobG5EXt7Ocyw+HxaDuET0MewepnXxC5LK6qwoY5WeIYjJJVUVCAouLCuWe
         YFcVGweInurAbAMau4vg5E2CAJs7PG03StwTgIR/3JPAoo8nlhg4N8z/0bWV+Q18GbHo
         +ea+I92rFX6E9DsgkRUDAjIpIhwtqsIUivB6gYZwDcigGP+p8hyqIRM/Wk6kZBSEdIwx
         SE9g==
X-Forwarded-Encrypted: i=1; AJvYcCW7ZUIG4/JLBOZ3zVN1MOdQlck/3FY/Vp2D6aCxky/ZcEAzrp3Y0att1lZjZNb9FS6RfM34Fu/bEbIsNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPbuga+qMaTzQ/LOpI/sKgL5LrrL1gSTH7j0JX8+MCynXEroeD
	rD8X+FLF9O2wU0rIUqWwW2JepOw6xop29taDBLjo+gsxWl7+Pk5L8xb65B/5NRvkTp1m9FhKVJ3
	8h47hixE0eyHSYf79Y4TnePMrFJFz65MM9SHKrwsDEQ==
X-Gm-Gg: ASbGncsnNoKXlm7JA0mI1DLK1UrPaUITtOTnGuwlZudpPWoZ3sPVkWwhvH/GZ7ObMc7
	7Nx3BdieVw1CQG5i5VUnM6EDXIIaAzrsGjDDhEa3Tc+IqmAosnzupW3zstzbelEpVYkr+vYT66J
	d9P1kQ2dPs45de4Oz1RRPPYw7JkAsKyGAuMIGjXDesbaQ7MGc9I9xzCp3s5TdYZrWf76vjPHYhT
	e0=
X-Google-Smtp-Source: AGHT+IHuGL7ppu54TT/M3Hxiz/E57PX/ijwwJDHxeHuWrcclls/KmfWg30WiaNhrMMlcrNDHFrl4pCAUL311IM7bJx0=
X-Received: by 2002:a05:6512:1053:b0:553:29cc:c49c with SMTP id
 2adb3069b0e04-553b6810d6bmr2008050e87.7.1750065043405; Mon, 16 Jun 2025
 02:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250614180909eucas1p2a34e3242fb42f7fd25e4038c291276ff@eucas1p2.samsung.com>
 <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com> <20250614-apr_14_for_sending-v4-3-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-3-8e3945c819cd@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:10:31 +0200
X-Gm-Features: AX0GCFundfu1_DbYfr4amG4ZmgyhqyYCcYsn5RbDrpDylY7Och28dfv5wtCxrQQ
Message-ID: <CAMRc=MdrvZ0_3aWcmhYZP4CxOVbuYjL66iLPHKkDt=vCP7VN-Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_021045_119572_0129FF18 
X-CRM114-Status: GOOD (  16.89  )
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

T24gU2F0LCBKdW4gMTQsIDIwMjUgYXQgODowOeKAr1BNIE1pY2hhbCBXaWxjenluc2tpCjxtLndp
bGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gSW4gb3JkZXIgdG8gc3VwcG9ydCB0aGUg
Y29tcGxleCBwb3dlciBzZXF1ZW5jaW5nIHJlcXVpcmVkIGJ5IHRoZSBUSDE1MjAKPiBHUFUsIHRo
ZSBBT04gcG93ZXIgZG9tYWluIGRyaXZlciBtdXN0IGJlIHJlc3BvbnNpYmxlIGZvciBpbml0aWF0
aW5nIHRoZQo+IGNvcnJlc3BvbmRpbmcgc2VxdWVuY2VyIGRyaXZlci4gVGhpcyBmdW5jdGlvbmFs
aXR5IGlzIHNwZWNpZmljIHRvCj4gcGxhdGZvcm1zIHdoZXJlIHRoZSBHUFUgcG93ZXIgc2VxdWVu
Y2luZyBoYXJkd2FyZSBpcyBjb250cm9sbGVkIGJ5IHRoZQo+IEFPTiBibG9jay4KPgo+IEV4dGVu
ZCB0aGUgQU9OIHBvd2VyIGRvbWFpbiBkcml2ZXIgdG8gY2hlY2sgZm9yIHRoZSBwcmVzZW5jZSBv
ZiB0aGUKPiAiZ3B1LWNsa2dlbiIgcmVzZXQgaW4gaXRzIG93biBkZXZpY2UgdHJlZSBub2RlLgo+
Cj4gSWYgdGhlIHByb3BlcnR5IGlzIGZvdW5kLCBjcmVhdGUgYW5kIHJlZ2lzdGVyIGEgbmV3IGF1
eGlsaWFyeSBkZXZpY2UuCj4gVGhpcyBkZXZpY2UgYWN0cyBhcyBhIHByb3h5IHRoYXQgYWxsb3dz
IHRoZSBkZWRpY2F0ZWQgYHB3cnNlcS10aGVhZC1ncHVgCj4gYXV4aWxpYXJ5IGRyaXZlciB0byBi
aW5kIGFuZCB0YWtlIGNvbnRyb2wgb2YgdGhlIHNlcXVlbmNpbmcgbG9naWMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgo+IC0t
LQoKW3NuaXBdCgo+ICsKPiArc3RhdGljIGludCB0aDE1MjBfcGRfcHdyc2VxX2dwdV9pbml0KHN0
cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsgICAgICAgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2Ug
KmFkZXY7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBD
b3JyZWN0bHkgY2hlY2sgb25seSBmb3IgdGhlIHByb3BlcnR5J3MgZXhpc3RlbmNlIGluIHRoZSBE
VCBub2RlLgo+ICsgICAgICAgICogV2UgZG9uJ3QgbmVlZCB0byBnZXQvY2xhaW0gdGhlIHJlc2V0
IGhlcmU7IHRoYXQgaXMgdGhlIGpvYiBvZgo+ICsgICAgICAgICogdGhlIGF1eGlsaWFyeSBkcml2
ZXIgdGhhdCB3ZSBhcmUgYWJvdXQgdG8gc3Bhd24uCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlm
IChvZl9wcm9wZXJ0eV9tYXRjaF9zdHJpbmcoZGV2LT5vZl9ub2RlLCAicmVzZXQtbmFtZXMiLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZ3B1LWNsa2dlbiIpIDwgMCkK
CklmIHlvdSB1c2UgZGV2aWNlX3Byb3BlcnR5X21hdGNoX3N0cmluZygpIGhlcmUsIHlvdSBkb24n
dCBuZWVkIHRvIHB1bGwKaW4gb2YuaC4gSXQncyB0eXBpY2FsbHkgcHJlZmVycmVkIHRvIHVzZSB0
aGUgdG9wLWxldmVsIGFic3RyYWN0aW9uCnVubGVzcyBub3QgcG9zc2libGUuCgpbc25pcF0KClRo
YW5rcywKQmFydG9zegoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
