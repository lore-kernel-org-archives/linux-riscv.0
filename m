Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79493C004D3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 13:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0354A2075D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 13:33:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YY2UJ/7y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0354A2075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eX9Y76VO8DeC/hf6cIN4wkIdlQDf+GhI4YfQ2l8Rqe4=; b=YY2UJ/7yWaZ67WHze0zcf7KJB
	KQuIwiGXmWhkcxFP1075ogvTv7N6mWebhfIyrYrFvhUhu+TLP9RssXwMvjh1RraJnmcAX4jIBBp3i
	LT0jFY5vZEXdPKQXBJIExcpPPMhErEPv7qnM2arxvt8A4DOH2g3XqjdUIhxRvrrYmEtElHNdSWTyS
	rZz+U5vUMxlS4EJxmyig9D7vaL4bRCNkdkVOzHqGeNNtyQKqaEkzOVvfOZJgGgMlf3UIcxzb172eR
	P5d4XQOH/Yhk3eMYWaDR5PaAVwZJ2U0IspMQ3Pynais6xfuarNg4CZRXW8LCsfQY0Z+z+KG1QFwZh
	yYNP8Rq0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFJHc-0007sK-99; Wed, 24 Oct 2018 13:33:12 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFJHY-0007rN-HV
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 13:33:10 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 w9ODWecg050833; Wed, 24 Oct 2018 16:32:42 +0300 (EEST)
X-AuditID: 8b5b9d4d-91bff70000000e62-cf-5bd0747878a5
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 F8.2D.03682.87470DB5; Wed, 24 Oct 2018 16:32:40 +0300 (EEST)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id w9ODWeef018524; Wed, 24 Oct 2018 16:32:40 +0300
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Wed, 24 Oct 2018 16:32:40 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] OF: Handle CMDLINE when /chosen node is not present
Organization: FORTH
In-Reply-To: <CAL_JsqKA6_saB7Ak=BZqSth6KAZ1g2srF5BsOQRGdE2+rmcR8w@mail.gmail.com>
References: <20181022224213.GA25145@bogus>
 <mhng-08dbc241-46e4-411b-ba13-32435abde7ad@palmer-si-x1c4>
 <CAL_JsqKA6_saB7Ak=BZqSth6KAZ1g2srF5BsOQRGdE2+rmcR8w@mail.gmail.com>
Message-ID: <8e420b9dee0f246fda8e018532737b1a@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsXSHc2orFtRciHa4M5sA4v5R86xWsx885/N
 YsLUSewW2z63sFk0vzvHbrF5wgJWi/97drA7sHvsnHWX3ePhpktMHptWdbJ5HF25lslj85J6
 j0vN19k9Pm+SC2CP4rJJSc3JLEst0rdL4Mp4fvAke8E18YoX0zqZGhgfCnUxcnJICJhIfP34
 l6mLkYtDSOAoo8S8vjlQziFGidnvWlghqkwlZu/tZASxeQUEJU7OfMICYjMLWEhMvbKfEcKW
 l2jeOpsZxGYRUJXoWLcDzGYT0JSYf+kgWL2IgKLE77ZprBD1Xxgl5m7yBbGFBbwlnn1eDBbn
 FxCW+HT3IpjNKRAose71FGaIg9YxSvz9uYMF4ggXieWvzzJCHKci8eH3A3YQW1RAWeLFiems
 ExiFZiG5dRaSW2chuXUBI/MqRoHEMmO9zORivbT8opIMvfSiTYzgCJnru4Px3AL7Q4wCHIxK
 PLwHas9HC7EmlhVX5gJDhoNZSYRX4D9QiDclsbIqtSg/vqg0J7X4EKM0B4uSOO/hF+FBQgLp
 iSWp2ampBalFMFkmDk6pBkbf7ZJMD39mZky5W6soFRD67bWStmDqS82fC1mCtzbJ3BBPy/qT
 +q65v8dkg6/5uoshN948yMkLEVU4fMdNW+VjkprHys2NUkc0dpYxxTBxxq+XL5AJuPiH8e4r
 Odtvt9/Mfy1+J2HRv6O5ohmJBmL+vdmys7iPd9i25E5t8zbfbcLTo7bzuxJLcUaioRZzUXEi
 APw1ZcyMAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_063308_952201_4D260BCC 
X-CRM114-Status: GOOD (  18.07  )
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
Cc: Linux-MIPS <linux-mips@linux-mips.org>, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024133240.4-tB7GQN0q8Q22XR6IgzJWZRmiRRZI2Y47vCESMAy5s@z>

