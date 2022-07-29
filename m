Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD12C00144
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jul 2022 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ulc7VSKFM1/7TdAMKDoZVq5exzLWNnOM9Iyo1W/NmYU=; b=C4p7BjJc0TwAPV
	G2VOkUuKG6+zwjsx0P/hN/GeS4XUjYKOY3lNrClTuA/iJnajEES7KvomJaf/GTv0CuSJpYh6lovv4
	9jpoIxw+JgpvXvnDAs8k3kNRnqeSJnk3D6J6PRjzTdovAwrLCG3mcXBGvibgATOQEsTGLdE+PeROn
	/MOIsTDDljaAqdRh+uhZAJS8y/EwWtVSBuLrOpWYNnOphGo+/thcZb+/Hq4AyrV1pfwcMtY6C8c6q
	K5tUNSP7Xlp6w0jxiQQxUH1gNC87KzvlnL3TY4bwOseKge6FjXGwk5CauYH4aFo7sehFOYZDqQJsg
	Xbigp69NrzKmMOB2NvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHKSh-002bnj-Bv; Fri, 29 Jul 2022 07:31:07 +0000
Received: from mail.coredeal.pl ([51.75.73.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHKSd-002biE-63
	for linux-riscv@lists.infradead.org; Fri, 29 Jul 2022 07:31:06 +0000
Received: by mail.coredeal.pl (Postfix, from userid 1002)
	id A531CA9FE5; Fri, 29 Jul 2022 07:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=coredeal.pl; s=mail;
	t=1659079823; bh=9KGuIG62LgzC9aYmjKxzocuYLRCVghXg6v9Q1q2LHec=;
	h=Date:From:To:Subject:From;
	b=ndaNDeOkJ5lWyIE3+d62yVlrtWXy76pr/nxwieJyPvoVQbxdvQH1qR0kl4j0ZoDZo
	 7GzH2SIqyL7r+W481CF8s+yUI/RD0oN8R8shGooZTurm0Ry0hCTrqS+XmCu7gtDQHI
	 BmYvyveIvKRCucb+FzbHjklObMZ25D2H2gjyY1jADSUVqJ8m0tTme/FH0J9t6fBY18
	 u3tzYwXHVwjHJMyy9c8YvwSlG2bALsY1oRwY3k4nqVVsd4vc6oiYap99CBDKMl045Z
	 mOYpKBWBfByyhvIuNovxBkYr8gmEbfEdkG2O03M/MNHU3HlwtlY6/SyAGZdApkqnYL
	 CwWlGT4DhNrAQ==
Received: by mail.coredeal.pl for <linux-riscv@lists.infradead.org>; Fri, 29 Jul 2022 07:29:16 GMT
Message-ID: <20220729063000-0.1.4l.180id.0.v4bqtu2k2a@coredeal.pl>
Date: Fri, 29 Jul 2022 07:29:16 GMT
From: "Krzysztof Maj" <krzysztof.maj@coredeal.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Biznesowy angielski
X-Mailer: mail.coredeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_003103_431062_A4A9EE77 
X-CRM114-Status: UNSURE (   0.47  )
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

RHppZcWEIGRvYnJ5LCAKCmN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIHJvenfDs2oga3dhbGlmaWth
Y2ppIGrEmXp5a293eWNoIHN3b2ljaCBwcmFjb3duaWvDs3c/CgpPcHJhY293YWxpxZtteSBrdXJz
eSBqxJl6eWtvd2UgZGxhIHLDs8W8bnljaCBicmFuxbwsIHcga3TDs3J5Y2gga29uY2VudHJ1amVt
eSBzacSZIG5hIHBvZG5pZXNpZW5pdSBwb3ppb211IHPFgm93bmljdHdhIGkgamFrb8WbY2kga29t
dW5pa2Fjamkgd3lrb3J6eXN0dWrEhWMgYXV0b3Jza8SFIG1ldG9kxJksIHN0d29yem9uxIUgc3Bl
Y2phbG5pZSBkbGEgd3ltYWdhasSFY2VnbyBiaXpuZXN1LiAKCk5pZXN0YW5kYXJkb3d5IGt1cnMg
b24tbGluZSwgZG9wYXNvd2FueSBkbyBwcm9maWx1IGZpcm15IGkgb2JzemFyw7N3IMWbd2lhZGN6
b255Y2ggdXPFgnVnLCB3IHN6eWJraW0gY3phc2llIHByenluaWVzaWUgZWZla3R5LCBrdMOzcmUg
endpxJlrc3rEhSBrb21mb3J0IGkgamFrb8WbxIcgcHJhY3ksIHJvendpamFqxIVjIG1vxbxsaXdv
xZtjaSBiaXpuZXNvd2UuIAoKWmRhbG5lIHN6a29sZW5pZSBqxJl6eWtvd2UgdG8gbS5pbi4gemFq
xJljaWEgeiBuYXRpdmUgc3BlYWtlcmFtaSwga3TDs3JlIHcgc3p5YmtpbSBjemFzaWUgbmF1Y3rE
hSBwcmFjb3duaWvDs3cgcm96bWF3aWHEhyB6YSBwb21vY8SFIGphc25lZ28gaSB6d2nEmXrFgmVn
byBqxJl6eWthIEJ1c2luZXNzIEVuZ2xpc2guCgpDenkgbcOzZ8WCYnltIHByemVkc3Rhd2nEhyB3
acSZY2VqIHN6Y3plZ8OzxYLDs3cgaSBvcG93aWVkemllxIcgamFrIGR6aWHFgmFteT8gCgoKUG96
ZHJhd2lhbQpLcnp5c3p0b2YgTWFqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
