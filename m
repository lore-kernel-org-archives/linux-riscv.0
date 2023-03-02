Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8D9C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 07:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5iBld+9sCwn7qbCl4fz1ewM9wLi+HH9hRkbz5BLBJ3E=; b=i9GssvdQZp28y7
	u75oa0/37371D4M/ugAdVbmWGAbLIVTPOBCvLApKYdDF6+PJ95op/dpB6cCp3BkMF/tghKLWj4Bb2
	Xz7SStx92S0PT6pW5+6BeM9v3ZakvURfubSo5cp/aPG7Hl/ZJsoCERwCMqRhISZxdn1Y2DAQYRC2z
	vnBEWa6UZ5EZvRFNU4bItbSKB0b4xDG24vU8cAEp2723eGNt5fhkwQagmVQYMPZdUxr6iTww/8G3H
	Vvhy4D3svuoaTLT/W+5HzIxFG1wx8J5QLdcPo+McO+O6711+iZezXRyxfMdMZgq5+VcA9iLPRFiMy
	QvvNvGTymStY6vHYFraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdEL-0016jd-PC; Thu, 02 Mar 2023 07:19:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdEH-0016i3-DY
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 07:19:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3BA4FB80DF0;
	Thu,  2 Mar 2023 07:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CCCC433EF;
	Thu,  2 Mar 2023 07:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677741587;
	bh=x+GFgv/5i/F5V9VZV9k4Y/49cV0Hpjtg26OJcDxewj8=;
	h=From:To:Cc:Subject:Date:From;
	b=Mc1t119H+fFTJ5RrU80t7GhKlmv/qjrH+mvhXlveKB67C1AQ4FMzc80kZNoe9oo94
	 KSa4dFTh8HI/IX/kcGJ2SfvH3QhldduBNyjJR887Ly5uPX32PBNhO9HK/p4P6syoNj
	 nubTohYX8lJvEQI5fslphaa9UE/i4nDfrY1IXIqZ3MsO7ar1ggZDiDv9rDK28HxVHv
	 yTPGisaq68blznooFT3VJdtIYLJuAwXpcUHQPfQM+uYcDi8aeZ7CnZet12hepRajRk
	 GdfGhUKdkHzBuWKr6FY7LOTN7VYiRNRhL+URhyFNhyb6aLsZNdecMY52Jq3CcXc3Z5
	 0G/lTmkqyvTCQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v3] lib/test_string.c: Add strncmp() tests
