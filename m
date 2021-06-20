Return-Path: <SRS0=Y/ze=LO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA58C48BDF
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Jun 2021 10:03:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB5936102A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Jun 2021 10:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB5936102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywwvJwD7Wwudmhz71qcV5rnbItw1NfM83cTwwsflEs8=; b=tf2lhKEdIX6u+sX0Pn6rR8LhNC
	XOBVvGSNwLvX6+pmKLKa5kFln//+W6ytRCuD0EtEqqzDBw0MVkvPfx0389cHK1bgr/EHc1ai59f9D
	LaXU5yIY/nGPpoooF8gwedyv/dyNq5JhoSoTxG0HPaTFInOTipY/nw3pe67ojB7yZmF5eZOEo9m0H
	iSXaUWEfa51wshba2bNoC1FdgkzwanoQhrKlmMyfI72ZG2/zetY4V4XU45QzlEl4sdAywHZhYAmS4
	XEd4I0JTY8CKJom313uiiDWrtvlIW7vOw0GDjlvLZCjwp2OUpYQ/hS436/llElvO7wPiY16O9ZuHS
	VV34giBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luuI3-000oNV-Ns; Sun, 20 Jun 2021 10:02:55 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luuHw-000oMX-3u
 for linux-riscv@lists.infradead.org; Sun, 20 Jun 2021 10:02:49 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.18])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1luuHn-0007q2-Mg; Sun, 20 Jun 2021 11:02:39 +0100
