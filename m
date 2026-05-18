Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5136FCD4F52
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcM3O6kyfr7iVPjbrUeHN3gSPKddPRqD78nhn52vDso=; b=o3g0fu/NtvyqKe
	zAlVIoTWMOvq+PZ9I7D/MI6cMA9MbaUwhr2GSO5IO7ZhL/aQIxfdxylTE2c3hlLqhB9wzz7exxvo0
	ySCx5mlMEyJAnvBS42ieJbuWDp7Xhu/Yrg9lh3mAoVmOH/nrPWK4wYUQaYnbypBO93FsjZ8RZMgNK
	o3ZwKyFxjc83lcwRVA+SPWpYtoJafI6GP5NRfndKKdE2CvrdLxdnesGrcUkV87RVWcc4sqDF/gamM
	TDyfPtr1kH5aHlv3UaO4Ny6WnHdvd6WEuhscPUdcytaN4AUR+pKO6wzVjveXzo7PviRDdM260CRlr
	7nnLPFFPSNzhdg8KrGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwO3-0000000FTmJ-24Qg;
	Mon, 18 May 2026 11:43:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwO2-0000000FTln-0ovj
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 May 2026 11:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=; b=Wn1s3nEOiR6TzeyDeS4qNUmrwa
	SaLeCheV1OJHvwo12Cff8BKhDpPI6zs3E2dro3jlSz6piWLwpaAPFHUuULAbPchsIqHzlALIkT2YO
	0dqHNi2ea+3JtQ9aUxaOkS9WLVaO0BRz32NKraEJBF58FRvGrhxC6QDwzMif1AMrujlu7u4PNyGj6
	8J24x7mj+jEoa5Vk6apWZnwDRfvSzmUcAzGO6px1ahrrNXj32ieH9yacikNEecUFSaCH0lxu/PdhK
	b8uNSNpVGddGXvchdTeCT1w33sVEefS6F4t5M0z3/yLq/5lXpNfOIdkvv7+PVTt3adlvESAf+ikwI
	U7PWyyqA==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwNw-0000000Az9H-3orR
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 11:43:52 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-484cf882ce5so867045b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 04:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779104627; cv=none;
        d=google.com; s=arc-20240605;
        b=ZPxjidt2YL3usYsmEouei+IUz+FOjlNXeprtPE7wKe8CncDt8pUDzZGrWp0LPB9i8x
         qNjXx9u+Agc5W+OOP3DL9Lpwy3z5MIezqWsmT/xCtJEW6aqRescOA4xjOXRUnMMZIM6I
         PImzwSuZNrQLb2y4L6WjALiwbYFcqjtjEYZFb/rE03zhQX0i2K2K+vIQcevMHgMUr5wC
         m0+LJhUQvaRgR63VaqGHpJDIQy/nbBq4zGKawA6IrjusrCr7GvNBL/FkjNV4+jnSBMq7
         +eiN+/HSkvPOZX3Cmress4Fqu/QNI59+jj+KOsN1vq+Zr9JFEgsEpA/U26KeIXJEzBq7
         opug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
        fh=fIuFo3TPYoK6q/EpXDS1Cqt4DCS/PN7lpXqvmJF2On4=;
        b=NQsiXSRDuqtSNsev8iI4ojQEwHkb8hF4c1wWahFW4OUO+f6tw85WIM4FktenL0sTSS
         RxgsGlHFd8dS6V6DbcAqz2KgV2NXVB4Xq6KftnT1yi/AiVAsMHvriyy1YcxriA1WcRsU
         /EfTfi0JRXJvr0YIFxj5R9bXp8WjUqORp1i6nJsBmawrorpvosg1U/LBgowoCMSJlRhX
         5fTv6lLLFBK5EJAaMat2kTdxq3Vgnhu26esf30/qTgKPm43z/FC7Sl3N56iG6ztLMma9
         Ruhlm+67fMC6E/ntqY9X9nKZSQapUpHa9Txnls0hiRQRZDXOeqloFVS92/qUg6s7OigC
         VNRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104627; x=1779709427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
        b=OR/U3P5x+u4wnV6EkXmrkqpKqBr2le6KjBtJs4QEO51+qEjZXPahsLZsVqfoAe8jVb
         IVXaoY8BmEAmXBg5pLEb1Yu3FfiH/VM73AiibaOO6jmHJoDI2qIQEmWH+RwEASx0pAfa
         qnIt/ILicI7CJiA4Jj1ZvVZcJLeW3Y34gGZ4hw6GZHzTKKs9+RWbbjr2GV8M3o8RiK96
         QAIGLqY8HwJOvvICzTqaRSq2EbFIvZN5s1w4buajpCY5yFp/CoAPKF/2DHEpLO03xb7l
         iBSlTsg6FiyP/0cIEZ6muJbKLTkftzzkid/31GvKo48lElWSlXstCDSzYsYHY7elVXrK
         Gs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104627; x=1779709427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
        b=BULm+16Lg0uT+MEI1OgFzpg8JU2fpHudsfQDoeQymaQ90tWr+norrI4PqZY1vYyUwz
         SZQAIviSSFVcOu0cjxeIYcvFnF02wfcCHfTEh/0EIzgEo9bZNh9V41ejXrvrCxquIBAX
         6A5td2PjQwORbityDW6N2KwXknJW8oOEr68wg0IdnQw9AA+JinsgRICIw4aeHmRqGcb+
         oWngigKk7OzAEwtIbihBiMMft6VXM0JcQJq8nlky7gMovqfX+ssNT8K9ceTtOSttcenE
         LDvXptn6QErYItJbuvE1ueaCVe5LVmnWRsd+I36pGREH8HEtbYqrDFPvcOXooN9z1EGq
         vIWg==
