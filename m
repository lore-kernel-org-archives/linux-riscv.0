Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DDAC47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKpxhutbJYCjoN2xMow8MI0D8obHLsCrXSkmIrtRqYw=; b=l94087+eODfn3A
	ofG0T+LvY3WKzwljCbxrRl+5FJnyGKa9mybIDjbzjMJOrn66/lldNeKanRv4i6a58GSFMZo9UxOgA
	IpUx/x0v5q23Vzwf0hRLW8NeVExEGXwzuEaVH93FZE6hQR5Mgi7BSaI32UWlHcULNyDmoPto88/nR
	KDBUyk0GLFz5pVmIVc3OstK8FyURufOd5IZIfJE+YzY4tXl0wN3n2wncy3iOjS/yS49GvA/PF/DFZ
	ZsjWRDuKAEjAAD9eNzks0QuWp6wpnarHT5q7yRPuTyooo9cGgq6p4YDCGAQrZKc6rmuQengvMuW6s
	+0bLILNaCA/BZ1KUi0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrLr-0000000HSWP-3vTg;
	Tue, 30 Jan 2024 16:52:47 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrLo-0000000HSU9-3rxB
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 16:52:46 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id 40UGqbOH012005
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 18:52:37 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1706633551; x=1709225551;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=APe8qHs7OS1okrSny8ta3CCO+EktflctfrLK41gq/Fk=;
	b=U5qg+AQ/phewkJxH70fZ2R3vQyboB5fmnWM0cI1BWhdqkgrTnMWul7LIakN9/XyG
	WVQ9T9WXqNaiSg3/ggjOzUs0UPm+aK8IR6IijLN/tJcoWRDRx1BE6p0kmJ0fUEFj
	XhLxjykO7xMx7QzGEqzq5P9luYA9dcVzzi8OE5UZHT9+5VxgxkJIYeU685apMhMB
	3P5Fy/JRTqQKz8R3ZmNclPNXCdIBX8/ThOj34R8ZG5fgiEGqmy5GpQzo5gcle9ID
	cjAaUAI7CMxMZH0iCkh68psOCKlJgyVKQPEQ9woeLFVcGrcUMOsnrBoZsg8sV5sE
	QeNG7l+J9obQbPA6dugPBA==;
X-AuditID: 8b5b014d-a17eb70000002178-8a-65b9294ffbfd
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id BA.04.08568.F4929B56; Tue, 30 Jan 2024 18:52:31 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <c6066469-7bc9-4232-b600-0b167193f13f@ics.forth.gr>
Date: Tue, 30 Jan 2024 18:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: optimized memmove
Content-Language: el-GR, en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Matteo Croce <mcroce@microsoft.com>, kernel test robot <lkp@intel.com>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240128111013.2450-3-jszhang@kernel.org>
 <fa36b871-43d7-413c-82a2-0ecc0ebce9b4@ics.forth.gr>
 <Zbj1o6VAsk8Tn2ab@xhacker>
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <Zbj1o6VAsk8Tn2ab@xhacker>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsXSHT1dWddfc2eqwbTPRhZbf89it2g+tp7N
	4vKuOWwW2z63sFm8an7EZvH3139Wi5eXe5gt2mbxO3B4vHn5ksXjcMcXdo/Fe14yeWxa1cnm
	sXlJvUfrjr/sHpear7N7fN4kF8ARxWWTkpqTWZZapG+XwJVxozu3oEGoYuPPiewNjEv5uhg5
	OSQETCQOdP1l6WLk4hASOMoocWbiYmaIhKXE5k8vWUBsXgF7iV8XNrN1MXJwsAioSpxu94QI
	C0qcnPkErERUQF7i/q0Z7CAlwgKGErtvV4KEmQXkJN4/284KYosIqEn82veYCWQVs8A0Jont
	d5qYIPZuY5R4fHslI0gVm4CmxPxLB8GGcgqoS7zZMoUdYpKZRNfWLkYIW16ieets5gmMArOQ
	3DELycJZSFpmIWlZwMiyilEgscxYLzO5WC8tv6gkQy+9aBMjOCoYfXcw3t78Vu8QIxMH4yFG
	CQ5mJRHelXI7U4V4UxIrq1KL8uOLSnNSiw8xSnOwKInznrBdkCwkkJ5YkpqdmlqQWgSTZeLg
	lGpgOpj/c+WLvqesccbr/vlVL2Ot7b+a8b1I0E7i5+ZvPzZPe8wuIOWZsFz9jsuCeaY+05Qb
	Z//bkB/7jy/yDdPH+Qu65HbHB4u+WhS5s/3ti9Znsgtlc5eoCE1KNAibzPXLeBq3sfMDTfd6
	7fmpLVeZjWfUajparJh6M/256o9N374Y3V5eG3lty7rJBjqJrzSPFjmJbPh+I+P8/jdOO45v
	ez6XZ8fx952vphh0BIl+j7+js2vdDsmN67fnTzhfE3Eswjq88/dyJY2wd8bxK+3ZSm71Bm90
	sTm5POQvn+POoLWaE47sOMk6pTPu5I1XL548tmjgn5hZ0SRw4MazK95byzK4TjVt3KYjGfA+
	/8af1ypKLMUZiYZazEXFiQDQAtHd+QIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_085245_347247_481A2C88 
