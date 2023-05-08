Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67B2C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 06:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IG6+HmYyJlVJFSKMQgU1IXWwT/VClZXYync1N+1QhVM=; b=HPmgLdLyEI0g+c
	kncYhqqXDHlS36hJDJURMvAXtRd8tSAe1hIE+0ps+SopIJSkZ7epQcODmG4MPjnHGsGQEEaleJQBW
	wDeSIhuX7fkDju9b9EToujgIm2KmJ82hDmpEXT/CEH5O8+YFSnnp68yTrpT19UoYT75yRZHxAdjR3
	8rRIV1XnkIkg8/iPL9tq04LFTU9By4UiH6p0gtNDeuk3B3KIZp4MMGW3LtDh6WIQcW0WaIjxSm1B1
	WvNE5elHvzgaiFLQ2vBm4Gc7vOKph7nDygnsP9pNx7tpOYZeYcT/+N1GKBqtD4RDEx+Ik+cB6iEXo
	FgNNd8PFucDAvlEkYxzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuBG-00HNZ9-2X;
	Mon, 08 May 2023 06:17:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvuBE-00HNYR-1f
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 06:17:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54A6661EEF
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CBAC433D2
	for <linux-riscv@lists.infradead.org>; Mon,  8 May 2023 06:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683526622;
	bh=KxwYxJMc4q2L54lZZg4no2f6ubAF9y02PkE5A4nwysU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pT4cZdOK4XiVUv6jE7p0Pd5sKyBhBWy/ukp72AM5241ZvR4d4ILp2TutFJP3hvs/m
	 mk2DmHAA+fS4n6GRwISfwF9vH/CNRwu4IaHQYOksasj4nufkmJBfOJkbRCYvC7nJzs
	 4g+N4jG0jGDA3NYm2motEkn1tDBpvNPf12QKEHd9sx06PF2g38u2HOlqVDqYXea3++
	 qk89PqUvAiDU1xU9I13ZHuxspdKJiMZFjVQpAlESfgVVVHNgLwNzpkryBmHjbtXEaw
	 IpNcN6bMzc5puHeDoiFZSQbWbZkxyLh3QcAvatir0di0v3gpgStxLNQsk5cAely5WM
	 apnP+HpSqwwNA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so45542341a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 23:17:02 -0700 (PDT)
X-Gm-Message-State: AC+VfDyONs1Aga5/yNdFGdY5EVsCs4GCcRmbsMCjGsVelm0/3dYxeBf3
	2/p/7fRJrO6HXgGDO9Yc0pF4DAEfkGpaidQrlUo=
X-Google-Smtp-Source: ACHHUZ4n+NUhxOQEB2cLl1GdPbNVKJ0wiwkd8hT9Ds85PHzuHycN+WrqIpWX2LI39K6y2oNVKhJxTRW5nhjZ4gyxqq8=
X-Received: by 2002:a17:907:6d22:b0:965:d7c7:24db with SMTP id
 sa34-20020a1709076d2200b00965d7c724dbmr8201147ejc.32.1683526620956; Sun, 07
 May 2023 23:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230507182304.2934-1-jszhang@kernel.org>
In-Reply-To: <20230507182304.2934-1-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 8 May 2023 14:16:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTScma2OXQv-2ALkZuuVtJA-tAhhi9B4b0No4DNPkH7Ekw@mail.gmail.com>
Message-ID: <CAJF2gTScma2OXQv-2ALkZuuVtJA-tAhhi9B4b0No4DNPkH7Ekw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add Sipeed Lichee Pi 4A RISC-V board support
To: Jisheng Zhang <jszhang@kernel.org>, Wei Fu <wefu@redhat.com>, 
	Wei Fu <tekkamanninja@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_231704_655908_C5B0BE9A 
X-CRM114-Status: GOOD (  14.74  )
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

Ri5ZLkkgV2VpIEZ1IDx3ZWZ1QHJlZGhhdC5jb20+CgoKT24gTW9uLCBNYXkgOCwgMjAyMyBhdCAy
OjM04oCvQU0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IFNp
cGVlZCdzIExpY2hlZSBQaSA0QSBkZXZlbG9wbWVudCBib2FyZCB1c2VzIExpY2hlZSBNb2R1bGUg
NEEgY29yZQo+IG1vZHVsZSB3aGljaCBpcyBwb3dlcmVkIGJ5IFQtSEVBRCdzIGxpZ2h0KGEuay5h
IFRIMTUyMCkgU29DLiBBZGQKPiBtaW5pbWFsIGRldmljZSB0cmVlIGZpbGVzIGZvciB0aGUgY29y
ZSBtb2R1bGUgYW5kIHRoZSBkZXZlbG9wbWVudAo+IGJvYXJkLgo+Cj4gU3VwcG9ydCBiYXNpYyB1
YXJ0L2dwaW8vZG1hYyBkcml2ZXJzLCBzbyBzdXBwb3J0cyBib290aW5nIHRvIGEgYmFzaWMKPiBz
aGVsbC4KPgo+IEppc2hlbmcgWmhhbmcgKDUpOgo+ICAgaXJxY2hpcC9zaWZpdmUtcGxpYzogU3Vw
cG9ydCBULUhFQUQncyBDOTEwIFBMSUMKPiAgIHJpc2N2OiBBZGQgdGhlIFQtSEVBRCBTb0MgZmFt
aWx5IEtjb25maWcgb3B0aW9uCj4gICByaXNjdjogZHRzOiBhZGQgaW5pdGlhbCBULUhFQUQgbGln
aHQgU29DIGRldmljZSB0cmVlCj4gICByaXNjdjogZHRzOiB0aGVhZDogYWRkIHNpcGVlZCBMaWNo
ZWUgUGkgNEEgYm9hcmQgZGV2aWNlIHRyZWUKPiAgIE1BSU5UQUlORVJTOiBhZGQgZW50cnkgZm9y
IFQtSEVBRCBSSVNDLVYgU29DCj4KPiAgLi4uL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgICAgICAg
ICAgICAgICAgICAgIHwgICA0ICsKPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA2ICsKPiAgYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA2ICsKPiAgYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC9NYWtlZmls
ZSAgICAgICAgICAgIHwgICAyICsKPiAgLi4uL2R0cy90aGVhZC9saWdodC1saWNoZWUtbW9kdWxl
LTRhLmR0c2kgICAgIHwgIDM4ICsrCj4gIC4uLi9ib290L2R0cy90aGVhZC9saWdodC1saWNoZWUt
cGktNGEuZHRzICAgICB8ICAzMiArKwo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL2xpZ2h0
LmR0c2kgICAgICAgICAgfCA0NTQgKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvaXJxY2hp
cC9pcnEtc2lmaXZlLXBsaWMuYyAgICAgICAgICAgICB8ICAgMSArCj4gIDkgZmlsZXMgY2hhbmdl
ZCwgNTQ0IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9v
dC9kdHMvdGhlYWQvTWFrZWZpbGUKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9v
dC9kdHMvdGhlYWQvbGlnaHQtbGljaGVlLW1vZHVsZS00YS5kdHNpCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL2xpZ2h0LWxpY2hlZS1waS00YS5kdHMKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvbGlnaHQuZHRzaQo+
Cj4gLS0KPiAyLjQwLjAKPgoKCi0tCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
