Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5E7CA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Cc:References:Date:Subject
	:From:To:In-Reply-To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7yML+1Btv8iVs73STqJvttJd7STBUQkvTCtmBXfNMM=; b=L+56M/WF6gpFsS
	WvgvVrwsh1LR+ahvRoymVXRWuJp6+igDIXRohEXUCwMEPnEqSgpWhsf4i2i1JREXnMkDL7sAwKlQM
	Yh7WFwPvmjeh42AcXbL1IgJp/slSr1zxUtJiDZ2oiKW9sydbij6DD2DG+L07zQW8RLUiiU/QsTtG2
	9gCmKgRt/eZovqou21Tw81vW9MytAKBwx9n4Zn7ceWygImnvSqgNNla7+jOaRXbloxcvV7FK3mv1f
	AePn5BY5zb7W1pA5Xe9BImH2MMowKCe55bIMDh92h/2vlPHMibseVL09z5IlCsqMdZ9ShslI1ziCQ
	qtBtIq9rUnvMJt+uudug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqm-00000002I4O-3mak;
	Fri, 22 Aug 2025 11:22:28 +0000
Received: from sg-1-12.ptr.blmpb.com ([118.26.132.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHdu-00000001IGz-0CkD
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 02:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1755830183;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=wM2Pu7ubOLQjp3YGifNjivB5Nz4a+TlbNw/xHfw3RnM=;
 b=u07qho9vrBAHyq3bmONyU1L7dFC0wt/CFQatDkY2RZj1y+tTdEbjSmlcqa5VhR4HzZt50c
 1XPrvSXvluKmqefRmmu0LioJHxFCN3GZxVNQJbMTUGKvQZyknLxZIvRzX19Fu9jwgujRp7
 MUHD7eRgDzYX4FP5rkiDPecQNrtjLrMKl0ovX2VUXBx/Q6HMlS0V3kGjFj0a5VmrWgGUKJ
 MQkxUGJYep/mkeAHbd7knSn0j+sVzr40TH6k8LFqSzL5LWn9zZSuB14oGjbAVUrFgTZ3Fw
 55c2Il7IudNfkfa1/oVv49H8+7nEUKAK9AFD1qWzIPq7ZGE1vuvjReaa+0dk+w==
Message-Id: <20250822023611.18145-1-huangxianliang@lanxincomputing.com>
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Fri, 22 Aug 2025 10:36:20 +0800
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aed0e72a-3c98-4027-8676-b8f469d857f5@web.de>
X-Lms-Return-Path: <lba+268a7d7a5+46ae7d+lists.infradead.org+huangxianliang@lanxincomputing.com>
To: <markus.elfring@web.de>
From: "XianLiang Huang" <huangxianliang@lanxincomputing.com>
Subject: Re: Re: [v4] iommu/riscv: prevent NULL deref in iova_to_phys
Date: Fri, 22 Aug 2025 10:36:11 +0800
References: <aed0e72a-3c98-4027-8676-b8f469d857f5@web.de>
Cc: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, 
	<huangxianliang@lanxincomputing.com>, <iommu@lists.linux.dev>, 
	<joro@8bytes.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, 
	<paul.walmsley@sifive.com>, <robin.murphy@arm.com>, 
	<tjeznach@rivosinc.com>, <will@kernel.org>
Mime-Version: 1.0
X-Original-From: XianLiang Huang <huangxianliang@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_193638_271994_6F6F97EA 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
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

PiBJIHN1Z2dlc3QgdG8gdGFrZSBhbm90aGVyIGxvb2sgZm9yIHRoZSBiZXR0ZXIgZGlzdGluY3Rp
b24gb2YgbWVudGlvbmVkIGtleSB3b3Jkcy4KSSBtaXN1bmRlcnN0b29kIHRoaXMKICAgID4+IOKA
pj4gQ2hlY2sgdGhlIHBvaW50ZXIgYmVmb3JlIHVzaW5nIGl0IHRvIGF2b2lkIHRoZSBidWcuIOKA
pgogICAgPiBXb3VsZCBhIHN1bW1hcnkgcGhyYXNlIGxpa2Ug4oCcUHJldmVudCBudWxsIHBvaW50
ZXIgZGVyZWZlcmVuY2UgaW4gcmlzY3ZfaW9tbXVfaW92YV90b19waHlzKCnigJ0KICAgID4gYmUg
YWxzbyBoZWxwZnVsPwpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2VmZmIyOWJlLTZkMTQt
NDdlNS1hYjcxLTQ1NDExOTQ2Nzc1MEB3ZWIuZGUvCgo+PiA+IENoYW5nZXMKPj4gPiB2NDoKPj4g
PiAtIENoYW5nZSB0aGUgc3VtbWFyeSBhcyBNYXJrdXMgcmVjb21tZW5kcwo+PiA+IAo+PiA+IHYz
Ogo+PiA+IC0gUmVtb3ZlIHJlZHVuZGFudCBwdGUgdmFsaWRhdGlvbiBpbiByaXNjdl9pb21tdV9p
b3ZhX3RvX3BoeXMKPj4gPiAtIEltcHJvdmUgc3ViamVjdCBsaW5lIHRvIGVtcGhhc2l6ZSBwcmV2
ZW50aW9uCj4gRG9lcyBhbnl0aGluZyBoaW5kZXIgeW91IHRvIGludGVncmF0ZSByZXBlYXRlZCBw
YXRjaCByZXZpZXcgaWRlYXMgYmV0dGVyCj4gaW50byB5b3VyIGNvbnRyaWJ1dGlvbnM/CkRvIHlv
dSBzdWdnZXN0IG1lcmdlIHRoZSByZXBlYXRlZCBwYXRjaCBjaGFuZ2xvZ3M/Cm1heSBhIFJFU0VO
RCB2MzoKLSBSZW1vdmUgcmVkdW5kYW50IHB0ZSB2YWxpZGF0aW9uIGluIHJpc2N2X2lvbW11X2lv
dmFfdG9fcGh5cwotIEltcHJvdmUgc3VtbWFyeSBhbmQgZGVzY3JpcHRpb24gdG8gZW1waGFzaXpl
IHByZXZlbnRpb24gYXMgTWFya3VzIHJlY29tbWVuZHMKClJlZ2FyZHMsClhpYW5saWFuZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
