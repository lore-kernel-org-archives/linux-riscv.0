Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBB9CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 07:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2p0VG8UjTWqVvwsEVbTaU4pWL7DsgHU6MorDUgEJv0=; b=aMb3Ca0h7yWFRy
	S8jhqJt0OwZFZ/JMQ4tvMVrsio0P9NpkGRIBjQgolD3/I6bIjSRrybTqWFQ3TOs9wswjMPAk9VYdR
	aGHY7onuSSJiSybDPAn0jmLV3qHysYsPRwLtgZMlTgRWJmLBpF/tAGYoLWPet27GUg2dApYwg1efQ
	o1webByvDTmXyt30QpB8OKC86OAWgwGaiSCEbhhMm9F0HPomOt2ig/c1pKsSNophTYr3xxYRysy4C
	ONB+o4WcWuCA8GXffxckoBFLQMh4zZ0aiUAoRSE9gV7dSfVRj1v8CGtRPVlMFs3q8dyBtrstQhFon
	lOpiBScwU8eD56tS3d8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpln-00000005Myu-40Y2;
	Thu, 23 Oct 2025 07:29:59 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBplh-00000005Mnq-0EVG
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 07:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761204530;
	bh=joD46nXQLvIHo+j0HgWSZvew9QJQpcw/TMa5i9hHU8o=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=TwwNRbEUx9U2/KkYLCLbtCZW9vXMCHi5OtFYhceAcGkFauLnHymPUGCs80zFL4DaI
	 RQUv3M9P5GJyBK6Rj0YwYVoBW66ao3an028bhUdIDg1WQaCkOYwlnRFLT7ZH5/zDgc
	 q4a1vDrbh2LdBn8RJeoxPt0WIJIG/qcd5ptC41Wc=
