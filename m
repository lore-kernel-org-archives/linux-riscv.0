Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC23D625E7
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 03:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXTlRvh3WF8ASx1fvGfuMD9qSJRqHSDk13FgTATnvYw=; b=jvaPQfhApRtmSX
	zLGCKkMUpYwt5spFpDduYQ6i4HP10YhnsHEtAn1APdsH/mnAYaqRX2ZO+Wz7mqnOx2/u0vuK8ViOn
	NP2OYkvfg6moWJqZMJ5lGC2ylBw8LJZMqaoXZcoU8huRsHOctHc5CmtcWbWyRXIMn8tqQTe6u0fyN
	ozZuDnnNmMXzPYh/ESDBnGOVGxLcDP4lGwdQZ9B4rD4MaHsmD5+Q3Y3rxApVxwKfhX1E7lEch3nKg
	DHxN2JX/VW8Guqu5UJeOPK14qzG6u585CtOiWo1iFSyZsTnvYlpcickvOHvX1hTvmvXm729qF8IML
	6vuFEWESFKhL5J82F6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1villM-00000006OZr-18MU;
	Thu, 22 Jan 2026 03:53:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1villH-00000006OXw-2hzD
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 03:53:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB84D4440E;
	Thu, 22 Jan 2026 03:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4BB9C2BC87;
	Thu, 22 Jan 2026 03:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769054013;
	bh=orgXr9zmHCBms+ytEAP7IDI/EZXaKPysvA5ieVEr3Ew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fhREJzOHffx6T8npPEpP/KlJePfThT4OZaG8GQxNvQswFdFjj5h7Fgz0J/i57S7TI
	 uShHYTWrbpvXrqA7s35ZN31FB2xJqbHoEmPKOFQb+eWEzgdxe6PcGPRrSuNVtkCLb4
	 ojcg0iITC6G9CofAl+bODRv0xvWchpmcO64BDxNZkjjma4zEKWLY33F8oFBJBLeW+/
	 OuUx1Sx1d5VpkW7mS3drXO5LlTs9wC25eDgRRWLFgRX06w/YrEoTBFPKzAWZ6xs3Pu
	 PPjjNLskge9jZmTfBN+lh3+R8CJ6UrR2bn1JkiHSckD8YV30XSPY1HJ/AbWR5Qx7vo
	 tI9BxPVfDSJ/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA94FC44536;
	Thu, 22 Jan 2026 03:53:33 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Date: Thu, 22 Jan 2026 11:53:20 +0800
Subject: [PATCH v2 3/4] MAINTAINERS: add an entry for Andes I2C driver
MIME-Version: 1.0
Message-Id: <20260122-atciic100-v2-3-7559136d07cf@andestech.com>
References: <20260122-atciic100-v2-0-7559136d07cf@andestech.com>
In-Reply-To: <20260122-atciic100-v2-0-7559136d07cf@andestech.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ben Zong-You Xie <ben717@andestech.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769054012; l=725;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=3+hkSp62Y0BxAKsBp1ZxlSLfzIge4HcMfARxzT3H5hA=;
 b=e7/vVAFZV27UkQ/Y8zBjVN4l0NYgFJh+kCZNDbRFv2AD8POEZ9jRu368iAIFWqvLny0r0aGH6
 D4kYM/XQK4BBUW8e/e525q+toe9lHBit4IS/Bt6rRUDZ+ZxTm2MT61R
X-Developer-Key: i=ben717@andestech.com; a=ed25519;
 pk=nb8L7zQKGJpYk0yvrYKjViOZ34A36g1ZIsCmCsP518s=
X-Endpoint-Received: by B4 Relay for ben717@andestech.com/20260120 with
 auth_id=610
X-Original-From: Ben Zong-You Xie <ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_195335_709426_B7C37B6F 
X-CRM114-Status: UNSURE (   7.82  )
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
ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggZGM3MzFkMzdjOGZl
Li5jMTE0NWVlMTAzOGUgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJT
CkBAIC0xODE3LDYgKzE4MTcsMTIgQEAgUzoJU3VwcG9ydGVkCiBGOglkcml2ZXJzL2Nsay9hbmFs
b2diaXRzLyoKIEY6CWluY2x1ZGUvbGludXgvY2xrL2FuYWxvZ2JpdHMqCiAKK0FOREVTIEkyQyBE
UklWRVIKK006CUJlbiBab25nLVlvdSBYaWUgPGJlbjcxN0BhbmRlc3RlY2guY29tPgorUzoJU3Vw
cG9ydGVkCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FuZGVzdGVj
aCxhZTM1MC1pMmMueWFtbAorRjoJZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hbmRlcy5jCisKIEFO
RFJPSUQgRFJJVkVSUwogTToJR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KIE06CUFydmUgSGrDuG5uZXbDpWcgPGFydmVAYW5kcm9pZC5jb20+CgotLSAKMi4z
NC4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
