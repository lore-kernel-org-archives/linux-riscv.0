Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D664EC76195
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 10:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3s0Rd89r9IjCgQ25HpDqSsEPoz2AFpISPSfKKcdR0PU=; b=GTkRBEFR9nmioj
	6bK17Ec+A2PdxVyUypLxpdGyfwznDJeyODqKelWIq1cDuiR9Sl1+6OyfW14XcJtHkOCa7NY8B8PFC
	KSVH1iqgH2rYnhKlKZoQjqvGQnO4crsoWEoHIPV9MrlP14/lz58aX/sBtw+PWkv5PmOMtGoLPmKWC
	EyhFCPFIpBqS3HZLh/Kg0JFGijdmJcdiYBGJqU04vn2JGPK93pD4P+dgbi6bhQYxoXr50tG+AV7jt
	H/miAjIsFVz+izfKPTmQywz7UM8aWbl0FwMe/zvImYUeBBY+uZopsMIeY18VsLhW5NcgHmvraEa57
	TQWUZDGCIfEQwwUyGyUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIJE-001awx-0e;
	Thu, 23 Mar 2023 10:36:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfIJA-001avF-24;
	Thu, 23 Mar 2023 10:36:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 13C4FB82058;
	Thu, 23 Mar 2023 10:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BD0C4339B;
	Thu, 23 Mar 2023 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679567793;
	bh=AiS8dSPCKWDsq3eZ7fJAM1zTxXlSdU85APs6cGWwkyg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cVnnpvtmKuYQMh/yj6cr0af33CLhHRsXcDRuRSd76QGIYurwcQUkte+v4WREomm3g
	 fgQyT4SZLJzK/fs3yR/hCVZQSp0mpWLfewImPfsTHQi2vUC7ehslg9EdLZVUTyzCPg
	 eB6UIuoglmfKWsIpO5pEIKYYg9YSsKRcrxLhyR3YQ98/BPWvZ+cAoCcLArSBrDqBlr
	 wCKe949/sLk/kqe6uy1zAJRU1Sx8Zw4i88jGllm+5lUnPHOmw/ok8m8cSA4HTK1+aW
	 tiiDVYNXWDRN8lpim397S6y/RZ8zgWOhD/unmkAik2KIQm+e54TO6LLb/xUhe7dSXk
	 hZoS+1PsJhoow==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Kees
 Cook <keescook@chromium.org>, Nick Knight <nick.knight@sifive.com>, Andrew
 Bresticker <abrestic@rivosinc.com>, vineetg@rivosinc.com, Al Viro
 <viro@zeniv.linux.org.uk>, Vincent Chen <vincent.chen@sifive.com>, Conor
 Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Eric Biederman <ebiederm@xmission.com>, Andy
 Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 greentime.hu@sifive.com, Zong Li <zong.li@sifive.com>, Heiko Stuebner
 <heiko@sntech.de>
Subject: Re: [PATCH -next v15 14/19] riscv: signal: Report signal frame size
 to userspace via auxv
In-Reply-To: <20230317113538.10878-15-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-15-andy.chiu@sifive.com>
Date: Thu, 23 Mar 2023 11:36:31 +0100
Message-ID: <87a6034uvk.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_033636_831462_D4B25BF9 
X-CRM114-Status: GOOD (  14.17  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBGcm9tOiBWaW5jZW50
IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+Cj4gVGhlIHZlY3RvciByZWdpc3RlciBi
ZWxvbmdzIHRvIHRoZSBzaWduYWwgY29udGV4dC4gVGhleSBuZWVkIHRvIGJlIHN0b3JlZAo+IGFu
ZCByZXN0b3JlZCBhcyBlbnRlcmluZyBhbmQgbGVhdmluZyB0aGUgc2lnbmFsIGhhbmRsZXIuIEFj
Y29yZGluZyB0byB0aGUKPiBWLWV4dGVuc2lvbiBzcGVjaWZpY2F0aW9uLCB0aGUgbWF4aW11bSBs
ZW5ndGggb2YgdGhlIHZlY3RvciByZWdpc3RlcnMgY2FuCj4gYmUgMl4oWExFTi0xKS4gSGVuY2Us
IGlmIHVzZXJzcGFjZSByZWZlcnMgdG8gdGhlIE1JTlNJR1NUS1NaIHRvIGNyZWF0ZSBhCj4gc2ln
ZnJhbWUsIGl0IG1heSBub3QgYmUgZW5vdWdoLiBUbyByZXNvbHZlIHRoaXMgcHJvYmxlbSwgdGhp
cyBwYXRjaCByZWZlcnMKPiB0byB0aGUgY29tbWl0IDk0YjA3YzFmOGMzOWMKPiAoImFybTY0OiBz
aWduYWw6IFJlcG9ydCBzaWduYWwgZnJhbWUgc2l6ZSB0byB1c2Vyc3BhY2UgdmlhIGF1eHYiKSB0
byBlbmFibGUKPiB1c2Vyc3BhY2UgdG8ga25vdyB0aGUgbWluaW11bSByZXF1aXJlZCBzaWdmcmFt
ZSBzaXplIHRocm91Z2ggdGhlIGF1eGlsaWFyeQo+IHZlY3RvciBhbmQgdXNlIGl0IHRvIGFsbG9j
YXRlIGVub3VnaCBtZW1vcnkgZm9yIHNpZ25hbCBjb250ZXh0Lgo+Cj4gTm90ZSB0aGF0IGF1eHYg
YWx3YXlzIHJlcG9ydHMgc2l6ZSBvZiB0aGUgc2lnZnJhbWUgYXMgaWYgViBleGlzdHMgZm9yCj4g
YWxsIHN0YXJ0aW5nIHByb2Nlc3Nlcywgd2hlbmV2ZXIgdGhlIGtlcm5lbCBoYXMgQ09ORklHX1JJ
U0NWX0lTQV9WLiBUaGUKPiByZWFzb24gaXMgdGhhdCB1c2VycyB1c3VhbGx5IHJlZmVyZW5jZSB0
aGlzIHZhbHVlIHRvIGFsbG9jYXRlIGFuCj4gYWx0ZXJuYXRpdmUgc2lnbmFsIHN0YWNrLCBhbmQg
dGhlIHVzZXIgbWF5IHVzZSBWIGFueXRpbWUuIFNvIHRoZSB1c2VyCj4gbXVzdCByZXNlcnZlIGEg
c3BhY2UgZm9yIFYtY29udGV4dCBpbiBzaWdmcmFtZSBpbiBjYXNlIHRoYXQgdGhlIHNpZ25hbAo+
IGhhbmRsZXIgaW52b2tlcyBhZnRlciB0aGUga2VybmVsIGFsbG9jYXRpbmcgVi4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+IEFja2VkLWJ5OiBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKUmV2aWV3ZWQtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