X-QQ-mid: esmtpgz11t1761204522tff170d3e
X-QQ-Originating-IP: B/S5rV3PQQenjL7i6qoZ3M1T7tn3dtYmHjmxvlqnzvk=
Received: from = ( [221.4.210.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 15:28:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5281825611618668887
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 23 Oct 2025 15:28:30 +0800
Subject: [PATCH v4 2/2] riscv: dts: spacemit: add MusePi Pro board device
 tree
MIME-Version: 1.0
Message-Id: <20251023-k1-musepi-pro-dts-v4-2-01836303e10f@linux.spacemit.com>
References: <20251023-k1-musepi-pro-dts-v4-0-01836303e10f@linux.spacemit.com>
In-Reply-To: <20251023-k1-musepi-pro-dts-v4-0-01836303e10f@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>, 
 Paul Walmsley <pjw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761204512; l=3829;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Ng7sJU6uriYTf5rZYSyCQyjKItQMSXxOIfj5WN50fKw=;
 b=Aiw1SmBTfBNhi223fRNMnFvCpW5ccu42hxskoJ/AmhWNppC6CFtRZ8W+4PTH+uXzpai3WFagS
 F5w55z1lylfA5u6xmrZuAvQRQP5QrZugPyMHHVontQjsiZZHLPfx+KY
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OL8ICxn8D/E3Vsbvj1NepmAmZ6LCQ6GVfcqUr0XHJQ8vhNptYAt6Un0w
	QyhJ0IAJLQO2EtpvrLM2ZBN5gitBN3Bo8oEwbVfImbfYtFsA6eCy9tCr+LzF81aCMcU47uP
	CPKeOGdV0Q8yaDxScdX4cHR7O/tvXeLFrpz5P3XgR1nCBGw4ZXkoC6bLGUZq8/7YhIPh6MA
	93TGsev9zODfnThr6sfmB0Mbv+P8zr3Csj1v6z3P83E6lFMW53SOptm5N0fX6yEUjbTnZ05
	l0CH9iHvhYtoWGgqOEcVkGTKt7oVVkoyMRD/RCJVXx2sqB5p6HaFpazYu3VJXY8c0blu8wL
	bjbASjdtbdN1IR0lkZxJMsguzgwcZ4GUaLuniq3mQwGKduBagu3jDE2ft0fe2jsr+j0nQpE
	iCBdVdS6Q7ztwwzjZmlCB3NMxiKeUniwr/yJ75rNZ6q2taebVxLTlJSz4lNqeQC2Bvdte1N
	rgZJyedEp7IKUwf0dHt9DcCYFYY3QAL7HW2eMp2URr2WFhdYlpnxdsEkIw2sSZYOdYZQg38
	bZrcpbDOpzsMCwWdlvsmGrwnDz4KbIu1+hSW+Ly3BWs4ohwKnVqI76sDmmUF12jljqQDFie
	10Dno3iq/EtUt1h72TZAl/AHpmN+DsrroO+3DqLeWolzWBchBxI74kXqLo2kE++hWjLy8on
	JOxMvzL/AztQl6gmiTQSpKUx4ayoW/wXDA9teMUP6BNYPu7vVdKOunQQ+ieafoGeTxv9/AL
	bymPS2ZiDVPl6RJdvrvG8bvZXKrOrQmrzERgszXw7ivs2ta8JrftRz+dloI34mLqzGIGCcu
	F6t6P+1Qs+b8KgZRyMzs/LKs57jVYBIGOjRITRlkdIx++t4Kyr4GupuH4Dkk2KK7fA9suuE
	wRkTQu5+bhT9lQhcE5YNMv8863ysT80yczqCYfHkhByV7HmjQZbjEPZLFlmZ67IYYhmrVdc
	80aisqeCuAq2F3CBLjOQN51Xuqqh6w0E5x37Js98UXm997rxFMcdrYJx3O5Wi88ODjViCAe
	2TppDJfphbtZgJTUkiD+sbjjYKCIqLK7U1hvRJ4CJ8IG9ljHnk7lspl0/o9FZ3aRrQIlafU
	G/kPmaNtWZxagVTv8Rwbqy32SFU6qGUIrgJn004cGyu302kf4Zz17SDUK83xbeuZUFU7OPG
	lGrotz0WuR7LlCw=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_002953_553441_B9DD993C 
X-CRM114-Status: GOOD (  12.10  )
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

QWRkIGluaXRpYWwgZGV2aWNlIHRyZWUgc3VwcG9ydCBmb3IgdGhlIE11c2VQaSBQcm8gYm9hcmQg
WzFdLgpUaGUgYm9hcmQgaXMgdXNpbmcgdGhlIFNwYWNlbWlUIEsxL00xIFNvQy4KClRoaXMgZGV2
aWNlIHRyZWUgaXMgYWRhcHRlZCBmcm9tIHRoZSBTcGFjZW1pVCB2ZW5kb3IgdHJlZSBbMl0gYW5k
CmVuYWJsZXMgYmFzaWMgYm9hcmQgZnVuY3Rpb25hbGl0eSwgaW5jbHVkaW5nIFVBUlQgY29uc29s
ZSwgTEVELCBlTU1DLApFdGhlcm5ldCwgYW5kIFBETUEuCgpMaW5rOiBodHRwczovL2RldmVsb3Bl
ci5zcGFjZW1pdC5jb20vZG9jdW1lbnRhdGlvbj90b2tlbj1ZSnRkd252dlZpUFZjbWtvUERwY3Z3
ZlZucmgmdHlwZT1wZGYgWzFdCkxpbms6IGh0dHBzOi8vZ2l0ZWUuY29tL2JpYW5idS1saW51eC9s
aW51eC02LjYvYmxvYi9rMS1ibC12Mi4yLnkvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9r
MS14X01VU0UtUGktUHJvLmR0cyBbMl0KU2lnbmVkLW9mZi1ieTogVHJveSBNaXRjaGVsbCA8dHJv
eS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+Ci0tLQpDaGFuZ2Vsb2cgaW4gdjQ6Ci0gbW9k
aWZ5IGNvbW1pdCBtZXNzYWdlCi0gYWRkIFNwYWNlbWlUIGNvcHlyaWdodAotIExpbmsgdG8gdjM6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAxNy1rMS1tdXNlcGktcHJvLWR0cy12
My0yLTQwYjA1NDkxNjk5ZkBsaW51eC5zcGFjZW1pdC5jb20vCgpDaGFuZ2Vsb2cgaW4gdjM6Ci0g
c29ydCBkdHMgbm9kZQotIGFkZCBldGhlcm5ldCBhbGlhcwotIGFkZCBlbW1jLCBwZG1hLCBhbmQg
ZXRoMCBub2RlIChhIHNxdWFzaCBvZiBwYXRjaGVzIDPigJM1IGZyb20gdjIpCi0gTGluayB0byB2
MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDEwLWsxLW11c2VwaS1wcm8tZHRz
LXYyLTItNmUxYjQ5MWY2ZjNlQGxpbnV4LnNwYWNlbWl0LmNvbS8KCkNoYW5nZWxvZyBpbiB2MjoK
LSBtb2RpZnkgY29tbWl0IG1lc3NhZ2UKLSBzd2FwIHBpbmN0cmwtbmFtZXMgYW5kIHBpbmN0cmwt
MCBwcm9wZXJ0aWVzIGluIHVhcnQwIG5vZGUKLSByZW5hbWUgbW9kZWw6ICJNdXNlUGkgUHJvIiAt
PiAiU3BhY2VtaVQgTXVzZVBpIFBybyIKLSBrZWVwIHRoZSBkdGItJChDT05GSUdfQVJDSF9TUEFD
RU1JVCkgZW50cmllcyBpbiBhbHBoYWJldGljYWwgb3JkZXIKLSBMaW5rIHRvIHYxOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MjgtazEtbXVzZXBpLXByby1kdHMtdjEtMi01ZWZj
Y2EwY2UzYWVAbGludXguc3BhY2VtaXQuY29tLwotLS0KIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvTWFrZWZpbGUgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNl
bWl0L2sxLW11c2VwaS1wcm8uZHRzIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0
L01ha2VmaWxlCmluZGV4IDE1MjgzMjY0NDg3MDYyNGQ4ZmQ3NzY4NGVmMzNhZGRiNDJiMGJhZjMu
Ljk0MmVjYjM4YmVhMDM0ZWY1ZmJmMmNlZjc0ZTY4MmVlMGI2YWQ4ZjQgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvTWFrZWZpbGUKKysrIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9NYWtlZmlsZQpAQCAtMSw0ICsxLDUgQEAKICMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKIGR0Yi0kKENPTkZJR19BUkNIX1NQQUNFTUlUKSArPSBrMS1iYW5h
bmFwaS1mMy5kdGIKIGR0Yi0kKENPTkZJR19BUkNIX1NQQUNFTUlUKSArPSBrMS1taWxrdi1qdXBp
dGVyLmR0YgorZHRiLSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQpICs9IGsxLW11c2VwaS1wcm8uZHRi
CiBkdGItJChDT05GSUdfQVJDSF9TUEFDRU1JVCkgKz0gazEtb3JhbmdlcGktcnYyLmR0YgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1tdXNlcGktcHJvLmR0cyBi
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtbXVzZXBpLXByby5kdHMKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MC4uMjllMzMzYjY3MGNmMGE1YzRlZDg1MjY2ODQ2MGRiNDc1YjljNDRjYgotLS0gL2Rldi9udWxs
CisrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtbXVzZXBpLXByby5kdHMKQEAg
LTAsMCArMSw3OSBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1J
VCkKKy8qCisgKiBDb3B5cmlnaHQgKEMpIDIwMjQgWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5h
bWU+CisgKiBDb3B5cmlnaHQgKEMpIDIwMjUgU3BhY2VtaVQsIEluYworICogQ29weXJpZ2h0IChD
KSAyMDI1IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgor
ICovCisKKy9kdHMtdjEvOworCisjaW5jbHVkZSAiazEuZHRzaSIKKyNpbmNsdWRlICJrMS1waW5j
dHJsLmR0c2kiCisKKy8geworCW1vZGVsID0gIlNwYWNlbWlUIE11c2VQaSBQcm8iOworCWNvbXBh
dGlibGUgPSAic3BhY2VtaXQsbXVzZXBpLXBybyIsICJzcGFjZW1pdCxrMSI7CisKKwlhbGlhc2Vz
IHsKKwkJZXRoZXJuZXQwID0gJmV0aDA7CisJCXNlcmlhbDAgPSAmdWFydDA7CisJfTsKKworCWNo
b3NlbiB7CisJCXN0ZG91dC1wYXRoID0gInNlcmlhbDAiOworCX07CisKKwlsZWRzIHsKKwkJY29t
cGF0aWJsZSA9ICJncGlvLWxlZHMiOworCisJCWxlZDEgeworCQkJbGFiZWwgPSAic3lzLWxlZCI7
CisJCQlncGlvcyA9IDwmZ3BpbyBLMV9HUElPKDk2KSBHUElPX0FDVElWRV9ISUdIPjsKKwkJCWxp
bnV4LGRlZmF1bHQtdHJpZ2dlciA9ICJoZWFydGJlYXQiOworCQkJZGVmYXVsdC1zdGF0ZSA9ICJv
biI7CisJCX07CisJfTsKK307CisKKyZlbW1jIHsKKwlidXMtd2lkdGggPSA8OD47CisJbW1jLWhz
NDAwLTFfOHY7CisJbW1jLWhzNDAwLWVuaGFuY2VkLXN0cm9iZTsKKwlub24tcmVtb3ZhYmxlOwor
CW5vLXNkOworCW5vLXNkaW87CisJc3RhdHVzID0gIm9rYXkiOworfTsKKworJmV0aDAgeworCXBo
eS1oYW5kbGUgPSA8JnJnbWlpMD47CisJcGh5LW1vZGUgPSAicmdtaWktaWQiOworCXBpbmN0cmwt
MCA9IDwmZ21hYzBfY2ZnPjsKKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCXJ4LWludGVy
bmFsLWRlbGF5LXBzID0gPDA+OworCXR4LWludGVybmFsLWRlbGF5LXBzID0gPDA+OworCXN0YXR1
cyA9ICJva2F5IjsKKworCW1kaW8tYnVzIHsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MHgxPjsKKwkJ
I3NpemUtY2VsbHMgPSA8MHgwPjsKKworCQlyZXNldC1ncGlvcyA9IDwmZ3BpbyBLMV9HUElPKDEx
MCkgR1BJT19BQ1RJVkVfTE9XPjsKKwkJcmVzZXQtZGVsYXktdXMgPSA8MTAwMDA+OworCQlyZXNl
dC1wb3N0LWRlbGF5LXVzID0gPDEwMDAwMD47CisKKwkJcmdtaWkwOiBwaHlAMSB7CisJCQlyZWcg
PSA8MHgxPjsKKwkJfTsKKwl9OworfTsKKworJnBkbWEgeworCXN0YXR1cyA9ICJva2F5IjsKK307
CisKKyZ1YXJ0MCB7CisJcGluY3RybC0wID0gPCZ1YXJ0MF8yX2NmZz47CisJcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsKKwlzdGF0dXMgPSAib2theSI7Cit9OwoKLS0gCjIuNTEuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
