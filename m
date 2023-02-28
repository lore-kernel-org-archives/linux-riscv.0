Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE85AC6FA8E
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyohf6huQIdXReeCRkH70QZ/lIz52AeFaM6Xr3BhVw4=; b=ZMegdggu7XX+ju
	V8Q9YuLihQHkdBgP9YAhWogZtdFmcZ/PUXFI3lbps9DywA+sIr8ia6hGrR70cOmOugM1UUSpe8jwD
	UL9ntFCb+x/cLPDbg8BDyizC5ydv4H82wsQ2bybXaKACxcoVXK32W0r+oaTQ+Eq7OYNeuBSzyW+pl
	EVItvpgyV+28jQlC9UU0ymETMQsSigIN8MhmUzkklw83bWfzR2iJihltg+7fzRlyqEwkGEYmez6r7
	o8XRhqMi9MHxBWCTiDBZLujuJHm9kSbsJhi2/o4VlTA1dVbTne8ry/PEtjZfw1ekfWX9gMvKnoWmD
	2Do4VvyCy9f71X5QFeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4wF-00E0ay-4P; Tue, 28 Feb 2023 18:42:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX4wA-00E0ZB-Pd
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 18:42:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2746F6117F;
	Tue, 28 Feb 2023 18:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2CEC433EF;
	Tue, 28 Feb 2023 18:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677609773;
	bh=pidVvllSN1IUSrHAwpFFAwnr0Xfr4NblI3c7HbGX5aI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oc+8db52928eVh7Pnnftzyj4a4Sy5e1N4sO8tPy8jVCHNx3zmiRCl0acwKxQojVWK
	 MwtTQu99w1ZoQYaKfMOKZ7FHiP15oeYEpSQgLJdcxo/w1HwJnfodd+x0sHxkjV1QvT
	 3Pn+a52xCWNhRI3dMAnPw/ojXTXLRcDd2OD+sZqexcWQ1l8C7OsBFy4Ldh1Kr34w0c
	 2ZAl9oTcK6NjsmAjFKqLCGgh1HiM5p2LROt6xUtrlxa/e1cFXx4ek8E5AEb8D0g9U1
	 vif7EekWWmAE+yp2rRmezZQmwR5yEAmx2gm1K4w5wP1PlbRAmWzRAT+UYDlPmvOqxz
	 pmZ4hjWQqOb0A==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v2 2/2] lib/test_string.c: Add strncmp() tests
