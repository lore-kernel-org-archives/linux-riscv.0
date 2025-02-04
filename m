Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AD5C02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiSDwxWd3Rt3z1PLY0DCTVx+CLbyal+V7mbUjGR4QqM=; b=ecfNmyiagmPGpE
	N6ZhE63rvWFZeEQoD/lPNdEHwPu4/hw0NIr3PV8ES5OsvBzkTQifUrcz5RHhmi8JjcuUSt+rdFJCT
	KMjSzJiW8KnpJ2x1UFwxByzD2iFcBh5H60SCVS+dU95VCh+z1t4iKlti8hN4Stl05uH8ebp6F9OtN
	UDPWBiE3hn78r1kkHjFswj1Lk8VNJeCCSEocTZr+OO4Vi6H8NcHFYKiojo6GcgzJvz8AO+Six7/sb
	iHNrswQdr47nB+Wss6HX5As9R9VHxzKC9foDfDuy9pt6MdEtjOdN4dN6PdWqMfF88D24avJq4Jr5z
	Xg+88HnTsmypBsQLir9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfM2Y-00000000zqQ-0lSh;
	Tue, 04 Feb 2025 16:44:46 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfM2V-00000000zq1-2Ymf
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 16:44:45 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id E851D92009C; Tue,  4 Feb 2025 17:44:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E289092009B;
	Tue,  4 Feb 2025 16:44:36 +0000 (GMT)
Date: Tue, 4 Feb 2025 16:44:36 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jessica Clarke <jrtc27@jrtc27.com>
cc: Andreas Schwab <schwab@suse.de>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
In-Reply-To: <0DF64D04-D609-4790-8279-7DFE24D1FB2C@jrtc27.com>
Message-ID: <alpine.DEB.2.21.2502041508520.41663@angie.orcam.me.uk>
References: <mvmed0k4prh.fsf@suse.de> <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> <mvm5xlw4anb.fsf@suse.de> <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr> <mvmwmec2t7u.fsf@suse.de> <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
 <alpine.DEB.2.21.2502030510390.41663@angie.orcam.me.uk> <0DF64D04-D609-4790-8279-7DFE24D1FB2C@jrtc27.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_084443_814698_57C63D4F 
X-CRM114-Status: GOOD (  17.11  )
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