zqPPhM65z4IgMjAxOC0xMC0yMyAxNzozMCwgUm9iIEhlcnJpbmcgzq3Os8+BzrHPiM61Ogo+IE9u
IE1vbiwgT2N0IDIyLCAyMDE4IGF0IDU6NTUgUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZp
dmUuY29tPiAKPiB3cm90ZToKPj4gCj4+IE9uIE1vbiwgMjIgT2N0IDIwMTggMTU6NDI6MTMgUERU
ICgtMDcwMCksIHJvYmhAa2VybmVsLm9yZyB3cm90ZToKPj4gPiBPbiBNb24sIE9jdCAxNSwgMjAx
OCBhdCAwNToyMDoxMFBNICswMzAwLCBOaWNrIEtvc3NpZmlkaXMgd3JvdGU6Cj4+ID4+IFRoZSAv
Y2hvc2VuIG5vZGUgaXMgb3B0aW9uYWwgc28gd2Ugc2hvdWxkIGhhbmRsZSBDTURMSU5FIHJlZ2Fy
ZGxlc3MKPj4gPj4gdGhlIHByZXNlbmNlIG9mIC9jaG9zZW4vYm9vdGFyZ3MuIE1vdmUgaGFuZGxp
bmcgb2YgQ01ETElORSBpbgo+PiA+PiBlYXJseV9pbml0X2R0X3NjYW4oKSBpbnN0ZWFkLgo+PiA+
Cj4+ID4gSSBsb29rZWQgYXQgdGhpcyBhIHdoaWxlIGJhY2suIEknbSBub3Qgc3VyZSB0aGlzIGJl
aGF2aW9yIGNhbiBiZSBjaGFuZ2VkCj4+ID4gd2l0aG91dCBicmVha2luZyBzb21lIE1JUFMgcGxh
dGZvcm1zIHRoYXQgY291bGQgYmUgcmVseWluZyBvbiB0aGUKPj4gPiBjdXJyZW50IGJlaGF2aW9y
LiBCdXQgdHJ5aW5nIHRvIG1ha2Ugc2Vuc2Ugb2YgdGhlIE1JUFMgY29kZSBpcyBhCj4+ID4gY2hh
bGxlbmdlIGFuZCB0aGV5IGhhdmUgc29tZSBvdGhlciBpc3N1ZXMgaW4gdGhpcyBhcmVhLgo+PiA+
Cj4+ID4gQ2FuJ3QgdGhpcyBiZSBmaXhlZCBieSBtYWtpbmcgL2Nob3NlbiBtYW5kaXRvcnk/IEkn
ZCBleHBlY3QgdWx0aW1hdGVseQo+PiA+IHlvdSBhcmUgYWx3YXlzIGdvaW5nIHRvIG5lZWQgaXQu
Cj4+ID4KPj4gPiBJJ2QgcmF0aGVyIG5vdCByZXNvcnQgdG8gbWFraW5nIHRoaXMgcGVyIGFyY2gu
IFRoZXJlJ3MgYWxzbyBzb21lIGVmZm9ydAo+PiA+IHRvIGNvbnNvbGlkYXRlIGNtZCBsaW5lIGhh
bmRsaW5nWzFdLgo+PiAKPj4gSSdkIHJhdGhlciBtYWtlIC9jaG9zZW4gbWFuZGF0b3J5IG9uIFJJ
U0MtViB0aGFuIHRvIGhhdmUgcGVyLWFyY2ggCj4+IGhhbmRsaW5nLCBhcwo+PiBsaWtlIHlvdSd2
ZSBzYWlkIHRoZXJlJ3MgYWxyZWFkeSB0b28gbXVjaCBkdXBsaWNhdGlvbi4gIFRoYXQgc2FpZCwg
aXQgCj4+IGRvZXMgc2VlbQo+PiBsaWtlIGEgYnVnIHRvIG1lIGJlY2F1c2UgdGhlIGJlaGF2aW9y
IHNlZW1zIHNvbWV3aGF0IGFyYml0cmFyeSAtLSBhbiAKPj4gZW1wdHkKPj4gL2Nob3NlbiBub2Rl
IGNhdXNpbmcgdGhlIGJ1aWx0LWluIGNvbW1hbmQtbGluZSBhcmd1bWVudCBoYW5kbGluZyB0byBn
byAKPj4gb2ZmIHRoZQo+PiByYWlscyBqdXN0IHNtZWxscyBzbyBidWdneS4KPiAKPiBZZXMuIFBy
b2JhYmx5IG5lZWQgdG8gZG8gc29tZSBhcmNoYWVvbG9neSBvbiB0aGlzIGNvZGUgdG8gZmlndXJl
IG91dAo+IHNvbWUgb2YgdGhlIGV4cGVjdGF0aW9ucy4KPiAKPj4gSWYgdGhhdCdzIHRoZSBjYXNl
LCBjb3VsZCB3ZSBhdCBsZWFzdCBoYXZlIHNvbWV0aGluZyBsaWtlCj4+ICJDT05GSUdfT0ZfQ0hP
U0VOX0lTX01BTkRBVE9SWSIgdGhhdCBwcm92aWRlcyBhIHdhcm5pbmcgd2hlbiB0aGVyZSBpcyAK
Pj4gbm8KPj4gL2Nob3NlbiBub2RlIGFuZCBpcyBzZXQgb24gYXJjaGl0ZWN0dXJlIHdoZXJlIHRo
ZSBzcGVjIG1hbmRhdGVzIAo+PiAvY2hvc2VuPwo+IAo+IEknZCBiZSBva2F5IHRvIG1ha2UgaXQg
YSB3YXJuaW5nIHVuY29uZGl0aW9uYWxseS4gQXQgbGVhc3QgdGhlbiB3ZSBjYW4KPiBmaW5kIHRo
ZSBjYXNlcyB0aGF0IGRldmlhdGUgYW5kIGVpdGhlciBmaXggdGhlbSBvciB1bmRlcnN0YW5kIHRo
ZWlyCj4gZXhwZWN0YXRpb25zLgo+IAo+IFJvYgoKSSBkb24ndCB0aGluayB3ZSBjYW4gbWFrZSAv
Y2hvc2VuIG5vZGUgbWFuZGF0b3J5IHNpbmNlIGl0J3Mgbm90IApzcGVjaWZpZWQgYXMgc3VjaApi
eSB0aGUgc3BlYyAKKGh0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kZXZpY2V0cmVl
LXNwZWNpZmljYXRpb24vcmVsZWFzZXMvdGFnL3YwLjIpLgpObyBtYXR0ZXIgd2hhdCB3ZSBzYXkg
ZnJvbSB0aGUga2VybmVsIHNpZGUsIHRoZSBkZXZpY2UgdHJlZSBwcm92aWRlciBpcyAKbm90IGV4
cGVjdGVkCnRvIGFsd2F5cyBwcm92aWRlIHRoZSAvY2hvc2VuIG1vZGUuIEFsc28gZGV2aWNlIHRy
ZWUgaXMgbm90IHRoZSBvbmx5IApwcm92aWRlciBvZgphIGNvbW1hbmQgbGluZSwgd2UgbWlnaHQg
Z2V0IGEgY29tbWFuZCBsaW5lIGZyb20gZGlmZmVyZW50IHBsYWNlcyAKcGVyLWFyY2ggKGUuZy4g
YXRhZ3MKb24gYXJtKSBvciB0aHJvdWdoIEVGSS9BQ1BJL2tleGVjIGFzIHdlbGwuIFRoYXQncyB3
aHkgbXkgaW5pdGlhbCAKYXBwcm9hY2ggZm9yIFJJU0MtVgp3YXMgb24gdGhlIGFyY2gtc3BlY2lm
aWMgY29kZS4KCldlIHNob3VsZG4ndCB0cnkgdG8gaGFuZGxlIHRoZSBidWlsdC1pbiBDTURMSU5F
IG9uIGVhY2ggb2YgdGhlIHBvc3NpYmxlIApjb21tYW5kIGxpbmUKcHJvdmlkZXJzIGFuZCBpZiB3
ZSBkbyB3ZSBzaG91bGQgYXQgbGVhc3QgbWFrZSBzdXJlIHdlIGRvbid0IGRlcGVuZCBvbiAKdGhl
IHByZXNlbmNlCm9mIGEgcHJvdmlkZWQgY29tbWFuZCBsaW5lICh3aGljaCBpcyB0aGUgaXNzdWUg
aW4gdGhpcyBjYXNlKS4KCkkgYmVsaWV2ZSB0aGUgYmVzdCBhcHByb2FjaCBpcyB0byBjb25zb2xp
ZGF0ZSBhbGwgdGhlIGRpZmZlcmVudCBDTURMSU5FIAphcHByb2FjaGVzCmZvciB0aGUgdmFyaW91
cyBhcmNocyAvIHByb3ZpZGVycyBhbmQgY2xlYW4gdXAgdGhlIG1lc3MgaW5zdGVhZCBvZiAKcmUt
aW1wbGVtZW50aW5nCnRoZSBzYW1lIHRoaW5nIGFnYWluIGFuZCBhZ2Fpbi4gSSBzYXcgdGhlIHBh
dGNoIHlvdSBtZW50aW9uZWQgYW5kIGl0J3MgYSAKc3RhcnQuCkknbGwgbG9vayBtb3JlIGludG8g
aXQgYW5kIHRyeSB0byBjb21lIHVwIHdpdGggYSBzaW1pbGFyIG9uZS4KCk5pY2sKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
