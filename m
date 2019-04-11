Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5D3C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:43:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF24217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oNy5tOxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF24217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ueQ2vfFWIJesX4LqiRu2RSH5KjuEvYAeX0AZqUenVP0=; b=oNy5tOxe1LCPvBC3ClBY2DtFY
	YllnZfMu9jKId+AVA2jrZMi84pBRt2qmccOHn9LdjUbchxhlK5tuiRedTCcYFe+Fe8HDc9LmANJXp
	KsibHOU/bynbGm+E03LTEGoxorz08kmEUT/iRJhnDLatQENyb9PXo44dVdiFURhknK9mfd/g9Sjyi
	zCcSJoFbF5ZuN1IPQfpLasIuFipPdmt6ztf5jvNR+Ossmw4+sQobSy8HojBoJmzQI6Fp+PEcWMDaU
	JfuJvLSekfVMf34KT98657zjXTU/uM6hjR/UOZJuE2uWr1S24StdlmgeQoN0lMB+sX4axTyeWUqD2
	8OKbHOaXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEbrE-00028P-CL; Thu, 11 Apr 2019 15:43:20 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEbrA-00026Y-O4
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 15:43:18 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x3BFhChB012250; Thu, 11 Apr 2019 15:43:14 GMT
X-AuditID: 8b5b9d4d-90dff7000000235c-a5-5caf6090eab7
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 FF.A9.09052.0906FAC5; Thu, 11 Apr 2019 18:43:12 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x3BFhCcb029739; Thu, 11 Apr 2019 18:43:12 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 11 Apr 2019 18:43:12 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/9] riscv: also clear all pending interrupts when booting
Organization: FORTH
In-Reply-To: <20190411115623.5749-7-hch@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-7-hch@lst.de>
Message-ID: <2b1755c3aafd31c21905ba77a4ce2ad9@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 11 Apr 2019 15:43:14 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 11 Apr 2019 15:43:14 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_084317_148684_A9099DD3 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wNC0xMSAxNDo1NiwgQ2hyaXN0b3BoIEhlbGx3aWcgzq3Os8+BzrHPiM61
Ogo+IEp1c3QgaW4gY2FzZSBhbiBvbGQgaW50ZXJydXB0IGlzIHBlbmRpbmcgbWFrZSBzdXJlIHdl
IGNsZWFyIGV2ZXJ5dGhpbmcKPiBhc3NlcnRlZCBiZWZvcmUgdGhpcyBrZXJuZWwgc3RhcnRlZC4g
IEJhc2VkIG9uIHNpbWlsYXIgTS1tb2RlIGNvZGUgaW4KPiBvcGVuc2JpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9oZWFkLlMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQu
UyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+IGluZGV4IDkzNDRkOWNlZGEyNC4uNjJkMmM5
Yzg1NDMzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+IEBAIC0yMiw4ICsyMiw5IEBACj4gCj4gIF9fSU5JVAo+
ICBFTlRSWShfc3RhcnQpCj4gLQkvKiBNYXNrIGFsbCBpbnRlcnJ1cHRzICovCj4gKwkvKiBNYXNr
IGFuZCBjbGVhciBhbGwgaW50ZXJydXB0cyAqLwo+ICAJY3NydyBzaWUsIHplcm8KPiArCWNzcncg
c2lwLCB6ZXJvCj4gCj4gIAkvKiBMb2FkIHRoZSBnbG9iYWwgcG9pbnRlciAqLwo+ICAub3B0aW9u
IHB1c2gKClJldmlld2VkLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
