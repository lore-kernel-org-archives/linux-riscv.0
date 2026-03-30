Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ADFFF495A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 07:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3Tu8Q/qY0MgbYu7e3UnTzmY2ICo4NLCnYRsedQScDs=; b=1i29mvN4xcxV92
	wTuUhEAFglmON20Z4OqKIacsNbdc4ddrEvQf7+mzfWYmRxkL+3h3avy4Fq8Tk7ZuVKLAdF7c7GuUE
	1uDnANtht46CsDOzebjxL3IxxGdJOkNI5/yRlkEATWqknLkUnBUTz6QD7gO88T3OU34uWc513PNFj
	i1/FkKZoUGec4ygIvXLJCOxI61qbzHzqdsbr7juJqFdCPCjT3BtLbVKdtbQf/pmd+7b5n0xVyOzBS
	pF4NVQprh9WP2v8hArgNrjT1RjAeH8LTUxWXi6ZHEl12bf2RN1+M8c4JrxQYkfY5qB5CvpHuVC7q1
	5K/CT9DojW8Mg3FmYRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7758-0000000Alfv-0BsQ;
	Mon, 30 Mar 2026 07:30:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7753-0000000Ale6-2zi7
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 07:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D7A64457D;
	Mon, 30 Mar 2026 07:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F08A9C4AF0B;
	Mon, 30 Mar 2026 07:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774855836;
	bh=zsqXZYapJk4lTUfsp/UHiNYmhCmbGFBx8fixkiHGjbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X0p88OMZ0Gb9QxsAtCsO1gdH4Tu6ESMHd6JEqo0MTwdQ18z1rHHzC/VohS/WlNlg5
	 m/w2DyWkrhxFQlrw7TrNMjSFgtAtbYW5OtjUj/wmQFGqVLzjBgcdRTZsfRFJWaiIi0
	 TByK8nMpZ//UDtoZhYdYoQ0Cpmkhq7A0ATZwbzIYDNnAkrQs3yNrbBaOWYdQn39i58
	 edMEd/ZtIkWUaNZ6zhuNqqlJr+gzO7a5vkxIn42g0tcPkuRRB7tjReGziW9Joipe0+
	 DknkUjUjtLv9L0o/lERjBaFcnT7h2hqywmMSnOvfWVKwZmBHdV7MOEconCzrRgtVat
	 9f7cjkzYwFnXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E591CFF495B;
	Mon, 30 Mar 2026 07:30:35 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Date: Mon, 30 Mar 2026 15:30:33 +0800
Subject: [PATCH v4 3/4] MAINTAINERS: add an entry for Andes I2C driver
MIME-Version: 1.0
Message-Id: <20260330-atciic100-v4-3-d40822f63e4e@andestech.com>
References: <20260330-atciic100-v4-0-d40822f63e4e@andestech.com>
In-Reply-To: <20260330-atciic100-v4-0-d40822f63e4e@andestech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ben Zong-You Xie <ben717@andestech.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774855834; l=761;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=YiEx76SInP9JPwiKbc2slZ7Do4K0fx/VOtW1zrmzoiE=;
 b=cGuKKUe2ItklPvrrHhtXXu6mGLNhsReLY7Aqk85OiXJ76fLYf7jOPjpYRCE7znqZPx2tryyT3
 YrhaGvbnU5HBw1Ibl3b+Ar480h6R3bFHIfpeiBvdnv725OlGsqi06VI
X-Developer-Key: i=ben717@andestech.com; a=ed25519;
 pk=nb8L7zQKGJpYk0yvrYKjViOZ34A36g1ZIsCmCsP518s=
X-Endpoint-Received: by B4 Relay for ben717@andestech.com/20260120 with
 auth_id=610
X-Original-From: Ben Zong-You Xie <ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_003037_799126_E51296CD 
X-CRM114-Status: UNSURE (   7.65  )
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
Reply-To: ben717@andestech.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+CgpBZGQgYW4gZW50
cnkgZm9yIHRoZSBBbmRlcyBJMkMgZHJpdmVyIHRvIHRoZSBNQUlOVEFJTkVSUyBmaWxlLgoKU2ln
bmVkLW9mZi1ieTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+Ci0tLQog
TUFJTlRBSU5FUlMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggN2QxMDk4OGNiYzYy
Li43MjcyZWJlN2EyMmIgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJT
CkBAIC0xODYzLDYgKzE4NjMsMTIgQEAgUzoJU3VwcG9ydGVkCiBGOglEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc3BpL2FuZGVzdGVjaCxhZTM1MC1zcGkueWFtbAogRjoJZHJpdmVy
cy9zcGkvc3BpLWF0Y3NwaTIwMC5jCiAKK0FOREVTIEkyQyBEUklWRVIKK006CUJlbiBab25nLVlv
dSBYaWUgPGJlbjcxN0BhbmRlc3RlY2guY29tPgorUzoJU3VwcG9ydGVkCitGOglEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FuZGVzdGVjaCxhZTM1MC1pMmMueWFtbAorRjoJ
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hbmRlcy5jCisKIEFORFJPSUQgRFJJVkVSUwogTToJR3Jl
ZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KIE06CUFydmUgSGrD
uG5uZXbDpWcgPGFydmVAYW5kcm9pZC5jb20+CgotLSAKMi4zNC4xCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
