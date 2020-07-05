Return-Path: <SRS0=/pGw=AQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6206C433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 06:25:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A67207CD
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 06:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YkHBmshg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBJqT+/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72A67207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eK+A9FfjjnkJgFpb5zznSa/WukcsbI4XAyGygPeQZcg=; b=YkHBmshgVg+4ZHLFCxoSFh/HT7
	li21eKvP0VUD7L9c7A5v6kh6BGx0K8t2mji5OhlNWDPzgsx+omFOoJEOdwoqmelC3IC9e9l/pTwyk
	tt/+MB9USWDCbYCfFOMO3fVOQQJf+aaKTitAdF4qo1it/qH/vG6iE0i2Eiw3+9vkjet2kwRYkqDWg
	gpTftH4CKOyRiJzyOf9h4O0ZTbWSEbk4Z80VkGTtx32KU6jtEQC2UlnUVG/TVoybI4nwBNOtZWRDo
	9eBK0M+U5XjG3kWvJeepXCi9jyFDytHnwkO9EWQg5U+4KG2VydazRlphcai6jTyrpiMKnhIpDyRPd
	W0ejAyBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jry5g-0005G7-4Z; Sun, 05 Jul 2020 06:25:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jry5c-0005Fn-70
 for linux-riscv@lists.infradead.org; Sun, 05 Jul 2020 06:25:25 +0000
