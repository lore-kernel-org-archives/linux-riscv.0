Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00AEC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:40:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710772083E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jzfb+/hH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 710772083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2YC0jF5Yrv1/w753dQt1/rFh8DNQgDTnf/RgApkflmY=; b=Jzfb+/hHt79OSHm4rnSBpnbbB
	ebZNn4OAmO6CRdetojlIJnnEPMTh/x1fxIrc9p6n2zqtw030OUUsUnb6e7wnAWhoTIcBJp9uldpDx
	yBlgSyywIZ0p6MJx2qX2SpYsxU1+UrgN4iQX9QhT+xj4UBNoyKBAwu6qY0/4+jvfSSCA9FC+YYKRV
	k6z7fpDHKPRK4LaZP6Z/ibRPS9jszGEvULVvJ0BPzRO7rTKuoN2BC3LF3HvwPkdnV973l8MkZoLiv
	l4gyrQA6ftJpekGIEjTzSx7VB6+p+V2wDSBpTb6QdfSQsG/8WtjxxRCZJ1r5lIz/XzLLUS2R9LIX1
	3Sdlx6Inw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEboS-0001T1-Tb; Thu, 11 Apr 2019 15:40:28 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEboP-0001JH-HD
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 15:40:28 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x3BFe78L012137; Thu, 11 Apr 2019 15:40:09 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-94-5caf5fd7d352
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 7F.A9.09052.7DF5FAC5; Thu, 11 Apr 2019 18:40:07 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x3BFe70V029488; Thu, 11 Apr 2019 18:40:07 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 11 Apr 2019 18:40:07 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/9] riscv: remove dead big endian code
Organization: FORTH
In-Reply-To: <20190411115623.5749-3-hch@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-3-hch@lst.de>
Message-ID: <3382adaf8be0b44af9ebb8b7528cac41@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 11 Apr 2019 15:40:09 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 11 Apr 2019 15:40:09 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_084026_136078_15201135 
X-CRM114-Status: GOOD (  10.48  )
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
Ogo+IFJJU0MtViBpcyBhbHdheXMgbGl0dGxlIGVuZGlhbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS91YWNjZXNzLmggfCA5ICstLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdWFjY2Vzcy5oIAo+IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBp
bmRleCBjYzViMjUzZDRjNTcuLjVjNTBlZDZmOGM5MyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFj
Y2Vzcy5oCj4gQEAgLTk5LDE1ICs5OSw4IEBAIHN0YXRpYyBpbmxpbmUgaW50IF9fYWNjZXNzX29r
KHVuc2lnbmVkIGxvbmcgYWRkciwKPiB1bnNpZ25lZCBsb25nIHNpemUpCj4gICAqIG9uIG91ciBj
YWNoZSBvciB0bGIgZW50cmllcy4KPiAgICovCj4gCj4gLSNpZiBkZWZpbmVkKF9fTElUVExFX0VO
RElBTikKPiAtI2RlZmluZSBfX01TVwkxCj4gICNkZWZpbmUgX19MU1cJMAo+IC0jZWxpZiBkZWZp
bmVkKF9fQklHX0VORElBTikKPiAtI2RlZmluZSBfX01TVwkwCj4gLSNkZWZpbmUJX19MU1cJMQo+
IC0jZWxzZQo+IC0jZXJyb3IgIlVua25vd24gZW5kaWFubmVzcyIKPiAtI2VuZGlmCj4gKyNkZWZp
bmUgX19NU1cJMQo+IAo+ICAvKgo+ICAgKiBUaGUgIl9feHh4IiB2ZXJzaW9ucyBvZiB0aGUgdXNl
ciBhY2Nlc3MgZnVuY3Rpb25zIGRvIG5vdCB2ZXJpZnkgdGhlIAo+IGFkZHJlc3MKCiBGcm9tIHRo
ZSBJU0EgbWFudWFsOgoKIldlIGNob3NlIGxpdHRsZS1lbmRpYW4gYnl0ZSBvcmRlcmluZyBmb3Ig
dGhlIFJJU0MtViBtZW1vcnkgc3lzdGVtIApiZWNhdXNlCmxpdHRsZS1lbmRpYW4gc3lzdGVtcyBh
cmUgY3VycmVudGx5IGRvbWluYW50IGNvbW1lcmNpYWxseSAoYWxsIHg4NiAKc3lzdGVtczsKaU9T
LCBBbmRyb2lkLCBhbmQgV2luZG93cyBmb3IgQVJNKS4gQSBtaW5vciBwb2ludCBpcyB0aGF0IHdl
IGhhdmUgYWxzbyAKZm91bmQKbGl0dGxlLWVuZGlhbiBtZW1vcnkgc3lzdGVtcyB0byBiZSBtb3Jl
IG5hdHVyYWwgZm9yIGhhcmR3YXJlIGRlc2lnbmVycy4KSG93ZXZlciwgY2VydGFpbiBhcHBsaWNh
dGlvbiBhcmVhcywgc3VjaCBhcyBJUCBuZXR3b3JraW5nLCBvcGVyYXRlIG9uCmJpZy1lbmRpYW4g
ZGF0YSBzdHJ1Y3R1cmVzLCBhbmQgY2VydGFpbiBsZWdhY3kgY29kZSBiYXNlcyBoYXZlIGJlZW4g
CmJ1aWx0CmFzc3VtaW5nIGJpZy1lbmRpYW4gcHJvY2Vzc29ycywgc28gd2UgZXhwZWN0IHRoYXQg
ZnV0dXJlIHNwZWNpZmljYXRpb25zIAp3aWxsCmRlc2NyaWJlIGJpZy1lbmRpYW4gb3IgYmktZW5k
aWFuIHZhcmlhbnRzIG9mIFJJU0MtVi4iCgpJIGRvbid0IHRoaW5rIHdlIGNhbiBkZWZpbml0ZWx5
IHNheSB0aGF0IFJJU0MtViB3aWxsIGFsd2F5cyBoYXZlIGEgCmxpdHRsZS1lbmRpYW4sCm1lbW9y
eSBzeXN0ZW0gb25seSB0aGF0IGl0IGlzIGxpdHRsZS1lbmRpYW4gZm9yIG5vdy4gQWxzbyB0aGlz
IGNvZGUgYWN0cyAKYXMgYSBjaGVjaywKSSdkIHByZWZlciBpZiB5b3UgcHV0IGFuIGVycm9yIChz
b21ldGhpbmcgbGlrZSAidW5zdXBwb3J0ZWQgZW5kaWFuZXNzLCAKY2hlY2sgeW91cgp0b29sY2hh
aW4iKSBpbiBjYXNlIF9fQklHX0VORElBTiB3YXMgZGVmaW5lZCBpbnN0ZWFkIG9mIGNvbXBsZXRl
bHkgCnJlbW92aW5nIHRoZQpjaGVjay4KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
