Return-Path: <SRS0=ohv9=AJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BEDC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 16:08:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B04F20771
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2020 16:08:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bzsVi2j+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRA4km5O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B04F20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fXrFdk/ULXy9Z/pzw0REtCTXCai2Rk17FIDmaBDvVj8=; b=bzsVi2j+u3/0rIguZ5UPqN60gV
	ZYkli027oa+f5I1JRGgl48WTYcJhQ+fmyiHUO6JDi2GebtBsdQsVbV8z0++ht/8Qa79QyNnYP0yNe
	FzccSPP5SdhUUB7wAYM/qxQPy+h818NRvnSi69po7VVMLzDuVeVdFwpp/umdi8+cIuoDxdoVfZqGY
	HAD8aWpHRYC4uvdD/vlU3NbFqr2Mx3avY4XRX/xi6zjUpStMbceY3RSUxikuumAhsRBwh1KfutQF0
	ngRbNYv/A5aNwOuMQAg3YPAVC0Aof1MXtNCwxw28Fa02JZA26QevhFykBBsSvc8RYb0CnTn6C4/my
	PqBEekgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpZrB-0008So-SB; Sun, 28 Jun 2020 16:08:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpZrA-0008Sb-6P
 for linux-riscv@lists.infradead.org; Sun, 28 Jun 2020 16:08:37 +0000
