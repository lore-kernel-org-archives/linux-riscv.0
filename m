Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478EC606A322
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=umbG/SGM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=FiZcCj2L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3FSKkn5C6tOSIDrFUZbWBLKH1Jx6W1BFRaAaTfSquEk=; b=umbG/SGMj0OkaUEDlaHX3lQnoN
	vDsLJ0oNxumheyjmKbZI2klMhu3ONYLoFELLanXPrSJu//5wCT+RTm0PjTMdnLDDgCnFyrymJ322m
	ZtQsHj4v2Csw8F8mvYRfRyyycpTl0CHsHiDg14+2B93cRri8+svAcPJrffc0WyV5zp0jyAms70vHS
	OdT4EiRD41qbkKXm/uDASSjgHCYi/ZiI/QjIaAnZOClbS+1++7LoQaBX0ppjocvV7hRR5UC3OlojW
	xA/QHe1R+PNiYMaUU6k75cNEOq7l5Euhpit86BL+EynIjLSO0+aJFafVqpBqPpDVS/qF4UO+0CtSZ
	anQd+T4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNIe-00000000V0p-301z;
	Mon, 09 Nov 2026 11:12:32 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNIb-00000000Uzx-3ed4
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 11:12:31 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 0DD0720DDBCC;
	Mon,  9 Nov 2026 12:12:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id E0B2020DDADF;
	Mon,  9 Nov 2026 12:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr E0B2020DDADF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794222747;
	bh=VGlyRg+o5Sd5Ky/RHL0mANOVwK5aB0JC7ZTXPrkLOqw=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=FiZcCj2Ld/NK8nNdxoys4IKC3uHaNsdv9/dkClybfxguo42M9eeRzgMg2h4BfAFSs
	 PmOdJtGSkizPWsUgsqnadCtP9asm6tj2QPbz/qMzP8ODOeuas2SxB0PvpafUsR6CJ1
	 iX5ihmZa6BGcLdWYyX9nt9TB8Y1icYr9zECj1tgR4SUbYyRiqG2WOIAHDsQKcHMDPm
	 mim0mTuicn0X2ly5stl5tFJezd+TeYicZ2h7Sn+qjKCxB0nt7XxBKjhIzY8lDudo/c
	 r0pSRvVE36mko95KZoSK904+i6z0l7am2OJZwvIR6NiGtC6plEZ/UEi5p3QOGANrNH
	 IIlYKRiSM/iwA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id O1WZFjff3q2V; Mon,  9 Nov 2026 12:12:27 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 26B8D20DDBCC;
	Mon,  9 Nov 2026 12:12:27 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Bruno Banelli <bbanelli@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: Re: [PATCH] riscv: defconfig: enable dwc3 and the SpacemiT K1 thermal sensor
Date: Mon,  9 Nov 2026 12:11:50 +0100
Message-ID: <20261109111155.293849-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826-ought-tableware-73678af4dd1f@spud>
References: <20260825052233.66850-1-bbanelli@gmail.com> <20260825224905-GKD631715@kernel.org> <20260826-ought-tableware-73678af4dd1f@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_031230_058811_95DA4681 
X-CRM114-Status: GOOD (  11.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBBdWcgMjYsIDIwMjYgYXQgMDk6MzM6MTBBTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFR1ZSwgQXVnIDI1LCAyMDI2IGF0IDEwOjQ5OjA1UE0gKzAwMDAsIFlpeHVuIExh
biB3cm90ZToKPiA+IFRoZSBwYXRjaCBpdHNlbGYgbG9va3MgZ29vZCB0byBtZSwgYnV0IHNpbmNl
IGl0IGRlYWwgd2l0aCB0d28gZGlmZXJlbnQgZHJpdmVycwo+ID4gU28sIGNhbiB5b3Ugc3BsaXQg
aXQgaW50byB0d28gcGF0Y2hlcz8gd2hpY2ggZWFzeSB0byByZXZpZXcgYW5kIG1hbmFnZQo+Cj4g
SU1PIGl0J3MgZmluZSBiZWluZyBvbmUgcGF0Y2gsIGJ1dCB0aGlzIHRlbXAgc2Vuc29yIHNob3Vs
ZCBwcm9iYWJseSBiZSBhCj4gbW9kdWxlPwoKVGVzdGVkIHRoZSBzYW1lIG9wdGlvbnMgb24gYSBC
YW5hbmEgUGkgQlBJLUYzIHdpdGggdjcuNC1yYzEgKGR3YzMgYW5kCmR3YzMtZ2VuZXJpYy1wbGF0
IGFzIG1vZHVsZXMsIFNQQUNFTUlUX0sxX1RTRU5TT1I9eSk6IGJvdGggVVNCIHJvb3QgaHVicwoo
Mi4wIGFuZCAzLjApIGNvbWUgdXAsIGFuZCB0aGUgZml2ZSB0aGVybWFsIHpvbmVzIHJlYWQgc2Fu
ZSB2YWx1ZXMuClRlc3RpbmcgZG9uZSB3aXRoIHRoZSBoZWxwIG9mIENsYXVkZSAoQUkgYXNzaXN0
YW50KS4KCkJydW5vLCBkbyB5b3UgcGxhbiBhIHYyIHNwbGl0IGFzIFlpeHVuIGFza2VkPyBJIGNh
biB0ZXN0IGl0LgoKVGVzdGVkLWJ5OiBGcsOpZMOpcmljIE1haMOpIDxmcmVkZXJpYy5tYWhlQGNp
cmFkLmZyPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
