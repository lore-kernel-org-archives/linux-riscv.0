Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D66CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvv52PaOUhJdoqkQV4Ut9ZJjgYkUaf3d5Ez8IqTWsg0=; b=UKp/CPljDN/YrZ
	ceeBo4XZ2xANFbP1DM5jdWqn4f1S14siz7XrjRV46e8SUK7vKLnnc1whMHOitsRFhHR1vr3uyj8JA
	WxKsXlRbybHiNWwtjEhIAp+WKEoXbCPbJCQEtDIQRojmCCB0VJ15p23juJcZzkGdRKV5AoHT2t0QX
	d9PchD68N56uiLgQt4mp5UqJI1V5Az6OGIQhpIXrGJ68Qhf1g1cK4/4qnT+dq+PQUnrCMh+kfZSli
	JAJbM/of16B6fqMAtmR7n53f9Q0Kqm921u37gHE7Rwrjxu+L1LV0q7W72ZvKbERsPLh/ZE0JcIaXG
	SQM1Qh+fj0VavlvfhNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN44M-00000001ZpY-2W25;
	Wed, 13 May 2026 07:31:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN44J-00000001Znm-1dFx
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778657506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9VmwbyIr43DI9aBRn14iL8hIHXkG+/dVlVf1GkheCho=;
	b=Xb/47QDSOjlvGsyLxVpsZ7nQiM79yS9XC2Z5cpVRYCE2dBq9/bul4r/iJgF8PtsS062Z0H
	8fyp66ku4RWDh86TvNZknz8H1csDziR4GoEdnv+/858GISzFUlWos2zJ0+JG+K+ACGEMxj
	6nCj/LYcF2wgNgcWcJNJ/SK+NoEgk7E=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-psgeaDq_MP-F2Pmj9CSbBg-1; Wed,
 13 May 2026 03:31:40 -0400
X-MC-Unique: psgeaDq_MP-F2Pmj9CSbBg-1
X-Mimecast-MFC-AGG-ID: psgeaDq_MP-F2Pmj9CSbBg_1778657497
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF693195604F;
	Wed, 13 May 2026 07:31:35 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4FF3B1800349;
	Wed, 13 May 2026 07:31:27 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 13 May 2026 09:30:53 +0200
