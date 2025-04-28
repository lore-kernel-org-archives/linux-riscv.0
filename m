Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520AEC369D3
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E6ZB134xI6goDtJ074jI3hj//za1ZlvF5lW3uXQ1WzA=; b=2pwJEdZY+BbvhR
	g05FoAhspuhIlCPjYmShMlNwPl4F1v49IptqbkI+T459BUwFcNg1JcumlAdm6U/RY7nycv0cVnMDQ
	GNBEXQlS96eyJ78/qtmdd97g73DisautUEQKVGcYsyQXlPOzE5/vA71H3Xxxa2Bx+tIyBBRGVb5Xr
	708pvgNVIQ5zbaFwQ0h0VoIy/RyPxQ64As8JRzhPT+oZPXHZAqLnu6DrEUHgu1voR3ifJ+Az0vEh0
	EDhpoJpE8mqJlvOw1ZA5sFo9f49I3ob4Znbtkx0vZPWWRuf/6QiepimuOwYhiTRaj+JSdw1MF8E3m
	2tbF4FpsnGauYKrNKZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KyF-00000005gDk-1Jdo;
	Mon, 28 Apr 2025 09:40:15 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KjO-00000005bEU-2ibJ
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 09:24:56 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 13638c211;
	Mon, 28 Apr 2025 17:24:44 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 28 Apr 2025 17:24:36 +0800
Subject: [PATCH] riscv: dts: sophgo: fix DMA data-width configuration for
 CV18xx
MIME-Version: 1.0
Message-Id: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
X-B4-Tracking: v=1; b=H4sIAFNJD2gC/x3MQQqAIBBA0avIrBsw0YiuEi0sZ2oWaShFEN09a
 fkW/z9QKAsVGNQDmS4pkmJF2yhYNh9XQgnVYLRx2poew5kw7B6XFFlWZJotOdLOdgw1OjKx3P9
 wnN73A9YtdeFgAAAA
X-Change-ID: 20250428-duo-dma-config-feb4e5e0546f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huange@whut.edu.cn>, 
 Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745832284; l=1588;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=12svZieZzYZWxjZgqhIe9t35WfYRR9u0DVRJ0tz0wUk=;
 b=VsL7xRIWnuhLE4kowb4JUDpMfPxlbEViDoxG8TY53XCL6zQ5eUNaGE1UaXhWvpeWHcxq8kb7R
 WxsGNmqzWExApEkYjGCXuv6hkVnnV6A/2aukDchpmHMnL/V0FpH3zjp
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEpJVk0eGUMfGk1KTEpCQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSElMQktVSktLVUpCS0
	tZBg++
X-HM-Tid: 0a967bb691d503a1kunm13638c211
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxA6OTo5AzJOHTQtSAEBNisq
	LjMaFEJVSlVKTE9OQ0hJSUJLT09PVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBSEpOSjcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_022454_842068_F7986B34 
X-CRM114-Status: UNSURE (   8.37  )
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

VGhlICJzbnBzLGRhdGEtd2lkdGgiIHByb3BlcnR5WzFdIGRlZmluZXMgdGhlIEFYSSBkYXRhIHdp
ZHRoIG9mIHRoZSBETUEKY29udHJvbGxlciBhczoKCiAgICB3aWR0aCA9IDggw5cgKDJebikgYml0
cwoKKDAgPSA4IGJpdHMsIDEgPSAxNiBiaXRzLCAyID0gMzIgYml0cywgLi4uLCA2ID0gNTEyIGJp
dHMpCndoZXJlICJuIiBpcyB0aGUgdmFsdWUgb2YgInNucHMsZGF0YS13aWR0aCIuCgpGb3IgdGhl
IENWMTh4eCBETUEgY29udHJvbGxlciwgdGhlIGNvcnJlY3QgQVhJIGRhdGEgd2lkdGggaXMgMzIg
Yml0cywKY29ycmVzcG9uZGluZyB0byAic25wcyxkYXRhLXdpZHRoID0gMiIuCgpUZXN0IHJlc3Vs
dHMgb24gTWlsa3YgRHVvIFMgY2FuIGJlIGZvdW5kIGhlcmUgWzJdLgoKTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kbWEvc25wcyUyQ2R3LWF4aS1kbWFjLnlhbWwjTDc0IFsxXQpMaW5rOiBo
dHRwczovL2dpc3QuZ2l0aHViLmNvbS9TdXR0ZXIwOTkvNGZhOTliYjJkODllNWFmOTc1OTgzMTI0
NzA0YjM4NjEgWzJdCgpDby1kZXZlbG9wZWQtYnk6IFl1IFl1YW4gPHl1Lnl1YW5Ac2p0dS5lZHUu
Y24+ClNpZ25lZC1vZmYtYnk6IFl1IFl1YW4gPHl1Lnl1YW5Ac2p0dS5lZHUuY24+ClNpZ25lZC1v
ZmYtYnk6IFplIEh1YW5nIDxodWFuZ2VAd2h1dC5lZHUuY24+Ci0tLQpTaWduZWQtb2ZmLWJ5OiBa
ZSBIdWFuZyA8aHVhbmd6ZUB3aHV0LmVkdS5jbj4KLS0tCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9jdjE4eHguZHRzaSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2
MTh4eC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LmR0c2kKaW5kZXgg
YzE4ODIyZWM4NDlmMzUzYmMyOTY5NjVkMmQ2MDBhM2RmMzE0Y2ZmNi4uNThjZDU0NjM5MmUwNTZh
M2JiZGY5YzI3YTczYzA1MGRlMTA2MGZiYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0
cy9zb3BoZ28vY3YxOHh4LmR0c2kKKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3Yx
OHh4LmR0c2kKQEAgLTM0MSw3ICszNDEsNyBAQCBkbWFjOiBkbWEtY29udHJvbGxlckA0MzMwMDAw
IHsKIAkJCQkJICAgMTAyNCAxMDI0IDEwMjQgMTAyND47CiAJCQlzbnBzLHByaW9yaXR5ID0gPDAg
MSAyIDMgNCA1IDYgNz47CiAJCQlzbnBzLGRtYS1tYXN0ZXJzID0gPDI+OwotCQkJc25wcyxkYXRh
LXdpZHRoID0gPDQ+OworCQkJc25wcyxkYXRhLXdpZHRoID0gPDI+OwogCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKIAkJfTsKIAoKLS0tCmJhc2UtY29tbWl0OiBiNDQzMjY1NmIzNmU1Y2MxZDUwYTFm
MmRjMTUzNTc1NDNhZGQ1MzBlCmNoYW5nZS1pZDogMjAyNTA0MjgtZHVvLWRtYS1jb25maWctZmVi
NGU1ZTA1NDZmCgpCZXN0IHJlZ2FyZHMsCi0tIApaZSBIdWFuZyA8aHVhbmd6ZUB3aHV0LmVkdS5j
bj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
