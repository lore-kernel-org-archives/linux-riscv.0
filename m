Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA31E7718F
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcB9Zt3SpLm+yRnhl4VpiLNrbHvm4jYkhYCvb8/RDjs=; b=SdSxNZvhfc5fRj
	g95GaDnf+RA4nRp6vvAT9ijFQoeLE1uc7s2btJ6+7X3RZjbvR1TYbyzQn/UMBmBtMiLtrQ1RQmo7d
	WcOoPRi+SlAnYfBF2s3eoDqzM++b83X66HWlxVD16tRHwDMYLt7PpaGVZjRN4RhJsezds2TajGfAj
	J6C/sCaiiuo821buDKmK2wKp9P5az/3cwVVTXGOYuabO2xUFq9ri8dzBRGARy8kPzGrQffYjBl9U0
	3z7wC5B4oOAsgk/DHdvDcg9vW0gv6VGgHLuXtxDY8HFxoOzKAdkC9yG2P5SX4Y9rBGsbm5wWI4njC
	aphDrkRITNOf6hJ9E+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ij-000000074mr-1pPF;
	Sat, 21 Dec 2024 14:44:45 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP0ie-000000074it-3bTe
	for linux-riscv@lists.infradead.org;
	Sat, 21 Dec 2024 14:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792273;
	bh=Hm4oTXMI/JqCrQxZ82g7s2Sg91ri2J6sCyZLkfUdK78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dKEk9Z+QAHT8Hz68ebE73fh6OP1VsVSkZoMG9gFyUGKaoPwqHGvyYVwZZdefJXjvF
	 FZCvx9Oe7hdaYT2k7v8hx9KpxCwBYt3j8h6P5xE9u10gQxU0fnHgAs1lWdrcSCsl3n
	 pXYWNE/pfN0RpeuJv1jMA/yHSL4jWWUi4DyFf2qA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:44:33 +0100
Subject: [PATCH 6/6] selftests/nolibc: add configurations for riscv32
MIME-Version: 1.0
Message-Id: <20241221-nolibc-rv32-v1-6-d9ef6dab7c63@weissschuh.net>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
In-Reply-To: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Zhangjin Wu <falcon@tinylab.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792271; l=3163;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Hm4oTXMI/JqCrQxZ82g7s2Sg91ri2J6sCyZLkfUdK78=;
 b=zwMCx/hbd+g6QvU5d3rTtD17U0JfAipHmn2dW/Jh+MHAqJ81F/tmth+3uyXgH+ojln3qSklsH
 M2bPfLGMhuxCpe4P9CWTCQ+Nz6+QzUNYQ+ZsMGl5em7AAPtW1OEcpP9
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_064441_053333_C769DBE5 
X-CRM114-Status: UNSURE (   7.33  )
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

