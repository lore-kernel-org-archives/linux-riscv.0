Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A51C3ABB6
	for <linux-riscv@archiver.kernel.org>; Sat,  3 May 2025 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IgTSVaFDZnp2aI82/g2iOK3GdhgtSI7yjEMYUjWZDQs=; b=Uf6MffD9QJ7NRK
	qreQk2UpumT5ivZ1oNsdKPfG7HU5b1y0ogejWnI4Qintcg0nLFvoZjH1jBnqGIwODrcq4hK+LYWWC
	jc/S6aYebbjbYPo772AhmXSS71Fa4/GH8nuTgqXnJq2NGrRu8YrNIDUeyed8H4m3IgBzhC09H0I3q
	Ds4V+Gimmcv2gA+wDQD+jVqpAN56w9FwhRLQWcaFoVekIvKxPMQ4mKqjHluNYTFYoNHrhZc/941Yw
	Sh4qTVOMX/QePWPXC7nX4UQnjIO/IYQ/xGcHvc7QVHu9eYaOnynigxMq28lL3Sk6JLAxLty/8C+Wo
	sJo0PGcdNou0zBL7WXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEeW-0000000419W-2v8W;
	Sat, 03 May 2025 15:19:44 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBEeP-0000000415W-0yW3
	for linux-riscv@lists.infradead.org;
	Sat, 03 May 2025 15:19:41 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 543FIWkb087511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 23:18:32 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Sat, 3 May 2025
 23:18:32 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <daniel.lezcano@linaro.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        "Ben
 Zong-You Xie" <ben717@andestech.com>
Subject: [PATCH v2 0/9] add Voyager board support
Date: Sat, 3 May 2025 23:18:20 +0800
Message-ID: <20250503151829.605006-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 543FIWkb087511
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_081937_634869_0ED49885 
X-CRM114-Status: GOOD (  13.00  )
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
LXNvbHV0aW9ucy9hbmRlc2hhcGUtcGxhdGZvcm1zL3FpbGFpLWNoaXAvCi0tLQpDaGFuZ2Vsb2c6
Cgp2MS0+djI6CiAgLSBBZGQgUm9iJ3MgUmV2aWV3ZWQtYnkgdGFnIHRvIHBhdGNoIDIuCiAgLSBB
ZGQgUm9iJ3MgQWNrZWQtYnkgdGFnIHRvIHBhdGNoIDMuCiAgLSBBZGQgZGV0YWlsZWQgZGVzY3Jp
cHRpb25zIHRvIFBMSUNfU1cgYW5kIFBMTVQwLgogIC0gQWRkIFJvYidzIEFja2VkLWJ5IHRhZyB0
byBwYXRjaCA2LgogIC0gTW92ZSB0aGUgYWxpYXNlcyBub2RlIGFuZCBtZW1vcnkgbm9kZSBmcm9t
IHFpbGFpLmR0c2kgdG8gcWlsYWktdm95YWdlci5kdHMuCiAgLSBEcm9wICJzdGF0dXMgPSBva2F5
IiBpbiBlYWNoIENQVSBub2RlIHNpbmNlIHRoZSBzdGF0dXMgcHJvcGVydHkgaXMgYnkKICAgIGRl
ZmF1bHQgIm9rYXkiLgogIC0gUmVvcmRlciB0aGUgbm9kZXMgaW4gcWlsYWkuZHRzaSBieSB1bml0
IGFkZHJlc3MgaW4gYXNjZW5kaW5nIG9yZGVyLgogIC0gQWRkIG15c2VsZiBhcyB0aGUgbWFpbnRh
aW5lciBvZiBBbmRlcydzIFNvQyB0cmVlLgoKdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI1MDQwNzEwNDkzNy4zMTU3ODMtMS1iZW43MTdAYW5kZXN0ZWNoLmNvbS8KLS0tCkJlbiBa
b25nLVlvdSBYaWUgKDkpOgogIHJpc2N2OiBhZGQgQW5kZXMgU29DIGZhbWlseSBLY29uZmlnIHN1
cHBvcnQKICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBBbmRlcyBRaUxhaSBTb0MgYW5kIHRoZSBW
b3lhZ2VyIGJvYXJkIGJpbmRpbmdzCiAgZHQtYmluZGluZ3M6IGludGVycnVwdC1jb250cm9sbGVy
OiBhZGQgQW5kZXMgUWlMYWkgUExJQwogIGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxl
cjogYWRkIEFuZGVzIG1hY2hpbmUtbGV2ZWwgc29mdHdhcmUKICAgIGludGVycnVwdCBjb250cm9s
bGVyCiAgZHQtYmluZGluZ3M6IHRpbWVyOiBhZGQgQW5kZXMgbWFjaGluZSB0aW1lcgogIGR0LWJp
bmRpbmdzOiBjYWNoZTogYXg0NW1wLWNhY2hlOiBhbGxvdyB2YXJpYWJsZSBjYWNoZS1zZXRzIGZv
ciBBbmRlcwogICAgTDIgY2FjaGUKICByaXNjdjogZHRzOiBhbmRlczogYWRkIFFpTGFpIFNvQyBk
ZXZpY2UgdHJlZQogIHJpc2N2OiBkdHM6IGFuZGVzOiBhZGQgVm95YWdlciBib2FyZCBkZXZpY2Ug
dHJlZQogIHJpc2N2OiBkZWZjb25maWc6IGVuYWJsZSBBbmRlcyBTb0MKCiAuLi4vY2FjaGUvYW5k
ZXN0ZWNoLGF4NDVtcC1jYWNoZS55YW1sICAgICAgICAgfCAgIDIgKy0KIC4uLi9hbmRlc3RlY2gs
cGxpY3N3LnlhbWwgICAgICAgICAgICAgICAgICAgICB8ICA1NCArKysrKwogLi4uL3NpZml2ZSxw
bGljLTEuMC4wLnlhbWwgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2FuZGVzLnlhbWwgICAgICB8ICAyNSArKysKIC4uLi9iaW5kaW5ncy90
aW1lci9hbmRlc3RlY2gscGxtdDAueWFtbCAgICAgICB8ICA1MyArKysrKwogTUFJTlRBSU5FUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsKIGFyY2gvcmlzY3YvS2Nv
bmZpZy5lcnJhdGEgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogYXJjaC9yaXNjdi9LY29u
ZmlnLnNvY3MgICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsKIGFyY2gvcmlzY3YvYm9vdC9k
dHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L2FuZGVzL01ha2VmaWxlICAgICAgICAgICAgfCAgIDIgKwogYXJjaC9yaXNjdi9ib290L2R0cy9h
bmRlcy9xaWxhaS12b3lhZ2VyLmR0cyAgIHwgIDI4ICsrKwogYXJjaC9yaXNjdi9ib290L2R0cy9h
bmRlcy9xaWxhaS5kdHNpICAgICAgICAgIHwgMTg2ICsrKysrKysrKysrKysrKysrKwogYXJjaC9y
aXNjdi9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAxICsKIDEzIGZpbGVz
IGNoYW5nZWQsIDM3MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9hbmRlc3RlY2gscGxpY3N3LnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvYW5kZXMueWFtbAogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9hbmRlc3RlY2gscGxt
dDAueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5kZXMvTWFr
ZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FuZGVzL3FpbGFp
LXZveWFnZXIuZHRzCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbmRl
cy9xaWxhaS5kdHNpCgotLQoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
