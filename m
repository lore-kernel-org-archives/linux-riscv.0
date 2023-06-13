Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F5EC7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZjZnAI5dN/gKWCEGdrhZCbqSD7edsJFJfZILBzzEPM=; b=ZfseTfrbEKgqCc
	plbdhol1IbXynOzWmXFERCTFYU+zbhyeXbcTQOQyEAjtVacPEDacKON/aQqXo3qzL6PzfbgvGCcXT
	l0FetE/w57K5d2VGOnb9oSjHKNjY6m9vvSwW32MgU4+I/AijgOW2IsMJCWvK5ZL6k9bfWW6jZNXD/
	6T1fytaRXYS3DeDy6CEGP98rV9eYufOtYHrAZK1vG/WqVpj60+tn5C3sLveVhFML0I0a4BBwjxb5X
	7TG0rjH0o0isZg3eC6RSVUV/DzLGR9GQ+vuRyLXaMmf6B8B/uOLKj9rPOU63hvQk8NoNwY7ribJut
	TN5RPAWZc5adVVoTOkJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q93dc-0087S2-1N;
	Tue, 13 Jun 2023 13:00:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q93dZ-0087RK-27
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 13:00:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D007B62E67;
	Tue, 13 Jun 2023 13:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79AAC433D2;
	Tue, 13 Jun 2023 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686661240;
	bh=gqhjdmXTpBiAVW68HBds+hnWsKQm7Yc8GSe81z4kXRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I47wTEWG7rUyqCsGy0zpylblH8YaHXHe/M/Krtl7lRtj6GvUN608/u36tVNgo7JiA
	 FRA5yGOVfobw2MCOh+kpDQCUeBogaQZ3HYKfMfUjPvBuP3m5BbjueKFNtWFlYw5oh4
	 gvMWIycEaK+GDwzqYgKRxOyusNfM2lAidLkRlIy6Xxs1ArAn/gaVoFqB/5KbV2vyFl
	 xdAQ6au0LI86ii3hRnbIDBi3tnRlXa+Hyf/Gv+e/qYYAXZWr5tULxoL2dNA0fyFV7T
	 s8EWNKnyRjYMRywFByc09ZNLjs6fSe2alaH6CioRcEszPNNciDi32z6BbmZgXr8ED7
	 Z1w8Kz9oc46pA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com
Cc: conor@kernel.org, conor.dooley@microchip.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: RISC-V: patch-acceptance: mention
 patchwork's role
In-Reply-To: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
References: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
Date: Tue, 13 Jun 2023 15:00:37 +0200
Message-ID: <87mt13ldoq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_060041_762208_B83DB68E 
X-CRM114-Status: GOOD (  11.84  )
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgoKPiBQYWxt
ZXIgc3VnZ2VzdGVkIGF0IHNvbWUgcG9pbnQsIG5vdCBzdXJlIGlmIGl0IHdhcyBpbiBvbmUgb2Yg
dGhlCj4gd2Vla2x5IGxpbnV4LXJpc2N2IHN5bmNzLCBvciBhIGNvbnZlcnNhdGlvbiBhdCBGT1NE
RU0sIHRoYXQgd2UKPiBzaG91bGQgZG9jdW1lbnQgdGhlIHJvbGUgb2YgdGhlIGF1dG9tYXRpb24g
cnVubmluZyBvbiBvdXIgcGF0Y2h3b3JrCj4gaW5zdGFuY2UgcGxheXMgaW4gcGF0Y2ggYWNjZXB0
YW5jZS4KPgo+IEFkZCBhIHNob3J0IG5vdGUgdG8gdGhlIHBhdGNoLWFjY2VwdGFuY2UgZG9jdW1l
bnQgdG8gdGhhdCBlbmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+IEkgd2FzIGFsc28gbm90IHN1cmUgaWYgdGhpcyB3
YXMgdGhlIGNvcnJlY3QgZG9jIGZvciB0aGlzLCBvciB3aGV0aGVyIGEKPiBwcm9jZXNzL21haW50
YWluZXItcmlzY3YucnN0IGZpbGUgd2FzIGJldHRlciBzdWl0ZWQuIFRoZXJlJ3MgY2xlYXJseSBu
bwo+IHJ1c2ggb24gdGhpcyB0aG91Z2ggc28gwq9cXyjjg4QpXy/CrwoKSSdtIGZpbmUgd2l0aCB0
aGlzIGZpbGUuIFRoYW5rcyBmb3IgYWRkaW5nIGl0IQoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
