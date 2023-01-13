Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0727EC54EBD
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLXm2WctcRV8y/+HWcgyaFhf1SaAN8z6gCmf1BhgVNc=; b=tOxnNm4s/mL7h0
	tImIRDURAMUmYXN23DcJ+DX0RdTpRI3kMND41fOdzg/f7aNJt9H0MKv7iKEgt6kV11LDJi8d7FdmG
	BMuH5RUCuWTLrtuDOJBZeWiVsx+dKTwMjAKCUC20U7XUBaCvGzt4Sq/JTIEK7enhG6zgi4NoFVsch
	mydOsjJ+PDN4TDUSBi16Qx0Ryssa9Ry/KtgrxFB7FNXiNa/TNbfhOQa87tzlUtyhrNrzj7Qy7kND6
	dhnP2W7ILf+jn/zItFSvY+0ueF97jEUJAXS6ZexVresyYqTYmpYO0PjraWa/lerSkBn8HFwYizjNu
	qShrmxxI01L9IknO4vGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLJy-0032GG-OD; Fri, 13 Jan 2023 14:46:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLJt-0032DT-1P
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 14:46:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE2A961F9C;
	Fri, 13 Jan 2023 14:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0C6C433F0;
	Fri, 13 Jan 2023 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673621171;
	bh=bhJdLBWsY2gx6AsQzO84a64x8hRuQO6VoHRS+yuhugs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s37cdjjiAP/akoDJK2wu0NF7+p/MLPgPilAOkQTl+i/26fR21U3j0u4aKsZL+s1U+
	 czJZcY5v1zBI/cqW0bFJNLzjJ+nOCmfckeL8rrNQ3S1J5PUqeJyaaNbgbk71Qjrmdw
	 CpNX5CO6T0GYLQ+eYb+QcxTHQ7FAEN90OcMJW53TJu5bLBkZ7Rxw3VU9//BQspNulY
	 ht+TGdlf2bXTK8y/MYUahtdXNXvvC9L2BP+Tywak1rV66cpn07VviJsJDQFsar3f6y
	 8wOvJSvKodf9J5WfZeBzjbFmjGRnOhjA6OD9582g3fSElauRNthEBQi6IkpzsZSvWG
	 aBZUEvY6qE3aA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: Add "Code:" to RISC-V splats