Date: Thu,  2 Mar 2023 08:19:34 +0100
Message-Id: <20230302071934.254111-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_231953_822380_A6CACC2F 
X-CRM114-Status: GOOD (  16.57  )
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
biB0aGUgc2VsZgp0ZXN0cywgdGhpcyBhZGRzIG9uZS4KClJlcG9ydGVkLWJ5OiBIZWlrbyBTdMO8
Ym5lciA8aGVpa29Ac250ZWNoLmRlPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjgwMTE2Mi44OGJNUUpiRmo2QGRpZWdvLwpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5A
cml2b3NpbmMuY29tPgotLS0KQ2hhbmdlIGJhY2sgdG8gaXQncyBvcmlnaW5hbCBmb3JtLiBDaGVj
a3BhdGNoIHN0aWxsIGNvbXBsYWlucyBhYm91dApfX2luaXRjb25zdCwgYnV0IHRoZXJlJ3MgYSBw
YXRjaCBhZGRyZXNzaW5nIHRoYXQgWzFdLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDIzMDMwMTA5NDMyMC4xNTk1NC0xLWJqb3JuQGtlcm5lbC5vcmcvCgp2Mi0+djM6IFJlbW92
ZWQgdGhlICJjaGVja3BhdGNoIGZpeCIgcGF0Y2gKICAgICAgICBBZGRlZCBvbmUgbW9yZSB0ZXN0
Cgp2MS0+djI6IEFkZGVkIHR3byBtb3JlIHRlc3RzIChwb3MvbmVnKS4gKEFuZHkpCiAgICAgICAg
TWlub3IgY29kZSBzdHlsZSBpc3N1ZXMuIChBbmR5KQogICAgICAgIEZpeGVkIGNoZWNrcGF0Y2gg
ZXJyb3JzLgotLS0KbGliL3Rlc3Rfc3RyaW5nLmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvbGliL3Rlc3Rfc3RyaW5nLmMgYi9saWIvdGVzdF9zdHJpbmcuYwppbmRleCBj
NWNiOTJmYjcxMGUuLmYxOGEzNDU3OGYxZiAxMDA2NDQKLS0tIGEvbGliL3Rlc3Rfc3RyaW5nLmMK
KysrIGIvbGliL3Rlc3Rfc3RyaW5nLmMKQEAgLTIwNyw2ICsyMDcsNDMgQEAgc3RhdGljIF9faW5p
dCBpbnQgc3Ryc3BuX3NlbGZ0ZXN0KHZvaWQpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBfX2lu
aXQgaW50IHN0cm5jbXBfc2VsZnRlc3Qodm9pZCkKK3sKKwlzaXplX3QgaTsKKwlzdGF0aWMgY29u
c3Qgc3RydWN0IHN0cm5jbXBfdGVzdCB7CisJCWNvbnN0IGNoYXIgKnN0cl9hOworCQljb25zdCBj
aGFyICpzdHJfYjsKKwkJdW5zaWduZWQgbG9uZyBjb3VudDsKKwkJdW5zaWduZWQgbG9uZyBtYXhf
b2ZmOworCQlpbnQgcmV0dmFsOworCX0gdGVzdHNbXSBfX2luaXRjb25zdCA9IHsKKwkJeyAiL2Rl
di92ZGEiLCAiL2Rldi8iLCA1LCA0LCAwIH0sCisJCXsgIi9kZXYvdmRhIiwgIi9kZXYvdmRiIiwg
NSwgNCwgMCB9LAorCQl7ICIwMDAwMDAwMC0tLTExMTExIiwgIjAwMDAwMDAwLS0tMTExMTIiLCAx
MiwgNCwgMCB9LAorCQl7ICIvZGV2L3ZkYSIsICIvZGV2L3ZkXDAiLCA4LCAwLCA5NyB9LAorCQl7
ICJBQkMiLCAiQUIiLCAzLCAwLCA2NyB9LAorCQl7ICJBQkEiLCAiQUJaIiwgMywgMCwgLTI1IH0s
CisJCXsgIkFCQyIsICJBQkMiLCAzLCAwLCAwIH0sCisJfTsKKworCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKHRlc3RzKTsgKytpKSB7CisJCWNvbnN0IHN0cnVjdCBzdHJuY21wX3Rlc3QgKnMg
PSB0ZXN0cyArIGk7CisJCXNpemVfdCBvZmY7CisKKwkJZm9yIChvZmYgPSAwOyBvZmYgPD0gcy0+
bWF4X29mZjsgb2ZmKyspIHsKKwkJCWludCByZXMgPSBzdHJuY21wKHMtPnN0cl9hICsgb2ZmLCBz
LT5zdHJfYiArIG9mZiwgcy0+Y291bnQgLSBvZmYpOworCisJCQlpZiAocmVzID09IDAgJiYgcy0+
cmV0dmFsICE9IDApCisJCQkJcmV0dXJuIDB4MTAwMCArIDB4MTAwKm9mZiArIDB4MTAqaSArIDB4
MDsKKwkJCWlmIChyZXMgPiAwICYmIHMtPnJldHZhbCA8PSAwKQorCQkJCXJldHVybiAweDEwMDAg
KyAweDEwMCpvZmYgKyAweDEwKmkgKyAweDE7CisJCQlpZiAocmVzIDwgMCAmJiBzLT5yZXR2YWwg
Pj0gMCkKKwkJCQlyZXR1cm4gMHgxMDAwICsgMHgxMDAqb2ZmICsgMHgxMCppICsgMHgyOworCQl9
CisJfQorCXJldHVybiAwOworfQorCiBzdGF0aWMgX19leGl0IHZvaWQgc3RyaW5nX3NlbGZ0ZXN0
X3JlbW92ZSh2b2lkKQogewogfQpAQCAtMjQ1LDYgKzI4MiwxMSBAQCBzdGF0aWMgX19pbml0IGlu
dCBzdHJpbmdfc2VsZnRlc3RfaW5pdCh2b2lkKQogCWlmIChzdWJ0ZXN0KQogCQlnb3RvIGZhaWw7
CiAKKwl0ZXN0ID0gNzsKKwlzdWJ0ZXN0ID0gc3RybmNtcF9zZWxmdGVzdCgpOworCWlmIChzdWJ0
ZXN0KQorCQlnb3RvIGZhaWw7CisKIAlwcl9pbmZvKCJTdHJpbmcgc2VsZnRlc3RzIHN1Y2NlZWRl
ZFxuIik7CiAJcmV0dXJuIDA7CiBmYWlsOgoKYmFzZS1jb21taXQ6IGMwOTI3YTdhNTM5MWY3ZDhl
NTkzZTVlNTBlYWQ3NTA1YTIzY2FkZjkKLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
