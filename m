Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E44C3ABC9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VWsQqZXHDbZYtlnfkkT+FKyn9lM7pCF6aqiw6ICypus=; b=kGkqrKqmbrri0L
	cE0o2LIxFGZQUABdinRi5B0HaoV37T1nRa8iR1OsvuJh84ZCYpWN2unBOsxh/Pb89LKK2I5LK7PHA
	G7wslHqGHwTTmVc+28bnIl5AUpq4XTy+oH2za0JV2pu8u52cnGl8z2XCFxy2zdbdZd7YhJhBGcoKt
	8HrITq247HdWt5SnJfm8lWV5LJV7bbeUJGht23NuHxBUfXlCUrmLY0C3DqFkIdvdQu2+ZC59EqySy
	CmmQDM0GdeLkLivbroZJk+7JNTR6ukoV8IkSEujy/010VTj4tJkWc6/bFO0hbGJusxJbFzEOXPTnc
	NDlQVujMMJ7Kysi82TMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmJ6-0000000ByI5-3Xum;
	Tue, 13 May 2025 09:52:16 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmHS-0000000Bxs7-3YPb
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 09:50:38 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 54D9nZei044744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 17:49:35 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Tue, 13 May 2025
 17:49:35 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v3 0/9] add Voyager board support
Date: Tue, 13 May 2025 17:49:24 +0800
Message-ID: <20250513094933.1631493-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 54D9nZei044744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_025035_264474_AE8306C0 
X-CRM114-Status: GOOD (  14.26  )
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
LXNvbHV0aW9ucy9hbmRlc2hhcGUtcGxhdGZvcm1zL3FpbGFpLWNoaXAvCi0tLQoKQ2hhbmdlbG9n
IGZyb20gdjIgdG8gdjM6CiAgLSBSZWJhc2UgdGhlIHNlcmllcyBvbiBDb25vci9yaXNjdi1zb2Mt
Zm9yLW5leHQKICAtIFJlZm9ybSBwYXRjaCA2IGFzIHN1Z2dlc3RlZCBieSBDb25vcgogIC0gTW9k
aWZ5IGwyX2NhY2hlJ3MgY29tcGF0aWJsZSBpbiBxaWxhaS5kdHNpIGR1ZSB0byBwYXRjaCA2CiAg
LSBBZGQgQ29ub3IncyBBY2tlZC1ieSB0YWcgdG8gcGF0Y2ggNAogIC0gQWRkIENvbm9yJ3MgQWNr
ZWQtYnkgdGFnIHRvIHBhdGNoIDUKICAtIEFkZCBDb25vcidzIEFja2VkLWJ5IHRhZyB0byBwYXRj
aCA5Cgp2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNTAzMTUxODI5LjYwNTAw
Ni01LWJlbjcxN0BhbmRlc3RlY2guY29tLwoKQ2hhbmdlbG9nIGZyb20gdjEgdG8gdjI6CiAgLSBB
ZGQgZGV0YWlsZWQgZGVzY3JpcHRpb25zIHRvIFBMSUNfU1cgYW5kIFBMTVQwCiAgLSBNb3ZlIHRo
ZSBhbGlhc2VzIG5vZGUgYW5kIG1lbW9yeSBub2RlIGZyb20gcWlsYWkuZHRzaSB0byBxaWxhaS12
b3lhZ2VyLmR0cwogIC0gRHJvcCAic3RhdHVzID0gb2theSIgaW4gZWFjaCBDUFUgbm9kZSBzaW5j
ZSB0aGUgc3RhdHVzIHByb3BlcnR5IGlzIGJ5CiAgICBkZWZhdWx0ICJva2F5IgogIC0gUmVvcmRl
ciB0aGUgbm9kZXMgaW4gcWlsYWkuZHRzaSBieSB1bml0IGFkZHJlc3MgaW4gYXNjZW5kaW5nIG9y
ZGVyCiAgLSBBZGQgbXlzZWxmIGFzIHRoZSBtYWludGFpbmVyIG9mIEFuZGVzJ3MgU29DIHRyZWUK
ICAtIEFkZCBSb2IncyBSZXZpZXdlZC1ieSB0YWcgdG8gcGF0Y2ggMgogIC0gQWRkIFJvYidzIEFj
a2VkLWJ5IHRhZyB0byBwYXRjaCAzCiAgLSBBZGQgUm9iJ3MgQWNrZWQtYnkgdGFnIHRvIHBhdGNo
IDYuCgp2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNDA3MTA0OTM3LjMxNTc4
My0xLWJlbjcxN0BhbmRlc3RlY2guY29tLwoKLS0tCkJlbiBab25nLVlvdSBYaWUgKDkpOgogIHJp
c2N2OiBhZGQgQW5kZXMgU29DIGZhbWlseSBLY29uZmlnIHN1cHBvcnQKICBkdC1iaW5kaW5nczog
cmlzY3Y6IGFkZCBBbmRlcyBRaUxhaSBTb0MgYW5kIHRoZSBWb3lhZ2VyIGJvYXJkIGJpbmRpbmdz
CiAgZHQtYmluZGluZ3M6IGludGVycnVwdC1jb250cm9sbGVyOiBhZGQgQW5kZXMgUWlMYWkgUExJ
QwogIGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogYWRkIEFuZGVzIG1hY2hpbmUt
bGV2ZWwgc29mdHdhcmUKICAgIGludGVycnVwdCBjb250cm9sbGVyCiAgZHQtYmluZGluZ3M6IHRp
bWVyOiBhZGQgQW5kZXMgbWFjaGluZSB0aW1lcgogIGR0LWJpbmRpbmdzOiBjYWNoZTogYWRkIFFp
TGFpIGNvbXBhdGlibGUgdG8gYXg0NW1wCiAgcmlzY3Y6IGR0czogYW5kZXM6IGFkZCBRaUxhaSBT
b0MgZGV2aWNlIHRyZWUKICByaXNjdjogZHRzOiBhbmRlczogYWRkIFZveWFnZXIgYm9hcmQgZGV2
aWNlIHRyZWUKICByaXNjdjogZGVmY29uZmlnOiBlbmFibGUgQW5kZXMgU29DCgogLi4uL2NhY2hl
L2FuZGVzdGVjaCxheDQ1bXAtY2FjaGUueWFtbCAgICAgICAgIHwgIDUyICsrKystCiAuLi4vYW5k
ZXN0ZWNoLHBsaWNzdy55YW1sICAgICAgICAgICAgICAgICAgICAgfCAgNTQgKysrKysKIC4uLi9z
aWZpdmUscGxpYy0xLjAuMC55YW1sICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9hbmRlcy55YW1sICAgICAgfCAgMjUgKysrCiAuLi4vYmlu
ZGluZ3MvdGltZXIvYW5kZXN0ZWNoLHBsbXQwLnlhbWwgICAgICAgfCAgNTMgKysrKysKIE1BSU5U
QUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBhcmNoL3Jp
c2N2L0tjb25maWcuZXJyYXRhICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gvcmlz
Y3YvS2NvbmZpZy5zb2NzICAgICAgICAgICAgICAgICAgICAgICB8ICAgOSArCiBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9i
b290L2R0cy9hbmRlcy9NYWtlZmlsZSAgICAgICAgICAgIHwgICAyICsKIGFyY2gvcmlzY3YvYm9v
dC9kdHMvYW5kZXMvcWlsYWktdm95YWdlci5kdHMgICB8ICAyOCArKysKIGFyY2gvcmlzY3YvYm9v
dC9kdHMvYW5kZXMvcWlsYWkuZHRzaSAgICAgICAgICB8IDE4NiArKysrKysrKysrKysrKysrKysK
IGFyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcgICAgICAgICAgICAgICAgICB8ICAgMSArCiAx
MyBmaWxlcyBjaGFuZ2VkLCA0MTcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvYW5kZXN0ZWNoLHBsaWNzdy55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2FuZGVzLnlhbWwKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvYW5kZXN0
ZWNoLHBsbXQwLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2Fu
ZGVzL01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbmRl
cy9xaWxhaS12b3lhZ2VyLmR0cwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9k
dHMvYW5kZXMvcWlsYWkuZHRzaQoKLS0KMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
