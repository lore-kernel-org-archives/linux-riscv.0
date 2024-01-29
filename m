Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F290C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ov7wYpUH6Urwa5hc9d4hkKJUS4fJUglIqZHWXnp42XE=; b=o/gI5JTkD/XPQF
	vkRawx/Kg+z67hPUImDrh2Vj2+a/EuEHZiG2P4SZvG5SBxWyPM3spm8yemv/Iil0v/O8dZep7rsgN
	D2/PxmneCxlIazPKybZMXvqrvQHSdfXECw+ciRAjvh5O5g6C/ZrbanDLykaO7UOfu3RNL3it61tSs
	h+fZwn/arQJwjnLcjqHafbprMqBXXuLdjaOq5KLvsVsTE6zDiACo9UiCaIqrGeCyT2q8Maes5vOj4
	GUcEpGiv+tD6/rcSJVWk9hPHhaBqu7qGt69ViN7W//6jBy919nIe0h9wg7SkBK8lqQlAtNBESFbKD
	TDBjdc4qS4TFrpOxJbZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMoV-0000000Bjhk-2Qpg;
	Mon, 29 Jan 2024 08:16:19 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMoT-0000000BjhB-0eaj
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 08:16:18 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4bda1df7e35so253749e0c.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 00:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706516174; x=1707120974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OL962hsrazE62p7R/jJW2A1J29P+0IWGTWAVOKd3dc=;
        b=AfF6Vpe2PgPEerLgzUGoavY8l7NmsNChQP9BCzna6RcfFrs9cTeOjv3Sqh9tRDM7MC
         7rBrrQxetsfkVOSBSDEbK+yQBpf++h9H3W801IAZmEsTcc5WvMzYN+HCVa/H+hiPqWVM
         OtTCHb5hLTW6QscpathGEjTIi3m1P4wEY92XkfM2gSIQvHA6cBe06XUEw0THaTCjr3F/
         NajZh1nQYjECfUS1DxhxbdJrTrjcnibnqOjbGzzDBem7evcs78uOHH2rmv1pjcI0cSH8
         lDbmuQ1xBTJa7EjPHO+xfRg+/CLLb1NKp1/mOUpEDuT03VnsQ66ooS2NavbGU91HC2VG
         AV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706516174; x=1707120974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OL962hsrazE62p7R/jJW2A1J29P+0IWGTWAVOKd3dc=;
        b=Z2QLGOs3sb+Hb+EiLMcyHzu6/B6kPjCrIYDfG75PUDQGhxFZFsi92QLGCCCJLWjfKR
         m8mwxj0a1b6a2ebV7WhQQ1Ino8kYzYUzXnu7nz3VzDMIAOeM2MfwKobI+xKi7HsC1uEB
         Zhq/8iJ/WI9lezRIiZTeEskaj8ZcfWtbuW+z6F1hd8YHIfeyLjsiTj7tX/B4yEe2Wliv
         Q+xoIbQ+ajFmkZDvlTfvdBbmMGUzrvmCbvRjwYrAqiKy4ulkl6jdRjJXYwQF5fmbnl8+
         7yOwnsRMyPN2xuml54rnOlwGif2m/hrY+e08Yl5H4mpeCXmVuztwKNvAUjvcW1t8s4ND
         hp/Q==
X-Gm-Message-State: AOJu0YyExtYzFSy5yZI8wf17xaJ7WL8+gzdUnciG9hFh+7sGSpFUX2Vk
	Fah1fJEg375iz7q+nTc1Ixi3IDK+P+xvkHcqEW28cVVORqQ8TIgvFisYMclAnIN+5lWUHyL12Ct
	+TYqd+M18HA274Va6weL0lDp2eAo=
X-Google-Smtp-Source: AGHT+IFVLswNDcWZYfO3yzzAlQv+TtXRezQ/W4fDx0M03rR10TDzekL3bjX7/Ul6Vk7QpTK9ppe6q4oY0+U+lD94G6U=
X-Received: by 2002:a05:6122:2528:b0:4bd:5799:2c09 with SMTP id
 cl40-20020a056122252800b004bd57992c09mr1524815vkb.5.1706516174654; Mon, 29
 Jan 2024 00:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 29 Jan 2024 08:15:48 +0000
Message-ID: <CA+V-a8t4v2CxZWrLRKBinS5fyG-_FzDFz5zA=mgcrNutJABr5g@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Add missing port pins for RZ/Five SoC
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_001617_238836_2F3FD866 
X-CRM114-Status: GOOD (  18.20  )
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

