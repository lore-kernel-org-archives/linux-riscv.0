Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC255C4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1bHnaWDepZNKvIvRzUYR8MIWVs6P1VWIhzKv4X/ELJ4=; b=gJqa2PhGbFlZWN
	Q+JW7TeQAAxWbORIlcgdNNEbAtk0qgFfsEJEBSrf+Sy2seWvZ/GdXKrZahJwqcdQllA0c3TbSH7NN
	H6JKkggt+ZtD783KuoUrNuMwYHFq8exWRay9WivCUI7TDmYyz8dRR6phC/uAPfhdTCA9RR1t+a3xx
	+Mb3RbvuSvIOLBgs8nOVGe7nM5pRuuiEDOg5Qo2EDRmSzWJWljEqgO0ZzamGjOBBAxV4PM+t1bdnG
	YKvFFepElBTqpQtBFUVOQRxw+8qnFyETFUb+MJhJg06qzJILHBj+YX6XvExh/xUJblpNme9I+vIpU
	nhBVVICiGFk4diRt6NXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Eb-00000008gfh-2CFq;
	Tue, 21 Jul 2026 07:49:49 +0000
Received: from out-13.smtp.spacemail.com ([63.250.43.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5EX-00000008gfA-3gbF
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 07:49:48 +0000
Received: from [192.168.1.103] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4h48fl04yFz2x99;
	Tue, 21 Jul 2026 07:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1784620176;
	bh=iks/xDPE0d1M9emSWbUSSzGi+JoBRcg8Z3T2an+YYQc=;
	h=From:Date:Subject:To:Cc:From;
	b=JOvvoTsNQLQcVEwVHpsEkmzeom4o/PDhpWUgfmtxNz4W7e4OSDSdqcbryL9enKVxM
	 6Tf6fuyDVh57CZq4GJBVR+lRkKOuUgY+8PoHpUTC07nPi3i/nHKoiqpnuMxAHPrmvO
	 FbMkOzzPmvGqJPqU2dEcufxzI+BJWT+JXowY8LfIpHapKoS90QfGTydVbKz8EWPRdw
	 QCH96qS36v1rww5iHYZuHCW3BchhyMwhQnY9GNZlpQlvBUKfem5BkRGkyMy6f/33p+
	 X9l85E+fs0t+H+M1hQs+mP5Iry7kO/xVov6jGkOA+gF78KnosX7xJkEzLt8YMgQoJT
	 UaEFMheewbpzQ==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Tue, 21 Jul 2026 00:49:27 -0700
Subject: [PATCH v2] pwm: th1520: use vertical import style
MIME-Version: 1.0
Message-Id: <20260721-pwm-rust-vert-imp-v2-1-9f91547f5e07@gurudas.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7ZgWAqgr72FY0HaAmgBNp60aw
 t0F3Lt8yfvvL8DkLTHcsgU8Jct2njbITxnooZ16Qms2hlzklahFie41oo8cMJEPaEeH5bUtjLw
 oI3QH28556uz7aD6aH3NUT9JhD+3GYDnM/nOcJrl7//pJosS6LIxSna5EJe999NG0fDaUoFnX9
 Qu559A7xgAAAA==
X-Change-ID: 20260705-pwm-rust-vert-imp-59a3d18bd0cf
To: Michal Wilczynski <m.wilczynski@samsung.com>, 
 Link Mauve <linkmauve@linkmauve.fr>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 llvm@lists.linux.dev, Guru Das Srinagesh <linux@gurudas.dev>
X-Mailer: b4 0.15.2
X-Envelope-From: linux@gurudas.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_004946_128996_800753A8 
X-CRM114-Status: UNSURE (   9.12  )
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

Q29udmVydCBgdXNlYCBpbXBvcnRzIHRvIHZlcnRpY2FsIGxheW91dCBmb3IgYmV0dGVyIHJlYWRh
YmlsaXR5IGFuZAptYWludGFpbmFiaWxpdHkuCgpTaWduZWQtb2ZmLWJ5OiBHdXJ1IERhcyBTcmlu
YWdlc2ggPGxpbnV4QGd1cnVkYXMuZGV2PgotLS0KQ2FtZSBhY3Jvc3MgYSByZWNlbnQgY29tbWl0
IGJjNTg5MDVlYjA3ICgic2FtcGxlczogcnVzdF9taXNjX2RldmljZTogdXNlCnZlcnRpY2FsIGlt
cG9ydCBzdHlsZSIpIGFuZCBmb3VuZCBhIGZldyBtb3JlIGxvY2F0aW9ucyB0aGF0IGNvdWxkCmJl
bmVmaXQgZnJvbSB0aGlzIGNsZWFudXAuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KClNlcGFyYXRp
bmcgb3V0IHBhdGNoZXMgcGVyLXN1YnN5c3RlbSBhcyBwZXIgdGhlIHJldmlldyBmZWVkYmFjayBp
biBbMF0uCgpUZXN0ZWQgdmlhOgoKICAgICQgbWFrZSBMTFZNPTEgcnVzdGZtdGNoZWNrIHx8IGVj
aG8gImZhaWwiCiAgICAkCgpbMF06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjA2
MjgtYjQtcnVzdC12ZXJ0aWNhbC1pbXBvcnRzLXYxLTAtOThiYzcxZDQ4MTBiQGd1cnVkYXMuZGV2
LwotLS0KQ2hhbmdlcyBpbiB2MjoKLSBMaW5rIE1hdXZlOiBSZW1vdmVkIGVtcHR5IHRlcm1pbmFs
IGNvbW1lbnQgZnJvbSBtaWRkbGUgb2YgaW1wb3J0cwotIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0
Y2gubXNnaWQubGluay8yMDI2MDcwNS1wd20tcnVzdC12ZXJ0LWltcC12MS0xLTc1M2RiYmZjNjA2
MUBndXJ1ZGFzLmRldgoKVG86IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3Vu
Zy5jb20+ClRvOiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4KVG86IEd1byBSZW4g
PGd1b3JlbkBrZXJuZWwub3JnPgpUbzogRnUgV2VpIDx3ZWZ1QHJlZGhhdC5jb20+ClRvOiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dWtsZWluZWtAa2VybmVsLm9yZz4KVG86IE1pZ3VlbCBPamVkYSA8b2pl
ZGFAa2VybmVsLm9yZz4KVG86IEJvcXVuIEZlbmcgPGJvcXVuQGtlcm5lbC5vcmc+ClRvOiBHYXJ5
IEd1byA8Z2FyeUBnYXJ5Z3VvLm5ldD4KVG86IEJqw7ZybiBSb3kgQmFyb24gPGJqb3JuM19naEBw
cm90b25tYWlsLmNvbT4KVG86IEJlbm5vIExvc3NpbiA8bG9zc2luQGtlcm5lbC5vcmc+ClRvOiBB
bmRyZWFzIEhpbmRib3JnIDxhLmhpbmRib3JnQGtlcm5lbC5vcmc+ClRvOiBBbGljZSBSeWhsIDxh
bGljZXJ5aGxAZ29vZ2xlLmNvbT4KVG86IFRyZXZvciBHcm9zcyA8dG1ncm9zc0B1bWljaC5lZHU+
ClRvOiBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQGtlcm5lbC5vcmc+ClRvOiBEYW5pZWwgQWxtZWlk
YSA8ZGFuaWVsLmFsbWVpZGFAY29sbGFib3JhLmNvbT4KVG86IFRhbWlyIER1YmVyc3RlaW4gPHRh
bWlyZEBrZXJuZWwub3JnPgpUbzogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5j
b20+ClRvOiBPbnVyIMOWemthbiA8d29ya0BvbnVyb3prYW4uZGV2PgpUbzogTmF0aGFuIENoYW5j
ZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgpUbzogTmljayBEZXNhdWxuaWVycyA8bmljay5kZXNh
dWxuaWVycytsa21sQGdtYWlsLmNvbT4KVG86IEJpbGwgV2VuZGxpbmcgPG1vcmJvQGdvb2dsZS5j
b20+ClRvOiBKdXN0aW4gU3RpdHQgPGp1c3RpbnN0aXR0QGdvb2dsZS5jb20+CkNjOiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1wd21Admdlci5rZXJuZWwub3JnCkNj
OiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBydXN0LWZvci1saW51eEB2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGxsdm1AbGlzdHMubGludXguZGV2Ci0tLQogZHJpdmVycy9wd20vcHdtX3Ro
MTUyMC5ycyB8IDEyICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJz
IGIvZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycwppbmRleCAzZTNmYTUxY2NlZjkuLjU0M2JkOGRl
YTg0NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycworKysgYi9kcml2ZXJz
L3B3bS9wd21fdGgxNTIwLnJzCkBAIC0yMywxNSArMjMsMjEgQEAKIHVzZSBjb3JlOjpvcHM6OkRl
cmVmOwogdXNlIGtlcm5lbDo6ewogICAgIGNsazo6Q2xrLAotICAgIGRldmljZTo6e0JvdW5kLCBD
b3JlLCBEZXZpY2V9LAorICAgIGRldmljZTo6eworICAgICAgICBCb3VuZCwKKyAgICAgICAgQ29y
ZSwKKyAgICAgICAgRGV2aWNlLCAvLworICAgIH0sCiAgICAgZGV2cmVzLAogICAgIGlvOjp7CiAg
ICAgICAgIG1lbTo6SW9NZW0sCiAgICAgICAgIElvLCAvLwogICAgIH0sCi0gICAgb2YsIHBsYXRm
b3JtLAorICAgIG9mLAorICAgIHBsYXRmb3JtLAogICAgIHByZWx1ZGU6OiosCi0gICAgcHdtLCB0
aW1lLAorICAgIHB3bSwKKyAgICB0aW1lLCAvLwogfTsKIAogY29uc3QgVEgxNTIwX01BWF9QV01f
TlVNOiB1MzIgPSA2OwoKLS0tCmJhc2UtY29tbWl0OiAxYTQ5MjA5NDBlYmZkOGQ5MDc4NThhYmQ4
ZjhkZDA5YjEzNzUyOTQ2CmNoYW5nZS1pZDogMjAyNjA3MDUtcHdtLXJ1c3QtdmVydC1pbXAtNTlh
M2QxOGJkMGNmCgpCZXN0IHJlZ2FyZHMsCi0tICAKR3VydSBEYXMgU3JpbmFnZXNoIDxsaW51eEBn
dXJ1ZGFzLmRldj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
