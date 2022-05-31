Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06754C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 31 May 2022 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zEXanxmg89EK80GqgJCsl2VHuhuR7Ix7IVXxucwOQWA=; b=ZL6tDj70ZIXQct
	cAxsByD+uz6M0P95NVjwfPlm41m2pQnGGq6ULDilEsXbuL4poOhlXkRSbegTul2RUzGtePhxZcpNn
	eVZS1EAjnCybpO9OyLTTgDF1fHw2eHZIDURUad/R6G1vk7ZzLBWHfw5g2Pqenb+I8w7VZceahNOXq
	/TF1tuZLsJwgTflYgB3LZo0gO9a78SNqOhHMgoOsrWcxx8N2dyK+zmh1tK1+YNsFF27Vgj6Z0w7lG
	9KTp49Jwyl9H9KMi1Et6PRTPY59vCDxhjbu5jw9+Gk0CBM1ygY/Kei0psbewJ0/J7B384TGuyCDLM
	HiYpmbBkrEbapF1utT9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvx9s-009oKU-Ie; Tue, 31 May 2022 08:23:20 +0000
Received: from mail.onlinesuccesses.pl ([198.244.150.235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvx9q-009oJK-8n
	for linux-riscv@lists.infradead.org; Tue, 31 May 2022 08:23:19 +0000
Received: by mail.onlinesuccesses.pl (Postfix, from userid 1002)
	id AE1F7AE46A; Tue, 31 May 2022 08:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onlinesuccesses.pl;
	s=mail; t=1653985060;
	bh=nE8HqilgMh4dy7+Z8ksfg7Bc9rmPeQtYFq3/3YR2ODU=;
	h=Date:From:To:Subject:From;
	b=Hzg0Eb6vzOWNWCrsOo1jYMkybnsTBSc34l41a7HHuHtBzvb83YnitiqjdZTQwldR7
	 i5qDW2yMUNfL/Fbb4ld9ZzW3tpcf1nfMIsu2hBQIIN/Ox6xPaCsmJRL3UTyFFx1oat
	 VLU9axK+HOED63b4qctGc63/BKI63vlf942B/FBk/xJuRQK9hb5UQ05uhS/gSW+z12
	 blQhGZw0UxgB/wFrJW1oMiw09x2mCXrDoOBj5cEyIvYsVJemeRHTZXdmwgJpvDBy5S
	 VaU+36l7z9FiGb1h5FYaqW3ja0IyD48+Yh/neV37lbQRl/ZPpZpEK+dODfDbT5x5sN
	 HMVy/vD2V5sQw==
Received: by mail.onlinesuccesses.pl for <linux-riscv@lists.infradead.org>; Tue, 31 May 2022 08:15:36 GMT
Message-ID: <20220531064501-0.1.4l.1dc25.0.g4azc2lf46@onlinesuccesses.pl>
Date: Tue, 31 May 2022 08:15:36 GMT
From: "Wiktor Zielonko" <wiktor.zielonko@onlinesuccesses.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Ruch z pierwszej pozycji w Google
X-Mailer: mail.onlinesuccesses.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_012318_482598_3ABC955A 
X-CRM114-Status: UNSURE (   0.79  )
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
ZXJuZXRvd8SFIGZpcm15PyBNw7NnxYJieW0gcHJ6ZWRzdGF3acSHIG9mZXJ0xJk/IAoKClBvemRy
YXdpYW0gc2VyZGVjem5pZSwKV2lrdG9yIFppZWxvbmtvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
