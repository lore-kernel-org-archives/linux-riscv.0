Return-Path: <SRS0=OdZr=L5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4349C07E9C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 23:26:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A887161977
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 23:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A887161977
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=etorok.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZHTqm2OvjxRkxPBLEMKxSY7KE9302KyTldpV6A8iIw=; b=3oJK7gZCFNlGaf
	vhj6buEoNbdbS2nJh+g24MaWZ20oc2lrNUVxoG62+U7AW4Eka/kVb9BLm8kDM1Hec8zOh7EciFh4J
	uV1A7frfBUve7amr4sDEeo6qizEd4Gg5Hr2fXmbwBc1EkaoyNvD2nzkdiqXvqwF7BxncjhCGlDlpn
	b+yQwHrMCXvK8rrt6tvpFk60z9GhsjJKx2Mm23ozAm58BgH450PHzww8nvBsjxdONY4In8QxlTpOL
	ea11hm4uR4DRuwvr0PSL7hbqGTNLuBhZNkWXKrAnosGvTBHtLBWZcJzS8QBySnVGRamdzBmb5MhU9
	xADyBjbWUcXa4GYVdWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Xyn-00A15s-R8; Mon, 05 Jul 2021 23:26:21 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Xyj-00A14S-Cs
 for linux-riscv@lists.infradead.org; Mon, 05 Jul 2021 23:26:18 +0000
Received: (Authenticated sender: edwin@etorok.net)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 70D86200006;
 Mon,  5 Jul 2021 23:26:15 +0000 (UTC)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin@etorok.net>
To: linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin@etorok.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 3/4] MAINTAINERS: add tools/perf/arch/riscv
Date: Tue,  6 Jul 2021 00:25:23 +0100
Message-Id: <20210705232524.4024832-4-edwin@etorok.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705232524.4024832-1-edwin@etorok.net>
References: <20210705232524.4024832-1-edwin@etorok.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_162617_658753_0F36974D 
X-CRM114-Status: UNSURE (   7.45  )
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

c2NyaXB0cy9jaGVja3BhdGNoLnBsIGNvbXBsYWluZWQgYWJvdXQgY2hhbmdlcyBpbiB0b29scy9w
ZXJmL2FyY2gvcmlzY3YvCndpdGhvdXQgTUFJTlRBSU5FUlMgZW50cnkuCkl0IG1hdGNoZXMgdGhl
IHBhdGggc3RyaWN0bHksIGFuZCBub3QgYXMgYSBzdWItc3RyaW5nLCBzbyBiZSBleHBsaWNpdC4K
CkNjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNjOiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgpDYzogQWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJr
ZWxleS5lZHU+CkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnClNpZ25lZC1vZmYt
Ynk6IEVkd2luIFTDtnLDtmsgPGVkd2luQGV0b3Jvay5uZXQ+Ci0tLQogTUFJTlRBSU5FUlMgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggYmQ3YWZmMGMxMjBmLi5mZmM2ZTZhOGQ5YWYgMTAwNjQ0
Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xNTY5MCw2ICsxNTY5MCw3
IEBAIFM6CVN1cHBvcnRlZAogUDoJRG9jdW1lbnRhdGlvbi9yaXNjdi9wYXRjaC1hY2NlcHRhbmNl
LnJzdAogVDoJZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9yaXNjdi9saW51eC5naXQKIEY6CWFyY2gvcmlzY3YvCitGOgl0b29scy9wZXJmL2FyY2gvcmlz
Y3YvCiBOOglyaXNjdgogSzoJcmlzY3YKIAotLSAKMi4zMS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
