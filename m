Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE5FCA0EED
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:Date:Subject:
	From:Cc:References:To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCtUGGjpMu8dKlhSda4TeT1EPauIKUoYtu3T6g6Kho8=; b=mZmqNalj7SLjpW
	5DGgFGLlmy6F69kL9Gg9g0F82RjuzgIDRI7P4ayMFcASbANosLE28QKGTQCp6O/DjMb9zvoXkJWTi
	M5/lS/nGvlqcltiNWeI1g1lRFSs9L59c1PWUreIKtUQH/VgysY/+2ChZwYr3MKfcZPH38tZWvXspB
	dKyD4pTCg1KdlMhpp4YWA19vNQUQR6b4b4rDdofQKvO/gR2l6af3uCwMvD/VXaF9QHTI1b6BuaFPu
	9/P6HOtC6xNPBhMlZZ6zCUiVF6fJ+LJg9jTijzNqenTpm13a/VsuzrEJJgR1Mwy8NTS1N44h+azbM
	yEYMXRPDP1nirjvoU/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofh1-0000000D59E-32S6;
	Wed, 20 Aug 2025 10:05:19 +0000
Received: from sg-1-12.ptr.blmpb.com ([118.26.132.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uof10-0000000CuBO-2EtH
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 09:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1755681700;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=26u28Ud/7i5hcKzRJDyQdYOfPIqHtE24mfxQ8LptvT8=;
 b=z3mXtNiUkxhHMDXpKd4Pg82xb9xvoc9gx/rM6ReuznEKIkf/7rgN03rLn2kFVs8JmIuMf+
 qm/2KlX7m5DanWNPsMx+ZXF0Q/uWziYp3xDY9BRvVyO7MaVd5VkBo1EC3bAIg98Z3sHens
 45+Y2HyGw+BsKpY9QpY0r3psl+2y9/mK02DsLND1MnEiXmWY89BIA126QJOuEcz1ZXB/up
 sE1F7Owxvr5fIfR0o2hrUD1WW6Th4IRPMVFoeQOU0JtBWsOfNMJWwwK9/fGwfdlongCQEn
 gHMoBdvuMNQvLYhOMV0N/gYdDghQxGgppXMHa1gvf0oXJDl51ALBhIM5Rwq5lQ==
Message-Id: <20250820092128.8069-1-huangxianliang@lanxincomputing.com>
X-Mailer: git-send-email 2.34.1
To: <markus.elfring@web.de>
References: <568d8b25-8cb5-48f8-850e-0298e3fc456a@web.de>
X-Original-From: XianLiang Huang <huangxianliang@lanxincomputing.com>
Cc: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, 
	<huangxianliang@lanxincomputing.com>, <iommu@lists.linux.dev>, 
	<joro@8bytes.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, 
	<paul.walmsley@sifive.com>, <robin.murphy@arm.com>, 
	<tjeznach@rivosinc.com>, <will@kernel.org>
From: "XianLiang Huang" <huangxianliang@lanxincomputing.com>
Subject: Re: [PATCH v4] iommu/riscv: prevent NULL deref in iova_to_phys
Received: from LeonHXL.localdomain ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Wed, 20 Aug 2025 17:21:34 +0800
Date: Wed, 20 Aug 2025 17:21:28 +0800
Mime-Version: 1.0
X-Lms-Return-Path: <lba+268a5939e+78712b+lists.infradead.org+huangxianliang@lanxincomputing.com>
In-Reply-To: <568d8b25-8cb5-48f8-850e-0298e3fc456a@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_022154_760553_F9A527B3 
X-CRM114-Status: UNSURE (   4.41  )
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

aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9mZWI0NjY1OC01YTNhLTQ0MDMtYjQwNy01MDA1
NjYyODBlYjNAd2ViLmRlLwoKSSB1cGRhdGVkIHRoZSBwYXRjaCBpbiB2MywgYW5kIHVwZGF0ZWQg
Y2hhbmdlIGRlc2NyaXB0aW9uIGFjY29yZGluZ2x5OgoKSW4gdjEKPiAtCWlmIChfaW9fcHRlX25v
bmUoKnB0cikgfHwgIV9pb19wdGVfcHJlc2VudCgqcHRyKSkKPiArCWlmICghcHRyIHx8IF9pb19w
dGVfbm9uZSgqcHRyKSB8fCAhX2lvX3B0ZV9wcmVzZW50KCpwdHIpKQoKSW4gdjMKPiAtCWlmIChf
aW9fcHRlX25vbmUoKnB0cikgfHwgIV9pb19wdGVfcHJlc2VudCgqcHRyKSkKPiArCWlmICghcHRy
KQoKYnV0IHB1dCB5b3VyIHByb3Bvc2FsIGF0IHRoZSBwYXRjaCBTdWJqZWN0Li4uCiAgdjE6IGNo
ZWNrIHB0ZSBudWxsIHBvaW50ZXIgYmVmb3JlIHVzZQogIHYzOiBwcmV2ZW50IE5VTEwgZGVyZWYg
aW4gaW92YV90b19waHlzCgo+IOKApj4gLS0tCj4gPiBDaGFuZ2VzCj4gPiB2NDoKPiA+IC0gQ2hh
bmdlIHRoZSBzdW1tYXJ5IGFzIE1hcmt1cyByZWNvbW1lbmRzCj4gPiAKPiA+IHYzOgpzb3JyeSBm
b3IgbWFraW5nIHRoaXMgbWVzc3kuCgpSZWdhcmRzLApYaWFubGlhbmcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
