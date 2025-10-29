Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DFDCCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 14:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0AhtEQB0W8n2pehHvLnVoBEs4fInvkCsUHv8Jg6QKA=; b=jUtF0FCvIL/cphQ/5j/oSUPWfS
	rIvu6t0V/FINpgVT6DZJ/IvYOLQ0BGRJ9n1XWe/wXovIKCohYId3P6AfxukSbw9KxXwhY8sdZ4MPw
	70w/FMaIiRcmTWI5O8odGwUEwgR41m8o1/pbnXQ9GqEo/owREVzdKcSkxGxn9ryP+yMuvDsZh47zN
	r8D+nriituu3/WUOvQ5QUuyPXYdtMuAmg+S2Ycv9v2UedZjuMLPhUwcD6HTp7qzI4OW+mdUERUPeb
	RW5J5cnclAkT1k+9ilYjCUn+0PiJfjl4byMZFUnaGzU0jr+eV7hFk24FmqJcL4FP3+9co89gpEBNm
	F6pdN1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7N3-00000001cx5-1vBE;
	Wed, 29 Oct 2025 14:41:53 +0000
Received: from toucan.tulip.relay.mailchannels.net ([23.83.218.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7N0-00000001cvP-3iQK
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 14:41:52 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CD544721631;
	Wed, 29 Oct 2025 14:41:49 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.123.122.56])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B43DD721840;
	Wed, 29 Oct 2025 14:41:44 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761748909; a=rsa-sha256;
	cv=none;
	b=i3WSzsLYo7teMpHtZN0AjNdZ4foxz/q0PwZGvGzYNAIojH4EsbGQ17K8774xGyd6mxTMLB
	AIFpEh/IpG6S27BBxOBmbMKyRkp0I+RTMkqY9VNnJmGjAp/5zhmQSBIZ9ik8ZmdyxDfV9Y
	CtoZTo531IguB7U3eMa+JvTOGrgOw5o1T8HKs4qiYSdjIzMLp49EKnCnj2XlxlxJhXl6do
	UTgcHe4K0jjWChiat2QCh3vY/If2abb5ELbVYOrPljt73WetzLmien5MinVYd8jlcfxXK9
	JzsdRypXg1FcWEly0Ooy8DLhFjhrL9z6fMsBuo6Q5q0ppMrMnUTDAHBzGlNXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761748909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=S1xXs3JGvgEgRE8/1iINIBl8/G8ZW5nPLsCFO5WNNV0=;
	b=Imoa1XqZLGBRzJTPpZvMEnuo8HAAAUTw7rSu0RE6UGjbbYihjRQmrK+8e2MYrOuoBADE7b
	CuJT06i83I8m6y86e2viB2TJxjZjs7wqrJixsuEj7/qwyycE/3eC/YpWhwae1WeRGqjHLT
	RfaN50i7GBxmaOFuBUSJp385MIVpyCXG1GuDgtyg/AkunqUdWRxp0eTgvt/YOBYnP3rKJf
	8fj2MFxLZNRLwM02rXkruzCCteryjWobWwkw8/0IfESu5fWEGmpN6COzIlqxXMfPLWPd5z
	aIDYo50nQ/8sItNpH4GIGPp/TkxGe7twl2s2HW1UUfsJgquGeLTb5D0M6k+q0w==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-wq79s;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Hysterical-Tart: 443c3104291b6376_1761748909567_1523129841
X-MC-Loop-Signature: 1761748909567:1662878829
X-MC-Ingress-Time: 1761748909567
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.122.56 (trex/7.1.3);
	Wed, 29 Oct 2025 14:41:49 +0000
Received: from [IPV6:2001:861:4450:d360:cc54:3014:8454:2c6d] (unknown [IPv6:2001:861:4450:d360:cc54:3014:8454:2c6d])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cxVLX0ChZz1xtT;
	Wed, 29 Oct 2025 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761748903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1xXs3JGvgEgRE8/1iINIBl8/G8ZW5nPLsCFO5WNNV0=;
	b=aTHNEf/TnTquIxOWInYfDDw0QevBSwKkHEJE/6vbCJQM1iNFWM51fjwTq9EAa+mTsTrYwZ
	vV2AjwVGgO1JRwKU7PPOJS8YvnGYfx6AuJh8sBDj8+PsufMUh+wx9+575Vqx5rwDFoGMES
	0kcc4EG6lv9H5GM884Sa677DwQm1/uEzftU4PzLO3sedt4DZK5ParJh1A2Li57V2jOlVii
	MjKQ2uvY2X8qGmdqo1CYuJN2HSQ7Kl7l8UAjzDGF97sZl6IPETXndKg+ONej2dAfktovuA
	HjYxrk9I/zAv/CWN4En5fGw378QPqUKXB54XlBdnFWBwTcFdXvSiTjPT+009Vw==
