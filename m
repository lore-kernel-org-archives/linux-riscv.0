Return-Path: <SRS0=jaFz=VL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004ECC742D2
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2019 15:21:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74932063F
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2019 15:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eDVAu1HK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74932063F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sg2MzOjWaG4ARy9+OT+/G5oZwQaLliFXvsX8Q10XB1Q=; b=eDVAu1HKUrtblW
	FaxlwoAEe5Z3FmXtqinwjwannX5GGYp2BbTPx/+C9qPDlb8Nv6omfjHI1bGXtMe5TC7ryPYmK2qwq
	KEZgXeOELq4OJOyAalLCGbTE/MSn/Qrzob8nuHqhOopuWOc4+5jh6dXDEc7nU/ZjazSDu1gdXmcrn
	RjuqLrUhTgsvxqTTKw54tNcWcBeK7gaLKdoB1rEV5W70XVhKBynRZJ2AldRpN0OJJ55Fqgq1clG5s
	kZB+P6wfZBqUyWR0nww9qS8rvYiTzSLpd674Qgijl9W9CjT+qAC4M0vlqSVlYQ++T2EVJHr7GVsyA
	P95P93/SoxFr8X0EWdYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hmgJZ-0008Es-Nz; Sun, 14 Jul 2019 15:21:25 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hmgJK-00083g-M6; Sun, 14 Jul 2019 15:21:13 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=17; SR=0; TI=SMTPD_---0TWrpoRa_1563117663; 
Received: from IT-FVFX43SYHV2H.lan(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWrpoRa_1563117663) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 14 Jul 2019 23:21:03 +0800
Subject: Re: [PATCH 01/12] Documentation: move architectures together
To: Jonathan Corbet <corbet@lwn.net>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
 <20190712113427.62fa7ffc@lwn.net>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <36c522c5-975e-e38e-daad-0f3d9f93b186@linux.alibaba.com>
Date: Sun, 14 Jul 2019 23:21:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712113427.62fa7ffc@lwn.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190714_082110_896333_919D7E12 
X-CRM114-Status: GOOD (  14.37  )
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
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSm9uLAoKVGhhbmtzIGZvciBxdWljayByZXNwb25zZSEKCtTaIDIwMTkvNy8xMyDJz87nMToz
NCwgSm9uYXRoYW4gQ29yYmV0INC0tcA6Cj4gT24gRnJpLCAxMiBKdWwgMjAxOSAxMDoyMDowNyAr
MDgwMAo+IEFsZXggU2hpIDxhbGV4LnNoaUBsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gCj4+
IFRoZXJlIGFyZSBtYW55IGRpZmZlcmVudCBhcmNocyBpbiBEb2N1bWVudGF0aW9uLyBkaXIsIGl0
J3MgYmV0dGVyIHRvCj4+IG1vdmUgdGhlbSB0b2dldGhlciBpbiAnRG9jdW1lbnRhdGlvbi9hcmNo
JyB3aGljaCBmb2xsb3dzIGZyb20ga2VybmVsIHNvdXJjZS4KPiAKPiBTbyB0aGlzIHNlZW1zIGNl
cnRhaW4gdG8gY29sbGlkZSBiYWRseSB3aXRoIE1hdXJvJ3MgUlNULWNvbnZlcnNpb24gbW9uc3Rl
cgo+IHBhdGNoIHNldC4KCkkgZG9uJ3QgbWVhbiB0aGF0LCBzb3JyeSwgYW5kIHdlIGNhbiBmaWd1
cmUgb3V0IGlmIGJvdGggb2YgdGhlbSBhcmUgd29ydGh5IHRvIGJlIHBpY2tlZCB1cC4KCj4gCj4g
TW9yZSB0byB0aGUgcG9pbnQsIHRob3VnaC4uLmlmIHdlIGFyZSBnb2luZyB0byB0aHJhc2ggdXAg
dGhpbmdzIHRoaXMKPiBiYWRseSwgd2Ugd2FudCB0byBiZSBzdXJlIHRoYXQgd2UncmUgZG9pbmcg
aXQgcmlnaHQgc28gd2UgZG9uJ3QgZW5kIHVwCj4gcmVuYW1pbmcgZXZlcnl0aGluZyBhZ2Fpbi4g
IEdyb3VwaW5nIHN0dWZmIGludG8gYSBuZXcgYXJjaC8gc3ViZGlyZWN0b3J5Cj4gYWRkcyBhIGJp
dCBvZiBvcmRlciwgYnV0IGl0IGRvZXNuJ3QgZG8gbXVjaCB0b3dhcmQgdHJ5aW5nIHRvIG9yZ2Fu
aXplIG91cgo+IGRvY3VtZW50YXRpb24gZm9yIGl0cyByZWFkZXJzLCBhbmQgaXQgZG9lc24ndCBo
ZWxwIHVzIHRvIG1vZGVybml6ZSB0aGUKPiBkb2NzIGFuZCBnZXQgcmlkIG9mIHRoZSBvbGQsIHVz
ZWxlc3Mgc3R1ZmYuICBBIHF1aWNrIGNoZWNrIHNob3dzIHRoYXQgbWFueQo+IG9mIHRoZXNlIGZp
bGVzIGhhdmUgc2VlbiBubyBjaGFuZ2VzIG90aGVyIHRoYW4gdHlwbyBmaXhlcyBzaW5jZSB0aGUK
PiBiZWdpbm5pbmcgb2YgdGhlIEdpdCBlcmEuCgpSaWdodCwgdGhlcmUgaXMgc29tZSBkb2NzIHdo
aWNoIG5lZWQgdG8gYmUgdXBkYXRlIG9yIGV2ZW4gZHJvcCwgYW5kIGEgcmVvcmRlciB3b3VsZCBi
ZSBhIHRpbWluZyB0byBwdXNoIGVhY2ggb2YgYXJjaCBtYWludGFpbmVyIHRvIGRvIHNvbWV0aGlu
ZywgaXNuJ3QgaXQ/IEFueXdheSwgcmVvcmRlcmluZyAgZG9jdW1lbnRzIGxpa2Uga2VybmVsIHNv
dXJjZSBkaXIgY291bGQgYmUgb25lIG9mIGNob2ljZXMuIDopCgo+IAo+IFNvLCBpbiBteSBtaW5k
LCB0aGlzIG5lZWRzIHNvbWUgdGhvdWdodC4gIE1heWJlIHdlIHdhbnQgYQo+IERvY3VtZW50YXRp
b24vYXJjaCBpbiB0aGUgZW5kLCBidXQgSSdtIG5vdCBjb252aW5jZWQgdGhhdCB3ZSBzaG91bGQg
anVzdAo+IGNyZWF0ZSBpdCBhbmQgZmlsbCBpdCB3aXRoIGEgc25vdyBzaG92ZWwuICBUaGlzIG1p
Z2h0IGJlIGEgZ29vZCB0aGluZyB0bwo+IGRpc2N1c3MgYXQgdGhlIGtlcm5lbCBzdW1taXQgaW4g
U2VwdGVtYmVyLgoKVGhhbmtzIGZvciBjb25zaWRlcmluZywgYW55d2F5LCBpdCBjb3VsZCBiZSBh
IGdvb2Qgc3RhcnQgdG8gZ2V0IGhhbmRzIGRpcnR5IHdoZXRoZXIgdGhlIGFyY2ggZGlyIGlzIG5l
ZWRlZC4gCgpUaGFua3MKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
