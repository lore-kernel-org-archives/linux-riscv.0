Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C7BC83F0B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 09:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ITv6dPsJIdVlZhrcMNXzNzCgjie4eGUydyN0+h7B5E=; b=ZegmEFUKVHhXPT
	LmDXP7L9jYmfk5TCJrcXjfnqvFYCv6bz5To7r+5XlwKYy3KjvitSs8yWjM60P8UnAM4WAwxOTEEuv
	8p+GtiJ7CzpA0+TstWD7ONgjZ2g7Wa76MLGjk2ncRkipYRi0ESgtXpIMZZraKIIXeVlQOniGKVuxY
	X9jOlS4K+QBJepU8qo4vaqsPRAF131byjHJjVXu+8s3SEHXjbWEhHkZ5t8/MGJyoIE6eRwhYvi6vm
	3KrA6lgfZd+Z+8uv33qDnIxYro/SWX7vFpYwWPonoLjhSKC5v9NjG4Rih7tetqUzmmFrI6jmyYtqz
	CI9t3tSGnzKzA299DhVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcI9-0000000DqhZ-3fhU;
	Fri, 04 Jul 2025 09:01:09 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbaQ-0000000Dh14-2Okl
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 08:16:01 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5648EsjV091875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Jul 2025 16:14:54 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 4 Jul 2025
 16:14:54 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>, Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH 0/8] add Voyager board support
Date: Fri, 4 Jul 2025 16:14:43 +0800
Message-ID: <20250704081451.2011407-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5648EsjV091875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_011559_124614_4EBDD04B 
X-CRM114-Status: GOOD (  12.67  )
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
ZSBhZGRlZCBsYXRlci4KClRoZSBvcmlnaW5hbCBwYXRjaHNldCBbMl0gaGFzIGJlZW4gcmV2aWV3
ZWQgcG9zaXRpdmVseSBpbiByZWxldmFudCBtYWlsaW5nCmxpc3RzLiBUaHVzLCBzZW5kIGEgbmV3
IHBhdGNoc2V0IHRvIHNvY0BsaXN0cy5saW51eC5kZXYgLgoKQWxzbywgdGhlcmUgaXMgYSBwYXRj
aCBkZXBlbmRlbmN5IGluIHRoaXMgcGF0Y2hzZXQ6ClBhdGNoIDIgPC0gUGF0Y2ggNCA8LSBQYXRj
aCA1IDwtIFBhdGNoIDYKClsxXSBodHRwczovL3d3dy5hbmRlc3RlY2guY29tL2VuL3Byb2R1Y3Rz
LXNvbHV0aW9ucy9hbmRlc2hhcGUtcGxhdGZvcm1zL3FpbGFpLWNoaXAvClsyXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNTA2MDIwNjA3NDcuNjg5ODI0LTEtYmVuNzE3QGFuZGVzdGVj
aC5jb20vCgpCZW4gWm9uZy1Zb3UgWGllICg4KToKICByaXNjdjogYWRkIEFuZGVzIFNvQyBmYW1p
bHkgS2NvbmZpZyBzdXBwb3J0CiAgZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgQW5kZXMgUWlMYWkg
U29DIGFuZCB0aGUgVm95YWdlciBib2FyZCBiaW5kaW5ncwogIGR0LWJpbmRpbmdzOiBpbnRlcnJ1
cHQtY29udHJvbGxlcjogYWRkIEFuZGVzIFFpTGFpIFBMSUMKICBkdC1iaW5kaW5nczogaW50ZXJy
dXB0LWNvbnRyb2xsZXI6IGFkZCBBbmRlcyBtYWNoaW5lLWxldmVsIHNvZnR3YXJlCiAgICBpbnRl
cnJ1cHQgY29udHJvbGxlcgogIGR0LWJpbmRpbmdzOiB0aW1lcjogYWRkIEFuZGVzIG1hY2hpbmUg
dGltZXIKICByaXNjdjogZHRzOiBhbmRlczogYWRkIFFpTGFpIFNvQyBkZXZpY2UgdHJlZQogIHJp
c2N2OiBkdHM6IGFuZGVzOiBhZGQgVm95YWdlciBib2FyZCBkZXZpY2UgdHJlZQogIHJpc2N2OiBk
ZWZjb25maWc6IGVuYWJsZSBBbmRlcyBTb0MKCiAuLi4vYW5kZXN0ZWNoLHBsaWNzdy55YW1sICAg
ICAgICAgICAgICAgICAgICAgfCAgNTQgKysrKysKIC4uLi9zaWZpdmUscGxpYy0xLjAuMC55YW1s
ICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9hbmRlcy55YW1sICAgICAgfCAgMjUgKysrCiAuLi4vYmluZGluZ3MvdGltZXIvYW5kZXN0ZWNo
LHBsbXQwLnlhbWwgICAgICAgfCAgNTMgKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBhcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhICAg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gvcmlzY3YvS2NvbmZpZy5zb2NzICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgOSArCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9ib290L2R0cy9hbmRlcy9NYWtlZmls
ZSAgICAgICAgICAgIHwgICAyICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5kZXMvcWlsYWktdm95
YWdlci5kdHMgICB8ICAyOCArKysKIGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5kZXMvcWlsYWkuZHRz
aSAgICAgICAgICB8IDE4NiArKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvY29uZmlncy9k
ZWZjb25maWcgICAgICAgICAgICAgICAgICB8ICAgMSArCiAxMiBmaWxlcyBjaGFuZ2VkLCAzNzAg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hbmRlc3RlY2gs
cGxpY3N3LnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvYW5kZXMueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9hbmRlc3RlY2gscGxtdDAueWFtbAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5kZXMvTWFrZWZpbGUKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FuZGVzL3FpbGFpLXZveWFnZXIuZHRzCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbmRlcy9xaWxhaS5kdHNpCgot
LQoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
