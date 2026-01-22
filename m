Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F387D3EE66
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWbBHd51UIcbWGVcU3YEIj55LcivNQ0hLeLoyxl50cg=; b=FarhnqWxruCzRR
	wh50QuDCmpJv4d0/Rz1CCYWX9Bdf7ndImM3xFZL4lsvJPzrWTTHyIQ4u2w43NHlPlZ9/RBa3XpgoR
	cYqPBug9Uxfz67xXFJr+Eq9bM4PhZSyPhvUvx5AC0kzsc0M2in5x+dicrtg4Fj6N8efLUdDby4Dm/
	zM68M32luUx/4E3PtKU7ehlRIr39F++Y/QxDcW/foGD0vXdWKX81SrdFk8P80V+zIkWOS4YmzOZGe
	rAbAXS6cP7rIlr4UR4JaJ8QpuVCdPtyRm93JUrtsmb0wEqfcR4MtS21ryg8mXHTKJ8ax1tLOP01IZ
	US9jioKPrUf/QwzniW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw6C-00000007GtM-48As;
	Thu, 22 Jan 2026 14:55:52 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw68-00000007GrP-2KCC
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 14:55:51 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-7927b1620ddso16141207b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 06:55:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769093746; cv=none;
        d=google.com; s=arc-20240605;
        b=RqpxYFbMWHV2AXIHSaJn6dur6cxPmcYvHCWs3Plcq6f2HhLJ+3yYoRmuA2MK95mNPo
         MKnQvpju/qyMxALroa5iMpJYRbDUTdpg705QeM2IgwFZwoTS7tC7jQkGihpoKUonJPIc
         x9fxJenrJWgc8wRl2J6Mlttr3V3LFZLqkIULVMCElH9Q/L97y7HItJEln7n4yZ0a9BtJ
         EWtTuipWZ7ba7kDvhWRcdfHpL6CiblBwc1eRrrDb8YkB1kPAc+jOSN+16/GupZoQon6q
         9Hg/nNOU5c5YrDFpckepBbPSRYU/NpYxgSTaxr0NZB10ge2gwa88lAMmeiwPEFuY4ok4
         J7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNlrb79F8npK3m2Hl07L9rICov5a44ljv+REaE6QtO4=;
        fh=7iJJJyr6mqJvTmfUSMzYkFWd3VUFdCH3FYxpFR1JR6U=;
        b=Rg8VVbvB3BwgMKpnDXsNZdSZ0aNkB2Mw42lp3YKeDPViNvNr3Mw0a0uFPPoLjVOwHw
         /+giyF0xH569Ye3IslDOSj+2MBxBwCBCsVcBht4cQ+4crvJvfoDPJtIRy99pMp4o9hVH
         kaHrmcWZerMXoxY57El2a35WBjoJjcPBDKbx5hCwlzgkXb+EJJU7NIRl1FIasFgMDfYh
         Hfcn0ZHa1TfrItdXePye4pen4jlqcRRrB4n3gC2OaZTKZhE8nd1QR3o83lGg2q/KFKmb
         A/wS2Pbu49G4SAvuKvyXPD/NU29Klodc6b0dIV2UMYTTlFbZq8vWnlMKE5RM2zAsrIz2
         +1pQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769093746; x=1769698546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNlrb79F8npK3m2Hl07L9rICov5a44ljv+REaE6QtO4=;
        b=j1EYmjlG/k6/oxZ6/9KZz/qMj+ML4aPeR+ogZe/9sw+Pp0pi2e92VGPGQXAgQDQoFQ
         SQPIjVcjoWRIdnEZKcxOtxg/e1pGAJZlt8CKGGOmaCGRBR7lfrMRp4i8QPYsmBTO6vs8
         U3jU1D25K6pMcR/E6edwZV93cc2Pt4F0gOcMsE+f0lSk2wgNSw5ajCeX6P7eokY/ZCwS
         eOZOQbf1BLNfUOLR3qTggII7tg9cF7/O0sDXsmMvhgBUt9LoXbUOq/zQnt9tgABAQlty
         ajjwgUM+tsQqvJ9x9RDWdRIgqTVgTkitV7ubnhMMZTo4kr2Gj8nOvIO8f7zxqPLPchX+
         lzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093746; x=1769698546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNlrb79F8npK3m2Hl07L9rICov5a44ljv+REaE6QtO4=;
        b=jFDOigWIyAwD/wLezDj5gmyp7xrDTB2557B3sFSnTG1HLCdeDVF429c92R3cffJFXL
         2M+hPemDJrfPu8bH3W1iJemrlvU/Zx1beLAH/8/LfeMn0coQtDxHyQGd2Bgz4P+krhig
         QsmAjRlObBS/61yQoal7bCtPVbGXRhDSIp++KwHro26laDO/44xcRNMdsr8Th3fhET9N
         OHpTlifW1V4+C2Qj/foTEcxO+sWAf3W1eNJeQTQlBHIemgb2FONDXzNo+1XUu9aEyZHy
         +vQGNyvsNVrn5qXN6qYDH0DKiHs9M3/KVPhj4EO0MvwWRUuj9J8eRhy2ZJkvz1pDtMPN
         1WBw==
