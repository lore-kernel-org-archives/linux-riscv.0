Return-Path: <SRS0=MOL2=PJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC59C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  1 Jan 2019 19:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C8322171F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  1 Jan 2019 19:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z598VfB0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C8322171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lf3okPOQ/EWT3eyfwoI6E3ra2B5jriD9gG7yZwo2yY0=; b=Z598VfB0W5hG+Tm9XebGlzGTP
	QoYOW3vpY2G9iA7CPtdoOLVGmQmbBvyhwBMsh3hdDughe8pmsned+0BAnHvyZb5MBGmGIsBFrqB9B
	G6bemwh6MXPfX4zA0V+oz4EUQTzNHc4XhOiPKCyRPDKGS9DCYLy592gKVeaurwxr8nAx0yDesnrKk
	qZlexw9HlljuwCPEKM1OEKxn0kNzY7D+zHqema/Rl15Tatug8QPR/BOfKCKtLWKgZgRK1/YoNV+ce
	BbzPs7TYje0UofLMWH/ogUhbEpPZt/wG1QgI7vFeO2U7KbTf1wHrc+mvk5q53wm3afcivyVl7dM8i
	JY9UepyTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gePOF-0002qJ-UF; Tue, 01 Jan 2019 19:07:47 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gePOC-0002pk-JB
 for linux-riscv@lists.infradead.org; Tue, 01 Jan 2019 19:07:46 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x01J7Nmn015118; Tue, 1 Jan 2019 19:07:25 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-82-5c2bba6aaa1d
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 D9.F4.09052.A6ABB2C5; Tue,  1 Jan 2019 21:07:22 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x01J7Mjg031185; Tue, 1 Jan 2019 21:07:22 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 01 Jan 2019 21:07:22 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: Wiki for Linux development
Organization: FORTH
In-Reply-To: <4e2b9e9f-d2e2-e5a4-4553-88babc553e18@sifive.com>
References: <8033884262d72a7a3edcce50c821f9fa@mailhost.ics.forth.gr>
 <4e2b9e9f-d2e2-e5a4-4553-88babc553e18@sifive.com>
Message-ID: <28756b6088e9d6d5a2faaf3c16f95255@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsXSHc2orJu1SzvG4NMlG4ttn1vYLJrfnWO3
 aJvF78Ds8XDTJSaPzUvqPS41X2cPYI7isklJzcksSy3St0vgymh9/YSx4DtrxcSHsQ2MF1i6
 GDk5JARMJLq+NjJ3MXJxCAkcZpRYcvsTG4RzkFHiUdtyqCpTidl7OxlBbF4BQYmTM5+AxZkF
 LCSmXtnPCGHLSzRvnc0MYrMIqEqcn32MHcRmE9CUmH/pIFi9iICOxLwVB9gg6j0kri3fAVYv
 LKAuMb35P5jNLyAs8enuRVYQm1PATmLKoglMILaQQIXEpZ4TzBA3uEjM3LCAFeI2FYkPvx+A
 7RIVUJZ4cWI66wRGoVlITp2F5NRZSE5dwMi8ilEgscxYLzO5WC8tv6gkQy+9aBMjOJjn+u5g
 PLfA/hCjAAejEg+vQLl2jBBrYllxZe4hRgkOZiUR3q5moBBvSmJlVWpRfnxRaU5q8SFGaQ4W
 JXHewy/Cg4QE0hNLUrNTUwtSi2CyTBycUg2MO2IUJ3671/Lgzcb2ApZZu05sso0u/cC98X7v
 r3qevG3bd56wba/5ZuDE6FgQcnKXXY7fpmepNg/26lhILBHmmdPF6bQzNfVagR7/2ZsdGiwS
 jLPkqyLtzodvt1a3uGuUFMM/cdK8riVJk47v4JjF86NuxgvrpJkPy9V3xWmrRcuyxjVVZW9Q
 YinOSDTUYi4qTgQAm86h+GICAAA=
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Tue, 01 Jan 2019 19:07:25 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Tue, 01 Jan 2019 19:07:25 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190101_110745_013565_AB1FD458 
X-CRM114-Status: UNSURE (   6.29  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wMS0wMSAwMToxMSwgUGF1bCBXYWxtc2xleSDOrc6zz4HOsc+IzrU6Cj4g
UHJvYmFibHkgYmV0dGVyIHRvIGhhdmUgaXQgaG9zdGVkIG9uIGtlcm5lbC5vcmcuCj4gCj4gVGhh
dCB3YXkgaXQncyBoYW5kbGVkIHRoZSBzYW1lIHdheSBhcyBhbG1vc3QgYWxsIG9mIHRoZSByZXN0
IG9mIHRoZQo+IHdpa2kua2VybmVsLm9yZyB3aWtpcy4KPiAKPiAtIFBhdWwKPiAKCldlIGNhbid0
IGhvc3QgYW55dGhpbmcgZWxzZSBpZiB3ZSBnbyB0aGlzIHdheSArIHdlIGNhbid0IGFkZCBhbnkg
YWRkb25zIAppZiB3ZSB3YW50LiBJJ20gb2sgd2l0aCBtb3ZpbmcgaXQgaWYgdGhhdCdzIHdoYXQg
dGhlIHRlYW0gd2FudHMsIHNpbmNlIApkb2N1d2lraSB1c2VzIHNpbXBsZSBmaWxlcyBmb3Igc3Rv
cmFnZSBpbnN0ZWFkIG9mIGEgZGF0YWJhc2UsIHdlIGNhbiAKanVzdCBjb3B5IHRoZW0gb3ZlciBp
ZiB3ZSB3YW50IHRvIGhvc3QgaXQgb24gd2lraS5rZXJuZWwub3JnIGRpcmVjdGx5LiAKSG93ZXZl
ciBzbyBmYXIga29yZyBoZWxwZGVzayBoYXNuJ3QgcmVwbGllZCBvbiB0aGUgdGlja2V0IEkgb3Bl
bmVkIGFib3V0IAphIGNuYW1lIGVudHJ5LCBJIGRvbid0IGtub3cgd2hhdCdzIGdvaW5nIG9uLCBp
dCdzIGJlZW4gdGhlcmUgZm9yIG1vbnRocy4gCkkgdGhvdWdodCBhZGRpbmcgYSBjbmFtZSBzaG91
bGQgYmUgc2ltcGxlciB0aGFuIGhvc3RpbmcgYW5vdGhlciB3aWtpLgoKUmVnYXJkcywKTmljawoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
