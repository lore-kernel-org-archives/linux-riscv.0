Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BC9C02182
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gpn2K9o7QRrpGK3QL5lz7HscHBfhCsP3rJI1mGk4aAI=; b=yeUt3v1idZ5Ie9
	gM+KOpt29uynPWhqDdymC7B2P6w5V5Uee5N8IsNxu6I896wLHIO2f/bpyRrE9+dSBQzQhHB518VGb
	S21O0J3NwcNm9FeoIB7iVwgYJ9CWY72iBCjmols2AL3HIFBpX8jpXROgdt9/CBWsu0849QgX756YA
	9TLL+boxLhFK0CUBTRVgSxidqN2Wd5uzhVnGRInwmThc+LQhc43pizpXLA6ePzYRVo7H/EEWRma/R
	x6iJbx/ZmnYZXbJ/7R2kOola9hnKuPjr7485QsqHGf9GxJjDhubfa7741HAgUYzTs/POGK4/sdOfQ
	MTzLurd0TjwR3TmEhcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabwm-0000000ATMB-0A2t;
	Wed, 22 Jan 2025 14:43:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabwi-0000000ATLa-3she
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 14:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07DEF5C5FC6;
	Wed, 22 Jan 2025 14:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA16C4CED2;
	Wed, 22 Jan 2025 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737556988;
	bh=TVGwxVO0xo3+rnxUovKfF7pi5C/YVzpJ6q00Yo/Sl/s=;
	h=From:To:Cc:Subject:Date:From;
	b=tMWmIjqAM50kqyx9x8ezias9Q8mc9I5ZW62KDHIAAYYM+z71GPHnKqg8ZCwDW5wjm
	 tooDO2w0wFkNE8U+HQkrStNVxlJ6ibFKkKTmtISEOQg3scY/GdaHyuvOEJVRE5bduL
	 PU2DuSRwrIZJf+4G2GolB6nv6v+jhklLPTgMrEpbDOJXChgk0njJagZ5MyvURxh+yl
	 aOOT7Z2DGf2AXLONvVyHyfL2BUg3TmaDPThOQyjlnpQhhiG8b6SF6llNrkZFuwlR1s
	 Y6ajzssoW6C/9C7lCtyoY7YbBReZqzVmGkPWbCXSELcNPkVJf2blPkWzHGD8BDbxro
	 TTjdqf0yR7zWA==