X-Forwarded-Encrypted: i=1; AFNElJ+BV0RsnDzWdEzL+f39/U/zCbS9aVpBfxuNzoyxaAEXECnEs0ypsWIJ4X5Lmg2jttdUHP4SgVM6PtaXHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyETcS26aO6MVRMYzryaVWvcvMnlE+5s6vkKQ8Tb7guPIU0h5UC
	EVs4st9GPh3766RZjAoAGfcWUN9ttl1NZ5jaYtRXWGSccyylAQUl8/aXYtul11oqhc6zIrGIrRL
	dBCRbiFl31GAu6PvwRPXKq8isaHVKMNU=
X-Gm-Gg: Acq92OGH9LqPjcpDlIRRKwu3bNTH9iT4fd8AGHdeEf5uEoUNmgk7A2NBjZ+YFg4qO/c
	9OT6ldpFToT0iIxUDO6gbck302AudC32nMBaCrA8v8xQAQZ0/bsHurGWSxfGMxj82lBD1j+Ft8r
	Uhyxhp6It4S9304/vx98yedN9U/LrMWjTOWkJj67DM5mCNiGE8mZdtaAyCBK3LDnIJtSJLvyKZZ
	0MeYcSEipBsU0uM3BwSZynaTalJTnI6iA8KmY6406vHdTu/nEcVZNfF0ChslqPPym8HuQeSR6zt
	E4mv7UqC5zy7WGZzUtmvkYhqBAkasj0SNs1Y
X-Received: by 2002:a05:6808:e412:b0:479:f9df:ab44 with SMTP id
 5614622812f47-482e576d9b8mr7135028b6e.35.1779104626807; Mon, 18 May 2026
 04:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com> <agryR7TRtYeILSeb@pie>
In-Reply-To: <agryR7TRtYeILSeb@pie>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 19:43:35 +0800
X-Gm-Features: AVHnY4JxCy_yj0ct8SUGbokzSlNpNk15B0EZlHkNvjOJV4hCGN2eYVdaxEIO11A
Message-ID: <CAJsYDVLvA_ASpctsC_HKA6mUMqp93J58c=nghCeP_jWpzkaf6Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for sf21-topcrm
To: Yao Zi <me@ziyao.cc>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124349_742048_DDC152A1 
X-CRM114-Status: GOOD (  11.78  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgNzowNeKAr1BNIFlhbyBaaSA8bWVAeml5YW8uY2M+IHdy
b3RlOgo+Cj4gT24gU3VuLCBNYXkgMTcsIDIwMjYgYXQgMTA6MTI6NTZQTSArMDgwMCwgQ2h1YW5o
b25nIEd1byB3cm90ZToKPiA+IEFkZCB0aGUgZGV2aWNlIHRyZWUgYmluZGluZyBoZWFkZXIgZm9y
IFNpZmxvd2VyIFNGMjFBNjgyNi9TRjIxSDg4OTgKPiA+IHRvcGxldmVsIGNsb2NrIGFuZCByZXNl
dCBtb2R1bGUuIFRoZSBoZWFkZXIgY292ZXJzIGJvdGggY2xvY2sgYW5kCj4gPiByZXNldCBJRHMg
cHJvdmlkZWQgYnkgdGhlIGJsb2NrLgo+Cj4gV291bGQgaXQgYmUgYmV0dGVyIHRvIHNwbGl0IHJl
c2V0IHN0dWZmIGludG8gYSBzZXBhcmF0ZSBoZWFkZXIgaW4KPiBkdC1iaW5kaW5ncy9yZXNldCwg
c28gaXQgZW5kcyB1cCB3aXRoIGEgY2xlYXJlciBzdHJ1Y3R1cmU/IFRoaXMKPiBzaG91bGRuJ3Qg
Y29zdCBhIGxvdC4KPgoKU3VyZS4gSSdsbCBzcGxpdCBpdCBpbiB2Mi4KCi0tIApSZWdhcmRzLApD
aHVhbmhvbmcgR3VvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
