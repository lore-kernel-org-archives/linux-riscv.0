Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA3DC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00iAZeeZ54nTxXW+lL54SBTq8J5Q1O/ptd6pxvgQzuc=; b=S+16U1/DyLtYZM
	Lb8Xn5Ta7ZhYjayR6CsyrI1eVqvMsNsJBZOzmcwfRycVFZHgWEAt5CLBKNZ8jHPkc6hc6RRo5HXS0
	1eCdzV0dGoL25d2Q4Uy63dKeijy0DmUGcbTqs2LuHsRyVc4BP2iFGAiUd4G9XHfTUKQXpw+NO2XX6
	CqCiqg0vtUUlHqD1ovFiekgfdNtG7vsPtHQvSL89s7vJD44kQ63oK7DK9PwBTsIvta1KoACwQplFA
	opt37jpKJHnxguhIsyh9pwMMkCdoYj4tuCJQ7sE1vYGB7LFjSDPJo1myVphC97g5eUdTrIJez7r6u
	d4DvajTGMkRafmKvifNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjiH-0000000Fky0-36sf;
	Tue, 30 Jan 2024 08:43:25 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjiD-0000000FkvI-3IMN
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 08:43:24 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 940F18557C; Tue, 30 Jan 2024 09:40:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1706604125; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=IcunDJOrwyktUeS70fPV6gHlraSY8X9EVyj4jwrOVL8orCWlOcA0BbNgVXb+LncsE
	 5TgHLpx4J9V2617rs8w+AaWKMfBAIXf2q7NZFmeK1QQB5XuOhpoB+yxGii4Y3PMjEK
	 uGXHcjtA3KUW3NCCap/ZHBu2iZ+jO51mtN4+oOjQuxoXtsd1C5BZuID7+S6tmH0vJf
	 zsRpdDUXR19TbFqacfSvodiY52+pE1Gb75kjwiQkU02w0+J19jelbTeIC6ZJRr+2Sg
	 2rFDUuzltwYZP5e8Ga2VhK2R0XH/9ihbosPNwCVaqau2Mbz9m/QT4u9L9jrzaeVi90
	 g+ooW8jN/alTw==
Received: by mail.quirkbyte.pl for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 08:40:32 GMT
Message-ID: <20240130084500-0.1.z.ic77.0.1npeifanf6@quirkbyte.pl>
Date: Tue, 30 Jan 2024 08:40:32 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_004322_591654_3BA523BA 
X-CRM114-Status: UNSURE (   1.92  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAogCkN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIG1vbnRhxbwgc3lzdGVtdSBm
b3Rvd29sdGFpY3puZWdvPwogCkluc3RhbGFjamEgZm90b3dvbHRhaWN6bmEgamVzdCBuYWpsZXBz
enltIHNwb3NvYmVtIG5hIG9ibmnFvGVuaWUgd3lzb2tvxZtjaSByYWNodW5rw7N3IHphIHByxIVk
IChwb3pvc3RhasSFIHR5bGtvIG9wxYJhdHkgc3RhxYJlKSBpIHphYmV6cGllY3plbmllIHNpxJkg
cHJ6ZWQgcm9zbsSFY3ltaSBjZW5hbWkgZW5lcmdpaSBlbGVrdHJ5Y3puZWouIEplc3QgdG8gdyBw
ZcWCbmkgb2RuYXdpYWxuZSBpIGJlemVtaXN5am5lIMW6csOzZMWCbyBlbmVyZ2lpLCBkemnEmWtp
IGN6ZW11IHByenljenluaWFteSBzacSZIGRvIG9jaHJvbnkgxZtyb2Rvd2lza2EgbmF0dXJhbG5l
Z28uCiAKRHppYcWCYW15IG9kIHdpZWx1IGxhdCBuYSByeW5rdSBlbmVyZ2V0eWN6bnltLiBQcnp5
Z290dWplbXkgcHJvamVrdCwgd3ljZW7EmSBvcmF6IGtvbXBsZWtzb3dvIHd5a29uYW15IGkgemfF
gm9zaW15IHJlYWxpemFjasSZIGRvIHpha8WCYWR1IGVuZXJnZXR5Y3puZWdvLiAKIApDenkgY2hj
xIUgUGHFhHN0d28gcG96bmHEhyBuYXN6xIUgcHJvcG96eWNqxJk/ICAKCgpQb3pkcmF3aWFtCk5v
cmJlcnQgS2FyZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
