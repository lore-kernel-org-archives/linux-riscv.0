Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE0BE8782F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dCdjWOygPevCPQ6z/Wyu9G7tNlC+rFEofPLYronblQ=; b=U4R9RN34SEQBPR
	YHAL7nJ7PSHWqAZ86WMviawFWjUDqiTEjUZDpmxb72wrUJefCX4KAsN+G6M4oaR0Kn3sirYnkKLvj
	4dPfWW+OMGI8kd1fbgP4XA4oyN6P21MIEJ+zzq5PopxjgnVJqu5eJxk+yexKQqINP3t3orYK9OtWv
	DFF21XouCcOKpfoBxYp3gPI6buHFSwS4pJ0oaMOV9z6EnV5A4aJ86+keMuJ+rbccqPB/L0Y6SZCXV
	svJ+bM0Fpk6dypxTWUsDpHYMi48Zqn0VdnsEcaCk4ONE5IX+MRGRkgRfyCcr1RriomIxVZVgC1HlX
	+uUH5LI5i4fciRmFo5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnH0C-00000006izs-34r2;
	Tue, 03 Feb 2026 14:03:36 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnH09-00000006iz0-0Dyu
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 14:03:35 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770127396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRrkh3Ad3sEIOvwMJAakZ3eaeEUS2YBl+bQjyr22hDM=;
	b=l2MemYRlC4Fr1R/MCS5VKCnOQj4gfgs+xBP7IzHZ3qhkVcuCqfMOX7aLlr4kjOeMcf2CUk
	lG9KwbO2RqNqgHGI3YmFcYLIrhi5LydtItW9ZaAfMWJwu++dRnJZAYdMt0FOs72oKJOhjQ
	stjaVuYPuJd7HQJpE4xHrGDuQ77AwUo=
Date: Tue, 03 Feb 2026 22:02:33 +0800
Message-Id: <DG5DRZU7IUOE.38JEHK3H9ICCV@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Linus Walleij" <linusw@kernel.org>, "Jiayu Du"
 <jiayu.riscv@isrc.iscas.ac.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <linux-gpio@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <gaohan@iscas.ac.cn>, <me@ziyao.cc>
Subject: Re: [PATCH v2] pinctrl: canaan: k230: Fix NULL pointer dereference
 when parsing devicetree
References: <20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn>
 <CAD++jL=Up=y_pX4Xy50in08cT978ANaoiD_98nn99frb8=5vOA@mail.gmail.com>
In-Reply-To: <CAD++jL=Up=y_pX4Xy50in08cT978ANaoiD_98nn99frb8=5vOA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_060333_238725_333471AB 
X-CRM114-Status: GOOD (  11.13  )
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

T24gVHVlIEZlYiAzLCAyMDI2IGF0IDg6MzIgQU0gQ1NULCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+
IE9uIFN1biwgRGVjIDI4LCAyMDI1IGF0IDQ6NTPigK9QTSBKaWF5dSBEdSA8amlheXUucmlzY3ZA
aXNyYy5pc2Nhcy5hYy5jbj4gd3JvdGU6Cj4KPj4gV2hlbiBwcm9iaW5nIHRoZSBrMjMwIHBpbmN0
cmwgZHJpdmVyLCB0aGUga2VybmVsIHRyaWdnZXJzIGEgTlVMTCBwb2ludGVyCj4+IGRlcmVmZXJl
bmNlLiBUaGUgY3Jhc2ggdHJhY2Ugc2hvd2VkOgo+PiBbICAgIDAuNzMyMDg0XSBVbmFibGUgdG8g
aGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNz
IDAwMDAwMDAwMDAwMDAwNjgKPj4gWyAgICAwLjc0MDczN10gLi4uCj4+IFsgICAgMC43NzYyOTZd
IGVwYyA6IGsyMzBfcGluY3RybF9wcm9iZSsweDFiZS8weDRmYwo+Pgo+PiBJbiBrMjMwX3BpbmN0
cmxfcGFyc2VfZnVuY3Rpb25zKCksIHdlIGF0dGVtcHQgdG8gcmV0cmlldmUgdGhlIGRldmljZQo+
PiBwb2ludGVyIHZpYSBpbmZvLT5wY3RsX2Rldi0+ZGV2LCBidXQgaW5mby0+cGN0bF9kZXYgaXMg
b25seSBpbml0aWFsaXplZAo+PiBhZnRlciBrMjMwX3BpbmN0cmxfcGFyc2VfZHQoKSBjb21wbGV0
ZXMuCj4+Cj4+IEF0IHRoZSB0aW1lIG9mIERUIHBhcnNpbmcsIGluZm8tPnBjdGxfZGV2IGlzIHN0
aWxsIE5VTEwsIGxlYWRpbmcgdG8KPj4gdGhlIGludmFsaWQgZGVyZWZlcmVuY2Ugb2YgaW5mby0+
cGN0bF9kZXYtPmRldi4KPj4KPj4gVXNlIHRoZSBhbHJlYWR5IGF2YWlsYWJsZSBkZXZpY2UgcG9p
bnRlciBmcm9tIHBsYXRmb3JtX2RldmljZQo+PiBpbnN0ZWFkIG9mIGFjY2Vzc2luZyB0aHJvdWdo
IHVuaW5pdGlhbGl6ZWQgcGN0bF9kZXYuCj4+Cj4+IEZpeGVzOiBkOTRhMzJhYzY4OGYgKCJwaW5j
dHJsOiBjYW5hYW46IGsyMzA6IEZpeCBvcmRlciBvZiBEVCBwYXJzZSBhbmQgcGluY3RybCByZWdp
c3RlciIpCj4+IFNpZ25lZC1vZmYtYnk6IEppYXl1IER1IDxqaWF5dS5yaXNjdkBpc3JjLmlzY2Fz
LmFjLmNuPgo+Cj4gUGF0Y2ggYXBwbGllZCEKPgo+IFNvcnJ5IGZvciBtaXNzaW5nIHRoaXMsIEkg
d2FzIHdhaXRpbmcgZm9yIG1haW50YWluZXIgZmVlZGJhY2sKPiBidXQgaXQgbmV2ZXIgYXJyaXZl
ZC4KPgo+IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoKCkhpIExpbnVzLCBKaWF5dSwKCkFwb2xvZ2ll
cyBmb3IgdGhlIGRlbGF5LgoKSSB0ZXN0ZWQgdGhpcyBvbiBrMjMwOyBpdCBmaXhlcyB0aGUgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlIGR1cmluZyBwaW5jdHJsCnByb2JpbmcuIFRoZSBhcHByb2Fj
aCBpcyBjb3JyZWN0LgoKVGhhbmtzIHRvIHlvdSBib3RoIQoKQmVzdCByZWdhcmRzLCBaZSBIdWFu
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
