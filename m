Return-Path: <SRS0=ssm3=N3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50192C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 17:10:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE74720811
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 17:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ih+DNWR5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GRPR9jYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE74720811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H7xIlubKHnIX4HmYDEFRqCZfhV5evuzxB9fkUrO7Ku8=; b=Ih+DNWR5dCusz5OInI9zRi3MM
	nS3q4S1dL9Y+wWKz8Ac59iR6RNpl9vJ1G9KGd8i4bo3ebUl3MhPLAbKeMpqsZe23wAUm7W3e9lnhQ
	WB1cOGgVH2cF5udOczGGB8083z1s/XhzsiytL4XmgidYwsYQ170pNyRKKtDK3aWvVG+4Xf0XT0boM
	W66an0WC9ehVp+vjnlijC1+DsbjsNA8U7UvGl/47KfO11gO9L2M3/vPCRc3nX4oXQgMhrvDm1Yx3+
	lyGYHkzp6A1WuAVRgnZ6J+I1GviM1Qd0HRrEFtEM5d0jIVrX2Yg8q8kqMGXGZhOltYbkbNKgYvuHP
	yWPmnl/sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNhdA-0005XC-8J
	for infradead-linux-riscv@archiver.kernel.org; Fri, 16 Nov 2018 17:10:08 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNhd8-000517-8M
 for linux-riscv@bombadil.infradead.org; Fri, 16 Nov 2018 17:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KpFIXdZocBSHzfKzYx3ZMVujmSCzyuPhWGWs92GI4k0=; b=GRPR9jYVMiBkRu5nJZLgYDrD6y
 O2hiu6acjKcxTUrXcE6pvgeRZnZkFHPPi3Vur1mYUuESszaSK4LrrWb22plHWlXhIK63n8kq7DClc
 BJibMKBAIjMXhQ6Ulf1GscQvI71Xs81dw8f7MJg6rGxDCukXpEg3HHdNQ4IVmnE0vPgzRS0TwA5QS
 5NJs32ebkl9rjrW/S/ZzjHsUoF6UTOmcd9ieFnCMk2Seo7I7l6Io1ZwmPpe1m6X4zkSmoOHw08JSH
 wxxDu44LR7+Q7tWxXMwgvOGvOSSpYC3vf8JXbyRsXcdVWcRPI/m0tQA7K0XHpkq1jW2PTf43dWIzh
 VXHp76sw==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNhcu-00034x-3r
 for linux-riscv@lists.infradead.org; Fri, 16 Nov 2018 17:10:04 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAGH8CuM096914; Fri, 16 Nov 2018 19:08:14 +0200 (EET)
X-AuditID: 8b5b9d4d-903ff70000000e62-61-5beef97c060c
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 87.64.03682.C79FEEB5; Fri, 16 Nov 2018 19:08:12 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAGH8CWK012487; Fri, 16 Nov 2018 19:08:12 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 16 Nov 2018 19:08:12 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
Organization: FORTH
In-Reply-To: <mhng-314e946b-3b14-467c-ad23-85983b75cd8d@palmer-si-x1c4>
References: <mhng-314e946b-3b14-467c-ad23-85983b75cd8d@palmer-si-x1c4>
Message-ID: <86b0b7bc82f6f9b55cfdc7281f4941db@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRmVeSWpSXmKPExsXSHc2orFvz8120wZEdShZbf89it9j2uYXN
 ovndOXaLzRMWsDqweBzu+MLu8XDTJSaPzUvqPS41X2cPYInisklJzcksSy3St0vgyui9385a
 8EqjYvKDXsYGxr+yXYycHBICJhLb9v5jB7GFBI4wSny/KNfFyAVkH2KUmNA6lxWiyFRi9t5O
 RhCbV0BQ4uTMJywgNrOAhcTUK/sZIWx5ieats5lBbBYBVYnGj/vBhrIJaErMv3QQrF5EQE3i
 UNMRqHpfiW3Tz4PVCwu4SLx8fIUNxOYXEJb4dPci2F5OAXeJJbtfQh3nJjHryAFmiBtcJK5O
 ewJ1m4rEh98PwGpEBZQlXpyYzjqBUWgWklNnITl1FpJTFzAyr2IUSCwz1stMLtZLyy8qydBL
 L9rECA7xub47GM8tsD/EKMDBqMTDW/HoXbQQa2JZcWUuMGA4mJVEeH+8AArxpiRWVqUW5ccX
 leakFh9ilOZgURLnPfwiPEhIID2xJDU7NbUgtQgmy8TBKdXAuG7HvzmBs9aHrS6PP/2zW/op
 f3RM82yhzpB1Gyzydyy8mT314vtbjzfOXhhvcfnsze82ryfUx/Jek3+mJBBYvSmsaE+Vmpv3
 5rQWpbNsItEfDr751fX8lHV48IdKiYPSeSvmn3b6LR0rpsnRGWY1Nzq5XeO979L7AtPmcT1t
 Tis7X/W2++W+CUosxRmJhlrMRcWJANkO2vFtAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_121002_304637_ABEE8D9C 
