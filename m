Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D9D606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 01:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pTTpHtt4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NW6/6Jnh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:Cc:To:
	Message-Id:Date:References:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=q7wbAZ39kUXqNWkXaUjU23p3tZuNPbpd1P4exgXyVE0=; b=pTTpHtt4RqTDVDb+s5qg724hFw
	8OCxJesCJDysW6UNiq/Wg+g0ZvYq8OGkj/tyxxqYiYqp89DACXClBVkXG3kxv5KfI3PTRxioi8lw6
	Pph7V5+sM5u5gd4WWp5sJBwI0WTc2sHYlPfXFynQelvO+UcmtlG9pSq96IAhlc9RXoGewcIbbbcpw
	3fqElnsW11LGCWpZOHA+bopzDE+hl9wjF4vXEEpWTkp2W9yL7DnGQCz63hsSPkEW6DPjCHiIxI5ZZ
	XAEWsz4oLmKbURpoo5XlWtXC12oXDReb7C+tqo3EDfMWb7Z/RS2JYQwCBecK7cztPfS6+3I//Fq1L
	5RxtWL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmM1-00000007UO5-1ynP;
	Thu, 05 Nov 2026 01:33:25 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmLy-00000007UMz-1dhK
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 01:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793842388;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=/d8AjzMR8Kwx0Lf9prj+CTkH5Cp2jbRHWYUWf3O5Nro=;
 b=NW6/6JnhJJ7Wt9dub9t9fuM1m8qckHGHDpKh3GXjqjz0Vr+TdtP1ra00SWhU3x8wRj7PW2
 9pXuWHG/Kr194TjEzZ9CmRZavFFjUK1PV+c6B2bBc2o0gxW7wpuVqEH8gy3cGgRrljADYB
 oov5K/UdoXQpTHYN6NJHGuZYWPA2OjY1tOVf5QLVhkJer8CWfu57Znyof5woiFWcHkEuks
 pl+xOIIIPyjEVQnRcTTIEmICcoAx7A8EUyp6SOwibG0XwGE2V7YkZnj469DhudYX/eqMo7
 g3fKh6lmbN5DC9khyprdt9uJyxHWhW8zV9M18bCuXqRZziUtObI9nJrQYhhzug==
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io> <20261102060155.100679-1-sandie.cao@deepcomputing.io>
	<DMMVRQOY5TBN.J0PHJAAZSC2F@linux.spacemit.com>
Date: Thu, 05 Nov 2026 09:33:05 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.569e40bc.e0a4.4c5f.856e.9977de981adb@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+16aebdcd2+08cacd+lists.infradead.org+sandie.cao@deepcomputing.io>
In-Reply-To: <DMMVRQOY5TBN.J0PHJAAZSC2F@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_173322_510256_31AA2FA8 
X-CRM114-Status: GOOD (  13.84  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksIFRyb3k6Cgo+IEZyb206ICJUcm95IE1pdGNoZWxsIjx0cm95Lm1pdGNoZWxsQGxpbnV4LnNw
YWNlbWl0LmNvbT4KPiBEYXRlOsKgIFRodSwgTm92IDUsIDIwMjYsIDA5OjIwCj4gT24gTW9uIE5v
diAyLCAyMDI2IGF0IDY6MDEgQU0gR01ULCBTYW5kaWUgQ2FvIHdyb3RlOgo+ID4gQWRkIHRoZSBk
ZXZpY2UgdHJlZSBub2RlIFNESENJLTAgY29udHJvbGxlciBmb3Igb25ib2FyZCBNaWNybyBTRCBj
YXJkIHNsb3QuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU2FuZGllIENhbyA8c2FuZGllLmNhb0Bk
ZWVwY29tcHV0aW5nLmlvPgo+ID4gLS0tCj4gPiDCoC4uLi9zcGFjZW1pdC9rMy1kZWVwY29tcHV0
aW5nLWZtbDEzdjA1LmR0cyDCoCDCoHwgMjIgKysrKysrKysrKysrKysrKysrKwo+ID4gwqAxIGZp
bGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBjb21wdXRpbmctZm1sMTN2MDUuZHRzIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1kZWVwY29tcHV0aW5nLWZtbDEzdjA1LmR0cwo+
ID4gaW5kZXggODRmNjZkZDhmOTYyLi40NDcxMzM4YTk3NzQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBjb21wdXRpbmctZm1sMTN2MDUuZHRzCj4g
PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBjb21wdXRpbmctZm1s
MTN2MDUuZHRzCj4gPiBAQCAtMTg0LDYgKzE4NCwyOCBAQCAmY29tYm9waHkgewo+ID4gwqAgwqAg
wqAgwqAgwqBzdGF0dXMgPSAib2theSI7Cj4gPiDCoH07Cj4gPiDCoAo+ID4gKy8qCj4gPiArICog
T25ib2FyZCBTRCBjYXJkIHNsb3Q6Cj4gPiArICogUGx1Z2luL1BsdWdvdXQgdGhlIFNEIGNhcmQg
YmVmb3JlIHBvd2VyLW9uIHRoZSBib2FyZCBmb3Igc2VjdXJlLgo+IEhvdyBhYm91dDogIlBsZWFz
ZSBpbnNlcnQgb3IgcmVtb3ZlIHRoZSBTRCBjYXJkIHdoaWxlIHRoZSBkZXZpY2UgaXMgcG93ZXJl
ZCBvZmYuIgoKT2suIEkgd2lsbCBmaXggaW4gbmV4dCB2ZXJzaW9uLgoKQmVzdCBSZWdhcmRzClNh
bmRpZQoKPiA+ICsgKiBJdCB3b3JrcyBhcyBhIGJvb3QgbWVkaWEuIHNvIHNldCBpdCB0byBub24t
cmVtb3ZhYmxlLgo+ID4gKyAqLwo+ID4gKyZzZGhjaTAgewo+IFsuLi5dCj4gPiArIMKgIMKgIMKg
IMKgbm9uLXJlbW92YWJsZTsKPiBbLi4uXQo+ID4gK307Cj4gPiArCj4gPiDCoCZ1YXJ0MCB7Cj4g
PiDCoCDCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gPiDCoCDCoCDCoCDC
oCDCoHBpbmN0cmwtMCA9IDwmdWFydDBfMF9jZmc+Owo+wqAKPsKgCj4gLS3CoAo+IFRyb3kgTWl0
Y2hlbGwKPsKgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
