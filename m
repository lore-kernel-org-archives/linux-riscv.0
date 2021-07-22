Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82463C6377D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 15:02:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EB6461289
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 15:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EB6461289
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VsKkTZYWShipuptHES0LMNyd8RmUJDgasd+kVwkzquQ=; b=GEfHDeiJhRPuL5
	dEzm5A4JLroqCe5Z0NugFTCiD1zSL51Z75R/uM+MdEE99Q2nRyLYnIuoV/ulXNG86J1RkLNi5UcXz
	YGy3f8nWGLhSNfVAb9bnVI0JWaFddE7XGcvM4SdHMKO0RFk1HEZcYU61uPaISgNoUHBlsNj4WSGfM
	dAKFArZywT+ncjhmZ8aYizu51Bs0hjo0ghPB/b3WU+F/IH9e5smIQnIJ2EatAEvW7BiMRoNMQxgjF
	v2YdJCPDHApAuPo2abRrWs1uhKqdUtvdZGLi4k53SRPV6FvJ6268ze8VThLXz8SLtla4rMUTejlDN
	KHNaVzx3GqS6qNo33q8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6aDP-001wJi-Kb; Thu, 22 Jul 2021 15:02:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6aDM-001wJC-Mm
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 15:02:22 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DA5A6128C;
 Thu, 22 Jul 2021 15:02:19 +0000 (UTC)