Received: from localhost.localdomain (unknown [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1BCC20771;
 Sun, 28 Jun 2020 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593360515;
 bh=JmkxcNePUGahgp6O8ZRxtWIgYYelQDYOd98hMhE4jz0=;
 h=From:To:Cc:Subject:Date:From;
 b=aRA4km5ODQzgSQKGiSPi0I/FFP+UA1Hj/Hi5IXsHyvsJ1hQUq/9a4QfwyuWa8eDRO
 IqjMjaOiiIBuS2rUuBdPLxpLU7xiDggEKdR+nHrccyWJJJh6M5/lacuXgtRJlojU0/
 6jlQYW44Ek86IOJmxBXlEpGiiNmvIb1UwBwvgYEE=
From: guoren@kernel.org
To: greentime.hu@sifive.com,
	mhiramat@kernel.org,
	guoren@kernel.org
Subject: [PATCH V2] riscv: Fixup compile error BUILD_BUG_ON failed
Date: Sun, 28 Jun 2020 16:07:37 +0000
Message-Id: <1593360457-23827-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
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
Cc: Guo Ren <guoren@linux.alibaba.com>, anup@brainfault.org,
 palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, zong.li@sifive.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVW5mb3J0dW5hdGVseSwg
dGhlIGN1cnJlbnQgY29kZSBjb3VsZG4ndCBiZSBjb21waWxlZDoKCiAgQ0MgICAgICBhcmNoL3Jp
c2N2L2tlcm5lbC9wYXRjaC5vCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1ZGUvbGludXgv
a2VybmVsLmg6MTEsCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvbGlzdC5o
OjksCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvcHJlZW1wdC5oOjExLAog
ICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3NwaW5sb2NrLmg6NTEsCiAgICAg
ICAgICAgICAgICAgZnJvbSBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jOjY6CkluIGZ1bmN0aW9u
IOKAmGZpeF90b192aXJ04oCZLAogICAgaW5saW5lZCBmcm9tIOKAmHBhdGNoX21hcOKAmSBhdCBh
cmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jOjM3OjE3OgouL2luY2x1ZGUvbGludXgvY29tcGlsZXIu
aDozOTI6Mzg6IGVycm9yOiBjYWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0XzIwNeKAmSBk
ZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHX09OIGZhaWxlZDogaWR4ID49
IF9fZW5kX29mX2ZpeGVkX2FkZHJlc3NlcwogIF9jb21waWxldGltZV9hc3NlcnQoY29uZGl0aW9u
LCBtc2csIF9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVSX18pCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXgouL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDozNzM6
NDogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydOKA
mQogICAgcHJlZml4ICMjIHN1ZmZpeCgpOyAgICBcCiAgICBefn5+fn4KLi9pbmNsdWRlL2xpbnV4
L2NvbXBpbGVyLmg6MzkyOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfY29tcGls
ZXRpbWVfYXNzZXJ04oCZCiAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgX19j
b21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKICBefn5+fn5+fn5+fn5+fn5+fn5+Ci4v
aW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozOTozNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvIOKAmGNvbXBpbGV0aW1lX2Fzc2VydOKAmQogI2RlZmluZSBCVUlMRF9CVUdfT05fTVNHKGNv
bmQsIG1zZykgY29tcGlsZXRpbWVfYXNzZXJ0KCEoY29uZCksIG1zZykKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgv
YnVpbGRfYnVnLmg6NTA6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JV
R19PTl9NU0figJkKICBCVUlMRF9CVUdfT05fTVNHKGNvbmRpdGlvbiwgIkJVSUxEX0JVR19PTiBm
YWlsZWQ6ICIgI2NvbmRpdGlvbikKICBefn5+fn5+fn5+fn5+fn5+Ci4vaW5jbHVkZS9hc20tZ2Vu
ZXJpYy9maXhtYXAuaDozMjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYQlVJTERf
QlVHX09O4oCZCiAgQlVJTERfQlVHX09OKGlkeCA+PSBfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXMp
OwogIF5+fn5+fn5+fn5+fgoKQmVjYXVzZSBmaXhfdG9fdmlydCgsIGlkeCkgbmVlZHMgYSBjb25z
dCB2YWx1ZSwgbm90IGEgZHluYW1pYyB2YXJpYWJsZSBvZgpyZWctYTAgb3IgQlVJTERfQlVHX09O
IGZhaWxlZCB3aXRoICJpZHggPj0gX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzIi4KClNpZ25lZC1v
ZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KQ2M6IE1hc2FtaSBIaXJh
bWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CkNjOiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5j
b20+Ci0tLQpDaGFuZ2Vsb2cgVjI6CiAtIFVzZSBfX2Fsd2F5c19pbmxpbmUgYXMgc2FtZSBhcyBm
aXhfdG9fdmlydAogLSBVc2UgY29uc3QgImNvbnN0IHVuc2lnbmVkIGludCIgZm9yIDJ0aCBwYXJh
bQoKU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgotLS0K
IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCmluZGV4IGQ0YTY0ZGYu
LjMxNzlhNGUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcGF0Y2guYwpAQCAtMjAsNyArMjAsMTIgQEAgc3RydWN0IHBhdGNoX2lu
c24gewogfTsKIAogI2lmZGVmIENPTkZJR19NTVUKLXN0YXRpYyB2b2lkICpwYXRjaF9tYXAodm9p
ZCAqYWRkciwgaW50IGZpeG1hcCkKKy8qCisgKiBUaGUgZml4X3RvX3ZpcnQoLCBpZHgpIG5lZWRz
IGEgY29uc3QgdmFsdWUgKG5vdCBhIGR5bmFtaWMgdmFyaWFibGUgb2YKKyAqIHJlZy1hMCkgb3Ig
QlVJTERfQlVHX09OIGZhaWxlZCB3aXRoICJpZHggPj0gX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2Vz
Ii4KKyAqIFNvIHVzZSAnX19hbHdheXNfaW5saW5lJyBhbmQgJ2NvbnN0IHVuc2lnbmVkIGludCBm
aXhtYXAnIGhlcmUuCisgKi8KK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCAqcGF0Y2hfbWFw
KHZvaWQgKmFkZHIsIGNvbnN0IHVuc2lnbmVkIGludCBmaXhtYXApCiB7CiAJdWludHB0cl90IHVp
bnRhZGRyID0gKHVpbnRwdHJfdCkgYWRkcjsKIAlzdHJ1Y3QgcGFnZSAqcGFnZTsKQEAgLTM3LDcg
KzQyLDYgQEAgc3RhdGljIHZvaWQgKnBhdGNoX21hcCh2b2lkICphZGRyLCBpbnQgZml4bWFwKQog
CXJldHVybiAodm9pZCAqKXNldF9maXhtYXBfb2Zmc2V0KGZpeG1hcCwgcGFnZV90b19waHlzKHBh
Z2UpICsKIAkJCQkJICh1aW50YWRkciAmIH5QQUdFX01BU0spKTsKIH0KLU5PS1BST0JFX1NZTUJP
TChwYXRjaF9tYXApOwogCiBzdGF0aWMgdm9pZCBwYXRjaF91bm1hcChpbnQgZml4bWFwKQogewot
LSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
