Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EE7C48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 13:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wI6a4sXLQDazqsy+IHBeVBwZQRX5zq8UJgwUgMV6OOI=; b=db8ffq0LHkdDmt
	rlYsjgkV/yOOwwvYGFcYFtg6251omtWC6oqmvOlkShtQdJVufqtMuFLLtYTGjjNsvBwDAl4Puv3MW
	6RJRhaGBpxck6R/BOJN3sJXT81ZDVMp4eehVG+D5TKQxST1BIkYCb7HpShdeJ/QzTzlZNfhOQ1l7Z
	ElPpWUSEzQUZ1dlivrJYEFEmynOivpeh8gIlzE0ESPOnMyLbh3YulUVgDHUBrRxuysaJ4hrqlogI4
	dpo1sWsQ9YCfyUlKjaCyT9mY13LiVrXI4bM8sZoO7o+2lNAIsxYjeEpzJ2oijqTdBZhk4k6SQ537M
	5pYwxgKHXcCYaoyeBRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3KG-0000000AXCw-1vXr;
	Mon, 19 Feb 2024 13:04:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3KD-0000000AXAc-1pkq
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 13:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B743D60D37;
	Mon, 19 Feb 2024 13:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED59C433B1;
	Mon, 19 Feb 2024 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347888;
	bh=F7lFIi5YWEQkqiJdWwbx2quDPyRISPmN8tr0pDUd78c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XDrf2ii6+/hTpL3c07hOnzKUx4KJ1Vb5+CNsbZAoiNbaFD+VUlNJ+CNNJQo7RatC+
	 twRqAtjIVwor/O3pExrMYPBd3yjJfqjyzmkT6RsCJTzddGiDzJTPjnPj5vE2eND5Uc
	 yVqYCofGovHcBl8svChqtUjor8X16fq8xOIH0ggJPOqNh1k1Q7AqDTEo4axkjyf5jo
	 Y1OGqZExKLsz2JGjKH84CpA5nEDgFB9rJkXHccv9FQeDmvyJgp4e9LxACExkah74tL
	 AHbF4HF2Ye5Tz/iIi23W1R/qN0JAwoq6gpFnc/DLP1YX5RMxgpirJre5B5t06ot4Hq
	 F+iEdIeH+QKhQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel
 Holland <samuel.holland@sifive.com>, Daniel Borkmann
 <daniel@iogearbox.net>, bpf@vger.kernel.org
Subject: Re: [PATCH 5/7] riscv: Pass patch_text() the length in bytes
In-Reply-To: <20240212025529.1971876-6-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <20240212025529.1971876-6-samuel.holland@sifive.com>
Date: Mon, 19 Feb 2024 14:04:45 +0100
Message-ID: <87y1bgehaq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_050449_575585_6D49EDCA 
X-CRM114-Status: UNSURE (   3.94  )
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

U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyaXRlczoKCj4gcGF0
Y2hfdGV4dF9ub3N5bmMoKSBhbHJlYWR5IGhhbmRsZXMgYW4gYXJiaXRyYXJ5IGxlbmd0aCBvZiBj
b2RlLCBzbyB0aGlzCj4gcmVtb3ZlcyBhIHN1cGVyZmx1b3VzIGxvb3AgYW5kIHJlZHVjZXMgdGhl
IG51bWJlciBvZiBpY2FjaGUgZmx1c2hlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xs
YW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgoKTmljZSEKCk5pdDogMTAwIGNoYXJzIGxp
bmVzLCBwbGVhc2UuCgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