Subject: Re: [PATCH v2 0/5] riscv: improving uaccess with logs from network
 bench
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <542310bc-840d-d5c9-a7b3-40f58504e7b5@codethink.co.uk>
Date: Sun, 20 Jun 2021 11:02:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_030248_208799_28B51402 
X-CRM114-Status: GOOD (  19.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTkvMDYvMjAyMSAxMjoyMSwgQWtpcmEgVHN1a2Ftb3RvIHdyb3RlOgo+IE9wdGltaXppbmcg
Y29weV90b191c2VyIGFuZCBjb3B5X2Zyb21fdXNlci4KPiAKPiBJIHJld3JvdGUgdGhlIGZ1bmN0
aW9ucyBpbiB2MiwgaGVhdmlseSBpbmZsdWVuY2VkIGJ5IEdhcnJ5J3MgbWVtY3B5Cj4gZnVuY3Rp
b24gWzFdLgo+IFRoZSBmdW5jdGlvbnMgbXVzdCBiZSB3cml0dGVuIGluIGFzc2VtYmxlciB0byBo
YW5kbGUgcGFnZSBmYXVsdHMgbWFudWFsbHkKPiBpbnNpZGUgdGhlIGZ1bmN0aW9uLgo+IAo+IFdp
dGggdGhlIGNoYW5nZXMsIGltcHJvdmVzIGluIHRoZSBwZXJjZW50YWdlIHVzYWdlIGFuZCBzb21l
IHBlcmZvcm1hbmNlCj4gb2YgbmV0d29yayBzcGVlZCBpbiBVRFAgcGFja2V0cy4KPiBPbmx5IHBh
dGNoaW5nIGNvcHlfdXNlci4gVXNpbmcgdGhlIG9yaWdpbmFsIG1lbWNweS4KPiAKPiBBbGwgcmVz
dWx0cyBhcmUgZnJvbSB0aGUgc2FtZSBiYXNlIGtlcm5lbCwgc2FtZSByb290ZnMgYW5kIHNhbWUK
PiBCZWFnbGVWIGJldGEgYm9hcmQuCgpJcyB0aGVyZSBhIGdpdCB0cmVlIGZvciB0aGVzZSB0byB0
cnkgdGhlbSBvdXQ/Cgo+IENvbXBhcmlzb24gYnkgInBlcmYgdG9wIC1VZSB0YXNrLWNsb2NrIiB3
aGlsZSBydW5uaW5nIGlwZXJmMy4KPiAKPiAtLS0gVENQIHJlY3YgLS0tCj4gIMKgKiBCZWZvcmUK
PiAgwqAgNDAuNDAlwqAgW2tlcm5lbF3CoCBba10gbWVtY3B5Cj4gIMKgIDMzLjA5JcKgIFtrZXJu
ZWxdwqAgW2tdIF9fYXNtX2NvcHlfdG9fdXNlcgo+ICDCoCogQWZ0ZXIKPiAgwqAgNTAuMzUlwqAg
W2tlcm5lbF3CoCBba10gbWVtY3B5Cj4gIMKgIDEzLjc2JcKgIFtrZXJuZWxdwqAgW2tdIF9fYXNt
X2NvcHlfdG9fdXNlcgo+IAo+IC0tLSBUQ1Agc2VuZCAtLS0KPiAgwqAqIEJlZm9yZQo+ICDCoCAx
OS45NiXCoCBba2VybmVsXcKgIFtrXSBtZW1jcHkKPiAgwqDCoCA5Ljg0JcKgIFtrZXJuZWxdwqAg
W2tdIF9fYXNtX2NvcHlfdG9fdXNlcgo+ICDCoCogQWZ0ZXIKPiAgwqAgMTQuMjclwqAgW2tlcm5l
bF3CoCBba10gbWVtY3B5Cj4gIMKgwqAgNy4zNyXCoCBba2VybmVsXcKgIFtrXSBfX2FzbV9jb3B5
X3RvX3VzZXIKPiAKPiAtLS0gVURQIHNlbmQgLS0tCj4gIMKgKiBCZWZvcmUKPiAgwqAgMjUuMTgl
wqAgW2tlcm5lbF3CoCBba10gbWVtY3B5Cj4gIMKgIDIyLjUwJcKgIFtrZXJuZWxdwqAgW2tdIF9f
YXNtX2NvcHlfdG9fdXNlcgo+ICDCoCogQWZ0ZXIKPiAgwqAgMjguOTAlwqAgW2tlcm5lbF3CoCBb
a10gbWVtY3B5Cj4gIMKgwqAgOS40OSXCoCBba2VybmVsXcKgIFtrXSBfX2FzbV9jb3B5X3RvX3Vz
ZXIKPiAKPiAtLS0gVURQIHJlY3YgLS0tCj4gIMKgKiBCZWZvcmUKPiAgwqAgNDQuNDUlwqAgW2tl
cm5lbF3CoCBba10gbWVtY3B5Cj4gIMKgIDMxLjA0JcKgIFtrZXJuZWxdwqAgW2tdIF9fYXNtX2Nv
cHlfdG9fdXNlcgo+ICDCoCogQWZ0ZXIKPiAgwqAgNTUuNjIlwqAgW2tlcm5lbF3CoCBba10gbWVt
Y3B5Cj4gIMKgIDExLjIyJcKgIFtrZXJuZWxdwqAgW2tdIF9fYXNtX2NvcHlfdG9fdXNlcgoKV2hh
dCdzIHRoZSBtZW1jcHkgZmlndXJlIGluIHRoZSBhYm92ZT8KQ291bGQgeW91IGV4cGxhaW4gdGhl
IGZpZ3VyZXMgcGxlYXNlPwoKPiBQcm9jZXNzaW5nIG5ldHdvcmsgcGFja2V0cyByZXF1aXJlIGEg
bG90IG9mIHVuYWxpZ25lZCBhY2Nlc3MgZm9yIHRoZSBwYWNrZXQKPiBoZWFkZXIsIHdoaWNoIGlz
IG5vdCBhYmxlIHRvIGNoYW5nZSB0aGUgZGVzaWduIG9mIHRoZSBoZWFkZXIgZm9ybWF0IHRvIGJl
Cj4gYWxpZ25lZC4KCklzbid0IHRoZXJlIGFuIG9wdGlvbiB0byBhbGxvdyBwYWRkaW5nIG9mIG5l
dHdvcmsgcGFja2V0cwppbiB0aGUgc2tidWZmIHRvIG1ha2UgdGhlIGZpZWxkcyBhbGlnbmVkIGZv
ciBhcmNoaXRlY3R1cmVzCndoaWNoIGRvIG5vdCBoYXZlIGVmZmljaWVudCB1bmFsaWduZWQgbG9h
ZHMgKGxvb2tpbmcgYXQgeW91CmFybTMyKS4gSGFzIHRoaXMgYmVlbiBsb29rZWQgYXQ/Cgo+IEFu
ZCB1c2VyIGFwcGxpY2F0aW9ucyBjYWxsIHN5c3RlbSBjYWxscyB3aXRoIGEgbGFyZ2UgYnVmZmVy
IGZvciBzZW5kL3JlY2YoKQo+IGFuZCBzZW5kdG8vcmVjdmZyb20oKSB0byByZXBlYXQgbGVzcyBm
dW5jdGlvbiBjYWxscyBmb3IgdGhlIG9wdGltaXphdGlvbi4KPiAKPiB2MSAtPiB2MjoKPiAtIEFk
ZGVkIHNoaWZ0IGNvcHkKPiAtIFNlcGFyYXRlZCBwYXRjaGVzIGZvciByZWFkYWJpbGl0eSBvZiBj
aGFuZ2VzIGluIGFzc2VtYmxlcgo+IC0gVXNpbmcgcGVyZiByZXN1bHRzCj4gCj4gWzFdIGh0dHBz
Oi8vbGttbC5vcmcvbGttbC8yMDIxLzIvMTYvNzc4Cj4gCj4gQWtpcmEgVHN1a2Ftb3RvICg1KToK
PiAgwqAgcmlzY3Y6IF9fYXNtX3RvL2NvcHlfZnJvbV91c2VyOiBkZWxldGUgZXhpc3RpbmcgY29k
ZQo+ICDCoCByaXNjdjogX19hc21fdG8vY29weV9mcm9tX3VzZXI6IEFkZGluZyBieXRlIGNvcHkg
Zmlyc3QKPiAgwqAgcmlzY3Y6IF9fYXNtX3RvL2NvcHlfZnJvbV91c2VyOiBDb3B5IHVudGlsIGRz
dCBpcyBhbGlnbmVkIGFkZHJlc3MKPiAgwqAgcmlzY3Y6IF9fYXNtX3RvL2NvcHlfZnJvbV91c2Vy
OiBCdWxrIGNvcHkgd2hpbGUgc2hpZnRpbmcgbWlzYWxpZ25lZAo+ICDCoMKgwqAgZGF0YQo+ICDC
oCByaXNjdjogX19hc21fdG8vY29weV9mcm9tX3VzZXI6IEJ1bGsgY29weSB3aGVuIGJvdGggc3Jj
IGRzdCBhcmUKPiAgwqDCoMKgIGFsaWduZWQKPiAKPiAgwqBhcmNoL3Jpc2N2L2xpYi91YWNjZXNz
LlMgfCAxODEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIMKgMSBm
aWxlIGNoYW5nZWQsIDE0NiBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKCkknbSBjb25j
ZXJuZWQgdGhhdCBkZWxldGUgYW5kIHRoZW4gcmUtYWRkIGlzIGVpdGhlciBnb2luZyB0byBtYWtl
CnRoZSBzZXJpZXMgdW4tYmlzZWN0YWJsZSBvciBsZWF2ZSBhIHBvaW50IHdoZXJlIHRoZSBrZXJu
ZWwgaXMgdmVyeQpicm9rZW4/CgotLSAKQmVuIERvb2tzCQkJCWh0dHA6Ly93d3cuY29kZXRoaW5r
LmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwoK
aHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
