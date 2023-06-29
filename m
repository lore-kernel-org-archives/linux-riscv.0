Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A045BEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lNHpW+N+FkLBc0JO2/K8YjX9XcM/G4yAl005TAm/rPM=; b=3h2jTNTXJaWWyk
	EackzoHt829iwFHMsku9+D1tyx/RaSOdf6MeCCFVedBLgWOUTnUqOwWi9rf9SuW5DS2OPXqdyQGSq
	HIbtGdowbEGTOmLFiE4Caujs+vOkQyYLDyrgsJryKP4yqQ7gBm1oaWpC/zV4njQzzD/VZb6hJDCWM
	JagDTKXcxv9F+MtuwPJYxJbztdy9RfxrhyvMksn1NmP76FST4DXgTvXJQwidKmba8jL+3T1+ySRUH
	TS2CyInqEvB2f46X97/jOQR1ZQg4Lw/OSqj8ryV0YaWDB/kfMRHhPqmOw3dO5x8BHe62xRClArkYp
	ZK/vf3qmKujOfP9/ORTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEsXg-001HYr-1L;
	Thu, 29 Jun 2023 14:22:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEsXc-001HYQ-2l
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 14:22:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E602D61562;
	Thu, 29 Jun 2023 14:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F7FC433C0;
	Thu, 29 Jun 2023 14:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688048555;
	bh=noPPya2IB97xos3514fxrM3ffrnnYQnlEv4tZ/dVCTQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Nw9ivVGkcedTNaWaMrJ0K3JrlUoIxliZ5dXSbmRiyfUuu+YrTflYxVKSLmcawyIo4
	 rL08oZQkRRoHuAyls+Dympl8oogYLFeuMIDz+pKLF+dPxhPvP8GMS4mzy0knHz06h4
	 CscQ9tnTdfZoS3Sy0S3zH3pddlBU8fvXxsOT/sl8YzlSfQ5tBbpBqJlYtlNC7bVbWq
	 nw9X89ptz0Gq0ZGm+ovPexLyAGyRMxG+4roaBUvxCVcbseMb1e7eR2HvMRwpHcKElf
	 FuoOIXdwRYy/mtwyIMk3IqKD2cwf+jPHWazA2CkW3ZJhNVFHkPfkEDzOP7gwPEZukC
	 TTBUCGohNPwXw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux@rivosinc.com,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	Darius Rad <darius@bluespec.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4] riscv: Discard vector state on syscalls
