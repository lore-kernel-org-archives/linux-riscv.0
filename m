Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E7CC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:03:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50EA2133D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qQmyL9TC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50EA2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0b+6O5VHqlIwKLzhnUqaG+bvxRKxlokJE0HFKDU8lZg=; b=qQmyL9TCeYf9yWLyKC6AcJWsN
	FmKCXIpK5470tRJCmsrROQzKVSkrKNLZc83ax/rlXXmnBMwzaEOKdVPj66SF9rTKj6WKdqwfHBMi1
	8MY+x8/ls062IBxeil3nvL59p42py2KWX2IBdzliK0V7Acr9tpu/B7v0IkX5VvgqscWvQ5dV9hzt6
	BlnDjLVKXI7APxQxRtK98s0UmU7CcrV+xqw4zapSvvyLMPbWBEin7qENorPR1l1BIuaD6DiBLidLx
	gjm5sBs4zgzrLQ4KC9p4bSVYE0dfDe25RwwuqCKBjriw8YpgnQTRH+JKzoK2vZ0Qxy30ukJWErFjT
	3IMdrW2rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEcB9-0004uw-Mv; Thu, 11 Apr 2019 16:03:55 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEcB6-0004uU-EI
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 16:03:54 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x3BG3mZ8013003; Thu, 11 Apr 2019 16:03:50 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-04-5caf65641c08
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 33.B9.09052.4656FAC5; Thu, 11 Apr 2019 19:03:48 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x3BG3mqt003997; Thu, 11 Apr 2019 19:03:48 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 11 Apr 2019 19:03:48 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH 7/9] riscv: remove duplicate macros from ptrace.h
Organization: FORTH
In-Reply-To: <8e0db47120668612b1814504a7054462@mailhost.ics.forth.gr>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-8-hch@lst.de>
 <25d179157667295a1cb1bf53e5eb66ee@mailhost.ics.forth.gr>
 <8e0db47120668612b1814504a7054462@mailhost.ics.forth.gr>
Message-ID: <2a436f2edd8c1ad0ae32ec05415475e9@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Thu, 11 Apr 2019 16:03:50 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Thu, 11 Apr 2019 16:03:50 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_090352_844227_B3065B6E 
X-CRM114-Status: GOOD (  10.25  )
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

