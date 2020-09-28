Return-Path: <SRS0=7Vio=DF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED441C4741F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2020 09:32:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE8221D95
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2020 09:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nNG3Ro7J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AE8221D95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZIP6iFiTkGDsUc/VWAzV88gTaMiezL+ssPfob5edkJ0=; b=nNG3Ro7JUPU0hIJuvcCSNJcVs
	tUff5lN5v2dv5nVmPUFOXpc194W79qIk6bFsWPboRSSoYyy//oQRDVA4O0kEzehKmsPCJiKQiAaUk
	/h6FJvqHUXNUF/Ak1q863h9WZXLr+F02NY/HLORq7bE+vbYrCawCDxxa/4ALHgydX3WsUAsnK3q6V
	Ir6w4wYgLFtQNvexqHQlq2pFozxNXGcfztmXHkCIQFesbVaGUlan1ko5xcpNom4ElcU3osav9ZFU3
	jGF5EG3TfWzLmFofJqQ6CMsiQ0FGo9DZWDMRJJg8etIvhe7afzTCxgvuz9ZIpwyGIgpmIxcuj7g6J
	MHTMpVtQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMpW9-00080D-IR; Mon, 28 Sep 2020 09:32:21 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMpW1-0007tk-Ea
 for linux-riscv@lists.infradead.org; Mon, 28 Sep 2020 09:32:18 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08003213|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.012899-0.00117961-0.985921;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=fuyao@allwinnertech.com; NM=1;
 PH=DS; RN=13; RT=13; SR=0; TI=SMTPD_---.IdDp-2p_1601285523; 
Received: from localhost(mailfrom:fuyao@allwinnertech.com
 fp:SMTPD_---.IdDp-2p_1601285523)
 by smtp.aliyun-inc.com(10.147.41.231);
 Mon, 28 Sep 2020 17:32:04 +0800
Date: Mon, 28 Sep 2020 17:31:58 +0800
From: fuyao <fuyao@allwinnertech.com>
To: =?utf-8?B?5YiY6YK15Y2OQlRE?= <liush@allwinnertech.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW1BBVENI?= =?utf-8?Q?=5D?= riscv: fix
 pfn_to_virt err in do_page_fault().
Message-ID: <20200928093158.GC4756@g8Exdroid64>
Mail-Followup-To: =?utf-8?B?5YiY6YK15Y2OQlRE?= <liush@allwinnertech.com>,
 Christoph Hellwig <hch@infradead.org>,
 "paul.walmsley" <paul.walmsley@sifive.com>,
 palmer <palmer@dabbelt.com>, aou <aou@eecs.berkeley.edu>,
 akpm <akpm@linux-foundation.org>, peterx <peterx@redhat.com>,
 walken <walken@google.com>,
 "daniel.m.jordan" <daniel.m.jordan@oracle.com>,
 vbabka <vbabka@suse.cz>, rppt <rppt@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <1600327549-3995-1-git-send-email-liush@allwinnertech.com>
 <20200917152518.GA8930@infradead.org>
 <ca550ec0-73f2-485e-84fd-036eacd0bcd9.liush@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca550ec0-73f2-485e-84fd-036eacd0bcd9.liush@allwinnertech.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_053213_848137_83895D44 
X-CRM114-Status: GOOD (  17.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou <aou@eecs.berkeley.edu>, linux-kernel <linux-kernel@vger.kernel.org>,
 peterx <peterx@redhat.com>, "daniel.m.jordan" <daniel.m.jordan@oracle.com>,
 Christoph Hellwig <hch@infradead.org>, palmer <palmer@dabbelt.com>,
 rppt <rppt@kernel.org>, "paul.walmsley" <paul.walmsley@sifive.com>,
 akpm <akpm@linux-foundation.org>, walken <walken@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, vbabka <vbabka@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgMTgsIDIwMjAgYXQgMDM6NDM6MzlQTSArMDgwMCwg5YiY6YK15Y2OQlREIHdy
b3RlOgo+IEhpIENocmlzdG9waCwKPiA+IE9uIFRodSwgU2VwIDE3LCAyMDIwIGF0IDAzOjI1OjQ5
UE0gKzA4MDAsIGxpdXNoIHdyb3RlOgo+ID4gPiBUaGUgYXJndW1lbnQgdG8gcGZuX3RvX3ZpcnQo
KSBzaG91bGQgYmUgcGZuIG5vdCB0aGUgdmFsdWUgb2YgQ1NSX1NBVFAuCj4gPiA+IAo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBsaXVzaCA8bGl1c2hAYWxsd2lubmVydGVjaC5jb20+Cj4gPiA+IC0tLQo+
ID4gPiAgYXJjaC9yaXNjdi9tbS9mYXVsdC5jIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9tbS9mYXVsdC5jIGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4gPiA+IGluZGV4
IDcxNmQ2NGUuLjliNGUwODggMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQu
Ywo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPiA+ID4gQEAgLTIxMiw3ICsyMTIs
NyBAQCBhc21saW5rYWdlIHZvaWQgZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncykK
PiA+ID4gICAgICogb2YgYSB0YXNrIHN3aXRjaC4KPiA+ID4gICAgICovCj4gPiA+ICAgIGluZGV4
ID0gcGdkX2luZGV4KGFkZHIpOwo+ID4gPiAtICBwZ2QgPSAocGdkX3QgKilwZm5fdG9fdmlydChj
c3JfcmVhZChDU1JfU0FUUCkpICsgaW5kZXg7Cj4gPiA+ICsgIHBnZCA9IChwZ2RfdCAqKXBmbl90
b192aXJ0KGNzcl9yZWFkKENTUl9TQVRQKSAmIFNBVFBfUFBOKSArIGluZGV4Owo+IAo+ID4gVGhp
cyBhZGRzIGEgY3JhenkgbG9uZyBsaW5lLiAgT25lIG5pY2Ugd2F5IHRvIGNsZWFuIHRoaXMgdXAg
d291bGQgYmUgdG8KPiA+IGFkZCBhIGxvY2FsIHBmbiB2YXJpYWJsZSwgYXMgaXQgd291bGQgYWxz
byBtYWtlIHRoZSBjb2RlIG1vcmUgcmVhZGFibGUuCj4gCj4gVGhhbmtzLCBpJ2xsIG1vZGlmeSBp
dCBpbiBuZXh0IHJldmlzaW9uCgpUZXN0ZWQtYnk6IGZ1YXlvQGFsbHdpbm5lcnRlY2guY29tCgot
LSAKPGh0dHA6Ly93d3cuYWxsd2lubmVydGVjaC5jb20+IEFsbHdpbm5lcnRlY2ggVGVjaG5vbG9n
eQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
