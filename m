Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14365C04A6A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OKyCnuTjB1vnVPqPb1VjaGZaByG5ICMJeAl0ur3+xbE=; b=2nZNmU9IWQDDhR
	oKVQLBZxSuvRCtkHROKiRjwsacojh/J/vncGj35ZIOsZAO4WegYwLFst1227O3YL7vifyHJB+T+4z
	mspLapnGNDWIBCJHHJ4gRB05fMWTRRBZsP9kLeWNBuorppFzxmZtgRBzn7GJWzE7mWRi3dKbRMUog
	+aqzM/w+FFTfsrSoDaPXl8EhMbhXYDGNabrcTtDyiTfln4lng0XxItdNTIfc8VaXXlQ6hBq5PoULR
	3W8lWqBDJlHPf72+COZZAPFKasMB+6u5VxmjB3uPXeSzsf9c8gion+D+CMhTR+/02rEScQi35Q4kt
	7ItIbUfc//h7JcEDgfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSufk-00GMqG-0L;
	Mon, 07 Aug 2023 07:29:00 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSufh-00GMpu-1b
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 07:28:58 +0000
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qSufg-0001Ph-7T
	for linux-riscv@lists.infradead.org; Mon, 07 Aug 2023 09:28:56 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 9FFE82058B8
	for <linux-riscv@lists.infradead.org>; Mon,  7 Aug 2023 07:28:55 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id A5F8A2058B0;
	Mon,  7 Aug 2023 07:28:53 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 3d094674;
	Mon, 7 Aug 2023 07:28:53 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Mon, 07 Aug 2023 09:28:50 +0200
Subject: [PATCH] Revert "riscv: dts: allwinner: d1: Add CAN controller
 nodes"
MIME-Version: 1.0
Message-Id: <20230807-riscv-allwinner-d1-revert-can-controller-nodes-v1-1-eb3f70b435d9@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIADGd0GQC/x2NSwrDMAwFrxK0rsB2U/dzldCFsZVWYOQihbQQc
 veYLofHvNnASJkMHsMGSisbN+ngTwPkd5IXIZfOEFw4u5u7orLlFVOtXxYhxeKxe6QL5iSYmyz
 aau2DtEKG8TLHQG6M/p6hn36UZv79g9Nz3w8LpufJgAAAAA==
To: linux-can@vger.kernel.org
Cc: John Watts <contact@jookia.org>, kernel@pengutronix.de, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=vUrCbLfFW1umHcNBDCaMWrYMwAzAml5hh8vVrEIpxqI=;
 b=owEBbQGS/pANAwAKAb5QHEoqigToAcsmYgBk0J0y9XBPOwXg5qAWbtBKng7vWOKNUjlkAjCeI
 vJv36L8zVqJATMEAAEKAB0WIQQOzYG9qPI0qV/1MlC+UBxKKooE6AUCZNCdMgAKCRC+UBxKKooE
 6DjbCACSnMGWq408y1/hhxSc6hvJR74UJgy3cIH9AiaMYbHraNzsdIVLBu00wakHgYc7iMugmbI
 zzCRceBYG/1iRm1Ov7CWzuMdgdRYKMOj+QusBgq9gmoB7ENKdu2HyyYF/knvvz+s0L/lkF3Vz0W
 VAcD+cODbYjigMa0QlhJdI0eaXi9yssJ5mNtEMm0e+yZX8RISUPGddRAoeP56OnAUn0AWK8RA6w
 IFvKhrbXG+UIEPQE0q+l+A2GG5AoTvGsjBnZtwRA0R0BA+Q1UsTOuCY3e8le3SaQjo+Q+xqYAsk
 RaI8TeSg2EmgZI6iH3SBAdSZ0uNYVKubvRGm0jQhVZQ1mElI
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_002857_554187_97DE7F1A 
X-CRM114-Status: UNSURE (   9.06  )
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

