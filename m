Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64203C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 16:20:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31600207BB
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 16:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="up2sajXg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4/zkk+O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31600207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=14LsGMp7/9KbZ/tFzMujIjGTNm0QZXBfiMfMznrDKtI=; b=up2sajXgIAtYbXXs0AGv3zG80B
	6VQ4p+DqExrlR1r2wTBjCkkBC/qiyyM3J0UqOcKcU6SOrfJxKEidxlwzAVTNBhB3S3/HTP96WJc4y
	cj9UtdMJHfqRW1HTBGLw/bLoCqirdRXKZ6A+CjfFdDC8OY6OwgHQWdjPHQ/LrWF+kh38MH3hgbanx
	Z+aBZnrPrxH9QJsCZNdqqYvUXgIZP5oOP83fn4U6HWgNp+CB6ahZXBOiITE0e6EJeHajrKSHyyLHx
	Zt0Zy5oQNVZ1MYmjW6Znd3PuTy2iisX5dDwqWAs1YM2VQ6y+VIGeGLcdi2R1Kav1BJXa0ropBGK5h
	BYUQM2PA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtvlF-0000bb-UA; Fri, 10 Jul 2020 16:20:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtvlD-0000ap-Fn
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 16:20:28 +0000
Received: from localhost.localdomain (unknown [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 320D420657;
 Fri, 10 Jul 2020 16:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594398025;
 bh=ERGigc8QaW07BGajQpKa6kuFdOuBQHa4YxZRxHxyvG4=;
 h=From:To:Cc:Subject:Date:From;
 b=P4/zkk+OTc+xvnY6KxP1vHRODZoVLxJJn16uHU7qWli0vWQntfnTEIqIzqPCR2KIm
 QYTPjJt0sRKFVlTA+hOrmHFUDBcjDujpl8rekHxeXG7nIkAsM4sTSMLqSTvjihJXrs
 pvZu1XPk4TCvLB4LlpctImEuS5FEGfvJ9IH+aw4M=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, keescook@chromium.org,
 bjorn.topel@gmail.com, atish.patra@wdc.com, cooper.qu@linux.alibaba.com
Subject: [PATCH v3 1/2] riscv: Add STACKPROTECTOR supported
Date: Fri, 10 Jul 2020 16:19:57 +0000
Message-Id: <1594397998-10221-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_122027_648152_CBB5512D 
X-CRM114-Status: GOOD (  16.53  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 guoren@kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-riscv@lists.infradead.org, Greentime Hu <green.hu@gmail.com>
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
U2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgpSZXZpZXdl
ZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBQYXVsIFdhbG1zbGV5
IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFi
YmVsdEBnb29nbGUuY29tPgpDYzogQWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+CkNj
OiBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPgpDYzogQmrDtnJuIFTDtnBl
bCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgpDYzogR3JlZW50aW1lIEh1IDxncmVlbi5odUBnbWFp
bC5jb20+CkNjOiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNvbT4KLS0tCkNoYW5nZSB2
MjoKIC0gRml4dXAgcnNpY3YzMiBjb21waWxlIHdhcm5pbmcKClNpZ25lZC1vZmYtYnk6IEd1byBS
ZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N0YWNrcHJv
dGVjdG9yLmggfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlz
Y3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICAgICB8ICA2ICsrKysrKwogMyBmaWxlcyBjaGFu
Z2VkLCA0MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zdGFja3Byb3RlY3Rvci5oCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmln
IGIvYXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IGY5MjdhOTEuLjRiMGUzMDggMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTYzLDYgKzYz
LDcgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0IEhBVkVfUEVSRl9FVkVOVFMKIAlzZWxlY3QgSEFW
RV9QRVJGX1JFR1MKIAlzZWxlY3QgSEFWRV9QRVJGX1VTRVJfU1RBQ0tfRFVNUAorCXNlbGVjdCBI
QVZFX1NUQUNLUFJPVEVDVE9SCiAJc2VsZWN0IEhBVkVfU1lTQ0FMTF9UUkFDRVBPSU5UUwogCXNl
bGVjdCBJUlFfRE9NQUlOCiAJc2VsZWN0IE1PRFVMRVNfVVNFX0VMRl9SRUxBIGlmIE1PRFVMRVMK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2twcm90ZWN0b3IuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2twcm90ZWN0b3IuaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMC4uZDk1ZjdiMgotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc3RhY2twcm90ZWN0b3IuaApAQCAtMCwwICsxLDMzIEBACisvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworCisjaWZuZGVmIF9BU01fUklTQ1ZfU1RBQ0tQ
Uk9URUNUT1JfSAorI2RlZmluZSBfQVNNX1JJU0NWX1NUQUNLUFJPVEVDVE9SX0gKKworI2luY2x1
ZGUgPGxpbnV4L3JhbmRvbS5oPgorI2luY2x1ZGUgPGxpbnV4L3ZlcnNpb24uaD4KKyNpbmNsdWRl
IDxhc20vdGltZXguaD4KKworZXh0ZXJuIHVuc2lnbmVkIGxvbmcgX19zdGFja19jaGtfZ3VhcmQ7
CisKKy8qCisgKiBJbml0aWFsaXplIHRoZSBzdGFja3Byb3RlY3RvciBjYW5hcnkgdmFsdWUuCisg
KgorICogTk9URTogdGhpcyBtdXN0IG9ubHkgYmUgY2FsbGVkIGZyb20gZnVuY3Rpb25zIHRoYXQg
bmV2ZXIgcmV0dXJuLAorICogYW5kIGl0IG11c3QgYWx3YXlzIGJlIGlubGluZWQuCisgKi8KK3N0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBib290X2luaXRfc3RhY2tfY2FuYXJ5KHZvaWQpCit7
CisJdW5zaWduZWQgbG9uZyBjYW5hcnk7CisJdW5zaWduZWQgbG9uZyB0c2M7CisKKwkvKiBUcnkg
dG8gZ2V0IGEgc2VtaSByYW5kb20gaW5pdGlhbCB2YWx1ZS4gKi8KKwlnZXRfcmFuZG9tX2J5dGVz
KCZjYW5hcnksIHNpemVvZihjYW5hcnkpKTsKKwl0c2MgPSBnZXRfY3ljbGVzKCk7CisJY2FuYXJ5
ICs9IHRzYyArICh0c2MgPDwgQklUU19QRVJfTE9ORy8yKTsKKwljYW5hcnkgXj0gTElOVVhfVkVS
U0lPTl9DT0RFOworCWNhbmFyeSAmPSBDQU5BUllfTUFTSzsKKworCWN1cnJlbnQtPnN0YWNrX2Nh
bmFyeSA9IGNhbmFyeTsKKwlfX3N0YWNrX2Noa19ndWFyZCA9IGN1cnJlbnQtPnN0YWNrX2NhbmFy
eTsKK30KKyNlbmRpZiAvKiBfQVNNX1JJU0NWX1NUQUNLUFJPVEVDVE9SX0ggKi8KZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nl
c3MuYwppbmRleCA4MjRkMTE3Li42NTQ4OTI5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9wcm9jZXNzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCkBAIC0yNCw2ICsy
NCwxMiBAQAogCiByZWdpc3RlciB1bnNpZ25lZCBsb25nIGdwX2luX2dsb2JhbCBfX2FzbV9fKCJn
cCIpOwogCisjaWZkZWYgQ09ORklHX1NUQUNLUFJPVEVDVE9SCisjaW5jbHVkZSA8bGludXgvc3Rh
Y2twcm90ZWN0b3IuaD4KK3Vuc2lnbmVkIGxvbmcgX19zdGFja19jaGtfZ3VhcmQgX19yZWFkX21v
c3RseTsKK0VYUE9SVF9TWU1CT0woX19zdGFja19jaGtfZ3VhcmQpOworI2VuZGlmCisKIGV4dGVy
biBhc21saW5rYWdlIHZvaWQgcmV0X2Zyb21fZm9yayh2b2lkKTsKIGV4dGVybiBhc21saW5rYWdl
IHZvaWQgcmV0X2Zyb21fa2VybmVsX3RocmVhZCh2b2lkKTsKIAotLSAKMi43LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