T24gTW9uLCAzIEZlYiAyMDI1LCBKZXNzaWNhIENsYXJrZSB3cm90ZToKCj4gPiBVbW0sIHRoYXQg
d291bGQgYmUgYSBjb21waWxlciBidWcgdGhlbiwgYXMgaW5saW5pbmcgaXMgc3VwcG9zZWQgbm90
IHRvIAo+ID4gY2hhbmdlIGxhbmd1YWdlIHNlbWFudGljcy4gIElPVyB0aGUgY29tcGlsZXIgaXMg
ZXhwZWN0ZWQgdG8gZXhwbGljaXRseSAKPiA+IHNpZ24tZXh0ZW5kIHRoZSBhcmd1bWVudHMgb2Yg
YW4gaW5saW5lZCBmdW5jdGlvbiBhdCB0aGVpciBldmFsdWF0aW9uIHBvaW50IAo+ID4ganVzdCBh
cyBpdCB3b3VsZCBhdCBhbiBhY3R1YWwgZnVuY3Rpb24gY2FsbCB1bmxlc3MgdGhlIGNvbXBpbGVy
IGlzIGFibGUgdG8gCj4gPiBwcm92ZSB0aGV5IGhhdmUgY29tZSBvdXQgc2lnbi1leHRlbmRlZCBh
bHJlYWR5IGZyb20gcHJldmlvdXMgb3BlcmF0aW9ucy4KPiAKPiBObyBpdOKAmXMgbm90LiBUaGUg
Y2FsbGluZyBjb252ZW50aW9uIGlzIHRoZXJlIHNvIHRoYXQgZWFjaCBzaWRlIG9mIHRoZQo+IGNh
bGwga25vdyBob3cgdGhlIGRhdGEgaXMgYmVpbmcgcGFzc2VkIGJldHdlZW4gdGhlbS4gV2hlbiBp
bmxpbmluZwo+IG9jY3VycyB0aGVyZSBpcyBubyBzdWNoIGNhbGwgYW5kIGNvbXBpbGVycyBjYW4g
ZG8gd2hhdGV2ZXIgdGhleSBsaWtlLgoKIFJpZ2h0LCBJIGd1ZXNzIEkgZ290IGluZmx1ZW5jZWQg
dG9vIG11Y2ggYnkgbXkgTUlQUyBleHBlcmllbmNlIGhlcmUuCgogVGhlIGNvbnRyYWN0IGhlcmUg
aXMgdG8gcGFzcyBhIDMyLWJpdCBpbnRlZ2VyIGFzIGFuIGFyZ3VtZW50IHRocm91Z2ggYSAKZnVu
Y3Rpb24gY2FsbCBib3VuZGFyeSBhbmQgd2l0aCB0aGUgUklTQy1WIElTQSBzYXlpbmcgdGhlIHVw
cGVyIDMyLWJpdHMgb2YgCmFuIGlucHV0IGhhcmR3YXJlIHJlZ2lzdGVyIGFyZSBkb24ndC1jYXJl
cyBmb3IgMzItYml0IGludGVnZXIgb3BlcmF0aW9ucyAKdGhpcyBjb250cmFjdCBpcyBzdGlsbCBt
ZXQgaWYgaW5saW5pbmcgZGlzY2FyZHMgdGhlIHNpZ24tZXh0ZW5zaW9uIG1hZGF0ZWQgCmJ5IHRo
ZSBwc0FCSS4gIEFuZCBjb25zZXF1ZW50bHkgYSBwaWVjZSBvZiBpbmxpbmUgYXNzZW1ibHkgY2Fu
bm90IGV4cGVjdCAKYW4gaW5jb21pbmcgMzItYml0IGludGVnZXIgaW4gYSByZWdpc3RlciB0byBi
ZSBjb3JyZWN0bHkgaW50ZXJwcmV0ZWQgYXMgYSAKNjQtYml0IGludGVnZXIgb2YgZXF1YWwgdmFs
dWUgaW5zdGVhZC4KCiBBbHRob3VnaCBJIGZpbmQgaXQgb2RkIGluIHRoZXNlIGNpcmN1bXN0YW5j
ZXMgdGhhdCB0aGUgcHNBQkkgbWFuZGF0ZXMgCnNpZ24tZXh0ZW5zaW9uIGhlcmUuICBBbmQgaG9u
ZXN0bHkgSSB0aGluayBhbiBleHBsaWNpdCBjYXN0IG91Z2h0IHRvIGJlIAphZGRlZCB0byB0aGUg
cmVsZXZhbnQgYXNzZW1ibHkgaW5wdXQgb3BlcmFuZHMgKG9yIGEgdGVtcG9yYXJ5IHZhcmlhYmxl
IG9mIAp0aGUgYXBwcm9wcmlhdGUgdHlwZSBhZGRlZCBhbmQgdXNlZCB0byBjb252ZXJ0IGJldHdl
ZW4gdGhlIGluY29taW5nIHZhbHVlIAphbmQgdGhlIGlucHV0IG9wZXJhbmRzKTsgaXQgd2lsbCBi
ZSBhIG5vLW9wIGZvciBhbiBvcHRpbWlzaW5nIGNvbXBpbGVyIAp3aGVuIGl0IGtub3dzIHRoZSB2
YWx1ZSBoYXMgYmVlbiBzaWduLWV4dGVuZGVkIGFscmVhZHkgYW5kIHdpbGwgY2FycnkgdGhlIApz
ZW1hbnRpY3MgaW5mb3JtYXRpb24gZm9yIGEgaHVtYW4gY29kZSByZWFkZXIgZXZlbiBpZiBzaWdu
LWV4dGVuc2lvbiBoYXMgCmJlZW4gaW1wbGljaXRseSBlbnN1cmVkIGJ5IHRoZSBwc0FCSSBkZXNw
aXRlIHRoZSBkYXRhIHR5cGUgaXRzZWxmIG5vdCAKbWFraW5nIGl0IGV2aWRlbnQuCgogVGhhbmtz
IGZvciBjb3JyZWN0aW5nIG1lIG92ZXJhbGwuCgogIE1hY2llagoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