From: Conor Dooley <conor@kernel.org>
To: linux-pwm@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] pwm: microchip-core: fix incorrect comparison with max period
Date: Wed, 22 Jan 2025 14:42:56 +0000
Message-ID: <20250122-pastor-fancied-0b993da2d2d2@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IP8gdxD3c/+7SedNCJbFyJgVZrvNpro1QIADMns2ttI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkTmd+nyzruLhHZa30qnifycQfv8dTE19Oq+iccKY+cn 7dVcMLmjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExES4Thn6pso/z0OYfEOvPO pO9eu1bU8ZCB+quqG3JMEzecaXq46ynDXxnWhObFK1U/K4eq9FnonWy745kpkHTu1xMmG77/G27 a8wIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_064309_006751_0E65601E 
X-CRM114-Status: GOOD (  14.04  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCkluIG1jaHBf
Y29yZV9wd21fYXBwbHlfbG9ja2VkKCksIGlmIGh3X3BlcmlvZF9zdGVwcyBpcyBlcXVhbCB0byBp
dHMgbWF4LAphbiBlcnJvciBpcyByZXBvcnRlZCBhbmQgLmFwcGx5IGZhaWxzLiBUaGUgbWF4IHZh
bHVlIGlzIGFjdHVhbGx5IGEKcGVybWl0dGVkIHZhbHVlIGhvd2V2ZXIsIGFuZCBzbyB0aGlzIGNo
ZWNrIGNhbiBmYWlsIHdoZXJlIG11bHRpcGxlCmNoYW5uZWxzIGFyZSBlbmFibGVkLgoKRm9yIGV4
YW1wbGUsIHRoZSBmaXJzdCBjaGFubmVsIHRvIGJlIGNvbmZpZ3VyZWQgcmVxdWVzdHMgYSBwZXJp
b2QgdGhhdApzZXRzIGh3X3BlcmlvZF9zdGVwcyB0byB0aGUgbWF4aW11bSB2YWx1ZSwgYW5kIHdo
ZW4gYSBzZWNvbmQgY2hhbm5lbAppcyBlbmFibGVkIHRoZSBkcml2ZXIgcmVhZHMgaHdfcGVyaW9k
X3N0ZXBzIGJhY2sgZnJvbSB0aGUgaGFyZHdhcmUgYW5kCmZpbmRzIGl0IHRvIGJlIHRoZSBtYXhp
bXVtIHBvc3NpYmxlIHZhbHVlLCB0cmlnZ2VyaW5nIHRoZSB3YXJuaW5nIG9uIGEKcGVybWl0dGVk
IHZhbHVlLiBUaGUgdmFsdWUgdG8gYmUgYXZvaWRlZCBpcyAyNTUgKFBFUklPRF9TVEVQU19NQVgg
KyAxKSwKYXMgdGhhdCB3aWxsIHByb2R1Y2UgdW5kZXNpcmVkIGJlaGF2aW91ciwgc28gdGVzdCBm
b3IgZ3JlYXRlciB0aGFuLApyYXRoZXIgdGhhbiBlcXVhbCB0by4KCkZpeGVzOiAyYmY3ZWNmN2I0
ZmYgKCJwd206IGFkZCBtaWNyb2NoaXAgc29mdCBpcCBjb3JlUFdNIGRyaXZlciIpCkNDOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+Ci0tLQpDQzogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KQ0M6IERhaXJlIE1jTmFtYXJhIDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAu
Y29tPgpDQzogVXdlIEtsZWluZS1Lw7ZuaWcgPHVrbGVpbmVrQGtlcm5lbC5vcmc+CkNDOiBUaGll
cnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgpDQzogbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpDQzogbGludXgtcHdtQHZnZXIua2VybmVsLm9yZwpDQzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvcHdtL3B3bS1taWNyb2NoaXAtY29y
ZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLW1pY3JvY2hpcC1jb3JlLmMgYi9kcml2ZXJz
L3B3bS9wd20tbWljcm9jaGlwLWNvcmUuYwppbmRleCBjMWYyMjg3YjhlOTcuLjEyODIxYjRiYmY5
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLW1pY3JvY2hpcC1jb3JlLmMKKysrIGIvZHJp
dmVycy9wd20vcHdtLW1pY3JvY2hpcC1jb3JlLmMKQEAgLTMyNyw3ICszMjcsNyBAQCBzdGF0aWMg
aW50IG1jaHBfY29yZV9wd21fYXBwbHlfbG9ja2VkKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3Ry
dWN0IHB3bV9kZXZpY2UgKgogCQkgKiBtY2hwX2NvcmVfcHdtX2NhbGNfcGVyaW9kKCkuCiAJCSAq
IFRoZSBwZXJpb2QgaXMgbG9ja2VkIGFuZCB3ZSBjYW5ub3QgY2hhbmdlIHRoaXMsIHNvIHdlIGFi
b3J0LgogCQkgKi8KLQkJaWYgKGh3X3BlcmlvZF9zdGVwcyA9PSBNQ0hQQ09SRVBXTV9QRVJJT0Rf
U1RFUFNfTUFYKQorCQlpZiAoaHdfcGVyaW9kX3N0ZXBzID4gTUNIUENPUkVQV01fUEVSSU9EX1NU
RVBTX01BWCkKIAkJCXJldHVybiAtRUlOVkFMOwogCiAJCXByZXNjYWxlID0gaHdfcHJlc2NhbGU7
Ci0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
