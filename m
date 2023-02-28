Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975B4C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 18:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9IaqMkTvyj3/KAYMJIGT1NR+lTkciNuMOl6BGfG4asg=; b=z/SKuzVEpJngR6
	IPOK+vr5131fXZapl/LdH3S/wQtgrMBxBibUxntidiuKjCy57gftl4wB6YxbbeyytDYIluewODE8h
	154vall0EYfWAPtoijtpAp0QdrPY13AmYEpCBnFrXECWEDif1YtqvYXI8ZsP1lO/j7+ahK8HZSFoR
	ZZOt1qUI3u107xK6WQkC1fWYQfHHkZMpYjFzMMZ3c8JWllxNebVXeS9kp7eBrA3XF1BdqTohkCMQl
	c3OlJzgJnc07ZxB6ZActAcfyH8i3f2cmJ41NA3G9kXew75X9k4osa8h0uvaHRHoiov66MHkWS8VRy
	u8ppZk/2au8FsCtU8dbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4vh-00E0Vf-5n; Tue, 28 Feb 2023 18:42:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4vd-00E0VF-St
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 18:42:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8454FB80EAA;
	Tue, 28 Feb 2023 18:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B14C433D2;
	Tue, 28 Feb 2023 18:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677609738;
	bh=3r56zFR8DAm2cyXEU98XUbrPHeEkAipKBoGQrgpbMxQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Gii9JFyfLeXbd4wd+isitRYXtMlT55PkIo7BUE+zVXSWvbzDsk1Xkk1S3nnqJj1zX
	 07KGLvJE4rZejNd1G+STfTAqH4edT1R8Z8IjY4SlEAYeuuUGEjWx/bjpXht/Yp+Bfw
	 2NU74DMmMSezfLMtmJOKy0fjjF+PtWSF35/PWB9pXd+Dv9HM93+PC1PTqjd2F/zXz9
	 91kaIyRY6Gze2Kyma4T9B6kurLtaf6tvqDO4I14+xT/D3j0+KgzlhnMmyX0ERF8qWS
	 J5mfZsTdw0YGNHGN4yopm2VP8aNZvvxKRd1IPp/hGQ+GYGJ/G6hHlHzTOBEH+W4UyP
	 alkHAUwcR4S0A==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH] riscv, lib: Fix Zbb strncmp
Date: Tue, 28 Feb 2023 19:42:10 +0100
Message-Id: <20230228184211.1585641-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_104222_125569_8CE5EDD0 
X-CRM114-Status: GOOD (  12.22  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFpiYiBvcHRpbWl6
ZWQgc3RybmNtcCBoYXMgdHdvIHBhcnRzOyBhIGZhc3QgcGF0aCB0aGF0IGRvZXMgWExFTi84Qgpw
ZXIgaXRlcmF0aW9uLCBhbmQgYSBzbG93IHRoYXQgZG9lcyBvbmUgYnl0ZSBwZXIgaXRlcmF0aW9u
LgoKVGhlIGlkZWEgaXMgdG8gY29tcGFyZSBhbGlnbmVkIFhMRU4gY2h1bmtzIGZvciBtb3N0IG9m
IHN0cmluZ3MsIGFuZCBkbwp0aGUgcmVtYWluZGVyIHRhaWwgaW4gdGhlIHNsb3cgcGF0aC4KClRo
ZSBaYmIgc3RybmNtcCBoYXMgdHdvIGlzc3VlcyBpbiB0aGUgZmFzdCBwYXRoOgoKSW5jb3JyZWN0
IHJlbWFpbmRlciBoYW5kbGluZyAod3JvbmcgY29tcGFyZSk6IEFzc3VtZSB0aGF0IHRoZSBzdHJp
bmcKbGVuZ3RoIGlzIDkuIE9uIDY0YiBzeXN0ZW1zLCB0aGUgZmFzdCBwYXRoIHNob3VsZCBkbyBv
bmUgaXRlcmF0aW9uLAphbmQgb25lIGl0ZXJhdGlvbiBpbiB0aGUgc2xvdyBwYXRoLiBJbnN0ZWFk
LCBib3RoIHdlcmUgZG9uZSBpbiB0aGUKZmFzdCBwYXRoLCB3aGljaCBsZWFkIHRvIGluY29ycmVj
dCByZXN1bHRzLiBBbiBleGFtcGxlOgoKICBzdHJuY21wKCIvZGV2L3ZkYSIsICIvZGV2LyIsIDUp
OwoKQ29ycmVjdCBieSBjaGFuZ2luZyAiYmd0IiB0byAiYmdlIi4KCk1pc3NpbmcgTlVMTCBjaGVj
a3MgaW4gdGhlIHNlY29uZCBzdHJpbmc6IFRoaXMgY291bGQgbGVhZCB0byBpbmNvcnJlY3QKcmVz
dWx0cyBmb3I6CgogIHN0cm5jbXAoIi9kZXYvdmRhIiwgIi9kZXYvdmRhXDAiLCA4KTsKCkNvcnJl
Y3QgYnkgYWRkaW5nIGFuIGFkZGl0aW9uYWwgY2hlY2suCgpGaXhlczogYjZmY2RiMTkxZTM2ICgi
UklTQy1WOiBhZGQgemJiIHN1cHBvcnQgdG8gc3RyaW5nIGZ1bmN0aW9ucyIpClN1Z2dlc3RlZC1i
eTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxsLmV1PgpTaWduZWQtb2ZmLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9saWIv
c3RybmNtcC5TIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIvc3RybmNtcC5TIGIvYXJjaC9y
aXNjdi9saWIvc3RybmNtcC5TCmluZGV4IGVlNDk1OTUwNzViZS4uZWZkM2YzMTUwYTU0IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2xpYi9zdHJuY21wLlMKKysrIGIvYXJjaC9yaXNjdi9saWIvc3Ry
bmNtcC5TCkBAIC03OCwxMSArNzgsMTMgQEAgc3RybmNtcF96YmI6CiAJLyogTWFpbiBsb29wIGZv
ciBhbGlnbmVkIHN0cmluZy4gICovCiAJLnAyYWxpZ24gMwogMToKLQliZ3QJYTAsIHQ2LCAzZgor
CWJnZQlhMCwgdDYsIDNmCiAJUkVHX0wJdDAsIDAoYTApCiAJUkVHX0wJdDEsIDAoYTEpCiAJb3Jj
LmIJdDMsIHQwCiAJYm5lCXQzLCB0NSwgMmYKKwlvcmMuYgl0MywgdDEKKwlibmUJdDMsIHQ1LCAy
ZgogCWFkZGkJYTAsIGEwLCBTWlJFRwogCWFkZGkJYTEsIGExLCBTWlJFRwogCWJlcQl0MCwgdDEs
IDFiCgpiYXNlLWNvbW1pdDogZWI5YmU4MzEwYzU4YzE2NmY5ZmFlM2I3MWMwYWQ5ZDY3NDFiNDg5
NwotLSAKMi4zNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
