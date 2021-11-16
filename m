Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341D1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:48:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE37F6128A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE37F6128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olr/0rH1Cvq4ocOpSX96nNk5gt3CUr7ATkmklQYKsKs=; b=hYz2bZu7p8NrUX
	373pG4iwpkhOtzucvYCXxiU6zjckfnjBEY/IRsy8KUs/NeFXMQjU9lA+m9/wTpzgCCa8bOE/uRgPt
	P8aG2WCGlZri7MLg3IdvaPm7hoLGY5jtT2/K+woK2NUfnhrCMnuMDgYldGJ84by1/i6ukxO/EaL6v
	p7korZUn1vgrx9VMfF0Erc/I4w8GPHRopGUGBrXCV5RIRoT/T2kKRUBogczXlR/JUI+VU+YlPgOLI
	m+0Hgecvcll9dWsTA2Yk70xAnIIcMzipMHrak8iQRG3FjuV0/G/PSCHE1zbT9Nipbm3S/maM+aPlI
	ipSuWEb+CwVVBjHB9nBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn0hN-002BjF-Ae; Tue, 16 Nov 2021 15:48:41 +0000
Received: from smtp1.tecnico.ulisboa.pt ([193.136.128.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn0hI-002Ben-2h
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:48:38 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 05B776005C2B;
 Tue, 16 Nov 2021 15:48:18 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id 7suzIrNTA-lf; Tue, 16 Nov 2021 15:48:14 +0000 (WET)
Received: from mail2.tecnico.ulisboa.pt (mail2.ist.utl.pt
 [IPv6:2001:690:2100:1::4750:b5b4])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 873936005C2C;
 Tue, 16 Nov 2021 15:48:14 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1637077694;
 bh=EsbqsfDwR3GCr6eujE8yzM6eJnlvI/PG3VO6iR63Ji8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EFSRGDrk0Lji+eHSFF6QjNgniPFr1qyHOC2TC4bSZ+Pv4PfSL9DFeoWRnc7fxXrtV
 ZoLgfHbyNx2/Iymj19NLbgs31gu4UgJ2I4JczCeASMbtW9e3N+OmhkY6a/cv6jwSyE
 8+tasQSJ8uiky5a5SThGqu+0uKZeTDloQ4U8AKq8=
Received: from joaomariovmubuntu.Home (unknown
 [IPv6:2001:8a0:fa2d:4500:215:5dff:fe40:101])
 (Authenticated sender: ist181713)
 by mail2.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 59F7B56007D;
 Tue, 16 Nov 2021 15:48:14 +0000 (WET)
From: =?UTF-8?q?Jo=C3=A3o=20M=C3=A1rio=20Domingos?=
 <joao.mario@tecnico.ulisboa.pt>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org,
 nikita.shubin@maquefel.me, joao.mario@tecnico.ulisboa.pt
Subject: [PATCH v2 1/4] RISC-V: Create unique identification for SoC PMU
Date: Tue, 16 Nov 2021 15:48:09 +0000
Message-Id: <20211116154812.17008-2-joao.mario@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_074836_461724_1F00B84F 
X-CRM114-Status: GOOD (  14.33  )
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

VGhlIFNCSSBQTVUgcGxhdGZvcm0gZHJpdmVyIGRpZCBub3QgcHJvdmlkZSBhbnkgaWRlbnRpZmlj
YXRpb24gZm9yCnBlcmYgZXZlbnRzIG1hdGNoaW5nLiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBu
ZXcgc3lzZnMgZmlsZSBpbnNpZGUgdGhlCnBsYXRmb3JtIGRldmljZSAoc29jOnBtdS9pZCkgZm9y
IHBtdSBpZGVudGlmaWNhdGlvbi4KClRoZSBpZGVudGlmaWNhdGlvbiBpcyBhIDY0LWJpdCB2YWx1
ZSBnZW5lcmF0ZWQgYXM6Cls2My0zMl06IG12ZW5kb3JpZDsKWzMxXTogbWFyY2hpZFtNU0JdOwpb
MzAtMTZdOiBtYXJjaGlkWzE1LTBdOwpbMTUtMF06IG1pbXBpZFsxNU1TQnNdOwoKVGhlIENTUnMg
YXJlIGRldGFpbGVkIGluIHRoZSBSSVNDLVYgcHJpdmlsZWdlZCBzcGVjIFsxXS4KVGhlIG1hcmNo
aWQgaXMgc3BsaXQgaW4gTVNCICsgMTVMU0JzLCBkdWUgdG8gdGhlIE1TQiBiZWluZyB1c2VkIGZv
cgpvcGVuLXNvdXJjZSBhcmNoaXRlY3R1cmUgaWRlbnRpZmljYXRpb24uCgpbMV0gaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwKClNpZ25lZC1vZmYtYnk6IEpvw6NvIE3D
oXJpbyBEb21pbmdvcyA8am9hby5tYXJpb0B0ZWNuaWNvLnVsaXNib2EucHQ+Ci0tLQogYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMgICAgICB8ICAzICsrKwogZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCA3NDAyYTQxN2YzOGUuLjRlNGY1
NjcxYjg2NCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMKQEAgLTU1MSwxNiArNTUxLDE5IEBAIGxvbmcgc2JpX2dldF9tdmVu
ZG9yaWQodm9pZCkKIHsKIAlyZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklfRVhUX0JBU0VfR0VU
X01WRU5ET1JJRCk7CiB9CitFWFBPUlRfU1lNQk9MKHNiaV9nZXRfbXZlbmRvcmlkKTsKIAogbG9u
ZyBzYmlfZ2V0X21hcmNoaWQodm9pZCkKIHsKIAlyZXR1cm4gX19zYmlfYmFzZV9lY2FsbChTQklf
RVhUX0JBU0VfR0VUX01BUkNISUQpOwogfQorRVhQT1JUX1NZTUJPTChzYmlfZ2V0X21hcmNoaWQp
OwogCiBsb25nIHNiaV9nZXRfbWltcGlkKHZvaWQpCiB7CiAJcmV0dXJuIF9fc2JpX2Jhc2VfZWNh
bGwoU0JJX0VYVF9CQVNFX0dFVF9NSU1QSUQpOwogfQorRVhQT1JUX1NZTUJPTChzYmlfZ2V0X21p
bXBpZCk7CiAKIHN0YXRpYyB2b2lkIHNiaV9zZW5kX2NwdW1hc2tfaXBpKGNvbnN0IHN0cnVjdCBj
cHVtYXNrICp0YXJnZXQpCiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3Ni
aS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwppbmRleCA3YTY4ZGZhODlmNmYuLmE2
OTI1MWVjN2EzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYworKysg
Yi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCkBAIC02NDIsNiArNjQyLDQ2IEBAIHN0YXRp
YyBpbnQgcG11X3NiaV9zZXR1cF9pcnFzKHN0cnVjdCByaXNjdl9wbXUgKnBtdSwgc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRlCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB1aW50NjRfdCBwbXVf
c2JpX2dldF9wbXVfaWQodm9pZCkKK3sKKwl1bmlvbiBzYmlfcG11X2lkIHsKKwkJdWludDY0X3Qg
dmFsdWU7CisJCXN0cnVjdCB7CisJCQl1aW50MTZfdCBpbXA6MTY7CisJCQl1aW50MTZfdCBhcmNo
OjE2OworCQkJdWludDMyX3QgdmVuZG9yOjMyOworCQl9OworCX0gcG11aWQ7CisKKwlwbXVpZC52
YWx1ZSA9IDA7CisJcG11aWQudmVuZG9yID0gKHVpbnQzMl90KSBzYmlfZ2V0X212ZW5kb3JpZCgp
OworCXBtdWlkLmFyY2ggPSAoc2JpX2dldF9tYXJjaGlkKCkgPj4gKDYzIC0gMTUpICYgKDEgPDwg
MTUpKSB8IChzYmlfZ2V0X21hcmNoaWQoKSAmIDB4N0ZGRik7CisJcG11aWQuaW1wID0gKHNiaV9n
ZXRfbWltcGlkKCkgPj4gMTYpOworCisJcmV0dXJuIHBtdWlkLnZhbHVlOworfQorCitzdGF0aWMg
c3NpemVfdCBwbXVfc2JpX2lkX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAorCQlzdHJ1Y3QgZGV2
aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQoreworCWludCBsZW47CisKKwlsZW4gPSBz
cHJpbnRmKGJ1ZiwgIjB4JWxseFxuIiwgcG11X3NiaV9nZXRfcG11X2lkKCkpOworCWlmIChsZW4g
PD0gMCkKKwkJZGV2X2VycihkZXYsICJteWRydjogSW52YWxpZCBzcHJpbnRmIGxlbjogJWRuIiwg
bGVuKTsKKworCXJldHVybiBsZW47Cit9CisKK3N0YXRpYyBERVZJQ0VfQVRUUihpZCwgU19JUlVH
TyB8IFNfSVdVU1IsIHBtdV9zYmlfaWRfc2hvdywgMCk7CisKK3N0YXRpYyBzdHJ1Y3QgYXR0cmli
dXRlICpwbXVfc2JpX2F0dHJzW10gPSB7CisJJmRldl9hdHRyX2lkLmF0dHIsCisJTlVMTAorfTsK
KworQVRUUklCVVRFX0dST1VQUyhwbXVfc2JpKTsKKwogc3RhdGljIGludCBwbXVfc2JpX2Rldmlj
ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCByaXNjdl9w
bXUgKnBtdSA9IE5VTEw7CkBAIC02ODAsNiArNzIwLDEzIEBAIHN0YXRpYyBpbnQgcG11X3NiaV9k
ZXZpY2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlwbXUtPmN0cl9jbGVh
cl9pZHggPSBwbXVfc2JpX2N0cl9jbGVhcl9pZHg7CiAJcG11LT5jdHJfcmVhZCA9IHBtdV9zYmlf
Y3RyX3JlYWQ7CiAKKwlyZXQgPSBzeXNmc19jcmVhdGVfZ3JvdXAoJnBkZXYtPmRldi5rb2JqLCAm
cG11X3NiaV9ncm91cCk7CisJaWYgKHJldCkgeworCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJzeXNm
cyBjcmVhdGlvbiBmYWlsZWRcbiIpOworCQlyZXR1cm4gcmV0OworCX0KKwlwZGV2LT5kZXYuZ3Jv
dXBzID0gcG11X3NiaV9ncm91cHM7CisKIAlyZXQgPSBjcHVocF9zdGF0ZV9hZGRfaW5zdGFuY2Uo
Q1BVSFBfQVBfUEVSRl9SSVNDVl9TVEFSVElORywgJnBtdS0+bm9kZSk7CiAJaWYgKHJldCkKIAkJ
cmV0dXJuIHJldDsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
