Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A232C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLH53UkJZisDqCEnyDAkoO9VAN+RdcEmOqV1KWRtsT4=; b=UllMhA3DduWnrv
	0zm3baLl0Gx1BhSSN2UlYn+rX/4OK4HHsTwjE8+IsowDohEa7zVjCgOvppRUaYogE5w64W2NvZEC+
	6aMpw4BR3isfESDIcN2i7WQ1gZDV54MRCc0KG+xp5bTzPlG1x6XzAJjpgCU96XL2Kfkv62g52yiFh
	ty5NDoCfrgQ2bP3+BpJL+VLXtHNKjuPGTNjYEbOyOUzqnmnRnpcSHn62p5Fe8Fm3ywtsQEAQoGrjR
	ZB1ba8x9UyyftT78Qn5lO/JfWpXo5HW5A0AF8f0aa2L4e1boYhTIcvOjYeWdKJ7EjTVqfmZ8nXpO1
	4t5AhSHZaHJTkvMDeZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2sqM-00DxfE-HY; Sun, 19 Jun 2022 11:11:50 +0000
Received: from forward501j.mail.yandex.net ([2a02:6b8:0:801:2::111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2sq0-00Dxbo-B3; Sun, 19 Jun 2022 11:11:31 +0000
Received: from vla5-415927531403.qloud-c.yandex.net (vla5-415927531403.qloud-c.yandex.net [IPv6:2a02:6b8:c18:3522:0:640:4159:2753])
	by forward501j.mail.yandex.net (Yandex) with ESMTP id 7CC47623458;
	Sun, 19 Jun 2022 14:11:23 +0300 (MSK)
Received: from vla1-62318bfe5573.qloud-c.yandex.net (vla1-62318bfe5573.qloud-c.yandex.net [2a02:6b8:c0d:3819:0:640:6231:8bfe])
	by vla5-415927531403.qloud-c.yandex.net (mxback/Yandex) with ESMTP id K896SngN5y-BMf8djv8;
	Sun, 19 Jun 2022 14:11:23 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1655637083;
	bh=Jjeli4ZyFrXVeI42kTpuwxGd5nkH6f77Wv0sKvtGi84=;
	h=In-Reply-To:References:Date:Subject:Cc:To:From:Message-Id;
	b=JFIFiWzm+eghbjkmivE0AtW0zhySyhFwEP7RqYCfeCPnTpiRnrZUzgcJXKeiymxrt
	 zOJuGq0GJO2GmzBZ8+mYEknP2B/RX60ssMHGDZnSy4gvEkY+dnc5sRUG1DVz4xCFLV
	 0FsP8kljDrcmrTDoSgAYjt+G7WBks0EseSafTgNE=
Authentication-Results: vla5-415927531403.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla1-62318bfe5573.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id VrXAFig42r-BLNq9rsj;
	Sun, 19 Jun 2022 14:11:21 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>,
	Will Deacon <will@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?= <joao.mario@tecnico.ulisboa.pt>,
	linux@yadro.com,
	Nikita Shubin <n.shubin@yadro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/1] RISC-V: Create unique identification for SoC PMU
Date: Sun, 19 Jun 2022 14:11:11 +0300
Message-Id: <20220619111115.6354-2-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619111115.6354-1-nikita.shubin@maquefel.me>
References: <20220619111115.6354-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_041129_324380_8B7FA79F 
X-CRM114-Status: GOOD (  16.40  )
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

RnJvbTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgoKUHJvdmlkZSBSSVNDLVYg
U0JJIFBNVSBpZCB0byBkaXN0aW5ndWlzaCBkaWZmZXJlbnQgY29yZXMgb3IgU29DcyB2aWEKImRl
dmljZXMvcGxhdGZvcm0vcmlzY3YtcG11L2lkIiBzeXNmcyBlbnRyeS4KClRoZSBpZGVudGlmaWNh
dGlvbiBpcyBnZW5lcmF0ZWQgYXMgc3RyaW5nIG9mIG1hcmNoaWQsIG1pbXBpZCwgbXZlbmRvcmlk
CmluIGhleCBmb3JtYXQgc2VwYXJhdGVkIGJ5IGNvbWEgLSAiMHg3MDAzMiwweDcwMDMyLDB4MCIu
CgpUaGUgQ1NScyBhcmUgZGV0YWlsZWQgaW4gdGhlIFJJU0MtViBwcml2aWxlZ2VkIHNwZWMgWzFd
LgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwKCkluc3BpcmVk
LWJ5OiBKb8OjbyBNw6FyaW8gRG9taW5nb3MgPGpvYW8ubWFyaW9AdGVjbmljby51bGlzYm9hLnB0
PgpTaWduZWQtb2ZmLWJ5OiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5jb20+Ci0tLQp2
My0+djQ6Ci0gdXNlIHN0cmluZyBmb3IgcG11aWQKLSByZW5hbWUgcG11X3NiaV9pZF9zaG93IHRv
IGlkX3Nob3cKLSBmaXggZXJyb3IgcHJpbnQgbWVzc2FnZSBpbiBpZF9zaG93Ci0gZml4IERFVklD
RV9BVFRSIHRvIHVzZSBvY3RhbCBwZXJtaXNzaW9ucwotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3Ni
aS5jICAgICAgICB8ICAzICsrKwogZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyAgIHwgNDEg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9wZXJmL3Jp
c2N2X3BtdS5oIHwgIDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmku
YwppbmRleCA3NzVkMzMyMmI0MjIuLjUwZGQ5YjZlY2M5ZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKQEAgLTYyNywxNiAr
NjI3LDE5IEBAIGxvbmcgc2JpX2dldF9tdmVuZG9yaWQodm9pZCkKIHsKIAlyZXR1cm4gX19zYmlf
YmFzZV9lY2FsbChTQklfRVhUX0JBU0VfR0VUX01WRU5ET1JJRCk7CiB9CitFWFBPUlRfU1lNQk9M
KHNiaV9nZXRfbXZlbmRvcmlkKTsKIAogbG9uZyBzYmlfZ2V0X21hcmNoaWQodm9pZCkKIHsKIAly
ZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklfRVhUX0JBU0VfR0VUX01BUkNISUQpOwogfQorRVhQ
T1JUX1NZTUJPTChzYmlfZ2V0X21hcmNoaWQpOwogCiBsb25nIHNiaV9nZXRfbWltcGlkKHZvaWQp
CiB7CiAJcmV0dXJuIF9fc2JpX2Jhc2VfZWNhbGwoU0JJX0VYVF9CQVNFX0dFVF9NSU1QSUQpOwog
fQorRVhQT1JUX1NZTUJPTChzYmlfZ2V0X21pbXBpZCk7CiAKIHN0YXRpYyB2b2lkIHNiaV9zZW5k
X2NwdW1hc2tfaXBpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICp0YXJnZXQpCiB7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYwppbmRleCBkY2EzNTM3YThkY2MuLmJlODEyZjg1NTYxNyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wZXJmL3Jpc2N2X3BtdV9zYmkuYworKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5j
CkBAIC02OTMsNiArNjkzLDI4IEBAIHN0YXRpYyBpbnQgcG11X3NiaV9zZXR1cF9pcnFzKHN0cnVj
dCByaXNjdl9wbXUgKnBtdSwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRlCiAJcmV0dXJuIDA7
CiB9CiAKK3N0YXRpYyBzc2l6ZV90IGlkX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAorCQkJCXN0
cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCit7CisJaW50IGxlbjsKKwlz
dHJ1Y3QgcmlzY3ZfcG11ICpwbXUgPSBjb250YWluZXJfb2YoZGV2X2dldF9kcnZkYXRhKGRldiks
IHN0cnVjdCByaXNjdl9wbXUsIHBtdSk7CisKKwlsZW4gPSBzcHJpbnRmKGJ1ZiwgIiVzXG4iLCBw
bXUtPnBtdWlkKTsKKwlpZiAobGVuIDw9IDApCisJCWRldl9lcnIoZGV2LCAiaW52YWxpZCBzcHJp
bnRmIGxlbjogJWRcbiIsIGxlbik7CisKKwlyZXR1cm4gbGVuOworfQorCitzdGF0aWMgREVWSUNF
X0FUVFIoaWQsIDA2NDQsIGlkX3Nob3csIE5VTEwpOworCitzdGF0aWMgc3RydWN0IGF0dHJpYnV0
ZSAqcG11X3NiaV9hdHRyc1tdID0geworCSZkZXZfYXR0cl9pZC5hdHRyLAorCU5VTEwKK307CisK
K0FUVFJJQlVURV9HUk9VUFMocG11X3NiaSk7CisKIHN0YXRpYyBpbnQgcG11X3NiaV9kZXZpY2Vf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgcmlzY3ZfcG11
ICpwbXUgPSBOVUxMOwpAQCAtNzE0LDYgKzczNiwxNCBAQCBzdGF0aWMgaW50IHBtdV9zYmlfZGV2
aWNlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKHBtdV9zYmlfZ2V0
X2N0cmluZm8obnVtX2NvdW50ZXJzKSkKIAkJZ290byBvdXRfZnJlZTsKIAorCS8qIGZpbGwgcG11
aWQgKi8KKwlwbXUtPnBtdWlkID0ga2FzcHJpbnRmKEdGUF9LRVJORUwsICIweCVseCwweCVseCww
eCVseCIsCisJCQkgICAgICAgc2JpX2dldF9tYXJjaGlkKCksCisJCQkgICAgICAgc2JpX2dldF9t
aW1waWQoKSwKKwkJCSAgICAgICBzYmlfZ2V0X212ZW5kb3JpZCgpKTsKKwlpZiAoIXBtdS0+cG11
aWQpCisJCWdvdG8gb3V0X2ZyZWVfcG11aWQ7CisKIAlyZXQgPSBwbXVfc2JpX3NldHVwX2lycXMo
cG11LCBwZGV2KTsKIAlpZiAocmV0IDwgMCkgewogCQlwcl9pbmZvKCJQZXJmIHNhbXBsaW5nL2Zp
bHRlcmluZyBpcyBub3Qgc3VwcG9ydGVkIGFzIHNzY29mIGV4dGVuc2lvbiBpcyBub3QgYXZhaWxh
YmxlXG4iKTsKQEAgLTczOSw4ICs3NjksMTkgQEAgc3RhdGljIGludCBwbXVfc2JpX2RldmljZV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gcmV0OwogCX0KIAor
CXJldCA9IHN5c2ZzX2NyZWF0ZV9ncm91cCgmcGRldi0+ZGV2LmtvYmosICZwbXVfc2JpX2dyb3Vw
KTsKKwlpZiAocmV0KSB7CisJCWRldl9lcnIoJnBkZXYtPmRldiwgInN5c2ZzIGNyZWF0aW9uIGZh
aWxlZFxuIik7CisJCXJldHVybiByZXQ7CisJfQorCisJcGRldi0+ZGV2Lmdyb3VwcyA9IHBtdV9z
YmlfZ3JvdXBzOworCWRldl9zZXRfZHJ2ZGF0YSgmcGRldi0+ZGV2LCBwbXUpOworCiAJcmV0dXJu
IDA7CiAKK291dF9mcmVlX3BtdWlkOgorCWtmcmVlKHBtdS0+cG11aWQpOwogb3V0X2ZyZWU6CiAJ
a2ZyZWUocG11KTsKIAlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wZXJm
L3Jpc2N2X3BtdS5oIGIvaW5jbHVkZS9saW51eC9wZXJmL3Jpc2N2X3BtdS5oCmluZGV4IDQ2Zjli
NmZlMzA2ZS4uY2YzNTU3Yjc3ZmI4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3BlcmYvcmlz
Y3ZfcG11LmgKKysrIGIvaW5jbHVkZS9saW51eC9wZXJmL3Jpc2N2X3BtdS5oCkBAIC00Miw2ICs0
Miw3IEBAIHN0cnVjdCBjcHVfaHdfZXZlbnRzIHsKIHN0cnVjdCByaXNjdl9wbXUgewogCXN0cnVj
dCBwbXUJcG11OwogCWNoYXIJCSpuYW1lOworCWNoYXIJCSpwbXVpZDsKIAogCWlycXJldHVybl90
CSgqaGFuZGxlX2lycSkoaW50IGlycV9udW0sIHZvaWQgKmRldik7CiAKLS0gCjIuMzUuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
