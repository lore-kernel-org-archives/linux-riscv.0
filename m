Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120CFE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=k1GLkiATBZu0av
	8KBYPF7im+DYC0i6zLtOea1nTjBQrIgl3zPGelYtqY7A4jeTMpiu6siN1Zf9FnKLNgnx5au79MIJ8
	ElYZLIUNmHlbm8CphenEQDJy4pcNN3EHhPQVp4VwcAIeB+mehK/sopnXQTHGJjohr/vanzA3oghBI
	jLM5kBrbu8ffZgjrdtbY4+L9JV8bnkGevxJ3t4mjSTCBnEGir3cOMrP15Q6LU9h6I49kbGk3vDw4F
	u/IbM1nrTuEb1Pv2xFTuHSjgHHfSEj1K1RXOCel0+4s+wqHGlVr+19tXUGfe9xAoyEOFsIh0jqZij
	T18AYI373TZplI0NXRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcUv-00000007rj2-0HF2;
	Tue, 14 Jan 2025 08:42:05 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcUr-00000007rgu-3nA7
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 08:42:03 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 7E9C724434; Tue, 14 Jan 2025 09:41:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1736844120;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=OdbTjqNJPlw2PD4IwNNiX6VA4P1fJqX6MLwUW1p01WOvp/8xUfVrz07WKUVez1Osz
	 sJnOJUqoQNKT/v8gFENPQ2pFPLNZFYeS3vw1puo2NKHKGNXwvNQC5hY+CBw1J1tRw9
	 RZ2YiZ+diRP9S5CalwOq+s7LpKS+X9dDoDb//Lgyx7bOMGDozbQaN25Xaco7WvEgQ8
	 nUwK2rT1CeuU8YW/Kw5z45WvOHyk/18BkUegapz1NAKMpqIO3iXh2aS01CmlVRBh9c
	 PuQ49nGdl+6m+vQ2OWiPJAi5pJN6jm9WNmamwsJownIAi55yVebcw9RWLSJQWgsZ1L
	 iuDhKBLJiKWwQ==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 08:40:10 GMT
Message-ID: <20250114084500-0.1.fu.26jhw.0.m808614j01@completesolutions.pl>
Date: Tue, 14 Jan 2025 08:40:10 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_004202_082183_263AC2FF 
X-CRM114-Status: UNSURE (   1.36  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllCk1hcmNpbiBHYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
