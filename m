Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6287CCD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/h6nKLFurpmLb4fSzJ2asFqdocDURxAG0JcL+PtAbM=; b=iMdnWjo7rRiJ9b
	4cv3v3DccNmg5KR6t8b7eY2zgNvjDJviYd1STpWeCVDvcD9sJda5hrnr3iXT7yfdg3hoz+coiGp6q
	X4p/iiIsljCSWwDxz618Bp8eThHeAiwT1cBXl+xHFqodbOlSN689obmOXh+FDfB8EjYUWSUO07Dnh
	DcS8AqRiYJEbZH+QQFh9GAWQtBuG+9Bv6zNcwc7T1YotEyCfbUBlwDwE+ntb3VGH0KLfcD42WA4IS
	wc7FjvU/1SKogQkQz0p1rWh1ZibyVHHvWSs9ywkNGIEq4D6cCf7BXlYRzGzm+uiz2S8fVQQkfymTw
	oPVGCEUwbI1MFHL9fcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrgM-00000008KYF-2OS8;
	Fri, 15 May 2026 12:30:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrgJ-00000008KWc-12Ia
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 12:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778848218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEBwBuDymXqtgfipLBoE9xL2mtSkar53Y4il/kQ0kJw=;
	b=EQQbRGz7+Q0yUynk+rHZtHkrYruqpoYnUy2jEwSVB1GHtla0pr4Z+FbVH+toJRj7ranCNW
	WyLL6KIr8a4i1d5X0jXwy5VJN5qEAjT/Jsg59Q6M9l5O+zsXR9aNNPoymQMEws9Li8yWUO
	J78KCe8/3+tgmeQR/pVZlSwShqrgVwE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-359-UybKAniIMAeexXl0cBYm9Q-1; Fri,
 15 May 2026 08:30:13 -0400
X-MC-Unique: UybKAniIMAeexXl0cBYm9Q-1
X-Mimecast-MFC-AGG-ID: UybKAniIMAeexXl0cBYm9Q_1778848210
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB1411956062;
	Fri, 15 May 2026 12:30:09 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7939A1955F2D;
	Fri, 15 May 2026 12:30:02 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 15 May 2026 14:29:34 +0200
Subject: [PATCH v13 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
MIME-Version: 1.0
Message-Id: <20260515-kunit_add_support-v13-3-18ee42f96e7b@redhat.com>
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
In-Reply-To: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778848177; l=3810;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=rPDAUA5/eI1GmSDx2demf6AeqBwHHnfPFpVSMTL5AHs=;
 b=CiGtWAj3Sxok8xNBwNJhHUScegPnII9dD6Ao+Xj/BNFA55q4TmXHafnZTUAqUJuFBz5IHJJV0
 5zFsDpaeNgNBckO3B+KYyas5tKSbWBvU1wk6LFUULAn8R+ahjSwKqRm
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: MwLMH_3v4rE-tqQLxEXmhgm5PwtbW1H8VtPWoxnWn7g_1778848210
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_053019_351373_3EAF98C1 
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
