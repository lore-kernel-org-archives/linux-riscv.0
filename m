Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3416CCD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 11:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vKwzFJM5hJ3GwFG+9d2kWI1Ga34Lg2AmXx7jcUilmw=; b=EV7zwD2wSXXvOm
	UD9/+xDEBXI/n7uEt1ul7vg9YiWstyd+N2+O/y85RXkynylBZ9WLH1jOuANPekkd0VIK0ayLhkNcc
	/esiPhOhU9BTOeyy4sZs8t+FfM2Im1Eb5GHWpSpNM2jMx/lH/CIW10Y1ZnJmn+f7F898CcB+E8UrU
	s6ivE8kK7M1B3279Wi9L1PMJUn7Ml4lSv+45zV4iWL/3sOik4BwBd1VO4ndHMtHCUUvMrDTn2Ga5/
	KHib5s2HImUW5vEAWgAtvVQO64lYHDCeTrfGhRZudoJLyc1Oz8NDi2nth5B302yF/KjE0zCiubWyb
	OQHEj30TRpbiwYK+SZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTur-00000005HKv-0T9S;
	Thu, 14 May 2026 11:07:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTuo-00000005HJc-2eMi
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 11:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778756861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8CY2YJsmmGngQxdG/vGLXTsV2/RIfN8ZOdCKtJtf1o=;
	b=ZSiANocnfLnXIIjN+Y8EkE86fWUQkWGE0Ruod6BJ61yEXKvFkTruFtD3aEVZCva4D2HaFL
	bjM4sa32oSp2PpuJogfbHW/zDYpOoRu+qjOgoN8/C6fpdmrVyPaZ6HUGttT+GKigtEx4rZ
	zh4IY8MHAmGaK8UxMBY0XM+M1k2RO8o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-455-7jUcZvu6OcWTLEitMjFjZg-1; Thu,
 14 May 2026 07:07:38 -0400
X-MC-Unique: 7jUcZvu6OcWTLEitMjFjZg-1
X-Mimecast-MFC-AGG-ID: 7jUcZvu6OcWTLEitMjFjZg_1778756854
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E360E19560A7;
	Thu, 14 May 2026 11:07:33 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D4F119560A7;
	Thu, 14 May 2026 11:07:26 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 14 May 2026 13:06:39 +0200
