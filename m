Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B62CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Kez3w82NOWuS/aRs0SlyRSEhsNQKzD/gdnh9msX/EY=; b=h0H76yr8TYcllodpR8fuNrAciW
	KZcppaCsiE6t9rFCjfmsV1uoOgPwKDMPj0YZTBVqSenjrnl6zQuRF2LXXKwkOa6RT/1/GsefqyLy5
	IJLsYVi7FhIt5VKJWxLY+Pa3H2yuuXyRlM4tV8yRt2YRzz32e61KVnwZwwuWu3VwjPix7uPrrgRhb
	63IdoChKYG28X29seVem5sKrqH7VhQM7qaTYc0atIGxIC0jcH7XAeYUjG8EG45SDWHTTbYTqF8qEK
	qtHpyIgw0zdhLMUhQnqmluTPz4xT+FUdZYU+9j16XzLsxX2exwY0RsBjEnsAxLv2gjnycToouOaR9
	cl4R2Igw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZ1A-0000000B5xd-2cOo;
	Sat, 25 Oct 2025 07:48:52 +0000
Received: from insect.birch.relay.mailchannels.net ([23.83.209.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZ17-0000000B5xF-27Y1
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 07:48:51 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CDEC01E0C7B;
	Sat, 25 Oct 2025 07:48:47 +0000 (UTC)
Received: from de-fra-smtpout10.hostinger.io (100-117-123-159.trex-nlb.outbound.svc.cluster.local [100.117.123.159])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 085DE1E0B92;
	Sat, 25 Oct 2025 07:48:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761378527; a=rsa-sha256;
	cv=none;
	b=ap6c+FofTy4NiDzMNMj0WnCvCxn1XGaZMpWOjbMYUuXreS+lW/gbur/mBCgUvN5+JZ9pqP
	ZiIufN5T4bEdf8OodQyW+FpcDlaYw7sr1kAAhMaZQE1AQSg0eXHh1FMBha2mMej4iNrm9v
	8ZCz/xzhzWNKYRmDLbyut7hHFOGstkTJpCqKb6X9KiEf8ukiDW5iSIawnYduLYTRJQ0wUg
	BMJeQbgqwIfA3xW2A/cJUNlx+agdIH1fw+JoelAm5DRsCRpyojhdVr+Z/g1EJCV5WLsONV
	MYGR/n6J9Oa2TUf4a7PY+zKKTnU7jx0UHF0sY0nH/Gv/DRpqdGUA2bqqfvHOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761378527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=POjhoP6+yZK3al+4v1y3f1yAM6WcGqS/Or0wJm35+NI=;
	b=3SW4ZoAYksclTHLr0CQVn0sFRzDHAx63lM9dIZHgfgHA8wgZK0IzHA/Phr3J2CfGDigrlj
	61hCO2tnTb7XiH9mJRt/bfrPTuPCc3JyTU5kMTZOepPf/0demg0IolVKwsKwwN6uxEdOT0
	K8v96NJ6SjkQEgBBOOCkaMWHwI6WYhc6LtbszR+imgkTCNwnECI8m7Bd26Bg0o7YfCM4LL
	iehyvZlFvKoOP/JHxb/85JsJxf281UGYFdhs+DOJzfEEotMrdiCED0T3GNMKripz5ypqe8
	LKgjevHc2QFWxvweB5d2uF3mYc63hv84tnwRXzcokr3pGQcQ8XfSFZlAUafQ7Q==
ARC-Authentication-Results: i=1;
	rspamd-9799b5d46-fkg64;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Bored-Tasty: 751f2f920fa9fedd_1761378527712_791440598
X-MC-Loop-Signature: 1761378527712:755428982
X-MC-Ingress-Time: 1761378527712
Received: from de-fra-smtpout10.hostinger.io (de-fra-smtpout10.hostinger.io
 [148.222.55.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.117.123.159 (trex/7.1.3);
	Sat, 25 Oct 2025 07:48:47 +0000
Received: from [IPV6:2001:861:4450:d360:8260:6f14:f559:44de] (unknown [IPv6:2001:861:4450:d360:8260:6f14:f559:44de])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ctsMx18L5z3ymx;
	Sat, 25 Oct 2025 07:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761378525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POjhoP6+yZK3al+4v1y3f1yAM6WcGqS/Or0wJm35+NI=;
	b=JN/XYHGH7543CGsYy+AVeGmL770drsQw1er86/bvW4rIfS30iLmKiPnBsLvv/JFkyR5VuB
	6roGC3VfAIjYe8+d837GcXqS9Z7VdCLBjlpVfl2p3FlTmdeKRBEhJFX6hCc08kIkqnUR5t
	SbkN6wiuD89c7XWZAFX4PgkikFMbaiMCltpcapH443as1SGcpHOR25dq7VB/luZMR+CjaJ
	zeCgeZBjXqCVfOoGGDQgPfjcKMUjR8h8Dl4cFLc2oeIjaZIkvA4h2J2NDwIHAr/FV79F5g
	ZGOpE6xGayyxntStrImzcddlRC7htuSCycIccbaGixl9lEN3sIREih04Q3RQ7A==
Message-ID: <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
To: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
Date: Sat, 25 Oct 2025 07:48:45 +0000 (UTC)
X-CM-Envelope: MS4xfNbsPdM62VTveJLHS0nVTVS2xxaYXJ6YdW6ajWNdp/mA0kbdYO+BGBUhFm02m04YCKCThe5yJYR3xnHcl+AlWj+K0trd5PN8iDeBwHcVRLpI+OoTGl7U 337g9vfVrYUr5a5ZDAs6oDAaB0kTDnJ0peJLUDbDEjcEmg5CebN8eOC9vQNcZU8fK5jhudVRUHPFN2y1SFgktQXGVojal6Kj1bk5FtPw5NutmYMXzSvZ2fgZ ZpGo3R0NucpsUqcr6b3ukJnslKtZh5SCsKxfI8rjkbes7WihQznaX9s3Sh+FKAlIONAyVHioAaTJ31jVrwdiGCir1JkjJnQ60CXMp5E/fs21TAvGm/YTJqe0 PgiBz9YUtw7gKWltfz3q9lRHYuWOPiRakeb4+roaflJk/FssNEpHzBUwQvJxZ44xdwLCgiT1
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=68fc80dd a=rByZg85q4TxBe4aD0HbSyg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=-a8RYutpcgMjrEULmycA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_004849_711909_196F0973 
X-CRM114-Status: GOOD (  11.14  )
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

R3JlZXRpbmdzLAoKT24gMTAvMjUvMjUgMDk6NDUsIG1pY2hhZWwub3BkZW5hY2tlckByb290Y29t
bWl0LmNvbSB3cm90ZToKPiBGcm9tOiBNaWNoYWVsIE9wZGVuYWNrZXIgPG1pY2hhZWwub3BkZW5h
Y2tlckByb290Y29tbWl0LmNvbT4KPgo+IFRoZSBPcmFuZ2VQaSBSVjIgYm9hcmQgZXhwb3NlcyBp
MmMyIGFuZCBpMmM4IGJ1c2VzIGZyb20gdGhlIFNwYWNlbWl0IEsxIFNvQy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQu
Y29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1y
djIuZHRzIHwgMTQgKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1v
cmFuZ2VwaS1ydjIuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2Vw
aS1ydjIuZHRzCj4gaW5kZXggNDFkYzhlMzVlNmViLi5jNGIyNWRkMzBmNTQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCj4gKysr
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzCj4gQEAg
LTE3LDYgKzE3LDggQEAgYWxpYXNlcyB7Cj4gICAJCXNlcmlhbDAgPSAmdWFydDA7Cj4gICAJCWV0
aGVybmV0MCA9ICZldGgwOwo+ICAgCQlldGhlcm5ldDEgPSAmZXRoMTsKPiArICAgICAgICAgICAg
ICAgIGkyYzIgPSAmaTJjMjsKPiArICAgICAgICAgICAgICAgIGkyYzggPSAmaTJjODsKPiAgIAl9
Owo+ICAgCj4gICAJY2hvc2VuIHsKPiBAQCAtODEsNiArODMsMTggQEAgcmdtaWkxOiBwaHlAMSB7
Cj4gICAJfTsKPiAgIH07Cj4gICAKPiArJmkyYzIgewo+ICsJcGluY3RybC0wID0gPCZpMmMyXzBf
Y2ZnPjsKPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gKwlzdGF0dXMgPSAib2theSI7
Cj4gK307Cj4gKwo+ICsmaTJjOCB7Cj4gKwlwaW5jdHJsLTAgPSA8JmkyYzhfY2ZnPjsKPiArCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+
ICAgJnBkbWEgewo+ICAgCXN0YXR1cyA9ICJva2F5IjsKPiAgIH07CgoKVW5mb3J0dW5hdGVseSwg
dGhlc2UgY2hhbmdlcyBhcmUgbm90IGZ1bmN0aW9uYWwgeWV0IG9uIE9yYW5nZVBpIFJWMiwgCnRl
c3Rpbmcgb24gaHR0cHM6Ly9naXRodWIuY29tL3NwYWNlbWl0LWNvbS9saW51eC9jb21taXRzL2sx
L2R0LWZvci1uZXh0CgojIGkyY2RldGVjdCAtciAyCldBUk5JTkchIFRoaXMgcHJvZ3JhbSBjYW4g
Y29uZnVzZSB5b3VyIEkyQyBidXMsIGNhdXNlIGRhdGEgbG9zcyBhbmQgd29yc2UhCkkgd2lsbCBw
cm9iZSBmaWxlIC9kZXYvaTJjLTIgdXNpbmcgcmVjZWl2ZSBieXRlIGNvbW1hbmRzLgpJIHdpbGwg
cHJvYmUgYWRkcmVzcyByYW5nZSAweDA4LTB4NzcuCkNvbnRpbnVlPyBbWS9uXQogwqAgwqAgwqAw
wqAgMcKgIDLCoCAzwqAgNMKgIDXCoCA2wqAgN8KgIDjCoCA5wqAgYcKgIGLCoCBjwqAgZMKgIGXC
oCBmCjAwOsKgIMKgIMKgIMKgIFvCoCAxMjQuNjc1MzIxXSBpMmMtazEgZDQwMTIwMDAuaTJjOiBp
MmMgdHJhbnNmZXIgZmFpbGVkLCByZXQgCi0xMSBlcnIgMHg0MDAwMDAKIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLS0gMDkgW8KgIDEyNC42ODY3NjldIGkyYy1rMSBkNDAxMjAwMC5pMmM6IGky
YyB0cmFuc2ZlciAKZmFpbGVkLCByZXQgLTExIGVyciAweDQwMDAwMAotLSAwYiBbwqAgMTI0LjY5
NTU4NF0gaTJjLWsxIGQ0MDEyMDAwLmkyYzogaTJjIHRyYW5zZmVyIGZhaWxlZCwgcmV0IC0xMSAK
ZXJyIDB4NDAwMDAwCi0tIDBkIFvCoCAxMjQuNzAyOTQ1XSBpMmMtazEgZDQwMTIwMDAuaTJjOiBp
MmMgdHJhbnNmZXIgZmFpbGVkLCByZXQgLTExIAplcnIgMHg0MDAwMDAKLS0gMGYKMTA6IFvCoCAx
MjQuNzEwMzQ2XSBpMmMtazEgZDQwMTIwMDAuaTJjOiBpMmMgdHJhbnNmZXIgZmFpbGVkLCByZXQg
LTExIGVyciAKMHg0MDAwMDAKLS0gMTEgW8KgIDEyNC43MTgyMjFdIGkyYy1rMSBkNDAxMjAwMC5p
MmM6IGkyYyB0cmFuc2ZlciBmYWlsZWQsIHJldCAtMTEgCmVyciAweDQwMDAwMAotLSAxMyBbwqAg
MTI0LjcyNTYwN10gaTJjLWsxIGQ0MDEyMDAwLmkyYzogaTJjIHRyYW5zZmVyIGZhaWxlZCwgcmV0
IC0xMSAKZXJyIDB4NDAwMDAwCi0tIDE1IFvCoCAxMjQuNzMyOTk0XSBpMmMtazEgZDQwMTIwMDAu
aTJjOiBpMmMgdHJhbnNmZXIgZmFpbGVkLCByZXQgLTExIAplcnIgMHg0MDAwMDAKLS0gMTcgW8Kg
IDEyNC43Mzk0ODBdIGkyYy1rMSBkNDAxMjAwMC5pMmM6IGkyYyB0cmFuc2ZlciBmYWlsZWQsIHJl
dCAtMTEgCmVyciAweDQwMDAwMAotLSAxOSBbwqAgMTI0Ljc0NzQ4MF0gaTJjLWsxIGQ0MDEyMDAw
LmkyYzogaTJjIHRyYW5zZmVyIGZhaWxlZCwgcmV0IC0xMSAKZXJyIDB4NDAwMDAwCi0tIDFiIFvC
oCAxMjQuNzU1MTA4XSBpMmMtazEgZDQwMTIwMDAuaTJjOiBpMmMgdHJhbnNmZXIgZmFpbGVkLCBy
ZXQgLTExIAplcnIgMHg0MDAwMDAKLS0gMWQgW8KgIDEyNC43NjI1MDBdIGkyYy1rMSBkNDAxMjAw
MC5pMmM6IGkyYyB0cmFuc2ZlciBmYWlsZWQsIHJldCAtMTEgCmVyciAweDQwMDAwMAotLSAxZgou
Li4KCkkgYXNzdW1lIHRoZSBpMmMtazEgZHJpdmVyIHdvcmtzIG9uIEJhbmFuYVBpIEYzLiBBbnkg
Y2x1ZXMgd2h5IHRoZSBzYW1lIApidXNlcyBkb24ndCB3b3JrIE9yYW5nZVBpIFJWMj8KVGhhbmtz
IGluIGFkdmFuY2UKQ2hlZXJzCk1pY2hhZWwuCgotLSAKTWljaGFlbCBPcGRlbmFja2VyClJvb3Qg
Q29tbWl0CllvY3RvIFByb2plY3QgYW5kIE9wZW5FbWJlZGRlZCBUcmFpbmluZyBjb3Vyc2UgLSBM
ZWFybiBieSBkb2luZzoKaHR0cHM6Ly9yb290Y29tbWl0LmNvbS90cmFpbmluZy95b2N0by8KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
