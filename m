Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611F7C5ACB3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 08:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BosJp2tXJJ73vZwHHgr1JUIqr2Maxkm6NAwrBB++Cw=; b=2sIwFZItahpnV2
	ajZym/myjGEJ0bP9zl1A72ZxL0xeKkuY7+YrCxAKRhJsKx0d8UefuDe6O3ZnHX+NMjHrF+ks5exgD
	MzFyPDwZRGxvdUKIdpwqgFreHxzHEOuxeFD8hw6GEBNWB7G9Pu2Oqx32Gu6UnkYD2bvGcy517U8SX
	WUk8zM6KfWx0SkZEFLUHRtYt7YVF5NlxOlsDSI9pT+SjXIS8HBC992ltmkJnultrpvjTbX1nWm1lY
	+ZiRJZSuYOH7OmKMea707kxKaNCKbIYgLQqpxCjFO20AHzwP2Z8602Iie8x+hIxVT3EylKaCexoRH
	YvjMf8N8v4vQERdN32HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5M0e-00Fza1-2T;
	Tue, 21 Nov 2023 08:21:30 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5M0b-00FzYZ-1A
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 08:21:27 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507975d34e8so7421322e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 00:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700554882; x=1701159682; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eigScL5e5mup7Z3+ShdJXrR842NJQMOChPfOYWt/3l8=;
        b=jJ5+vElPh/ZxokJ4hpBRGw8Uyj0Zlmbmev68NJP44G148Utx1RaqrJZJgBEkCo5UFe
         mGFmLGpA+kSaH0yxb7OSoa3zneUg3Ce206trzHj7Dxknc8CqijqSd/S3unAeAOOl92vC
         E2idRf6vua8aixY+zZekYznwWzxjImN6ItDrmXyCMu6FAsZ7fgFecbXxII7nS+L62Cpi
         7LhzwZ2MkLXQakob4YcbKKw0c2KH9ZUJWcBuUVjGtg+VH/nL3G92/77vXFSoKf63ip/+
         O76ZnbuGeiaBRNhqfPEBPFjvQ4t9cwB9348XvirLUXkRo7G3coUU8COz4vPMoYedPap9
         8N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700554882; x=1701159682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eigScL5e5mup7Z3+ShdJXrR842NJQMOChPfOYWt/3l8=;
        b=HJGjiEcG5tIcFUiLe67tj4X00Ls9SxOwsa+GjKyHPdicHTHlQLfzDLwpZ1v1d8ZWF4
         zRF4mubIdMxUTR9gYdQvGRwSvF8KooqN0MbhaupuwmVZxLKicSahARYwdB7R3vEngLgA
         oNYBwaQfMFdHTz+SOsHmLwWiDtoyxfSx77GtE/5zWC4CxyX4p4LClpsifV0gtly52Loq
         j8v4RBTaNbQ6qpstsIiPUJmjBXEd69JnoJ4J1/8yg//I6TTydiSNX6E+xt+CPpaDPIJq
         3Cs3sgszKTRHqy1SaJgA8ppJvMLLFizN5/c1TmoTV+9HTxOf04MYznp2x5M8DA0Z5p6g
         tyeg==
X-Gm-Message-State: AOJu0YyiaTC43O6ydJHx+AZ9BJIO33TDTwupDHnRgdQwYJkREVRKo6Cp
	9l9QtbEN0Hl2APni81zvQ32xa1Jnr87Z7lh2A+SIiLmrzmhPCLkg
X-Google-Smtp-Source: AGHT+IGbr2XYSRwYN9sWNDSkKbTgz7fmIbWZKQo/3+nZwrm2DQiOQ819Z3adb6Rl/lF0tqkEzzFHe3gA2gKk/dP5AMM=
X-Received: by 2002:a05:6512:398c:b0:50a:aa8d:1a60 with SMTP id
 j12-20020a056512398c00b0050aaa8d1a60mr6848280lfu.48.1700554882341; Tue, 21
 Nov 2023 00:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-5-apatel@ventanamicro.com> <1dd7f7b4-d2ba-4216-ac3f-3552c2bee24b@kernel.org>