Date: Thu, 22 Jul 2021 11:02:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Zhang Jianhua <chris.zjh@huawei.com>
Cc: <corbet@lwn.net>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH -next] trace doc: Fix the wrong example of tracepoint
Message-ID: <20210722110212.05ec6ee3@oasis.local.home>
In-Reply-To: <20210720020607.4128715-1-chris.zjh@huawei.com>
References: <20210720020607.4128715-1-chris.zjh@huawei.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_080220_804494_71F8F465 
X-CRM114-Status: GOOD (  21.57  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMCBKdWwgMjAyMSAxMDowNjowNyArMDgwMApaaGFuZyBKaWFuaHVhIDxjaHJpcy56
amhAaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IFRoZSBleGFtcGxlIGluIHRyYWNlcG9pbnRzLnJzdCBp
cyBvdXQgb2YgZGF0ZSwgdGhlIGJ1aWxkIGVycm9yIGJlbG93Cj4gd2lsbCBvY2N1ciBpZiBjb2Rp
bmcgYWNjb3JkaW5nIHRvIGV4YW1wbGUgaW4gdGhlIGRvY3VtZW50Lgo+IAo+IGRyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtaW50Yy5jOjI0OjI0Ogo+IGVycm9yOiBtYWNybyAiREVGSU5FX1RSQUNF
IiByZXF1aXJlcyAzIGFyZ3VtZW50cywgYnV0IG9ubHkgMSBnaXZlbgo+ICAgIDI0IHwgREVGSU5F
X1RSQUNFKHRlc3RfZXZlbnQpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBeCj4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvdHJhY2UvZXZlbnRzL3Rlc3QuaDo4LAo+IGZy
b20gZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmM6MjI6Cj4gaW5jbHVkZS9saW51eC90
cmFjZXBvaW50Lmg6MzY4Ogo+IG5vdGU6IG1hY3JvICJERUZJTkVfVFJBQ0UiIGRlZmluZWQgaGVy
ZQo+ICAgMzY4IHwgI2RlZmluZSBERUZJTkVfVFJBQ0UobmFtZSwgcHJvdG8sIGFyZ3MpCj4gICAg
ICAgfAo+IGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jOjI0OjE6Cj4gd2FybmluZzog
ZGF0YSBkZWZpbml0aW9uIGhhcyBubyB0eXBlIG9yIHN0b3JhZ2UgY2xhc3MKPiAgICAyNCB8IERF
RklORV9UUkFDRSh0ZXN0X2V2ZW50KTsKPiAgICAgICB8IF5+fn5+fn5+fn5+fgo+IGRyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jOjI0OjE6Cj4gZXJyb3I6IHR5cGUgZGVmYXVsdHMgdG8g
4oCYaW504oCZIGluIGRlY2xhcmF0aW9uIG9mIOKAmERFRklORV9UUkFDReKAmQo+IFstV2Vycm9y
PWltcGxpY2l0LWludF0KPiAKPiBUaGVyZSBhcmUgdHdvIHJlYXNvbnMgZm9yIHRoaXMgZXJyb3Iu
IE9uIHRoZSBvbmUgaGFuZCwgdGhlIG1hY3JvIERFRklORV9UUkFDRQo+IGhhcyBiZWVuIHJlZmFj
dG9yZWQgaW4gY29tbWl0IGQyNWUzN2Q4OWRkMiAoInRyYWNlcG9pbnQ6IE9wdGltaXplIHVzaW5n
Cj4gc3RhdGljX2NhbGwoKSIpIGZyb20gREVGSU5FX1RSQUNFKG5hbWUpIHRvIERFRklORV9UUkFD
RShuYW1lLCBwcm90bywgYXJncyksCj4gYW5kIHRoZSBkb2MgaXMgbm90IHVwZGF0ZWQgaW4gdGlt
ZS4gT24gdGhlIG90aGVyIGhhbmQsIHRoZSB0cmFjZXBvaW50IGhhcyBiZWVuCj4gZGVmaW5lZCBp
biBoZWFkZXIgZmlsZSwgYW5kIGl0IGRvZXMgbm90IG5lZWQgdG8gZGVmaW5lIHJlcGVhdGVkbHkg
aW4gQyBmaWxlLgoKQWN0dWFsbHksIHRoZSBhYm92ZSBpcyBub3QgcXVpdGUgY29ycmVjdC4KCkJ5
IHJlbW92aW5nIERFRklORV9UUkFDRSgpIHlvdSBqdXN0IHJlbW92ZWQgdGhlIHRyYWNlcG9pbnQg
ZW50aXJlbHksCm1ha2luZyBpdCBub24tZXhpc3RlbnQuIFRoaXMgaXMgYSB2ZXJ5IG9sZCBkb2N1
bWVudCBhbmQgcHJvYmFibHkgaGFzIGEKbG90IG1vcmUgd3Jvbmcgd2l0aCBpdCB0aGFuIGp1c3Qg
dGhpcy4KCkJ1dCBmb3IgdGhpcyBjYXNlLCB5b3UgcHJvYmFibHkgd2FudCBpdCB0byByZWFkOgoK
ICAgICAgICAjZGVmaW5lIENSRUFURV9UUkFDRV9QT0lOVFMKCiAgICAgICAgI2luY2x1ZGUgPHRy
YWNlL2V2ZW50cy9zdWJzeXMuaD4KCk90aGVyd2lzZSB0aGUgdHJhY2Vwb2ludCBpcyBuZXZlciBj
cmVhdGVkLgoKLS0gU3RldmUKCgo+IAo+IC0tLS0tLS0tCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhh
bmcgSmlhbmh1YSA8Y2hyaXMuempoQGh1YXdlaS5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24v
dHJhY2UvdHJhY2Vwb2ludHMucnN0IHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhY2UvdHJhY2Vwb2ludHMucnN0
IGIvRG9jdW1lbnRhdGlvbi90cmFjZS90cmFjZXBvaW50cy5yc3QKPiBpbmRleCAwY2I4ZDljYTNk
NjAuLmZiYjJjYjRhYmQzZCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYWNlL3RyYWNl
cG9pbnRzLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhY2UvdHJhY2Vwb2ludHMucnN0Cj4g
QEAgLTY2LDcgKzY2LDYgQEAgSW4gc3Vic3lzL2ZpbGUuYyAod2hlcmUgdGhlIHRyYWNpbmcgc3Rh
dGVtZW50IG11c3QgYmUgYWRkZWQpOjoKPiAgCSNpbmNsdWRlIDx0cmFjZS9ldmVudHMvc3Vic3lz
Lmg+Cj4gIAo+ICAJI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9JTlRTCj4gLQlERUZJTkVfVFJBQ0Uo
c3Vic3lzX2V2ZW50bmFtZSk7Cj4gIAo+ICAJdm9pZCBzb21lZmN0KHZvaWQpCj4gIAl7CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
