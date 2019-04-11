Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662F1C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 366892082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eWv/Z2lY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 366892082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YgnM0gys+rdWA/rUfHwZFdPPX+KZOfJX/O6JweXzoPI=; b=eWv/Z2lYejwRoB9GkHRv1Ftgv
	kfmm3s6MAShloaDEAPw3fcAxHcmvcurrurW8KVwH2VLmsZ+y+5EkkmSWN6MlbKDJolr0jgPsx1RTS
	GBY4HSzePhF669OIk48Qy2Sr9Ryb+1XkXUWunNMLFAbRDO8omMX1KbQMC9RaacsCLpQ4W4Txgww8+
	+DnsZdtCXzKihXixbiVAhQTJr+B1h4CCchOMUDuyVnUmVSVHyef3wlqXVTt7CE0IZKEa/7tfoZNzm
	lF4W2V+WKoPyQYT1eBFMgUg8V3sDa1lupEsXc7q4SlN4S2Mviyzrh4+4+B+tglrZZey+bC8qsnNyw
	e2KPsgGwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEc2n-0000he-5q; Thu, 11 Apr 2019 15:55:17 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEc2j-0000gp-M9
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 15:55:15 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x3BFt9dh012693; Thu, 11 Apr 2019 15:55:11 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-dc-5caf635d13fa
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 22.B9.09052.D536FAC5; Thu, 11 Apr 2019 18:55:09 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x3BFt9Sn000697; Thu, 11 Apr 2019 18:55:09 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 11 Apr 2019 18:55:09 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH 7/9] riscv: remove duplicate macros from ptrace.h
Organization: FORTH
In-Reply-To: <25d179157667295a1cb1bf53e5eb66ee@mailhost.ics.forth.gr>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-8-hch@lst.de>
 <25d179157667295a1cb1bf53e5eb66ee@mailhost.ics.forth.gr>
