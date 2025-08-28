Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B208FCA0FF9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BWJZgB8nO7iyqbyg1Km31qPPLmH0oRUUuWZB0P/zlOg=; b=BfDt4EzxogaEmu
	hncVxvTUmdwyuQx++frOSp2bJu3LRcpcwrSLyXhhm7lYp7c4AOU439OjaJVqeeNXRdoV5F5zBMRkl
	Qqtwmrun8MrwcaKoW2eiN62bEh5HtGjl/XZgkEqYI0RRWbKTDVlZTj/9VGTrjv5KWaCm7SUs3wSGr
	iQ5gkbyWlu5YwKTHFvIxO4qPQ15LRzfFPV3G7N64TB9yF3NfL1DrOkBBUJKHBR16tLKMSPAjPNuJo
	KRavYfQEjBUzjooREVhTHALVTE/xVVq3SGrC+VAieQUkV3JU42wD50U+GP/J3L2wRvJqst5r5/C7T
	Lj0DDeRt5g9+X0hM47HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYrL-00000000ww5-3KZO;
	Thu, 28 Aug 2025 09:23:55 +0000
Received: from mail.dealista.pl ([94.177.238.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXod-00000000lKX-0mNh
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 08:17:04 +0000
Received: by mail.dealista.pl (Postfix, from userid 1002)
	id 682B884CC9; Thu, 28 Aug 2025 10:11:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dealista.pl; s=mail;
	t=1756368693; bh=qcP5dcos5mZ8jV4yTLFLEHzXO5jTY/q0Nu8iMRmEEWE=;
	h=Date:From:To:Subject:From;
	b=XTeBpduNI6uOihcJbvZklerV86bkaB2J87AoeMCCNvJgulaFAgsy5K0i+CJmWOvCt
	 9zpx0+SsP6o2TRmDfp8/ckYGGewBytVrr138lcqpGCuH+v/JdYWPYO43lKgxBoBz6r
	 hCbJvAl/ryZZdMLiH/E3yQ8edAsLfHqrfVlYSXj7VEy7LobgV/BKzWE04EkTn3xObN
	 dIT+q221AYauTpzRlkpJsUT+rWELO8966uicMNtDyUuRTS2f0DbUExDL1W+RU1JjIO
	 qKVfmWU8xhlkaLwTXvqTexUmcbaB+M3nMg3XV+ymP/eGLJ88BwVOZdsBsxRaIHXQZt
	 jUXCH4NdEV7mQ==
Received: by mail.dealista.pl for <linux-riscv@lists.infradead.org>; Thu, 28 Aug 2025 08:10:27 GMT
Message-ID: <20250828084501-0.1.bi.1bm0j.0.i6k7hpbw3o@dealista.pl>
Date: Thu, 28 Aug 2025 08:10:27 GMT
From: "Robert Kozielski" <robert.kozielski@dealista.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Pozycjonowanie - informacja
X-Mailer: mail.dealista.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_011703_354918_CC32CE61 
X-CRM114-Status: UNSURE (  -0.07  )
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

RHppZcWEIGRvYnJ5LCAKCmpha2nFmyBjemFzIHRlbXUgemfFgm9zacWCYSBzacSZIGRvIG5hcyBm
aXJtYSwga3TDs3JlaiBzdHJvbmEgaW50ZXJuZXRvd2EgbmllIHBvenljam9ub3dhxYJhIHNpxJkg
d3lzb2tvIHcgd3lzenVraXdhcmNlIEdvb2dsZS4gCgpOYSBwb2RzdGF3aWUgd3lrb25hbmVnbyBw
cnpleiBuYXMgYXVkeXR1IFNFTyB6b3B0eW1hbGl6b3dhbGnFm215IHRyZcWbY2kgbmEgc3Ryb25p
ZSBwb2Qga8SFdGVtIHdjemXFm25pZWogb3ByYWNvd2FueWNoIHPFgsOzdyBrbHVjem93eWNoLiBO
YXN6IHdld27EmXRyem55IHN5c3RlbSBjb2R6aWVubmllIGFuYWxpenVqZSBwcmF3aWTFgm93ZSBk
emlhxYJhbmllIHdpdHJ5bnkuICBEemnEmWtpIGluZHl3aWR1YWxuZWogc3RyYXRlZ2lpLCBmaXJt
YSB6ZG9ieXdhIGNvcmF6IHdpxJljZWogS2xpZW50w7N3LiAgCgpDenkgY2hjaWVsaWJ5IFBhxYRz
dHdvIHp3acSZa3N6ecSHIGxpY3pixJkgb3PDs2Igb2R3aWVkemFqxIVjeWNoIHN0cm9uxJkgaW50
ZXJuZXRvd8SFIGZpcm15PyAKCk3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgb2ZlcnTEmT8gCgoKUG96
ZHJhd2lhbQpSb2JlcnQgS296aWVsc2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
