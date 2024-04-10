Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82617CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 06:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmHqdth+s2/htRQ6zFN5mC+YkmWV9rKjaeWNVJF9qrQ=; b=4ogp3i814MAy4p
	u15goZbJ1qYf2lt/JWqOjCcH8c7diFGUk28KFhOKyrMhBRS5ezS7G1B8JJI6lofdnGmWFWarSke4x
	NCHBjxHe89SbXzZV+D5kqEmxF0jRUULMDj9SqpVjgHHDl+7Va8IjVSjBRKeeyhQ+6g1R/elElbdR9
	Z6267t9qBk9L2QrrCb/A8k4xuEqHRXoesxeC0s8odgfnn71rKvTFyjb8/11SqBELzsB0HlRsibwCO
	bppo7lw9m6VzHeKL/GLPuPMln6Z1NULMrYJtFQCnnfJywgR7bAZuEU4PXdaYGFSucA0ilE1bz7wt7
	IP1MBlgKR19EUWaTcjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruR7X-00000005JAa-1N2u;
	Wed, 10 Apr 2024 06:07:43 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruR7U-00000005J8H-29BL
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 06:07:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDECDC0007;
	Wed, 10 Apr 2024 06:07:33 +0000 (UTC)
Message-ID: <d534e73a-a7c0-4116-98bf-09617b7f89b3@ghiti.fr>
Date: Wed, 10 Apr 2024 08:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH riscv/fixes] riscv: hwprobe: fix invalid sign extension
 for RISCV_HWPROBE_EXT_ZVFHMIN
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20240409143839.558784-1-cleger@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240409143839.558784-1-cleger@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_230740_776070_A94EC059 
X-CRM114-Status: GOOD (  11.32  )
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

SGkgQ2zDqW1lbnQsCgpPbiAwOS8wNC8yMDI0IDE2OjM4LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4gVGhlIGN1cnJlbnQgZGVmaW5pdGlvbiB5aWVsZHMgYSBuZWdhdGl2ZSAzMmJpdHMgc2lnbmVk
IHZhbHVlIHdoaWNoCj4gcmVzdWx0IGluIGEgbWFzayB3aXRoIGlzIG9idmlvdXNseSBpbmNvcnJl
Y3QuIFJlcGxhY2UgaXQgYnkgdXNpbmcgYQo+IDFVTEwgYml0IHNoaWZ0IHZhbHVlIHRvIG9idGFp
biBhIHNpbmdsZSBzZXQgYml0IG1hc2suCj4KPiBGaXhlczogNWRhZGRhNWU2YTU5ICgicmlzY3Y6
IGh3cHJvYmU6IGV4cG9ydCBadmZoW21pbl0gSVNBIGV4dGVuc2lvbnMiKQo+IFNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgIGFyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAyICstCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaAo+IGluZGV4IDlmMmE4ZTNmZjIwNC4uMjkwMmY2OGRjOTEzIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gQEAgLTU0LDcgKzU0LDcgQEAgc3Ry
dWN0IHJpc2N2X2h3cHJvYmUgewo+ICAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkZITUlO
CSgxIDw8IDI4KQo+ICAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5UTlRMCSgxIDw8
IDI5KQo+ICAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZGSAkJKDEgPDwgMzApCj4gLSNk
ZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWRkhNSU4JKDEgPDwgMzEpCj4gKyNkZWZpbmUJCVJJ
U0NWX0hXUFJPQkVfRVhUX1pWRkhNSU4JKDFVTEwgPDwgMzEpCj4gICAjZGVmaW5lCQlSSVNDVl9I
V1BST0JFX0VYVF9aRkEJCSgxVUxMIDw8IDMyKQo+ICAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfWlRTTwkJKDFVTEwgPDwgMzMpCj4gICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUNB
UwkJKDFVTEwgPDwgMzQpCgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
