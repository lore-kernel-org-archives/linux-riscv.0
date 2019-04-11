Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DB1C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:52:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DE12082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jcpMQSUu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9DE12082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Qdmz2YwicfD7pBk8pLPoyF6NuCpl8tWEOryRNcdGgs=; b=jcpMQSUuWC9NfhpM0A6sC+PcM
	U9Y3E+eTAXhDDxnaBbafuSzn9sItXB5eiNi8YNZTRrQaVsYz/oP0+0VEioKxW8BseV7K/LOwEX4aV
	q02pD+ryOKkwhpcpjowlTXKL36q5gD47VsDJR6qJQb8avrgYMMRbjle/qVwj7p38FgvDuBEaFqXxx
	qa3CwuAfYXrKiCErYkV43hJOqEF9LgGD92ELLSOvr3ThTlfSYxiqM9H+pOk1lreBjF+b9eN5hU2Lj
	q3EkhT8/7oNPWWinwVOcP7li/a88MJgRPkfSIVGExvv0sGom3y+l48o70WkIE/CsdZIyGWWaYUrq+
	DhVjBwb6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEbzo-0006uJ-P0; Thu, 11 Apr 2019 15:52:12 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEbzm-0006tR-C7
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 15:52:12 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x3BFq6WB012590; Thu, 11 Apr 2019 15:52:08 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-ce-5caf62a6109a
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 A1.B9.09052.6A26FAC5; Thu, 11 Apr 2019 18:52:06 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x3BFq69x000511; Thu, 11 Apr 2019 18:52:06 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 11 Apr 2019 18:52:06 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 8/9] riscv: print the unexpected interrupt cause
Organization: FORTH
In-Reply-To: <20190411115623.5749-9-hch@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-9-hch@lst.de>
Message-ID: <79115ffcf1cd752c3c0fed37c45d9b8d@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 11 Apr 2019 15:52:08 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 11 Apr 2019 15:52:08 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_085210_778117_A44A2EB4 
X-CRM114-Status: UNSURE (   8.29  )
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
Ogo+IFRoaXMgaGFzIGJlZW4gaGVscGZ1bCB3aGVuIGRlYnVnZ2luZyBteSBwZW5kaW5nIG5vbW11
IHBvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2lycS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9pcnEuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jCj4gaW5kZXggNDhl
NmI3ZGI4M2ExLi5iMTBhZjhjY2Q2NTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
aXJxLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYwo+IEBAIC01NCw3ICs1NCw4IEBA
IGFzbWxpbmthZ2Ugdm9pZCBfX2lycV9lbnRyeSBkb19JUlEoc3RydWN0IHB0X3JlZ3MgCj4gKnJl
Z3MpCj4gIAkJaGFuZGxlX2FyY2hfaXJxKHJlZ3MpOwo+ICAJCWJyZWFrOwo+ICAJZGVmYXVsdDoK
PiAtCQlwYW5pYygidW5leHBlY3RlZCBpbnRlcnJ1cHQgY2F1c2UiKTsKPiArCQlwcl9hbGVydCgi
dW5leHBlY3RlZCBpbnRlcnJ1cHQgY2F1c2UgMHglbHgiLCByZWdzLT54Y2F1c2UpOwo+ICsJCUJV
RygpOwo+ICAJfQo+ICAJaXJxX2V4aXQoKTsKCkRpZCB5b3UgbWVhbiByZWdzLT5zY2F1c2UgPyBU
aGVyZSBpcyBubyB4Y2F1c2UgZmllbGQgb24gc3RydWN0IHB0X3JlZ3MgCmFuZAphbHNvIHRoZXJl
IGlzIG5vIHN1Y2ggcmVnaXN0ZXIgbmFtZToKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xp
bnV4L2Jsb2IvbWFzdGVyL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNlLmgKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
