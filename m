Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52755606A331
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 01:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c6DaPA9U;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=SotxgQiF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:In-Reply-To:Mime-Version:
	Subject:Cc:Message-Id:References:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n/4/lR5cRfhnuXKYgWTvkQD+8/jT4PA8ecOJXrLfdaw=; b=c6DaPA9UGOlQ0RtquBBY+QYeqB
	GqpTgPbHKe6/CY9TScoSJaywKUpM3+8JMegGvBXi5KkJkvvaB1DLFqmVgfLah8AzRHEPcgLG1e9d2
	4Z+lsBscCipGb9g14b6vJfwZS7xRMsiBh7sh8YPl0/oCCSDk9f1G2533krrFRvuJwZSD+5n0G7pny
	JhnxqsdHehlMvONYRjjHL2F+Mggip4ooxHdtbce9lRQHE/E0cxlmXjQPGqlz3CFi3aO898rEq09ja
	0qeQd2gwg6957qJdsnGPVhQuP93zIEMCQWBapuMr0FyK/dzILhbUEJwIvnSWuw2NQBis900ZUC7wN
	Yo4L/+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmYq-00000007VbI-2QA7;
	Thu, 05 Nov 2026 01:46:42 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOmYm-00000007Vaf-14lM
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 01:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793843190;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=mAEHk156ALRm/Yk38m2Sb6tcWOHC1b8Vy26wU1dgEA0=;
 b=SotxgQiF9ljVkzBcaF38B0g9igWK+Sm+1s6SPsJGdXH5mSb2fEUHnmh259S6ynBaULJxfK
 Czv6nKXHVNPctX2O28H/FaMNv10WEJ/nlW8lVxfCDQy9N2Pi0ulj9VyS2+XrWNBSnwNUrq
 5N1NYFIip+5Uj5ucbVs46rOgd8gyZARBhmKOATJyQFZBmmnxxp2YF5xC8pfU7VJHQrHpDR
 b6is6TcK/261tUoAjao97baDkpGvZ9WbqxMzLvCaXnaelkWO7jewMdYpdAsyMce/gvP1oz
 ldmeaAQFjOL8RgxKpOxlZTVdyrXXyucP97jN26JpoaP4/XMWLK/6qCTuoVWxyg==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
References: <20261102060105.100645-1-sandie.cao@deepcomputing.io>
	<5f595068-671e-4823-95af-da1702354a16@murena.io>
X-Lms-Return-Path: <lba+16aebdff4+147ad0+lists.infradead.org+sandie.cao@deepcomputing.io>
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4545f39b.8adf.4983.b26a.7df21480401c@feishu.cn>
Cc: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <conor+dt@kernel.org>, 
	<devicetree@vger.kernel.org>, <dlan@kernel.org>, <krzk+dt@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<palmer@dabbelt.com>, <pjw@kernel.org>, <robh@kernel.org>, 
	<spacemit@lists.linux.dev>, <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator tree
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
In-Reply-To: <5f595068-671e-4823-95af-da1702354a16@murena.io>
Date: Thu, 05 Nov 2026 09:46:27 +0800
To: "Maud Spierings" <maud_spierings@murena.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_174638_047086_68D19BCE 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWF1ZDoKCj4gRnJvbTogIk1hdWQgU3BpZXJpbmdzIjxtYXVkX3NwaWVyaW5nc0BtdXJlbmEu
aW8+Cj4gRGF0ZTrCoCBXZWQsIE5vdiA0LCAyMDI2LCAyMzozMQoKPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBjb21wdXRpbmctZm1sMTN2MDUuZHRz
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1kZWVwY29tcHV0aW5nLWZtbDEzdjA1
LmR0cwo+ID4gaW5kZXggYjVkNTExMmRlMzU4Li44MDRhYmM4NTYwMmEgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBjb21wdXRpbmctZm1sMTN2MDUu
ZHRzCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBjb21wdXRp
bmctZm1sMTN2MDUuZHRzCj4gPiBAQCAtMjIsNiArMjIsMTYxIEBAIG1lbW9yeUAxMDAwMDAwMDAg
ewo+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+
ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSA8MHgxIDB4MDAwMDAwMDAgMHg0IDB4
MDAwMDAwMDA+Owo+ID4gwqAgwqAgwqAgwqAgwqB9Owo+ID4gKwo+ID4gKyDCoCDCoCDCoCDCoHJl
Z19hdXhfdmNjM3YzOiByZWd1bGF0b3ItYXV4LXZjYzN2MyB7Cj4gPiArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+ID4gKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gIkFVWF9WQ0MzVjMiOwo+ID4gKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+ID4g
KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAw
MDA+Owo+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1hbHdheXMtb247Cj4g
PiArIMKgIMKgIMKgIMKgfTsKPiA+ICsKPiA+ICsgwqAgwqAgwqAgwqByZWdfYXV4X3ZjYzV2OiBy
ZWd1bGF0b3ItYXV4LXZjYzV2IHsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRp
YmxlID0gInJlZ3VsYXRvci1maXhlZCI7Cj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
dWxhdG9yLW5hbWUgPSAiQVVYX1ZDQzVWIjsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsKPiA+ICsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsKPiA+ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItYWx3YXlzLW9uOwo+ID4gKyDCoCDCoCDCoCDCoH07
Cj4gPiArfTsKPiA+ICsKPiA+ICsmaTJjOCB7Cj4gPiArIMKgIMKgIMKgIMKgcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsKPiA+ICsgwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSA8JmkyYzhfY2ZnPjsK
PiA+ICsgwqAgwqAgwqAgwqBzdGF0dXMgPSAib2theSI7Cj4gPiArCj4gPiArIMKgIMKgIMKgIMKg
cDFANDEgewo+wqAKPiBJIGJlbGlldmUgdGhpcyBzaG91bGQgYmUgcG1pY0A0MQo+IElmIGl0IG5l
ZWRzIGEgbGFiZWwgaXQgY291bGQgYmUgcDE6IHBtaWNANDEgYnV0IHRoZSBub2RlIG5hbWUgc2hv
dWxkIGJlwqAKPiBtb3JlIGRlc2NyaXB0aXZlLgoKVGhpcyBwYXRjaCBmb2xsb3dzIGszLXBpY28t
aXR4LmR0cywgaXQgdXNlcyBwMUA0MS4gQW5kIGszLWNvbTI2MC5kdHNpIHVzZXMgcG1pY0A0MS4K
SSB3aWxsIHVzZXMgcG1pY0A0MSBpbiBuZXh0IHZlcnNpb24uCgpCZXN0IHJlZ2FyZHMKU2FuZGll
Cgo+wqAKPiBLaW5kIHJlZ2FyZHMsCj4gTWF1ZAo+wqAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
