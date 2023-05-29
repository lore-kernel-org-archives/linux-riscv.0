Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24C0C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGYjU2gajyWnZoEeWMe+4LSHV1RiMA87+2AmAKjjWFA=; b=mJmmnyDI6k8eHS
	VGluCpsCJVvRzh9d9oWMcQvuxnNkUPflT2RvqpuvYiQ2q/AvGgQHB6srrNPt6ELO3mAMJnxbADklK
	+4NZQGI3QhuoiqWIHgCDP0ANc3QHXHfQz+dnJPJgYhL3r1sS3BRrgJf7/AJFqoBJ7yItavSJ06m3U
	+GeUYNhjq93w92e1bP4bVRP1n8AfC5QhglCwVdXuptSqebpIrZQE2EJCqsetWqDJ9LrP1hRjhMc5D
	p1QMtQsLK88IaCfzwzaVCCEjNRB8QpXIX1IanDDT+krXCCfUjnmSWRGFF1LGH/xBiNICOGs2LsV8x
	P+cJMib1dZrdi5LTP+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cU4-00AW8B-2Q;
	Mon, 29 May 2023 13:00:24 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cU1-00AW6j-2Q
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 13:00:23 +0000
X-QQ-mid: bizesmtp78t1685365209tn304cds
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 May 2023 21:00:07 +0800 (CST)
X-QQ-SSF: 00200000000000D0V000000A0000000
X-QQ-FEAT: rZJGTgY0+YPLNKIjmriA1LyRD/9GVh50DK49bFM+u4kQwihN+a4qP4/e9Lr+I
	tlmnaNZ+nIUm6A2omPGy/+sSzZrOubvL+5ZvqVr3IsHscrGxbzvQRuwqG7viOZO6b+sh992
	HUiH7R5VAiWB6QaViufuoxqSKbNbwowdK7F797RyTOJhl1+JgSrGd+24WyK7eVDXzu83zSv
	eDNpUtxLJstDd39F4/RIIHuzZzCNldhAlJF4/t0rfGfd1dgRmCa3+IYz/wD7XfyhPtK57Ao
	Rmvu4usRDG5AyT2Kj66AC6iBUeSMjXIqPJypayw8mcuGFHrB0/PmUIReymTHZVQCZWy2w7j
	hLj7rV3KyYOR8VuFnHZ7q1HAwSUI7VPcjcPc9a8f6dEHBjOv8+WhJvLFKrnmy9ZVB6+7sNR
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 879951463538973120
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 3/7] selftests/nolibc: fix up compile warning with glibc on x86_64
Date: Mon, 29 May 2023 21:00:01 +0800
Message-Id: <aeb48b9cf6fc4674f7560166f22c7dc87d02302d.1685362482.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685362482.git.falcon@tinylab.org>
References: <cover.1685362482.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_060022_082723_7ED52717 
X-CRM114-Status: GOOD (  11.13  )
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

Q29tcGlsaW5nIG5vbGliYy10ZXN0LmMgd2l0aCBnY2Mgb24geDg2XzY0IGdvdCBzdWNoIHdhcm5p
bmc6Cgp0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYzogSW4gZnVu
Y3Rpb24g4oCYZXhwZWN0X2Vx4oCZOgp0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9s
aWJjLXRlc3QuYzoxNzc6MjQ6IHdhcm5pbmc6IGZvcm1hdCDigJglbGxk4oCZIGV4cGVjdHMgYXJn
dW1lbnQgb2YgdHlwZSDigJhsb25nIGxvbmcgaW504oCZLCBidXQgYXJndW1lbnQgMiBoYXMgdHlw
ZSDigJh1aW50NjRfdOKAmSB7YWthIOKAmGxvbmcgdW5zaWduZWQgaW504oCZfSBbLVdmb3JtYXQ9
XQogIDE3NyB8ICBsbGVuICs9IHByaW50ZigiID0gJWxsZCAiLCBleHByKTsKICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgIH5+fl4gICAgfn5+fgogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgICB8CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIHVpbnQ2NF90IHth
a2EgbG9uZyB1bnNpZ25lZCBpbnR9CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBsb25n
IGxvbmcgaW50CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAlbGQKCkl0IGJlY2F1c2UgdGhh
dCBnbGliYyBkZWZpbmVzIHVpbnQ2NF90IGFzICJ1bnNpZ25lZCBsb25nIGludCIgd2hlbiB3b3Jk
CnNpemUgKG1lYW5zIHNpemVvZihsb25nKSkgaXMgNjRiaXQgKHNlZSBpbmNsdWRlL2JpdHMvdHlw
ZXMuaCksIGJ1dApub2xpYmMgZGlyZWN0bHkgdXNlIHRoZSA2NGJpdCAidW5zaWduZWQgbG9uZyBs
b25nIiAoc2VlCnRvb2xzL2luY2x1ZGUvbm9saWJjL3N0ZGludC5oKSwgd2hpY2ggaXMgc2ltcGxl
ciwgc2VlbXMga2VybmVsIHVzZXMgaXQKdG9vIChpbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvaW50
LWxsNjQuaCkuCgpJdCBpcyBhYmxlIHRvIGRvIGxpa2UgZ2xpYmMsIGRlZmluaW5nIF9fV09SRFNJ
WkUgZm9yIGFsbCBvZiBwbGF0Zm9ybXMKYW5kIHVzaW5nICJ1bnNpZ25lZCBsb25nIGludCIgdG8g
ZGVmaW5lIHVpbnQ2NF90IHdoZW4gX19XT1JEU0laRSBpcwo2NGJpdHMsIGJ1dCBoZXJlIHVzZXMg
YSBzaW1wbGVyIHNvbHV0aW9uOiBub2xpYmMgYWx3YXlzIHJlcXVpcmVzICVsbGQgdG8KbWF0Y2gg
InVuc2lnbmVkIGxvbmcgbG9uZyIsIGZvciBvdGhlcnMsIG9ubHkgcmVxdWlyZSAlbGxkIHdoZW4g
d29yZCBzaXplCmlzIDMyYml0LgoKU2lnbmVkLW9mZi1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0
aW55bGFiLm9yZz4KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRl
c3QuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMKaW5kZXggZDQxN2NhNWQ5NzZm
Li43ZjliNzE2ZmQ5YjEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGli
Yy9ub2xpYmMtdGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xp
YmMtdGVzdC5jCkBAIC0xNzQsNyArMTc0LDExIEBAIHN0YXRpYyBpbnQgZXhwZWN0X2VxKHVpbnQ2
NF90IGV4cHIsIGludCBsbGVuLCB1aW50NjRfdCB2YWwpCiB7CiAJaW50IHJldCA9ICEoZXhwciA9
PSB2YWwpOwogCisjaWYgX19TSVpFT0ZfTE9OR19fID09IDQgfHwgZGVmaW5lZChOT0xJQkMpCiAJ
bGxlbiArPSBwcmludGYoIiA9ICVsbGQgIiwgZXhwcik7CisjZWxzZQorCWxsZW4gKz0gcHJpbnRm
KCIgPSAlbGQgIiwgZXhwcik7CisjZW5kaWYKIAlwYWRfc3BjKGxsZW4sIDY0LCByZXQgPyAiW0ZB
SUxdXG4iIDogIiBbT0tdXG4iKTsKIAlyZXR1cm4gcmV0OwogfQotLSAKMi4yNS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
