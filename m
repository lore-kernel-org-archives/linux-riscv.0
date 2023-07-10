Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44907EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 19:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AvrZ2jEOc9KXW//o/wq9lLDWSVU2obIXdBvXefCwbI=; b=iMIHTFpb/irv/s
	PcCSu5S5tHENxa+r4Ztb/vS3Bl2xUVRgQNlIfx6NXOHSrhdLhVcpxZRtkhoCqhe+S949F4ovxswlI
	anYjEnEZuioPWrcjY086ayp1nepybIVKJPwig/mI8vS5vN/o7brkeG2LRcUQHeSqzLLBhCwW5GUN7
	ZVoBLXBvLTQQd0NHljtcF2c0cURdcTwLiPME8RPeWn2Gtfn8nOFRqNHFD+5RpuUA1nUVtDoT7s5H/
	b6vNyKLiraPQNw/rfqu4QZCAzkRUWXUItmCO4nWO3m6hg2Ff0YQbUt40/F/Y64VA+/rEsU5xc1A9N
	iBSj0N4XDwjiuJPtmKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIwl7-00Ca7p-2W;
	Mon, 10 Jul 2023 19:41:22 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIwl4-00Ca6y-2r
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 19:41:20 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so7608068e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689018075; x=1691610075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWqKm6QUIv0JSsGcZmR9jzvjSANP5a8f+sD83U2ywVQ=;
        b=VjwjN9xw0dHi1l+nsKHAm5isIeAJruQ+bySNLf7yg4TPoxSwFc5jy+SDXdJByzxQW1
         M6laBcQxkzlkjF52nlRWZ3xXEtpIwwf1XSMtN7qoTtKwvCL9QTUqFoMyeq++/UpNjzTL
         4gj5ImmuD997g2ALgR1Rb4TvQdYDNzzOoAiwjt5aWtBlPIm4q+KpYl2cPelcDbYdw2gW
         nBgnBJBQBDrzqmrveRqz84Msxy3ZG9PogFbjxGVxdWd9JzUcE/MnHL+Yzy/dN5FJbFV+
         9VYLUC8cPA+XQ9hLmoDkttzTi7ftToBvALBbHD6A77fQetcJ5tG6wsLvW6YjlxcU/NAM
         vLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689018075; x=1691610075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWqKm6QUIv0JSsGcZmR9jzvjSANP5a8f+sD83U2ywVQ=;
        b=V+vAsnNwMKvCzQFviKzULhyThjeEcykXqqSI2byqXgrEvGjXXMdCYdxkFFP0/gEW3t
         fvO/IqlSmJFQPoQMJtSwuTv8cHfia2z5SlUtzGVxJ8+SLZri3SzyYMqeP6FT6u4Ttcsa
         h9NnxFRuYFIREEonl4qprj1za4L3EwiZZmH5L/uCqmC5E3FPxY8eG82FC3TW+Mc3bilV
         PiP9DI+Eh4BUnYh3SztSd68LZiti3vWlytm5VQgc6EtOxg0eLP859Pm0Ior7T0xXe637
         nOMe1FIj64242ahCnm5NnQpDpkI9jsKSux6JvOyEWxXXn1f+8JdpnhFC7V2EI92wwX8C
         A4AA==
X-Gm-Message-State: ABy/qLbFwJxITrL0vMJyidW2su+xZZ7edItEJaH1xVcgt2M5wD+Zq4XN
	CaGNCUBfFbbtMpFXLurZZyCSQoiZEpqxrzVxEmq9Jg==
X-Google-Smtp-Source: APBJJlFfPk6eGhRrtspJMFf8PNSfoVkKlSIQ/2OgWKw3VcG2CMd9n2TGvzY2gLP0RpFgSB++tX++jrG1oiLhplPpNt4=
X-Received: by 2002:a19:3814:0:b0:4fb:8fde:f60d with SMTP id
 f20-20020a193814000000b004fb8fdef60dmr9788957lfa.22.1689018075688; Mon, 10
 Jul 2023 12:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230710193329.2742-1-palmer@rivosinc.com>
In-Reply-To: <20230710193329.2742-1-palmer@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 10 Jul 2023 12:40:39 -0700
Message-ID: <CALs-Hssm=hyjSwVyUu7QrWmG8FTDz+ubrGF0Lo7EhzJZhu2tbQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: RISC-V: hwprobe: Fix a formatting error
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de, andy.chiu@sifive.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_124118_951744_71EBB124 
X-CRM114-Status: UNSURE (   9.91  )
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

T24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgMTI6MzTigK9QTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJp
dm9zaW5jLmNvbT4KPgo+IEknbSBub3Qgc3VyZSB3aGF0IEkgd2FzIHRyeWluZyB0byBkbyB3aXRo
IHRoZSAnOidzLCBidXQgdGhleSdyZSBqdXN0Cj4gcmVuZGVyZWQgdG8gSFRNTCB3aGljaCBsb29r
cyBvZGQuICAgVGhpcyBtYWtlcyAiZmVuY2UuaSIgbG9vayBsaWtlCj4gIm12ZW5kb3JpZCIgYW5k
IHN1Y2gsIHdoaWNoIGlzIHNlZW1zIHJlYXNvbmFibGUgdG8gbWUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KCkFoIHdob29wcywgSSBtdXN0
IGhhdmUgbWlzc2VkIHRoYXQgb25lIGR1cmluZyB0aGUgZG9jdW1lbnRhdGlvbiBjbGVhbnVwLiBU
aGFua3MuCgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
