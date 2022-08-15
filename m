Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1560AC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 07:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqopo9kg2kN4fPlgBdyDf6MnXn+3Sl6UP01S4XgGan4=; b=feDOB/uSD5rxu3
	mQhYW+IJSXGXakvqh+1ZsWfQIlfl4cZP4be2qDEvaDl5ILpgdtOiY6NGjvYHlDQnBWHJVYJ9LKU9d
	7a0VflbfqPncs3fwrWGg2gCpgp2518XHQXEsySZuo1N/TXvhXanMPosy+UfT0Gp9EA3bQ44gRGIZS
	QxzT0E7QcVJqX/nRWKCcBgz4DPpbrwWjnRXhe2iIOFY5teUqYB3o+8dji3JcVRE1ZhTTqUB3EZoWh
	FiAAlMtV01uwgDpYIK6Q+6iUkpqBPFkCS5V3kO2qcQNRqj5P68oKQ65FYz8bwqa7hplDH6lnJ56ET
	EnbORWE/0mAbzbzyO+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNUhK-00CfHX-My; Mon, 15 Aug 2022 07:39:42 +0000
Received: from smtp-27.smtpout.orange.fr ([80.12.242.27] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNUg5-00Ce9d-FH
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 07:38:28 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id NUfsoyReCtUbyNUfsoBx0o; Mon, 15 Aug 2022 09:38:13 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 Aug 2022 09:38:13 +0200
X-ME-IP: 90.11.190.129
Message-ID: <271c00a5-fb5d-ff9e-3c4d-ec2732b991ba@wanadoo.fr>
Date: Mon, 15 Aug 2022 09:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 1/1] gpio: mpfs: add polarfire soc gpio support
Content-Language: fr
To: lewis.hanly@microchip.com, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, linus.walleij@linaro.org, brgl@bgdev.pl,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, maz@kernel.org
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com
References: <20220815070606.1298421-1-lewis.hanly@microchip.com>
 <20220815070606.1298421-2-lewis.hanly@microchip.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220815070606.1298421-2-lewis.hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_003826_042802_956EF395 
X-CRM114-Status: GOOD (  12.93  )
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

TGUgMTUvMDgvMjAyMiDDoCAwOTowNiwgbGV3aXMuaGFubHlAbWljcm9jaGlwLmNvbSBhIMOpY3Jp
dMKgOgo+IEZyb206IExld2lzIEhhbmx5IDxsZXdpcy5oYW5seUBtaWNyb2NoaXAuY29tPgo+IAo+
IEFkZCBhIGRyaXZlciB0byBzdXBwb3J0IHRoZSBQb2xhcmZpcmUgU29DIGdwaW8gY29udHJvbGxl
cgo+IAo+IFNpZ25lZC1vZmYtYnk6IExld2lzIEhhbmx5IDxsZXdpcy5oYW5seUBtaWNyb2NoaXAu
Y29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncGlvL0tjb25maWcgICAgIHwgICA3ICsKPiAgIGRyaXZl
cnMvZ3Bpby9NYWtlZmlsZSAgICB8ICAgMSArCj4gICBkcml2ZXJzL2dwaW8vZ3Bpby1tcGZzLmMg
fCAzMTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAzIGZpbGVz
IGNoYW5nZWQsIDMyNiBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncGlvL2dwaW8tbXBmcy5jCj4gCgo+ICtzdGF0aWMgaW50IG1wZnNfZ3Bpb19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgY2xrICpjbGs7Cj4gKwlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICsJc3RydWN0IGRldmljZV9ub2RlICpu
b2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7Cj4gKwlzdHJ1Y3QgbXBmc19ncGlvX2NoaXAgKm1wZnNf
Z3BpbzsKPiArCXN0cnVjdCBncGlvX2lycV9jaGlwICpnaXJxOwo+ICsJaW50IGksIHJldCwgbmdw
aW9zLCBuaXJxczsKPiArCj4gKwltcGZzX2dwaW8gPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2Yo
Km1wZnNfZ3BpbyksIEdGUF9LRVJORUwpOwo+ICsJaWYgKCFtcGZzX2dwaW8pCj4gKwkJcmV0dXJu
IC1FTk9NRU07Cj4gKwo+ICsJbXBmc19ncGlvLT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFw
X3Jlc291cmNlKHBkZXYsIDApOwo+ICsJaWYgKElTX0VSUihtcGZzX2dwaW8tPmJhc2UpKQo+ICsJ
CXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihtcGZzX2dwaW8tPmNsayksICJpbnB1
dCBjbG9jayBub3QgZm91bmQuXG4iKTsKClBUUl9FUlIobXBmc19ncGlvLT5iYXNlKT8KImlucHV0
IGNsb2NrIG5vdCBmb3VuZCIgYWxzbyBsb29rcyBvZGQgYWZ0ZXIgYSAKZGV2bV9wbGF0Zm9ybV9p
b3JlbWFwX3Jlc291cmNlKCkgY2FsbC4KCj4gKwo+ICsJY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwg
TlVMTCk7Cj4gKwlpZiAoSVNfRVJSKGNsaykpCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBQVFJfRVJSKGNsayksICJkZXZtX2Nsa19nZXQgZmFpbGVkXG4iKTsKPiArCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