Date: Fri, 13 Jan 2023 15:45:51 +0100
Message-Id: <20230113144552.138081-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113144552.138081-1-bjorn@kernel.org>
References: <20230113144552.138081-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_064613_216509_5F298BC1 
X-CRM114-Status: GOOD (  15.37  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKQWRkICJDb2RlOiIgb3V0
cHV0IHRvIFJJU0MtViBzcGxhdHMuIE1pbWljIHg4Ni02NCdzIGJ5dGUtZm9yLWJ5dGUKZHVtcHMu
CgpBbiBleGFtcGxlOgogIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAwMDAwMAogIE9vcHMgWyMxXQog
IE1vZHVsZXMgbGlua2VkIGluOgogIENQVTogMSBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0
YWludGVkIDYuMi4wLXJjMy0wMDA2My1nMGNlOGIxMzc3YjJiLWRpcnR5ICMzCiAgSGFyZHdhcmUg
bmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQogIGVwYyA6IGtlcm5lbF9pbml0KzB4YzgvMHgx
MGUKICAgcmEgOiBrZXJuZWxfaW5pdCsweDcwLzB4MTBlCiAgZXBjIDogZmZmZmZmZmY4MGJkOTkz
OCByYSA6IGZmZmZmZmZmODBiZDk4ZTAgc3AgOiBmZjIwMDAwMDAwNjBiZWMwCiAgIGdwIDogZmZm
ZmZmZmY4MTczMGIyOCB0cCA6IGZmNjAwMDAwN2ZmMDAwMDAgdDAgOiA3OTc0Njk3Mjc1NjM2NTcz
CiAgIHQxIDogMDAwMDAwMDAwMDAwMDAwMCB0MiA6IDMwMzAzMDMyNzAzOTNkNmUgczAgOiBmZjIw
MDAwMDAwNjBiZWUwCiAgIHMxIDogZmZmZmZmZmY4MTczMjAyOCBhMCA6IDAwMDAwMDAwMDAwMDAw
MDAgYTEgOiBmZjYwMDAwMDgxNTdlNjAwCiAgIGEyIDogMDAwMDAwMDAwMDAwMDAwMiBhMyA6IGZm
ZmZmZmZmODE3NmE0NzAgYTQgOiAwMDAwMDAwMDAwMDAwMDAwCiAgIGE1IDogMDAwMDAwMDAwMDAw
MDAwYSBhNiA6IDAwMDAwMDAwMDAwMDAxMTggYTcgOiBmZjYwMDAwMDgxNTdlNjAwCiAgIHMyIDog
MDAwMDAwMDAwMDAwMDAwMCBzMyA6IDAwMDAwMDAwMDAwMDAwMDAgczQgOiAwMDAwMDAwMDAwMDAw
MDAwCiAgIHM1IDogMDAwMDAwMDAwMDAwMDAwMCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOiAw
MDAwMDAwMDAwMDAwMDAwCiAgIHM4IDogMDAwMDAwMDAwMDAwMDAwMCBzOSA6IDAwMDAwMDAwMDAw
MDAwMDAgczEwOiAwMDAwMDAwMDAwMDAwMDAwCiAgIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6
IGZmZmZmZmZmODExODVmZjAgdDQgOiAwMDAwMDAwMDAwMDAwMDIyCiAgIHQ1IDogMDAwMDAwMDAw
MDAwMDAzZCB0NiA6IDAwMDAwMDAwMDAwMDAwMDAKICBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMjAg
YmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZgogIFs8ZmZm
ZmZmZmY4MDAwMzUyOD5dIHJldF9mcm9tX2V4Y2VwdGlvbisweDAvMHgxNgogIENvZGU6IDJhIDg2
IDc5IGQxIDhjIDYwIDE3IGE1IDY5IDAwIDEzIDA1IDY1IDM4IGVmIGQwIDJlIGRiIGE5IDQ3IDwx
Yz4gYzEgMTcgYTUKICAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KICBLZXJu
ZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhpdGNvZGU9
MHgwMDAwMDAwYgogIFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMKICAtLS1bIGVuZCBLZXJu
ZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhpdGNvZGU9
MHgwMDAwMDAwYiBdLS0tCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZv
c2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDMxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKaW5kZXggNTQ5YmRlNWM5NzBhLi5lZmFkZmY0MTkwZTAg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwpAQCAtMjksNiArMjksMzMgQEAgaW50IHNob3dfdW5oYW5kbGVkX3NpZ25h
bHMgPSAxOwogCiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGRpZV9sb2NrKTsKIAorc3RhdGljIHZv
aWQgZHVtcF9rZXJuZWxfaW5zdHIoY29uc3QgY2hhciAqbG9nbHZsLCBzdHJ1Y3QgcHRfcmVncyAq
cmVncykKK3sKKyNkZWZpbmUgUFJPTE9HVUVfU0laRSAyMAorI2RlZmluZSBFUElMT0dVRV9TSVpF
IDMKKyNkZWZpbmUgT1BDT0RFX0JVRlNJWkUgKFBST0xPR1VFX1NJWkUgKyAxICsgRVBJTE9HVUVf
U0laRSkKKwl1OCBvcGNvZGVzW09QQ09ERV9CVUZTSVpFXTsKKwl1bnNpZ25lZCBsb25nIHByb2xv
Z3VlID0gcmVncy0+ZXBjIC0gUFJPTE9HVUVfU0laRTsKKworCWlmICh1c2VyX21vZGUocmVncykp
CisJCXJldHVybjsKKworCXN3aXRjaCAoY29weV9mcm9tX2tlcm5lbF9ub2ZhdWx0KG9wY29kZXMs
ICh1OCAqKXByb2xvZ3VlLCBzaXplb2Yob3Bjb2RlcykpKSB7CisJY2FzZSAwOgorCQlwcmludGso
IiVzQ29kZTogJSIgX19zdHJpbmdpZnkoUFJPTE9HVUVfU0laRSkgInBoIDwlMDJ4PiAlIgorCQkg
ICAgICAgX19zdHJpbmdpZnkoRVBJTE9HVUVfU0laRSkgInBoXG4iLCBsb2dsdmwsIG9wY29kZXMs
CisJCSAgICAgICBvcGNvZGVzW1BST0xPR1VFX1NJWkVdLCBvcGNvZGVzICsgUFJPTE9HVUVfU0la
RSArIDEpOworCQlicmVhazsKKwljYXNlIC1FUEVSTToKKwkJLyogTm8gYWNjZXNzIHRvIHRoZSB1
c2VyIHNwYWNlIHN0YWNrIG9mIG90aGVyIHRhc2tzLiBJZ25vcmUuICovCisJCWJyZWFrOworCWRl
ZmF1bHQ6CisJCXByaW50aygiJXNDb2RlOiBVbmFibGUgdG8gYWNjZXNzIG9wY29kZSBieXRlcyBh
dCAweCVseC5cbiIsCisJCSAgICAgICBsb2dsdmwsIHByb2xvZ3VlKTsKKwkJYnJlYWs7CisJfQor
fQorCiB2b2lkIGRpZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgY29uc3QgY2hhciAqc3RyKQogewog
CXN0YXRpYyBpbnQgZGllX2NvdW50ZXI7CkBAIC00Myw4ICs3MCwxMCBAQCB2b2lkIGRpZShzdHJ1
Y3QgcHRfcmVncyAqcmVncywgY29uc3QgY2hhciAqc3RyKQogCiAJcHJfZW1lcmcoIiVzIFsjJWRd
XG4iLCBzdHIsICsrZGllX2NvdW50ZXIpOwogCXByaW50X21vZHVsZXMoKTsKLQlpZiAocmVncykK
KwlpZiAocmVncykgewogCQlzaG93X3JlZ3MocmVncyk7CisJCWR1bXBfa2VybmVsX2luc3RyKEtF
Uk5fRU1FUkcsIHJlZ3MpOworCX0KIAogCWNhdXNlID0gcmVncyA/IHJlZ3MtPmNhdXNlIDogLTE7
CiAJcmV0ID0gbm90aWZ5X2RpZShESUVfT09QUywgc3RyLCByZWdzLCAwLCBjYXVzZSwgU0lHU0VH
Vik7Ci0tIAoyLjM3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
