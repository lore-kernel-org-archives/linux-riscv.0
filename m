Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CF1D43367
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 04:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgUlCsku35InS1JTBOaG2+5+eMiU4bHafqCd3+xQ6Lg=; b=UbCzxUFTWjcwkBBMFguQ0cps/a
	fTB1n7xgCWd1Iuwnyl+XKJ4X79AsWJZy4nDRQokQj9cclQa08MgnT+0HNCljbGf9IAmQv+knmnFXm
	uDCsRbEqVw/todTz/luRLEw2TTLECFwGHb08B6UewfHIw8rEaFYe6rgpbjxDaHlmqIjNGxPY+0XeH
	LutRtrcXMvCD0VHTonmSZUQMFrCVsXmmCS5ccbrYJGFmflC+qQvC/UqB8vLCI5mURjl9Yd4i43IU/
	x5JD9VKRBUcTXSWJaQYyuPAe1XR28DBt2xb/R3T2FIsJAcnrQ46bUxO6DUJUZzdFjQTFHnx8uvE90
	GNmG2/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTuu4-000000004uW-2rdn;
	Fri, 12 Dec 2025 04:37:16 +0000
Received: from sienna.cherry.relay.mailchannels.net ([23.83.223.165])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTuu1-000000004u9-2gAa
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 04:37:15 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1BCBA6C2381;
	Fri, 12 Dec 2025 04:37:12 +0000 (UTC)
Received: from fr-int-smtpout15.hostinger.io (100-100-24-133.trex-nlb.outbound.svc.cluster.local [100.100.24.133])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1F63C6C242F;
	Fri, 12 Dec 2025 04:37:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765514231;
	b=yWBjSRlpa/xUhonXIdlREQpXx/UmbrAvMgL1ZwulU9dN2MKgcfj94CLCG6p489/FW77cN4
	/x0B5qi9+lc20am3vFfOK6gLPKhgjNaN8lzVSY2WcoMsxlY3OHNn8glxZyBVWNoXQ0HEjU
	MZXp5bvE9tNKl3RSAiORoVCksv36UyIL3pl9KXd5PMMA5IKD4w9t9joNJYJxo4oGEPDNgz
	n1PwJAlWz4z/7KSsoaF8O7TreOFBzHgCJE2n8rwXKR7BaCDVxZm13GLyf4w1tRGa8BknvY
	m3Rj+TvnPdZqMYOr0WWDvJ6B2VTtklu8EzRgixj+IKrKsCZMGNaz6O/KMblkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765514231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=tWCPfEOYttJlkshs0vW/nQAQOlWPbDoLrIVyptpCbBo=;
	b=uJijWiOgj3GhB7XbFliEcFsRV6ThxfIHWEPOeLeP06I3xg57pL7li8MOgmN9rMWzI7HnQ+
	CdNsP9rBiXwRAaSvDL+oSs2TB6LJSQrum7kfcPXC+G8LOrCHQ39V7c52DqCPvT4sqdPffn
	zqurA/nkjubGpiFu4ZIYBEO2QeK+qGx7YC4FY5AiZ7wgYahlKivFRpgFAX9mj27iy7R42l
	qaVOuDWtY40qoOhqgqmcJMLfAKxYBlu1P1NkPGv1r1Ux+5joqXgls8nc87IZ3lRoZQwtu7
	sQrle5ivAfvoas3/VL7Zh//YkYCvEyQ3A+oJyVLlBpv/t4PnA0dqY4/3zvLE8g==
ARC-Authentication-Results: i=1;
	rspamd-9c757c4bc-c4qcg;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Stupid-Arch: 6b54e54e13617286_1765514231914_2328001451
