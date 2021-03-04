Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4FBC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 17:35:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FE4264F5C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 17:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FE4264F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=in9G7X4Cl6zumuyhwqDNazJyMU0vXcjSpqNlll0RTDg=; b=qtlD6435FzfyD6K5cWt1E3ORz
	n+xmqrpLPRfSO5ArbT6UwRXcYC10Kisarx1BHiH0Mz0KJMjlZZfR9JhfRAgpxJfbrdb3WgswUxV3R
	3mjdrOGgbNenRTm5AcenXgtk324fh4E8iG4+Gp4KNSI1FD84K2qCz73Ehvkpoan2iNifco1N5zqN8
	kBHoKC4MEb5Xs31jnLp+cENtIvTQVELLMVscjIyD2rDs9m/GMoGfQKFsD1D9eHRqPY7kvW7mbpwUO
	0PVQdQp6aer8rUBOKfnfsSv9iBrNt7ZQG9scZBCzpQHuHT8+DJliKG1LaGYPyryHoMd6RuaNKGwVs
	g6EDFJPaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHrsg-009RZa-LG; Thu, 04 Mar 2021 17:35:23 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHrsZ-009RY6-GH
 for linux-riscv@lists.infradead.org; Thu, 04 Mar 2021 17:35:18 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 124HZ6Kg085380; Thu, 4 Mar 2021 19:35:06 +0200 (EET)
X-AuditID: 8b5b014d-a70347000000209f-d2-60411a44accb
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 72.21.08351.44A11406; Thu,  4 Mar 2021 19:35:01 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 04 Mar 2021 19:35:00 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Gary Guo <gary@garyguo.net>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: enable TIME CSR in U mode
Organization: FORTH
In-Reply-To: <20210216221208.2860-1-gary@garyguo.net>
References: <20210216221208.2860-1-gary@garyguo.net>
Message-ID: <e50f40a65f10e40c8d601791c0856cc6@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsXSHT1dWddVyjHB4MUHJouLZ14zWmz73MLm
 wOSxpPMXk8fmJfUBTFFcNimpOZllqUX6dglcGbsenGQsuMVbcWptG1MD41OuLkZODgkBE4m/
 bx4zdjFycQgJHGOUaG44xAyRMJWYvbeTEcTmFRCUODnzCQuIzSxgITH1yn5GCFteonnrbLB6
 FgFVib4Hc9hAbDYBTYn5lw6C1YsA1WxatYgJol5Z4tjaXrC4MND8vXdfg8X5BYQlPt29yNrF
 yMHBCRSfdCEAJCwEdNuJT3NYIE5wkWicPYER4jQViQ+/H7CDlIsC2ZvnKk1gFJyF5NBZSA6d
 heTQBYzMqxgFEsuM9TKTi/XS8otKMvTSizYxgsOT0XcH4+3Nb/UOMTJxMB5ilOBgVhLhFX9p
 myDEm5JYWZValB9fVJqTWnyIUZqDRUmcl1dvQryQQHpiSWp2ampBahFMlomDU6qBSWrtEyYL
 j5i3il/Z19/fNHvRo5qj7iUOXjMO33znq/475GD71xivq5t8rq69oFyp+n2R1uS/qaZyYnX2
 kuV1Kz5OvDnp2c4I/7pvtuf5j7WL6W3p9XQqZdy0WDC1+9CPx1euOU/awpee/Ewp1qHsFSvT
 rquXXOYvfCj7JPnOc57YK2+LdxzJm/pS+MQpzfd+RVuFIt58PHFysmmkL5vkxePdnge+vW1p
 5Y6tP1Lgab9MPtkhO2bCDvnCF1Nut52NfHXN+fbKSEeG8se6M/X1nM4fWzmn1CDi0FPjtaxp
 qfeMX690+mt+TSTrtIayQu9zcf/X9x7eENP7dFk2w3aLmcwu9Tl7pbe9Wb1S9dO34jglluKM
 REMt5qLiRACBWF0JvgIAAA==
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

