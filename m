Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C61EC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C91C120818
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:46:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YGnRVaHz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C91C120818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zVinXLvQLL+xdpfWk/KVUSgNWW/n3JKP4tylExbBE4E=; b=YGnRVaHzl5MbSLe/mnd87iLMd
	L/y1YbzldYXJVWdg0JVmEKuhmlnOVio0CeGiO45dejMbzL5pLQdq8TCwm/bKU28Dw+WwevzJrKlZa
	OqYIeb3PlDOyvF7dIAGkxp1J06ttuCKZWmcEweVPTHeERtbWgwZ7KB/j9i+/jcVnJElv5+MW1Ded0
	NY8WwbuHVfAjhF7PRO3Q8KOjZYJ6tIzfEG5JYiAW84ZtAeVY5gMUS6nGuLU7XtShbLVSxbhsd0gvR
	++LIsHv1b24hO/IuPdFPC91hsKIR1oo4B35GQsc61UcdBsz7qkoDAj/pijwz8CGk54gpcrhG1YoQI
	wKxjjl2Kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEbuh-0003dw-Q3; Thu, 11 Apr 2019 15:46:55 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEbuc-0003cM-Te
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 15:46:54 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x3BFkltB012423; Thu, 11 Apr 2019 15:46:49 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-b4-5caf61669770
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 30.B9.09052.6616FAC5; Thu, 11 Apr 2019 18:46:47 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x3BFkkmW031120; Thu, 11 Apr 2019 18:46:46 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 11 Apr 2019 18:46:46 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 7/9] riscv: remove duplicate macros from ptrace.h
Organization: FORTH
In-Reply-To: <20190411115623.5749-8-hch@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-8-hch@lst.de>
Message-ID: <25d179157667295a1cb1bf53e5eb66ee@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 11 Apr 2019 15:46:49 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 11 Apr 2019 15:46:49 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_084651_323052_80BF4BF3 
X-CRM114-Status: GOOD (  12.56  )
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
Ogo+IE5vIG5lZWQgdG8gaGF2ZSB0d28gbmFtZXMgZm9yIHRoZSBzYW1lIHRoaW5nLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFjZS5oIHwgMjEgKysrKysrLS0tLS0tLS0tLS0tLS0tCj4g
IGFyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYyAgfCAgOCArKysrLS0tLQo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jICAgICAgIHwgIDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wdHJhY2UuaCAKPiBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNl
LmgKPiBpbmRleCBkMzVlYzJmNDEzODEuLjljODY3YTRiYWM4MyAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFjZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wdHJhY2UuaAo+IEBAIC03MCw0NyArNzAsMzggQEAgc3RydWN0IHB0X3JlZ3Mgewo+IAo+IAo+
ICAvKiBIZWxwZXJzIGZvciB3b3JraW5nIHdpdGggdGhlIGluc3RydWN0aW9uIHBvaW50ZXIgKi8K
PiAtI2RlZmluZSBHRVRfSVAocmVncykgKChyZWdzKS0+c2VwYykKPiAtI2RlZmluZSBTRVRfSVAo
cmVncywgdmFsKSAoR0VUX0lQKHJlZ3MpID0gKHZhbCkpCj4gLQo+ICBzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgaW5zdHJ1Y3Rpb25fcG9pbnRlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAg
ewo+IC0JcmV0dXJuIEdFVF9JUChyZWdzKTsKPiArCXJldHVybiByZWdzLT5zZXBjOwo+ICB9Cj4g
IHN0YXRpYyBpbmxpbmUgdm9pZCBpbnN0cnVjdGlvbl9wb2ludGVyX3NldChzdHJ1Y3QgcHRfcmVn
cyAqcmVncywKPiAgCQkJCQkgICB1bnNpZ25lZCBsb25nIHZhbCkKPiAgewo+IC0JU0VUX0lQKHJl
Z3MsIHZhbCk7Cj4gKwlyZWdzLT5zZXBjID0gdmFsOwo+ICB9Cj4gCj4gICNkZWZpbmUgcHJvZmls
ZV9wYyhyZWdzKSBpbnN0cnVjdGlvbl9wb2ludGVyKHJlZ3MpCj4gCj4gIC8qIEhlbHBlcnMgZm9y
IHdvcmtpbmcgd2l0aCB0aGUgdXNlciBzdGFjayBwb2ludGVyICovCj4gLSNkZWZpbmUgR0VUX1VT
UChyZWdzKSAoKHJlZ3MpLT5zcCkKPiAtI2RlZmluZSBTRVRfVVNQKHJlZ3MsIHZhbCkgKEdFVF9V
U1AocmVncykgPSAodmFsKSkKPiAtCj4gIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyB1c2Vy
X3N0YWNrX3BvaW50ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIHsKPiAtCXJldHVybiBHRVRf
VVNQKHJlZ3MpOwo+ICsJcmV0dXJuIHJlZ3MtPnNwOwo+ICB9Cj4gIHN0YXRpYyBpbmxpbmUgdm9p
ZCB1c2VyX3N0YWNrX3BvaW50ZXJfc2V0KHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ICAJCQkJCSAg
dW5zaWduZWQgbG9uZyB2YWwpCj4gIHsKPiAtCVNFVF9VU1AocmVncywgdmFsKTsKPiArCXJlZ3Mt
PnNwID0gIHZhbDsKPiAgfQo+IAo+ICAvKiBIZWxwZXJzIGZvciB3b3JraW5nIHdpdGggdGhlIGZy
YW1lIHBvaW50ZXIgKi8KPiAtI2RlZmluZSBHRVRfRlAocmVncykgKChyZWdzKS0+czApCj4gLSNk
ZWZpbmUgU0VUX0ZQKHJlZ3MsIHZhbCkgKEdFVF9GUChyZWdzKSA9ICh2YWwpKQo+IC0KPiAgc3Rh
dGljIGlubGluZSB1bnNpZ25lZCBsb25nIGZyYW1lX3BvaW50ZXIoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4gIHsKPiAtCXJldHVybiBHRVRfRlAocmVncyk7Cj4gKwlyZXR1cm4gcmVncy0+czA7Cj4g
IH0KPiAgc3RhdGljIGlubGluZSB2b2lkIGZyYW1lX3BvaW50ZXJfc2V0KHN0cnVjdCBwdF9yZWdz
ICpyZWdzLAo+ICAJCQkJICAgICB1bnNpZ25lZCBsb25nIHZhbCkKPiAgewo+IC0JU0VUX0ZQKHJl
Z3MsIHZhbCk7Cj4gKwlyZWdzLT5zMCA9IHZhbDsKPiAgfQo+IAo+ICBzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgcmVnc19yZXR1cm5fdmFsdWUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYyAKPiBiL2FyY2gvcmlzY3Yv
a2VybmVsL3N0YWNrdHJhY2UuYwo+IGluZGV4IGE0YjFkOTQzNzFhMC4uMjVmZTBmZjgxZjllIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwo+IEBAIC0zMyw5ICszMyw5IEBAIHN0YXRpYyB2b2lk
IG5vdHJhY2Ugd2Fsa19zdGFja2ZyYW1lKHN0cnVjdCAKPiB0YXNrX3N0cnVjdCAqdGFzaywKPiAg
CXVuc2lnbmVkIGxvbmcgZnAsIHNwLCBwYzsKPiAKPiAgCWlmIChyZWdzKSB7Cj4gLQkJZnAgPSBH
RVRfRlAocmVncyk7Cj4gLQkJc3AgPSBHRVRfVVNQKHJlZ3MpOwo+IC0JCXBjID0gR0VUX0lQKHJl
Z3MpOwo+ICsJCWZwID0gZnJhbWVfcG9pbnRlcihyZWdzKTsKPiArCQlzcCA9IHVzZXJfc3RhY2tf
cG9pbnRlcihyZWdzKTsKPiArCQlwYyA9IGluc3RydWN0aW9uX3BvaW50ZXIocmVncyk7Cj4gIAl9
IGVsc2UgaWYgKHRhc2sgPT0gTlVMTCB8fCB0YXNrID09IGN1cnJlbnQpIHsKPiAgCQljb25zdCBy
ZWdpc3RlciB1bnNpZ25lZCBsb25nIGN1cnJlbnRfc3AgX19hc21fXyAoInNwIik7Cj4gIAkJZnAg
PSAodW5zaWduZWQgbG9uZylfX2J1aWx0aW5fZnJhbWVfYWRkcmVzcygwKTsKPiBAQCAtODMsNyAr
ODMsNyBAQCBzdGF0aWMgdm9pZCBub3RyYWNlIHdhbGtfc3RhY2tmcmFtZShzdHJ1Y3QgCj4gdGFz
a19zdHJ1Y3QgKnRhc2ssCj4gCj4gIAlpZiAocmVncykgewo+ICAJCXNwID0gR0VUX1VTUChyZWdz
KTsKPiAtCQlwYyA9IEdFVF9JUChyZWdzKTsKPiArCQlwYyA9IGluc3RydWN0aW9uX3BvaW50ZXIo
cmVncyk7Cj4gIAl9IGVsc2UgaWYgKHRhc2sgPT0gTlVMTCB8fCB0YXNrID09IGN1cnJlbnQpIHsK
PiAgCQljb25zdCByZWdpc3RlciB1bnNpZ25lZCBsb25nIGN1cnJlbnRfc3AgX19hc21fXyAoInNw
Iik7Cj4gIAkJc3AgPSBjdXJyZW50X3NwOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IGluZGV4IDI0YTkzMzNkZGEy
Yy4uODY3MzFhMmZhMjE4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gQEAgLTcwLDcgKzcwLDcgQEAgdm9p
ZCBkb190cmFwKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQgc2lnbm8sIGludCAKPiBjb2RlLAo+
ICAJICAgICYmIHByaW50a19yYXRlbGltaXQoKSkgewo+ICAJCXByX2luZm8oIiVzWyVkXTogdW5o
YW5kbGVkIHNpZ25hbCAlZCBjb2RlIDB4JXggYXQgMHgiIFJFR19GTVQsCj4gIAkJCXRzay0+Y29t
bSwgdGFza19waWRfbnIodHNrKSwgc2lnbm8sIGNvZGUsIGFkZHIpOwo+IC0JCXByaW50X3ZtYV9h
ZGRyKEtFUk5fQ09OVCAiIGluICIsIEdFVF9JUChyZWdzKSk7Cj4gKwkJcHJpbnRfdm1hX2FkZHIo
S0VSTl9DT05UICIgaW4gIiwgaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKSk7Cj4gIAkJcHJfY29u
dCgiXG4iKTsKPiAgCQlzaG93X3JlZ3MocmVncyk7Cj4gIAl9CgpSZXZpZXdlZC1ieTogTmljayBL
b3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
