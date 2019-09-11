Return-Path: <SRS0=3S6Q=XG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602EBC49ED6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2019 12:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E67206A1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2019 12:54:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bOaDm+of";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aurabindo.in header.i=@aurabindo.in header.b="CTye0k+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E67206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aurabindo.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:From:To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqZGL1zbCk17snPNzADx36lFNjHyDDcgYxF9hxMeXIA=; b=bOaDm+ofdjPR7Q
	5k8LMWq0196iiUK99nonTCecGpdkaWHmPbme65+8DeqozLjoBGEzKjOqROl6SHE1fIcxlE+7yOLUW
	Pz/Jm5dLPB3pPSOWcmfNt0RwDTHJaHlapQo2SC1iUydEwG0nZU46COoV7QqQlqDVu8OZg6Z3hTrDR
	NadNKrenA/n9C9tXiOkOALeWXqwCQ+PqSN4RIfCS6edS96MTYMKrm2mssqFDFoPs88OXLvtd2IevF
	G6RPXvD10Ujj/MGYT9WrsUgn0cEU8EmErSsCO/D3QU990Opw9d005yRThzVDmE+BZZ7+XiX7qy3JI
	2cag6ngxkzPBZUlt1mrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i828c-0003Rz-3i; Wed, 11 Sep 2019 12:54:22 +0000
Received: from mail4.protonmail.ch ([185.70.40.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i828Y-0003RF-Cu
 for linux-riscv@lists.infradead.org; Wed, 11 Sep 2019 12:54:19 +0000
Date: Wed, 11 Sep 2019 12:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in;
 s=protonmail; t=1568206455;
 bh=/3BZ39augr1ATxiyl7hnoRIDGLBNGu5l1MgK7F7Oyjo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=CTye0k+PE/+xBZIyKanXphQXS5P9TX4t6lty9PQYhv113W/RXzTQcdN+7lAUC9L3c
 3fzVwV9iI5nNcTsJEBLV/2rSrJkm/EC8v/zbw1MnY5FNZy8j1r8Nlu5EPxebZoWek3
 8KxFe+lCdyABaw69mDkNnLQEbijbzLiTYVxMCjbY=
To: Troy Benjegerdes <troy.benjegerdes@sifive.com>
From: Aurabindo Jayamohanan <mail@aurabindo.in>
Subject: Re: [RFC] buildtar: add case for riscv architecture
Message-ID: <X9f9LozkDQUeBwasTsPlPseP6ZT5yJHNY2GcIgoAgNQJPuFAyYimnDXTJUqxfrZ64GOIl5-uPh07NZnD1pi4uWhCpZvbu9khOW6rEq5P4jU=@aurabindo.in>
In-Reply-To: <8EF02DA7-46D3-4EA8-96FB-27708BF25DAC@sifive.com>
References: <NwVOGH2ZdDQaDK35QUy7y8GS__G8IYSIUUIBAJsimZq5BgvI3SzLS3uY6fV7Pgppq-RTRHzpT-8KrsLjDN74CPWwHTCWoSgHkGbeJNvyS30=@aurabindo.in>
 <8EF02DA7-46D3-4EA8-96FB-27708BF25DAC@sifive.com>
Feedback-ID: D1Wwva8zb0UdpJtanaReRLGO3iCsewpGmDn8ZDKmpao-Gnxd2qXPmwwrSQ99r5Q15lmK-D8x6vKzqhUKCgzweA==:Ext:ProtonMail
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_055418_651975_DA48226A 
X-CRM114-Status: UNSURE (   4.48  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Aurabindo Jayamohanan <mail@aurabindo.in>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Cgo+IE5vbmUgb2YgdGhlIGF2YWlsYWJsZSBSaXNjViBwbGF0Zm9ybXMgdGhhdCBJ4oCZbSBhd2Fy
ZSBvZiB1c2UgY29tcHJlc3NlZCBpbWFnZXMsIHVubGVzcyB0aGVyZSBhcmUgc29tZSBuZXcgYm9v
dGxvYWRlcnMgSSBoYXZlbuKAmXQgc2VlbiB5ZXQuCj4KCkkgbm90aWNlZCB0aGF0IGRlZmF1bHQg
YnVpbGQgaW1hZ2UgaXMgSW1hZ2UuZ3osIHdoaWNoIGlzIHdoeSBJIHRob3VnaHQgaXRzIGEgZ29v
ZCBpZGVhIHRvIGNvcHkgaXQgaW50byB0aGUgdGFyYmFsbC4gRG9lcyBzdWNoIGEgY29weSBub3Qg
bWFrZSBzZW5zZSBhdCB0aGlzIHBvaW50ID8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
