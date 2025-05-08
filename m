Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB244C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 08:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h+vchdA36rIrgcIXOQ1aZl46wuTP2Jub67XFSK0YHWM=; b=2ZNhp9NTr2CPDc
	tmcyJOfOKHwKzHijn5DK632Qum/MjIpRB1zKuVoM8x4XlgkSSotTqLif9cyJx4UXs7Bp7f9GS4Rbi
	QsTgE0YaX6+FMQO2uGvrbQEXoEgKBAOk4fl+fWd5js8H85w35RfRIUodpXsaTTMWFJCLtoaw4YmoS
	ZDKqzfszMbQVmbgM/5lhhOjaSSRYSR+ko3FVwMLLiIY90X/BK1tZTvxObDvsCrzQhSE/fGqh1wtOF
	14UqaEC1XBRrY4RRYe8vxsdxElIPG165aNncWuKw3FXdzywCvjgyQP1x09EwtZzlpgPiuY2gQyw42
	+GHhNXIOshMVmH4h0S9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwCG-000000003WD-109m;
	Thu, 08 May 2025 08:01:36 +0000
Received: from mail.growdeal.pl ([141.95.55.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwB5-000000003Td-2ilh
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 08:00:25 +0000
Received: by mail.growdeal.pl (Postfix, from userid 1002)
	id 7003924867; Thu,  8 May 2025 08:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growdeal.pl; s=mail;
	t=1746691218; bh=nU0fzD5wnLwbt9yoUSBeMInFHzMm7DGirLXtUO2ZpV8=;
	h=Date:From:To:Subject:From;
	b=Sb0aUxtC21PnBuIBxpKzCifVQbxwH3JilM/yYLm6F5vVdqvsvlOKXrwtFaUwUTZAz
	 sBR63VRxdmDFO6XjPHqtuV9KJoR8tWEsp7EDpbO3NzCls3NWwRXYW9UeMehYTJSwlU
	 LGOAUnG4GZhR8LvkGnfQQuHTzTaPKDSSYu/GXCh351hHzVHfQlqICAQfROzQwTWiPC
	 umCJiN8nBAofecVEI7YFjpDVlhNkyydvxRvlYkDt2uHcKmIJonttf91TbzWEPIXlbo
	 ywXJhoUVt21Z6/YRq4u3LRHMa3Cz5WlpjRPLSGGqa4XbTXNXJlt66ccATc9X6CMCXf
	 B5d02GIypKk/w==
Received: by mail.growdeal.pl for <linux-riscv@lists.infradead.org>; Thu,  8 May 2025 08:00:10 GMT
Message-ID: <20250508064500-0.1.26.zufz.0.86dtwhfj8r@growdeal.pl>
Date: Thu,  8 May 2025 08:00:10 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Zajdlicz"?= <pawel.zajdlicz@growdeal.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.growdeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_010024_378568_9BD02D07 
X-CRM114-Status: UNSURE (   0.56  )
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPwoKClBvemRyYXdpYW0K
UGF3ZcWCIFphamRsaWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
