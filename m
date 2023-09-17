Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CDCCD37B4
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQx0N+p3Zo17+x9MGERA4/cCP+XWfEbmrTlI4yWOfZA=; b=QiGwlwxO1o3ibU
	XsWMktMF33hauDK6ApeoH6cjKFESKOVlRDVrJqy795wmxGbYKCTBlEfRUkvc4aIZMTZ4dLp4nE0L6
	8kmTLROfkTJhUuKIHXLASsQb6ewxQGN8RN0PcW5WBrmWmZwq4ygiqdTncOp6hX6mZbzKNjl5CZ493
	HGmMI6ijenof0hVBRJHxIUbAW7191hw6n3pkPUAw3mFWGCbxrs1GzCFNjAE8Y97vGoepKNa1hvGpu
	6P/iZz+sfFoHlxxaeWJrZwBqgKtP6WI2SXsbojRIs1dmHDZ7mkyUpykAGskGDiOiz+sfyfC/F8XfZ
	39fw1sklJhn3Q5ANlUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtou-00DmTk-0N;
	Sun, 17 Sep 2023 15:36:24 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtor-00DmSw-0i
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 15:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1694964978;
	bh=CFKO2pFyHSsA2SAs6y1PywroFir3M35jZ1f8rQL8DIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=grweBFpqOzzFodwt9bLiUu+iq1fDMCCV2KbU7oR61uO2DmX1YY996TpBvk7O55JWO
	 xmpwXzKtSjaPDyNqHTfld80fPCdkamOBDhFuxIwsU0gseEI5uHVIi3hKI4fjxAn6l9
	 e/vQ3wCQOrQmVcPn0IvSKP6+XmhT/h0A/DjEXF/M=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 17 Sep 2023 17:36:16 +0200
Subject: [PATCH v2 1/4] selftests/nolibc: allow building i386 with
 multiarch compiler
MIME-Version: 1.0
Message-Id: <20230917-nolibc-syscall-nr-v2-1-03863d509b9a@weissschuh.net>
References: <20230917-nolibc-syscall-nr-v2-0-03863d509b9a@weissschuh.net>
In-Reply-To: <20230917-nolibc-syscall-nr-v2-0-03863d509b9a@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694964977; l=951;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=CFKO2pFyHSsA2SAs6y1PywroFir3M35jZ1f8rQL8DIY=;
 b=VsixQu3g8WzopT9PImr31pRBaIq13lYqmy67LYfor/qIj3rHz5UPsZREaLxJr7ILn1LXxrUI/
 IpcQwNaSusPDo9KxxDvHj6wODfe0BMy1Lf52vkb0+30THRM1jrRkwrJ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_083621_430535_2CDAEE8A 
X-CRM114-Status: UNSURE (   6.68  )
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

V2hlbiBidWlsZGluZyB3aXRoIGEgbXVsdGlhcmNoLWNhcGFibGUgY29tcGlsZXIsIGxpa2UgdGhv
c2UgcHJvdmlkZWQgYnkKY29tbW9uIGRpc3RyaWJ1dGlvbnMgdGhlIC1tMzIgYXJndW1lbnQgaXMg
cmVxdWlyZWQgdG8gYnVpbGQgMzJiaXQgY29kZS4KCldyYXAgaXQgaW4gY2Mtb3B0aW9uIGluIGNh
c2UgdGhlIGNvbXBpbGVyIGlzIG5vdCBtdWx0aWFyY2gtY2FwYWJsZS4KCkFja2VkLWJ5OiBXaWxs
eSBUYXJyZWF1IDx3QDF3dC5ldT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxp
bnV4QHdlaXNzc2NodWgubmV0PgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9N
YWtlZmlsZSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlCmluZGV4IDY4OTY1OGY4MWExOS4uMTkwOTZhOWRl
ZDU1IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUK
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlCkBAIC0xMTMsNiAr
MTEzLDcgQEAgZWxzZQogUT1ACiBlbmRpZgogCitDRkxBR1NfaTM4NiA9ICQoY2FsbCBjYy1vcHRp
b24sLW0zMikKIENGTEFHU19wcGMgPSAtbTMyIC1tYmlnLWVuZGlhbiAtbW5vLXZzeCAkKGNhbGwg
Y2Mtb3B0aW9uLC1tbXVsdGlwbGUpCiBDRkxBR1NfcHBjNjQgPSAtbTY0IC1tYmlnLWVuZGlhbiAt
bW5vLXZzeCAkKGNhbGwgY2Mtb3B0aW9uLC1tbXVsdGlwbGUpCiBDRkxBR1NfcHBjNjRsZSA9IC1t
NjQgLW1saXR0bGUtZW5kaWFuIC1tbm8tdnN4ICQoY2FsbCBjYy1vcHRpb24sLW1hYmk9ZWxmdjIp
CgotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