Message-ID: <6e4bf564-07e9-44a3-a18f-69bc716ca575@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
To: Joshua Milas <josh.milas@gmail.com>, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com,
 inochiama@gmail.com, paul.walmsley@sifive.com, samuel.holland@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
 liujingqi@lanxincomputing.com
References: <20251029001052.36774-1-josh.milas@gmail.com>
 <20251029001052.36774-3-josh.milas@gmail.com>
 <4b1b2580-63ce-4ce8-b4a9-1763d3d3a253@rootcommit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <4b1b2580-63ce-4ce8-b4a9-1763d3d3a253@rootcommit.com>
Date: Wed, 29 Oct 2025 14:41:40 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=690227a6 a=cfTWVnPyVfvWbvVVnrj+XQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=-d3y0XjIFKyu09ZH-IMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=URPqgtl0u8oA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfHOzqohSyERV3CJIWO+IJIU8BQRPxIPwrQrUV+4GAs1IWYTl+vbhEX6eXClg5kyn3CmwykLaUiQ7Puc9aw+ckgifACezeIajAZLft/NMzaxbl1bjqTH/ cmK5oYOArSLZRvcIdNSH8xa9NPck0uNuLsKc5gex+MidQzKfJazvwkSSkh3zrWfQew2oG6ebqZE2XhwlJjSA/KHFmWHC+eYCRCU73jCIem2k305uXDvS3cZH IYkM2M1HMvQzzdDZq4h4FZ57vNsZ4Xnebs4BTkuc5WHnASdCVtLd4Felqspt7WZo8+tqgms+KVzGzt5AQtxnjIXAFTvCJRk5eS1ylwNdcgTjQz9R6SLm3I/w z3H1GeCV4+8hMSktb6P34ME7Qwzi/MJNJ1LgGoi+bTPDJMkmb3Ol3CDXghCGXXkgQHiQH9hxI2HM6JwcaylQSb2E4LlDDwl77s7OvTHGFvR6ohBsX0kwTXSa +phUG42SvbicvWSpSoLouBPHAYqv8P9ZmNEiutoWWUb8288YPcXhH8SmvwWnyvOXuOQhrU36LPx2nnjbn5yc2o0jIxV0rQieYY2mnK8n49306fJYKhAEteUL XF0D+RX7os5d39KXaa+mflRdTktPHjBszKHnuhrX1HkE8yxFrT0K9rptPA2CYTepyn97RqT9aKpUveWyCDeG5KH3QfJ7bT0EmLVKpg1rrxb1rCiNBEAVP4yC L0DxS7hY4X2fm3AtfNq7ls/6CHRD/c4+CQkAQKs4IgT0Kb2lS0lDmmO2QJGO5HLE5Xp5lIutq7Fwg3iSBXcgb8NjGEK76DcMbW62G0XXIfhc2lQlPC4wRB0U eubIa1NRquaD8ce5e4rAvWokg1vktm0qW9iraNtqp8cCqlJspet8NEVsZiRrxdC/fnvTSiotIZRECtjNuV3xcvvPyMm2W+Tj4Y71a9LBRgFK6YKuRgH49WsS 1B8jGMBo2yXd3ah
 5ilCweGa3rx1sj85eeFLn9JjmjPbD8fCGa7d5SlNrB2O8u5DRdJOsgA==
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_074151_248857_E77F33D6 
X-CRM114-Status: UNSURE (   5.52  )
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

R3JlZXRpbmdzLAoKT24gMTAvMjkvMjUgMTM6MzUsIE1pY2hhZWwgT3BkZW5hY2tlciB3cm90ZToK
Pgo+IEkgbWFuYWdlZCB0byBib290IHRoZSBib2FyZCBhbmQgcnVuIHRlc3RzOgo+Cj4gVGVzdGVk
IHN1Y2Nlc3NmdWxseToKPgo+IMKgKiB1YXJ0MDogYm9vdCBjb25zb2xlCj4gwqAqIG1tYzAgKHNk
aGNpMD8pOiByb290IGZpbGVzeXN0ZW0KPgo+IElzc3VlcwoKCi4uLgpJIHJlYWxpemUgSSByZXBs
aWVkIHRvIHRoZSBhcm02NCBwYXJ0IG9mIHRoZSB0aHJlYWQsIGJ1dCBpbmRlZWQgSSByYW4gbXkg
CnRlc3RzIG9uIHJpc2N2LgpNaWNoYWVsLgoKLS0gCk1pY2hhZWwgT3BkZW5hY2tlcgpSb290IENv
bW1pdApZb2N0byBQcm9qZWN0IGFuZCBPcGVuRW1iZWRkZWQgVHJhaW5pbmcgY291cnNlIC0gTGVh
cm4gYnkgZG9pbmc6Cmh0dHBzOi8vcm9vdGNvbW1pdC5jb20vdHJhaW5pbmcveW9jdG8vCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
