Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47969C5AD7B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 06:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbUgunKKKOIgOWB39hrfADS9sFW0lIA0Bl8nos3/mHU=; b=L1D/2iz9Xx0G0d
	hEKhs4D9Dj+WTaK244gEGeZdEzWP5gVpn+8C6kgJ7312V0hIl59V6nZftUl+5WTtpa29b3O9LDWuS
	Q8FCa+DSWGD9QLAc61w9uKhpShN8HgQ7NfMEqmlZRM6X1jHCemmreEXsNkrfkA+oP+LFDp90QneSy
	dnO4Xqs6IUuIgxYUgFNTM3dWY3PJarCGO2CNxxASS4kHExQ4p4VMGNO+yxlG7LLITeeDCvLnUKrOl
	stvsjASWMmT3fes/AKoeJ3+ie7Z26hOaOdM2m9naWnA7urdy6/b+rv7FI/tf0sIYXejqxJnzqM5lz
	C2O6Qdrgx0YIpcFf68Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfzk-0000000DPqa-0Quv;
	Tue, 11 Aug 2026 06:29:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfzi-0000000DPq1-3v3A
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 06:29:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D4B543F26;
	Tue, 11 Aug 2026 06:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F118C2BCFB;
	Tue, 11 Aug 2026 06:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786429790;
	bh=Y37RDRvGcdTfSt4TfIk21BIoyh2Lq99rEpBKHLZTJuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rPDEunv5AnDYg+HNXstJ+TH+EnuYAAwkeRkXj5yT1PRMwCHIXx+1HacfLuRPselBt
	 Hl/ebu0173LTLe1WKM6EHtI1OfBs81GGVgd++6BDQDE87R84jwkW2v/QXJYdzpZAQC
	 voCVDxdeIZkrQym2zcze4/G4IPXRHAlY0F8M1aCQlRHf9a6ijzY/IZ3Jb5vwupJlOP
	 1Qma46/pgU+0igXeUxZ9kuUZ/WnJ0U00q3xIlqrp781CV6tErQM5JYBqvx4NQFCJTU
	 6UPhiPLQveyV+Eu29TbEgjkjkPeHKu80hD6lo3hs3STTKp/O4KQKf2ogMgyyxiduyc
	 VMi90FehM1ZDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D228C5AC67;
	Tue, 11 Aug 2026 06:29:50 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Date: Tue, 11 Aug 2026 14:29:50 +0800
Subject: [PATCH v5 3/4] MAINTAINERS: add an entry for Andes I2C driver
MIME-Version: 1.0
Message-Id: <20260811-atciic100-v5-3-1d306c21dba3@andestech.com>
References: <20260811-atciic100-v5-0-1d306c21dba3@andestech.com>
In-Reply-To: <20260811-atciic100-v5-0-1d306c21dba3@andestech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ben Zong-You Xie <ben717@andestech.com>
X-Mailer: b4 0.15-dev-09770
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786429789; l=771;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=uExPQvJDzXhEA4CaNzsQ8AegVCh731pt3gwkmiHcb3E=;
 b=Qv/zV69Wu6HC8PkNbTRV3bFVeZx8Xd3H6PePxXOGXirwnr3BcsnCsmKgTx0MDSDunYSZTIUkF
 mElc1UcXubvAR+nSfTCnDThPxpXxj5/++ZNJJSu/+n+BdoGDccKwBZy
X-Developer-Key: i=ben717@andestech.com; a=ed25519;
 pk=nb8L7zQKGJpYk0yvrYKjViOZ34A36g1ZIsCmCsP518s=
X-Endpoint-Received: by B4 Relay for ben717@andestech.com/20260120 with
 auth_id=610
X-Original-From: Ben Zong-You Xie <ben717@andestech.com>
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
Reply-To: ben717@andestech.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+CgpBZGQgYW4gZW50
cnkgZm9yIHRoZSBBbmRlcyBJMkMgZHJpdmVyIHRvIHRoZSBNQUlOVEFJTkVSUyBmaWxlLgoKU2ln
bmVkLW9mZi1ieTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+Ci0tLQog
TUFJTlRBSU5FUlMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggMTUwMTFmNTc1MmE5
Li5kMTcyN2ZkMGU4M2UgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJT
CkBAIC0xOTM4LDYgKzE5MzgsMTIgQEAgUzoJU3VwcG9ydGVkCiBGOglEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvYW5kZXN0ZWNoLGFlMzUwLXdkdC55YW1sCiBGOglk
cml2ZXJzL3dhdGNoZG9nL2F0Y3dkdDIwMF93ZHQuYwogCitBTkRFUyBJMkMgRFJJVkVSCitNOglC
ZW4gWm9uZy1Zb3UgWGllIDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4KK1M6CVN1cHBvcnRlZAorRjoJ
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hbmRlc3RlY2gsYWUzNTAtaTJj
LnlhbWwKK0Y6CWRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYW5kZXMuYworCiBBTkRST0lEIERSSVZF
UlMKIE06CUdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBN
OglBcnZlIEhqw7hubmV2w6VnIDxhcnZlQGFuZHJvaWQuY29tPgoKLS0gCjIuMzQuMQoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
