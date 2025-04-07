Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C29DC3601A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OSgfYncrNYEHYx2qV4TyDEc+0PBQA2byhKU7Cj0i8F0=; b=uRVGBrluFPzxVC
	rd39lSPDHNhbRAYX3NcWnSGkztx4AiR+l9vKutSaIUfvS40r1TmJBY7pGwL5Nm9/harRUDQvfJ3d7
	qT5JYghP8EAX+Y9xEs+ADMViBiczfuaHGfNKzM6vuJiro0752JB/QBZaDdYd+ha1hUNy8miZtawXh
	+63W8YHtpL1X/QAIaNiSRc4vLlpeeMVny4ULMxYsj57X1LjdLd/NHYneFYbzyWDD9T42SWCQVrPFQ
	HxZLAVrvf9+XCB+c07+r5ML6OqnL+3ejAdMADQC3g8ilK5drmb1xstCF3o1OYXboRxS/R9fEPvGnJ
	KyzbE9wPq67KfiMxww/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1k3q-0000000HQ4x-0AD5;
	Mon, 07 Apr 2025 10:50:38 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1k3k-0000000HQ0m-3Zte
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 10:50:36 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 537AneRr001489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 18:49:40 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 7 Apr 2025
 18:49:40 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <tim609@andestech.com>, "Ben
 Zong-You Xie" <ben717@andestech.com>
Subject: [PATCH 0/9] add Voyager board support
Date: Mon, 7 Apr 2025 18:49:28 +0800
Message-ID: <20250407104937.315783-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 537AneRr001489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_035033_211755_3374AF07 
X-CRM114-Status: GOOD (  11.76  )
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
dmVsb3BtZW50IGJvYXJkIGluY2x1ZGluZwpBbmRlcyBRaUxhaSBTb0MuIFRoaXMgcGF0Y2ggc2Vy
aWVzIGFkZHMgbWluaW1hbCBkZXZpY2UgdHJlZSBmaWxlcyBmb3IgdGhlIFFpTGFpClNvQyBhbmQg
dGhlIFZveWFnZXIgYm9hcmQgWzFdLgoKTm93IG9ubHkgc3VwcG9ydCBiYXNpYyB1YXJ0IGRyaXZl
cnMgdG8gYm9vdCB1cCBpbnRvIGEgYmFzaWMgY29uc29sZS4gT3RoZXIKZmVhdHVyZXMgd2lsbCBi
ZSBhZGRlZCBsYXRlci4KClsxXSBodHRwczovL3d3dy5hbmRlc3RlY2guY29tL2VuL3Byb2R1Y3Rz
LXNvbHV0aW9ucy9hbmRlc2hhcGUtcGxhdGZvcm1zL3FpbGFpLWNoaXAvCgpCZW4gWm9uZy1Zb3Ug
WGllICg5KToKICByaXNjdjogYWRkIEFuZGVzIFNvQyBmYW1pbHkgS2NvbmZpZyBzdXBwb3J0CiAg
ZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgQW5kZXMgUWlMYWkgU29DIGFuZCB0aGUgVm95YWdlciBi
b2FyZCBiaW5kaW5ncwogIGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogYWRkIEFu
ZGVzIFFpTGFpIFBMSUMKICBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IGFkZCBB
bmRlcyBtYWNoaW5lLWxldmVsIHNvZnR3YXJlCiAgICBpbnRlcnJ1cHQgY29udHJvbGxlcgogIGR0
LWJpbmRpbmdzOiB0aW1lcjogYWRkIEFuZGVzIG1hY2hpbmUgdGltZXIKICBkdC1iaW5kaW5nczog
Y2FjaGU6IGF4NDVtcC1jYWNoZTogYWxsb3cgdmFyaWFibGUgY2FjaGUtc2V0cyBmb3IgQW5kZXMK
ICAgIEwyIGNhY2hlCiAgcmlzY3Y6IGR0czogYW5kZXM6IGFkZCBRaUxhaSBTb0MgZGV2aWNlIHRy
ZWUKICByaXNjdjogZHRzOiBhbmRlczogYWRkIFZveWFnZXIgYm9hcmQgZGV2aWNlIHRyZWUKICBy
aXNjdjogZGVmY29uZmlnOiBlbmFibGUgQW5kZXMgU29DCgogLi4uL2NhY2hlL2FuZGVzdGVjaCxh
eDQ1bXAtY2FjaGUueWFtbCAgICAgICAgIHwgICAyICstCiAuLi4vYW5kZXN0ZWNoLHBsaWNzdy55
YW1sICAgICAgICAgICAgICAgICAgICAgfCAgNDggKysrKysKIC4uLi9zaWZpdmUscGxpYy0xLjAu
MC55YW1sICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9hbmRlcy55YW1sICAgICAgfCAgMjUgKysrCiAuLi4vYmluZGluZ3MvdGltZXIvYW5k
ZXN0ZWNoLHBsbXQwLnlhbWwgICAgICAgfCAgNDIgKysrKwogTUFJTlRBSU5FUlMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsKIGFyY2gvcmlzY3YvS2NvbmZpZy5lcnJh
dGEgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogYXJjaC9yaXNjdi9LY29uZmlnLnNvY3Mg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FuZGVzL01h
a2VmaWxlICAgICAgICAgICAgfCAgIDIgKwogYXJjaC9yaXNjdi9ib290L2R0cy9hbmRlcy9xaWxh
aS12b3lhZ2VyLmR0cyAgIHwgIDE5ICsrCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FuZGVzL3FpbGFp
LmR0c2kgICAgICAgICAgfCAxOTQgKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2NvbmZp
Z3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDEgKwogMTMgZmlsZXMgY2hhbmdlZCwg
MzUyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FuZGVz
dGVjaCxwbGljc3cueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9hbmRlcy55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL2FuZGVzdGVjaCxwbG10MC55YW1sCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbmRlcy9NYWtlZmlsZQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5kZXMvcWlsYWktdm95YWdlci5k
dHMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FuZGVzL3FpbGFpLmR0
c2kKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
