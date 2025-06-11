Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37FBC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYu9A4XGDWUrgePrvhKXB9p1e/CtidPoW9phmcr20R8=; b=YmQR1YkTRfGK9/
	i2gYi6Pn1giFfZ5JwhmyoWg3ifSfSHYst2EW2acBOTtQd/PonKo1rFTQXgiQx5DoqX4C9V4TDb5CB
	kkUpV5bsrcRCr7dXuS27hncuLY5c/YMxhoFvypJ8ElNUuDvBfSq/YNmspoJ9KvZZk4s0PQTwQDn2x
	4m9JT+vfRs8zq2ffPbj3Yn8MdQohMzhdjmeHbOG+/fyfU4j5sl7UQ5BIj89G84o0XHz2oMI8RP7zy
	qSIrRco1zi7hotffXIrBBJzMK3+2vWXz1nS1FRj2JmQ1jptLk3FKbbHTlRiO5P02gisgRxJjBXft5
	xV2BYK5BAslsYku+UNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGke-00000009G4M-3b0w;
	Wed, 11 Jun 2025 08:24:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFgd-000000094ro-3ZPR
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bDw8lv6DNJsD9dchwMOlh8L211qeg1CfzJ2PVT3ZHbE=; b=mUcx+qVvEJ4pdj1GnnsMFlLTmC
	GgzVwhMzlA+AbSkg4Ixq3GBhJHGiA0ZcHxMkOR6HqyJqy0Jke/uKQuZiL7Kbq5bgCsuLECxUyGOcn
	8uE28p1I4EZ8y9xXBFFibByYg4ex/tLTWemfp5AuVLz/TJkF6la5rZPB9L2XU9+GfTv5Dq6mQciKA
	iOEdgVrs/v2b3XQK2/pD4Kg6blUwr04TKeH+od3VIjdUgRlDUy2YXV6Kp8bJvAsZoXBkT3ZyziGlt
	dVoP4SdPdV67UJn5mU0+qh01ayLsaMo61dd3q06gxJQhndSYlfyW7Eak+l1wIzu6u84rNpIMxUGht
	8xq3j0Bg==;
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFgb-000000029aB-1wiH
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:15:51 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso4592096276.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 00:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749626146; x=1750230946; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDw8lv6DNJsD9dchwMOlh8L211qeg1CfzJ2PVT3ZHbE=;
        b=krXqTO4hwmPB4LYBxnJu4TQyDXtq5HQQpKVtCgWiWq23uM7naljp5XdtZCKW9Cuzvx
         bGdRs/rPLkFZWWtV2T6D979SZNY9kZS1ShikUtzRgJdkMHCMUM77FRykNJjn8xA1/AuO
         2J78VWMjvFVtz1ZhR1f7UWh7AQckw5zK8LBuJDTznUx9wa3c2QI+/pXdw7sNYA/LWdSK
         6hE5PBP2wU+g8htfLDadZbtmxUfxePRKt48C4OPmtgkWdxRi7HxVFiAHDOHNykL1UxSE
         V/ndnirAP2yKj7R8U93GDSdnNHzQFgkTWaPCBfjXvynGse+UYiCdwwvh5hfscF4BSWYY
         cJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626146; x=1750230946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDw8lv6DNJsD9dchwMOlh8L211qeg1CfzJ2PVT3ZHbE=;
        b=L6AdVueR6oUSBS9rCb1mMvICwvAuKAfToGujse3boioMviRXORwxtKbsoOImrNCZrX
         h87OlheVfAdQH/54xjVYSYu+5oL0FyXHB9MjhLoIsjFBiyl9IbDwKVW3NVDO87FF7LKH
         +mbuSgG1rg+s8bdfyC1nTtudfW+9K2F3pKa98xiEkTxAxfDXMewUWcRvHxavROSK17qw
         EXP7dLRCz1gof7ROwrj42SrB+Yn/wX8xOL5lCOzgeLHYjAKa4kyZcViCVmhgUgol5fjS
         qcji7iRKpPywssaomQqec6PAd8SUa1f2UsEW5G3Hhea3cfzXYUdodGaLZezE9uGEQR9g
         45zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBTkWIH48ATWHgC+2bnRbBXgeqHJf/FT87dPSYU+XaCJKUGl3+ntEK3W+OI9hBnkw576afM0W33c/b0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZBqzaE57d/NZ/mmwWTg5jefLDMMc7Myzjf2paCQ6n5uNzF7vf
	AjTc2OIdbscbyDIB9nQQM14smxzFCLOGszXK0LRT6kYv9mTB5V6lFg3GyQySn8qBkiA8zx1WYyw
	N+wc/WrOreqvUMKG3lWL+wUBit0Wtm2KnPlnac+rytg==
