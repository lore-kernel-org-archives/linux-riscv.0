Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB94C83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyhwJSNv2K8jS+JJFxci7saLeErMiHIJeV5pIBnHRa4=; b=vH3e7m8KQNE9P6
	VsitOGzvU2bCF4/AQsq0OwTHybWPzyCaVExAdhJKRybQ60jihmA0Ne/C6iGdCCa1ihMDGZaSODCBc
	+D0yvb5EYVIjiP3xrpaR0sN+iBAFmyMNoQ13FH6uFCHl7hy8yMw2zvzRojFrCrEOAuaVlDkQ6Qnv7
	Y2xIx0MLD/ZspGS7cOi9SryxU0Uy+bdx7PRicByNyqJ4AO0Y23Vg+sJKZTDdTQcUJkvG2H/CDuaY1
	R0i87nBkEyD+prhro5ZQLQPduJlb0auQzIvoWjokKHWJNvVszacyMSnuAwQfi1cbeUsfmmc/GKZJf
	YZKnbKvHpLrAyJLVqY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaK0u-008Kve-1C;
	Sun, 27 Aug 2023 17:57:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaK0r-008KvD-11
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 17:57:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE20E60DD7;
	Sun, 27 Aug 2023 17:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C87C433C9;
	Sun, 27 Aug 2023 17:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693159044;
	bh=wl7Yq0FEVBAEExjCSxE+Z63ubf+IPyvbnadjuAvJcTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NQ8buwX5r3+RdNTEorJymSVYXssFZVVzUgi4fzXp3wPwVjDAp7koBhrOdnS4/Myij
	 9qJEG/puGQST52WzdLSRL9shFTPGczdH5PQSM/Dwfk8EwPQZcA/uO72eAkrqVTcBZf
	 VTh3vl9CsQWAMeO4tRP/ig/xZEyZbItNoFbL/NCLG+Bjm2lJEJDTZg9un8VivHGcjI
	 06peGjfg9O/TgKvYtQHHAsDXKYskGc1+xCSfCjE1zjcFR789RJLsFUbVuo+sGAi4K0
	 HijaUWuSeKm+Zokf/jXgiTmIzSALenlYBEnzveh6J6trGbI0LwvbE0/OQ0/n/3mTB+
	 zv3e2aEFSUglw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Nam Cao <namcaov@gmail.com>, kernel
 test robot <lkp@intel.com>
Subject: Re: [PATCH v2] riscv: Only consider swbp/ss handlers for correct
 privileged mode
In-Reply-To: <20230827-dispute-platform-83b494acf090@spud>
References: <20230827114003.224958-1-bjorn@kernel.org>
 <20230827-dispute-platform-83b494acf090@spud>
Date: Sun, 27 Aug 2023 19:57:21 +0200
Message-ID: <87zg2cwepq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_105725_399452_734734BE 
X-CRM114-Status: UNSURE (   6.20  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+PiBSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+IENsb3NlczogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDgyNzE4NDEuSGxubkhGTDctbGtwQGludGVs
LmNvbS8KPgo+IERlbGV0ZSB0aGVzZSwgTEtQIGRpZCBub3QgcmVwb3J0IHRoZSBwcm9iZXMgaXNz
dWUuIFRoZSBMS1AgYm90IHNheXM6Cj4+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJh
dGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKPj4gdGhlIHNh
bWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncwoKVWdoLCBzbG9wcHku
IFRoYW5rcyBmb3IgY2xlYXJpbmcgdGhhdCB1cC4KCkknbGwgd2FpdCBhbmQgc2VlIGlmIHRoZXJl
J3MgbW9yZSBjb21tZW50cy4gSWYgbm90LCBQYWxtZXIsIGNhbiB5b3UKcmVtb3ZlIHRoZXNlIHR3
byB0YWdzPwoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
