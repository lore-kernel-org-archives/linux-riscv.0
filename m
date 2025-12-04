Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97033D1D865
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 05:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uM9BHBJJKj3afKQEgr2Ngw1DThwf/7/oSXbxgX/1nGo=; b=SKlEirXj/zaaOd
	7FcXRWgEym49OIF6eph3Urpe3S9h9b2vCLU9EG0oGrvy6S9+vXEs9+1xPD6iVvLqcaDRZ0iLRB2SP
	/kFdG18FcVqDE/W4VioM4hReMlHRi9ucUNNjuKodA3dXia1l3GyL/l1uQXNOMcI7BWxp9zRcBZkEp
	UFLq7NwnNbEV4pI3Mpravlpyi0poXn2QH+yLmmljKRedgxhfGadWHjyZZNnoq9lpbihfgHlSAk+4J
	k1C8RoWOO6D66ddcNyWu3nhDEpGkHtQsHx2gJ3jlAPFXnwo8Ros1h92e7Kk8/dDw/qGANqBlxmzGS
	PHlTbdslZ7Nn61NjtOSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1jL-00000007UZY-236c;
	Thu, 04 Dec 2025 05:18:15 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR1jJ-00000007UYf-064j
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 05:18:14 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-659400dab22so351979eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 21:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764825491; x=1765430291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNDnKlHp/ZUbhmRkZfp5DLTg2xmo1qEY2RoZ68xLETE=;
        b=FO8856yWyLeUNFsYGdDwHbBQHDSqBlhHaTdF2+RPMlicGChhr7EvAc3FNf8i5l4Y6n
         kqYf80qI3R428f5nsZwbqL02eoIYrzLFKroJuWM1Nnh4Jq6lVXG2bducaHt0836jONaM
         /KokNzIrzpwe+wTa/Jb6loZOeWl8u8gj2NQgll6XaYNXV/Pv/P29DymWr56gZt6PudD0
         9IUBQrKDHCtmLbjFek+0sIoQF8stP+XBaA8JUNmrJpUb5s5ZtmhPr/ghrmKely4SASox
         35/KQLl3fZYQ3MhnYBnnGAKvi5Yqrkj4yuFg5DFV9hXU1oQsUuyU6Tu5HHISYK1uvbX7
         nOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764825491; x=1765430291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iNDnKlHp/ZUbhmRkZfp5DLTg2xmo1qEY2RoZ68xLETE=;
        b=epw/a0mnC+RqGAHvx2PJzibWUFYLb4UlaquJM/ZovZdcH05ji1EpyfsMflWOpswSG5
         MSYn566JKLx98IrXFxfXd/7NORZb5/7sR/ni+eARJvPQoWWQs5hnQwYEQT6v35Iqxrdn
         naoHqEsAMUzkBFWTH8RjWUX5HvYw8f7OQVZdqGmlvtUlf/Gu4vXen3SCDzVcKAO+6WPR
         s8P18D9ad1Cb1uSI7noOJ+fd4duWl7vKCg5hPYuvAbNqjhtrz6626RHaQgrjoSrGZfX8
         GqRoNiDx5qCfOoPE+0nKKZn3TLZw5oLMaOZWOjzMxlV3YqRaIWhltqY8wyiYpxJ+u0VW
         1Kag==
X-Forwarded-Encrypted: i=1; AJvYcCXB0nAGk89w1qSpCOOsuqOJKFyjlgY5K93+QotWySna3R7L+a0hXhAVEoGAEAzCT5WpvFi/0yF73HpKBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5LbAK8iWQITAa9wZgUMtVBjpUcsUoJS9OYcLLDo+L76MDrXT2
	kMQIKkDdeQ2qQP1HAP8i0ltZy1pnfq7Gz9aDJNW0jbmfoGH6kDF7iLc1O84lwt+U6CKydHdTQLg
	JZWfiXDnwzos+9uY/gQLqi3+FDJYwtFmN05vyy6/NUg==
X-Gm-Gg: ASbGnctGjbUTPHNaoZ5dPVyfcg/kvdmKA5G/8Ho7gSteYlhbFJyOpzPlW63H71tbGdE
	VfuDLTSnQJLs9GtZGg+yG1WDlNlOuuX+pOw//2ACvcCh2nPftV+bbY0bIvr+mPvhimeuzX9NdSJ
	xdcPGrOfuWaIQMNEJLrOfiurow7P0Au7RlkCXMbHayZxe9ZauTcEEJYebUk8o+Pu6Hn6dd1ROpp
	mLatBVQn+8KTeq39Kb9ZzDwfoIVHzO79zJ/GtYFmYKShusuXKEnKidIjur2ib+mlKMELCQ62npa
	3Q==