Subject: [PATCH v11 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
MIME-Version: 1.0
Message-Id: <20260514-kunit_add_support-v11-3-b36a530a6d8f@redhat.com>
References: <20260514-kunit_add_support-v11-0-b36a530a6d8f@redhat.com>
In-Reply-To: <20260514-kunit_add_support-v11-0-b36a530a6d8f@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778756819; l=4041;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=Klk7dpYGfEKyFoYh8y/kwk/SyyLXG0VtsYE7Yd//vl0=;
 b=n21eaqCPj64RYBkQPsGq+uqVssXX70+qeWpaAZljGDE8NIT2cV2KTcaH6tKcsFPddVREEQ5ky
 6Cnkc9pBoEDArrWbzlE+mg4FQd0Mz6CIYVfZbos958n1vhgA8/kB5+S
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: k9IYEVGEYMq5YFg7UmDRph42bZRQbq7_jwLL4Su8ZGM_1778756854
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_040742_745945_844937F5 
X-CRM114-Status: GOOD (  15.12  )
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
bnRlbnRpb25hbGx5IHRyaWdnZXIgd2FybmluZyBiYWNrdHJhY2VzIGJ5IHByb3ZpZGluZyBiYWQg
cGFyYW1ldGVycyB0bwp0aGUgdGVzdGVkIGZ1bmN0aW9ucy4gV2hhdCBpcyB0ZXN0ZWQgaXMgdGhl
IHJldHVybiB2YWx1ZSwgbm90IHRoZSBleGlzdGVuY2UKb2YgYSB3YXJuaW5nIGJhY2t0cmFjZS4g
U3VwcHJlc3MgdGhlIGJhY2t0cmFjZXMgdG8gYXZvaWQgY2xvZ2dpbmcgdGhlCmtlcm5lbCBsb2cg
YW5kIGRpc3RyYWN0aW9uIGZyb20gcmVhbCBwcm9ibGVtcy4gQWRkaXRpb25hbGx5LCB0aGUKc3Vw
cHJlc3Npb24gQVBJIGFsbG93cyB0byBhY3R1YWxseSBlbnN1cmUgYSB3YXJuaW5nIHdhcyB0cmln
Z2VyZWQsCndpdGhvdXQgcGFyc2luZyBhbnkga2VybmVsIGxvZ3MgYW5kIGtlZXBpbmcgdGhlbSBj
bGVhbi4KVGhlIHN1cHByZXNzaW9uIGNoZWNrIHJlcXVpcmVzIENPTkZJR19CVUcgZW5hYmxlZC4K
ClRlc3RlZC1ieTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8u
b3JnPgpBY2tlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgpB
Y2tlZC1ieTogTWHDrXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT4KQ2M6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAZ21haWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpTaWduZWQtb2ZmLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+ClNpZ25l
ZC1vZmYtYnk6IEFsZXNzYW5kcm8gQ2FybWluYXRpIDxhY2FybWluYUByZWRoYXQuY29tPgpBY2tl
ZC1ieTogRGF2aWQgR293IDxkYXZpZEBkYXZpZGdvdy5uZXQ+ClNpZ25lZC1vZmYtYnk6IEFsYmVy
dCBFc3RldmUgPGFlc3RldmVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVzdHMv
ZHJtX3JlY3RfdGVzdC5jIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fcmVjdF90ZXN0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5jCmluZGV4IDE3ZTFmMzRiNzYxMDEuLjM0MDJmOTkz
ZDdkMzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fcmVjdF90ZXN0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYwpAQCAtMTAsNiArMTAs
NyBAQAogI2luY2x1ZGUgPGRybS9kcm1fcmVjdC5oPgogI2luY2x1ZGUgPGRybS9kcm1fbW9kZS5o
PgogCisjaW5jbHVkZSA8bGludXgvbGltaXRzLmg+CiAjaW5jbHVkZSA8bGludXgvc3RyaW5nX2hl
bHBlcnMuaD4KICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgogCkBAIC00MDcsMTAgKzQwOCwyNyBA
QCBLVU5JVF9BUlJBWV9QQVJBTShkcm1fcmVjdF9zY2FsZSwgZHJtX3JlY3Rfc2NhbGVfY2FzZXMs
IGRybV9yZWN0X3NjYWxlX2Nhc2VfZGVzYwogc3RhdGljIHZvaWQgZHJtX3Rlc3RfcmVjdF9jYWxj
X2hzY2FsZShzdHJ1Y3Qga3VuaXQgKnRlc3QpCiB7CiAJY29uc3Qgc3RydWN0IGRybV9yZWN0X3Nj
YWxlX2Nhc2UgKnBhcmFtcyA9IHRlc3QtPnBhcmFtX3ZhbHVlOwotCWludCBzY2FsaW5nX2ZhY3Rv
cjsKKwlpbnQgZXhwZWN0ZWRfd2FybmluZ3MgPSBwYXJhbXMtPmV4cGVjdGVkX3NjYWxpbmdfZmFj
dG9yID09IC1FSU5WQUw7CisJaW50IHNjYWxpbmdfZmFjdG9yID0gSU5UX01JTjsKIAotCXNjYWxp
bmdfZmFjdG9yID0gZHJtX3JlY3RfY2FsY19oc2NhbGUoJnBhcmFtcy0+c3JjLCAmcGFyYW1zLT5k
c3QsCi0JCQkJCSAgICAgIHBhcmFtcy0+bWluX3JhbmdlLCBwYXJhbXMtPm1heF9yYW5nZSk7CisJ
LyoKKwkgKiBXaXRob3V0IENPTkZJR19CVUcsIFdBUk5fT04oKSBpcyBhIG5vLW9wIGFuZCB0aGUg
c3VwcHJlc3NlZCB3YXJuaW5nCisJICogY291bnQgc3RheXMgemVybywgZmFpbGluZyB0aGUgYXNz
ZXJ0aW9uLgorCSAqLworCWlmIChleHBlY3RlZF93YXJuaW5ncyAmJiAhSVNfRU5BQkxFRChDT05G
SUdfQlVHKSkKKwkJa3VuaXRfc2tpcCh0ZXN0LCAicmVxdWlyZXMgQ09ORklHX0JVRyIpOworCisJ
LyoKKwkgKiBkcm1fcmVjdF9jYWxjX2hzY2FsZSgpIGdlbmVyYXRlcyBhIHdhcm5pbmcgYmFja3Ry
YWNlIHdoZW5ldmVyIGJhZAorCSAqIHBhcmFtZXRlcnMgYXJlIHBhc3NlZCB0byBpdC4gVGhpcyBh
ZmZlY3RzIHVuaXQgdGVzdHMgd2l0aCAtRUlOVkFMCisJICogZXJyb3IgY29kZSBpbiBleHBlY3Rl
ZF9zY2FsaW5nX2ZhY3Rvci4KKwkgKi8KKwlrdW5pdF93YXJuaW5nX3N1cHByZXNzKHRlc3QpIHsK
KwkJc2NhbGluZ19mYWN0b3IgPSBkcm1fcmVjdF9jYWxjX2hzY2FsZSgmcGFyYW1zLT5zcmMsICZw
YXJhbXMtPmRzdCwKKwkJCQkJCSAgICAgIHBhcmFtcy0+bWluX3JhbmdlLAorCQkJCQkJICAgICAg
cGFyYW1zLT5tYXhfcmFuZ2UpOworCQlLVU5JVF9FWFBFQ1RfU1VQUFJFU1NFRF9XQVJOSU5HX0NP
VU5UKHRlc3QsIGV4cGVjdGVkX3dhcm5pbmdzKTsKKwl9CiAKIAlLVU5JVF9FWFBFQ1RfRVEodGVz
dCwgc2NhbGluZ19mYWN0b3IsIHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IpOwogfQpA
QCAtNDE4LDEwICs0MzYsMjYgQEAgc3RhdGljIHZvaWQgZHJtX3Rlc3RfcmVjdF9jYWxjX2hzY2Fs
ZShzdHJ1Y3Qga3VuaXQgKnRlc3QpCiBzdGF0aWMgdm9pZCBkcm1fdGVzdF9yZWN0X2NhbGNfdnNj
YWxlKHN0cnVjdCBrdW5pdCAqdGVzdCkKIHsKIAljb25zdCBzdHJ1Y3QgZHJtX3JlY3Rfc2NhbGVf
Y2FzZSAqcGFyYW1zID0gdGVzdC0+cGFyYW1fdmFsdWU7Ci0JaW50IHNjYWxpbmdfZmFjdG9yOwor
CWludCBleHBlY3RlZF93YXJuaW5ncyA9IHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3Ig
PT0gLUVJTlZBTDsKKwlpbnQgc2NhbGluZ19mYWN0b3IgPSBJTlRfTUlOOwogCi0Jc2NhbGluZ19m
YWN0b3IgPSBkcm1fcmVjdF9jYWxjX3ZzY2FsZSgmcGFyYW1zLT5zcmMsICZwYXJhbXMtPmRzdCwK
LQkJCQkJICAgICAgcGFyYW1zLT5taW5fcmFuZ2UsIHBhcmFtcy0+bWF4X3JhbmdlKTsKKwkvKgor
CSAqIFdpdGhvdXQgQ09ORklHX0JVRywgV0FSTl9PTigpIGlzIGEgbm8tb3AgYW5kIHRoZSBzdXBw
cmVzc2VkIHdhcm5pbmcKKwkgKiBjb3VudCBzdGF5cyB6ZXJvLCBmYWlsaW5nIHRoZSBhc3NlcnRp
b24uCisJICovCisJaWYgKGV4cGVjdGVkX3dhcm5pbmdzICYmICFJU19FTkFCTEVEKENPTkZJR19C
VUcpKQorCQlrdW5pdF9za2lwKHRlc3QsICJyZXF1aXJlcyBDT05GSUdfQlVHIik7CisKKwkvKgor
CSAqIGRybV9yZWN0X2NhbGNfdnNjYWxlKCkgZ2VuZXJhdGVzIGEgd2FybmluZyBiYWNrdHJhY2Ug
d2hlbmV2ZXIgYmFkCisJICogcGFyYW1ldGVycyBhcmUgcGFzc2VkIHRvIGl0LiBUaGlzIGFmZmVj
dHMgdW5pdCB0ZXN0cyB3aXRoIC1FSU5WQUwKKwkgKiBlcnJvciBjb2RlIGluIGV4cGVjdGVkX3Nj
YWxpbmdfZmFjdG9yLgorCSAqLworCWt1bml0X3dhcm5pbmdfc3VwcHJlc3ModGVzdCkgeworCQlz
Y2FsaW5nX2ZhY3RvciA9IGRybV9yZWN0X2NhbGNfdnNjYWxlKCZwYXJhbXMtPnNyYywgJnBhcmFt
cy0+ZHN0LAorCQkJCQkJICAgICAgcGFyYW1zLT5taW5fcmFuZ2UsIHBhcmFtcy0+bWF4X3Jhbmdl
KTsKKwkJS1VOSVRfRVhQRUNUX1NVUFBSRVNTRURfV0FSTklOR19DT1VOVCh0ZXN0LCBleHBlY3Rl
ZF93YXJuaW5ncyk7CisJfQogCiAJS1VOSVRfRVhQRUNUX0VRKHRlc3QsIHNjYWxpbmdfZmFjdG9y
LCBwYXJhbXMtPmV4cGVjdGVkX3NjYWxpbmdfZmFjdG9yKTsKIH0KCi0tIAoyLjUzLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
