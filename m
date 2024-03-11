Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178E7C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 09:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RKSN3qCA5Gi7UKVzR5Mu4GXIDiiljErF1LNpfKnjAwA=; b=ujI/Dhy8RDw5g3
	nRolCrpdU/HlaDyr9g5P5aQWGEy6gB4xW7eJt/7va/+7HF6TAbYxwbyRcKx0ophPyZLjThCYoCCTm
	nj4wzn4MsnUYlBXm5k3xu2LWRJD+XrIL6z4OcahW9mt1MgIxZxAOU9PMe3yH7U3VU61ZuKd2hgdTn
	0t5Z7zVO2vzgokdynoLtfLrhEcNsC8bSifyVm6yv27U52WShyD5vqBAMdLr3yTasG49t+9Hs5uXBM
	t372dvoOYoR2iaiWzpZaKNXjLkce4zV75zc2q9UD04BOM03h7F0lu8jWqFsCdcGSu1zdpsasJZIsh
	UQVD/zZkujOSiEtxUpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbqT-00000000oLf-2Anc;
	Mon, 11 Mar 2024 09:21:21 +0000
Received: from mail.buildbrigade.pl ([135.125.238.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbqQ-00000000oKd-3Tqe
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 09:21:20 +0000
Received: by mail.BuildBrigade.pl (Postfix, from userid 1002)
	id 6BC04A2C8E; Mon, 11 Mar 2024 09:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=BuildBrigade.pl;
	s=mail; t=1710148550;
	bh=EYN951LA1I6x2LqQG9SRvdSsS/DbVhjOvb+nDwRFhwc=;
	h=Date:From:To:Subject:From;
	b=LSVT2xZ8ZO/lMjVUVY9FdXAlqBID8uHDqw3I/65L4KfCoC5SxNi/aOuywPqVCCu5I
	 LTOeo364Fn5YsvY1cPDV81mPLXqaKXFhT0ErFpZFppwPEJT9lrNN3D8QhF6tJ+3cJ5
	 /PScAwGn12Q4O08SI9G23Q5KOuy0eN7WPb/aVWM9ER5P/wyfT61a6AZJssO2+PRf47
	 S8nMPF8FIC/msyFfc3L6tXlw7+OVOfRI9z65gShiKUdyqOiypag9qkFrVuNk3eGI2e
	 tJ8ZA5PolXwRsIAQRTBr9v8FEJ7kccUhdhTVnUqGZafN517sOTKjk3nKYdhfr8VgqV
	 ZuzVaco/BeY0Q==
Received: by mail.BuildBrigade.pl for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 09:15:20 GMT
Message-ID: <20240311074500-0.1.c1.1gynk.0.lg1hgdv7oq@BuildBrigade.pl>
Date: Mon, 11 Mar 2024 09:15:20 GMT
From: "Tomasz Mrozowski" <tomasz.mrozowski@buildbrigade.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Niskokosztowa_modernizacja_o=C5=9Bwietlenia?=
X-Mailer: mail.BuildBrigade.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_022119_029718_E0A61827 
X-CRM114-Status: UNSURE (   0.93  )
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

V2l0YW0sIAoKamVzdGXFm215IHBvbHNraW0gcHJvZHVjZW50ZW0gb3ByYXcgb8Wbd2lldGxlbmlv
d3ljaCwgZG9zdG9zb3dhbnljaCBkbyBwb3RyemViIHNla3RvcmEgcHJ6ZW15c8WCb3dlZ28uCgpO
YXN6eW0gY2VsZW0gamVzdCBwb21hZ2FuaWUgZmlybW9tIHByemVteXPFgm93eW0gdyBvc3pjesSZ
ZHphbml1IGVuZXJnaWkgaSB6d2nEmWtzemFuaXUgZWZla3R5d25vxZtjaSBwb3ByemV6IG1vZGVy
bml6YWNqxJkgb8Wbd2lldGxlbmlhLgoKUHJ6ZXByb3dhZHppbXkgbmllem9ib3dpxIV6dWrEhWN5
IGkgYmV6cMWCYXRueSBhdWR5dCBvxZt3aWV0bGVuaWEgdyBQYW5pL1BhbmEgZmlybWllLCBrdMOz
cnkgcG9tb8W8ZSB6aWRlbnR5Zmlrb3dhxIcgcG90ZW5jamFsbmUgb3N6Y3rEmWRub8WbY2ksIGph
a2llIG1vxbxuYSBvc2nEhWduxIXEhyBwbyB6YXN0b3Nvd2FuaXUgbmFzenljaCBvcHJhdy4gCgpE
emlhxYJhbXkga29tcGxla3Nvd28sIHBvY3rEhXdzenkgb2Qga29uc3VsdGFjamkgbG9rYWxueWNo
LCBwb3ByemV6IHByb2pla3Rvd2FuaWUgb3B0eW1hbG5lZ28gbmF0xJnFvGVuaWEgxZt3aWF0xYJh
LCBhxbwgcG8gcHJvZmVzam9uYWxueSBtb250YcW8IG5hc3p5Y2ggcHJvZHVrdMOzdy4gCgpPcHJh
Y293YWxpxZtteSBpbm5vd2FjeWpueSBtb2RlbCBmaW5hbnNvd2FuaWEgaW53ZXN0eWNqaS4KClBy
b3N6xJkgbyBvZHBvd2llZMW6LCBqZcWbbGkgamVzemN6ZSBuaWUgd3ltaWVuaWxpIFBhxYRzdHdv
IG/Fm3dpZXRsZW5pYSBuYSBMRUQgaSBqZXN0ZcWbY2llIHphaW50ZXJlc293YW5pIG5hc3rEhSBw
cm9wb3p5Y2rEhS4KCgpQb3pkcmF3aWFtClRvbWFzeiBNcm96b3dza2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
