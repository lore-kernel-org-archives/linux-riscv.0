Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BADC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 10:47:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF502083D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 10:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kuSRD9V4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V4uNDvAC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EF502083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XrOOwqVW8j1PjlwzyzsJd0PN8nfQgPwoekcYrcGshtY=; b=kuSRD9V4zSJumDOBIGAB61oGc
	BLJjryF4tjy9jGxit2mCoL0xhUhAOLxf18YVw4GmoPcco34FlMvMPZAvKYVaSAeBotP6gg+nmqWRJ
	9Z7xRf31+uUBKwm3PJp1i/rtDZl2jVkq9gFMYC/4QxO8SpcnwI1DxHeY+62IuxHUF62qE8Ht5dGCL
	7m+gsvZ35rUtZwc2whM008d80IfsJTsiD6teFcXoAGMHYJ5Ck+CWFt1eBUPFarkG6zDwNBdSWGA5T
	XVo9YhL+gLRlj/e/dNCjqwCn/VKxmhWMDJaJcMye83OiH1Lp5uVXToNSy+swmAh3UCe7nPhKh9A5h
	IMINeeoFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJytq-0004HZ-Eg; Tue, 06 Nov 2018 10:47:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJytp-0004HR-A3
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 10:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cv3/y1e96PXpXF6Ibc7ILh12PZwPSe5M1ol/6ykfbEc=; b=V4uNDvAC53LewSJcgqUErR4gWO
 WDrBcwbm7MM24zpMurQ+UE6z2KjPTLbGwuOHnd+SwrAmoe8ndyn2RiG265aBOI6VC2aHhRH4PubbM
 4MseyP64FqMeKYTHpHADLGZcvzzPlvnpI62zZCf8zOK5sJFGHoGxLDwne18np9lXCgoxB7sJHVjoP
 H2O9Ec82RexkFW/KreQ/Q6GR76k5ROLfp5DF/EOesA8TMeAjJzFKPKVPYd3IjkoEYOGqB+kbIegOF
 r42k8fJsYNhxHvcndc2xBDgEfWH9INn7VlwjTrdRHHWG05jOfetHjwiDCPx/f/Ada5vHu4woKN4KV
 eF/9ImOw==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJytl-0004Qp-Uz
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 10:47:56 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wA6AkKSw052718; Tue, 6 Nov 2018 12:46:22 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-a0-5be170fc3455
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 9C.B8.03682.CF071EB5; Tue,  6 Nov 2018 12:46:20 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wA6AkJRn018194; Tue, 6 Nov 2018 12:46:19 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 06 Nov 2018 12:46:19 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [sw-dev] About the Use of sfence.vma in Kernel
Organization: FORTH
In-Reply-To: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
References: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
Message-ID: <e70484a0ac93bc3cff4865bb2772f8b5@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsXSHc2orPun4GG0wcwH3BbblqxmtXi8vofR
 YtvnFjaLzRMWsFpsf9HP5sDqsef0LGaPma8eMnlsXlLvcan5OnsASxSXTUpqTmZZapG+XQJX
 xpEdPAWflSu2/7rE3MC4W6aLkZNDQsBE4sm850xdjFwcQgJHGCUOd75ig3AOMkpsmLKDGaLK
 VGL23k5GEJtXQFDi5MwnLCA2s4CFxNQr+xkhbHmJ5q2zgeo5OFgEVCUWH5MDCbMJaErMv3QQ
 rFxEQE3iUNMRqPJSiaMz/rOAlAsLWEs8WMYEEuYXEJb4dPciK4jNKeAu8WvtHXYQW0jATeJR
 8ylmiAtcJNae/88OcZmKxIffD8BsUQFliRcnprNOYBSaheTQWUgOnYXk0AWMzKsYBRLLjPUy
 k4v10vKLSjL00os2MYIDfa7vDsZzC+wPMQpwMCrx8HIUPIgWYk0sK67MPcQowcGsJMKrxAYU
 4k1JrKxKLcqPLyrNSS0+xCjNwaIkznv4RXiQkEB6YklqdmpqQWoRTJaJg1OqgVFRKnXT2kNx
 C5k2bE8828ct0lagLbtSZF/E1VUvPh66KHR9y/9czf8Gwt+W7Dqdv4WlluWIdN1CviCeo9Ou
 8K1cpunqpyXtJv0sTmJaaaiSXiLnZf9VPMmJBvVO/a+2ef2YvkHukt4McSPeIB6r4qiTnw6n
 CnxTS93F8mLKc6d1NzflP0wJXK7EUpyRaKjFXFScCACBNf3McAIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_104754_206664_64B9A82D 