X-Gm-Gg: ASbGncty2fX4FvmoVfqFE7p8bql+zhMIKdGR9FZ6K5/TE+q4mBrMnbA5k4YTg1DJixa
	inqF+L5c5mEvrqMEc7bdmusYg57i1gyYR/10kneJdhOmWUVAavZazbDr6JVNUVrEYADTQrnVToU
	4ru6U0lpBj3/U4pq7RnhwJowx/IEMINE/dsjDO3D10lAnQUQ==
X-Google-Smtp-Source: AGHT+IEc+9hppzJUUw3dhryHx4clVFd5aDegC77U3+FbbfhX2RUu0BijR2nlmCbtsFlav7Da7Y/c1YmFqqH/eQyJEGw=
X-Received: by 2002:a05:6902:2191:b0:e78:eb00:babc with SMTP id
 3f1490d57ef6-e81fd9b2f22mr3224045276.26.1749626145882; Wed, 11 Jun 2025
 00:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250611031023.28769-1-nick.hu@sifive.com> <20250611031023.28769-2-nick.hu@sifive.com>
 <9c429671-8409-4911-8559-73a069d66964@kernel.org>
In-Reply-To: <9c429671-8409-4911-8559-73a069d66964@kernel.org>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 11 Jun 2025 15:15:34 +0800
X-Gm-Features: AX0GCFt836Lo7RPXBqlCX9ju9k05WYmV2JoCwZYZlclqH9DiOrcuiHuFOhx2tAw
Message-ID: <CAKddAkAyvRdAz9X_rCGgfdxD0Z_Q7sAt8e5nuJe7=s7G-Y3+AQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add SiFive Domain Management controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, Cyan Yang <cyan.yang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_081549_612653_B563BE95 
X-CRM114-Status: GOOD (  11.47  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMjo1N+KAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxMS8wNi8yMDI1IDA1OjEwLCBOaWNrIEh1IHdy
b3RlOgo+ID4gU2lGaXZlIERvbWFpbiBNYW5hZ2VtZW50IGNvbnRyb2xsZXIgaW5jbHVkZXMgdGhl
IGZvbGxvd2luZyBjb21wb25lbnRzCj4gPiAtIFNpRml2ZSBUaWxlIE1hbmFnZW1lbnQgQ29udHJv
bGxlcgo+ID4gLSBTaUZpdmUgQ2x1c3RlciBNYW5hZ2VtZW50IENvbnRyb2xsZXIKPiA+IC0gU2lG
aXZlIENvcmUgQ29tcGxleCBNYW5hZ2VtZW50IENvbnRyb2xsZXIKPiA+Cj4gPiBUaGVzZSBjb250
cm9sbGVycyBjb250cm9sIHRoZSBjbG9jayBhbmQgcG93ZXIgZG9tYWluIG9mIHRoZQo+ID4gY29y
cmVzcG9uZGluZyBkb21haW4uCj4gPgo+ID4gSG93ZXZlciwgU2luY2Ugd2UgZG9uJ3QgaGF2ZSBh
IFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZyB5ZXQsIHNvCj4gPiBhZGQgJy0ge30nIGZv
ciB0aGUgZmlyc3QgZW50cnkgWzFdWzJdLgo+Cj4KPiBCdXQgeW91IG11c3QgaGF2ZSBTb2Mgc3Bl
Y2lmaWMgY29tcGF0aWJsZSBzdHJpbmdzLiBTZWUgcHJldmlvdXMgZGlzY3Vzc2lvbi4KPgpNYXli
ZSBJJ20gbWlzc2luZyBzb21ldGhpbmcsIGJ1dCBzaW5jZSB3ZSBkb24ndCBoYXZlIGEgU29DLXNw
ZWNpZmljIGNvbXBhdGlibGUKc3RyaW5nIHlldCwgSSB0aG91Z2h0IHdlIGFncmVlZCB0byBpbmNs
dWRlIGEgYC0ge31gIGFzIHRoZSBmaXJzdAplbnRyeSwgYWxvbmcgd2l0aCBhbgpleHBsYW5hdGlv
biBpbiBib3RoIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgY29tbWVudHMgWzFdLgoKTGlua3M6Ci0g
WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2M5MWQ5OWM5LTBlY2ItNGRj
ZC05YmViLTVhMWU5ZmFkYzYxOUBrZXJuZWwub3JnLwoKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6
dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