Date: Tue, 28 Feb 2023 19:42:45 +0100
Message-Id: <20230228184245.1585775-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230228184245.1585775-1-bjorn@kernel.org>
References: <20230228184245.1585775-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_104254_891964_8F27EA55 
X-CRM114-Status: GOOD (  15.81  )
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

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpUaGUgUklTQy1WIHN0
cm5jbXAoKSBmYWlscyBvbiBzb21lIGlucHV0cywgc2VlIHRoZSBsaW5rZWQgdGhyZWFkIGZvcgpt
b3JlIGRldGFpbHMuIEl0IHR1cm5zIG91dCB0aGVyZSB3ZXJlIG5vIHN0cm5jbXAoKSBjYWxscyBp
biB0aGUgc2VsZgp0ZXN0cywgdGhpcyBhZGRzIG9uZS4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yODAxMTYyLjg4Yk1RSmJGajZAZGllZ28vClJlcG9ydGVkLWJ5OiBIZWlrbyBT
dMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPgpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5A
cml2b3NpbmMuY29tPgotLS0KCnYxLT52MjogQWRkZWQgdHdvIG1vcmUgdGVzdHMgKHBvcy9uZWcp
LiAoQW5keSkKICAgICAgICBNaW5vciBjb2RlIHN0eWxlIGlzc3Vlcy4gKEFuZHkpCiAgICAgICAg
Rml4ZWQgY2hlY2twYXRjaCBlcnJvcnMuCgotLS0KbGliL3Rlc3Rfc3RyaW5nLmMgfCA0MyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi90ZXN0X3N0cmluZy5jIGIvbGliL3Rl
c3Rfc3RyaW5nLmMKaW5kZXggNTUwMjI5MDg0YzQxLi5iOTUwMzdlYjEzOGIgMTAwNjQ0Ci0tLSBh
L2xpYi90ZXN0X3N0cmluZy5jCisrKyBiL2xpYi90ZXN0X3N0cmluZy5jCkBAIC0yMDksNiArMjA5
LDQ0IEBAIHN0YXRpYyBfX2luaXQgaW50IHN0cnNwbl9zZWxmdGVzdCh2b2lkKQogCXJldHVybiAw
OwogfQogCitzdHJ1Y3Qgc3RybmNtcF90ZXN0IHsKKwljb25zdCBjaGFyICpzdHJfYTsKKwljb25z
dCBjaGFyICpzdHJfYjsKKwl1bnNpZ25lZCBsb25nIGNvdW50OworCXVuc2lnbmVkIGxvbmcgbWF4
X29mZjsKKwlpbnQgcmV0dmFsOworfTsKKworc3RhdGljIF9faW5pdCBpbnQgc3RybmNtcF9zZWxm
dGVzdCh2b2lkKQoreworCXNpemVfdCBpOworCXN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3RybmNtcF90
ZXN0IHRlc3RzW10gX19pbml0Y29uc3QgPSB7CisJCXsgIi9kZXYvdmRhIiwgIi9kZXYvIiwgNSwg
NCwgMCB9LAorCQl7ICIvZGV2L3ZkYSIsICIvZGV2L3ZkYiIsIDUsIDQsIDAgfSwKKwkJeyAiMDAw
MDAwMDAtLS0xMTExMSIsICIwMDAwMDAwMC0tLTExMTEyIiwgMTIsIDQsIDAgfSwKKwkJeyAiQUJD
IiwgIkFCIiwgMywgMCwgNjcgfSwKKwkJeyAiQUJBIiwgIkFCWiIsIDMsIDAsIC0yNSB9LAorCQl7
ICJBQkMiLCAiQUJDIiwgMywgMCwgMCB9LAorCX07CisKKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlf
U0laRSh0ZXN0cyk7ICsraSkgeworCQljb25zdCBzdHJ1Y3Qgc3RybmNtcF90ZXN0ICpzID0gdGVz
dHMgKyBpOworCQlzaXplX3Qgb2ZmOworCisJCWZvciAob2ZmID0gMDsgb2ZmIDw9IHMtPm1heF9v
ZmY7IG9mZisrKSB7CisJCQlpbnQgcmVzID0gc3RybmNtcChzLT5zdHJfYSArIG9mZiwgcy0+c3Ry
X2IgKyBvZmYsIHMtPmNvdW50IC0gb2ZmKTsKKworCQkJaWYgKHJlcyA9PSAwICYmIHMtPnJldHZh
bCAhPSAwKQorCQkJCXJldHVybiAweDEwMDAgKyAweDEwMCpvZmYgKyAweDEwKmkgKyAweDA7CisJ
CQlpZiAocmVzID4gMCAmJiBzLT5yZXR2YWwgPD0gMCkKKwkJCQlyZXR1cm4gMHgxMDAwICsgMHgx
MDAqb2ZmICsgMHgxMCppICsgMHgxOworCQkJaWYgKHJlcyA8IDAgJiYgcy0+cmV0dmFsID49IDAp
CisJCQkJcmV0dXJuIDB4MTAwMCArIDB4MTAwKm9mZiArIDB4MTAqaSArIDB4MjsKKwkJfQorCX0K
KwlyZXR1cm4gMDsKK30KKwogc3RhdGljIF9fZXhpdCB2b2lkIHN0cmluZ19zZWxmdGVzdF9yZW1v
dmUodm9pZCkKIHsKIH0KQEAgLTI0Nyw2ICsyODUsMTEgQEAgc3RhdGljIF9faW5pdCBpbnQgc3Ry
aW5nX3NlbGZ0ZXN0X2luaXQodm9pZCkKIAlpZiAoc3VidGVzdCkKIAkJZ290byBmYWlsOwogCisJ
dGVzdCA9IDc7CisJc3VidGVzdCA9IHN0cm5jbXBfc2VsZnRlc3QoKTsKKwlpZiAoc3VidGVzdCkK
KwkJZ290byBmYWlsOworCiAJcHJfaW5mbygiU3RyaW5nIHNlbGZ0ZXN0cyBzdWNjZWVkZWRcbiIp
OwogCXJldHVybiAwOwogZmFpbDoKLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
