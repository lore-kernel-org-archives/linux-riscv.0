Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCC2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jan 2022 23:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+iVkBr0USAIM8B2y/zAZ9w74bAoK5DB2KLEaSX7yqc=; b=NL+l10rtA2nKFi
	O2fWLxFxlKw6S2aLW5GOkVKhX3uOIQeboGw90Oc6eh+L08rjK2Zz6u2LnNwtdPD9upl11IqcAX/L1
	7d6cQdJ2UiTmV+8Mbv0ZEib30DfGjuJhJdINTlO2PIYii62BF9OOuRsZtkF6tc172h347yY8W4CxJ
	PSSR8wsaCcXDiaNtoGfjYBsbc8E8RkKC80nYG+DGRBbiTGqgIXwhdzzToR7IgskWCLsvd6c0PR32y
	+9zLYhQqY1dUzvl+L/FC0FJMcQjccrJQPjns+8d3Ce8cjZQ3Ja5U6Tnik69rThquDW+WsrS3c2Xjt
	kUWwYNXEz2jLnS8dgJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5FtF-00G0K2-Rc; Wed, 05 Jan 2022 23:40:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5FtD-00G0Ja-8B
 for linux-riscv@lists.infradead.org; Wed, 05 Jan 2022 23:40:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6CEE619A6;
 Wed,  5 Jan 2022 23:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232FDC36AE9;
 Wed,  5 Jan 2022 23:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641426017;
 bh=UoVI/yWn0FlUyKbpzE4hbt8RxtXVsyuT/Pie/cLHb30=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qQ8uQf2Dmy+1IMjo2n/iU5q6YPcQAedBFDWCZz0XVGDaPyIggYoXYxwjcz6tUerJf
 DRen1KlpIGspaPt2Zc8B6pCqdca/e0EUhw2evpuJ1Eal6PaMPd1vJnAeEB/PNo35i3
 UBvCWN33iOWOpPX+siy2BkLuNYROcSinwEUfQjYWb1NOo4+gGkerCM3jAv5EztBTvk
 8Hu2S3jWTNe8nqKzzmACk7XR7ZSqPYxyOpYU0zx+mrmmJHYLVOqFDKdKEzIkVWqqyO
 noMGaqtLpibblu8AAEyVpxXGWe2rOcx1HJ4tA+3SPqOoI+7n8+7PR18gIUOyHha3fx
 oBI4IZ/Tw+x1Q==
MIME-Version: 1.0
In-Reply-To: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com>
References: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com>
Subject: Re: [PATCH v2 1/1] clk: sifive: Fix W=1 kernel build warning
From: Stephen Boyd <sboyd@kernel.org>
Cc: Zong Li <zong.li@sifive.com>
To: Zong Li <zong.li@sifive.com>, lee.jones@linaro.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com
Date: Wed, 05 Jan 2022 15:40:15 -0800
User-Agent: alot/0.9.1
Message-Id: <20220105234017.232FDC36AE9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_154019_358403_24B95CFC 
X-CRM114-Status: GOOD (  10.03  )
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

UXVvdGluZyBab25nIExpICgyMDIxLTEyLTA4IDAyOjA2OjE4KQo+IFRoaXMgY29tbWl0IHJldmVy
dHMgY29tbWl0IDQ4N2RjN2JiNmEwYyAoImNsazogc2lmaXZlOiBmdTU0MC1wcmNpOgo+IERlY2xh
cmUgc3RhdGljIGNvbnN0IHZhcmlhYmxlICdwcmNpX2Nsa19mdTU0MCcgd2hlcmUgaXQncyB1c2Vk
IikuCj4gRm9yIGZpeGluZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocykgYWJvdXQg4oCYcHJj
aV9jbGtfZnU1NDDigJkgZGVmaW5lZAo+IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFy
aWFibGU9XSwgdGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgQyBmaWxlCj4gb2YgZnU1NDAgYW5kIGZ1
NzQwIGRvZXNuJ3QgdXNlIHRoZXNlIHZhcmlhYmxlcywgYnV0IHRoZXkgaW5jbHVkZXMgdGhlCj4g
aGVhZGVyIGZpbGVzLiBXZSBjb3VsZCByZWZpbmUgdGhlIGNvZGUgYnkgbW92aW5nIHRoZSBkZWZp
bml0aW9uIG9mIHRoZXNlCj4gdmFyaWFibGUgaW50byBmdTU0MCBhbmQgZnU3NDAgaW1wbGVtZW50
YXRpb24gcmVzcGVjdGl2ZWx5LCBpbnN0ZWFkIG9mCj4gY29tbW9uIGNvcmUgY29kZSwgdGhlbiB3
ZSBjb3VsZCBzdGlsbCBzZXBhcmF0ZSB0aGUgU29Dcy1kZXBlbmRlbnQgZGF0YQo+IGluIHRoZWly
IG93biBpbXBsZW1lbnRhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxp
QHNpZml2ZS5jb20+Cj4gLS0tCgpBbnkgRml4ZXMgdGFnPwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
