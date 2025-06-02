Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D6AC5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 06:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T3OhumQF2tyg5rssYX52KL1E0anuCn02aMgptiCYwkg=; b=pALd2T2j4eUrGs
	RFC8N6bb1InQBfkLlaNtr9/7BB9e+n33IQeJeOBpmWHBduaRSeuqe3cUTF/+CGrNrld0IJ3+YtF/C
	niFwT3mda5/lONEA11okfNhuJmQbVkAqsRvnsKPGyKD8MK/cLNkYa8GF1REe6vIW5+X+Rxt+6mVQf
	hHwpzLbxPNACRGibga2pW+s5EAlTohv2ktpnqbg5pOEAlWhkY2ypmeLV/x0YlUzRNBSdEpO8a7jKV
	E8LlgZi3HVBH+YQ0MsSvy2n+Pnqhs1hsyiHHPj9RQKeQd4u2F2VCn7fJ2HOyCB7l0U6fGRCQHtRnZ
	z0eTfPagig/OePmd5jWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLyLw-00000006o7S-3p5Q;
	Mon, 02 Jun 2025 06:08:56 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLyLr-00000006o2B-1Ev7
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 06:08:54 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 55267nmX095976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jun 2025 14:07:49 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 2 Jun 2025
 14:07:49 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v5 0/8] add Voyager board support