Message-ID: <8e0db47120668612b1814504a7054462@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 11 Apr 2019 15:55:11 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 11 Apr 2019 15:55:11 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_085514_091980_1E31FC66 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wNC0xMSAxODo0NiwgTmljayBLb3NzaWZpZGlzIM6tzrPPgc6xz4jOtToK
PiDOo8+EzrnPgiAyMDE5LTA0LTExIDE0OjU2LCBDaHJpc3RvcGggSGVsbHdpZyDOrc6zz4HOsc+I
zrU6Cj4+IE5vIG5lZWQgdG8gaGF2ZSB0d28gbmFtZXMgZm9yIHRoZSBzYW1lIHRoaW5nLgo+PiAK
Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4+IC0tLQo+
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wdHJhY2UuaCB8IDIxICsrKysrKy0tLS0tLS0tLS0t
LS0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jICB8ICA4ICsrKystLS0tCj4+
ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAgIHwgIDIgKy0KPj4gIDMgZmlsZXMgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wdHJhY2UuaCAKPj4gYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3B0cmFjZS5oCj4+IGluZGV4IGQzNWVjMmY0MTM4MS4uOWM4NjdhNGJhYzgzIDEwMDY0
NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFjZS5oCj4+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcHRyYWNlLmgKPj4gQEAgLTcwLDQ3ICs3MCwzOCBAQCBzdHJ1Y3Qg
cHRfcmVncyB7Cj4+IAo+PiAKPj4gIC8qIEhlbHBlcnMgZm9yIHdvcmtpbmcgd2l0aCB0aGUgaW5z
dHJ1Y3Rpb24gcG9pbnRlciAqLwo+PiAtI2RlZmluZSBHRVRfSVAocmVncykgKChyZWdzKS0+c2Vw
YykKPj4gLSNkZWZpbmUgU0VUX0lQKHJlZ3MsIHZhbCkgKEdFVF9JUChyZWdzKSA9ICh2YWwpKQo+
PiAtCj4+ICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgaW5zdHJ1Y3Rpb25fcG9pbnRlcihz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gIHsKPj4gLQlyZXR1cm4gR0VUX0lQKHJlZ3MpOwo+PiAr
CXJldHVybiByZWdzLT5zZXBjOwo+PiAgfQo+PiAgc3RhdGljIGlubGluZSB2b2lkIGluc3RydWN0
aW9uX3BvaW50ZXJfc2V0KHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+PiAgCQkJCQkgICB1bnNpZ25l
ZCBsb25nIHZhbCkKPj4gIHsKPj4gLQlTRVRfSVAocmVncywgdmFsKTsKPj4gKwlyZWdzLT5zZXBj
ID0gdmFsOwo+PiAgfQo+PiAKPj4gICNkZWZpbmUgcHJvZmlsZV9wYyhyZWdzKSBpbnN0cnVjdGlv
bl9wb2ludGVyKHJlZ3MpCj4+IAo+PiAgLyogSGVscGVycyBmb3Igd29ya2luZyB3aXRoIHRoZSB1
c2VyIHN0YWNrIHBvaW50ZXIgKi8KPj4gLSNkZWZpbmUgR0VUX1VTUChyZWdzKSAoKHJlZ3MpLT5z
cCkKPj4gLSNkZWZpbmUgU0VUX1VTUChyZWdzLCB2YWwpIChHRVRfVVNQKHJlZ3MpID0gKHZhbCkp
Cj4+IC0KPj4gIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyB1c2VyX3N0YWNrX3BvaW50ZXIo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICB7Cj4+IC0JcmV0dXJuIEdFVF9VU1AocmVncyk7Cj4+
ICsJcmV0dXJuIHJlZ3MtPnNwOwo+PiAgfQo+PiAgc3RhdGljIGlubGluZSB2b2lkIHVzZXJfc3Rh
Y2tfcG9pbnRlcl9zZXQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4+ICAJCQkJCSAgdW5zaWduZWQg
bG9uZyB2YWwpCj4+ICB7Cj4+IC0JU0VUX1VTUChyZWdzLCB2YWwpOwo+PiArCXJlZ3MtPnNwID0g
IHZhbDsKPj4gIH0KPj4gCj4+ICAvKiBIZWxwZXJzIGZvciB3b3JraW5nIHdpdGggdGhlIGZyYW1l
IHBvaW50ZXIgKi8KPj4gLSNkZWZpbmUgR0VUX0ZQKHJlZ3MpICgocmVncyktPnMwKQo+PiAtI2Rl
ZmluZSBTRVRfRlAocmVncywgdmFsKSAoR0VUX0ZQKHJlZ3MpID0gKHZhbCkpCj4+IC0KPj4gIHN0
YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBmcmFtZV9wb2ludGVyKHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQo+PiAgewo+PiAtCXJldHVybiBHRVRfRlAocmVncyk7Cj4+ICsJcmV0dXJuIHJlZ3MtPnMw
Owo+PiAgfQo+PiAgc3RhdGljIGlubGluZSB2b2lkIGZyYW1lX3BvaW50ZXJfc2V0KHN0cnVjdCBw
dF9yZWdzICpyZWdzLAo+PiAgCQkJCSAgICAgdW5zaWduZWQgbG9uZyB2YWwpCj4+ICB7Cj4+IC0J
U0VUX0ZQKHJlZ3MsIHZhbCk7Cj4+ICsJcmVncy0+czAgPSB2YWw7Cj4+ICB9Cj4+IAo+PiAgc3Rh
dGljIGlubGluZSB1bnNpZ25lZCBsb25nIHJlZ3NfcmV0dXJuX3ZhbHVlKHN0cnVjdCBwdF9yZWdz
ICpyZWdzKQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIAo+
PiBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwo+PiBpbmRleCBhNGIxZDk0MzcxYTAu
LjI1ZmUwZmY4MWY5ZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFj
ZS5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwo+PiBAQCAtMzMsOSAr
MzMsOSBAQCBzdGF0aWMgdm9pZCBub3RyYWNlIHdhbGtfc3RhY2tmcmFtZShzdHJ1Y3QgCj4+IHRh
c2tfc3RydWN0ICp0YXNrLAo+PiAgCXVuc2lnbmVkIGxvbmcgZnAsIHNwLCBwYzsKPj4gCj4+ICAJ
aWYgKHJlZ3MpIHsKPj4gLQkJZnAgPSBHRVRfRlAocmVncyk7Cj4+IC0JCXNwID0gR0VUX1VTUChy
ZWdzKTsKPj4gLQkJcGMgPSBHRVRfSVAocmVncyk7Cj4+ICsJCWZwID0gZnJhbWVfcG9pbnRlcihy
ZWdzKTsKPj4gKwkJc3AgPSB1c2VyX3N0YWNrX3BvaW50ZXIocmVncyk7Cj4+ICsJCXBjID0gaW5z
dHJ1Y3Rpb25fcG9pbnRlcihyZWdzKTsKPj4gIAl9IGVsc2UgaWYgKHRhc2sgPT0gTlVMTCB8fCB0
YXNrID09IGN1cnJlbnQpIHsKPj4gIAkJY29uc3QgcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBjdXJy
ZW50X3NwIF9fYXNtX18gKCJzcCIpOwo+PiAgCQlmcCA9ICh1bnNpZ25lZCBsb25nKV9fYnVpbHRp
bl9mcmFtZV9hZGRyZXNzKDApOwo+PiBAQCAtODMsNyArODMsNyBAQCBzdGF0aWMgdm9pZCBub3Ry
YWNlIHdhbGtfc3RhY2tmcmFtZShzdHJ1Y3QgCj4+IHRhc2tfc3RydWN0ICp0YXNrLAo+PiAKPj4g
IAlpZiAocmVncykgewo+PiAgCQlzcCA9IEdFVF9VU1AocmVncyk7CgpBaCBqdXN0IG5vdGljZWQg
dGhpcywgaXQgc2hvdWxkIGJlIHVzZXJfc3RhY2tfcG9pbnRlcihyZWdzKSBpbnN0ZWFkIApzaW5j
ZSB5b3UgcmVtb3ZlZApHRVRfVVNQLgoKPj4gLQkJcGMgPSBHRVRfSVAocmVncyk7Cj4+ICsJCXBj
ID0gaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKTsKPj4gIAl9IGVsc2UgaWYgKHRhc2sgPT0gTlVM
TCB8fCB0YXNrID09IGN1cnJlbnQpIHsKPj4gIAkJY29uc3QgcmVnaXN0ZXIgdW5zaWduZWQgbG9u
ZyBjdXJyZW50X3NwIF9fYXNtX18gKCJzcCIpOwo+PiAgCQlzcCA9IGN1cnJlbnRfc3A7Cj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+PiBpbmRleCAyNGE5MzMzZGRhMmMuLjg2NzMxYTJmYTIxOCAxMDA2NDQKPj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jCj4+IEBAIC03MCw3ICs3MCw3IEBAIHZvaWQgZG9fdHJhcChzdHJ1Y3QgcHRfcmVncyAq
cmVncywgaW50IHNpZ25vLCBpbnQgCj4+IGNvZGUsCj4+ICAJICAgICYmIHByaW50a19yYXRlbGlt
aXQoKSkgewo+PiAgCQlwcl9pbmZvKCIlc1slZF06IHVuaGFuZGxlZCBzaWduYWwgJWQgY29kZSAw
eCV4IGF0IDB4IiBSRUdfRk1ULAo+PiAgCQkJdHNrLT5jb21tLCB0YXNrX3BpZF9ucih0c2spLCBz
aWdubywgY29kZSwgYWRkcik7Cj4+IC0JCXByaW50X3ZtYV9hZGRyKEtFUk5fQ09OVCAiIGluICIs
IEdFVF9JUChyZWdzKSk7Cj4+ICsJCXByaW50X3ZtYV9hZGRyKEtFUk5fQ09OVCAiIGluICIsIGlu
c3RydWN0aW9uX3BvaW50ZXIocmVncykpOwo+PiAgCQlwcl9jb250KCJcbiIpOwo+PiAgCQlzaG93
X3JlZ3MocmVncyk7Cj4+ICAJfQo+IAo+IFJldmlld2VkLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1p
Y2tAaWNzLmZvcnRoLmdyPgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
