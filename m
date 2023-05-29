Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D056DC77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5qmuDO6amcYw29BxoHlqDyWCa8GEham7UEBUrko2oU=; b=Tm2rA6yNt//X9s
	wmvV6/f1HT+HFWch8EikaFq99rNP1RN+fhlEUzNHwmjV6XOJ+w8srVe/uzoYCsg4ky7aQwIQkTox/
	6xMnCqpYcO53rMGDCp4I2omfGk7HJ9lYZiSYJIEbU6SagjIdItfF7wEiXJ2X0J2Z98doE8Wakevfs
	BSrv7+Og8TGIh48mFFyNw/JmoeAgpoqJYX697b0cV2E6Phewu2nyvfDZkBxoWfrm4URHYe9lUFcp9
	Rh2lBoCZcZL1bJAqrSMrMqNC0IXU2X2umBZZQKRaXFn7pozI+GMo4ikQ9AdE+1L1COBhyPzVE/VWw
	j4fuwLhl1rt+evLEdaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cWG-00AWXC-2k;
	Mon, 29 May 2023 13:02:40 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cWD-00AWVb-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 13:02:39 +0000
X-QQ-mid: bizesmtp87t1685365342tgfgvsv1
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 May 2023 21:02:21 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: +oIWmpEafD/1SqjkUeuYFcNqK90OlfDLXNiAJ5k1Wnyer2qCp/+ny5nDVHYkd
	cX1xZFAq9ucrpyANdNe8Io272fJ0+PuH2kL6v47R6n0t83tJ+VBGkAEef0GGZCPQZ0Q28n8
	xezzkkkTRBZ9aLiQwOpMOJPSPD1OfcZ/9CIOqAStBW+TL2qDVJh+bhoNE5vKC0YNcoKjMm6
	8rtZojZxswijly3RzFGLsCkIByPwcZPFkmXTZUVdbBRpsn7nEAOjI+pUkIUPLoyVIN3/y8O
	EqCiltl4ViNyfeFXt2VEKAiPet7iQ3B+/RfP1fk8phhdGDurokqvXrXWvFbgfyAttU3XYMx
	nhdeFkFQ7oVRIqk/E13oeHTi0HecHF8FK6+Hu5UdmujjQ2GmeCzZhnok3wJ05JEOH7k+32v
	zEIyK0zQY3k=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9933290494645403043
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 4/7] selftests/nolibc: not include limits.h for nolibc
Date: Mon, 29 May 2023 21:02:15 +0800
Message-Id: <14a6240d3e5b50760b70d42e9b502e9716c7f2e3.1685362482.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685362482.git.falcon@tinylab.org>
References: <cover.1685362482.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_060237_511454_D4A7BFBA 
X-CRM114-Status: GOOD (  10.83  )
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