SXQgdHVybmVkIG91dCB0aGUgZHRzaSBjaGFuZ2VzIHdlcmUgbm90IHF1aXRlIHJlYWR5LCByZXZl
cnQgdGhlbSBmb3IKbm93LgoKVGhpcyByZXZlcnRzIGNvbW1pdCA2ZWExYWQ4ODhmNTkwMDk1M2Ey
MTg1M2U3MDlmYTQ5OWZkZmNiMzE3LgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzI2OTA3NjQubXZYVURJOEMwZUBqZXJuZWotbGFwdG9wClN1Z2dlc3RlZC1ieTogSmVybmVqIMWg
a3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IE1hcmMgS2xl
aW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9uaXguZGU+Ci0tLQogYXJjaC9yaXNjdi9ib290L2R0cy9h
bGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSB8IDMwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMzAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKaW5kZXggNDA4NmMwY2MwZjlkLi4x
YmIxZTVjYWU2MDIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1
bnhpLWQxcy10MTEzLmR0c2kKKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3Vu
eGktZDFzLXQxMTMuZHRzaQpAQCAtMTMxLDE4ICsxMzEsNiBAQCB1YXJ0M19wYl9waW5zOiB1YXJ0
My1wYi1waW5zIHsKIAkJCQlwaW5zID0gIlBCNiIsICJQQjciOwogCQkJCWZ1bmN0aW9uID0gInVh
cnQzIjsKIAkJCX07Ci0KLQkJCS9vbWl0LWlmLW5vLXJlZi8KLQkJCWNhbjBfcGluczogY2FuMC1w
aW5zIHsKLQkJCQlwaW5zID0gIlBCMiIsICJQQjMiOwotCQkJCWZ1bmN0aW9uID0gImNhbjAiOwot
CQkJfTsKLQotCQkJL29taXQtaWYtbm8tcmVmLwotCQkJY2FuMV9waW5zOiBjYW4xLXBpbnMgewot
CQkJCXBpbnMgPSAiUEI0IiwgIlBCNSI7Ci0JCQkJZnVuY3Rpb24gPSAiY2FuMSI7Ci0JCQl9Owog
CQl9OwogCiAJCWNjdTogY2xvY2stY29udHJvbGxlckAyMDAxMDAwIHsKQEAgLTg5MSwyMyArODc5
LDUgQEAgcnRjOiBydGNANzA5MDAwMCB7CiAJCQljbG9jay1uYW1lcyA9ICJidXMiLCAiaG9zYyIs
ICJhaGIiOwogCQkJI2Nsb2NrLWNlbGxzID0gPDE+OwogCQl9OwotCi0JCWNhbjA6IGNhbkAyNTA0
MDAwIHsKLQkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjIwaS1kMS1jYW4iOwotCQkJcmVn
ID0gPDB4MDI1MDQwMDAgMHg0MDA+OwotCQkJaW50ZXJydXB0cyA9IDxTT0NfUEVSSVBIRVJBTF9J
UlEoMjEpIElSUV9UWVBFX0xFVkVMX0hJR0g+OwotCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19D
QU4wPjsKLQkJCXJlc2V0cyA9IDwmY2N1IFJTVF9CVVNfQ0FOMD47Ci0JCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwotCQl9OwotCi0JCWNhbjE6IGNhbkAyNTA0NDAwIHsKLQkJCWNvbXBhdGlibGUgPSAi
YWxsd2lubmVyLHN1bjIwaS1kMS1jYW4iOwotCQkJcmVnID0gPDB4MDI1MDQ0MDAgMHg0MDA+Owot
CQkJaW50ZXJydXB0cyA9IDxTT0NfUEVSSVBIRVJBTF9JUlEoMjIpIElSUV9UWVBFX0xFVkVMX0hJ
R0g+OwotCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19DQU4xPjsKLQkJCXJlc2V0cyA9IDwmY2N1
IFJTVF9CVVNfQ0FOMT47Ci0JCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwotCQl9OwogCX07CiB9OwoK
LS0tCmJhc2UtY29tbWl0OiBjMzVlOTI3Y2JlMDlkMzhiMmQ3MjE4M2JiMjE1OTAxMTgzOTI3YzY4
CmNoYW5nZS1pZDogMjAyMzA4MDctcmlzY3YtYWxsd2lubmVyLWQxLXJldmVydC1jYW4tY29udHJv
bGxlci1ub2Rlcy02NWY2MmUwNDYxOWMKCkJlc3QgcmVnYXJkcywKLS0gCk1hcmMgS2xlaW5lLUJ1
ZGRlIDxta2xAcGVuZ3V0cm9uaXguZGU+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
