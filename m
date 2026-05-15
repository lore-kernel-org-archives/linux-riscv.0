Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D16CD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 08:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/h6nKLFurpmLb4fSzJ2asFqdocDURxAG0JcL+PtAbM=; b=aeIGonovdErxlg
	M6YSaGrzwfF52WEvPZgnIrdlnxHKE2J/a3o9W383NRh/6dUYT/oLCUE+9lnHNd+7gY8iX1HhieyS/
	mfxfCVsFwDuxdDwmVEguwalkmpM5CrWIKaFNRnCOOsfejJNuRlcZtKobyDNz5SUtazRBKNRPUPCU8
	vaB7rYFujP4Eu8siNWhoCWw7eWzHZDzaPmeFHnAseYYmKOGOZHiT23U45b4MwVzMHDF/iG6rR0kl9
	RowcZl+msfyzA1S6w8DyQwXDPkSigQMHnNNhhQdAS+sLZyQqd7yE974nRo2c8xwTx1q1Ck9aQGdoU
	SgcnYw2pIsucI5AeHUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoIl-00000007nJ8-0Qac;
	Fri, 15 May 2026 08:53:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoIi-00000007nGe-0T8I
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 08:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778835223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEBwBuDymXqtgfipLBoE9xL2mtSkar53Y4il/kQ0kJw=;
	b=YeOkRBup6FhfeeSicGOhnIGrUr6TfKG1DLJuOARkGGJ+K3f1zKBbZb0pBfWF64ssz04O++
	StUuiBOijHqOJajcOoRScdajNstqFGRCgsQluP7SvKKyTYePa1ebI3N67xZ/t4rZ1a96Wy
	zXJs//THov1wXb/AAjEKY45MsV1pOi8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-yccaBMpdOD2lRdAc7nJxKg-1; Fri,
 15 May 2026 04:53:36 -0400
X-MC-Unique: yccaBMpdOD2lRdAc7nJxKg-1
X-Mimecast-MFC-AGG-ID: yccaBMpdOD2lRdAc7nJxKg_1778835212
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7EFAE1956059;
	Fri, 15 May 2026 08:53:31 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F9211955F2D;
	Fri, 15 May 2026 08:53:23 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 15 May 2026 10:52:52 +0200