X-CRM114-Status: GOOD (  28.93  )
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
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181116170812.HhVoQBWuY2z8VE0DI3Ytfvsnlp0uHVNMTScvzS7G77M@z>

zqPPhM65z4IgMjAxOC0xMS0xNiAxODo1MiwgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IE9uIEZyaSwgMDkgTm92IDIwMTggMTc6MDI6NDQgUFNUICgtMDgwMCksIG1pY2tAaWNzLmZvcnRo
LmdyIHdyb3RlOgo+PiBBZGQgYSBtZW51IHRvIGNob3NlIGhvdyB0aGUgYnVpbHQtaW4gY29tbWFu
ZCBsaW5lIHdpbGwgYmUKPj4gdXNlZCBhbmQgYWRkIENNRExJTkVfRVhURU5EIGZvciBjb21wYXRp
YmlsaXR5IHdpdGggRkRUIGNvZGUuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlk
aXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDQ1
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBpbmRleCA1
NWRhOTNmNGU4MTguLjgxZjg4NDE2NGI1MiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9LY29u
ZmlnCj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiBAQCAtMjI3LDM5ICsyMjcsNDIgQEAg
ZW5kbWVudQo+PiAKPj4gIG1lbnUgIkJvb3Qgb3B0aW9ucyIKPj4gCj4+IC1jb25maWcgQ01ETElO
RV9CT09MCj4+IC0JYm9vbCAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSIKPj4gK2NvbmZp
ZyBDTURMSU5FCj4+ICsJc3RyaW5nICJCdWlsdC1pbiBrZXJuZWwgY29tbWFuZCBsaW5lIgo+PiAg
CWhlbHAKPj4gIAkgIEZvciBtb3N0IHBsYXRmb3JtcywgaXQgaXMgZmlybXdhcmUgb3Igc2Vjb25k
IHN0YWdlIGJvb3Rsb2FkZXIKPj4gIAkgIHRoYXQgYnkgZGVmYXVsdCBzcGVjaWZpZXMgdGhlIGtl
cm5lbCBjb21tYW5kIGxpbmUgb3B0aW9ucy4KPj4gIAkgIEhvd2V2ZXIsIGl0IG1pZ2h0IGJlIG5l
Y2Vzc2FyeSBvciBhZHZhbnRhZ2VvdXMgdG8gZWl0aGVyIG92ZXJyaWRlCj4+IC0JICB0aGUgZGVm
YXVsdCBrZXJuZWwgY29tbWFuZCBsaW5lIG9yIGFkZCBhIGZldyBleHRyYSBvcHRpb25zIHRvIGl0
Lgo+PiAtCSAgRm9yIHN1Y2ggY2FzZXMsIHRoaXMgb3B0aW9uIGFsbG93cyBoYXJkY29kaW5nIGNv
bW1hbmQgbGluZSBvcHRpb25zCj4+IC0JICBkaXJlY3RseSBpbnRvIHRoZSBrZXJuZWwuCj4+ICsJ
ICB0aGUgcHJvdmlkZWQga2VybmVsIGNvbW1hbmQgbGluZSBvciBhZGQgYSBmZXcgZXh0cmEgb3B0
aW9ucyB0byBpdC4KPj4gKwkgIEZvciBzdWNoIGNhc2VzLCBpdCBpcyBwb3NzaWJsZSB0byBkZWZp
bmUgYSBidWlsdC1pbiBjb21tYW5kIGxpbmUKPj4gKwkgIGhlcmUgYW5kIGNob3NlIGhvdyB0aGUg
a2VybmVsIHNob3VsZCB1c2UgaXQgbGF0ZXIgb24uCj4+IAo+PiAtCSAgRm9yIHRoYXQsIGNob29z
ZSAnWScgaGVyZSBhbmQgZmlsbCBpbiB0aGUgZXh0cmEgYm9vdCBwYXJhbWV0ZXJzCj4+IC0JICBp
biBDT05GSUdfQ01ETElORS4KPj4gK2Nob2ljZQo+PiArCXByb21wdCAiQnVpbHQtaW4gY29tbWFu
ZCBsaW5lIHVzYWdlIiBpZiBDTURMSU5FICE9ICIiCj4+ICsJZGVmYXVsdCBDTURMSU5FX0ZBTExC
QUNLCj4+ICsJaGVscAo+PiArCSAgQ2hvc2UgaG93IHRoZSBrZXJuZWwgd2lsbCBoYW5kbGUgdGhl
IHByb3ZpZGVkIGJ1aWx0LWluIGNvbW1hbmQKPj4gKwkgIGxpbmUuCj4+IAo+PiAtCSAgVGhlIGJ1
aWx0LWluIG9wdGlvbnMgd2lsbCBiZSBjb25jYXRlbmF0ZWQgdG8gdGhlIGRlZmF1bHQgY29tbWFu
ZAo+PiAtCSAgbGluZSBpZiBDTURMSU5FX0ZPUkNFIGlzIHNldCB0byAnTicuIE90aGVyd2lzZSwg
dGhlIGRlZmF1bHQKPj4gLQkgIGNvbW1hbmQgbGluZSB3aWxsIGJlIGlnbm9yZWQgYW5kIHJlcGxh
Y2VkIGJ5IHRoZSBidWlsdC1pbiBzdHJpbmcuCj4+ICtjb25maWcgQ01ETElORV9GQUxMQkFDSwo+
PiArCWJvb2wgIkZhbGxiYWNrIgo+PiArCWhlbHAKPj4gKwkgIFVzZSB0aGUgYnVpbHQtaW4gY29t
bWFuZCBsaW5lIGFzIGZhbGxiYWNrIGluIGNhc2Ugd2UgZ2V0IG5vdGhpbmcKPj4gKwkgIGZyb20g
dGhlIGJvb3QgbG9hZGVyLgo+PiAKPj4gLWNvbmZpZyBDTURMSU5FCj4+IC0Jc3RyaW5nICJCdWls
dC1pbiBrZXJuZWwgY29tbWFuZCBzdHJpbmciCj4+IC0JZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wK
Pj4gLQlkZWZhdWx0ICIiCj4+ICtjb25maWcgQ01ETElORV9FWFRFTkQKPj4gKwlib29sICJFeHRl
bnNpb24iCj4+ICAJaGVscAo+PiAtCSAgU3VwcGx5IGNvbW1hbmQtbGluZSBvcHRpb25zIGF0IGJ1
aWxkIHRpbWUgYnkgZW50ZXJpbmcgdGhlbSBoZXJlLgo+PiArCSAgVXNlIHRoZSBidWlsdC1pbiBj
b21tYW5kIGxpbmUgYXMgYW4gZXh0ZW5zaW9uIG9mIHRoZSBjb21tYW5kIGxpbmUKPj4gKwkgIHBy
b3ZpZGVkIGJ5IHRoZSBib290IGxvYWRlci4KPj4gCj4+ICBjb25maWcgQ01ETElORV9GT1JDRQo+
PiAtCWJvb2wgIkJ1aWx0LWluIGNvbW1hbmQgbGluZSBvdmVycmlkZXMgYm9vdGxvYWRlciBhcmd1
bWVudHMiCj4+IC0JZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wKPj4gKwlib29sICJGb3JjZWQiCj4+
ICAJaGVscAo+PiAtCSAgU2V0IHRoaXMgb3B0aW9uIHRvICdZJyB0byBoYXZlIHRoZSBrZXJuZWwg
aWdub3JlIHRoZSBib290bG9hZGVyCj4+IC0JICBvciBmaXJtd2FyZSBjb21tYW5kIGxpbmUuICBJ
bnN0ZWFkLCB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lCj4+IC0JICB3aWxsIGJlIHVzZWQgZXhj
bHVzaXZlbHkuCj4+ICsJICBVc2UgdGhlIGJ1aWx0LWluIGNvbW1hbmQgbGluZSBpbiBwbGFjZSBv
ZiB0aGUgY29tbWFuZCBsaW5lCj4+ICsJICBwcm92aWRlZCBieSB0aGUgYm9vdCBsb2FkZXIuCj4+
IAo+PiAtCSAgSWYgeW91IGRvbid0IGtub3cgd2hhdCB0byBkbyBoZXJlLCBzYXkgTi4KPj4gK2Vu
ZGNob2ljZQo+PiAKPj4gIGVuZG1lbnUKPiAKPiBJdCBsb29rcyBsaWtlIHRoaXMgaXMgZnVuY3Rp
b25hbGx5IGVxdWl2YWxlbnQgdG8gd2hhdCBBUk0gaGFzLCBidXQgdGhlCj4gcG9sYXJpdHkgaXMg
YSBiaXQgZGlmZmVyZW50IGFuZCB0aGUgaGVscCBzdHJpbmdzIGFyZW4ndCBhcyBlYXN5IHRvCj4g
cmVhZC4gIElzIHRoZXJlIGEgcmVhc29uIHdlIGNhbid0IGp1c3QgY29weSB3aGF0IHRoZXkgZG8/
Cj4gCj4gICAgY29uZmlnIENNRExJTkUKPiAgICAgICAgICAgIHN0cmluZyAiRGVmYXVsdCBrZXJu
ZWwgY29tbWFuZCBzdHJpbmciCj4gICAgICAgICAgICBkZWZhdWx0ICIiCj4gICAgICAgICAgICBo
ZWxwCj4gICAgICAgICAgICAgIE9uIHNvbWUgYXJjaGl0ZWN0dXJlcyAoRUJTQTExMCBhbmQgQ0FU
UyksIHRoZXJlIGlzIAo+IGN1cnJlbnRseSBubyB3YXkKPiAgICAgICAgICAgICAgZm9yIHRoZSBi
b290IGxvYWRlciB0byBwYXNzIGFyZ3VtZW50cyB0byB0aGUga2VybmVsLiBGb3IgCj4gdGhlc2UK
PiAgICAgICAgICAgICAgYXJjaGl0ZWN0dXJlcywgeW91IHNob3VsZCBzdXBwbHkgc29tZSBjb21t
YW5kLWxpbmUgb3B0aW9ucyAKPiBhdCBidWlsZAo+ICAgICAgICAgICAgICB0aW1lIGJ5IGVudGVy
aW5nIHRoZW0gaGVyZS4gQXMgYSBtaW5pbXVtLCB5b3Ugc2hvdWxkIAo+IHNwZWNpZnkgdGhlCj4g
ICAgICAgICAgICAgIG1lbW9yeSBzaXplIGFuZCB0aGUgcm9vdCBkZXZpY2UgKGUuZy4sIG1lbT02
NE0gCj4gcm9vdD0vZGV2L25mcykuCj4gICAgICAgY2hvaWNlCj4gICAgICAgICAgICBwcm9tcHQg
Iktlcm5lbCBjb21tYW5kIGxpbmUgdHlwZSIgaWYgQ01ETElORSAhPSAiIgo+ICAgICAgICAgICAg
ZGVmYXVsdCBDTURMSU5FX0ZST01fQk9PVExPQURFUgo+ICAgICAgICAgICAgZGVwZW5kcyBvbiBB
VEFHUwo+ICAgICAgIGNvbmZpZyBDTURMSU5FX0ZST01fQk9PVExPQURFUgo+ICAgICAgICAgICAg
Ym9vbCAiVXNlIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyBpZiBhdmFpbGFibGUiCj4gICAg
ICAgICAgICBoZWxwCj4gICAgICAgICAgICAgIFVzZXMgdGhlIGNvbW1hbmQtbGluZSBvcHRpb25z
IHBhc3NlZCBieSB0aGUgYm9vdCBsb2FkZXIuIAo+IElmCj4gICAgICAgICAgICAgIHRoZSBib290
IGxvYWRlciBkb2Vzbid0IHByb3ZpZGUgYW55LCB0aGUgZGVmYXVsdCBrZXJuZWwgCj4gY29tbWFu
ZAo+ICAgICAgICAgICAgICBzdHJpbmcgcHJvdmlkZWQgaW4gQ01ETElORSB3aWxsIGJlIHVzZWQu
Cj4gICAgICAgY29uZmlnIENNRExJTkVfRVhURU5ECj4gICAgICAgICAgICBib29sICJFeHRlbmQg
Ym9vdGxvYWRlciBrZXJuZWwgYXJndW1lbnRzIgo+ICAgICAgICAgICAgaGVscAo+ICAgICAgICAg
ICAgICBUaGUgY29tbWFuZC1saW5lIGFyZ3VtZW50cyBwcm92aWRlZCBieSB0aGUgYm9vdCBsb2Fk
ZXIgCj4gd2lsbCBiZQo+ICAgICAgICAgICAgICBhcHBlbmRlZCB0byB0aGUgZGVmYXVsdCBrZXJu
ZWwgY29tbWFuZCBzdHJpbmcuCj4gICAgICAgY29uZmlnIENNRExJTkVfRk9SQ0UKPiAgICAgICAg
ICAgIGJvb2wgIkFsd2F5cyB1c2UgdGhlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgo+
ICAgICAgICAgICAgaGVscAo+ICAgICAgICAgICAgICBBbHdheXMgdXNlIHRoZSBkZWZhdWx0IGtl
cm5lbCBjb21tYW5kIHN0cmluZywgZXZlbiBpZiB0aGUgCj4gYm9vdAo+ICAgICAgICAgICAgICBs
b2FkZXIgcGFzc2VzIG90aGVyIGFyZ3VtZW50cyB0byB0aGUga2VybmVsLgo+ICAgICAgICAgICAg
ICBUaGlzIGlzIHVzZWZ1bCBpZiB5b3UgY2Fubm90IG9yIGRvbid0IHdhbnQgdG8gY2hhbmdlIHRo
ZQo+ICAgICAgICAgICAgICBjb21tYW5kLWxpbmUgb3B0aW9ucyB5b3VyIGJvb3QgbG9hZGVyIHBh
c3NlcyB0byB0aGUgCj4ga2VybmVsLgo+ICAgIGVuZGNob2ljZQo+ICAgIEknbSBub3QgcmVhbGx5
IG9wcG9zZWQgdG8geW91ciBzb2x1dGlvbiwgSSdtIGp1c3QgdHJ5aW5nIHRvIGF2b2lkCj4gYmVp
bmcgZGlmZmVyZW50IHdpdGhvdXQgYSByZWFzb24uCgpBVEFHUyBhbmQgcmVmZXJlbmNlcyB0byBB
Uk0gcGxhdGZvcm1zIHN1Y2ggYXMgRUJTQTExMCBhcmUgbm90IHJlbGF0ZWQgdG8gClJJU0MtVgph
bmQgSSB0aGluayBDTURMSU5FX0ZBTExCQUNLIGlzIG1vcmUgZGVzY3JpcHRpdmUgdGhhbiAKQ01E
TElORV9GUk9NX0JPT1RMT0FERVIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