Date: Thu, 29 Jun 2023 16:22:28 +0200
Message-Id: <20230629142228.1125715-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_072237_044718_A0E59A83 
X-CRM114-Status: GOOD (  11.15  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFJJU0MtViB2ZWN0
b3Igc3BlY2lmaWNhdGlvbiBzdGF0ZXM6CiAgRXhlY3V0aW5nIGEgc3lzdGVtIGNhbGwgY2F1c2Vz
IGFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJlZ2lzdGVycwogICh2MC12MzEsIHZsLCB2dHlwZSkg
YW5kIHZzdGFydCB0byBiZWNvbWUgdW5zcGVjaWZpZWQuCgpUaGUgdmVjdG9yIHJlZ2lzdGVycyBh
cmUgc2V0IHRvIGFsbCAxcywgdmlsbCBpcyBzZXQgKGludmFsaWQpLCBhbmQgdGhlCnZlY3RvciBz
dGF0dXMgaXMgc2V0IHRvIERpcnR5LgoKVGhhdCB3YXkgd2UgY2FuIHByZXZlbnQgdXNlcnNwYWNl
IGZyb20gYWNjaWRlbnRhbGx5IHJlbHlpbmcgb24gdGhlCnN0YXRlZCBzYXZlLgoKUsOpbWkgcG9p
bnRlZCBvdXQgWzFdIHRoYXQgd3JpdGluZyB0byB0aGUgcmVnaXN0ZXJzIG1pZ2h0IGJlCnN1cGVy
Zmx1b3VzLCBhbmQgc2V0dGluZyB2aWxsIGlzIHN1ZmZpY2llbnQuCgpMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8xMjc4NDMyNi45VVBQSzNNQWVCQGJhc2lsZS5yZW1s
YWIubmV0LyAjIFsxXQpTdWdnZXN0ZWQtYnk6IERhcml1cyBSYWQgPGRhcml1c0BibHVlc3BlYy5j
b20+ClN1Z2dlc3RlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+ClN1
Z2dlc3RlZC1ieTogUsOpbWkgRGVuaXMtQ291cm1vbnQgPHJlbWlAcmVtbGFiLm5ldD4KU2lnbmVk
LW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KCnYzLT52NDoK
ICBGaXhlZCBidWlsZCBDT05GSUdfUklTQ1ZfSVNBX1Y9biBidWlsZHMgKENvbm9yKQoKdjItPnYz
OgogIFNldCBzdGF0ZSB0byBEaXJ0eSBhZnRlciBkaXNjYXJkLCBmb3IgcHJvcGVyIHB0cmFjZSgp
IGhhbmRsaW5nCiAgKEFuZHkpCgp2MS0+djI6CiAgUHJvcGVyIHJlZ2lzdGVyIHJlc3RvcmUgZm9y
IGluaXRpYWwgc3RhdGUgKEFuZHkpCiAgU2V0IHJlZ2lzdGVycyB0byAxcywgYW5kIG5vdCAwcyAo
RGFyaXVzKQoKLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIHwgMzQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAg
ICAgIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlY3Rvci5oCmluZGV4IDA0YzBiMDdiZjZjZC4uM2Q3ODkzMGNhYjUxIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdmVjdG9yLmgKQEAgLTMzLDYgKzMzLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3Jp
c2N2X3ZfdnN0YXRlX2NsZWFuKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCXJlZ3MtPnN0YXR1cyA9
IChyZWdzLT5zdGF0dXMgJiB+U1JfVlMpIHwgU1JfVlNfQ0xFQU47CiB9CiAKK3N0YXRpYyBpbmxp
bmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX2RpcnR5KHN0cnVjdCBwdF9yZWdzICpyZWdzKQorewor
CXJlZ3MtPnN0YXR1cyA9IChyZWdzLT5zdGF0dXMgJiB+U1JfVlMpIHwgU1JfVlNfRElSVFk7Cit9
CisKIHN0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9vZmYoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpCiB7CiAJcmVncy0+c3RhdHVzID0gKHJlZ3MtPnN0YXR1cyAmIH5TUl9WUykgfCBTUl9W
U19PRkY7CkBAIC0xMjgsNiArMTMzLDM0IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3Zf
dnN0YXRlX3Jlc3RvcmUoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnJlc3RvcmVfCiAJcmlz
Y3Zfdl9kaXNhYmxlKCk7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRl
X2Rpc2NhcmQodm9pZCkKK3sKKwl1bnNpZ25lZCBsb25nIHZsLCB2dHlwZV9pbnZhbCA9IDFVTCA8
PCAoQklUU19QRVJfTE9ORyAtIDEpOworCisJcmlzY3Zfdl9lbmFibGUoKTsKKwlhc20gdm9sYXRp
bGUgKAorCQkiLm9wdGlvbiBwdXNoXG5cdCIKKwkJIi5vcHRpb24gYXJjaCwgK3Zcblx0IgorCQki
dnNldHZsaQklMCwgeDAsIGU4LCBtOCwgdGEsIG1hXG5cdCIKKwkJInZtdi52LmkJdjAsIC0xXG5c
dCIKKwkJInZtdi52LmkJdjgsIC0xXG5cdCIKKwkJInZtdi52LmkJdjE2LCAtMVxuXHQiCisJCSJ2
bXYudi5pCXYyNCwgLTFcblx0IgorCQkidnNldHZsCQklMCwgeDAsICUxXG5cdCIKKwkJIi5vcHRp
b24gcG9wXG5cdCIKKwkJOiAiPSZyIiAodmwpIDogInIiICh2dHlwZV9pbnZhbCkgOiAibWVtb3J5
Iik7CisJcmlzY3Zfdl9kaXNhYmxlKCk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl92
X3ZzdGF0ZV9kaXNjYXJkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCWlmICgocmVncy0+c3Rh
dHVzICYgU1JfVlMpID09IFNSX1ZTX09GRikKKwkJcmV0dXJuOworCisJX19yaXNjdl92X3ZzdGF0
ZV9kaXNjYXJkKCk7CisJX19yaXNjdl92X3ZzdGF0ZV9kaXJ0eShyZWdzKTsKK30KKwogc3RhdGlj
IGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX3NhdmUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNr
LAogCQkJCSAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncykKIHsKQEAgLTE3Myw2ICsyMDYsNyBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3Zfdl9maXJzdF91c2VfaGFuZGxlcihzdHJ1Y3QgcHRf
cmVncyAqcmVncykgeyByZXR1cm4gZmFscwogc3RhdGljIGlubGluZSBib29sIHJpc2N2X3ZfdnN0
YXRlX3F1ZXJ5KHN0cnVjdCBwdF9yZWdzICpyZWdzKSB7IHJldHVybiBmYWxzZTsgfQogc3RhdGlj
IGlubGluZSBib29sIHJpc2N2X3ZfdnN0YXRlX2N0cmxfdXNlcl9hbGxvd2VkKHZvaWQpIHsgcmV0
dXJuIGZhbHNlOyB9CiAjZGVmaW5lIHJpc2N2X3ZfdnNpemUgKDApCisjZGVmaW5lIHJpc2N2X3Zf
dnN0YXRlX2Rpc2NhcmQocmVncykJCWRvIHt9IHdoaWxlICgwKQogI2RlZmluZSByaXNjdl92X3Zz
dGF0ZV9zYXZlKHRhc2ssIHJlZ3MpCQlkbyB7fSB3aGlsZSAoMCkKICNkZWZpbmUgcmlzY3Zfdl92
c3RhdGVfcmVzdG9yZSh0YXNrLCByZWdzKQlkbyB7fSB3aGlsZSAoMCkKICNkZWZpbmUgX19zd2l0
Y2hfdG9fdmVjdG9yKF9fcHJldiwgX19uZXh0KQlkbyB7fSB3aGlsZSAoMCkKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmlu
ZGV4IDUxNTg5NjFlYTk3Ny4uNWZmNjNhNzg0YTZkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTI5Niw2ICsy
OTYsOCBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBf
ZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAkJcmVncy0+ZXBjICs9IDQ7CiAJCXJlZ3Mt
Pm9yaWdfYTAgPSByZWdzLT5hMDsKIAorCQlyaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpOwor
CiAJCXN5c2NhbGwgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwp
OwogCiAJCWlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCgpiYXNlLWNvbW1pdDogNDg4ODMzY2Nk
Y2FjMTE4ZGExNjcwMWY0ZWUwNjczYjIwYmE0N2ZlMwotLSAKMi4zOS4yCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