Subject: [PATCH v10 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
MIME-Version: 1.0
Message-Id: <20260513-kunit_add_support-v10-3-e379d206c8cd@redhat.com>
References: <20260513-kunit_add_support-v10-0-e379d206c8cd@redhat.com>
In-Reply-To: <20260513-kunit_add_support-v10-0-e379d206c8cd@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778657458; l=3516;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=hoEgYTpw6Lu8CA0ZeNX0w091KWR/npNvIhz8UU+VX3U=;
 b=agey8CnWb/SCE3tMfZk9IcrGlaI6GwN6tZSlAkFyH12f++g9/Ja7BQ8Yx0+OjyEqIIxpX4or3
 1oeBpAafhZYCkAZQrVCO4cP2MnR5k0dvrPmn7V1ua/Ag9RBSfS3mZ0C
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: yDSkyn5g__n-rDPc7-DAlmPethOd-tSiSAKLWReYxS4_1778657497
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_003147_508266_52FB7568 
X-CRM114-Status: GOOD (  14.36  )
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
bGVhbi4KClRlc3RlZC1ieTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBs
aW5hcm8ub3JnPgpBY2tlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8u
b3JnPgpBY2tlZC1ieTogTWHDrXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT4KQ2M6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+
ClNpZ25lZC1vZmYtYnk6IEFsZXNzYW5kcm8gQ2FybWluYXRpIDxhY2FybWluYUByZWRoYXQuY29t
PgpBY2tlZC1ieTogRGF2aWQgR293IDxkYXZpZEBkYXZpZGdvdy5uZXQ+ClNpZ25lZC1vZmYtYnk6
IEFsYmVydCBFc3RldmUgPGFlc3RldmVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dGVzdHMvZHJtX3JlY3RfdGVzdC5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fcmVjdF90ZXN0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5jCmluZGV4IDE3ZTFmMzRiNzYxMDEuLmNjYzc0
MWI2MTkxZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fcmVjdF90ZXN0
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYwpAQCAtMTAsNiAr
MTAsNyBAQAogI2luY2x1ZGUgPGRybS9kcm1fcmVjdC5oPgogI2luY2x1ZGUgPGRybS9kcm1fbW9k
ZS5oPgogCisjaW5jbHVkZSA8bGludXgvbGltaXRzLmg+CiAjaW5jbHVkZSA8bGludXgvc3RyaW5n
X2hlbHBlcnMuaD4KICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgogCkBAIC00MDcsMTAgKzQwOCwy
MCBAQCBLVU5JVF9BUlJBWV9QQVJBTShkcm1fcmVjdF9zY2FsZSwgZHJtX3JlY3Rfc2NhbGVfY2Fz
ZXMsIGRybV9yZWN0X3NjYWxlX2Nhc2VfZGVzYwogc3RhdGljIHZvaWQgZHJtX3Rlc3RfcmVjdF9j
YWxjX2hzY2FsZShzdHJ1Y3Qga3VuaXQgKnRlc3QpCiB7CiAJY29uc3Qgc3RydWN0IGRybV9yZWN0
X3NjYWxlX2Nhc2UgKnBhcmFtcyA9IHRlc3QtPnBhcmFtX3ZhbHVlOwotCWludCBzY2FsaW5nX2Zh
Y3RvcjsKKwlpbnQgZXhwZWN0ZWRfd2FybmluZ3MgPSBwYXJhbXMtPmV4cGVjdGVkX3NjYWxpbmdf
ZmFjdG9yID09IC1FSU5WQUw7CisJaW50IHNjYWxpbmdfZmFjdG9yID0gSU5UX01JTjsKIAotCXNj
YWxpbmdfZmFjdG9yID0gZHJtX3JlY3RfY2FsY19oc2NhbGUoJnBhcmFtcy0+c3JjLCAmcGFyYW1z
LT5kc3QsCi0JCQkJCSAgICAgIHBhcmFtcy0+bWluX3JhbmdlLCBwYXJhbXMtPm1heF9yYW5nZSk7
CisJLyoKKwkgKiBkcm1fcmVjdF9jYWxjX2hzY2FsZSgpIGdlbmVyYXRlcyBhIHdhcm5pbmcgYmFj
a3RyYWNlIHdoZW5ldmVyIGJhZAorCSAqIHBhcmFtZXRlcnMgYXJlIHBhc3NlZCB0byBpdC4gVGhp
cyBhZmZlY3RzIHVuaXQgdGVzdHMgd2l0aCAtRUlOVkFMCisJICogZXJyb3IgY29kZSBpbiBleHBl
Y3RlZF9zY2FsaW5nX2ZhY3Rvci4KKwkgKi8KKwlrdW5pdF93YXJuaW5nX3N1cHByZXNzKHRlc3Qp
IHsKKwkJc2NhbGluZ19mYWN0b3IgPSBkcm1fcmVjdF9jYWxjX2hzY2FsZSgmcGFyYW1zLT5zcmMs
ICZwYXJhbXMtPmRzdCwKKwkJCQkJCSAgICAgIHBhcmFtcy0+bWluX3JhbmdlLAorCQkJCQkJICAg
ICAgcGFyYW1zLT5tYXhfcmFuZ2UpOworCQlLVU5JVF9FWFBFQ1RfU1VQUFJFU1NFRF9XQVJOSU5H
X0NPVU5UKHRlc3QsIGV4cGVjdGVkX3dhcm5pbmdzKTsKKwl9CiAKIAlLVU5JVF9FWFBFQ1RfRVEo
dGVzdCwgc2NhbGluZ19mYWN0b3IsIHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IpOwog
fQpAQCAtNDE4LDEwICs0MjksMTkgQEAgc3RhdGljIHZvaWQgZHJtX3Rlc3RfcmVjdF9jYWxjX2hz
Y2FsZShzdHJ1Y3Qga3VuaXQgKnRlc3QpCiBzdGF0aWMgdm9pZCBkcm1fdGVzdF9yZWN0X2NhbGNf
dnNjYWxlKHN0cnVjdCBrdW5pdCAqdGVzdCkKIHsKIAljb25zdCBzdHJ1Y3QgZHJtX3JlY3Rfc2Nh
bGVfY2FzZSAqcGFyYW1zID0gdGVzdC0+cGFyYW1fdmFsdWU7Ci0JaW50IHNjYWxpbmdfZmFjdG9y
OworCWludCBleHBlY3RlZF93YXJuaW5ncyA9IHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGluZ19mYWN0
b3IgPT0gLUVJTlZBTDsKKwlpbnQgc2NhbGluZ19mYWN0b3IgPSBJTlRfTUlOOwogCi0Jc2NhbGlu
Z19mYWN0b3IgPSBkcm1fcmVjdF9jYWxjX3ZzY2FsZSgmcGFyYW1zLT5zcmMsICZwYXJhbXMtPmRz
dCwKLQkJCQkJICAgICAgcGFyYW1zLT5taW5fcmFuZ2UsIHBhcmFtcy0+bWF4X3JhbmdlKTsKKwkv
KgorCSAqIGRybV9yZWN0X2NhbGNfdnNjYWxlKCkgZ2VuZXJhdGVzIGEgd2FybmluZyBiYWNrdHJh
Y2Ugd2hlbmV2ZXIgYmFkCisJICogcGFyYW1ldGVycyBhcmUgcGFzc2VkIHRvIGl0LiBUaGlzIGFm
ZmVjdHMgdW5pdCB0ZXN0cyB3aXRoIC1FSU5WQUwKKwkgKiBlcnJvciBjb2RlIGluIGV4cGVjdGVk
X3NjYWxpbmdfZmFjdG9yLgorCSAqLworCWt1bml0X3dhcm5pbmdfc3VwcHJlc3ModGVzdCkgewor
CQlzY2FsaW5nX2ZhY3RvciA9IGRybV9yZWN0X2NhbGNfdnNjYWxlKCZwYXJhbXMtPnNyYywgJnBh
cmFtcy0+ZHN0LAorCQkJCQkJICAgICAgcGFyYW1zLT5taW5fcmFuZ2UsIHBhcmFtcy0+bWF4X3Jh
bmdlKTsKKwkJS1VOSVRfRVhQRUNUX1NVUFBSRVNTRURfV0FSTklOR19DT1VOVCh0ZXN0LCBleHBl
Y3RlZF93YXJuaW5ncyk7CisJfQogCiAJS1VOSVRfRVhQRUNUX0VRKHRlc3QsIHNjYWxpbmdfZmFj
dG9yLCBwYXJhbXMtPmV4cGVjdGVkX3NjYWxpbmdfZmFjdG9yKTsKIH0KCi0tIAoyLjUzLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
