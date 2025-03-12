Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE4DC35FF3
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMqar2Ip4+x85k9EbiyJjIQNGFldCrfcoNhwygV8hr8=; b=bYm4l8nQHkuvpj
	k5zsLqZN7Ta661pq7CjQ4ANNIn7xMYpiaLag5Wzh1GM0XVxBlBJ9QCbuYYtn5nnPYpBAx1iBepwD2
	z6IUKwqoKRhGzIA+pvPUG4H8r5T1v2W+t1amG9WE523N3D2BzpUTKrpObYQrTtFA63K8WXK/O+M6p
	C8wkw4gE20vBdsSlQuzBUKPnKbJBJvC71XBdJtCav4g390Ak1mU1FLgHDdisatMXlQYXShQtNpyjE
	5O2YKpj7VDLuI+JbBdHQXHFbCpcJV/GUsW1j9NF/dVD/6sYjEz0UKSsUGa+MfqKTaKuwg5YKtIquU
	3Oopoy7PAQVxcD42O+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMKY-00000008bCT-1Oyg;
	Wed, 12 Mar 2025 13:41:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLt9-00000008X6Q-2EEH
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 13:12:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 434D45C5AFC;
	Wed, 12 Mar 2025 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A19C4CEE3;
	Wed, 12 Mar 2025 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741785166;
	bh=Hx6D1rRpddICfBXk7BrrDIlZsj2WNmHzrd9slgJOb4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uL0QnZF/AmCr1lTHvC3CGU4eIfndJpktr0hFVYpE4lTFegFmXuMwkkzNhSmsPUx7h
	 0YTwIKbgL1xZmzJ6nmd7J266JQ/H0HphOdEcyqg2u/DubrO8ZOm0Lz9YCCnxhHw4Wi
	 BbrlYDO56pP9dgFbqVoL9JSE3yoUgxmZDPZtzNSxRzDuqsL//fd3Pr92/koG3HHtvY
	 VA47GMEMMLKmaS+Bof2Ufgg6Vj8OVAR8XcfRE3g395LHFc5gjz8Y6rsUpGDaMzabp1
	 c3vhxuoO2djfzi7zMNhMqyd20eQac1W7iKPVP/jwUfUflT81RZCBXoQekzUxPuF26J
	 yWRl6Mg4t6AOQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 5/6] dt-bindings: riscv: add vector sub-extension dependencies
Date: Wed, 12 Mar 2025 13:11:48 +0000
Message-ID: <20250312-banking-crestless-58f3259a5018@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250312-abide-pancreas-3576b8c44d2c@spud>
References: <20250312-abide-pancreas-3576b8c44d2c@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2332; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GdLuIc5EAIS3gpLTxrlq7jFgE0FxstD07lH/xrh31/s=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkXO0SKZZOqWNj/rFdM6zO18+vQaz2QOT13+dtc/oyui pDVN0Q7SlkYxDgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMBHl04wMmy4E/XA6pp0nMH2r /3WThrjC3LNem/0qLpeZNYj17Jx+gJHhKJfKo3jl8ykNqwtYP8xSKT82e9GBt48cLJdWzwvatsm SFwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_061247_656774_A32715A6 
X-CRM114-Status: UNSURE (   7.19  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClNlY3Rpb24g
MzMuMTguMi4gWnZlKjogVmVjdG9yIEV4dGVuc2lvbnMgZm9yIEVtYmVkZGVkIFByb2Nlc3NvcnMK
aW4gWzFdIHNheXM6CnwgVGhlIFp2ZTMyZiBhbmQgWnZlNjR4IGV4dGVuc2lvbnMgZGVwZW5kIG9u
IHRoZSBadmUzMnggZXh0ZW5zaW9uLiBUaGUgWnZlNjRmIGV4dGVuc2lvbiBkZXBlbmRzCnwgb24g
dGhlIFp2ZTMyZiBhbmQgWnZlNjR4IGV4dGVuc2lvbnMuIFRoZSBadmU2NGQgZXh0ZW5zaW9uIGRl
cGVuZHMgb24gdGhlIFp2ZTY0ZiBleHRlbnNpb24KCnwgVGhlIFp2ZTMyeCBleHRlbnNpb24gZGVw
ZW5kcyBvbiB0aGUgWmljc3IgZXh0ZW5zaW9uLiBUaGUgWnZlMzJmIGFuZCBadmU2NGYgZXh0ZW5z
aW9ucyBkZXBlbmQKfCB1cG9uIHRoZSBGIGV4dGVuc2lvbgoKfCBUaGUgWnZlNjRkIGV4dGVuc2lv
biBkZXBlbmRzIHVwb24gdGhlIEQgZXh0ZW5zaW9uCgpBcHBseSB0aGVzZSBydWxlcyB0byB0aGUg
YmluZGluZ3MgdG8gaGVscCBwcmV2ZW50IGludmFsaWQgY29tYmluYXRpb25zLgoKTGluazogaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvcmVsZWFzZXMvdGFnL3Jpc2N2
LWlzYS1yZWxlYXNlLTY5OGU2NGEtMjAyNC0wOS0wOSBbMV0KUmV2aWV3ZWQtYnk6IENsw6ltZW50
IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA0NiArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCmluZGV4IGViYjI1
MjI3NWRkZC4uMDIwNjU2NjRmODE5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKQEAgLTY4MCw2ICs2ODAsNTIg
QEAgcHJvcGVydGllczoKICAgICAgICAgICBjb250YWluczoKICAgICAgICAgICAgIGNvbnN0OiB6
Y2EKIAorICAgICAgLSBpZjoKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0
OiB6dmUzMngKKyAgICAgICAgdGhlbjoKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAg
IGNvbnN0OiB6aWNzcgorCisgICAgICAtIGlmOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAg
ICAgICAgY29uc3Q6IHp2ZTMyZgorICAgICAgICB0aGVuOgorICAgICAgICAgIGFsbE9mOgorICAg
ICAgICAgICAgLSBjb250YWluczoKKyAgICAgICAgICAgICAgICBjb25zdDogZgorICAgICAgICAg
ICAgLSBjb250YWluczoKKyAgICAgICAgICAgICAgICBjb25zdDogenZlMzJ4CisKKyAgICAgIC0g
aWY6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogenZlNjR4CisgICAg
ICAgIHRoZW46CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogenZlMzJ4
CisKKyAgICAgIC0gaWY6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDog
enZlNjRmCisgICAgICAgIHRoZW46CisgICAgICAgICAgYWxsT2Y6CisgICAgICAgICAgICAtIGNv
bnRhaW5zOgorICAgICAgICAgICAgICAgIGNvbnN0OiBmCisgICAgICAgICAgICAtIGNvbnRhaW5z
OgorICAgICAgICAgICAgICAgIGNvbnN0OiB6dmUzMmYKKyAgICAgICAgICAgIC0gY29udGFpbnM6
CisgICAgICAgICAgICAgICAgY29uc3Q6IHp2ZTY0eAorCisgICAgICAtIGlmOgorICAgICAgICAg
IGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHp2ZTY0ZAorICAgICAgICB0aGVuOgorICAg
ICAgICAgIGFsbE9mOgorICAgICAgICAgICAgLSBjb250YWluczoKKyAgICAgICAgICAgICAgICBj
b25zdDogZAorICAgICAgICAgICAgLSBjb250YWluczoKKyAgICAgICAgICAgICAgICBjb25zdDog
enZlNjRmCisKIGFsbE9mOgogICAjIFpjZiBleHRlbnNpb24gZG9lcyBub3QgZXhpc3Qgb24gcnY2
NAogICAtIGlmOgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
