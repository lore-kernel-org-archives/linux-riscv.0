Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C81C7EE31
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpbaqgTErJjY0NPHj8pIQ4Dj/yJM29JsniqFpfAyfMU=; b=N3qYMjluV8mlAh
	HmyRiYbcZNXwVA60Ns2Tu4gx7fQNhymyzj5nDGIMQCxZyJFhfDH07eWIHeQNn6EI1IGyXCfjLWBjS
	+iXCXiTPjgapxWYqp50VQpVGCnOxvP6fdO9M5Xjrn2E70G7tccQqqFjtncfEPmCk0zdBuEG2ANFZC
	Nn9p/DrKG7xWJ1OJMG5lNLgjyVOZ5wc9YPKlhKAc8cZe0G1yIrkxsD6ifVtnZqhZngb3jajO8TB4Y
	VdUScPakHyXnODTi45t34yFgIq1ftJyJBTIlfiEz/M9lI4UJooEErcCfDy4aaSMCo/5g7avS6RyZi
	wgusrLRZ3n+wjOpHOTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUy-003Vfs-0F;
	Sun, 21 May 2023 09:37:08 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0fUr-003VcC-0g
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 09:37:02 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661804;
	bh=OtZaR9VeuPmOojjtUgQSBdMGO5O2wKJgryXGtmTqRzI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qhrhQOOMS89DvZWNK5Af0kDzvUeY+vJnHje0Yv/lqShv8qVQxvPu7lLqOxLdaHDbb
	 yg7wwTACqQ699CQiFqiHYVuIpHZfQMKuNwT2AyogjeH4mqTU1vmIvrxFgkdbLkNxF/
	 nsk2legjwR2ozCkPxi3xQjS0XL+LYgRhmOHn0l14=
Date: Sun, 21 May 2023 11:36:35 +0200
Subject: [PATCH 7/7] tools/nolibc: simplify stackprotector compiler flags
MIME-Version: 1.0
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-7-dad6c80c51c1@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=1698;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=OtZaR9VeuPmOojjtUgQSBdMGO5O2wKJgryXGtmTqRzI=;
 b=DomoIsmXsRZwQWk0ScmwjLFDuu1dnN26YCXUzo34GqOdYuAtwSgkUrabKkFdr4rSI27UuPoCc
 06iKjlgljDsC3ma9RvH/A7hClYqSQSwPisv/goaAeqLfKemkx+wOWfn
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_023701_437966_ACBF1BB0 
X-CRM114-Status: UNSURE (   7.09  )
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

Tm93IHRoYXQgbm9saWJjIGVuYWJsZSBzdGFja3Byb3RlY3RvciBzdXBwb3J0IGF1dG9tYXRpY2Fs
bHkgd2hlbiB0aGUKY29tcGlsZXIgZW5hYmxlcyBpdCB3ZSBvbmx5IGhhdmUgdG8gZ2V0IHRoZSAt
ZnN0YWNrLXByb3RlY3RvciBmbGFncwpjb3JyZWN0LgoKVGhlIGNjLW9wdGlvbnMgYXJlIHN0cnVj
dHVyZWQgc28gdGhhdCAtZnN0YWNrLXByb3RlY3Rvci1hbGwgaXMgb25seQplbmFibGVkIGlmIC1t
c3RhY2stcHJvdGVjdG9yPWd1YXJkIHdvcmtzLCBhcyB0aGF0IGlzIHRoZSBvbmx5IG1vZGUKc3Vw
cG9ydGVkIGJ5IG5vbGliYy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51
eEB3ZWlzc3NjaHVoLm5ldD4KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFr
ZWZpbGUgfCAxMyArKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9u
b2xpYmMvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUK
aW5kZXggYmQ0MTEwMmVhMjk5Li40NDVjMzUyYjFiMzMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9ub2xpYmMvTWFrZWZpbGUKQEAgLTc2LDIwICs3NiwxMSBAQCBlbHNlCiBRPUAKIGVuZGlmCiAK
LUNGTEFHU19TVEFDS1BST1RFQ1RPUiA9IC1ETk9MSUJDX1NUQUNLUFJPVEVDVE9SIFwKLQkJCSQo
Y2FsbCBjYy1vcHRpb24sLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQ9Z2xvYmFsKSBcCi0JCQkkKGNh
bGwgY2Mtb3B0aW9uLC1mc3RhY2stcHJvdGVjdG9yLWFsbCkKLUNGTEFHU19TVEtQX2kzODYgPSAk
KENGTEFHU19TVEFDS1BST1RFQ1RPUikKLUNGTEFHU19TVEtQX3g4Nl82NCA9ICQoQ0ZMQUdTX1NU
QUNLUFJPVEVDVE9SKQotQ0ZMQUdTX1NUS1BfeDg2ID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1Ip
Ci1DRkxBR1NfU1RLUF9hcm02NCA9ICQoQ0ZMQUdTX1NUQUNLUFJPVEVDVE9SKQotQ0ZMQUdTX1NU
S1BfYXJtID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1IpCi1DRkxBR1NfU1RLUF9taXBzID0gJChD
RkxBR1NfU1RBQ0tQUk9URUNUT1IpCi1DRkxBR1NfU1RLUF9yaXNjdiA9ICQoQ0ZMQUdTX1NUQUNL
UFJPVEVDVE9SKQotQ0ZMQUdTX1NUS1BfbG9vbmdhcmNoID0gJChDRkxBR1NfU1RBQ0tQUk9URUNU
T1IpCitDRkxBR1NfU1RBQ0tQUk9URUNUT1IgPSAkKGNhbGwgY2Mtb3B0aW9uLC1tc3RhY2stcHJv
dGVjdG9yLWd1YXJkPWdsb2JhbCAtZnN0YWNrLXByb3RlY3Rvci1hbGwpCiBDRkxBR1NfczM5MCA9
IC1tNjQKIENGTEFHUyAgPz0gLU9zIC1mbm8taWRlbnQgLWZuby1hc3luY2hyb25vdXMtdW53aW5k
LXRhYmxlcyAtc3RkPWM4OSBcCiAJCSQoY2FsbCBjYy1vcHRpb24sLWZuby1zdGFjay1wcm90ZWN0
b3IpIFwKKwkJJChjYWxsIGNjLW9wdGlvbiwtbXN0YWNrLXByb3RlY3Rvci1ndWFyZD1nbG9iYWwg
JChjYWxsIGNjLW9wdGlvbiwtZnN0YWNrLXByb3RlY3Rvci1hbGwpKSBcCiAJCSQoQ0ZMQUdTX1NU
S1BfJChBUkNIKSkgJChDRkxBR1NfJChBUkNIKSkKIExERkxBR1MgOj0gLXMKIAoKLS0gCjIuNDAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
