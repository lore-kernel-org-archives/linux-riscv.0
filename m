Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FF7CCFA03
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 20:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHX1q3bWUzMInpbJ7M5CJUKge35/z09Z3xCV56nnIug=; b=eiMM++aPLDyWUvvznksDTiBIs+
	3hvJvhPbRiJ6GVYaCjnfXzdvnLXG4YX78qNcWvMS2VlNkDTR/oPaH5iy5QUJs6LpqpUCRD5pIqc0l
	txxJA+0SkuqNoB0EBWuHCES50yFV2wiTWFdJY8PbOzNgsg0jX1fj+Jkz3jR5KYbhQ48z2BOQ33wi0
	3A0gCQz7Y0ncs3nC2nz2PK66c8RJMQ6FQRi/CJ/EecumbpxG8QIEoJYro0xiD//OBkGGmCxaxtUAA
	XxXwdnQzjW6G0F7ivRhfilVMlmtNS4PGXliho4Z/3EOCEwmYDEkExq8PC6VcQPZcDKRWFKWgZXbPM
	wsgknZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG1WP-0000000AcQG-3cpW;
	Mon, 03 Nov 2025 20:51:25 +0000
Received: from iguana.tulip.relay.mailchannels.net ([23.83.218.253])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG1WN-0000000AcPj-0iOO
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 20:51:24 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7FB846C0176;
	Mon, 03 Nov 2025 20:51:15 +0000 (UTC)
Received: from fr-int-smtpout28.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.123.122.56])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5392B6C2A7B;
	Mon, 03 Nov 2025 20:51:14 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762203075; a=rsa-sha256;
	cv=none;
	b=6gtB/XMHsYvO6fP5W2VC98bV7XtfLz4fyXvGKv/NA2qbUozgkreQDgoeskP0VeNZoNy23n
	9+s2SSMfml6vso4KkVFoHukDKtFW54ItaapLoS5W/JSmDHLNnWZeFGZRMTOLpwqtmZ/2dk
	OHuddjbiKI6FvL9vRWiPAHsA1g1w8PsRLc6G9BApfAPHiF4Etdon6ZLSrTynhh77MN4AI6
	cpsVbU5jlRMekI+5Z7jXUo35CJ6VmO5aOnPAkJR3crrL66fVTdw18BV8FjQ238BaZcy1Bh
	w1Xt3lwgVWahNaUrKG67UKTQ1+nOl4r+XBJVJ3QWmBxVMuyHOvP+97oB+wXzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762203075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=BN1E+bNOPGkOUKtyobMs/wo8d2QpDKee5w7CGY8kmTg=;
	b=KyAS/2RrGlKUJDAyndK8IiOHwMRkWUpu1swN2r66uiluT43Kz1ahwXtlAFlmcsSPxgZCMs
	2T0kaFEV1BQ7oGyCP1+M336soHFzOrmG/OuIYkgONzo74cGEzfW4m9zObF6yVFCqYXGD5j
	4ljidXLInq+BMz6z/KAsHhAiWOuRyPvYbMRuCaQd9pK2A9l8DuFllPMqmiuR32EMSh7dxA
	OfLkrpvTBozmkK7/dtMOiEyKrkwgUCbiufS3T0gO8pdspTnowRxRnALTw6f6OlqdOb2SmE
	mHb/SEHtr4iX+ND7BTPmw2hDOc3gNRdengUvqrF0eLigXblSMALhrEzFPC++fA==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-4b6h5;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Attack-Wipe: 291948b0682b543e_1762203075221_2281779579