bm9saWJjIGFscmVhZHkgc3VwcG9ydHMgcmlzY3YzMi4gV2lyZSBpdCB1cCBpbiB0aGUgdGVzdHN1
aXRlLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgu
bmV0PgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZSAgICAgfCA1
ICsrKysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvcnVuLXRlc3RzLnNoIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUKaW5kZXggNzhmNDdlODViMzg5YWMyMjlh
YzEzZjNlN2M4Mjk5ZmIzZWM5MjE5Ny4uN2QxNGE3YzBjYjYyNjA4ZjMyOGIyNTE0OTUyNjQ1MTdk
MzMzZGIyZSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2Vm
aWxlCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQpAQCAtNTIs
NiArNTIsNyBAQCBBUkNIX3BwYzY0ICAgICAgID0gcG93ZXJwYwogQVJDSF9wcGM2NGxlICAgICA9
IHBvd2VycGMKIEFSQ0hfbWlwczMybGUgICAgPSBtaXBzCiBBUkNIX21pcHMzMmJlICAgID0gbWlw
cworQVJDSF9yaXNjdjMyICAgICA9IHJpc2N2CiBBUkNIX3Jpc2N2NjQgICAgID0gcmlzY3YKIEFS
Q0ggICAgICAgICAgICA6PSAkKG9yICQoQVJDSF8kKFhBUkNIKSksJChYQVJDSCkpCiAKQEAgLTY3
LDYgKzY4LDcgQEAgSU1BR0VfcHBjICAgICAgICA9IHZtbGludXgKIElNQUdFX3BwYzY0ICAgICAg
PSB2bWxpbnV4CiBJTUFHRV9wcGM2NGxlICAgID0gYXJjaC9wb3dlcnBjL2Jvb3QvekltYWdlCiBJ
TUFHRV9yaXNjdiAgICAgID0gYXJjaC9yaXNjdi9ib290L0ltYWdlCitJTUFHRV9yaXNjdjMyICAg
ID0gYXJjaC9yaXNjdi9ib290L0ltYWdlCiBJTUFHRV9yaXNjdjY0ICAgID0gYXJjaC9yaXNjdi9i
b290L0ltYWdlCiBJTUFHRV9zMzkwICAgICAgID0gYXJjaC9zMzkwL2Jvb3QvYnpJbWFnZQogSU1B
R0VfbG9vbmdhcmNoICA9IGFyY2gvbG9vbmdhcmNoL2Jvb3Qvdm1saW51ei5lZmkKQEAgLTg1LDYg
Kzg3LDcgQEAgREVGQ09ORklHX3BwYyAgICAgICAgPSBwbWFjMzJfZGVmY29uZmlnCiBERUZDT05G
SUdfcHBjNjQgICAgICA9IHBvd2VybnZfYmVfZGVmY29uZmlnCiBERUZDT05GSUdfcHBjNjRsZSAg
ICA9IHBvd2VybnZfZGVmY29uZmlnCiBERUZDT05GSUdfcmlzY3YgICAgICA9IGRlZmNvbmZpZwor
REVGQ09ORklHX3Jpc2N2MzIgICAgPSBydjMyX2RlZmNvbmZpZwogREVGQ09ORklHX3Jpc2N2NjQg
ICAgPSBkZWZjb25maWcKIERFRkNPTkZJR19zMzkwICAgICAgID0gZGVmY29uZmlnCiBERUZDT05G
SUdfbG9vbmdhcmNoICA9IGRlZmNvbmZpZwpAQCAtMTA4LDYgKzExMSw3IEBAIFFFTVVfQVJDSF9w
cGMgICAgICAgID0gcHBjCiBRRU1VX0FSQ0hfcHBjNjQgICAgICA9IHBwYzY0CiBRRU1VX0FSQ0hf
cHBjNjRsZSAgICA9IHBwYzY0CiBRRU1VX0FSQ0hfcmlzY3YgICAgICA9IHJpc2N2NjQKK1FFTVVf
QVJDSF9yaXNjdjMyICAgID0gcmlzY3YzMgogUUVNVV9BUkNIX3Jpc2N2NjQgICAgPSByaXNjdjY0
CiBRRU1VX0FSQ0hfczM5MCAgICAgICA9IHMzOTB4CiBRRU1VX0FSQ0hfbG9vbmdhcmNoICA9IGxv
b25nYXJjaDY0CkBAIC0xMzUsNiArMTM5LDcgQEAgUUVNVV9BUkdTX3BwYyAgICAgICAgPSAtTSBn
M2JlaWdlIC1hcHBlbmQgImNvbnNvbGU9dHR5UzAgcGFuaWM9LTEgJChURVNUOiU9Tk9MSUIKIFFF
TVVfQVJHU19wcGM2NCAgICAgID0gLU0gcG93ZXJudiAtYXBwZW5kICJjb25zb2xlPWh2YzAgcGFu
aWM9LTEgJChURVNUOiU9Tk9MSUJDX1RFU1Q9JSkiCiBRRU1VX0FSR1NfcHBjNjRsZSAgICA9IC1N
IHBvd2VybnYgLWFwcGVuZCAiY29uc29sZT1odmMwIHBhbmljPS0xICQoVEVTVDolPU5PTElCQ19U
RVNUPSUpIgogUUVNVV9BUkdTX3Jpc2N2ICAgICAgPSAtTSB2aXJ0IC1hcHBlbmQgImNvbnNvbGU9
dHR5UzAgcGFuaWM9LTEgJChURVNUOiU9Tk9MSUJDX1RFU1Q9JSkiCitRRU1VX0FSR1NfcmlzY3Yz
MiAgICA9IC1NIHZpcnQgLWFwcGVuZCAiY29uc29sZT10dHlTMCBwYW5pYz0tMSAkKFRFU1Q6JT1O
T0xJQkNfVEVTVD0lKSIKIFFFTVVfQVJHU19yaXNjdjY0ICAgID0gLU0gdmlydCAtYXBwZW5kICJj
b25zb2xlPXR0eVMwIHBhbmljPS0xICQoVEVTVDolPU5PTElCQ19URVNUPSUpIgogUUVNVV9BUkdT
X3MzOTAgICAgICAgPSAtTSBzMzkwLWNjdy12aXJ0aW8gLWFwcGVuZCAiY29uc29sZT10dHlTMCBw
YW5pYz0tMSAkKFRFU1Q6JT1OT0xJQkNfVEVTVD0lKSIKIFFFTVVfQVJHU19sb29uZ2FyY2ggID0g
LU0gdmlydCAtYXBwZW5kICJjb25zb2xlPXR0eVMwLDExNTIwMCBwYW5pYz0tMSAkKFRFU1Q6JT1O
T0xJQkNfVEVTVD0lKSIKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGli
Yy9ydW4tdGVzdHMuc2ggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvcnVuLXRlc3Rz
LnNoCmluZGV4IGNhYTFhZTQwZmU5YTJmYWY4OTMxYzI5OWFhY2QxOTcxNjIyN2UyYjguLjY3ZmVm
Yzg0N2Q3NzE2NWY4MTdjM2JlZmE1NzhjZmEyN2U2ZjkzZDggMTAwNzU1Ci0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ydW4tdGVzdHMuc2gKKysrIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbm9saWJjL3J1bi10ZXN0cy5zaApAQCAtMTcsNyArMTcsNyBAQCBwZXJmb3JtX2Rv
d25sb2FkPTAKIHRlc3RfbW9kZT1zeXN0ZW0KIHdlcnJvcj0xCiBsbHZtPQotYXJjaHM9ImkzODYg
eDg2XzY0IGFybTY0IGFybSBtaXBzMzJsZSBtaXBzMzJiZSBwcGMgcHBjNjQgcHBjNjRsZSByaXNj
djY0IHMzOTAgbG9vbmdhcmNoIgorYXJjaHM9ImkzODYgeDg2XzY0IGFybTY0IGFybSBtaXBzMzJs
ZSBtaXBzMzJiZSBwcGMgcHBjNjQgcHBjNjRsZSByaXNjdjMyIHJpc2N2NjQgczM5MCBsb29uZ2Fy
Y2giCiAKIFRFTVA9JChnZXRvcHQgLW8gJ2o6ZDpjOmI6YTptOnBlbGgnIC1uICIkMCIgLS0gIiRA
IikKIAoKLS0gCjIuNDcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