zqPPhM65z4IgMjAyMS0wMi0xNyAwMDoxMiwgR2FyeSBHdW8gzq3Os8+BzrHPiM61Ogo+IEFmdGVy
IGFkNWQxMTIgd2UgbGV0IHRoZSB1c2VyIG1vZGUgdG8gdXNlIHJkdGltZSBkaXJlY3RseSBmb3Ig
dGltZQo+IGFjY2Vzcy4gVGhpcyB3b3JrcyBpZiB0aGUgaGFyZHdhcmUgZG9lcyBub3QgaW1wbGVt
ZW50IHRoZSBUSU1FIENTUgo+IGFuZCB0cmFwcyB0byB0aGUgZmlybXdhcmUuIFRoZSBzcGVjIGhv
d2V2ZXIgZG9lcyBhbGxvdyBhIGhhcmR3YXJlCj4gaW1wbGVtZW50YXRpb24gdG8gcmVkaXJlY3Qg
dGhlIENTUiBhY2Nlc3MgdG8gdGhlIG1lbW9yeS1tYXBwZWQgTVRJTUUKPiBDU1IsIGFuZCBpZiB0
aGlzIGlzIHBlcmZvcm1lZCBpdCB3aWxsIGNoZWNrIHtNLFN9Q09VTlRFUkVOIENTUiB0bwo+IHNl
ZSBpZiBpdCBpcyBhbGxvd2VkLgo+IAo+IFRvIHByZXZlbnQgdW5oYW5kbGVkIGlsbGVnYWwgaW5z
dHJ1Y3Rpb24gZmF1bHQgb24gdGhlc2UgcGxhdGZvcm1zLAo+IHdlIGNhbiByZXF1ZXN0IHRoZXNl
IENTUnMgdG8gYmUgZW5hYmxlZCBpbiBVLW1vZGUuIEZvciBwbGF0Zm9ybXMKPiB0aGF0IGRvZXMg
bm90IHN1cHBvcnQgdGhlIFRJTUUgQ1NSIHRvIE1USU1FIENTUiBjb252ZXJzaW9uLCB0aGV5Cj4g
d2lsbCBoYXJkd2lyZSBjb3JyZXNwb25kaW5nIGJpdCBpbiBDT1VOVEVSRU4gdG8gemVybyBhbmQg
dGhpcyB3b3VsZAo+IGJlIGEgbm8tb3AuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2FyeSBHdW8gPGdh
cnlAZ2FyeWd1by5uZXQ+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyB8IDYgKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gaW5k
ZXggMGE0ZTgxYjhkYzc5Li41YTdhNjIxOTAzNDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvaGVhZC5TCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gQEAgLTE5MCw2
ICsxOTAsOSBAQCBFTlRSWShfc3RhcnRfa2VybmVsKQo+ICAuYWxpZ24gMgo+ICBwbXBfZG9uZToK
PiAKPiArCS8qIEFsbG93IHVzZXItbW9kZSB0byBhY2Nlc3MgdGltZSBDU1IgKi8KPiArCWNzcncs
IENTUl9NQ09VTlRFUkVOLCAyCj4gKwo+ICAJLyoKPiAgCSAqIFRoZSBoYXJ0aWQgaW4gYTAgaXMg
ZXhwZWN0ZWQgbGF0ZXIgb24sIGFuZCB3ZSBoYXZlIG5vIGZpcm13YXJlCj4gIAkgKiB0byBoYW5k
IGl0IHRvIHVzLgo+IEBAIC0xOTcsNiArMjAwLDkgQEAgcG1wX2RvbmU6Cj4gIAljc3JyIGEwLCBD
U1JfTUhBUlRJRAo+ICAjZW5kaWYgLyogQ09ORklHX1JJU0NWX01fTU9ERSAqLwo+IAo+ICsJLyog
QWxsb3cgdXNlci1tb2RlIHRvIGFjY2VzcyB0aW1lIENTUiAqLwo+ICsJY3NydyBDU1JfU0NPVU5U
RVJFTiwgMgo+ICsKPiAgCS8qIExvYWQgdGhlIGdsb2JhbCBwb2ludGVyICovCj4gIC5vcHRpb24g
cHVzaAo+ICAub3B0aW9uIG5vcmVsYXgKClNob3VsZG4ndCB3ZSB1c2UgY3NycnMgaGVyZSB0byBw
cmVzZXJ2ZSBjdXJyZW50IHNldHRpbmdzIGZyb20gdGhlIApmaXJtd2FyZSA/IEFsc28gT3BlblNC
SSBhdCB0aGlzIHBvaW50IHNldHMgYm90aCBNQ09VTlRFUkVOL1NDT1VOVEVSRU4gdG8gCi0xLCBk
b2VzIGFueW9uZSBlbHNlIG1vZGlmeSB0aGF0IHZhbHVlID8KClJlZ2FyZHMsCk5pY2sKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
