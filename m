Return-Path: <SRS0=1yfy=AP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D7BC433DF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2020 03:35:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67546208C7
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2020 03:35:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xk2eMp6i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ekniUIMB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67546208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HNWVnBsxyUABXIwwrWPmBEvbXiM1jyfSxoAl70L9sq4=; b=Xk2eMp6ieSZ5qPgs2ctjPcGIS
	cqmYIY9ee/JwCOJ/CFOprLENzBcibFllY3TzaqKK3xVFXcfXCy19TIl4G0nG7ueh//NPd5fljTUoO
	DQs8+BXTaoZ4aYW3mOhdnFv/oqDkqcK5Yzd3Hbumx/aZlSL/US8vO5m0liB9vDoCEDYnJJE2BwGQ9
	rzpoZBGatXQtAlMmMazkIz0OAS4hk4Ayic68Xp4h4tOPxQk2VpKdnnhuIgRRCActHSCH+DwNYDXWw
	SloCU2OF7zymZCQ2MQofMFiL5IAzHXeoEUzw1Zky7Mwlbw+CJucjJrAROmkqxCCdZ8mKreclP8yxU
	j9ghqeiSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrYx7-0007rM-0S; Sat, 04 Jul 2020 03:34:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrYx5-0007qu-I6
 for linux-riscv@lists.infradead.org; Sat, 04 Jul 2020 03:34:56 +0000
Received: from localhost.localdomain (89.208.247.74.16clouds.com
 [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6401D20899;
 Sat,  4 Jul 2020 03:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593833694;
 bh=DwnW4KHO8DYEljlqVPhBYinwJJ3evXr/9FwF+yD4CN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ekniUIMB/mW40lSgqx4piqYh4sT4fOnQFgYmOx1uFIxDzFsxtt8CEWi8yoUo8sqls
 0GdPVbA8Bcm2F7y4YbicLcWGl/PjwiX4PexX+R1OyGGQo0SO3A9XK11Fs6iolmCb5r
 QyyppUSWMTR3hpKbXiYkmP2GVAjiynauB4km0lIQ=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, me@packi.ch,
 bjorn.topel@gmail.com, atish.patra@wdc.com
Subject: [PATCH V1 3/5] riscv: Fixup compile error BUILD_BUG_ON failed
Date: Sat,  4 Jul 2020 03:34:17 +0000
Message-Id: <1593833659-26224-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593833659-26224-1-git-send-email-guoren@kernel.org>
References: <1593833659-26224-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_233455_776890_485A73ED 
X-CRM114-Status: GOOD (  12.70  )
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
c2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CkNjOiBab25nIExpIDx6b25nLmxp
QHNpZml2ZS5jb20+Ci0tLQpDaGFuZ2Vsb2cgVjI6CiAtIFVzZSBfX2Fsd2F5c19pbmxpbmUgYXMg
c2FtZSBhcyBmaXhfdG9fdmlydAogLSBVc2UgY29uc3QgImNvbnN0IHVuc2lnbmVkIGludCIgZm9y
IDJ0aCBwYXJhbQoKU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEu
Y29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCmluZGV4
IGQ0YTY0ZGYuLjMxNzlhNGUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwpAQCAtMjAsNyArMjAsMTIgQEAgc3RydWN0
IHBhdGNoX2luc24gewogfTsKIAogI2lmZGVmIENPTkZJR19NTVUKLXN0YXRpYyB2b2lkICpwYXRj
aF9tYXAodm9pZCAqYWRkciwgaW50IGZpeG1hcCkKKy8qCisgKiBUaGUgZml4X3RvX3ZpcnQoLCBp
ZHgpIG5lZWRzIGEgY29uc3QgdmFsdWUgKG5vdCBhIGR5bmFtaWMgdmFyaWFibGUgb2YKKyAqIHJl
Zy1hMCkgb3IgQlVJTERfQlVHX09OIGZhaWxlZCB3aXRoICJpZHggPj0gX19lbmRfb2ZfZml4ZWRf
YWRkcmVzc2VzIi4KKyAqIFNvIHVzZSAnX19hbHdheXNfaW5saW5lJyBhbmQgJ2NvbnN0IHVuc2ln
bmVkIGludCBmaXhtYXAnIGhlcmUuCisgKi8KK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCAq
cGF0Y2hfbWFwKHZvaWQgKmFkZHIsIGNvbnN0IHVuc2lnbmVkIGludCBmaXhtYXApCiB7CiAJdWlu
dHB0cl90IHVpbnRhZGRyID0gKHVpbnRwdHJfdCkgYWRkcjsKIAlzdHJ1Y3QgcGFnZSAqcGFnZTsK
QEAgLTM3LDcgKzQyLDYgQEAgc3RhdGljIHZvaWQgKnBhdGNoX21hcCh2b2lkICphZGRyLCBpbnQg
Zml4bWFwKQogCXJldHVybiAodm9pZCAqKXNldF9maXhtYXBfb2Zmc2V0KGZpeG1hcCwgcGFnZV90
b19waHlzKHBhZ2UpICsKIAkJCQkJICh1aW50YWRkciAmIH5QQUdFX01BU0spKTsKIH0KLU5PS1BS
T0JFX1NZTUJPTChwYXRjaF9tYXApOwogCiBzdGF0aWMgdm9pZCBwYXRjaF91bm1hcChpbnQgZml4
bWFwKQogewotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