V2hlbiBjb21waWxlIG5vbGliYy10ZXN0LmMgd2l0aCAyLjMxIGdsaWJjLCB3ZSBnb3Qgc3VjaCBl
cnJvcjoKCiAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Vzci9yaXNjdjY0LWxpbnV4LWdudS9p
bmNsdWRlL3N5cy9jZGVmcy5oOjQ1MiwKICAgICAgICAgICAgICAgICAgICAgZnJvbSAvdXNyL3Jp
c2N2NjQtbGludXgtZ251L2luY2x1ZGUvZmVhdHVyZXMuaDo0NjEsCiAgICAgICAgICAgICAgICAg
ICAgIGZyb20gL3Vzci9yaXNjdjY0LWxpbnV4LWdudS9pbmNsdWRlL2JpdHMvbGliYy1oZWFkZXIt
c3RhcnQuaDozMywKICAgICAgICAgICAgICAgICAgICAgZnJvbSAvdXNyL3Jpc2N2NjQtbGludXgt
Z251L2luY2x1ZGUvbGltaXRzLmg6MjYsCiAgICAgICAgICAgICAgICAgICAgIGZyb20gL3Vzci9s
aWIvZ2NjLWNyb3NzL3Jpc2N2NjQtbGludXgtZ251LzkvaW5jbHVkZS9saW1pdHMuaDoxOTQsCiAg
ICAgICAgICAgICAgICAgICAgIGZyb20gL3Vzci9saWIvZ2NjLWNyb3NzL3Jpc2N2NjQtbGludXgt
Z251LzkvaW5jbHVkZS9zeXNsaW1pdHMuaDo3LAogICAgICAgICAgICAgICAgICAgICBmcm9tIC91
c3IvbGliL2djYy1jcm9zcy9yaXNjdjY0LWxpbnV4LWdudS85L2luY2x1ZGUvbGltaXRzLmg6MzQs
CiAgICAgICAgICAgICAgICAgICAgIGZyb20gL2xhYnMvbGludXgtbGFiL3NyYy9saW51eC1zdGFi
bGUvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmM6NjoKICAgIC91
c3IvcmlzY3Y2NC1saW51eC1nbnUvaW5jbHVkZS9iaXRzL3dvcmRzaXplLmg6Mjg6MzogZXJyb3I6
ICNlcnJvciAicnYzMmktYmFzZWQgdGFyZ2V0cyBhcmUgbm90IHN1cHBvcnRlZCIKICAgICAgIDI4
IHwgIyBlcnJvciAicnYzMmktYmFzZWQgdGFyZ2V0cyBhcmUgbm90IHN1cHBvcnRlZCIKCkdsaWJj
ICg+PSAyLjMzKSBjb21taXQgNWI2MTEzZDYyZWZhICgiUklTQy1WOiBTdXBwb3J0IHRoZSAzMi1i
aXQgQUJJCmltcGxlbWVudGF0aW9uIikgZml4ZWQgdXAgYWJvdmUgZXJyb3IuCgpBcyBzdWdnZXN0
ZWQgYnkgVGhvbWFzLCBkZWZpbmluZyBJTlRfTUlOL0lOVF9NQVggZm9yIG5vbGliYyBjYW4gcmVt
b3ZlCnRoZSBpbmNsdWRpbmcgb2YgbGltaXRzLmgsIGFuZCB0aGVyZWZvcmUgbm8gYWJvdmUgZXJy
b3IuIG9mIGNvdXJzZSwgdGhlCm90aGVyIGxpYmNzIHN0aWxsIHJlcXVpcmUgbGltaXRzLmgsIG1v
dmUgaXQgdG8gdGhlIHJpZ2h0IHBsYWNlLgoKVGhlIExPTkdfTUlOL0xPTkdfTUFYIGFyZSBhbHNv
IGRlZmluZWQgdG9vLgoKU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vp
c3NzY2h1aC5uZXQ+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIw
MjMwNTI0MTgyNDMxLjI2ODkwOC0xLWZhbGNvbkB0aW55bGFiLm9yZy9ULyMKU2lnbmVkLW9mZi1i
eTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4KLS0tCiB0b29scy9pbmNsdWRlL25v
bGliYy9zdGRpbnQuaCAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCiB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYyB8ICA0ICstLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
b29scy9pbmNsdWRlL25vbGliYy9zdGRpbnQuaCBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N0ZGlu
dC5oCmluZGV4IGMxY2U0ZjVlMDYwMy4uMzFhNTI2NDUzOWFlIDEwMDY0NAotLS0gYS90b29scy9p
bmNsdWRlL25vbGliYy9zdGRpbnQuaAorKysgYi90b29scy9pbmNsdWRlL25vbGliYy9zdGRpbnQu
aApAQCAtOTYsNCArOTYsMTggQEAgdHlwZWRlZiB1aW50NjRfdCAgICAgICAgICB1aW50bWF4X3Q7
CiAjZGVmaW5lIFVJTlRfRkFTVDMyX01BWCAgU0laRV9NQVgKICNkZWZpbmUgVUlOVF9GQVNUNjRf
TUFYICBTSVpFX01BWAogCisjaWZuZGVmIElOVF9NSU4KKyNkZWZpbmUgSU5UX01JTiAgICAgICAg
ICAoLV9fSU5UX01BWF9fIC0gMSkKKyNlbmRpZgorI2lmbmRlZiBJTlRfTUFYCisjZGVmaW5lIElO
VF9NQVggICAgICAgICAgX19JTlRfTUFYX18KKyNlbmRpZgorCisjaWZuZGVmIExPTkdfTUlOCisj
ZGVmaW5lIExPTkdfTUlOICAgICAgICAgKC1fX0xPTkdfTUFYX18gLSAxKQorI2VuZGlmCisjaWZu
ZGVmIExPTkdfTUFYCisjZGVmaW5lIExPTkdfTUFYICAgICAgICAgX19MT05HX01BWF9fCisjZW5k
aWYKKwogI2VuZGlmIC8qIF9OT0xJQkNfU1RESU5UX0ggKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMKaW5kZXggN2Y5YjcxNmZkOWIxLi5lNzVjZTZiNjg1
NjUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVz
dC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCkBA
IC0yLDkgKzIsNiBAQAogCiAjZGVmaW5lIF9HTlVfU09VUkNFCiAKLS8qIHBsYXRmb3JtLXNwZWNp
ZmljIGluY2x1ZGUgZmlsZXMgY29taW5nIGZyb20gdGhlIGNvbXBpbGVyICovCi0jaW5jbHVkZSA8
bGltaXRzLmg+Ci0KIC8qIGxpYmMtc3BlY2lmaWMgaW5jbHVkZSBmaWxlcwogICogVGhlIHByb2dy
YW0gbWF5IGJlIGJ1aWx0IGluIDMgd2F5czoKICAqICAgJChDQykgLW5vc3RkbGliIC1pbmNsdWRl
IC9wYXRoL3RvL25vbGliYy5oID0+IE5PTElCQyBhbHJlYWR5IGRlZmluZWQKQEAgLTM5LDYgKzM2
LDcgQEAKICNpbmNsdWRlIDxzdGRkZWYuaD4KICNpbmNsdWRlIDxzdGRpbnQuaD4KICNpbmNsdWRl
IDx1bmlzdGQuaD4KKyNpbmNsdWRlIDxsaW1pdHMuaD4KICNlbmRpZgogI2VuZGlmCiAKLS0gCjIu
MjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
