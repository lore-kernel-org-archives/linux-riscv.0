Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6066C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 22:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7B6s+QZr2suKYol5462v487epvLvAa0V36ZKMXI6XY=; b=Gk543OKDUEeyTt
	pR/SQxz4/1AgnOsPCQtrGvjRpRUQ34I5mcp4t4hROgEmhLYxd/IfhKEiWft9Bo4HldT+EYuHp44+u
	wt5tGIxQieOutMVPhOovsHN6PbQE/YG6Ld1wc8wMfHPyauBwu8OLV5tLSUmtCq3hYMAVlFzhMFF0x
	gZcPF6ZlOWe4ekvpcxHDvMvCfPbAo3UhY4YyOWhsjITTF4L4jpldzgeC/cn6Vawyn4Oa6hE92+fHX
	lg46YMrNeANfrP0jccjAMQF3fE3v1rizpUsYROz/4CCpWrh6r2Fguyx7SQWQEfqb7/BYxhy6AYomf
	GWyKC/Bpb1/rjx8FPAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfobv-0000000FQ8x-2pu0;
	Thu, 29 Feb 2024 22:10:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfobs-0000000FQ7D-0wWs
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 22:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E9BF6133D;
	Thu, 29 Feb 2024 22:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDF00C433A6;
	Thu, 29 Feb 2024 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709244634;
	bh=W6eOc8kPa7vvpD1zip2/JSn/BkY9XxDFR3rIhaQnalg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j8u9tpQ5Ka83UQtCI1wDmrXxj55f+GHizGHXKVMAsGT36l4Duj9VIIC2aJ/+CB/mZ
	 wic3jahFicHTkDCn3MaFBtR3amtTfqAp8Gaz9uN4sismYebkm7xbpFd04m1msA19Z+
	 psBHVGVO1uf4B90D/7QMm/CVknnVjArdAGgW4hgYeFYYN3V7i5EVwnGQqE9+sGUId5
	 T0h6+5i2j9uxHl7t5BleyhQh30RZnNnAo1KPAZw7hqlr0wawRvKIFTX3b86FO/LOvh
	 UKYYIkF/Vgl1PixoHKvGv7/TJ8OlBzR9onjDzFxlL7AElccDQhjM63HLna2y6wL1i0
	 jKIdrjOo7LoVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B0543D990A8;
	Thu, 29 Feb 2024 22:10:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v2] riscv: Sparse-Memory/vmemmap out-of-bounds fix
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170924463471.14902.12448827543196020525.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 22:10:34 +0000
References: <20240229191723.32779-1-dvlachos@ics.forth.gr>
In-Reply-To: <20240229191723.32779-1-dvlachos@ics.forth.gr>
To: Dimitris Vlachos <dvlachos@ics.forth.gr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, alexghiti@rivosinc.com, paul.walmsley@sifive.com,
 clameter@sgi.com, akpm@linux-foundation.org, rppt@kernel.org, arnd@arndb.de,
 mick@ics.forth.gr, csd4492@csd.uoc.gr, maraz@ics.forth.gr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_141036_355276_206785F4 
X-CRM114-Status: UNSURE (   7.36  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFRodSwgMjkgRmVi
IDIwMjQgMjE6MTc6MjMgKzAyMDAgeW91IHdyb3RlOgo+IE9mZnNldCB2bWVtbWFwIHNvIHRoYXQg
dGhlIGZpcnN0IHBhZ2Ugb2Ygdm1lbW1hcCB3aWxsIGJlIG1hcHBlZAo+IHRvIHRoZSBmaXJzdCBw
YWdlIG9mIHBoeXNpY2FsIG1lbW9yeSBpbiBvcmRlciB0byBlbnN1cmUgdGhhdAo+IHZtZW1tYXDi
gJlzIGJvdW5kcyB3aWxsIGJlIHJlc3BlY3RlZCBkdXJpbmcKPiBwZm5fdG9fcGFnZSgpL3BhZ2Vf
dG9fcGZuKCkgb3BlcmF0aW9ucy4KPiBUaGUgY29udmVyc2lvbiBtYWNyb3Mgd2lsbCBwcm9kdWNl
IGNvcnJlY3QgU1YzOS80OC81NyBhZGRyZXNzZXMKPiBmb3IgZXZlcnkgcG9zc2libGUvdmFsaWQg
RFJBTV9CQVNFIGluc2lkZSB0aGUgcGh5c2ljYWwgbWVtb3J5IGxpbWl0cy4KPiAKPiBbLi4uXQoK
SGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gWy1maXhlcyx2Ml0gcmlzY3Y6IFNw
YXJzZS1NZW1vcnkvdm1lbW1hcCBvdXQtb2YtYm91bmRzIGZpeAogICAgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9yaXNjdi9jL2ExMWRkNDlkY2I5MwoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3Uh
Ci0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwu
b3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