X-Forwarded-Encrypted: i=1; AJvYcCVor50mY1bXttuN+o9n+izf3wkust9L2Q3TDYTDdNgTIN2/+5SwLdbKyt5ripS5RBbnI6i3pFae3pvtFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqJ2ttlUc+FiZ8DdlMW9ZauQrZfkrKzk/EIfPU+d/2nve42IkR
	t7zeL9aqGIQvjYh5lnsEJE1MnbAsN0KN3xhQHPc/TSpVxBS8XQmQdcuYHcWS30UrzGSc8PmgXOK
	3/DG3LSOvcua/9LNR81pfNU/V5etXY9SOp/m4OKmI+Q==
X-Gm-Gg: AZuq6aIcTNpi6WOLUeptY245AWHw1bzdqjDV6RoiajO52o9l+DWk/47AZgYWwiT3R9B
	LSWY/RY0RhnUB2ATRZ07/kj4j2QWf1BRqb8ZD9Kwmuk/SSd7Rw25cgqxtNOgUpbL6kgA37tdmk0
	TG7K/+5xZur+iLHrbWN3W54tp08WHcFQa0i4ryP7rWXBWgflsqPv1U6l15+5+KgCBp/emciFWgH
	0Xrw9Di72qQTlM+YDETYNw3OUj5amI8XexZyDd8nCD+nIC42daYmvbXeOXqU8zy9iDQbW8nXiCK
	iK/sPaBK9GaGPM7WhpsG5SFpnyhYeZI5WhfjR3AOYA0Q
X-Received: by 2002:a05:690c:f13:b0:794:e13:6cb4 with SMTP id
 00721157ae682-7942a867a86mr25319347b3.24.1769093745796; Thu, 22 Jan 2026
 06:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org> <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>
 <20260122121223-GYC63789@gentoo.org>
In-Reply-To: <20260122121223-GYC63789@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 22 Jan 2026 22:55:34 +0800
X-Gm-Features: AZwV_QiJGaLsEOdeugS76EcbcaDtGi-z5pG6_55yk_bVABlnd5tqHNMAicmasHQ
Message-ID: <CAH1PCMaRqXHBZQLY02DY=C1rorMc2DZzzE2ziADofWoAQW8Mzg@mail.gmail.com>
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
To: Yixun Lan <dlan@gentoo.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_065548_964428_C71202DF 
X-CRM114-Status: GOOD (  15.73  )
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

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgODoxMuKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IEhpIE1hcmssCj4KPiBPbiAxMToyNyBUaHUgMjIgSmFuICAgICAsIE1h
cmsgQnJvd24gd3JvdGU6Cj4gPiBPbiBUaHUsIEphbiAyMiwgMjAyNiBhdCAwNjoxMToyMlBNICsw
ODAwLCBZaXh1biBMYW4gd3JvdGU6Cj4gPiA+IE9uIDE3OjQzIFRodSAyMiBKYW4gICAgICwgR3Vv
ZG9uZyBYdSB3cm90ZToKPiA+Cj4gPiA+ID4gUGF0Y2ggMSwgbl92b2x0YWdlcyBpcyBjb3JyZWN0
ZWQgdG8gbWF0Y2ggaGFyZHdhcmUgcmVnaXN0ZXIgd2lkdGhzLCBhcyB0aGUKPiA+ID4gPiBwcmV2
aW91cyB2YWx1ZXMgcHJldmVudGVkIHJlZ3VsYXRvcnMgZnJvbSByZWFjaGluZyBoaWdoZXIgb3Bl
cmF0aW9uYWwKPiA+ID4gPiB2b2x0YWdlcyAoZS5nLiwgMy4zViBvbiBMRE9zKS4KPiA+Cj4gPiA+
IFRoaXMgcGF0Y2ggYnJpbmcgc3lzdGVtLXdpZGUgY2hhbmdlIHRoYXQgbm90IG9ubHkgYWZmZWN0
IEJhbmFuYXBpIEYzLi4KPiA+Cj4gPiA+IFBsZWFzZSBhbHNvIHByb3ZpZGUgZml4IGZvciBvdGhl
ciBib2FyZHMsIEkgdGhpbmsgeW91IG1heSBub3QgYmUgYWJsZQo+ID4gPiB0byB0ZXN0IGFsbCBi
b2FyZHMsIGJ1dCBtYWtlIHN1cmUgdGhlIHBhdGNoZXMgYXJlIGF2YWlsYWJsZSwgc28gcGVvcGxl
Cj4gPiA+IHdobyBpbnRlcmVzdGVkIGNhbiB0ZXN0LCBQLlMgSSBjYW4gaGVscCBvbiBtaWxrdiBq
dXBpdGVyIGJvYXJkCj4gPgo+ID4gUGF0Y2ggMSBsb29rcyBsaWtlIGl0IHNob3VsZCBiZSBPSyBh
cyBpcz8KPiB0aGVuIHdpdGggcGF0Y2ggMywgYW5kIGZvciBvdGhlciBib2FyZHMgKG1pbGt2IGp1
cGl0ZXIpLCBzaG91bGQgaGF2ZSBzaW1pbGFyCj4gRFQgZml4IGFzIHBhdGNoIDQuLgoKVGhlcmUg
aXMgbm8gInNwYWNlbWl0LHAxIiBub2RlIGluIG90aGVyIGsxIGJvYXJkcyAobWlsa3YganVwaXRl
cikuCgpCZXN0IHJlZ2FyZHMsCkd1b2RvbmcgWHUKCj4KPiAtLQo+IFlpeHVuIExhbiAoZGxhbikK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
