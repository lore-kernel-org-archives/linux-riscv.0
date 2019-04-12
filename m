Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496F6C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 16:09:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 186FC21872
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 16:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BMFTtqFO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 186FC21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ELlc/c97fCDs2dYn8aisGQ4rxp5IinxvTMvmjpZ1P+4=; b=BMFTtqFOIcS4Kqpa2d4UVR++p
	ohoteGRx1GadY0yrcG64VC2CuZROWjPBOhNz20+5shNljTdvygNywwrAP057+hnVUOQSRdmjJhhUG
	R5whDmOvLnzTVykEFakhe+RmNL9w68wEY5ep7du9iFnQ42t376GoJQSQBlJvVbD2DkiAXM4+U6Omg
	35mtWtNxkg/u+Jabua0aXyM/FJH1rGtrFcsybNR9CoOSd502O5zs1uAHltxop/D7fzOmvCLBl6kz0
	aWJSoSdOt1WTvEdIWt7GltJEaOa50QCaOvfEyleObCirb5iJlg+HLBSAt50mbdQ+BYJQVOZ9E5gmD
	/X3kp8NjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEyk4-0002jR-6p; Fri, 12 Apr 2019 16:09:28 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEyk1-0002is-AN
 for linux-riscv@lists.infradead.org; Fri, 12 Apr 2019 16:09:26 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x3CG97QA010766; Fri, 12 Apr 2019 16:09:09 GMT
X-AuditID: 8b5b9d4d-90dff7000000235c-d9-5cb0b823cbe9
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 C2.CA.09052.328B0BC5; Fri, 12 Apr 2019 19:09:07 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x3CG97v5021914; Fri, 12 Apr 2019 19:09:07 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 12 Apr 2019 19:09:07 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/12] riscv: print the unexpected interrupt cause
Organization: FORTH
In-Reply-To: <20190412143948.12478-12-hch@lst.de>
References: <20190412143948.12478-1-hch@lst.de>
 <20190412143948.12478-12-hch@lst.de>
Message-ID: <3b468801f4bae9cf6f162c15b768257b@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Fri, 12 Apr 2019 16:09:09 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Fri, 12 Apr 2019 16:09:09 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_090925_718157_7AB58522 
X-CRM114-Status: UNSURE (   8.39  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wNC0xMiAxNzozOSwgQ2hyaXN0b3BoIEhlbGx3aWcgzq3Os8+BzrHPiM61
Ogo+IFRoaXMgaGFzIGJlZW4gaGVscGZ1bCB3aGVuIGRlYnVnZ2luZyBteSBwZW5kaW5nIG5vbW11
IHBvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2lycS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9pcnEuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jCj4gaW5kZXggNDhl
NmI3ZGI4M2ExLi5jNzM4MTMyZWVjZjggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
aXJxLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYwo+IEBAIC01NCw3ICs1NCw4IEBA
IGFzbWxpbmthZ2Ugdm9pZCBfX2lycV9lbnRyeSBkb19JUlEoc3RydWN0IHB0X3JlZ3MgCj4gKnJl
Z3MpCj4gIAkJaGFuZGxlX2FyY2hfaXJxKHJlZ3MpOwo+ICAJCWJyZWFrOwo+ICAJZGVmYXVsdDoK
PiAtCQlwYW5pYygidW5leHBlY3RlZCBpbnRlcnJ1cHQgY2F1c2UiKTsKPiArCQlwcl9hbGVydCgi
dW5leHBlY3RlZCBpbnRlcnJ1cHQgY2F1c2UgMHglbHgiLCByZWdzLT5zY2F1c2UpOwo+ICsJCUJV
RygpOwo+ICAJfQo+ICAJaXJxX2V4aXQoKTsKClJldmlld2VkLWJ5OiBOaWNrIEtvc3NpZmlkaXMg
PG1pY2tAaWNzLmZvcnRoLmdyPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
