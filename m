Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A711C433E1
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 02:22:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44E9B2080D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 02:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WtHTkkVF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+axAbRE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44E9B2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PeqMry+poYR6QgjTYxCrz9/o1f3uNIMYk/HI8yZ1nHg=; b=WtHTkkVFg8LAMknhudamWYER4
	pLdaeIXjqtH8vwZJdpS2nLyoPmC31XpdJzlI+3Fa2mmEw2/R4PXRlkVEVo98vwUwnaOe38y2sSvhi
	n1uCvu7vxsrUh6Ei4d1WBt1Ga+otnvcFjvJkomsdRRpGSKNBvwZblVMFHCCSHOouwrcvZXnMkeTvZ
	et4HB68AYgkiXFHR0GA3GXbEfz9opBtjVgmbRKu+bBhhPhXNvKfR2RmrEx1dx1qBvRAu/O382uCKK
	iWqHJuDhAJLtwQsOfI8LExMY5Of/CmPvYT65zdGcjl73VihUQI9YK6VTMP0SAuJQ5VWci+oz6qnda
	8FKfhL/8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtMCe-00006y-P3; Thu, 09 Jul 2020 02:22:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtMCc-00006S-Ub
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 02:22:23 +0000
Received: from localhost.localdomain (unknown [42.120.72.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7A972078A;
 Thu,  9 Jul 2020 02:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594261342;
 bh=soM++pUywGyr/MvxvWD0RjFOEMr6v04bguV7aLdRgck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e+axAbRE1Jbzbw44PHcZEOqcUVBLM4goiqLviD6thMjYxYbzkZ0Sm4LBTM7XJg1Fh
 rvxk3hveiqAm7atQQEjvQkKOFUV5P9wWUDssUioYLfENOWu3GkD02OpjX+HwccgDyf
 etVKBRJSsauYA0n1CTKkGkpPDVCCKVuiq+E+h1EE=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, me@packi.ch,
 bjorn.topel@gmail.com, atish.patra@wdc.com, penberg@kernel.org,
 mhiramat@kernel.org
Subject: [PATCH v2 3/6] riscv: Fixup compile error BUILD_BUG_ON failed
Date: Thu,  9 Jul 2020 02:19:11 +0000
Message-Id: <1594261154-69745-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594261154-69745-1-git-send-email-guoren@kernel.org>
References: <1594261154-69745-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_222223_130375_F40B959B 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 guoren@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org
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
ZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KUmV2aWV3ZWQtYnk6IE1h
c2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBQZWtrYSBF
bmJlcmcgPHBlbmJlcmdAa2VybmVsLm9yZz4KQ2M6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNv
bT4KLS0tCkNoYW5nZWxvZyBWMjoKIC0gVXNlIF9fYWx3YXlzX2lubGluZSBhcyBzYW1lIGFzIGZp
eF90b192aXJ0CiAtIFVzZSBjb25zdCAiY29uc3QgdW5zaWduZWQgaW50IiBmb3IgMnRoIHBhcmFt
CgpTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Ci0tLQog
YXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvcGF0Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKaW5kZXggZDRhNjRkZi4u
MzE3OWE0ZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5jCkBAIC0yMCw3ICsyMCwxMiBAQCBzdHJ1Y3QgcGF0Y2hfaW5z
biB7CiB9OwogCiAjaWZkZWYgQ09ORklHX01NVQotc3RhdGljIHZvaWQgKnBhdGNoX21hcCh2b2lk
ICphZGRyLCBpbnQgZml4bWFwKQorLyoKKyAqIFRoZSBmaXhfdG9fdmlydCgsIGlkeCkgbmVlZHMg
YSBjb25zdCB2YWx1ZSAobm90IGEgZHluYW1pYyB2YXJpYWJsZSBvZgorICogcmVnLWEwKSBvciBC
VUlMRF9CVUdfT04gZmFpbGVkIHdpdGggImlkeCA+PSBfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXMi
LgorICogU28gdXNlICdfX2Fsd2F5c19pbmxpbmUnIGFuZCAnY29uc3QgdW5zaWduZWQgaW50IGZp
eG1hcCcgaGVyZS4KKyAqLworc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkICpwYXRjaF9tYXAo
dm9pZCAqYWRkciwgY29uc3QgdW5zaWduZWQgaW50IGZpeG1hcCkKIHsKIAl1aW50cHRyX3QgdWlu
dGFkZHIgPSAodWludHB0cl90KSBhZGRyOwogCXN0cnVjdCBwYWdlICpwYWdlOwpAQCAtMzcsNyAr
NDIsNiBAQCBzdGF0aWMgdm9pZCAqcGF0Y2hfbWFwKHZvaWQgKmFkZHIsIGludCBmaXhtYXApCiAJ
cmV0dXJuICh2b2lkICopc2V0X2ZpeG1hcF9vZmZzZXQoZml4bWFwLCBwYWdlX3RvX3BoeXMocGFn
ZSkgKwogCQkJCQkgKHVpbnRhZGRyICYgflBBR0VfTUFTSykpOwogfQotTk9LUFJPQkVfU1lNQk9M
KHBhdGNoX21hcCk7CiAKIHN0YXRpYyB2b2lkIHBhdGNoX3VubWFwKGludCBmaXhtYXApCiB7Ci0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