X-CRM114-Status: GOOD (  17.74  )
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

T24gMS8zMC8yNCAxNToxMiwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiBPbiBUdWUsIEphbiAzMCwg
MjAyNCBhdCAwMTozOToxMFBNICswMjAwLCBOaWNrIEtvc3NpZmlkaXMgd3JvdGU6Cj4+IE9uIDEv
MjgvMjQgMTM6MTAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4+PiBGcm9tOiBNYXR0ZW8gQ3JvY2Ug
PG1jcm9jZUBtaWNyb3NvZnQuY29tPgo+Pj4KPj4+IFdoZW4gdGhlIGRlc3RpbmF0aW9uIGJ1ZmZl
ciBpcyBiZWZvcmUgdGhlIHNvdXJjZSBvbmUsIG9yIHdoZW4gdGhlCj4+PiBidWZmZXJzIGRvZXNu
J3Qgb3ZlcmxhcCwgaXQncyBzYWZlIHRvIHVzZSBtZW1jcHkoKSBpbnN0ZWFkLCB3aGljaCBpcwo+
Pj4gb3B0aW1pemVkIHRvIHVzZSBhIGJpZ2dlciBkYXRhIHNpemUgcG9zc2libGUuCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogTWF0dGVvIENyb2NlIDxtY3JvY2VAbWljcm9zb2Z0LmNvbT4KPj4+IFJl
cG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4KPj4gSSdkIGV4cGVj
dCB0byBoYXZlIG1lbW1vdmUgaGFuZGxlIGJvdGggZncvYncgY29weWluZyBhbmQgdGhlbiBtZW1j
cHkgYmVpbmcKPj4gYW4gYWxpYXMgdG8gbWVtbW92ZSwgdG8gYWxzbyB0YWtlIGNhcmUgd2hlbiBy
ZWdpb25zIG92ZXJsYXAgYW5kIGF2b2lkCj4+IHVuZGVmaW5lZCBiZWhhdmlvci4KPiAKPiBIaSBO
aWNrLAo+IAo+IEhlcmUgaXMgc29tdGhpbmcgZnJvbSBtYW4gbWVtY3B5Ogo+IAo+ICJ2b2lkICpt
ZW1jcHkodm9pZCBkZXN0W3Jlc3RyaWN0IC5uXSwgY29uc3Qgdm9pZCBzcmNbcmVzdHJpY3QgLm5d
LAo+ICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBuKTsKPiAKPiBUaGUgIG1lbWNweSgpICBm
dW5jdGlvbiBjb3BpZXMgbiBieXRlcyBmcm9tIG1lbW9yeSBhcmVhIHNyYyB0byBtZW1vcnkgYXJl
YSBkZXN0Lgo+IFRoZSBtZW1vcnkgYXJlYXMgbXVzdCBub3Qgb3ZlcmxhcC4gIFVzZSBtZW1tb3Zl
KDMpIGlmIHRoZSBtZW1vcnkgYXJlYXMgZG8gIG92ZXLigJAKPiBsYXAuIgo+IAo+IElNSE8sIHRo
ZSAicmVzdHJpY3QiIGltcGxpZXMgdGhhdCB0aGVyZSdzIG5vIG92ZXJsYXAuIElmIG92ZXJsYXAK
PiBoYXBwZW5zLCB0aGUgbWFudWFsIGRvZXNuJ3Qgc2F5IHdoYXQgd2lsbCBoYXBwZW4uCj4gCj4g
IEZyb20gYW5vdGhlciBzaWRlLCBJIGhhdmUgYSBjb25jZXJuOiBjdXJyZW50bHksIG90aGVyIGFy
Y2ggZG9uJ3QgaGF2ZQo+IHRoaXMgYWxpYXMgYmVoYXZpb3IsIElJVUMoYXQgbGVhc3QsIHBlciBt
eSB1bmRlcnN0YW5kaW5nIG9mIGFybSBhbmQgYXJtNjQKPiBtZW1jcHkgaW1wbGVtZW50YXRpb25z
KXRoZXkganVzdCBjb3B5IGZvcndhcmQuIEkgd2FudCB0byBrZWVwIHNpbWlsYXIgYmVoYXZpb3IK
PiBmb3IgcmlzY3YuCj4gCj4gU28gSSB3YW50IHRvIGhlYXIgbW9yZSBiZWZvcmUgZ29pbmcgdG93
YXJkcyBhbGlhcy1tZW1jcHktdG8tbWVtbW92ZSBkaXJlY3Rpb24uCj4gCj4gVGhhbmtzCgpJZiB5
b3UgcmVhZCBNYXR0ZW8ncyBvcmlnaW5hbCBwb3N0IHRoYXQgd2FzIGFsc28gaGlzIHN1Z2dlc3Rp
b24sIGFuZCAKTGludXMgaGFzIGFsc28gY29tbWVudGVkIG9uIHRoYXQuIEluIGdlbmVyYWwgaXQn
cyBiZXR0ZXIgdG8gaGFuZGxlIHRoZSAKY2FzZSB3aGVyZSB0aGUgcmVnaW9ucyBwcm92aWRlZCB0
byBtZW1jcHkoKSBvdmVybGFwIHRoYW4gdG8gcmVzb3J0IHRvIAoidW5kZWZpbmVkIGJlaGF2aW9y
IiwgSSBwcm92aWRlZCBhIGJhY2t3YXJkcyBjb3B5IGV4YW1wbGUgdGhhdCB5b3UgY2FuIAp1c2Ug
c28gdGhhdCB3ZSBjYW4gaGF2ZSBib3RoIGZ3IGFuZCBidyBjb3B5aW5nIGZvciBtZW1tb3ZlKCks
IGFuZCB1c2UgCm1lbW1vdmUoKSBpbiBhbnkgY2FzZS4gVGhlIFtyZXN0cmljdCAubl0gaW4gdGhl
IHByb3RvdHlwZSBpcyBqdXN0IHRoZXJlIAp0byBzYXkgdGhhdCB0aGUgc2l6ZSBvZiBzcmMgaXMg
cmVzdHJpY3RlZCBieSBuICh0aGUgbmV4dCBhcmd1bWVudCkuIElmIApzb21lb25lIHVzZXMgbWVt
Y3B5KCkgd2l0aCBvdmVybGFwcGluZyByZWdpb25zLCB3aGljaCBpcyBhbHdheXMgYSAKcG9zc2li
aWxpdHksIGluIHlvdXIgY2FzZSBpdCdsbCByZXN1bHQgY29ycnVwdGVkIGRhdGEsIHdlIHdvbid0
IGV2ZW4gZ2V0IAphIHdhcm5pbmcgKHN0aWxsIGNvdW50cyBhcyB1bmRlZmluZWQgYmVoYXZpb3Ip
IGFib3V0IGl0LgoKUmVnYXJkcywKTmljawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
