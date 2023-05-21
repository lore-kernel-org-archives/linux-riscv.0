Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD4EC7EE2D
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Plc+NnQhunGuVMLW9ALH8zUZ3L8Jfh9bL/v+ftvflAs=; b=NNXyx4U7Ji1uEY
	duiNfg5oPAwxnSRqMb0jtYPLMtOEcJYy3QAWSJVnmxfwR1Hw7/861OSeDU3MiQoL5DKKx9jdTHcPA
	3aDO2LW6aXrHByYr8rOXM9qD6SOVlzd8C4VZeZFaEwVUXxz9t4V4j2QSVLo2WR4OIn7z3V3Cf4z9V
	m5FJawTDb7WfzWkT2NyPZr5L9Q/wXgwGWFwOydEbBCVAzvyFq35Fgro7fUtJ/0vArNeNR8loV+lxa
	p6UN6D6eHu5cPSyHhtmG0PLJBYcY0alu+YaXyIELtU8nCAiRL3Y5Lxi3FeZR9nUIysC+iWwUDZhA7
	jQSzL7tjluP5KRBJiQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUx-003VfM-1d;
	Sun, 21 May 2023 09:37:07 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUr-003VcB-0g
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:37:02 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661803;
	bh=KkdsW9VXfNNBI6sP0ntlx33DPNCyB2uOxDEqiGEf2wU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RdpfqaQoyGQXLZ4oSh4gSS+fa4ntLUJSJ+BTBwKdA+ZohbITgg7DP4w6h/Rvnfq5R
	 Lqo4qICVTQGNvwcYUitfO7CRTCoMDHx64OoX/jV66bQOrbJAPUmtIZAXOe8dJtAvP1
	 LFr5kgG6Vu554SvJ2nNgIFHASIJgCCWujtCD4Ak8=
Date: Sun, 21 May 2023 11:36:33 +0200
Subject: [PATCH 5/7] tools/nolibc: reformat list of headers to be installed
MIME-Version: 1.0
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-5-dad6c80c51c1@weissschuh.net>
References: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
In-Reply-To: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=1064;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=KkdsW9VXfNNBI6sP0ntlx33DPNCyB2uOxDEqiGEf2wU=;
 b=HmqDEXUj86k+sCTx7kSFyyZmSkwOFjknXc2XT/iZXgF9ShYYJ+3e3o9ak9JftRvYgatJUZAZ9
 erlY0GjTc2QCCoJU5J7KOTchwQ0j6e0q00Qivlm5cdviCW8McaI2uSo
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_023701_444865_D3F45E6B 
X-CRM114-Status: UNSURE (   6.42  )
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

VGhpcyBtYWtlcyBpdCBlYXNpZXIgdG8gYWRkIGFuZCByZW1vdmUgbW9yZSBlbnRyaWVzIGluIHRo
ZSBmdXR1cmUKd2l0aG91dCBjcmVhdGluZyBzcHVyaW91cyBkaWZmIGh1bmtzLgoKU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgotLS0KIHRvb2xz
L2luY2x1ZGUvbm9saWJjL01ha2VmaWxlIHwgMTggKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
b29scy9pbmNsdWRlL25vbGliYy9NYWtlZmlsZSBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL01ha2Vm
aWxlCmluZGV4IDk4MzlmZWFmZDM4YS4uZTM3YzNhYzg2ZTIzIDEwMDY0NAotLS0gYS90b29scy9p
bmNsdWRlL25vbGliYy9NYWtlZmlsZQorKysgYi90b29scy9pbmNsdWRlL25vbGliYy9NYWtlZmls
ZQpAQCAtMjUsOCArMjUsMjIgQEAgZW5kaWYKIAogbm9saWJjX2FyY2ggOj0gJChwYXRzdWJzdCBh
cm02NCxhYXJjaDY0LCQoQVJDSCkpCiBhcmNoX2ZpbGUgOj0gYXJjaC0kKG5vbGliY19hcmNoKS5o
Ci1hbGxfZmlsZXMgOj0gY3R5cGUuaCBlcnJuby5oIG5vbGliYy5oIHNpZ25hbC5oIHN0YWNrcHJv
dGVjdG9yLmggc3RkLmggc3RkaW50LmggXAotICAgICAgICAgICAgIHN0ZGlvLmggc3RkbGliLmgg
c3RyaW5nLmggc3lzLmggdGltZS5oIHR5cGVzLmggdW5pc3RkLmgKK2FsbF9maWxlcyA6PSBcCisJ
CWN0eXBlLmggXAorCQllcnJuby5oIFwKKwkJbm9saWJjLmggXAorCQlzaWduYWwuaCBcCisJCXN0
YWNrcHJvdGVjdG9yLmggXAorCQlzdGQuaCBcCisJCXN0ZGludC5oIFwKKwkJc3RkbGliLmggXAor
CQlzdHJpbmcuaCBcCisJCXN5cy5oIFwKKwkJdGltZS5oIFwKKwkJdHlwZXMuaCBcCisJCXVuaXN0
ZC5oIFwKKwkJc3RkaW8uaCBcCisKIAogIyBpbnN0YWxsIGFsbCBoZWFkZXJzIG5lZWRlZCB0byBz
dXBwb3J0IGEgYmFyZS1tZXRhbCBjb21waWxlcgogYWxsOiBoZWFkZXJzCgotLSAKMi40MC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
