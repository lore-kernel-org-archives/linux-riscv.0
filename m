Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF71C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IUFk9ixOp94kQApvD7IwVGN5Imt9/ffJz4RiRMyK6s8=; b=c1pxPsAkaMIEXYZxYpFR0dvkW4
	tEkm347jMPW2XX75xQWcbJuWYLVQG16cE0sWqqWQxKXJwetFgK++GJaBcopUa4UlMF9/tlrSgBSAs
	Vn1t89s6sYq4bkQLqWe4TuPlFfe33C1qOtHovBPxaoGR7pwPk63spQWhrH5/VjRjIJcX3/SjKQkuQ
	15HZQHPRwR1lYvIUguCn5e2RBMptc9W4zUT6FCEyaNyakvVKotvhwNY5ai+NqLLIfv0BP9RlkJI1F
	EI4OReRKYn3IWmKbuRkLNJqBVrX2mWEX6mTeRZTXX5fvPgMuSP6oogaSgh2svQdUoJVt+JEr6S36K
	a4/7PQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pur2n-00A3G5-2d;
	Fri, 05 May 2023 08:44:01 +0000
Received: from smtp37.cstnet.cn ([159.226.251.37] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pur2j-00A3EC-15
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 08:44:00 +0000
Received: from zhangfei$nj.iscas.ac.cn ( [104.249.174.122] ) by
 ajax-webmail-APP-12 (Coremail) ; Fri, 5 May 2023 16:43:44 +0800 (GMT+08:00)
X-Originating-IP: [104.249.174.122]
Date: Fri, 5 May 2023 16:43:44 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5byg6aOe?= <zhangfei@nj.iscas.ac.cn>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Optimize memset
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.15 build 20230321(1bf45b10)
 Copyright (c) 2002-2023 www.mailtech.cn cnic.cn
Content-Type: multipart/mixed; 
	boundary="----=_Part_843841_1477095471.1683276224911"
MIME-Version: 1.0
Message-ID: <6d1cbe2e.3c31d.187eb14d990.Coremail.zhangfei@nj.iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tgCowADXAEXBwVRkyZkZAA--.17989W
X-CM-SenderInfo: x2kd0whihlq03mol2u1dvotugofq/1tbiBwICEWRUtj8l+QAAsz
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW5Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_014357_763160_D3C84448 
X-CRM114-Status: UNSURE (   2.09  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

------=_Part_843841_1477095471.1683276224911
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

Cg==
------=_Part_843841_1477095471.1683276224911
Content-Type: application/octet-stream; 
	name=0001-riscv-Optimize-memset.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-riscv-Optimize-memset.patch"

RnJvbSBiY2ExODlmYmZhY2YxYjAxOTc1YWY0NWU0OTA5NmE1NzE4ODg3YTQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiB6aGFuZ2ZlaSA8emhhbmdmZWlAbmouaXNjYXMuYWMuY24+CkRh
dGU6IEZyaSwgNSBNYXkgMjAyMyAxNDo1ODozNSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIHJpc2N2
OiBPcHRpbWl6ZSBtZW1zZXQKClRoaXMgcGF0Y2ggaGFzIGJlZW4gb3B0aW1pemVkIGZvciBtZW1z
ZXQgZGF0YSBzaXplcyBsZXNzIHRoYW4gMTYgYnl0ZXMuCkNvbXBhcmVkIHRvIGJ5dGUgYnkgYnl0
ZSBzdG9yYWdlLCBzaWduaWZpY2FudCBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBoYXMgYmVlbiBh
Y2hpZXZlZC4KClNpZ25lZC1vZmYtYnk6IEZlaSBaaGFuZyA8emhhbmdmZWlAbmouaXNjYXMuYWMu
Y24+Ci0tLQogYXJjaC9yaXNjdi9saWIvbWVtc2V0LlMgfCAzMyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbGliL21lbXNldC5TIGIvYXJjaC9yaXNj
di9saWIvbWVtc2V0LlMKaW5kZXggMzRjNTM2MGM2NzA1Li4wOTY3YmRmODZiZDYgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvbGliL21lbXNldC5TCisrKyBiL2FyY2gvcmlzY3YvbGliL21lbXNldC5T
CkBAIC0xMDUsOSArMTA1LDM2IEBAIFdFQUsobWVtc2V0KQogCWJlcXogYTIsIDZmCiAJYWRkIGEz
LCB0MCwgYTIKIDU6Ci0Jc2IgYTEsIDAodDApCi0JYWRkaSB0MCwgdDAsIDEKLQlibHR1IHQwLCBh
MywgNWIKKyAgICAgICAgc2IgYTEsIDAodDApCisgICAgICAgIHNiIGExLCAtMShhMykKKyAgICAg
ICAgbGkgYTQsIDIKKyAgICAgICAgYmdldSBhNCwgYTIsIDZmCisKKyAgICAgICAgc2IgYTEsIDEo
dDApCisgICAgICAgIHNiIGExLCAyKHQwKQorICAgICAgICBzYiBhMSwgLTIoYTMpCisgICAgICAg
IHNiIGExLCAtMyhhMykKKyAgICAgICAgbGkgYTQsIDYKKyAgICAgICAgYmdldSBhNCwgYTIsIDZm
CisKKyAgICAgICAgc2IgYTEsIDModDApCisgICAgICAgIHNiIGExLCAtNChhMykKKyAgICAgICAg
bGkgYTQsIDgKKyAgICAgICAgYmdldSBhNCwgYTIsIDZmCisKKyAgICAgICAgc2IgYTEsIDQodDAp
CisgICAgICAgIHNiIGExLCAtNShhMykKKyAgICAgICAgbGkgYTQsIDEwCisgICAgICAgIGJnZXUg
YTQsIGEyLCA2ZgorCisgICAgICAgIHNiIGExLCA1KHQwKQorICAgICAgICBzYiBhMSwgNih0MCkK
KyAgICAgICAgc2IgYTEsIC02KGEzKQorICAgICAgICBzYiBhMSwgLTcoYTMpCisgICAgICAgIGxp
IGE0LCAxNAorICAgICAgICBiZ2V1IGE0LCBhMiwgNmYKKworICAgICAgICBzYiBhMSwgNyh0MCkK
IDY6CiAJcmV0CiBFTkQoX19tZW1zZXQpCi0tIAoyLjMzLjAKCg==
------=_Part_843841_1477095471.1683276224911
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

------=_Part_843841_1477095471.1683276224911--