Received: from localhost.localdomain (unknown [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58031207CD;
 Sun,  5 Jul 2020 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593930322;
 bh=j/k1+B7wkCi8TSTAT6vwsg8IilF6kwnCgtC2Tyh8esI=;
 h=From:To:Cc:Subject:Date:From;
 b=IBJqT+/t6RF8oJE4tYJNDhNag1zBFY9YGGFiI1+roc5OKJAHNR5pHc67IMt+86PSL
 ffzMSMcJL7BhRaBnmK6iWQMIWGEZ6PFlG4cjwTyDRkSKnoE9B9eU5YwUiZ25uVceED
 BNA61f5ly40MihKlN4cTxwu+idkiuLAZ5hqt36Mc=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, guoren@kernel.org
Subject: [PATCH] riscv: Add STACKPROTECTOR supported
Date: Sun,  5 Jul 2020 06:24:15 +0000
Message-Id: <1593930255-12378-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_022524_484642_5E86B4D0 
X-CRM114-Status: GOOD (  14.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-riscv@lists.infradead.org,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVGhlIC1mc3RhY2stcHJv
dGVjdG9yICYgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIGZlYXR1cmVzIGFyZSBmcm9tCmdjYy4g
VGhlIHBhdGNoIG9ubHkgYWRkIGJhc2ljIGtlcm5lbCBzdXBwb3J0IHRvIHN0YWNrLXByb3RlY3Rv
cgpmZWF0dXJlIGFuZCBzb21lIGFyY2ggY291bGQgaGF2ZSBpdHMgb3duIHNvbHV0aW9uIHN1Y2gg
YXMKQVJNNjRfUFRSX0FVVEguCgpBZnRlciBlbmFibGluZyBTVEFDS1BST1RFQ1RPUiBhbmQgU1RB
Q0tQUk9URUNUT1JfU1RST05HLCB0aGUgLnRleHQKc2l6ZSBpcyBleHBhbmRlZCBmcm9tICAweDdk
ZTA2NiB0byAweDgxZmIzMiAob25seSA1JSkgdG8gYWRkIGNhbmFyeQpjaGVja2luZyBjb2RlLgoK
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgpDYzogUGF1
bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgpDYzogUGFsbWVyIERhYmJlbHQg
PHBhbG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KQ2M6IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2Vs
ZXkuZWR1PgpDYzogTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4KQ2M6IEJq
w7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KQ2M6IEdyZWVudGltZSBIdSA8Z3Jl
ZW4uaHVAZ21haWwuY29tPgpDYzogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+Ci0t
LQogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zdGFja3Byb3RlY3Rvci5oIHwgMjkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICAgICB8ICA2
ICsrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdGFja3Byb3RlY3Rvci5oCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IGY5MjdhOTEu
LjRiMGUzMDggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2
L0tjb25maWcKQEAgLTYzLDYgKzYzLDcgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0IEhBVkVfUEVS
Rl9FVkVOVFMKIAlzZWxlY3QgSEFWRV9QRVJGX1JFR1MKIAlzZWxlY3QgSEFWRV9QRVJGX1VTRVJf
U1RBQ0tfRFVNUAorCXNlbGVjdCBIQVZFX1NUQUNLUFJPVEVDVE9SCiAJc2VsZWN0IEhBVkVfU1lT
Q0FMTF9UUkFDRVBPSU5UUwogCXNlbGVjdCBJUlFfRE9NQUlOCiAJc2VsZWN0IE1PRFVMRVNfVVNF
X0VMRl9SRUxBIGlmIE1PRFVMRVMKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c3RhY2twcm90ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2twcm90ZWN0b3Iu
aApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4uNTk2MmY4OAotLS0gL2Rldi9u
dWxsCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2twcm90ZWN0b3IuaApAQCAtMCww
ICsxLDI5IEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworCisjaWZu
ZGVmIF9BU01fUklTQ1ZfU1RBQ0tQUk9URUNUT1JfSAorI2RlZmluZSBfQVNNX1JJU0NWX1NUQUNL
UFJPVEVDVE9SX0gKKworI2luY2x1ZGUgPGxpbnV4L3JhbmRvbS5oPgorI2luY2x1ZGUgPGxpbnV4
L3ZlcnNpb24uaD4KKworZXh0ZXJuIHVuc2lnbmVkIGxvbmcgX19zdGFja19jaGtfZ3VhcmQ7CisK
Ky8qCisgKiBJbml0aWFsaXplIHRoZSBzdGFja3Byb3RlY3RvciBjYW5hcnkgdmFsdWUuCisgKgor
ICogTk9URTogdGhpcyBtdXN0IG9ubHkgYmUgY2FsbGVkIGZyb20gZnVuY3Rpb25zIHRoYXQgbmV2
ZXIgcmV0dXJuLAorICogYW5kIGl0IG11c3QgYWx3YXlzIGJlIGlubGluZWQuCisgKi8KK3N0YXRp
YyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBib290X2luaXRfc3RhY2tfY2FuYXJ5KHZvaWQpCit7CisJ
dW5zaWduZWQgbG9uZyBjYW5hcnk7CisKKwkvKiBUcnkgdG8gZ2V0IGEgc2VtaSByYW5kb20gaW5p
dGlhbCB2YWx1ZS4gKi8KKwlnZXRfcmFuZG9tX2J5dGVzKCZjYW5hcnksIHNpemVvZihjYW5hcnkp
KTsKKwljYW5hcnkgXj0gTElOVVhfVkVSU0lPTl9DT0RFOworCWNhbmFyeSAmPSBDQU5BUllfTUFT
SzsKKworCWN1cnJlbnQtPnN0YWNrX2NhbmFyeSA9IGNhbmFyeTsKKwlfX3N0YWNrX2Noa19ndWFy
ZCA9IGN1cnJlbnQtPnN0YWNrX2NhbmFyeTsKK30KKyNlbmRpZiAvKiBfQVNNX1JJU0NWX1NUQUNL
UFJPVEVDVE9SX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwppbmRleCA4MjRkMTE3Li42NTQ4OTI5IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvY2Vzcy5jCkBAIC0yNCw2ICsyNCwxMiBAQAogCiByZWdpc3RlciB1bnNpZ25lZCBsb25n
IGdwX2luX2dsb2JhbCBfX2FzbV9fKCJncCIpOwogCisjaWZkZWYgQ09ORklHX1NUQUNLUFJPVEVD
VE9SCisjaW5jbHVkZSA8bGludXgvc3RhY2twcm90ZWN0b3IuaD4KK3Vuc2lnbmVkIGxvbmcgX19z
dGFja19jaGtfZ3VhcmQgX19yZWFkX21vc3RseTsKK0VYUE9SVF9TWU1CT0woX19zdGFja19jaGtf
Z3VhcmQpOworI2VuZGlmCisKIGV4dGVybiBhc21saW5rYWdlIHZvaWQgcmV0X2Zyb21fZm9yayh2
b2lkKTsKIGV4dGVybiBhc21saW5rYWdlIHZvaWQgcmV0X2Zyb21fa2VybmVsX3RocmVhZCh2b2lk
KTsKIAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
