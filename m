Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A22606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QPb+NArN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=PPrw5SkG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LNWWRIBFnXMY84k5KGVgOf9wJibeBVgb1yuBUmeaD5M=; b=QPb+NArNsZ3QNjpR34/DCMIRx0
	a+BsWDZj5YI00nWmAkpb6HXNn8lNMKiYcEuxq176HiAPTUU7EV47jHUo+lLlCz5F95a9VYPmilxUJ
	TMaYgPv9r91cYmtlAmyOzfCqFjFyVOc7K+6mnWyDAwVNeFCT9ck1gwBLcbr3wQyJwYazYLZUmBuXs
	/R5EYHvdy4banatqHVO3J3JplaCG6JpNjVCUb+BcZJaQWxjuxqViP7JKbTRDPaZBqRqEYosRbC/kX
	JB6KHEhXibb2VQLxKk62Cppy9WyUZGshu3VZ/X3k6r+VocVx1lEiyz8qcKfCc26tGOpunYlVG5nNc
	VjBn1uCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNNC-00000000VBz-176T;
	Mon, 09 Nov 2026 11:17:14 +0000
Received: from retz.cirad.fr ([194.199.235.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNN9-00000000VBe-1qHQ
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 11:17:12 +0000
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id A8F1820D1AB6;
	Mon,  9 Nov 2026 12:17:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 8F5F320D17DA;
	Mon,  9 Nov 2026 12:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 8F5F320D17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794223029;
	bh=PZfe4oWLWSXVWkRAXMmfFFEV4XqGyrUM8E5llLlnI4Y=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=PPrw5SkGuN9ZiZGUySHRwqIzFep8rOpgYPynydBAGQmbAfoCC+KTx2m/Tj43zu1vM
	 r1xi09e7RE6fpaCNHhYme0jkqdBk97wRkulceffz1qJXQS620qIDpPRFrm+0TdXlVh
	 jPLdzwdfM8rNHBhoKGx8msNjxg5L87gwa42aNPV9oCOxN7OrAT24/3G9zRDoJInr3C
	 PCzOt3fL3Ux1nKtpaZen0MEJmV19X8sC3lLhw+iLz14v3zuyQlMZqd9pbyLiO9+alS
	 cF7ozIGdqYIiHJ1Z+fNdh2wcFmLBGjzGMPIhaFGti044Mf2p5c2pj7o/CEFKUapqev
	 V4mwHwGHtzTMA==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id w63RYqua67b1; Mon,  9 Nov 2026 12:17:09 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 2C34320D1AB6;
	Mon,  9 Nov 2026 12:17:09 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: defconfig: enable GPIO LEDs and their triggers
Date: Mon,  9 Nov 2026 12:16:33 +0100
Message-ID: <20261109111637.294236-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_031711_718362_7089F0D5 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TWFueSByaXNjdiBib2FyZHMgZGVzY3JpYmUgZ3Bpby1sZWRzIGluIHRoZWlyIGRldmljZSB0cmVl
LCAxMyBvZiB0aGVtCndpdGggYSBoZWFydGJlYXQgdHJpZ2dlciwgYnV0IGRlZmNvbmZpZyBkb2Vz
IG5vdCBlbmFibGUgdGhlIExFRApzdWJzeXN0ZW0sIHNvIHRoZXNlIExFRHMgc3RheSB1bnVzZWQu
CgpFbmFibGUgTEVEU19HUElPIGFuZCB0aGUgdHJpZ2dlcnMgdXNlZCBieSBpbi10cmVlIHJpc2N2
IGRldmljZSB0cmVlcwooaGVhcnRiZWF0LCBkaXNrLWFjdGl2aXR5LCBkZWZhdWx0LW9uKSwgYXMg
YXJtNjQgZGVmY29uZmlnIGRvZXMuCgpUZXN0ZWQgb24gYSBCYW5hbmEgUGkgQlBJLUYzOiBzeXMt
bGVkIGJsaW5rcyB3aXRoIHRoZSBoZWFydGJlYXQgdHJpZ2dlci4KClRoaXMgcGF0Y2ggd2FzIHBy
ZXBhcmVkIHdpdGggdGhlIGhlbHAgb2YgYW4gQUkgYXNzaXN0YW50IChDbGF1ZGUpLAp3aGljaCBh
bHNvIHJhbiB0aGUgYnVpbGQgYW5kIGJvb3QgdGVzdHMuCgpTaWduZWQtb2ZmLWJ5OiBGcsOpZMOp
cmljIE1haMOpIDxmcmVkZXJpYy5tYWhlQGNpcmFkLmZyPgotLS0KIGFyY2gvcmlzY3YvY29uZmln
cy9kZWZjb25maWcgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9yaXNjdi9j
b25maWdzL2RlZmNvbmZpZwppbmRleCAwNGFlMzA1ZDUuLjY3MDM4MGE5ZiAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZworKysgYi9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVm
Y29uZmlnCkBAIC0yNDUsNiArMjQ1LDEzIEBAIENPTkZJR19NTUNfU1BJPXkKIENPTkZJR19NTUNf
RFc9eQogQ09ORklHX01NQ19EV19TVEFSRklWRT15CiBDT05GSUdfTU1DX1NVTlhJPXkKK0NPTkZJ
R19ORVdfTEVEUz15CitDT05GSUdfTEVEU19DTEFTUz15CitDT05GSUdfTEVEU19HUElPPXkKK0NP
TkZJR19MRURTX1RSSUdHRVJTPXkKK0NPTkZJR19MRURTX1RSSUdHRVJfRElTSz15CitDT05GSUdf
TEVEU19UUklHR0VSX0hFQVJUQkVBVD15CitDT05GSUdfTEVEU19UUklHR0VSX0RFRkFVTFRfT049
eQogQ09ORklHX1JUQ19DTEFTUz15CiBDT05GSUdfUlRDX0RSVl9TVU42ST15CiBDT05GSUdfRE1B
REVWSUNFUz15CgpiYXNlLWNvbW1pdDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVlM2EyMGQyMTgy
OWFhZTdlNAotLSAKMi40Ny4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