Subject: [PATCH v12 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
MIME-Version: 1.0
Message-Id: <20260515-kunit_add_support-v12-3-a216dc228be8@redhat.com>
References: <20260515-kunit_add_support-v12-0-a216dc228be8@redhat.com>
In-Reply-To: <20260515-kunit_add_support-v12-0-a216dc228be8@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Alessandro Carminati <acarmina@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Dan Carpenter <error27@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778835177; l=3810;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=rPDAUA5/eI1GmSDx2demf6AeqBwHHnfPFpVSMTL5AHs=;
 b=KfqWD2f69QLKSMznxAMLAF92n+ue4Pd6GNwc9tLBDyhlbiTibxW457E5nqJA4lrqo/k8hBNAC
 OvCllLrsMcnAANumUCH95f/7D64+mNTK1Cag63rqhXrYLbJSqUSOEkS
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: t2mFtaFf-Vux504PbMpx3isMdgcIA-oyilk9PgbyaWI_1778835212
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_015344_245663_510BF0EA 
X-CRM114-Status: GOOD (  14.49  )
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

RnJvbTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PgoKVGhlIGRybV90ZXN0X3Jl
Y3RfY2FsY19oc2NhbGUgYW5kIGRybV90ZXN0X3JlY3RfY2FsY192c2NhbGUgdW5pdCB0ZXN0cwpp
bnRlbnRpb25hbGx5IHRyaWdnZXIgd2FybmluZyBiYWNrdHJhY2VzIGJ5IHByb3ZpZGluZyBpbnZh
bGlkIHBhcmFtZXRlcnMKdGhlIHRlc3RlZCBmdW5jdGlvbnMuIFN1cHByZXNzIHRoZSBiYWNrdHJh
Y2VzIHRvIGF2b2lkIGNsb2dnaW5nIHRoZQprZXJuZWwgbG9nIGFuZCBkaXN0cmFjdGluZyBmcm9t
IHJlYWwgcHJvYmxlbXMuCgpUaGUgc3VwcHJlc3Npb24gQVBJIGFsc28gZXhwb3NlcyBhIHdhcm5p
bmcgY291bnRlciwgd2hpY2ggaXMgdXNlZAp0byBhc3NlcnQgdGhhdCB0aGUgZXhwZWN0ZWQgd2Fy
bmluZyB3YXMgYWN0dWFsbHkgdHJpZ2dlcmVkLiBPbgpDT05GSUdfQlVHPW4sIFdBUk5fT04oKSBp
cyBhIG5vLW9wIGFuZCB0aGUgY291bnRlciBzdGF5cyB6ZXJvOwp0aGUgZXhwZWN0ZWQgY291bnQg
aXMgYWRqdXN0ZWQgYWNjb3JkaW5nbHksIHByZXNlcnZpbmcgdGhlIHJldHVybgp2YWx1ZSBjaGVj
ayBvbiBhbGwgY29uZmlndXJhdGlvbnMuCgpUZXN0ZWQtYnk6IExpbnV4IEtlcm5lbCBGdW5jdGlv
bmFsIFRlc3RpbmcgPGxrZnRAbGluYXJvLm9yZz4KQWNrZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAbGluYXJvLm9yZz4KQWNrZWQtYnk6IE1hw61yYSBDYW5hbCA8bWNhbmFsQGln
YWxpYS5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8
bGludXhAcm9lY2stdXMubmV0PgpTaWduZWQtb2ZmLWJ5OiBBbGVzc2FuZHJvIENhcm1pbmF0aSA8
YWNhcm1pbmFAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IERhdmlkIEdvdyA8ZGF2aWRAZGF2aWRnb3cu
bmV0PgpTaWduZWQtb2ZmLWJ5OiBBbGJlcnQgRXN0ZXZlIDxhZXN0ZXZlQHJlZGhhdC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYyB8IDM2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJt
X3JlY3RfdGVzdC5jIGIvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYwppbmRl
eCAxN2UxZjM0Yjc2MTAxLi41YWE4ZWM1ZmM0ZDY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1f
cmVjdF90ZXN0LmMKQEAgLTEwLDYgKzEwLDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX3JlY3QuaD4K
ICNpbmNsdWRlIDxkcm0vZHJtX21vZGUuaD4KIAorI2luY2x1ZGUgPGxpbnV4L2xpbWl0cy5oPgog
I2luY2x1ZGUgPGxpbnV4L3N0cmluZ19oZWxwZXJzLmg+CiAjaW5jbHVkZSA8bGludXgvZXJybm8u
aD4KIApAQCAtNDA3LDEwICs0MDgsMjIgQEAgS1VOSVRfQVJSQVlfUEFSQU0oZHJtX3JlY3Rfc2Nh
bGUsIGRybV9yZWN0X3NjYWxlX2Nhc2VzLCBkcm1fcmVjdF9zY2FsZV9jYXNlX2Rlc2MKIHN0YXRp
YyB2b2lkIGRybV90ZXN0X3JlY3RfY2FsY19oc2NhbGUoc3RydWN0IGt1bml0ICp0ZXN0KQogewog
CWNvbnN0IHN0cnVjdCBkcm1fcmVjdF9zY2FsZV9jYXNlICpwYXJhbXMgPSB0ZXN0LT5wYXJhbV92
YWx1ZTsKLQlpbnQgc2NhbGluZ19mYWN0b3I7CisJLyogV2l0aCBDT05GSUdfQlVHPW4sIFdBUk5f
T04oKSBpcyBhIG5vLW9wIHNvIG5vIHdhcm5pbmcgZmlyZXMuICovCisJaW50IGV4cGVjdGVkX3dh
cm5pbmdzID0gSVNfRU5BQkxFRChDT05GSUdfQlVHKSA/CisJCQkocGFyYW1zLT5leHBlY3RlZF9z
Y2FsaW5nX2ZhY3RvciA9PSAtRUlOVkFMKSA6IDA7CisJaW50IHNjYWxpbmdfZmFjdG9yID0gSU5U
X01JTjsKIAotCXNjYWxpbmdfZmFjdG9yID0gZHJtX3JlY3RfY2FsY19oc2NhbGUoJnBhcmFtcy0+
c3JjLCAmcGFyYW1zLT5kc3QsCi0JCQkJCSAgICAgIHBhcmFtcy0+bWluX3JhbmdlLCBwYXJhbXMt
Pm1heF9yYW5nZSk7CisJLyoKKwkgKiBkcm1fcmVjdF9jYWxjX2hzY2FsZSgpIGdlbmVyYXRlcyBh
IHdhcm5pbmcgYmFja3RyYWNlIHdoZW5ldmVyIGJhZAorCSAqIHBhcmFtZXRlcnMgYXJlIHBhc3Nl
ZCB0byBpdC4gVGhpcyBhZmZlY3RzIHVuaXQgdGVzdHMgd2l0aCAtRUlOVkFMCisJICogZXJyb3Ig
Y29kZSBpbiBleHBlY3RlZF9zY2FsaW5nX2ZhY3Rvci4KKwkgKi8KKwlrdW5pdF93YXJuaW5nX3N1
cHByZXNzKHRlc3QpIHsKKwkJc2NhbGluZ19mYWN0b3IgPSBkcm1fcmVjdF9jYWxjX2hzY2FsZSgm
cGFyYW1zLT5zcmMsICZwYXJhbXMtPmRzdCwKKwkJCQkJCSAgICAgIHBhcmFtcy0+bWluX3Jhbmdl
LAorCQkJCQkJICAgICAgcGFyYW1zLT5tYXhfcmFuZ2UpOworCQlLVU5JVF9FWFBFQ1RfU1VQUFJF
U1NFRF9XQVJOSU5HX0NPVU5UKHRlc3QsIGV4cGVjdGVkX3dhcm5pbmdzKTsKKwl9CiAKIAlLVU5J
VF9FWFBFQ1RfRVEodGVzdCwgc2NhbGluZ19mYWN0b3IsIHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGlu
Z19mYWN0b3IpOwogfQpAQCAtNDE4LDEwICs0MzEsMjEgQEAgc3RhdGljIHZvaWQgZHJtX3Rlc3Rf
cmVjdF9jYWxjX2hzY2FsZShzdHJ1Y3Qga3VuaXQgKnRlc3QpCiBzdGF0aWMgdm9pZCBkcm1fdGVz
dF9yZWN0X2NhbGNfdnNjYWxlKHN0cnVjdCBrdW5pdCAqdGVzdCkKIHsKIAljb25zdCBzdHJ1Y3Qg
ZHJtX3JlY3Rfc2NhbGVfY2FzZSAqcGFyYW1zID0gdGVzdC0+cGFyYW1fdmFsdWU7Ci0JaW50IHNj
YWxpbmdfZmFjdG9yOworCS8qIFdpdGggQ09ORklHX0JVRz1uLCBXQVJOX09OKCkgaXMgYSBuby1v
cCBzbyBubyB3YXJuaW5nIGZpcmVzLiAqLworCWludCBleHBlY3RlZF93YXJuaW5ncyA9IElTX0VO
QUJMRUQoQ09ORklHX0JVRykgPworCQkJKHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3Ig
PT0gLUVJTlZBTCkgOiAwOworCWludCBzY2FsaW5nX2ZhY3RvciA9IElOVF9NSU47CiAKLQlzY2Fs
aW5nX2ZhY3RvciA9IGRybV9yZWN0X2NhbGNfdnNjYWxlKCZwYXJhbXMtPnNyYywgJnBhcmFtcy0+
ZHN0LAotCQkJCQkgICAgICBwYXJhbXMtPm1pbl9yYW5nZSwgcGFyYW1zLT5tYXhfcmFuZ2UpOwor
CS8qCisJICogZHJtX3JlY3RfY2FsY192c2NhbGUoKSBnZW5lcmF0ZXMgYSB3YXJuaW5nIGJhY2t0
cmFjZSB3aGVuZXZlciBiYWQKKwkgKiBwYXJhbWV0ZXJzIGFyZSBwYXNzZWQgdG8gaXQuIFRoaXMg
YWZmZWN0cyB1bml0IHRlc3RzIHdpdGggLUVJTlZBTAorCSAqIGVycm9yIGNvZGUgaW4gZXhwZWN0
ZWRfc2NhbGluZ19mYWN0b3IuCisJICovCisJa3VuaXRfd2FybmluZ19zdXBwcmVzcyh0ZXN0KSB7
CisJCXNjYWxpbmdfZmFjdG9yID0gZHJtX3JlY3RfY2FsY192c2NhbGUoJnBhcmFtcy0+c3JjLCAm
cGFyYW1zLT5kc3QsCisJCQkJCQkgICAgICBwYXJhbXMtPm1pbl9yYW5nZSwgcGFyYW1zLT5tYXhf
cmFuZ2UpOworCQlLVU5JVF9FWFBFQ1RfU1VQUFJFU1NFRF9XQVJOSU5HX0NPVU5UKHRlc3QsIGV4
cGVjdGVkX3dhcm5pbmdzKTsKKwl9CiAKIAlLVU5JVF9FWFBFQ1RfRVEodGVzdCwgc2NhbGluZ19m
YWN0b3IsIHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IpOwogfQoKLS0gCjIuNTMuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