X-CRM114-Status: GOOD (  35.81  )
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
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org,
 alankao@andestech.com, greentime@andestech.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106104619.M8N5LdejjQ8CL00_2wxg1mCh6ZNyvu2xyogr6cqyZ18@z>

zqPPhM65z4IgMjAxOC0xMS0wNiAwNDozMywgUGFsbWVyIERhYmJlbHQgzq3Os8+BzrHPiM61Ogo+
IFNvcnJ5LCBJIG1pc3NlZHkgb3VyIG9yaWdpbmFsIGVtYWlsLgo+IAo+IE9uIFN1biwgMDQgTm92
IDIwMTggMTY6NDk6MjkgUFNUICgtMDgwMCksIGFsYW5rYW9AYW5kZXN0ZWNoLmNvbSB3cm90ZToK
Pj4gSGkgUGFsbWVyLAo+PiAKPj4gSSBiZWxpZXZlIHRoZSBjb2RlIGluIGFyY2gvcmlzY3YvbW0v
ZmF1bHQuYyBpcyBtb3N0bHkgZnJvbSB5b3UuCj4+IERvIHlvdSBoYXZlIGFueSBjb21tZW50cyBv
biB0aGlzPwo+PiAKPj4gT24gVGh1LCBOb3YgMDEsIDIwMTggYXQgMDU6MDA6MTVQTSArMDgwMCwg
QWxhbiBLYW8gd3JvdGU6Cj4+PiBIaSBhbGwsCj4+PiAKPj4+IEFzIG1lbnRpb25lZCBpbiB0aGUg
UHJpdmlsZWdlZCBTcGVjIGFib3V0IHNmZW5jZS52bWEgaW5zdHJ1Y3Rpb246Cj4+PiAKPj4+ID4g
VGhlIHN1cGVydmlzb3IgbWVtb3J5LW1hbmFnZW1lbnQgZmVuY2UgaW5zdHJ1Y3Rpb24gU0ZFTkNF
LlZNQSBpcyB1c2VkCj4+PiA+IHRvIHN5bmNocm9uaXplIHVwZGF0ZXMgdG8gaW4tbWVtb3J5IG1l
bW9yeS1tYW5hZ2VtZW50IGRhdGEgc3RydWN0dXJlcwo+Pj4gPiB3aXRoIGN1cnJlbnQgZXhlY3V0
aW9uLiAgSW5zdHJ1Y3Rpb24gZXhlY3V0aW9uIGNhdXNlcyBpbXBsaWNpdCByZWFkcwo+Pj4gPiBh
bmQgd3JpdGVzIHRvIHRoZXNlIGRhdGEgc3RydWN0dXJlczsgIGhvd2V2ZXIsIHRoZXNlIGltcGxp
Y2l0IHJlZmVyZW5jZXMKPj4+ID4gYXJlIG9yZGluYXJpbHkgbm90IG9yZGVyZWQgd2l0aCByZXNw
ZWN0IHRvIGxvYWRzIGFuZCBzdG9yZXMgaW4gdGhlIGluc3RydWN0aW9uCj4+PiA+IHN0cmVhbS4K
Pj4+ID4KPj4+ID4gRXhlY3V0aW5nIGFuIFNGRU5DRS5WTUEgaW5zdHJ1Y3Rpb24gZ3VhcmFudGVl
cyB0aGF0IGFueSBzdG9yZXMgaW4gdGhlCj4+PiA+IGluc3RydWN0aW9uIHN0cmVhbSBwcmlvciB0
byB0aGUgU0ZFTkNFLlZNQSBhcmUgb3JkZXJlZCBiZWZvcmUgYWxsIGltcGxpY2l0Cj4+PiA+IHJl
ZmVyZW5jZXMgc3Vic2VxdWVudCB0byB0aGUgU0ZFTkNFLlZNQS4KPj4+IAo+Pj4gSXQgbmF0dXJh
bGx5IGZvbGxvd3MgdGhhdCB3ZSBzaG91bGQgdXNlIHNmZW5jZS52bWEgb25jZSB0aGUgcGFnZSAK
Pj4+IHRhYmxlIGlzCj4+PiBtb2RpZmllZC4gIFRoZXJlIGFyZSBzZXZlcmFsIGV4YW1wbGVzIGlu
IHRoZSBrZXJuZWwgYWxyZWFkeSwgc3VjaCBhcwo+Pj4gCj4+PiBhbGxvY19zZXRfcHRlIChpbiBt
bS9tZW1vcnkuYyk6Cj4+PiAuLi4KPj4+ICAgICAgICAgc2V0X3B0ZV9hdCh2bWEtPnZtX21tLCB2
bWYtPmFkZHJlc3MsIHZtZi0+cHRlLCBlbnRyeSk7Cj4+PiAgICAgICAgIC8qIG5vIG5lZWQgdG8g
aW52YWxpZGF0ZTogYSBub3QtcHJlc2VudCBwYWdlIHdvbid0IGJlIGNhY2hlZCAKPj4+ICovCj4+
PiAgICAgICAgIHVwZGF0ZV9tbXVfY2FjaGUodm1hLCB2bWYtPmFkZHJlc3MsIHZtZi0+cHRlKTsK
Pj4+IC4uLgo+Pj4gd2hlcmUgdGhlIHVwZGF0ZV9tbXVfY2FjaGUgZnVuY3Rpb24gZXZlbnR1YWxs
eSBpc3N1ZXMgYSBzZmVuY2Uudm1hLgo+Pj4gCj4+PiBJIHdhcyBpbnRlcmVzdGVkIGlmIGl0IGlz
IGFsd2F5cyB0aGUgY2FzZSBhbmQgZGlkIHNvbWUgcmVzZWFyY2guICAKPj4+IFJWNjQgdXNlcwo+
Pj4gMy1sZXZlbCBvZiBwYWdlIHRhYmxlIGVudHJ5LCBwdWQsIHBtZCBhbmQgcHRlLCBzbyBJIHRy
YWNlZCBhIGxpdHRsZSAKPj4+IGJpdCBhYm91dAo+Pj4gdGhlIGNvZGUgZmxvdyBhZnRlciBzZXRf
cHVkLCBzZXRfcG1kIGFuZCBzZXRfcHRlLgo+Pj4gCj4+PiBJdCB0dXJucyBvdXQgdGhhdCBzb21l
IG9mIHRoZSBjYWxscyB0byB0aGVtIGFyZSBub3QgZm9sbG93ZWQgYnkgYQo+Pj4gc2ZlbmNlLnZt
YS4gIEZvciBhbiBpbnN0YW5jZSwgaW4gdGhlIHZtYWxsb2NfZmF1bHQgcmVnaW9uIGluIAo+Pj4g
ZG9fcGFnZV9mYXVsdCwKPj4+IHRoZXJlIGlzIG5vIHNmZW5jZS52bWEgb3IgY2FsbHMgdG8gaXQg
YWZ0ZXIgc2V0X3BnZCwgd2hpY2ggZGlyZWN0cyB0byAKPj4+IHNldF9wdWQKPj4+IGxhdGVyLgo+
IAo+IFRoaXMgc3BlY2lmaWMgb25lIGxvb2tzIGxpa2UgYSBidWc6IHdlJ3JlIHRyeWluZyB0byBm
aWxsIG91dCB0aGUgcGFnZQo+IHRhYmxlIGZvciB0aGUgdm1hbGxvYyByZWdpb24sIGJ1dCB3ZSds
bCBqdXN0IGNvbnRpbnVlIHRyYXBwaW5nIHdpdGhvdXQKPiBhbiAic2ZlbmNlLnZtYSIuICBUaGUg
cGF0aCBiZXR3ZWVuIHBva2luZyB0aGUgcGFnZSB0YWJsZXMgYW5kIHRoZSBzcmV0Cj4gaXMgcHJl
dHR5IHNob3J0IGFuZCBkb2Vzbid0IGFwcGVhciB0byBldmVyIGhhdmUgYW4gInNmZW5jZS52bWEi
LCBzbwo+IEknbSBub3Qgc3VyZSBob3cgdGhpcyBjb3VsZCB3b3JrLgo+IAo+Pj4gCj4+PiBBcmUg
dGhleSBidWdzIG9yIEkganVzdCBtaXN1bmRlcnN0YW5kIHRoZSBpbnN0cnVjdGlvbj8gIEFzIHRo
ZSBrZXJuZWwgCj4+PiBoYXMKPj4+IGFscmVhZHkgYmVlbiBzdGFibGUgZm9yIHF1aXRlIGEgd2hp
bGUgbm93LCBpdCBpcyBub3QgbGlrZWx5IHRvIGJlIGEgCj4+PiBjcml0aWNhbAo+Pj4gYnVnLgo+
Pj4gCj4+PiBBbnkgY2xhcmlmaWNhdGlvbiB3aWxsIGhpZ2hseSBhcHByZWNpYXRlZC4KPiAKPiBX
ZWxsLCBjZXJ0YWlubHkgZnJvbSB0aGlzIGl0IGxvb2tzIHByZXR0eSBicm9rZW4gLS0gYW5kIGlu
IGEgbWFubmVyCj4gSSdkIGV4cGVjdCB0byB0cmlnZ2VyIGZyZXF1ZW50bHkuICBUaGVyZSBhcmUg
bm8gZmVuY2VzIGluIGFueSBvZiB0aGUKPiBvdGhlciBzaW1pbGFyLWxvb2tpbmcgaW1wbGVtZW50
YXRpb25zLgo+IAo+IE1heWJlIEknbSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlPwo+IAoKVGhpcyBp
cyBub3Qgc29tZXRoaW5nIHdlIGNhbiBjYXRjaCBvbiBRRU1VIGFuZCBJIHRoaW5rIFRpbGVMaW5r
IHVzZWQgb24gClNpRml2ZQpib2FyZHMgY2FuIGJlIGNvaGVyZW50IGJ5IGRlc2lnbiAoVEwtQykg
c28gbWF5YmUgdGhhdCdzIHdoeSB5b3UgZG9uJ3QgCmdldCBhbnkKZmFpbHVyZXMuCgpCVFcgaGVy
ZSBpcyBob3cgYXJtIGRvZXMgaXQgb24gYXJtNjQgYW5kIEkgdGhpbmsgdGhlaXIgY29kZSBpcyBj
bGVhbiwgCmluc3RlYWQgb2YKc2ZlbmNlIHRoZXkgdXNlIGRzYiwgbWF5YmUgd2UgY2FuIGdldCBz
b21lIGlkZWEgb24gd2hlbiB3ZSBzaG91bGQgZmVuY2UuCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgK
Ckhvd2V2ZXIgSSBoYXZlIGEgcXVlc3Rpb246IElmIEkgZ2V0IHRoaXMgcmlnaHQgdGhlIHdlYWsg
bWVtb3J5IG1vZGVsIG9mIApSSVNDLVYKYWxsb3dzIHVzIHRvIGRvIHN0dWZmIG9uIG9uZSBjb3Jl
IHdpdGhvdXQgaGF2aW5nIHRvIG5vdGlmeSB0aGUgb3RoZXJzLCAKYXMgbG9uZwphcyB0aGUgY29k
ZSBrZWVwcyBydW5uaW5nIG9uIHRoZSBzYW1lIGNvcmUgKGl0IGRvZXNuJ3QgcHJvdmlkZSAKZ3Vh
cmFudGVlcyBmb3IKbXVsdGktY29yZSBzeXN0ZW1zKS4gQWxzbyB3aGVuIHdlIGhhdmUgaGFydHMg
c2hhcmluZyB0aGUgc2FtZSBjYWNoZSB3ZSAKYWxzbwpkb24ndCBuZWVkIHRvIHNmZW5zZSwgd2Ug
YWxzbyBkb24ndCBuZWVkIHRvIGRvIGl0IHdoZW4gY2FjaGVzIGFyZSAKY29oZXJlbnQKYW55d2F5
IGFuZCBzaW5jZSBjYWNoZSBjb2hlcmVuY3kgaXMgaW1wbGVtZW50YXRpb24tc3BlY2lmaWMgbWF5
YmUgZG9pbmcgCnRoaXMgZm9yCmV2ZXJ5Ym9keSBpc24ndCB0aGUgcmlnaHQgYXBwcm9hY2guIFNm
ZW5jZSBpcyBleHBlbnNpdmUsIGl0J3MgZG9uZSBmb3IgCnRoZSB3aG9sZQptZW1vcnkgYW5kIGlm
IHdlIGRvIGl0IG9uIGV2ZXJ5IGNvbnRleHQgc3dpdGNoIGl0IG1heSBpbnRyb2R1Y2Ugc29tZSAK
dW53YW50ZWQKb3ZlcmhlYWQuCgpTb21lIGlkZWFzOgoKYSkgSGF2ZSBhIGZ1bmN0aW9uIChtYXli
ZSBhIGZ1bmN0aW9uIHBvaW50ZXIgb24gc29tZSAKcGxhdGZvcm0vYm9hcmQtc3BlY2lmaWMKc3Ry
dWN0LCBhIHJlbGV2YW50IGRpc2N1c3Npb24gaGVyZSAtPiAKaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMTgvMTAvMzEvNDMxKSB0aGF0CmltcGxlbWVudHMgc2ZlbmNlIGZvciB0aGlzIHB1cnBvc2Ug
aWYgbmVlZGVkLiBJZiBpdCdzIG5vdCBuZWVkZWQgaXQnbGwgCmJlIGEgbm9wLApzbyBjaGlwcyB0
aGF0IGhhdmUgY29oZXJlbnQgY2FjaGVzIHdvbid0IGhhdmUgdG8gc2ZlbmNlIG9uIGV2ZXJ5IHBh
Z2UgCnRhYmxlIHVwZGF0ZS4KCmIpIFVzZSBzb21lIGZlZWRiYWNrIGZyb20gdGhlIHNjaGVkdWxl
ciwgZm9yIGV4YW1wbGUgaWYgdGhlIHByb2Nlc3MncyAKY3B1IGFmZmluaXR5CnNheXMgdGhhdCB0
aGlzIHByb2Nlc3MgaXMgcGlubmVkIG9uIGEgc2luZ2xlIGNvcmUgb3IgdGhhdCBpdCdzIG9ubHkg
CnNjaGVkdWxlZCBvbgpjb3JlcyB0aGF0IHNoYXJlIHRoZWlyIGNhY2hlLCB3ZSBjYW4gYWdhaW4g
c2tpcCBzZmVuY2UuCgpSZWdhcmRzLApOaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
