Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9DEC83F21
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xyan7U+4U00/aD15rXKX3rrz7mxOLgB5SFJq1G6O804=; b=3pyfAqDE//4Udq
	3OdBAwlfijzHxFYra+kM4vLyO4FjykchjCa24T+Qp+o/fo99RSzIaq3NZkI2RZ7h1+rHZ9hRI5oyv
	trgy9xKqEcD/Ji8aDXIsKO5Cay2QhexGzwcHve75dGk+C+4GUyPJR1rwVXFq6ulAEQ72zktJqxNFO
	1fRLlwSc3qEgKB5Tf4HAW1KqbZLEm3TyZOe9AMM5EkKZEXFFA1zTwe2e6bh/sEg2xWAdr8ot+o5/b
	KXNYUiKn6QDGRTo0DF6r0oIRcIoe8rq6leobriKCloV4g51swmfntAOcbuhgFExRyE7TINXs7LhBp
	kAoJndbQ+Gef/ogTz3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE06-0000000EvLt-2VsD;
	Fri, 11 Jul 2025 13:41:18 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDqF-0000000Et3Q-3mkH
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 13:31:10 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 56BDURRR013775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Jul 2025 21:30:27 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 11 Jul 2025
 21:30:27 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>, Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v2 0/9] add Voyager board support
Date: Fri, 11 Jul 2025 21:30:16 +0800
Message-ID: <20250711133025.2192404-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 56BDURRR013775
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_063108_462419_8C09D96B 
X-CRM114-Status: GOOD (  12.19  )
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

VGhlIFZveWFnZXIgaXMgYSA5LjbigJ0geCA5LjbigJ0gTWljcm8gQVRYIGZvcm0gZmFjdG9yIGRl
dmVsb3BtZW50IGJvYXJkCmluY2x1ZGluZyBBbmRlcyBRaUxhaSBTb0MuIFRoaXMgcGF0Y2ggc2Vy
aWVzIGFkZHMgbWluaW1hbCBkZXZpY2UgdHJlZQpmaWxlcyBmb3IgdGhlIFFpTGFpIFNvQyBhbmQg
dGhlIFZveWFnZXIgYm9hcmQgWzFdLgoKTm93IG9ubHkgc3VwcG9ydCBiYXNpYyB1YXJ0IGRyaXZl
cnMgdG8gYm9vdCB1cCBpbnRvIGEgYmFzaWMgY29uc29sZS4gT3RoZXIKZmVhdHVyZXMgd2lsbCBi
ZSBhZGRlZCBsYXRlci4KClsxXSBodHRwczovL3d3dy5hbmRlc3RlY2guY29tL2VuL3Byb2R1Y3Rz
LXNvbHV0aW9ucy9hbmRlc2hhcGUtcGxhdGZvcm1zL3FpbGFpLWNoaXAvClsyXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNTA2MDIwNjA3NDcuNjg5ODI0LTEtYmVuNzE3QGFuZGVzdGVj
aC5jb20vCi0tLQpDaGFuZ2VzIHNpbmNlIHYxOgoqIFBhdGNoIDEKICAtIERlc2VsZWN0IHR3byBj
b25maWdzIGZvciBBUkNIX0FOREVTIHNpbmNlIFFpTGFpIFNvQyBkb2VzIG5vdCBuZWVkIHRoZW0g
KFByYWJoYWthcikKICAtIFJldmVydCB0aGUgY2hhbmdlcyBmb3IgY29uZmlnIEVSUkFUQV9BTkRF
U19DTU8KKiBQYXRjaCAzCiAgLSBBZGQgcmV2aWV3ZWQtYnkgUHJhYmhha2FyCiogUGF0Y2ggOSAo
bmV3KQogIC0gR2F0aGVyIGFsbCB0aGUgY2hhbmdlcyBmb3IgTUFJTlRBSU5FUlMgaW4gYSBzaW5n
bGUgcGF0Y2ggKEFybmQpCgpMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNTA3MDQwODE0NTEuMjAxMTQwNy0xLWJlbjcxN0BhbmRlc3RlY2guY29tLwotLS0KQmVuIFpv
bmctWW91IFhpZSAoOSk6CiAgcmlzY3Y6IGFkZCBBbmRlcyBTb0MgZmFtaWx5IEtjb25maWcgc3Vw
cG9ydAogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIEFuZGVzIFFpTGFpIFNvQyBhbmQgdGhlIFZv
eWFnZXIgYm9hcmQgYmluZGluZ3MKICBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6
IGFkZCBBbmRlcyBRaUxhaSBQTElDCiAgZHQtYmluZGluZ3M6IGludGVycnVwdC1jb250cm9sbGVy
OiBhZGQgQW5kZXMgbWFjaGluZS1sZXZlbCBzb2Z0d2FyZQogICAgaW50ZXJydXB0IGNvbnRyb2xs
ZXIKICBkdC1iaW5kaW5nczogdGltZXI6IGFkZCBBbmRlcyBtYWNoaW5lIHRpbWVyCiAgcmlzY3Y6
IGR0czogYW5kZXM6IGFkZCBRaUxhaSBTb0MgZGV2aWNlIHRyZWUKICByaXNjdjogZHRzOiBhbmRl
czogYWRkIFZveWFnZXIgYm9hcmQgZGV2aWNlIHRyZWUKICByaXNjdjogZGVmY29uZmlnOiBlbmFi
bGUgQW5kZXMgU29DCiAgTUFJTlRBSU5FUlM6IEFkZCBlbnRyeSBmb3IgQW5kZXMgU29DCgogLi4u
L2FuZGVzdGVjaCxwbGljc3cueWFtbCAgICAgICAgICAgICAgICAgICAgIHwgIDU0ICsrKysrCiAu
Li4vc2lmaXZlLHBsaWMtMS4wLjAueWFtbCAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvYW5kZXMueWFtbCAgICAgIHwgIDI1ICsrKwogLi4u
L2JpbmRpbmdzL3RpbWVyL2FuZGVzdGVjaCxwbG10MC55YW1sICAgICAgIHwgIDUzICsrKysrCiBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKwogYXJj
aC9yaXNjdi9LY29uZmlnLnNvY3MgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsKIGFyY2gv
cmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL2FuZGVzL01ha2VmaWxlICAgICAgICAgICAgfCAgIDIgKwogYXJjaC9yaXNj
di9ib290L2R0cy9hbmRlcy9xaWxhaS12b3lhZ2VyLmR0cyAgIHwgIDI4ICsrKwogYXJjaC9yaXNj
di9ib290L2R0cy9hbmRlcy9xaWxhaS5kdHNpICAgICAgICAgIHwgMTg2ICsrKysrKysrKysrKysr
KysrKwogYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAx
ICsKIDExIGZpbGVzIGNoYW5nZWQsIDM2NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVy
L2FuZGVzdGVjaCxwbGljc3cueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9hbmRlcy55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL2FuZGVzdGVjaCxwbG10MC55
YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbmRlcy9NYWtlZmls
ZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5kZXMvcWlsYWktdm95
YWdlci5kdHMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FuZGVzL3Fp
bGFpLmR0c2kKCi0tCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