zqPPhM65z4IgMjAxOS0wNC0xMSAxODo1NSwgTmljayBLb3NzaWZpZGlzIM6tzrPPgc6xz4jOtToK
PiDOo8+EzrnPgiAyMDE5LTA0LTExIDE4OjQ2LCBOaWNrIEtvc3NpZmlkaXMgzq3Os8+BzrHPiM61
Ogo+PiDOo8+EzrnPgiAyMDE5LTA0LTExIDE0OjU2LCBDaHJpc3RvcGggSGVsbHdpZyDOrc6zz4HO
sc+IzrU6Cj4+PiBObyBuZWVkIHRvIGhhdmUgdHdvIG5hbWVzIGZvciB0aGUgc2FtZSB0aGluZy4K
Pj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4+
PiAtLS0KPj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3B0cmFjZS5oIHwgMjEgKysrKysrLS0t
LS0tLS0tLS0tLS0tCj4+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jICB8ICA4ICsr
KystLS0tCj4+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICB8ICAyICstCj4+PiAg
MyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPj4+IAo+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNlLmggCj4+PiBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcHRyYWNlLmgKPj4+IGluZGV4IGQzNWVjMmY0MTM4MS4uOWM4
NjdhNGJhYzgzIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wdHJhY2Uu
aAo+Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wdHJhY2UuaAo+Pj4gQEAgLTcwLDQ3
ICs3MCwzOCBAQCBzdHJ1Y3QgcHRfcmVncyB7Cj4+PiAKPj4+IAo+Pj4gIC8qIEhlbHBlcnMgZm9y
IHdvcmtpbmcgd2l0aCB0aGUgaW5zdHJ1Y3Rpb24gcG9pbnRlciAqLwo+Pj4gLSNkZWZpbmUgR0VU
X0lQKHJlZ3MpICgocmVncyktPnNlcGMpCj4+PiAtI2RlZmluZSBTRVRfSVAocmVncywgdmFsKSAo
R0VUX0lQKHJlZ3MpID0gKHZhbCkpCj4+PiAtCj4+PiAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBs
b25nIGluc3RydWN0aW9uX3BvaW50ZXIoc3RydWN0IHB0X3JlZ3MgCj4+PiAqcmVncykKPj4+ICB7
Cj4+PiAtCXJldHVybiBHRVRfSVAocmVncyk7Cj4+PiArCXJldHVybiByZWdzLT5zZXBjOwo+Pj4g
IH0KPj4+ICBzdGF0aWMgaW5saW5lIHZvaWQgaW5zdHJ1Y3Rpb25fcG9pbnRlcl9zZXQoc3RydWN0
IHB0X3JlZ3MgKnJlZ3MsCj4+PiAgCQkJCQkgICB1bnNpZ25lZCBsb25nIHZhbCkKPj4+ICB7Cj4+
PiAtCVNFVF9JUChyZWdzLCB2YWwpOwo+Pj4gKwlyZWdzLT5zZXBjID0gdmFsOwo+Pj4gIH0KPj4+
IAo+Pj4gICNkZWZpbmUgcHJvZmlsZV9wYyhyZWdzKSBpbnN0cnVjdGlvbl9wb2ludGVyKHJlZ3Mp
Cj4+PiAKPj4+ICAvKiBIZWxwZXJzIGZvciB3b3JraW5nIHdpdGggdGhlIHVzZXIgc3RhY2sgcG9p
bnRlciAqLwo+Pj4gLSNkZWZpbmUgR0VUX1VTUChyZWdzKSAoKHJlZ3MpLT5zcCkKPj4+IC0jZGVm
aW5lIFNFVF9VU1AocmVncywgdmFsKSAoR0VUX1VTUChyZWdzKSA9ICh2YWwpKQo+Pj4gLQo+Pj4g
IHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyB1c2VyX3N0YWNrX3BvaW50ZXIoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCj4+PiAgewo+Pj4gLQlyZXR1cm4gR0VUX1VTUChyZWdzKTsKPj4+ICsJcmV0
dXJuIHJlZ3MtPnNwOwo+Pj4gIH0KPj4+ICBzdGF0aWMgaW5saW5lIHZvaWQgdXNlcl9zdGFja19w
b2ludGVyX3NldChzdHJ1Y3QgcHRfcmVncyAqcmVncywKPj4+ICAJCQkJCSAgdW5zaWduZWQgbG9u
ZyB2YWwpCj4+PiAgewo+Pj4gLQlTRVRfVVNQKHJlZ3MsIHZhbCk7Cj4+PiArCXJlZ3MtPnNwID0g
IHZhbDsKPj4+ICB9Cj4+PiAKPj4+ICAvKiBIZWxwZXJzIGZvciB3b3JraW5nIHdpdGggdGhlIGZy
YW1lIHBvaW50ZXIgKi8KPj4+IC0jZGVmaW5lIEdFVF9GUChyZWdzKSAoKHJlZ3MpLT5zMCkKPj4+
IC0jZGVmaW5lIFNFVF9GUChyZWdzLCB2YWwpIChHRVRfRlAocmVncykgPSAodmFsKSkKPj4+IC0K
Pj4+ICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgZnJhbWVfcG9pbnRlcihzdHJ1Y3QgcHRf
cmVncyAqcmVncykKPj4+ICB7Cj4+PiAtCXJldHVybiBHRVRfRlAocmVncyk7Cj4+PiArCXJldHVy
biByZWdzLT5zMDsKPj4+ICB9Cj4+PiAgc3RhdGljIGlubGluZSB2b2lkIGZyYW1lX3BvaW50ZXJf
c2V0KHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+Pj4gIAkJCQkgICAgIHVuc2lnbmVkIGxvbmcgdmFs
KQo+Pj4gIHsKPj4+IC0JU0VUX0ZQKHJlZ3MsIHZhbCk7Cj4+PiArCXJlZ3MtPnMwID0gdmFsOwo+
Pj4gIH0KPj4+IAo+Pj4gIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyByZWdzX3JldHVybl92
YWx1ZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9zdGFja3RyYWNlLmMgCj4+PiBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwo+
Pj4gaW5kZXggYTRiMWQ5NDM3MWEwLi4yNWZlMGZmODFmOWUgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0
YWNrdHJhY2UuYwo+Pj4gQEAgLTMzLDkgKzMzLDkgQEAgc3RhdGljIHZvaWQgbm90cmFjZSB3YWxr
X3N0YWNrZnJhbWUoc3RydWN0IAo+Pj4gdGFza19zdHJ1Y3QgKnRhc2ssCj4+PiAgCXVuc2lnbmVk
IGxvbmcgZnAsIHNwLCBwYzsKPj4+IAo+Pj4gIAlpZiAocmVncykgewo+Pj4gLQkJZnAgPSBHRVRf
RlAocmVncyk7Cj4+PiAtCQlzcCA9IEdFVF9VU1AocmVncyk7Cj4+PiAtCQlwYyA9IEdFVF9JUChy
ZWdzKTsKPj4+ICsJCWZwID0gZnJhbWVfcG9pbnRlcihyZWdzKTsKPj4+ICsJCXNwID0gdXNlcl9z
dGFja19wb2ludGVyKHJlZ3MpOwo+Pj4gKwkJcGMgPSBpbnN0cnVjdGlvbl9wb2ludGVyKHJlZ3Mp
Owo+Pj4gIAl9IGVsc2UgaWYgKHRhc2sgPT0gTlVMTCB8fCB0YXNrID09IGN1cnJlbnQpIHsKPj4+
ICAJCWNvbnN0IHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgY3VycmVudF9zcCBfX2FzbV9fICgic3Ai
KTsKPj4+ICAJCWZwID0gKHVuc2lnbmVkIGxvbmcpX19idWlsdGluX2ZyYW1lX2FkZHJlc3MoMCk7
Cj4+PiBAQCAtODMsNyArODMsNyBAQCBzdGF0aWMgdm9pZCBub3RyYWNlIHdhbGtfc3RhY2tmcmFt
ZShzdHJ1Y3QgCj4+PiB0YXNrX3N0cnVjdCAqdGFzaywKPj4+IAo+Pj4gIAlpZiAocmVncykgewo+
Pj4gIAkJc3AgPSBHRVRfVVNQKHJlZ3MpOwo+IAo+IEFoIGp1c3Qgbm90aWNlZCB0aGlzLCBpdCBz
aG91bGQgYmUgdXNlcl9zdGFja19wb2ludGVyKHJlZ3MpIGluc3RlYWQKPiBzaW5jZSB5b3UgcmVt
b3ZlZAo+IEdFVF9VU1AuCj4gCj4+PiAtCQlwYyA9IEdFVF9JUChyZWdzKTsKPj4+ICsJCXBjID0g
aW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKTsKPj4+ICAJfSBlbHNlIGlmICh0YXNrID09IE5VTEwg
fHwgdGFzayA9PSBjdXJyZW50KSB7Cj4+PiAgCQljb25zdCByZWdpc3RlciB1bnNpZ25lZCBsb25n
IGN1cnJlbnRfc3AgX19hc21fXyAoInNwIik7Cj4+PiAgCQlzcCA9IGN1cnJlbnRfc3A7Cj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzLmMKPj4+IGluZGV4IDI0YTkzMzNkZGEyYy4uODY3MzFhMmZhMjE4IDEwMDY0NAo+Pj4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHMuYwo+Pj4gQEAgLTcwLDcgKzcwLDcgQEAgdm9pZCBkb190cmFwKHN0cnVjdCBwdF9y
ZWdzICpyZWdzLCBpbnQgc2lnbm8sIGludCAKPj4+IGNvZGUsCj4+PiAgCSAgICAmJiBwcmludGtf
cmF0ZWxpbWl0KCkpIHsKPj4+ICAJCXByX2luZm8oIiVzWyVkXTogdW5oYW5kbGVkIHNpZ25hbCAl
ZCBjb2RlIDB4JXggYXQgMHgiIFJFR19GTVQsCj4+PiAgCQkJdHNrLT5jb21tLCB0YXNrX3BpZF9u
cih0c2spLCBzaWdubywgY29kZSwgYWRkcik7Cj4+PiAtCQlwcmludF92bWFfYWRkcihLRVJOX0NP
TlQgIiBpbiAiLCBHRVRfSVAocmVncykpOwo+Pj4gKwkJcHJpbnRfdm1hX2FkZHIoS0VSTl9DT05U
ICIgaW4gIiwgaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKSk7Cj4+PiAgCQlwcl9jb250KCJcbiIp
Owo+Pj4gIAkJc2hvd19yZWdzKHJlZ3MpOwo+Pj4gIAl9Cj4+IAo+PiBSZXZpZXdlZC1ieTogTmlj
ayBLb3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4KPj4gCj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCkknbSBzb3JyeSBJIGFkZGVk
IHRoZSBSZXZpZXdlZC1ieSB0YWcgdG9vIHNvb24sIEknbSBhbGwgaW4gZm9yIHRoZSAKY2xlYW51
cCBidXQgSQpiZWxpZXZlIGl0J3MgbXVjaCBzaW1wbGVyLCBhbGwgb2YgdGhlc2UgYXJlIHJlLWRl
ZmluZWQgb24KaW5jbHVkZS9hc20tZ2VuZXJpYy9wdHJhY2UuaCBhbnl3YXksIGFsbCB3ZSBoYXZl
IHRvIGRvIGlzIGRlZmluZSBHRVRfRlAgCmFuZCBHRVRfVVNQCihvciByZW5hbWUgcmVncy0+c3Ag
dG8gcmVncy0+dXNwKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
