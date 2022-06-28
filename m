Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DDFC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ak7sMzQgDXl0/UY/UYMm7Spg7SIBabxTAn7JtpWxMWs=; b=ybOlejUCPL2tOR
	8Sa/XYz6oatJJXB+4eTvDENFvrySMiVJIC54dnogHCKw1ZM6NpmzT7LFcsMYgJUqSRTzz8JatE8ug
	EjZILphp/rmlWU/hC3fBA740QrTR+M+tvgUwTpnRuLjmaseYBtt8AyIBCb2EzO1xpY8QJ0qDI4Lnw
	i9vaHWKD2hwCNDL+BZ98PCVtRwSul9RooJU64vdaiw28ivsQwFygNmz6hvyerX06z0x6APnD1hgRe
	vnZwujRN3T8O0hqTcQYYG2+SYcAHVAWtcyertWoJqE5fa5ZC9RZrc8vgdeCAS9SYZyElSz5SuAuw3
	Dg70RBKHW/Arx90nR1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69gV-005zmT-UF; Tue, 28 Jun 2022 11:47:11 +0000
Received: from forward501j.mail.yandex.net ([5.45.198.251])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69gB-005zdE-3l; Tue, 28 Jun 2022 11:46:53 +0000
Received: from vla1-5c8ce23a551e.qloud-c.yandex.net (vla1-5c8ce23a551e.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:400d:0:640:5c8c:e23a])
	by forward501j.mail.yandex.net (Yandex) with ESMTP id B233A6231D1;
	Tue, 28 Jun 2022 14:46:39 +0300 (MSK)
Received: from vla3-178a3f795968.qloud-c.yandex.net (vla3-178a3f795968.qloud-c.yandex.net [2a02:6b8:c15:2584:0:640:178a:3f79])
	by vla1-5c8ce23a551e.qloud-c.yandex.net (mxback/Yandex) with ESMTP id Z9x1a00j1O-kbfO9vfl;
	Tue, 28 Jun 2022 14:46:39 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1656416799;
	bh=Fj1CfjmfGHqlANTgIcu8cPsR6XcA+gZqUzEuWcIko50=;
	h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
	b=Iyo0QB+ECzkswea2YaWHcoTNqLb//6FNK9SFNAfsu89FF6hglDxS0NDB3vY6rqhPN
	 Q5ZTt2JRerQs7m2c+7/MzTIRUJE3DM/K/tu844WsXJMBcJvwv8FRwtbegry+9Xd1ke
	 p3Dt/rtXxuct1+9xXwKrxt9lyV48dvMUbqvFuGck=
Authentication-Results: vla1-5c8ce23a551e.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla3-178a3f795968.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id s5dKAuvn1y-kZMCIGGq;
	Tue, 28 Jun 2022 14:46:36 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: linux@yadro.com,
	Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] drivers/perf: riscv_pmu_sbi: perf format
Date: Tue, 28 Jun 2022 14:45:55 +0300
Message-Id: <20220628114625.166665-2-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220628114625.166665-1-nikita.shubin@maquefel.me>
References: <20220628114625.166665-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_044651_556600_E02CF957 
X-CRM114-Status: GOOD (  13.02  )
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

RnJvbTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgoKVXBkYXRlIGRyaXZlciB0
byBleHBvcnQgZm9ybWF0dGluZyBhbmQgZXZlbnQgaW5mb3JtYXRpb24gdG8gc3lzZnMgc28gaXQK
Y2FuIGJlIHVzZWQgYnkgdGhlIHBlcmYgdXNlciBzcGFjZSB0b29scyB3aXRoIHRoZSBzeW50YXhl
czoKCnBlcmYgc3RhdCAtZSBjcHUvZXZlbnQ9MHgwNQpwZXJmIHN0YXQgLWUgY3B1L2V2ZW50PTB4
MDUsZmlybXdhcmU9MHgxLwoKNjMtYml0IGlzIHVzZWQgdG8gZGlzdGluZ3Vpc2ggaGFyZHdhcmUg
ZXZlbnRzIGZyb20gZmlybXdhcmUuIEZpcm13YXJlCmV2ZW50cyBhcmUgZGVmaW5lZCBieSAiUklT
Qy1WIFN1cGVydmlzb3IgQmluYXJ5IEludGVyZmFjZQpTcGVjaWZpY2F0aW9uIi4KCnBlcmYgc3Rh
dCAtZSBjcHUvZXZlbnQ9MHgwNSxmaXJtd2FyZT0weDEvCgppcyBlcXVpdmFsZW50IHRvCgpwZXJm
IHN0YXQgLWUgcjgwMDAwMDAwMDAwMDAwMDUKCkluc3BpcmVkLWJ5OiBKb8OjbyBNw6FyaW8gRG9t
aW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0PgpTaWduZWQtb2ZmLWJ5OiBOaWtp
dGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5jb20+Ckxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvYmxvYi9tYXN0ZXIvcmlzY3Ytc2JpLmFkb2MKLS0t
CnY0LT52NToKLSBmb3JtYXQgY29uZmlnIGlzIG5vdyA0OC1iaXQgd2lkZQotIHNpbXBseSB1c2Ug
ImNvbmZpZzo2MyIKLS0tCiBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgMjAgKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfc2JpLmMKaW5kZXggZGNhMzUzN2E4ZGNjLi5hMmEyMmUzNWQ2ZWQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYwpAQCAtMjEsNiArMjEsMjUgQEAKICNpbmNsdWRlIDxhc20vc2JpLmg+CiAjaW5jbHVkZSA8
YXNtL2h3Y2FwLmg+CiAKK1BNVV9GT1JNQVRfQVRUUihldmVudCwgImNvbmZpZzowLTQ3Iik7CitQ
TVVfRk9STUFUX0FUVFIoZmlybXdhcmUsICJjb25maWc6NjMiKTsKKworc3RhdGljIHN0cnVjdCBh
dHRyaWJ1dGUgKnJpc2N2X2FyY2hfZm9ybWF0c19hdHRyW10gPSB7CisJJmZvcm1hdF9hdHRyX2V2
ZW50LmF0dHIsCisJJmZvcm1hdF9hdHRyX2Zpcm13YXJlLmF0dHIsCisJTlVMTCwKK307CisKK3N0
YXRpYyBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwIHJpc2N2X3BtdV9mb3JtYXRfZ3JvdXAgPSB7CisJ
Lm5hbWUgPSAiZm9ybWF0IiwKKwkuYXR0cnMgPSByaXNjdl9hcmNoX2Zvcm1hdHNfYXR0ciwKK307
CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICpyaXNjdl9wbXVfYXR0cl9n
cm91cHNbXSA9IHsKKwkmcmlzY3ZfcG11X2Zvcm1hdF9ncm91cCwKKwlOVUxMLAorfTsKKwogdW5p
b24gc2JpX3BtdV9jdHJfaW5mbyB7CiAJdW5zaWduZWQgbG9uZyB2YWx1ZTsKIAlzdHJ1Y3QgewpA
QCAtNzIwLDYgKzczOSw3IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2VfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJcG11LT5wbXUuY2FwYWJpbGl0aWVzIHw9IFBFUkZf
UE1VX0NBUF9OT19JTlRFUlJVUFQ7CiAJCXBtdS0+cG11LmNhcGFiaWxpdGllcyB8PSBQRVJGX1BN
VV9DQVBfTk9fRVhDTFVERTsKIAl9CisJcG11LT5wbXUuYXR0cl9ncm91cHMgPSByaXNjdl9wbXVf
YXR0cl9ncm91cHM7CiAJcG11LT5udW1fY291bnRlcnMgPSBudW1fY291bnRlcnM7CiAJcG11LT5j
dHJfc3RhcnQgPSBwbXVfc2JpX2N0cl9zdGFydDsKIAlwbXUtPmN0cl9zdG9wID0gcG11X3NiaV9j
dHJfc3RvcDsKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
