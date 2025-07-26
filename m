Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD08C83F17
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZSqwrQeETujEHr+hKr/48FDh/hUuGeSrzdYYx39tgg=; b=06rNEFPjyyO1Cj
	Pgk4lkvj5XoS8iyFWUaBBIr773arZl3VbU7jIx4i0BK3jwpzSMn1kJcj/On/iKQUnw4xAPpdHnyLC
	TrRpvXXgTaBM4qLBxVxf11/4SEJti0T5lUErpKzsDlG8FnKf5z4TioukUolo5IqaBcOz7D6XTgTCL
	GNzHP6r5SEgyxRgjEr8j+KU64nWS6jw5vWKa/RH4C0sMXepHgGt8CM+k0mv13D41d8t76DTmxraeP
	J2K6CUcfGcHpE9YmNFG238FOK/xz04N+fdHU0MIQpwUzicQf+3vqI2S7BKKhMjOxTeJ2fwi25hfbD
	74pKq0ns3U0lhaW+gjpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufb0r-0000000BIuJ-0rh5;
	Sat, 26 Jul 2025 09:16:17 +0000
Received: from smtp-70.smtpout.orange.fr ([80.12.242.70] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufb0l-0000000BItR-2qT1
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 09:16:15 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id fb0cukqvwUD3Ufb0cuKgwl; Sat, 26 Jul 2025 11:16:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1753521365;
	bh=U9kZSAtVAyocpLhrZ9KiXiugbdUh7RrQVALIu5fxuzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=OCvbdlZnVDK2N/wzU0aKjr2jm6Nsst80VLqT1nNeVHZbjWWsN6OFia3uA70eSfZNO
	 7OGU5fjPs/uNw0dxunLKRsUapLSG0ldiYlYJhscbgLMZKmoOfv3NTqNYbu6lk19A+m
	 /HXeKzkyrTTrq+oCFGpxRy2A4ClYVWK+UbyK+PzpsArrQN4yBmSVxEOrZUE/Axex6i
	 vBB9GusVrJEi/3wuH5acGlg1RJO6qimGCNkTmKCcN/ola7+YvE16gI9p9G6AmBI5Wa
	 hesOS78cOiZ1Ri3M6ppMsIF0b92fPNzpsmxcK0oVcU7A18HaisFjz+tlXamheXAE3z
	 Ud5fC/IqdwhQQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 26 Jul 2025 11:16:04 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
Date: Sat, 26 Jul 2025 11:16:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, sboyd@kernel.org,
 dlan@gentoo.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_021612_918964_90FA6908 
X-CRM114-Status: GOOD (  17.33  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TGUgMjMvMDcvMjAyNSDDoCAxNToyNSwgSGVuZHJpayBIYW1lcmxpbmNrIGEgw6ljcml0wqA6Cj4g
VGhlIGZ1bmN0aW9uIHNwYWNlbWl0X2NjdV9yZXNldF9yZWdpc3RlcigpIGFsbG9jYXRlcyBtZW1v
cnkgZm9yIGFuCj4gYXV4aWxpYXJ5IGRldmljZS4gSWYgYXV4aWxpYXJ5X2RldmljZV9hZGQoKSBm
YWlscywgaXQgc2tpcHMgY2xlYW51cCBvZgo+IHRoZXNlIHJlc291cmNlcywgcmVzdWx0aW5nIGlu
IGxlYWtzLgo+IAo+IEZpeCB0aGlzIGJ5IHVzaW5nIHRoZSBhcHByb3ByaWF0ZSBlcnJvciBoYW5k
bGluZyBwYXRoLgo+IAo+IEZpeGVzOiA5ODg1NDM1MjJlYmQgKCJjbGs6IHNwYWNlbWl0OiBzZXQg
dXAgcmVzZXQgYXV4aWxpYXJ5IGRldmljZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEhlbmRyaWsgSGFt
ZXJsaW5jayA8aGVuZHJpay5oYW1lcmxpbmNrQGhhbW1lcm5ldC5iZT4KPiBSZXZpZXdlZC1ieTog
WWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFBy
b3Blcmx5IHBsYWNlIHRoZSBGaXhlcyB0aXAuCj4gLS0tCj4gICBkcml2ZXJzL2Nsay9zcGFjZW1p
dC9jY3UtazEuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazEu
YyBiL2RyaXZlcnMvY2xrL3NwYWNlbWl0L2NjdS1rMS5jCj4gaW5kZXggNjVlNmRlMDMwNzE3Li41
YmI4NWUzMmM2Y2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1LWsxLmMK
PiArKysgYi9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazEuYwo+IEBAIC0xMDU5LDcgKzEwNTks
NyBAQCBzdGF0aWMgaW50IHNwYWNlbWl0X2NjdV9yZXNldF9yZWdpc3RlcihzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4gICAJcmV0ID0gYXV4aWxpYXJ5X2RldmljZV9hZGQoYWRldik7Cj4gICAJaWYgKHJl
dCkgewo+ICAgCQlhdXhpbGlhcnlfZGV2aWNlX3VuaW5pdChhZGV2KTsKPiAtCQlyZXR1cm4gcmV0
Owo+ICsJCWdvdG8gZXJyX2ZyZWVfYXV4X2lkOwo+ICAgCX0KPiAgIAo+ICAgCXJldHVybiBkZXZt
X2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBzcGFjZW1pdF9hZGV2X3VucmVnaXN0ZXIsIGFkZXYp
OwoKCkhpLAoKSSdtIG5vdCBzdXJlIHRoaXMgaXMgY29ycmVjdC4KCmF1eGlsaWFyeV9kZXZpY2Vf
dW5pbml0KCkgd2hpY2ggaXMgY2FsbGVkIGlmIGF1eGlsaWFyeV9kZXZpY2VfYWRkKCkgCmZhaWxz
IHNob3VsZCBhbHJlYWR5IGRvIHRoZSBjbGVhbi11cC4KClNvIEkgd291bGQgc2F5IHRoYXQgdGhp
cyBwYXRjaCBhZGRzIGEgZG91YmxlLWZyZWUgaXNzdWUgYW5kIHNob3VsZCBub3QgCmJlIGFwcGxp
ZWQuCgpJZiBJJ20gcmlnaHQsIG5vdGUgdGhhdCBTdGVwaGVuIGhhcyBhbHJlYWR5IGFkZGVkIGEg
IkFwcGxpZWQgdG8gY2xrLW5leHQiCgpDSgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