X-Google-Smtp-Source: AGHT+IE6Uo+mUT5GOvC/ChjVWxuELDhLbIjvw8L0mngRXN/XyCudJ4rOSwMT4tx1Bd5AVcgCYi5RjboTifVzzdPFKpI=
X-Received: by 2002:a05:6808:4fd4:b0:450:ccc6:4113 with SMTP id
 5614622812f47-45379e76627mr949636b6e.52.1764825491585; Wed, 03 Dec 2025
 21:18:11 -0800 (PST)
MIME-Version: 1.0
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-9-cuiyunhui@bytedance.com> <DEP50CD8K22E.1JW7GL6WLK44W@ventanamicro.com>
In-Reply-To: <DEP50CD8K22E.1JW7GL6WLK44W@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 4 Dec 2025 13:18:00 +0800
X-Gm-Features: AWmQ_bkci0NzLiA0LVBzrZMqySYI1Agon6sfMnpqxOwRNPLLk4lieoHNTIjoqIo
Message-ID: <CAEEQ3wkmFXAqBfHwJYbJRc5pagOJvtu-wEYGwXBF2beQiSMT1w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 8/8] drivers: firmware: riscv: add
 unknown nmi support
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, luxu.kernel@bytedance.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	jassisinghbrar@gmail.com, conor.dooley@microchip.com, 
	valentina.fernandezalanis@microchip.com, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org, 
	arnd@arndb.de, kees@kernel.org, tglx@linutronix.de, viresh.kumar@linaro.org, 
	boqun.feng@gmail.com, linux-arm-kernel@lists.infradead.org, 
	cleger@rivosinc.com, atishp@rivosinc.com, ajones@ventanamicro.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_211813_093590_64A67E8D 
X-CRM114-Status: UNSURE (   7.37  )
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

SGkgUmFkaW0sCgpPbiBUaHUsIERlYyA0LCAyMDI1IGF0IDEyOjEx4oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0xMS0yN1QyMDo1
MzowNSswODowMCwgWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Ogo+ID4gUmVn
aXN0ZXIgdW5rbm93bl9ubWlfaGFuZGxlcigpIGFzIHRoZSBoYW5kbGVyIGZvciB0aGUgVU5LTk9X
Tl9OTUkKPiA+IGV2ZW50LiBXaGVuIHRoZSBzeXN0ZW0gYmVjb21lcyB1bnJlc3BvbnNpdmUsIHVu
a25vd25fbm1pX2hhbmRsZXIoKQo+ID4gY2FuIGJlIG1hbnVhbGx5IHRyaWdnZXJlZCwgd2hpY2gg
aW4gdHVybiBpbnZva2VzIG5taV9wYW5pYygpIHRvCj4gPiBjb2xsZWN0IHZtY29yZSBmb3Igcm9v
dCBjYXVzZSBhbmFseXNpcy4KPgo+IElzIFVOS05PV05fTk1JIHdoYXQgd2UgZXhwZWN0IHRoZSB3
YXRjaGRvZyB0byBzZW5kPwoKRm9yIHJlZmVyZW5jZTogQXMgc3RhdGVkIGluCmh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvcHVsbC8yMjMsICJHZW5lcmFsbHks
CmFuIGV4dGVybmFsIGludGVycnVwdCBpcyB1c2VkIGFzIGFuIFVua25vd24gTk1JIHBpbiwgYW5k
IGFuIFVua25vd24KTk1JIGV2ZW50IGlzIHNlbnQgdG8gdGhlIFNCSSBmaXJtd2FyZSBieSB0cmln
Z2VyaW5nIHRoaXMgcGluLiBUaGVuIHRoZQpTQkkgZmlybXdhcmUgd2lsbCBzZW5kIFNCSV9TU0Vf
RVZFTlRfR0xPQkFMX1VOS05PV05fTk1JIHRvIHRoZQprZXJuZWwuIgoKV2hlbiB0aGUgTGludXgg
c3lzdGVtIGlzIHVucmVzcG9uc2l2ZSwgd2UgY2FuIG1hbnVhbGx5IHRyaWdnZXIgaXQgdmlhCkJN
QyAoaXBtaXRvb2wpLgoKPgo+IFRoYW5rcy4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
