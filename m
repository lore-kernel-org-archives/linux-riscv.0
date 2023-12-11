Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A26C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiaHlv1c5yIDAwwl+Tj5i7Gy5V1mR6PXAEOgzZJNMWQ=; b=JnIY8dOb3TFx8n
	PTtleEOAMGgmZMe4qXsEcj+D2T7X5DF+DI1sLRcgHcYLkR50+UrYGG8wua63eDjIOvXk5TYBKkIHY
	W2HlxlZNQFRvYOA6BtH2KkVVEWKZeQYNPFFnh2UCZ4HwL2F5+M2yUuynndB1TtJpTIlxLKn5ym54l
	RAwcujvtC3jcrWHyaUrgOch0EHYqyq4MoxNCN+u6hlvzgs23dzBaxlpb2HYjbUDH2vosT+IQ7dSFe
	c7T01lBjvdCEqX91Cc2xpf2Dr5n0Si7n+RiOb8npt/EU7OJoXpLHn/kO9BF1vccDzz+Urnbq5kSpK
	5Mygaujfo7Zc6/cfQNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkBc-006Nn3-2r;
	Mon, 11 Dec 2023 17:35:20 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkBE-006Nh9-0p
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 17:34:57 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6d9e9f3a3abso2622722a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 09:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702316091; x=1702920891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGzPnVe+NCTMdJ+XuET4cvoiuLLibz97osrkOtPIDJM=;
        b=OLQbjA3wTLLr4dc6MTYxV9qR4l2oTE9+jXDNWBigvmHmdTY46at6Njuvg9i8ur39E7
         kZSOYjpSu4+yRwZDCSyWFNfLL3RGC5qMV02I74Jn3NiAhWxNYBK9dP8l8mh5sH57uTKC
         BlL17YNZsT0SDpCoHZBmcQDnzxaaO9pFXMIQFjAmhstiJqKLLsy5eiz9ULVmhMD7G4Bd
         iFDowxZOLtT5TjOkjLfoFKUw8bNYyyhbeGJoujn+dE7K0yzO0vIrtqwj3Qu7lw9zONoE
         uk6z+WGJ2J4mYUcc5My+Puh49I/Q0DhwRlLrwV9YDV/AoSySqX1mDz0LgD0p64DQpssZ
         xQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702316091; x=1702920891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGzPnVe+NCTMdJ+XuET4cvoiuLLibz97osrkOtPIDJM=;
        b=qKRAx1IXdbJLaV1IAfMM4I5AGlGayDFNbdmxFGFEsuuovfiTZgjai8OeiE4B/XFRY6
         bI9w2qX9oJDXnmXsLTFQ8BcZQs05thu0UpKMs8IsHWJ5fblNXX8cdBslef2wcOhxCRCc
         l3nbg1m05tCYFKAsXNloSOtB8ehxeBBvWNYq6SeqOi4pFxFn+nNRihB5VlGCUtgZYu3l
         FVheQdyxWt1C+UEb2Eyf/70Vzq4tMj0eQzRJ12MtOsuYNhiSrQn5WgEoPe/478RuXQR0
         q6WaMsIWPCQTXTHMXo4bT33ZRSBirHmYGpyhtllIvyvtqa1cIwBNYJjip2zZCHiV6sIh
         iutw==
X-Gm-Message-State: AOJu0YxOX2XW43KNeRxGtQ5OOFdZkWfpE7WzPdjjSHAug7dTR5kFjP/e
	uVbbZI/Xi9vgdHAbJh0nnZJQPvj/Ak7BNLbtOaUFWg==
X-Google-Smtp-Source: AGHT+IHtB3TpceicLLuvdZOmAoSpInnjfpt6Co4jz7+C/8Uqcsh3PtyUf/bHJu/qoIh1rry6vWIcwpOxpVoS1NHg1JU=
X-Received: by 2002:a9d:7690:0:b0:6d9:db29:6ad4 with SMTP id
 j16-20020a9d7690000000b006d9db296ad4mr4475370otl.64.1702316091311; Mon, 11
 Dec 2023 09:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20231211110331.359534-1-songshuaishuai@tinylab.org>
In-Reply-To: <20231211110331.359534-1-songshuaishuai@tinylab.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 11 Dec 2023 09:34:13 -0800
Message-ID: <CABCJKudbwKLj-+c__Jd6Pp7PVHHBiNPYq+rhadwRO1ykoF-Erg@mail.gmail.com>
Subject: Re: [PATCH --fixes] riscv: Remove SHADOW_OVERFLOW_STACK_SIZE macro
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@kernel.org, conor.dooley@microchip.com, bjorn@rivosinc.com, 
	debug@rivosinc.com, greentime.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_093456_319468_24C3C519 
X-CRM114-Status: GOOD (  12.91  )
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

SGksCgpPbiBNb24sIERlYyAxMSwgMjAyMyBhdCAzOjA04oCvQU0gU29uZyBTaHVhaSA8c29uZ3No
dWFpc2h1YWlAdGlueWxhYi5vcmc+IHdyb3RlOgo+Cj4gVGhlIGNvbW1pdCBiZTk3ZDBkYjVmNDQg
KCJyaXNjdjogVk1BUF9TVEFDSyBvdmVyZmxvdwo+IGRldGVjdGlvbiB0aHJlYWQtc2FmZSIpIGdv
dCByaWQgb2YgYHNoYWRvd19zdGFja2AsCj4gc28gU0hBRE9XX09WRVJGTE9XX1NUQUNLX1NJWkUg
c2hvdWxkIGJlIHJlbW92ZWQgdG9vLgo+Cj4gRml4ZXM6IGJlOTdkMGRiNWY0NCAoInJpc2N2OiBW
TUFQX1NUQUNLIG92ZXJmbG93IGRldGVjdGlvbiB0aHJlYWQtc2FmZSIpCj4gU2lnbmVkLW9mZi1i
eTogU29uZyBTaHVhaSA8c29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmc+Cj4gLS0tCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhy
ZWFkX2luZm8uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAo+IGluZGV4
IDU3NDc3OTkwMGJmYi4uNDg1NjY5N2M1ZjI1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGhyZWFkX2luZm8uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhy
ZWFkX2luZm8uaAo+IEBAIC0yOCw3ICsyOCw2IEBACj4KPiAgI2RlZmluZSBUSFJFQURfU0hJRlQg
ICAgICAgICAgICAoUEFHRV9TSElGVCArIFRIUkVBRF9TSVpFX09SREVSKQo+ICAjZGVmaW5lIE9W
RVJGTE9XX1NUQUNLX1NJWkUgICAgIFNaXzRLCj4gLSNkZWZpbmUgU0hBRE9XX09WRVJGTE9XX1NU
QUNLX1NJWkUgKDEwMjQpCj4KPiAgI2RlZmluZSBJUlFfU1RBQ0tfU0laRSAgICAgICAgIFRIUkVB
RF9TSVpFCgpBaCwgZ29vZCBjYXRjaC4gVGhhbmtzIGZvciB0aGUgcGF0Y2ghCgpSZXZpZXdlZC1i
eTogU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVuQGdvb2dsZS5jb20+CgpTYW1pCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