In-Reply-To: <1dd7f7b4-d2ba-4216-ac3f-3552c2bee24b@kernel.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 21 Nov 2023 00:21:11 -0800
Message-ID: <CAHBxVyG-DK9cDqPedJcR2W2=LQFumQQ_0Z0UUdbbzgju7BaAtg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] tty: Add SBI debug console support to HVC SBI driver
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_002125_619489_05B64729 
X-CRM114-Status: GOOD (  14.56  )
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

T24gU3VuLCBOb3YgMTksIDIwMjMgYXQgMTE6MTbigK9QTSBKaXJpIFNsYWJ5IDxqaXJpc2xhYnlA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxOC4gMTEuIDIzLCA0OjM4LCBBbnVwIFBhdGVsIHdy
b3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L2h2Yy9odmNfcmlzY3Zfc2JpLmMgYi9k
cml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jCj4gPiBpbmRleCAzMWY1M2ZhNzdlNGEuLjY5
N2M5ODEyMjFiNSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdHR5L2h2Yy9odmNfcmlzY3Zfc2Jp
LmMKPiA+ICsrKyBiL2RyaXZlcnMvdHR5L2h2Yy9odmNfcmlzY3Zfc2JpLmMKPiAuLi4KPiA+IC1z
dGF0aWMgaW50IF9faW5pdCBodmNfc2JpX2NvbnNvbGVfaW5pdCh2b2lkKQo+ID4gK3N0YXRpYyBp
bnQgaHZjX3NiaV9kYmNuX3R0eV9nZXQodWludDMyX3QgdnRlcm1ubywgY2hhciAqYnVmLCBpbnQg
Y291bnQpCj4gPiAgIHsKPiA+IC0gICAgIGh2Y19pbnN0YW50aWF0ZSgwLCAwLCAmaHZjX3NiaV9v
cHMpOwo+ID4gKyAgICAgcGh5c19hZGRyX3QgcGE7Cj4gPiArCj4gPiArICAgICBpZiAoaXNfdm1h
bGxvY19hZGRyKGJ1ZikpIHsKPgo+IEkgd29uZGVyLCB3aGVyZSBkb2VzIHRoaXMgYnVmIGNvbWUg
ZnJvbSwgc28gdGhhdCB5b3UgaGF2ZSB0byBjaGVjayBmb3IKPiB2bWFsbG9jPwo+CgpXaGVuIFZN
QVBfU1RDSyBpcyBlbmFibGVkLCBzdGFjayBhbGxvY2F0aW9uIGRlcGVuZHMgb24gdGhlIHZtYWxs
b2MuClRoYXQncyB3aHkgd2UgaGF2ZSB0byBpZiB0aGUgYnVmIGlzIGFsbG9jYXRlZCB1c2luZyB2
bWFsbG9jLgoKPiA+ICsgICAgICAgICAgICAgcGEgPSBwYWdlX3RvX3BoeXModm1hbGxvY190b19w
YWdlKGJ1ZikpICsgb2Zmc2V0X2luX3BhZ2UoYnVmKTsKPiA+ICsgICAgICAgICAgICAgaWYgKFBB
R0VfU0laRSA8IChvZmZzZXRfaW5fcGFnZShidWYpICsgY291bnQpKQo+Cj4gQW0gSSB0aGUgb25s
eSBvbmUgd2hvIHdvdWxkIHByZWZlcjoKPiAgICBpZiAoY291bnQgKyBvZmZzZXRfaW5fcGFnZShi
dWYpID4gUEFHRV9TSVpFKQo+ID8KPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvdW50ID0g
UEFHRV9TSVpFIC0gb2Zmc2V0X2luX3BhZ2UoYnVmKTsKPiA+ICsgICAgIH0gZWxzZSB7Cj4gPiAr
ICAgICAgICAgICAgIHBhID0gX19wYShidWYpOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAg
cmV0dXJuIHNiaV9kZWJ1Z19jb25zb2xlX3JlYWQoY291bnQsIHBhKTsKPiA+ICt9Cj4KPgo+IHRo
YW5rcywKPiAtLQo+IGpzCj4gc3VzZSBsYWJzCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
