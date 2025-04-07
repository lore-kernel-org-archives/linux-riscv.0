Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BD8C3601E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 08:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cUk+G32jqMRV3dWjlp4yHkOCCpIL7pnKdwLzeelFWmQ=; b=RRq5hdmdER8x1/
	47Q1anhpRAmFWnCXDWoDmdatw11sVkKBfsowmKk/bVAL1LNDOTxNUuf+HoFIM/VDEFsQFocruz0eA
	mStDdNImeTEGLEWSGbzQdsk6rgz2KMRTrWA3gzb0xYuebWE2OSk5Fnqe+lq+hYuL1J19zqbLorVDW
	2tSxulqPfkLKAhEomNduwt6kySSfJfHEBBTiRzPVfaBtNaOOcXcKK+apet7ukKexfLC5kp+c2gv0A
	rtz4Q/znW+kqWHEnky+C7cqepztHMnBlcW/gl/q/lf8TyiJu9DG8mFzlbcvT4nvNQZYZKQxTkTQQ/
	z7KyehaQy55jNuZeuuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hfW-0000000GyKi-14XN;
	Mon, 07 Apr 2025 08:17:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hfT-0000000GyJP-2n17
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 08:17:20 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744013837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LRRqqDf5eRm9UY2ySLl8NfedyATgHvg1H7iEDSJ0ycc=;
	b=m3Z5iJpuYrynycuOdwMwtdchgKooRgmFeylRNRU50v7DHDcBglteB2O1iSiQxDmdOzlzXf
	oorE5onEm8UB/tZdsnIfytqhsT3D0toVuljkKrG/UAks9qcX2LI/fe4uENhsT2HpSjkmJ7
	lYXik/Wbot1yR966QQL+EZw6mGoKGmPUEWlv2FkuRz/RjyPwANwqjfx4Yhb078jFEtYMId
	+vrImlp1KjZq9KdO/iY1E2E4Ha5rVfsMyRz0XpFYZdlx1XFPmJElpAw6CqbywUekzFbXhY
	KOxzseuL0giHjFqiWyaiw5VLKHKQP/FWi72rBTtaG86uMAUEUDVRfaGXEiWVkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744013837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LRRqqDf5eRm9UY2ySLl8NfedyATgHvg1H7iEDSJ0ycc=;
	b=u5AOf/1QrA+oawC9BV7QfV3Ys7W08xlt78f8xugqAcNvnzIwtCnSU2cTkAwAtIqZx+dwJr
	bRTgP+jeMHY1nKAA==
Date: Mon, 07 Apr 2025 10:17:12 +0200
Subject: [PATCH] kunit: qemu_configs: Add riscv32 config
MIME-Version: 1.0
Message-Id: <20250407-kunit-qemu-riscv32-v1-1-7b9800034a35@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAeK82cC/x3MTQ5AMBBA4avIrE1Cq/6uIhbUYCKKFpFI766x/
 BbvveDIMjmooxcs3ex4MwFpHIGeOzMR8hAMIhEqEWmGy2X4xIPWCy07fUuBYy/LIVeVloWEEO6
 WRn7+adN6/wH6hbAmZAAAAA==
X-Change-ID: 20250214-kunit-qemu-riscv32-fb38d659c373
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744013835; l=1201;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gbysyKBOdCV3nUg/YKqG1+5R+VB32jV/H2TWXw3+gcs=;
 b=ivXyuLLqrfsTSNfdX6xuJhHok80gVC77JW5uLTwal3CM0fd6qLJ9nNBFcuesNNTqV2fLmQ4jl
 xBFGtgjwJvmA/NwLeevEIdZSzL/vJPUNKK/5rdMl84CPaRA3WHGC8Y+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_011719_841688_2875F080 
X-CRM114-Status: UNSURE (   6.72  )
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

QWRkIGEgYmFzaWMgY29uZmlnIHRvIHJ1biBrdW5pdCB0ZXN0cyBvbiByaXNjdjMyLgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXgu
ZGU+Ci0tLQogdG9vbHMvdGVzdGluZy9rdW5pdC9xZW11X2NvbmZpZ3MvcmlzY3YzMi5weSB8IDE3
ICsrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcva3VuaXQvcWVtdV9jb25maWdzL3Jpc2N2MzIucHkgYi90
b29scy90ZXN0aW5nL2t1bml0L3FlbXVfY29uZmlncy9yaXNjdjMyLnB5Cm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmI3
OWJhMGFlMzBmODU3MzAzNWIzNDAxYmUzMzdiMzc5ZWJhOTdlMjYKLS0tIC9kZXYvbnVsbAorKysg
Yi90b29scy90ZXN0aW5nL2t1bml0L3FlbXVfY29uZmlncy9yaXNjdjMyLnB5CkBAIC0wLDAgKzEs
MTcgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKworZnJvbSAuLnFlbXVf
Y29uZmlnIGltcG9ydCBRZW11QXJjaFBhcmFtcworCitRRU1VX0FSQ0ggPSBRZW11QXJjaFBhcmFt
cyhsaW51eF9hcmNoPSdyaXNjdicsCisJCQkgICBrY29uZmlnPScnJworQ09ORklHX05PTlBPUlRB
QkxFPXkKK0NPTkZJR19BUkNIX1JWMzJJPXkKK0NPTkZJR19BUkNIX1ZJUlQ9eQorQ09ORklHX1NF
UklBTF84MjUwPXkKK0NPTkZJR19TRVJJQUxfODI1MF9DT05TT0xFPXkKK0NPTkZJR19TRVJJQUxf
T0ZfUExBVEZPUk09eQorJycnLAorCQkJICAgcWVtdV9hcmNoPSdyaXNjdjMyJywKKwkJCSAgIGtl
cm5lbF9wYXRoPSdhcmNoL3Jpc2N2L2Jvb3QvSW1hZ2UnLAorCQkJICAga2VybmVsX2NvbW1hbmRf
bGluZT0nY29uc29sZT10dHlTMCcsCisJCQkgICBleHRyYV9xZW11X3BhcmFtcz1bJy1tYWNoaW5l
JywgJ3ZpcnQnXSkKCi0tLQpiYXNlLWNvbW1pdDogMGFmMmY2YmUxYjQyODEzODViNjE4Y2I4NmFk
OTQ2ZWRlZDA4OWFjOApjaGFuZ2UtaWQ6IDIwMjUwMjE0LWt1bml0LXFlbXUtcmlzY3YzMi1mYjM4
ZDY1OWMzNzMKCkJlc3QgcmVnYXJkcywKLS0gClRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vp
c3NzY2h1aEBsaW51dHJvbml4LmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
