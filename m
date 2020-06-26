Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D397C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:41:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 680122078D
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:41:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FxYrJzX1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 680122078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lq/I+BclEh4Psm/I4dyZgcceXvUaXwBDDXCbI9Tjz3Q=; b=FxYrJzX1q1gveTUQZWm4mAP7g
	1ckQIl9Ju5r5gWNLILLeCUkwLUTk7I+qjUeJEzy0SQYvvcob3zpq2gqEEP1xTH2HpTWzi4qYaoXxO
	jM+TtKC12zr/CJP6I0COgE4d59K6KdlHsq3eV7+40zwH671PTP+uaFZa7rRsJYjqq8WARFiEwOVRR
	39QqU6Bzfw9zq5lWx4N9UhoXJpe7wUTLh7w987XaK0qiNqNi03TtVEvVmoqlDU7XW8WIPxoP1uBg+
	MbKUnVVoV8rjMa2yJmL2amGZft3e0qJFJinnOv0Ar0JAiq+AcEBi/lW0owpMP2zAoxohCugzYKJi3
	pD53hfBig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jonfG-0003KZ-90; Fri, 26 Jun 2020 12:41:06 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jonf8-0003I3-6I
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 12:41:03 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 49tc1h2HStzvjc1; Fri, 26 Jun 2020 14:40:56 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2] riscv: Allow building with kcov coverage
Date: Fri, 26 Jun 2020 14:40:56 +0200
Message-Id: <20200626124056.29708-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200625183941.23093-1-tklauser@distanz.ch>
References: <20200625183941.23093-1-tklauser@distanz.ch>
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWRkIEFSQ0hfSEFTX0tDT1YgYW5kIEhBVkVfR0NDX1BMVUdJTlMgdG8gdGhlIHJpc2N2IEtjb25m
aWcuCkFsc28gZGlzYWJsZSBpbnN0cnVtZW50YXRpb24gb2Ygc29tZSBlYXJseSBib290IGNvZGUg
YW5kIHZkc28uCgpCb290LXRlc3RlZCBvbiBRRU1VJ3MgcmlzY3Y2NCB2aXJ0IG1hY2hpbmUuCgpD
YzogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgpDYzogRG1pdHJ5IFZ5dWtv
diA8ZHZ5dWtvdkBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBUb2JpYXMgS2xhdXNlciA8dGts
YXVzZXJAZGlzdGFuei5jaD4KLS0tCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgIHwg
MiArKwogYXJjaC9yaXNjdi9ib290L01ha2VmaWxlICAgICAgICB8IDIgKysKIGFyY2gvcmlzY3Yv
a2VybmVsL3Zkc28vTWFrZWZpbGUgfCAxICsKIGFyY2gvcmlzY3YvbW0vTWFrZWZpbGUgICAgICAg
ICAgfCAyICsrCiA0IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCAwODkyOTNlNGFk
NDYuLmE3ZDdmODE4NGYxNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisrKyBiL2Fy
Y2gvcmlzY3YvS2NvbmZpZwpAQCAtMTksNiArMTksNyBAQCBjb25maWcgUklTQ1YKIAlzZWxlY3Qg
QVJDSF9IQVNfREVCVUdfV1gKIAlzZWxlY3QgQVJDSF9IQVNfR0NPVl9QUk9GSUxFX0FMTAogCXNl
bGVjdCBBUkNIX0hBU19HSUdBTlRJQ19QQUdFCisJc2VsZWN0IEFSQ0hfSEFTX0tDT1YKIAlzZWxl
Y3QgQVJDSF9IQVNfTU1JT1dCCiAJc2VsZWN0IEFSQ0hfSEFTX1BURV9TUEVDSUFMCiAJc2VsZWN0
IEFSQ0hfSEFTX1NFVF9ESVJFQ1RfTUFQCkBAIC01Nyw2ICs1OCw3IEBAIGNvbmZpZyBSSVNDVgog
CXNlbGVjdCBIQVZFX0RNQV9DT05USUdVT1VTIGlmIE1NVQogCXNlbGVjdCBIQVZFX0VCUEZfSklU
IGlmIE1NVQogCXNlbGVjdCBIQVZFX0ZVVEVYX0NNUFhDSEcgaWYgRlVURVgKKwlzZWxlY3QgSEFW
RV9HQ0NfUExVR0lOUwogCXNlbGVjdCBIQVZFX0dFTkVSSUNfVkRTTyBpZiBNTVUgJiYgNjRCSVQK
IAlzZWxlY3QgSEFWRV9QQ0kKIAlzZWxlY3QgSEFWRV9QRVJGX0VWRU5UUwpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L01ha2VmaWxlIGIvYXJjaC9yaXNjdi9ib290L01ha2VmaWxlCmluZGV4
IDM1MzBjNTliM2VhNy4uYzU5ZmNhNjk1ZjlkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2Jvb3Qv
TWFrZWZpbGUKKysrIGIvYXJjaC9yaXNjdi9ib290L01ha2VmaWxlCkBAIC0xNCw2ICsxNCw4IEBA
CiAjIEJhc2VkIG9uIHRoZSBpYTY0IGFuZCBhcm02NCBib290L01ha2VmaWxlLgogIwogCitLQ09W
X0lOU1RSVU1FTlQgOj0gbgorCiBPQkpDT1BZRkxBR1NfSW1hZ2UgOj0tTyBiaW5hcnkgLVIgLm5v
dGUgLVIgLm5vdGUuZ251LmJ1aWxkLWlkIC1SIC5jb21tZW50IC1TCiAKIHRhcmdldHMgOj0gSW1h
Z2UgbG9hZGVyCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQppbmRleCAyOWNmMDUyZjY1NDEuLjRiMGQz
YmNjNDRlNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQorKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCkBAIC0yOSw2ICsyOSw3IEBAIENQUEZM
QUdTX3Zkc28ubGRzICs9IC1QIC1DIC1VJChBUkNIKQogCiAjIERpc2FibGUgZ2NvdiBwcm9maWxp
bmcgZm9yIFZEU08gY29kZQogR0NPVl9QUk9GSUxFIDo9IG4KK0tDT1ZfSU5TVFJVTUVOVCA6PSBu
CiAKICMgRm9yY2UgZGVwZW5kZW5jeQogJChvYmopL3Zkc28ubzogJChvYmopL3Zkc28uc28KZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L21tL01ha2VmaWxl
CmluZGV4IDM2M2VmMDFjMzBiMS4uYzAxODVlNTU2Y2E1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L21tL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvbW0vTWFrZWZpbGUKQEAgLTUsNiArNSw4IEBA
IGlmZGVmIENPTkZJR19GVFJBQ0UKIENGTEFHU19SRU1PVkVfaW5pdC5vID0gLXBnCiBlbmRpZgog
CitLQ09WX0lOU1RSVU1FTlRfaW5pdC5vIDo9IG4KKwogb2JqLXkgKz0gaW5pdC5vCiBvYmoteSAr
PSBleHRhYmxlLm8KIG9iai0kKENPTkZJR19NTVUpICs9IGZhdWx0Lm8gcGFnZWF0dHIubwotLSAK
Mi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
