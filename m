Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283AFC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dF2gEjFZiEUM9zAMjaU4qgMepQlCvxPyGVWZHwZXwGw=; b=qElRbbVDm1aHh9
	cT5IP62cgLDZf11wLbECJ+mwdxXzmedXPYMNqSfRRhGqwu0fA0yfEzS6MEROlcTe4VlSaViBYS81X
	Afi9J/WPs1bCSqoZmr3PNi/TKPAgBpO1qAnAfd4D/UCfay/qhzjXeAUoqT0h4y0MFQBt1gJgGALsA
	GH3e5YaB//UE2op7gd+o9NKNqQ01Q4nczUy1Rr/Z7tjF5ntGDoaGPmuU+jhZrD3gcve8w2o81IRtx
	wuN56DuOiCu/qbp0OG8UABgE4qqebDd6aNwZpAIIc+13GNPgjhQHMIZNRP/zdmywmau9ZjOUrS1f6
	Tg5feu6Xtt1m+7U0RhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyr8C-00567n-29;
	Tue, 16 May 2023 09:38:08 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyr8A-005675-0v
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 09:38:07 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-24de9c66559so9554253a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684229884; x=1686821884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcPyZ54ldUCQts1fa3VDXSS+xl2KucQtdFVpSxiwBxc=;
        b=DU5/VIrFG7reTAO9QxhhODhV5q6nQbRuCcFF7dZS+vo49dM051KgUyLTkEGAY17YhA
         NUGNaHs5g+z1g2S5tlreNpi9npqPyctgfVcd0xndJqnSK+rH/C5pdo8KDhhlMEDrJrMb
         8jM9ZfbDgCjNowGUfj9bHMn/XwXc0dcDMrCJIj699zNypRCUhm6quAIUot8k8IuBoiS7
         Khkjv4D+39G03t+FtvLUJzQm0f3FhID83B+2w8QYJTJh2exa6+XX6eJeeY2ZQaJNciXI
         eawJngTYScPCmzGUv2+sDdBg+EIu8iAnjOO9eIj30DgNFWMJdg3yYUZdsJ5imJGfrseA
         DJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684229884; x=1686821884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcPyZ54ldUCQts1fa3VDXSS+xl2KucQtdFVpSxiwBxc=;
        b=leO0pUE0EfVrhitHQSzE6yhOtML+WP512hEeYk55P4peZ5WRkZoQZ6ABMasROVOEpm
         GrmQ/qugIVpjEJ69Sa1VeCwZEHhr21bgT0c75ItU22tuHhjagJQ8M4Pme+KNV1HaOF4i
         0BKodTFRL37525+a1sZIhluEybYSh5X/ooXM0VCbZqNeBgdczzD4aKPmJC7yWqJ19QtG
         s4KEZnAXHhUlO5JN6O14S31G3BagwnXM+59uZkaZMDkCmwQeG8x0xkdIiPILMHzFQy1S
         KsCFmA9tHS2CoskMe8LZ28R1P3/Pzpx/1YSheKrlipfvnFjRfcOaX301jrTT5iKrBqRW
         i7RA==
X-Gm-Message-State: AC+VfDy1g5iUslXkjPpWhzU9G4i252eOQRjktpi3wx5nzEAxkE6XNi7h
	3Qej5l6jKlX/fSekQCinoBVDSArYJx62YCGSi/4=
X-Google-Smtp-Source: ACHHUZ66lklqalTjUc1ffo3yWrc+bRrfEml1qJYxgf/ydcHrvZSuxhSIWWtNK8ldHQ96S4/rnUtpu1XgkdQdHu4Km8Y=
X-Received: by 2002:a17:90a:fe05:b0:250:9d75:abe7 with SMTP id
 ck5-20020a17090afe0500b002509d75abe7mr26052714pjb.47.1684229884532; Tue, 16
 May 2023 02:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230511093234.3123181-1-suagrfillet@gmail.com>
 <20230511093234.3123181-5-suagrfillet@gmail.com> <20230515143700.26beeacf@gandalf.local.home>
In-Reply-To: <20230515143700.26beeacf@gandalf.local.home>
From: Song Shuai <suagrfillet@gmail.com>
Date: Tue, 16 May 2023 09:37:53 +0000
Message-ID: <CAAYs2=hd1geHCTGrO=JohTYtgu+yj+D7EPono-ADOGfjYnLfrA@mail.gmail.com>
Subject: Re: [PATCH V10 4/4] samples: ftrace: Add riscv support for SAMPLE_FTRACE_DIRECT[_MULTI]
To: Steven Rostedt <rostedt@goodmis.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mhiramat@kernel.org, mark.rutland@arm.com, guoren@kernel.org, 
	jszhang@kernel.org, e.shatokhin@yadro.com, bjorn@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_023806_324678_F3CE564E 