SGkgR2VlcnQsCgpPbiBNb24sIEphbiAxNSwgMjAyNCBhdCAxOjA44oCvUE0gUHJhYmhha2FyIDxw
cmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBMYWQgUHJhYmhha2Fy
IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4KPiBIaSBBbGwsCj4K
PiBUaGlzIHBhdGNoIHNlcmllcyBpbnRlbmRzIHRvIGluY29ycG9yYXRlIHRoZSBhYnNlbnQgcG9y
dCBwaW5zIFAxOSB0byBQMjgsCj4gd2hpY2ggYXJlIGV4Y2x1c2l2ZWx5IGF2YWlsYWJsZSBvbiB0
aGUgUlovRml2ZSBTb0MuCj4KPiBDaGVlcnMsCj4gUHJhYmhha2FyCj4KPiB2NCAtPiB2NToKPiAq
IE1hZGUgc3RydWN0IHJ6ZzJsX3ZhcmlhYmxlX3Bpbl9jZmcgdmFyaWFibGVzIHUzMgo+ICogVXBk
YXRlZCBQSU5fQ0ZHX1BJTl9NQVBfTUFTSyBtYWNybyB0byB1c2UgR0VOTUFTS19VTEwoKSBhcyBy
ZXBvcnRlZAo+ICAgYnkga2VybmVsIHRlc3Qgcm9ib3QuCj4KPiB2MyAtPiB2NDoKPiAqIFJlYmFz
ZWQgdGhlIGNoYW5nZXMgb24gdG9wIENsYXVkaXUncyBwYXRjaGVzCj4gKiBwYXRjaCAxLzQgaXMg
bmV3IHBhdGNoIGZvciB1c2luZyBGSUVMRF9QUkVQX0NPTlNUL0ZJRUxEX0dFVCBhcwo+ICAgc3Vn
Z2VzdGVkIGJ5IEdlZXJ0Cj4gKiBwYXRjaCAyLzQgYWRqdXN0ZWQgdGhlIGNvZGUgYWdhaW4gdXNp
bmcgRklFTERfUFJFUF9DT05TVC9GSUVMRF9HRVQKPiAqIHBhdGNoIDMvNCBmaXhlZCByemcybF9w
aW5jdHJsX2dldF92YXJpYWJsZV9waW5fY2ZnKCkgYXMgcG9pbnRlZCBieSBHZWVydAo+ICogcGF0
Y2ggNC80IGlzIHVuY2hhbmdlZAo+ICogcGF0Y2hlcyAxLTMgaGF2ZSBiZWVuIGJvb3QgdGVzdGVk
IG9uIGcybCBmYW1pbHkKPgo+IHYyLT52MzoKPiAqIEZpeGVkIGJ1aWxkIHdhcm5pbmdzIGZvciBt
NjhrIGFzIHJlcG9ydGVkIGJ5IEtlcm5lbCB0ZXN0IHJvYm90Lgo+Cj4gUkZDIC0+IHYyOgo+ICog
Rml4ZWQgcmV2aWV3IGNvbW1lbnRzIHBvaW50ZWQgYnkgR2VlcnQgJiBCaWp1Cj4KPiBSRkM6Cj4g
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDYzMDEyMDQzMy40OTUyOS0z
LXByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbS9ULwo+Cj4KPiBMYWQgUHJh
Ymhha2FyICg0KToKPiAgIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBJbXByb3ZlIGNvZGUgZm9y
IHJlYWRhYmlsaXR5Cj4gICBwaW5jdHJsOiByZW5lc2FzOiByemcybDogSW5jbHVkZSBwaW5tYXAg
aW4gUlpHMkxfR1BJT19QT1JUX1BBQ0soKQo+ICAgICBtYWNybwo+ICAgcGluY3RybDogcmVuZXNh
czogcGluY3RybC1yemcybDogQWRkIHRoZSBtaXNzaW5nIHBvcnQgcGlucyBQMTkgdG8gUDI4Cj4g
ICByaXNjdjogZHRzOiByZW5lc2FzOiByOWEwN2cwNDNmOiBVcGRhdGUgZ3Bpby1yYW5nZXMgcHJv
cGVydHkKPgo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpIHwg
ICA0ICsKPiAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jICAgICB8IDI4
NCArKysrKysrKysrKysrKysrKy0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI0OCBpbnNlcnRpb25z
KCspLCA0MCBkZWxldGlvbnMoLSkKPgpXaXRoIHJlY2VudCBjaGFuZ2VzIHRvIHBpbmN0cmwtcnpn
MmwuYyB0aGlzIHBhdGNoIHNlcmllcyAocGF0Y2ggIzIpCmRvZXMgbm90IGFwcGx5IGNsZWFubHkg
YW55bW9yZS4gU2hhbGwgSSByZXNlbmQgaXQ/CgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