X-MC-Loop-Signature: 1762203075221:3538348875
X-MC-Ingress-Time: 1762203075221
Received: from fr-int-smtpout28.hostinger.io (fr-int-smtpout28.hostinger.io
 [148.222.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.122.56 (trex/7.1.3);
	Mon, 03 Nov 2025 20:51:15 +0000
Received: from [172.20.71.102] (93-46-206-37.ip109.fastwebnet.it [93.46.206.37])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d0kJb6D9Xz31H7;
	Mon,  3 Nov 2025 20:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762203072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BN1E+bNOPGkOUKtyobMs/wo8d2QpDKee5w7CGY8kmTg=;
	b=bIcpagrhlaVbcXRnoe34HB8DQ6jbKt1FDRu0HVtyp1Ewaq/oDY8elTSJVd2HJr6iKp3t8v
	ufx8mFA8mfRHr5+bfeDcIOHmgGXq8ijTm3D/ie5li7M+scVG/ukKBRAnjQ5X3M7zHOV9wH
	RNKLk0YgHOEmhvu6N4lNUHvB2T2eKvJbBOUEdxiyzAtKewHK/4m8DEPp1gjQXR58qXMTAU
	fjQrpcE3bGkWLFtv2XvmMU756V3KhvZF8bv5D3qWnSSDIeTGR6TKWmJ7M2I0+onxDSoTzK
	jKMWno4hQrjVA/4SeC77gNnBLrbCL2sV1NJjb+o4hbY50ll1NwebFlt8s62BYA==
Message-ID: <40d90aa9-4ab2-4d8c-939d-337e63179515@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
 <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
 <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
 <D8EC2D64D80DFAFE+aQgXCTbGv9o9t9IS@kernel.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <D8EC2D64D80DFAFE+aQgXCTbGv9o9t9IS@kernel.org>
Date: Mon,  3 Nov 2025 20:51:11 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=690915c0 a=4YLbAjK1KvTCq7jIiv2jOw==:117 a=4YLbAjK1KvTCq7jIiv2jOw==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=ns0OWjIUjD52wNEF5mYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfFNUVeAk1COLrQEIxgkDEsA67G4T0AWfHChZDjJtrd+1qHJfe0zhHlthOtQujIv0302NmhFRhFTjB6FsvhX90WktgrV7gt1wATYTUziJxl21G9/nd79w +wqIJp0EsQHgSzruSS0Gej1zeYYHxEUj0Ug04fSOZPo7X/i9KF8eZvpwYS+Y6etI+oATsGDqSBSjMrp1d4lhbCsN9MmjfN/C4cgaRvrEjTz35UwnGHerYinc PzGV6Xm2bVYdoAtJ6LtPUme8kwrJtOv9Poz/unZMLzJtKdzeTo41kQk3udV2UiJm+Qmuqr3GfvJIPew1RXWUfTOTzsG+9dvvllPKqPKcuyxvBhJCyOCqPeX1 GqCYpK/C
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_125123_488753_C11B065F 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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

SGkgVHJveSwKCk9uIDExLzMvMjUgMDM6NDQsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4+PiBVbmZv
cnR1bmF0ZWx5LCB0aGVzZSBjaGFuZ2VzIGFyZSBub3QgZnVuY3Rpb25hbCB5ZXQgb24gT3Jhbmdl
UGkgUlYyLCB0ZXN0aW5nCj4+PiBvbiBodHRwczovL2dpdGh1Yi5jb20vc3BhY2VtaXQtY29tL2xp
bnV4L2NvbW1pdHMvazEvZHQtZm9yLW5leHQKPj4+Cj4+PiAjIGkyY2RldGVjdCAtciAyCj4+PiBX
QVJOSU5HISBUaGlzIHByb2dyYW0gY2FuIGNvbmZ1c2UgeW91ciBJMkMgYnVzLCBjYXVzZSBkYXRh
IGxvc3MgYW5kIHdvcnNlIQo+Pj4gSSB3aWxsIHByb2JlIGZpbGUgL2Rldi9pMmMtMiB1c2luZyBy
ZWNlaXZlIGJ5dGUgY29tbWFuZHMuCj4+PiBJIHdpbGwgcHJvYmUgYWRkcmVzcyByYW5nZSAweDA4
LTB4NzcuCj4+PiBDb250aW51ZT8gW1kvbl0KPj4+ICDCoCDCoCDCoDDCoCAxwqAgMsKgIDPCoCA0
wqAgNcKgIDbCoCA3wqAgOMKgIDnCoCBhwqAgYsKgIGPCoCBkwqAgZcKgIGYKPj4+IDAwOsKgIMKg
IMKgIMKgIFvCoCAxMjQuNjc1MzIxXSBpMmMtazEgZDQwMTIwMDAuaTJjOiBpMmMgdHJhbnNmZXIg
ZmFpbGVkLCByZXQgLTExCj4+PiBlcnIgMHg0MDAwMDAKPiBJIHJlY2FsbCB0aGF0IHRoZSBQTUlD
IHNvbWV0aW1lcyByZXBvcnRzIEkyQyB0aW1lb3V0cy4KPiBDb3VsZCB5b3UgcGxlYXNlIGNvbmZp
cm0gaWYgeW914oCZcmUgc2VlaW5nIHRoaXMgaXNzdWUgb24geW91ciBzaWRlPwo+IElmIHNvLCBk
b2VzIGl0IHN0aWxsIG9jY3VyIHdoZW4gdXNpbmcgbXkgYnJhbmNoPwpVbmZvcnR1bmF0ZWx5LCBJ
IGNhbid0IHRyeSBhdCB0aGUgbW9tZW50LCBub3QgaGF2aW5nIHRoZSBib2FyZCB0aGlzIAp3ZWVr
LiBJJ2xsIGJlIGFibGUgdG8gdGVzdCBhZ2FpbiBuZXh0IHdlZWstZW5kLiBIb3dldmVyLCBJIGRv
bid0IApyZW1lbWJlciBoYXZpbmcgaXQgd2l0aCB5b3VyIGNoYW5nZXMuCkNoZWVycwpNaWNoYWVs
LgotLSAKCk1pY2hhZWwgT3BkZW5hY2tlcgpSb290IENvbW1pdApFbWJlZGRlZCBMaW51eCBUcmFp
bmluZyBhbmQgQ29uc3VsdGluZwpodHRwczovL3Jvb3Rjb21taXQuY29tCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
