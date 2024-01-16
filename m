Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C21C4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w6v8jkn5KWd7XY36PN67cEZop/ec3XKah7pRy2IElGo=; b=vLaYzsT25TtMKJ
	UN9Gc1suJq6yN5hIGcdC/mwefhu50cUgQhK9sM306AnWar/crW6upPijQp1DIMqxMvOMA5gkZnpCt
	JaYCeejZNVX9X4iwPXAW2gsnvd6Y1ZuDj4XMkcqulushdJ2a5mtk6RYdt0j0SFQ8qqo4Z2J1r1t95
	4JalnxCAB/ZEkrQNcrSNfdIQ/P9iFnGyL/8Zkpo54hbq/MWGMk3zrZP1bW8W2sIT3XBKzhPnY6LWJ
	E7vCMFT4A+GAw3D0v6eAujsDnKtae6bcrupZrLhJVsf6FK/dlPSnwbP3t5tVjdalnNmLRDbDsHcgh
	42Etfa5q7VGNd5gN9fpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPerE-00BQFu-2W;
	Tue, 16 Jan 2024 08:31:40 +0000
Received: from mail.entropitech.pl ([141.94.250.74])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPerB-00BQEM-1z
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 08:31:38 +0000
Received: by mail.entropitech.pl (Postfix, from userid 1002)
	id 470EEA387E; Tue, 16 Jan 2024 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=entropitech.pl;
	s=mail; t=1705393895;
	bh=3C0lFFl3FyqJxhWazybBxamNtYGn+JlC8TtPqc/zclI=;
	h=Date:From:To:Subject:From;
	b=bGdyG6NznYn4Ld1ssbpXVk0LEG4ezBNJkRZ5SfncNmvnSA3IGokpmhJymKTxeLE2t
	 jJgC6sr1Oguz69NDIIMdZ6MT1iM4pgUfF5WP4RvwTSMKx8tOp8HOSHuKxFdWWVn5vP
	 +OmORu6BAHb8w1D5hrVVDTKfUYz2vWyDbA+NUKCiEv77cLbM1/YX7JGEqGwo5EMmfq
	 5UpG2LPeynQaEfw4yHFF+W6DXpvM6fNQ39j5Giv1u+Vbj6LEQB3Bo++Lq8bXLOK142
	 3HfPPEeiX3cX2y+9cWO5bmIVTC9zy3RsyEYOX+f4CtewpxTeVGYN2ifDR5t5vqi7/d
	 uawpEUhlSsBdQ==
Received: by mail.entropitech.pl for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 08:31:12 GMT
Message-ID: <20240116074500-0.1.ed.p5z9.0.5z9rkgpwfy@entropitech.pl>
Date: Tue, 16 Jan 2024 08:31:12 GMT
From: "Szymon Faryk" <szymon.faryk@entropitech.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Zam=C3=B3wienie_na_klimatyzatory_postojowe?=
X-Mailer: mail.entropitech.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_003137_798183_C2F2DF4C 
X-CRM114-Status: UNSURE (   1.18  )
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

RHppZcWEIGRvYnJ5LCAKCmtvbnRha3R1asSZIHNpxJkgeiBQYcWEc3R3ZW0sIHBvbmlld2HFvCB3
IG9mZXJjaWUgbmFzemVqIGZpcm15IHpuYWpkxIUgUGHFhHN0d28gc3plcm9raSB3eWLDs3Igbm93
b2N6ZXNuZWogaSBpbnR1aWN5am5laiBrbGltYXR5emFjamkgcG9zdG9qb3dlaiBkbyBhdXQgaSBt
YXN6eW4uCgpPZmVydWplbXkgc3dvaW0gS2xpZW50b20gdXJ6xIVkemVuaWEgY3pvxYJvd3ljaCBw
cm9kdWNlbnTDs3csIG1hasSFIFBhxYRzdHdvIG1vxbxsaXdvxZvEhyB3eWJyYcSHIGluc3RhbGFj
asSZLCBrdMOzcmEgc3BlxYJuaSB3c3p5c3RraWUgb2N6ZWtpd2FuaWEgaSB6YXBld25pIGtvbWZv
cnQgdyBrYcW8ZHljaCB3YXJ1bmthY2guCgpNYW15IHcgc3dvaW0gYXNvcnR5bWVuY2llIGtsaW1h
dHl6YXRvcnkgcG9kxYJhd2tvd2UsIGthbWVyb3dlLCBrbGltYXR5emF0b3J5IHogcGlsb3RlbSBv
cmF6IHJvendpxIV6YW5pYSBkb3Bhc293YW5lIGRvIGthbXBlcsOzdyBpIMWCb2R6aS4KClpham11
amVteSBzacSZIG5pZSB0eWxrbyBzcHJ6ZWRhxbzEhSwgYWxlIHLDs3duaWXFvCBmYWNob3d5bSBk
b3JhZHp0d2VtIGkgbW9udGHFvGVtIGtsaW1hdHl6YWNqaS4gxZp3aWFkY3p5bXkgcsOzd25pZcW8
IHVzxYJ1Z2kgc2Vyd2lzb3dlIGkgcHJ6ZWdsxIVkeS4gCgpDenkgc8SFIFBhxYRzdHdvIHphaW50
ZXJlc293YW5pPyAKCgpQb3pkcmF3aWFtClN6eW1vbiBGYXJ5awoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