X-CRM114-Status: GOOD (  14.36  )
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

U3RldmVuIFJvc3RlZHQgPHJvc3RlZHRAZ29vZG1pcy5vcmc+IOS6jjIwMjPlubQ15pyIMTXml6Xl
kajkuIAgMTg6MzflhpnpgZPvvJoKPgo+IE9uIFRodSwgMTEgTWF5IDIwMjMgMTc6MzI6MzQgKzA4
MDAKPiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBzZWxl
Y3QgSEFWRV9TQU1QTEVfRlRSQUNFX0RJUkVDVCBhbmQgSEFWRV9TQU1QTEVfRlRSQUNFX0RJUkVD
VF9NVUxUSQo+ID4gZm9yIEFSQ0hfUlY2NEkgaW4gYXJjaC9yaXNjdi9LY29uZmlnLiBBbmQgYWRk
IHJpc2N2IGFzbSBjb2RlIGZvcgo+ID4gdGhlIGZ0cmFjZS1kaXJlY3QqLmMgZmlsZXMgaW4gc2Ft
cGxlcy9mdHJhY2UvLgo+ID4KPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJpc2N2L2M2OGJhYzgzLTVjODgtODBiMS1iYWM5LWUxZmQ0ZWE4ZjA3ZUB5YWRyby5jb20vVC8j
bWExMzAxMjU2MDMzMWM2NmIwNTFiNTgwYjNhYjRhMDRiYTQ0NDU1ZWMKPiA+IFRlc3RlZC1ieTog
RXZnZW5paSBTaGF0b2toaW4gPGUuc2hhdG9raGluQHlhZHJvLmNvbT4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiA+IFRlc3RlZC1ieTogR3Vv
IFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4KPiA+IEFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2lu
Yy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKysKPiA+ICBzYW1wbGVzL2Z0cmFjZS9mdHJhY2UtZGlyZWN0LW1vZGlmeS5j
ICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrCj4gPiAgc2FtcGxlcy9mdHJhY2UvZnRyYWNl
LWRpcmVjdC1tdWx0aS1tb2RpZnkuYyB8IDQwICsrKysrKysrKysrKysrKysrKysrKwo+ID4gIHNh
bXBsZXMvZnRyYWNlL2Z0cmFjZS1kaXJlY3QtbXVsdGkuYyAgICAgICAgfCAyNCArKysrKysrKysr
KysrCj4gPiAgc2FtcGxlcy9mdHJhY2UvZnRyYWNlLWRpcmVjdC10b28uYyAgICAgICAgICB8IDI3
ICsrKysrKysrKysrKysrCj4gPiAgc2FtcGxlcy9mdHJhY2UvZnRyYWNlLWRpcmVjdC5jICAgICAg
ICAgICAgICB8IDIzICsrKysrKysrKysrKwo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgMTUwIGluc2Vy
dGlvbnMoKykKPgo+IEkgYWNrZWQgdjggKHdoaWNoIHlvdSB3aWxsIG5lZWQgbXkgYWNrIHRvIGdl
dCB0aGVzZSBpbikuIFVubGVzcyB0aGlzIHBhdGNoCj4gY2hhbmdlZCBzaW5jZSB2OCwgeW91IHNo
b3VsZCBpbmNsdWRlIG15IGFjayBpbiBmdXJ0aGVyIHZlcnNpb25zLgo+ClRoZXJlIHdlcmUgbm8g
Y2hhbmdlcyBpbiB0aGlzIHBhdGNoLCBleGNlcHQgZm9yIGEgZmV3IHRhYiBwcmV0dGllcyBzaW5j
ZSB2OC4KeW91ciBBY2tlZC1ieSB3aWxsIHN0aWxsIGJlIGluY2x1ZGVkLgo+IE9yIHlvdSBtYXkg
YmUgd2FpdGluZyBsb25nZXIgZm9yIGl0cyBhY2NlcHRhbmNlLgo+Cj4gSWYgdGhlIHBhdGNoIGRp
ZCBjaGFuZ2UsIHBsZWFzZSBhY2tub3dsZWRnZSB0aGF0IGluIHRoZSBuZXh0IHZlcnNpb24gKG9y
Cj4gdGhpcyBvbmUgaWYgaXQgZGlkIGNoYW5nZSksIGFza2luZyBtZSB0byBhY2sgaXQgYWdhaW4u
Cj4KPiAtLSBTdGV2ZQoKCgotLSAKVGhhbmtzLApTb25nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