X-MC-Loop-Signature: 1765514231914:3269047694
X-MC-Ingress-Time: 1765514231914
Received: from fr-int-smtpout15.hostinger.io (fr-int-smtpout15.hostinger.io
 [148.222.54.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.24.133 (trex/7.1.3);
	Fri, 12 Dec 2025 04:37:11 +0000
Received: from [IPV6:2001:861:4450:d360:fd3:3d4:e594:13ce] (unknown [IPv6:2001:861:4450:d360:fd3:3d4:e594:13ce])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dSGrc63x1z1y03;
	Fri, 12 Dec 2025 04:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765514225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWCPfEOYttJlkshs0vW/nQAQOlWPbDoLrIVyptpCbBo=;
	b=IBrBgvvi/r1jLLroIZgwCrGhYcl1GvXvdEe/oJyDb8T+i3vzZ6kqBO6j5CUcI5TKDl5V9L
	Pm4OIxoWmBoVBQG973cYkraFdtQLJIsSENLg5LtnanauD8Da8psHZq/B723YFTeY2BJMnP
	Gj4qYximteEetWLRWdwMJijrr4Emfw795a+erTGsIfIpcnHZi2JU6aqJmtkk3qhatiBWBe
	oCm1Y0Sp6exAkNHxuzAStB56wYb6pzAfv1UN1tcvi6GvL7v8ofsg6KeDUgIqqrFYvy0LtP
	d0aS0AQ1USVGNqxCrOvvTz+MflwpO6vjvN36m9tnmArtFLiYKrmZUssjDvyZ9Q==
Message-ID: <5965fad0-ab24-4db4-9ee4-647fe503a8ff@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: SpacemiT k1: Linux crashes setting up smp with mainline U-Boot
To: Junhui Liu <junhui.liu@pigmoral.tech>
References: <4d2e1302-723e-4f3f-ad28-586e6b4749ed@rootcommit.com>
 <1244329d-b842-4894-93d5-0c3c41c1eb9e@pigmoral.tech>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <1244329d-b842-4894-93d5-0c3c41c1eb9e@pigmoral.tech>
Date: Fri, 12 Dec 2025 04:37:04 +0000 (UTC)
X-CM-Envelope: MS4xfCynXGFc/UteviDZRucsIyy/q15vT3YXooECJv0y72uiDlIRMBSK1sHdIxQtiBpvULfUnh46bR7y7cUiqaD/E2WAhcUVPD3Zw6KwM9i3PVlIYmJsN9NM Ais6J/N0eJcB115rRnNT4ECHGh/s8owxNDDSjUkppBi7+yVHx92/OmXUJatE0bRd0cFHLJtAlSeLyag9S6vHXoHAhUUz5RZeFcmvGkdrYQNi+cUO126qxELT +HHMuV/UkbTn/2Jj7WTHYK0yf7jqX9wAi7FSBrmUH0qx+xYWcfhkUIICjG3ASMYAsqXbYJ4yj+8SCqWfIDtNP7qqt2JGUtM52IdQwCBW66C5ygek84LgcJka 56xjtH4GQw8AsBfXvk3dmOZKX9cbw9FPtADT+6V5gp8e4aMHiXIt5HOCdiMwqb8O8NC9spwP
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=693b9bf1 a=QP3xoUG9GEOTSEwqU1iSNg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=FMIGjplapC1opLQ2smYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_203713_968264_2867E0C8 
X-CRM114-Status: GOOD (  12.87  )
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

SGkgSnVuaHVpCgpUaGFua3MgYSBsb3QgZm9yIGhhdmluZyBhIGxvb2sgYXQgdGhpcyBpc3N1ZSEK
Ck9uIDEyLzEyLzI1IDAyOjUwLCBKdW5odWkgTGl1IHdyb3RlOgo+IEhpwqBNaWNoYWVsLAo+Cj4g
T24gMTIvMTIvMjUgNDozNCBBTSwgTWljaGFlbCBPcGRlbmFja2VyIHdyb3RlOgo+IFsuLi5dCj4+
IFsgwqAgMC4wMDAwMDBdIFNCSSBzcGVjaWZpY2F0aW9uIHYzLjAgZGV0ZWN0ZWQKPj4gW8KgIMKg
IDAuMDAwMDAwXSBTQkkgaW1wbGVtZW50YXRpb24gSUQ9MHgxIFZlcnNpb249MHgxMDAwNwo+PiBb
wqAgwqAgMC4wMDAwMDBdIFNCSSBUSU1FIGV4dGVuc2lvbiBkZXRlY3RlZAo+PiBbwqAgwqAgMC4w
MDAwMDBdIFNCSSBJUEkgZXh0ZW5zaW9uIGRldGVjdGVkCj4+IFvCoCDCoCAwLjAwMDAwMF0gU0JJ
IFJGRU5DRSBleHRlbnNpb24gZGV0ZWN0ZWQKPj4gW8KgIMKgIDAuMDAwMDAwXSBTQkkgREJDTiBl
eHRlbnNpb24gZGV0ZWN0ZWQKPj4gW8KgIMKgIDAuMDAwMDAwXSBTQkkgRldGVCBleHRlbnNpb24g
ZGV0ZWN0ZWQKPj4KPiBbLi4uXQo+PiBzeXlzIDAuMDgzOTU2XSBzbXA6IEJyaW5naW5nIHVwc3lz
eXN5czogc3lzOiAweHNzCj4+IDEuwqAgc3lzOnQ6OiBywqAgeTAwIHh4czAxZnhkY2ZlMTIxLjAK
Pj4gMjEwYy4KPj4KPj4gwqAgYjAKPj4gbTozCj4+IGouLi4KPgo+IFRoaXMgbWlnaHQgYWN0dWFs
bHkgbm90IGEgImNyYXNoIi4gSW5zdGVhZCwgaXQgc2VlbXMgdGhlIGJvb3QgYWRkcmVzcyBmb3IK
PiBDUFVzIDEtNyBoYXNuJ3QgYmVlbiBzZXQgY29ycmVjdGx5LCBjYXVzaW5nIHRoZW0gdG8gYm9v
dCBmcm9tIHRoZSAKPiBCb290Uk9NLgo+Cj4gSSBiZWxpZXZlIHRoaXMgaXMgbm90IGEgVS1Cb290
IGlzc3VlLCBidXQgcmF0aGVyIGFuIE9wZW5TQkkgb25lLiAKPiBBY2NvcmRpbmcKPiB0byB0aGUg
bG9nLCBpdCBsb29rcyBsaWtlIHlvdSBhcmUgdXNpbmcgbWFpbmxpbmUgT3BlblNCSS4gQ291bGQg
eW91IAo+IHBsZWFzZQo+IGNvbmZpcm0gdGhlIE9wZW5TQkkgeW91IGFyZSB1c2luZyBpbmNsdWRl
cyB0aGlzIGZpeDoKPgo+IDEyNmM5ZDM0ICgicGxhdGZvcm06IGdlbmVyaWM6IHNwYWNlbWl0OiBh
ZGQgbWlzc2luZyBvYmplY3RzLm1rIikKClllcywgSSBtYWRlIHN1cmUgSSdtIGJ1aWxkaW5nIHRo
ZSBsYXRlc3QgY29tbWl0IG9uIHRoZSAibWFzdGVyIiBicmFuY2ggCmFzIG9mIHRvZGF5ICg1MWZl
NmE4YmM5NTgxNjZmZjc5ODA1Y2Y2OWJhZmU1ZTI5Nzc3NmY0KSwgYW5kIHRoYXQgaXQgCmNvbnRh
aW5zIHRoZSBmaXggeW91IG1lbnRpb25lZC4KSG93ZXZlciwgaXQgZG9lc24ndCBmaXggbXkgaXNz
dWUgeWV0LgoKSGVyZSdzIHRoZSBPcGVuU0JJIG91dHB1dCwgd2hpY2ggdW5mb3J0dW5hdGVseSBk
b2Vzbid0IGNvbmZpcm0gdGhlIGNvbW1pdDoKCk9wZW5TQkkgdjEuNwogwqAgwqBfX19fwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgX19fX18gX19fXyBfX19fXwogwqAgLyBfXyBcwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgLyBfX19ffMKgIF8gXF/CoCDCoF98CiDCoHwgfMKgIHwgfF8g
X1/CoCDCoF9fXyBfIF9fIHwgKF9fXyB8IHxfKSB8fCB8CiDCoHwgfMKgIHwgfCAnXyBcIC8gXyBc
ICdfIFwgXF9fXyBcfMKgIF8gPCB8IHwKIMKgfCB8X198IHwgfF8pIHzCoCBfXy8gfCB8IHxfX19f
KSB8IHxfKSB8fCB8XwogwqAgXF9fX18vfCAuX18vIFxfX198X3wgfF98X19fX18vfF9fX18vX19f
X198CiDCoCDCoCDCoCDCoCB8IHwKIMKgIMKgIMKgIMKgIHxffAoKUGxhdGZvcm0gTmFtZcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgOiBCYW5hbmEgUGkgQlBJLUYzClBsYXRmb3JtIEZlYXR1cmVzwqAg
wqAgwqAgwqAgwqAgwqA6IG1lZGVsZWcKUGxhdGZvcm0gSEFSVCBDb3VudMKgIMKgIMKgIMKgIMKg
OiA4ClBsYXRmb3JtIElQSSBEZXZpY2XCoCDCoCDCoCDCoCDCoDogYWNsaW50LW1zd2kKUGxhdGZv
cm0gVGltZXIgRGV2aWNlwqAgwqAgwqAgwqA6IGFjbGludC1tdGltZXIgQCAyNDAwMDAwMEh6ClBs
YXRmb3JtIENvbnNvbGUgRGV2aWNlwqAgwqAgwqA6IHVhcnQ4MjUwClBsYXRmb3JtIEhTTSBEZXZp
Y2XCoCDCoCDCoCDCoCDCoDogLS0tClBsYXRmb3JtIFBNVSBEZXZpY2XCoCDCoCDCoCDCoCDCoDog
LS0tClBsYXRmb3JtIFJlYm9vdCBEZXZpY2XCoCDCoCDCoCA6IC0tLQpQbGF0Zm9ybSBTaHV0ZG93
biBEZXZpY2XCoCDCoCA6IC0tLQpQbGF0Zm9ybSBTdXNwZW5kIERldmljZcKgIMKgIMKgOiAtLS0K
UGxhdGZvcm0gQ1BQQyBEZXZpY2XCoCDCoCDCoCDCoCA6IC0tLQpGaXJtd2FyZSBCYXNlwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqA6IDB4MApGaXJtd2FyZSBTaXplwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqA6IDQwMyBLQgpGaXJtd2FyZSBSVyBPZmZzZXTCoCDCoCDCoCDCoCDCoCA6IDB4NDAwMDAKRmly
bXdhcmUgUlcgU2l6ZcKgIMKgIMKgIMKgIMKgIMKgIDogMTQ3IEtCCkZpcm13YXJlIEhlYXAgT2Zm
c2V0wqAgwqAgwqAgwqAgOiAweDU0MDAwCkZpcm13YXJlIEhlYXAgU2l6ZcKgIMKgIMKgIMKgIMKg
IDogNjcgS0IgKHRvdGFsKSwgNCBLQiAocmVzZXJ2ZWQpLCAxMiBLQiAKKHVzZWQpLCA1MCBLQiAo
ZnJlZSkKRmlybXdhcmUgU2NyYXRjaCBTaXplwqAgwqAgwqAgwqA6IDQwOTYgQiAodG90YWwpLCAx
NDAwIEIgKHVzZWQpLCAyNjk2IEIgKGZyZWUpClJ1bnRpbWUgU0JJIFZlcnNpb27CoCDCoCDCoCDC
oCDCoDogMy4wClN0YW5kYXJkIFNCSSBFeHRlbnNpb25zwqAgwqAgwqA6IAp0aW1lLHJmbmMsaXBp
LGJhc2UsaHNtLHBtdSxkYmNuLGZ3ZnQsbGVnYWN5LGRidHIsc3NlCkV4cGVyaW1lbnRhbCBTQkkg
RXh0ZW5zaW9ucyA6IG5vbmUKCkRvbWFpbjAgTmFtZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDog
cm9vdApEb21haW4wIEJvb3QgSEFSVMKgIMKgIMKgIMKgIMKgIMKgOiAwCkRvbWFpbjAgSEFSVHPC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoDogMCosMSosMiosMyosNCosNSosNiosNyoKRG9tYWluMCBS
ZWdpb24wMMKgIMKgIMKgIMKgIMKgIMKgIDogMHgwMDAwMDAwMGQ0MDE3MDAwLTB4MDAwMDAwMDBk
NDAxN2ZmZiBNOiAKKEksUixXKSBTL1U6IChSLFcpCkRvbWFpbjAgUmVnaW9uMDHCoCDCoCDCoCDC
oCDCoCDCoCA6IDB4MDAwMDAwMDBlNDAwMDAwMC0weDAwMDAwMDAwZTQwMGZmZmYgTTogCihJLFIs
VykgUy9VOiAoKQpEb21haW4wIFJlZ2lvbjAywqAgwqAgwqAgwqAgwqAgwqAgOiAweDAwMDAwMDAw
MDAwMDAwMDAtMHgwMDAwMDAwMDAwMDNmZmZmIE06IAooUixYKSBTL1U6ICgpCkRvbWFpbjAgUmVn
aW9uMDPCoCDCoCDCoCDCoCDCoCDCoCA6IDB4MDAwMDAwMDAwMDA0MDAwMC0weDAwMDAwMDAwMDAw
N2ZmZmYgTTogCihSLFcpIFMvVTogKCkKRG9tYWluMCBSZWdpb24wNMKgIMKgIMKgIMKgIMKgIMKg
IDogMHgwMDAwMDAwMGUwMDAwMDAwLTB4MDAwMDAwMDBlM2ZmZmZmZiBNOiAKKEksUixXKSBTL1U6
IChSLFcpCkRvbWFpbjAgUmVnaW9uMDXCoCDCoCDCoCDCoCDCoCDCoCA6IDB4MDAwMDAwMDAwMDAw
MDAwMC0weGZmZmZmZmZmZmZmZmZmZmYgTTogCigpIFMvVTogKFIsVyxYKQpEb21haW4wIE5leHQg
QWRkcmVzc8KgIMKgIMKgIMKgIDogMHgwMDAwMDAwMDAwMjAwMDAwCkRvbWFpbjAgTmV4dCBBcmcx
wqAgwqAgwqAgwqAgwqAgwqA6IDB4MDAwMDAwMDAwMDI4OTA1OApEb21haW4wIE5leHQgTW9kZcKg
IMKgIMKgIMKgIMKgIMKgOiBTLW1vZGUKRG9tYWluMCBTeXNSZXNldMKgIMKgIMKgIMKgIMKgIMKg
IDogeWVzCkRvbWFpbjAgU3lzU3VzcGVuZMKgIMKgIMKgIMKgIMKgIDogeWVzCgpCb290IEhBUlQg
SUTCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA6IDAKQm9vdCBIQVJUIERvbWFpbsKgIMKgIMKgIMKg
IMKgIMKgIDogcm9vdApCb290IEhBUlQgUHJpdiBWZXJzaW9uwqAgwqAgwqAgOiB2MS4xMgpCb290
IEhBUlQgQmFzZSBJU0HCoCDCoCDCoCDCoCDCoCA6IHJ2NjRpbWFmZGNidngKQm9vdCBIQVJUIElT
QSBFeHRlbnNpb25zwqAgwqAgOiAKc3Njb2ZwbWYsc3N0Yyx6aWNudHIsemlocG0semljYm96LHpp
Y2JvbSxzdnBibXQsc2R0cmlnCkJvb3QgSEFSVCBQTVAgQ291bnTCoCDCoCDCoCDCoCDCoDogMzIK
Qm9vdCBIQVJUIFBNUCBHcmFudWxhcml0ecKgIMKgOiAxMiBiaXRzCkJvb3QgSEFSVCBQTVAgQWRk
cmVzcyBCaXRzwqAgOiAzOApCb290IEhBUlQgTUhQTSBJbmZvwqAgwqAgwqAgwqAgwqA6IDE2ICgw
eDAwMDdmZmY4KQpCb290IEhBUlQgRGVidWcgVHJpZ2dlcnPCoCDCoCA6IDggdHJpZ2dlcnMKQm9v
dCBIQVJUIE1JREVMRUfCoCDCoCDCoCDCoCDCoCDCoDogMHgwMDAwMDAwMDAwMDAyMjIyCgpCb290
IEhBUlQgTUVERUxFR8KgIMKgIMKgIMKgIMKgIMKgOiAweDAwMDAwMDAwMDAwMGIxMDkKCkFueXRo
aW5nIGVsc2UgSSBjYW4gdHJ5PwpUaGFua3MgYWdhaW4KTWljaGFlbC4KCi0tIApNaWNoYWVsIE9w
ZGVuYWNrZXIKUm9vdCBDb21taXQKWW9jdG8gUHJvamVjdCBhbmQgT3BlbkVtYmVkZGVkIFRyYWlu
aW5nIGNvdXJzZSAtIExlYXJuIGJ5IGRvaW5nOgpodHRwczovL3Jvb3Rjb21taXQuY29tL3RyYWlu
aW5nL3lvY3RvLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
