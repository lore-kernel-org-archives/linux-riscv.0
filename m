Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A541FC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+9AA3Ot/uYgBAaS+b5JlQxApoSJLzeoyFVMAlLMGNI=; b=tw1I0XknSMZWjR
	mivqCZ1NVOanBaVkh8JNaTyc0XySV+Vf+HIKK7hGlga92SEzje5hUVW5x4I67YzlgMDtO/M5DjiOs
	TKhofH5T5Jja57Aha9YsddBmintzkkP8CKC3ax8xrQXDX/RZ2r31m7ZtJV5Yb0hle4qkHsH+XrPFx
	dF09XbZTLF+6GoSk2Bk1PPY5o8lSt6seVNty7zTOvwlhJHPTPzmjbuMoHKswtMp06ch1p6TG9J2nX
	tUZKwN1LkxqqwqjCwApoWNy5cxUioOXG6/II3BpicSLAHUDyF/zMBLiXK8TvM7rt/MIjLZ9ddBzen
	Wyn5awMM4tA7uOtZDcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4llm-002ww7-S7; Fri, 24 Jun 2022 16:02:54 +0000
Received: from forward500p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:110])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4llV-002wmH-Pa; Fri, 24 Jun 2022 16:02:39 +0000
Received: from myt6-e228e91c65dd.qloud-c.yandex.net (myt6-e228e91c65dd.qloud-c.yandex.net [IPv6:2a02:6b8:c12:42a5:0:640:e228:e91c])
	by forward500p.mail.yandex.net (Yandex) with ESMTP id AD567F04F2E;
	Fri, 24 Jun 2022 19:01:26 +0300 (MSK)
Received: from myt5-ca5ec8faf378.qloud-c.yandex.net (myt5-ca5ec8faf378.qloud-c.yandex.net [2a02:6b8:c12:2514:0:640:ca5e:c8fa])
	by myt6-e228e91c65dd.qloud-c.yandex.net (mxback/Yandex) with ESMTP id Cpu7h3Tut9-1PgmlxSt;
	Fri, 24 Jun 2022 19:01:26 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1656086486;
	bh=Od97yBVEB4xl89bfu7RN4gha8Ggf6tred2IKE8Y/ikg=;
	h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
	b=d974ooxfFUysBu9E+rf/JT1jxMMbkAAQqTLxQpILPVr9Qa6L16K+LVoLCZhdEkGq3
	 Sgww9ZUHNRO1wBhf6vDXPQl3LynbA+blqByd1VF43/AMSL3z24qbA91j5DHb6GezGx
	 ZA3EHvYAYCNujbvd9CCfdBQXnVkJWN86e9+5FoaQ=
Authentication-Results: myt6-e228e91c65dd.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt5-ca5ec8faf378.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id iVUkuL8Azf-1PMKOJDi;
	Fri, 24 Jun 2022 19:01:25 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	linux@yadro.com,
	Nikita Shubin <n.shubin@yadro.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] drivers/perf: riscv_pmu_sbi: perf format
Date: Fri, 24 Jun 2022 19:00:51 +0300
Message-Id: <20220624160117.3206-2-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624160117.3206-1-nikita.shubin@maquefel.me>
References: <20220624160117.3206-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_090238_249619_94E108E3 
X-CRM114-Status: GOOD (  12.30  )
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
CiBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKaW5kZXgg
ZGNhMzUzN2E4ZGNjLi4yYjU4NjFhMTBkOGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGVyZi9yaXNj
dl9wbXVfc2JpLmMKKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwpAQCAtMjEsNiAr
MjEsMjUgQEAKICNpbmNsdWRlIDxhc20vc2JpLmg+CiAjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+CiAK
K1BNVV9GT1JNQVRfQVRUUihldmVudCwgImNvbmZpZzowLTYyIik7CitQTVVfRk9STUFUX0FUVFIo
ZmlybXdhcmUsICJjb25maWc6NjMtNjMiKTsKKworc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKnJp
c2N2X2FyY2hfZm9ybWF0c19hdHRyW10gPSB7CisJJmZvcm1hdF9hdHRyX2V2ZW50LmF0dHIsCisJ
JmZvcm1hdF9hdHRyX2Zpcm13YXJlLmF0dHIsCisJTlVMTCwKK307CisKK3N0YXRpYyBzdHJ1Y3Qg
YXR0cmlidXRlX2dyb3VwIHJpc2N2X3BtdV9mb3JtYXRfZ3JvdXAgPSB7CisJLm5hbWUgPSAiZm9y
bWF0IiwKKwkuYXR0cnMgPSByaXNjdl9hcmNoX2Zvcm1hdHNfYXR0ciwKK307CisKK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICpyaXNjdl9wbXVfYXR0cl9ncm91cHNbXSA9IHsK
KwkmcmlzY3ZfcG11X2Zvcm1hdF9ncm91cCwKKwlOVUxMLAorfTsKKwogdW5pb24gc2JpX3BtdV9j
dHJfaW5mbyB7CiAJdW5zaWduZWQgbG9uZyB2YWx1ZTsKIAlzdHJ1Y3QgewpAQCAtNzIwLDYgKzcz
OSw3IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIAkJcG11LT5wbXUuY2FwYWJpbGl0aWVzIHw9IFBFUkZfUE1VX0NBUF9OT19J
TlRFUlJVUFQ7CiAJCXBtdS0+cG11LmNhcGFiaWxpdGllcyB8PSBQRVJGX1BNVV9DQVBfTk9fRVhD
TFVERTsKIAl9CisJcG11LT5wbXUuYXR0cl9ncm91cHMgPSByaXNjdl9wbXVfYXR0cl9ncm91cHM7
CiAJcG11LT5udW1fY291bnRlcnMgPSBudW1fY291bnRlcnM7CiAJcG11LT5jdHJfc3RhcnQgPSBw
bXVfc2JpX2N0cl9zdGFydDsKIAlwbXUtPmN0cl9zdG9wID0gcG11X3NiaV9jdHJfc3RvcDsKLS0g
CjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
