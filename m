Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B9AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 20:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43007206BB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 20:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C+wgDvx7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43007206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tAIS8aY8DdbAlgsieJ7iCrq/rtiAqtnP8xfygriB2F8=; b=C+wgDvx7jvmFG2xGs6WbHEYUI
	oZONPfIaAxuoGdMqGv4ITaByELabIJy5Gv2D9N9ZTKy6CAzNxX1jA0v6IjK3cMhq+gPltXaYMul2r
	jErn8Rdbhbipz3PIhwmLUH7z84f6E5sTo86Z8wwqsUMHX9efSPLYzKCWbPpwbK5JlbPPTRGBUtlmb
	9i/S0YVytcqK6RO67HGaOakK+Lmd/JH17xQxFb44jA0dSaaIIXfIY0akb0kIja5Qv0DcXfU/nShQa
	ge/pA2/TZHbS4oHy+dPfLu8nAqZ/jQR11SarcpdoiU+yMiNiedrNos/0yqVEo+NQHsCthuuqEa6GV
	OVOlbInpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxHpC-00016k-AH; Fri, 22 Feb 2019 20:53:38 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxHp8-00015o-Vh
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 20:53:37 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x1MKrCbX020632; Fri, 22 Feb 2019 20:53:14 GMT
X-AuditID: 8b5b9d4d-90dff7000000235c-86-5c7061371b22
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 06.78.09052.731607C5; Fri, 22 Feb 2019 22:53:11 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x1MKrBJ1010355; Fri, 22 Feb 2019 22:53:11 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 22 Feb 2019 22:53:11 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn.topel@gmail.com>
Subject: Re: per-cpu thoughts
Organization: FORTH
In-Reply-To: <CAJ+HfNgKFYzSdp5Jut=rXCA0vtkwDcCnDemmgpKD59YJqkg3QQ@mail.gmail.com>
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
 <CAJ+HfNgKFYzSdp5Jut=rXCA0vtkwDcCnDemmgpKD59YJqkg3QQ@mail.gmail.com>
Message-ID: <b0653f7a6f1bc0c9329d37de690d3bed@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsXSHc2orGueWBBjMPOzhcX5aafYLK5/e8No
 se1zC5tF87tz7BabJyxgtfiw4y+zA5vHzll32T0ebrrE5PHkynQmj81L6j1u/O5l97jUfJ09
 gC2KyyYlNSezLLVI3y6BK+Pc9/9sBZtZK9bMWczcwLiJpYuRk0NCwERi88dVbF2MXBxCAocZ
 JT5+6mKHcA4xSjRMP8UGUWUqMXtvJyOIzSsgKHFy5hOwbmYBC4mpV/YzQtjyEs1bZzOD2CwC
 qhKrli5jB7HZBDQl5l86CFYvImAr8eHJAVaQBcwgC96feswEkhAWkJU49PYuWBG/gLDEp7sX
 gYo4ODgFAiWae3ggDprLJLG++S3UES4SK5Y0MEEcpyLx4fcDsGWiAsoSL05MZ53AKDQLya2z
 kNw6C8mtCxiZVzEKJJYZ62UmF+ul5ReVZOilF21iBMfDXN8djOcW2B9iFOBgVOLhDfiUHyPE
 mlhWXJkLdDgHs5IIb5dhQYwQb0piZVVqUX58UWlOavEhRmkOFiVx3sMvwoOEBNITS1KzU1ML
 UotgskwcnFINjFpzNvW3ljzauOj7qjsnsxsf/30Sk69yhmuZ2xQpphimuxWlZ06qnXb48yJk
 iwHn8ZtbrcyuT/q/yXhKi+ccv3vS3cZpUzjeu/r7RXD8mMhV4567PCPIt1Rk0QvNyMkKLDwP
 z23ZoHDJqrEt6PEtpQ8ZJyp3u7w/pL1d3v7o1NV9uXuneWzffE2JpTgj0VCLuag4EQDliZ9V
 gwIAAA==
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Fri, 22 Feb 2019 20:53:14 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Fri, 22 Feb 2019 20:53:14 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_125335_387889_D6C55938 
X-CRM114-Status: UNSURE (   5.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Christopher Lameter <cl@linux.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul@pwsan.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wMi0yMiAyMTo0OCwgQmrDtnJuIFTDtnBlbCDOrc6zz4HOsc+IzrU6Cj4g
T24gRnJpLCAyMiBGZWIgMjAxOSBhdCAxNjozNiwgTmljayBLb3NzaWZpZGlzIDxtaWNrQGljcy5m
b3J0aC5ncj4gCj4gd3JvdGU6Cj4+IAo+IFsuLi5dCj4+IAo+PiBIb3cgYWJvdXQgdGhlIHNjcmF0
Y2ggcmVnaXN0ZXJzIGRlZmluZWQgb24gcHJpdiBzcGVjID8gV2UgYWxyZWFkeSB1c2UKPj4gc3Nj
cmF0Y2ggb24gTGludXggZm9yIGtlZXBpbmcgcGVyLWhhcnQga2VybmVsIGRhdGEgc3RydWN0dXJl
cyAoY2hlY2sgCj4+IG91dAo+PiBlbnRyeS5TKSBhbmQgbXNjcmF0Y2ggb24gT3BlblNCSSBmb3Ig
a2VlcGluZyBwZXItaGFydCBzdGF0ZSBldGMuCj4gCj4gSG1tLCB3aGF0IGlzIHRoZSAidHAiIHJl
Z2lzdGVyIHVzZWQgZm9yIGluIGtlcm5lbCBzcGFjZSB0b2RheT8KCkluIHRoaXMgY2FzZSBpdCdz
IHVzZWQgZm9yIHRhc2tfc3RydWN0LgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
NS4wLXJjNy9zb3VyY2UvaW5jbHVkZS9saW51eC9zY2hlZC5oI0w1OTIKCk5vdGUgdGhhdCBpdHMg
Zmlyc3QgZWxlbWVudCBpcyB0aHJlYWRfaW5mbywgdGhhdCdzIHdoeSB5b3Ugc2VlIHRoZQpUSV8q
IG1hY3JvcyBiZWluZyB1c2VkIGZvciBnZXR0aW5nIG9mZnNldHMgb24gdHAuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
