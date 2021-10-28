Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00CAC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:16:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C37F96113B
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C37F96113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYWiyfTVNIInu2lpKNR11NRMMsW825r42fGJXgSTjk4=; b=noDT5L2ocEffy5
	K9rJ96y7e4FKjK0TndRw9L4zZF5+D5Hje3EN+evW0k2hKxUT+jCLLwuVI8DI/iPwWt6ueEvPEmj3r
	wIzEeWO4ES5wH1epnVr1LPsy+BRwuXJ1D7uncj+U5k8VBEtyctxJ0MsFaU+mWT3Dbz+yyxK2B7Gd0
	sAFF8gotNCZBh5cPUtWNG32TTBDnIWO6cxDz6r1M2mEJZvPrZnV65ahArKGDuX0sqlgmoCu+pyR+U
	KQ9cOd4lr6Re3Hxv6yg4yL3a4kpv3VZB2VTZpBDTWQWBK5QFMiRvIKpWOBw97l5x++gLVGCt8wNPm
	0J6jIkPFhh1LWRP2pydQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg78j-008NzT-2j; Thu, 28 Oct 2021 15:16:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg78h-008Nyt-DK
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 15:16:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2FFB61221;
 Thu, 28 Oct 2021 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635434183;
 bh=oTD0uzTuFWhkB81ERcflZ4QQgV/0+hOuDfU7dxb4yuo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gafaAGoWKJAXXQXi+uI01Fanlm5UylYfFf/8/8DvIg0zm+BiOBFpiIaMH+ra2wf7B
 q57qQYPFu23OTfSYIn+WKgfu4CVr04zmw4R5wHYS7fml78+HS+xPYORUFXOfuS+jR6
 W8m2RfOi1dXcW5m6+h0FRBJEDTbZttcUDlwFwIkTzJXvpMirP9jVUAQ4r+SeucE2fB
 ER6RUlj/YFGeMf1ciOgtJD3Duc84f5+LguOkMZXgmNPIEFf9WndfuAcrUT/Zxmv1h/
 W8tqqkKklcVc+tGU1RiN+e2mosQmsxLPItO3RYKyuBdg50/TKKhZ/3XiCbsQwtiFar
 KcnHt2ZGBkBdQ==
Date: Thu, 28 Oct 2021 08:16:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf] riscv, bpf: Fix potential NULL dereference
Message-ID: <20211028081621.1fb6bb31@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211028125115.514587-1-bjorn@kernel.org>
References: <20211028125115.514587-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_081623_493105_7F156883 
X-CRM114-Status: UNSURE (   4.29  )
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

T24gVGh1LCAyOCBPY3QgMjAyMSAxNDo1MToxNSArMDIwMCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+
IFRoZSBicGZfaml0X2JpbmFyeV9mcmVlKCkgZnVuY3Rpb24gcmVxdWlyZXMgYSBub24tTlVMTCBh
cmd1bWVudC4gV2hlbgo+IHRoZSBSSVNDLVYgQlBGIEpJVCBmYWlscyB0byBjb252ZXJnZSBpbiBO
Ul9KSVRfSVRFUkFUSU9OUyBzdGVwcywKPiBqaXRfZGF0YS0+aGVhZGVyIHdpbGwgYmUgTlVMTCwg
d2hpY2ggdHJpZ2dlcnMgYSBOVUxMCj4gZGVyZWZlcmVuY2UuIEF2b2lkIHRoaXMgYnkgY2hlY2tp
bmcgdGhlIGFyZ3VtZW50LCBwcmlvciBjYWxsaW5nIHRoZQo+IGZ1bmN0aW9uLgo+IAo+IEZpeGVz
OiBjYTZjYjU0NDdjZWMgKCJyaXNjdiwgYnBmOiBGYWN0b3IgY29tbW9uIFJJU0MtViBKSVQgY29k
ZSIpCj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCkxv
b2tzIHByZXR0eSB0cml2aWFsIHNvIGFwcGxpZWQgdG8gbmV0IHdpdGggRGFuaWVsJ3Mgb2ZmLWxp
c3QgYmxlc3NpbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
