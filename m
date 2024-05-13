Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EADAC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 07:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cvR2Pn3HYKcJNDyQeYPBaZ0kj9CGIuSL+/+51XIH2AQ=; b=NE8ZGiiwGd+SrU
	R07gEreCWOzwblctU7lUWga7XHreYlUXn1C5Gf66rq2/Q9qC4yFYVu8/7r3PYwii8GLZUpcPtud0X
	LNhRIsCXsGYSrh4sUbcGpdnQcCkdmXtGrhp0+mUgh0BacQ45VnSniguxI477MHMOWMC5AzzvhnxpA
	gE8Y/3Ix4p0a5dNSYbGLh4/6mtRm8Fvf/K8ZfSrkOMoaPvMkgCfsMdgCwBOAWPGg1tZXivDoAZxiY
	3CFCYcNEft1Qvd0NwSMU4cqh9pKjM4SAdghBra7TTcVzVcE3gFAvDQ/z4HGpgO/stcsYJkcXtY7jK
	pK79csg15G/RYcinU8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6QEg-0000000C3J2-2Yo6;
	Mon, 13 May 2024 07:36:38 +0000
Received: from mail.promisingmarket.pl ([80.211.147.228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6QEe-0000000C3Hs-3HYq
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 07:36:38 +0000
Received: by mail.promisingmarket.pl (Postfix, from userid 1002)
	id 6E0F48262F; Mon, 13 May 2024 09:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=promisingmarket.pl;
	s=mail; t=1715585795;
	bh=5seizmrz9v/7daRb+I8LiVx7riI3itzj1vN3dXWI/iw=;
	h=Date:From:To:Subject:From;
	b=mkG0BfGPsIw28cKwtwjdz1Op5oaljAm3jvuw1HKyWhPch9yyfWrsBwNysge44VABe
	 8W+nd5QvYlPay7Cm2QIZ6RXmX7Nxpj5u4OG5mu87hYsfDDJP5tvyuCSlS3l8FRRl4z
	 g97lvlKEz+tZMV9VA+pSxl9mEI7dC1ZHRi1OeNXwzmM/yUr1PEltzWgz1J98qett0c
	 nBQXNnD+khsQf74GClzaVU9ghB87kT93XGO1W7Ih2RXxYExUM9vT73nfgzpCHuuVC1
	 FzmPxLyKoK0Nql4MYubyhXnKFMBWMPpsaJtB0NwjzzOPazbzto541Vy8wVk4i4ZAbS
	 JORcW5NnDve6Q==
Received: by mail.promisingmarket.pl for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 07:36:19 GMT
Message-ID: <20240513084500-0.1.s.1ifm.0.r0otqn9ecq@promisingmarket.pl>
Date: Mon, 13 May 2024 07:36:19 GMT
From: "Kamila Parandyk" <kamila.parandyk@promisingmarket.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Post=C4=99powanie_restrukturyzacyjne_?=
X-Mailer: mail.promisingmarket.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_003636_977505_AECEE52B 
X-CRM114-Status: UNSURE (  -0.53  )
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

RHJvZHp5IFBhxYRzdHdvLAoKdHJ1ZG5vxZtjaSB6IHDFgnlubm/Fm2NpxIUgZmluYW5zb3fEhSwg
dXRyYXRhIGtsdWN6b3dlZ28ga29udHJhaGVudGEgY3p5IGt3ZXN0aWUgendpxIV6YW5lIHogdW1v
d2FtaSBrcmVkeXRvd3ltaSBtb2fEhSBzdHdhcnphxIcgdHJ1ZG5lIHd5endhbmlhIGJpem5lc293
ZS4KClJlc3RydWt0dXJ5emFjamEgdG8gcHJvY2VzLCBrdMOzcnkgbmllIHR5bGtvIG5hcHJhd2lh
IGFrdHVhbG5lIHByb2JsZW15IGZpbmFuc293ZSBmaXJteSwgYWxlIHLDs3duaWXFvCB1a2llcnVu
a293dWplIGrEhSBuYSBkxYJ1Z290ZXJtaW5vd8SFIHN0YWJpbG5vxZvEhyBpIHd6cm9zdC4gWm1p
YW55IG1vZ8SFIGRvdHljennEhyBzZmVyeSBmaW5hbnNvd2VqIGx1YiBla29ub21pY3puZWosIGEg
dGFrxbxlIHdpxIV6YcSHIHNpxJkgemUgem1pYW7EhSB0ZWNobm9sb2dpaSB3IGZpcm1pZS4gCgpO
YXN6YSBrYW5jZWxhcmlhIGFkd29rYWNrYSBwb21hZ2EgcHJ6ZWRzacSZYmlvcmNvbSBwcm93YWR6
acSHIGJpem5lcyBiZXogemFkxYJ1xbxlxYQgaSBza3VwacSHIHNpxJkgbmEgYnVkb3dhbml1IG5v
d3ljaCDFunLDs2RlxYIgcHJ6eWNob2TDs3cuIFByb3BvbnVqZW15IHJvendpxIV6YW5pYSwga3TD
s3JlIGd3YXJhbnR1asSFIGJlenBpZWN6ZcWEc3R3byBtYWrEhXRrdSwgemF3aWVzemFqxIVjIHJh
dHkga3JlZHl0w7N3LCBlZ3pla3VjamUga29tb3JuaWN6ZSBjenkgdW1hcnphasSFYyBvZHNldGtp
LgoKRHppxJlraSBvZHBvd2llZG5pbSBwcm9jZWR1cm9tIHphYmV6cGllY3phbXkgcHJhd25pZSB3
YXJ0b8WbxIcgZmlybXksIGRhasSFYyBjemFzIG5hIG5hcHJhd8SZIGtvbmR5Y2ppIGR6aWHFgmFs
bm/Fm2NpIGkgb2RkxYJ1xbxlbmllIGJleiBrb25pZWN6bm/Fm2NpIG9nxYJhc3phbmlhIHVwYWTF
gm/Fm2NpLgoKSmVzdGXFm215IGdvdG93aSBwb2RqxIXEhyBkemlhxYJhbmlhLCBrdMOzcmUgcG96
d29sxIUgUGHFhHN0d3Ugb2R6eXNrYcSHIHN0YWJpbG5vxZvEhyBmaW5hbnNvd8SFIGZpcm15LiBK
ZcW8ZWxpIHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSByb3pwb2N6xJljaWVtIHRlZ28gcHJv
Y2VzdSwgcHJvc3rEmSBvIGluZm9ybWFjasSZIHp3cm90bsSFLgoKClBvemRyYXdpYW0KS2FtaWxh
IFBhcmFuZHlrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