Date: Mon, 2 Jun 2025 14:07:39 +0800
Message-ID: <20250602060747.689824-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 55267nmX095976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_230851_693194_52CBB8B3 
X-CRM114-Status: GOOD (  14.11  )
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
LXNvbHV0aW9ucy9hbmRlc2hhcGUtcGxhdGZvcm1zL3FpbGFpLWNoaXAvCi0tLQpDaGFuZ2Vsb2cg
ZnJvbSB2NCB0byB2NToKICAtIFJlYmFzZSB0aGUgc2VyaWVzIG9uIHRvcnZhbGRzL21hc3Rlcgog
IC0gQ2xhcmlmeSB0aGUgcGF0Y2ggZGVwZW5kZW5jaWVzICgyIDwtIDQgPC0gNSA8LSA2KSBpbiB0
aGUgcGF0Y2ggZGVzY3JpcHRpb24KCnY0OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NTA1MTQwOTUzNTAuMzc2NTcxNi0xLWJlbjcxN0BhbmRlc3RlY2guY29tLwoKQ2hhbmdlbG9nIGZy
b20gdjMgdG8gdjQ6CiAgLSBSZXN0b3JlIHRoZSBtb2RpZmljYXRpb24gdG8gY2FjaGUtc2V0cyBh
bmQgY2FjaGUtc2l6ZSBpbiBwYXRjaCA2CiAgLSBEbyBub3QgY29uc3RyYWluIHJlbmVzYXMscjlh
MDdnMDQzZi1heDQ1bXAtY2FjaGUgc2luY2UgaXQncyBpbmRlcGVuZGVudCB0bwogICAgdGhpcyBz
ZXJpZXMuCiAgLSBEZWxldGUgdGhlIHJlZHVuZGFudCBleGFtcGxlIGFkZGVkIGJ5IHBhdGNoIDYK
CnYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA1MTMwOTQ5MzMuMTYzMTQ5My0x
LWJlbjcxN0BhbmRlc3RlY2guY29tLwoKQ2hhbmdlbG9nIGZyb20gdjIgdG8gdjM6CiAgLSBSZWJh
c2UgdGhlIHNlcmllcyBvbiBDb25vci9yaXNjdi1zb2MtZm9yLW5leHQKICAtIFJlZm9ybSBwYXRj
aCA2IGFzIHN1Z2dlc3RlZCBieSBDb25vcgogIC0gTW9kaWZ5IGwyX2NhY2hlJ3MgY29tcGF0aWJs
ZSBpbiBxaWxhaS5kdHNpIGR1ZSB0byBwYXRjaCA2CiAgLSBBZGQgQ29ub3IncyBBY2tlZC1ieSB0
YWcgdG8gcGF0Y2ggNAogIC0gQWRkIENvbm9yJ3MgQWNrZWQtYnkgdGFnIHRvIHBhdGNoIDUKICAt
IEFkZCBDb25vcidzIEFja2VkLWJ5IHRhZyB0byBwYXRjaCA5Cgp2MjogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjUwNTAzMTUxODI5LjYwNTAwNi01LWJlbjcxN0BhbmRlc3RlY2guY29t
LwoKQ2hhbmdlbG9nIGZyb20gdjEgdG8gdjI6CiAgLSBBZGQgZGV0YWlsZWQgZGVzY3JpcHRpb25z
IHRvIFBMSUNfU1cgYW5kIFBMTVQwCiAgLSBNb3ZlIHRoZSBhbGlhc2VzIG5vZGUgYW5kIG1lbW9y
eSBub2RlIGZyb20gcWlsYWkuZHRzaSB0byBxaWxhaS12b3lhZ2VyLmR0cwogIC0gRHJvcCAic3Rh
dHVzID0gb2theSIgaW4gZWFjaCBDUFUgbm9kZSBzaW5jZSB0aGUgc3RhdHVzIHByb3BlcnR5IGlz
IGJ5CiAgICBkZWZhdWx0ICJva2F5IgogIC0gUmVvcmRlciB0aGUgbm9kZXMgaW4gcWlsYWkuZHRz
aSBieSB1bml0IGFkZHJlc3MgaW4gYXNjZW5kaW5nIG9yZGVyCiAgLSBBZGQgbXlzZWxmIGFzIHRo
ZSBtYWludGFpbmVyIG9mIEFuZGVzJ3MgU29DIHRyZWUKICAtIEFkZCBSb2IncyBSZXZpZXdlZC1i
eSB0YWcgdG8gcGF0Y2ggMgogIC0gQWRkIFJvYidzIEFja2VkLWJ5IHRhZyB0byBwYXRjaCAzCiAg
LSBBZGQgUm9iJ3MgQWNrZWQtYnkgdGFnIHRvIHBhdGNoIDYuCgp2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjUwNDA3MTA0OTM3LjMxNTc4My0xLWJlbjcxN0BhbmRlc3RlY2guY29t
LwoKLS0tCkJlbiBab25nLVlvdSBYaWUgKDgpOgogIHJpc2N2OiBhZGQgQW5kZXMgU29DIGZhbWls
eSBLY29uZmlnIHN1cHBvcnQKICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBBbmRlcyBRaUxhaSBT
b0MgYW5kIHRoZSBWb3lhZ2VyIGJvYXJkIGJpbmRpbmdzCiAgZHQtYmluZGluZ3M6IGludGVycnVw
dC1jb250cm9sbGVyOiBhZGQgQW5kZXMgUWlMYWkgUExJQwogIGR0LWJpbmRpbmdzOiBpbnRlcnJ1
cHQtY29udHJvbGxlcjogYWRkIEFuZGVzIG1hY2hpbmUtbGV2ZWwgc29mdHdhcmUKICAgIGludGVy
cnVwdCBjb250cm9sbGVyCiAgZHQtYmluZGluZ3M6IHRpbWVyOiBhZGQgQW5kZXMgbWFjaGluZSB0
aW1lcgogIHJpc2N2OiBkdHM6IGFuZGVzOiBhZGQgUWlMYWkgU29DIGRldmljZSB0cmVlCiAgcmlz
Y3Y6IGR0czogYW5kZXM6IGFkZCBWb3lhZ2VyIGJvYXJkIGRldmljZSB0cmVlCiAgcmlzY3Y6IGRl
ZmNvbmZpZzogZW5hYmxlIEFuZGVzIFNvQwoKIC4uLi9hbmRlc3RlY2gscGxpY3N3LnlhbWwgICAg
ICAgICAgICAgICAgICAgICB8ICA1NCArKysrKwogLi4uL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwg
ICAgICAgICAgICAgICAgICAgIHwgICAxICsKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2FuZGVzLnlhbWwgICAgICB8ICAyNSArKysKIC4uLi9iaW5kaW5ncy90aW1lci9hbmRlc3RlY2gs
cGxtdDAueWFtbCAgICAgICB8ICA1MyArKysrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICA5ICsKIGFyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArLQogYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA5ICsKIGFyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FuZGVzL01ha2VmaWxl
ICAgICAgICAgICAgfCAgIDIgKwogYXJjaC9yaXNjdi9ib290L2R0cy9hbmRlcy9xaWxhaS12b3lh
Z2VyLmR0cyAgIHwgIDI4ICsrKwogYXJjaC9yaXNjdi9ib290L2R0cy9hbmRlcy9xaWxhaS5kdHNp
ICAgICAgICAgIHwgMTg2ICsrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9jb25maWdzL2Rl
ZmNvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAxICsKIDEyIGZpbGVzIGNoYW5nZWQsIDM3MCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FuZGVzdGVjaCxw
bGljc3cueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9hbmRlcy55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL2FuZGVzdGVjaCxwbG10MC55YW1sCiBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbmRlcy9NYWtlZmlsZQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYW5kZXMvcWlsYWktdm95YWdlci5kdHMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FuZGVzL3FpbGFpLmR0c2kKCi0t
CjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
