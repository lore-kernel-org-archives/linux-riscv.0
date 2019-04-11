Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E6CC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:38:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EF012146F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fGwtfyYf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EF012146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vVcEU2KAY1heDF/nztU4rjB4+29YNTqQ/nZo7Wtiy0c=; b=fGwtfyYfc0dCkjwK7bsdxAYUM
	IjlK22zrjeEg4YakM1QCxlgnSlU4IHw4z/tCNdDRjahbAvFx7ENAcBrqpS3tbcHD08jRrOC7LMuPb
	bOKzWZrIHfpwFUD9qwX/cazz/b9/LYdoOaTXhB+YJYIjdm99nuqOED3VAlqIeWqPRUONwYOoAOYXQ
	RFPRoJX/Bqt96U+wIbDV43f5jHGaM3NZT2fYt+zVX6GI6zD/i8oZFECBmy/W26UX9n5jLRCm9dj6/
	0DfoVyKrrhA1eIEwONMO3m+MRJef1YwxJ5ISivg4GtdoEoVXUpsSnnxTsGTW6wz3yplNEjtKy5BkP
	weoFakJfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEcj2-0006Fb-0h; Thu, 11 Apr 2019 16:38:56 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEciz-0006FI-98
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 16:38:55 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x3BGci6u014220; Thu, 11 Apr 2019 16:38:51 GMT
X-AuditID: 8b5b9d4d-90dff7000000235c-cf-5caf6d9b359d
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 EE.B9.09052.B9D6FAC5; Thu, 11 Apr 2019 19:38:51 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x3BGcpeG013172; Thu, 11 Apr 2019 19:38:51 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 11 Apr 2019 19:38:51 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/9] riscv: remove duplicate macros from ptrace.h
Organization: FORTH
In-Reply-To: <20190411161706.GA25465@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-8-hch@lst.de>
 <25d179157667295a1cb1bf53e5eb66ee@mailhost.ics.forth.gr>
 <8e0db47120668612b1814504a7054462@mailhost.ics.forth.gr>
 <2a436f2edd8c1ad0ae32ec05415475e9@mailhost.ics.forth.gr>
 <20190411161706.GA25465@lst.de>
Message-ID: <f9004d5de641d2ce060409dd6c3ce7f2@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 11 Apr 2019 16:38:51 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 11 Apr 2019 16:38:51 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_093853_680693_D4EB0E86 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wNC0xMSAxOToxNywgQ2hyaXN0b3BoIEhlbGx3aWcgzq3Os8+BzrHPiM61
Ogo+IE9uIFRodSwgQXByIDExLCAyMDE5IGF0IDA3OjAzOjQ4UE0gKzAzMDAsIE5pY2sgS29zc2lm
aWRpcyB3cm90ZToKPj4gSSdtIHNvcnJ5IEkgYWRkZWQgdGhlIFJldmlld2VkLWJ5IHRhZyB0b28g
c29vbiwgSSdtIGFsbCBpbiBmb3IgdGhlIAo+PiBjbGVhbnVwCj4+IGJ1dCBJCj4+IGJlbGlldmUg
aXQncyBtdWNoIHNpbXBsZXIsIGFsbCBvZiB0aGVzZSBhcmUgcmUtZGVmaW5lZCBvbgo+PiBpbmNs
dWRlL2FzbS1nZW5lcmljL3B0cmFjZS5oIGFueXdheSwgYWxsIHdlIGhhdmUgdG8gZG8gaXMgZGVm
aW5lIAo+PiBHRVRfRlAgYW5kCj4+IEdFVF9VU1AKPj4gKG9yIHJlbmFtZSByZWdzLT5zcCB0byBy
ZWdzLT51c3ApLgo+IAo+IFdlIGRvbid0IHVzZSBpbmNsdWRlL2FzbS1nZW5lcmljL3B0cmFjZS5o
IG9uIFJJU0MtViwgYW5kIEkgZG9uJ3QgcmVhbGx5Cj4gc2VlIGEgZ29vZCByZWFzb24gdG8gc3Rh
cnQgdXNpbmcgaXQuICBRdWl0ZSB0byB0aGUgY29udHJhcnksIEkgdGhpbmsgd2UKPiBjYW4gcmVt
b3ZlIHRoYXQgZmlsZSBhbmQgYXBwbHkgYSBzaW1pbGFyIGNsZWFudXAgYXMgaW4gdGhpcyBwYXRj
aCB0byAKPiB0aGUKPiBmZXcgYXJjaGl0ZWN0dXJlcyBjdXJyZW50bHkgdXNpbmcgaXQuCgpJIHRo
aW5rIHRoZSBwb2ludCBpcyB0byBhdm9pZCBjb2RlLWR1cGxpY2F0aW9uIGFuZCBlbmZvcmNlIGEg
c3RhbmRhcmQgCndheQpvZiBhY2Nlc3NpbmcgdGhlc2UgcmVnaXN0ZXJzICh0aGVzZSBzdGF0aWMg
aW5saW5lIGZ1bmN0aW9ucyBhcmUgYWxzbyAKdXNlZApvdXRzaWRlIGFyY2gvLCBlLmcuIG9uIHN5
c2NhbGwuYywgc2lnbmFsLmMgdXByb2JlcyBldGMpLiBJIGFncmVlIHRoYXQgYXQKdGhpcyBwb2lu
dCB3aGF0IHdlIGhhdmUgaXMgbm90IGdvb2QsIElNSE8gd2Ugc2hvdWxkIGp1c3QgaGF2ZSBkZWZp
bmUgCm1hY3Jvcwpmb3IgdGhlIHJlZ2lzdGVyIG5hbWVzIG9uIHRoZSBhcmNoLXNwZWNpZmljIHB0
cmFjZS5oIGluc3RlYWQgb2YgR0VUL1NFVAptYWNyb3MgKyB0aGUgc3RhdGljIGlubGluZSBmdW5j
dGlvbnMgc2hvdWxkIGhhdmUgZ2V0XyBhbiBzZXRfIHByZWZpeGVzCmJlY2F1c2UgZS5nLiBmcmFt
ZV9wb2ludGVyIGNhbiBhbHNvIGJlIGEgdmFyaWFibGUuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
