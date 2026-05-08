Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B695CD3445
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 15:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKSj9nCP0EGo0Zvm746387yDgvpm7TL0MFPVuPcxKDg=; b=hKu6NcSWw/kNqU
	QlJ3iPuK+YQUb1xk5cyz4n1t4oT+/1FT60G8doJy6P8KJBaHCF7TK3i6FN3iBQVZNv3YkDRldJ4X8
	Bq5TntaiLv7A8Kkw/mMvkT3kkLPFwknKpUMvBewh4do6lgEJOA2RMfgvIdQYnxbqf9mYQHF9foR56
	VF9RagRuEYiJKAJWnQ5+gcOm7lPRCIuqkynJWaKF/lVOnFLG5ODoxW8kH1ZXM1702k17WU7HfeD4h
	pjZfd8ASkuSgqZSpqA2HjFFSJGqKiu3NBuK2GqTrI4oMfBG8lUoXLR1haW0nw4cG12SP1WORgWUi2
	ASADxs+6l+gYlEexcnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMjy-00000006liC-3JjE;
	Fri, 08 May 2026 15:03:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMjx-00000006lhb-13Wp
	for linux-riscv@bombadil.infradead.org;
	Fri, 08 May 2026 15:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pTM5bDRFu2LnEWelZ4UVeTQriZB7mfNT46GLFzc2/xE=; b=R5uOYC1KSLbt5wcGOMKC3y5dVb
	pQKdfGWJOrnnPTweU+BpyVoc1AZ1KSHpuxRc0JPDlwzRqeQRDJWnxg49SE0WM2vpP5erUMIzEo1eU
	3FV1a90ZPAkxPrJrmgy8fKqlhaOaGOLRjSa5fynD3I11+3DcwEW2/RFcL7qhGz4WdeqNg3r6CUW2U
	coSTXcU92HqEtWaVXcT5lc+BQfGnwkHOZXcVVCbdRXjLH9wv5ctlH3jHpiy2p/TqBeykEzlYuzMKZ
	Xx/h3ubZH3X8Z0HSVpKaHfQE6uA07gl/Jwz5po6fALIMFHRbR9Wnth/D3fRY8duSGeykaALskEN2L
	it8U8T5A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMjt-00000006cn1-2qM1
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 15:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778252620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTM5bDRFu2LnEWelZ4UVeTQriZB7mfNT46GLFzc2/xE=;
	b=ip1xIDxdv5dIenGbBZpuGs4XDiHqHX9BAhrIjHVIe5+xQbWWnLR6ZBh7NskL/DxV/eMjfB
	nfRKtv1DaLWqXZAH757RxjSqS6k3CYt30yVjiWTi7EC71F36B0wx6SHrz2VokKITkB8Fr6
	NXiQk9FpWO3bsiNSKcIkj/8IfygvwhM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778252620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTM5bDRFu2LnEWelZ4UVeTQriZB7mfNT46GLFzc2/xE=;
	b=ip1xIDxdv5dIenGbBZpuGs4XDiHqHX9BAhrIjHVIe5+xQbWWnLR6ZBh7NskL/DxV/eMjfB
	nfRKtv1DaLWqXZAH757RxjSqS6k3CYt30yVjiWTi7EC71F36B0wx6SHrz2VokKITkB8Fr6
	NXiQk9FpWO3bsiNSKcIkj/8IfygvwhM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-CspO-cBrOmeqIlR5CcKP1A-1; Fri,
 08 May 2026 11:03:31 -0400
X-MC-Unique: CspO-cBrOmeqIlR5CcKP1A-1
X-Mimecast-MFC-AGG-ID: CspO-cBrOmeqIlR5CcKP1A_1778252605
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB9FC19560B7;
	Fri,  8 May 2026 15:03:24 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D8224180075F;
	Fri,  8 May 2026 15:03:17 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 08 May 2026 17:02:47 +0200
Subject: [PATCH v9 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
MIME-Version: 1.0
Message-Id: <20260508-kunit_add_support-v9-3-99df7aa880f6@redhat.com>
References: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com>
In-Reply-To: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778252571; l=3273;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=OzxKDl7juzBnGFv8nRO4KYyX446iqYsOHsLTSHCA/XY=;
 b=eRPZlXY0oZGNDAQpUv/i+XN1tRR4oFcuvNsNePj/TPFZTO4ljQZ5s0YOyA05Z0ONI4q4xTFKo
 R+2fJodStnmDnC9kzZ4GrIUOUC3P+HSFidoOMOuCg2vOOBDrpbup0Ao
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: KCu2cjkzT9k0c3jAx0s2vy6U40DdT0q1LW3C33qG9Dg_1778252605
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_160342_770712_6795DFD8 
X-CRM114-Status: GOOD (  13.22  )
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
dGVzdHMvZHJtX3JlY3RfdGVzdC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3Rlc3RzL2RybV9yZWN0X3Rlc3QuYwppbmRleCAxN2UxZjM0Yjc2MTAxLi44MDllNzNjYjc0
NDk4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fcmVjdF90ZXN0LmMKQEAgLTQwNywxMCArNDA3
LDIwIEBAIEtVTklUX0FSUkFZX1BBUkFNKGRybV9yZWN0X3NjYWxlLCBkcm1fcmVjdF9zY2FsZV9j
YXNlcywgZHJtX3JlY3Rfc2NhbGVfY2FzZV9kZXNjCiBzdGF0aWMgdm9pZCBkcm1fdGVzdF9yZWN0
X2NhbGNfaHNjYWxlKHN0cnVjdCBrdW5pdCAqdGVzdCkKIHsKIAljb25zdCBzdHJ1Y3QgZHJtX3Jl
Y3Rfc2NhbGVfY2FzZSAqcGFyYW1zID0gdGVzdC0+cGFyYW1fdmFsdWU7CisJaW50IGV4cGVjdGVk
X3dhcm5pbmdzID0gcGFyYW1zLT5leHBlY3RlZF9zY2FsaW5nX2ZhY3RvciA9PSAtRUlOVkFMOwog
CWludCBzY2FsaW5nX2ZhY3RvcjsKIAotCXNjYWxpbmdfZmFjdG9yID0gZHJtX3JlY3RfY2FsY19o
c2NhbGUoJnBhcmFtcy0+c3JjLCAmcGFyYW1zLT5kc3QsCi0JCQkJCSAgICAgIHBhcmFtcy0+bWlu
X3JhbmdlLCBwYXJhbXMtPm1heF9yYW5nZSk7CisJLyoKKwkgKiBkcm1fcmVjdF9jYWxjX2hzY2Fs
ZSgpIGdlbmVyYXRlcyBhIHdhcm5pbmcgYmFja3RyYWNlIHdoZW5ldmVyIGJhZAorCSAqIHBhcmFt
ZXRlcnMgYXJlIHBhc3NlZCB0byBpdC4gVGhpcyBhZmZlY3RzIHVuaXQgdGVzdHMgd2l0aCAtRUlO
VkFMCisJICogZXJyb3IgY29kZSBpbiBleHBlY3RlZF9zY2FsaW5nX2ZhY3Rvci4KKwkgKi8KKwlr
dW5pdF93YXJuaW5nX3N1cHByZXNzKHRlc3QpIHsKKwkJc2NhbGluZ19mYWN0b3IgPSBkcm1fcmVj
dF9jYWxjX2hzY2FsZSgmcGFyYW1zLT5zcmMsICZwYXJhbXMtPmRzdCwKKwkJCQkJCSAgICAgIHBh
cmFtcy0+bWluX3JhbmdlLAorCQkJCQkJICAgICAgcGFyYW1zLT5tYXhfcmFuZ2UpOworCQlLVU5J
VF9FWFBFQ1RfU1VQUFJFU1NFRF9XQVJOSU5HX0NPVU5UKHRlc3QsIGV4cGVjdGVkX3dhcm5pbmdz
KTsKKwl9CiAKIAlLVU5JVF9FWFBFQ1RfRVEodGVzdCwgc2NhbGluZ19mYWN0b3IsIHBhcmFtcy0+
ZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IpOwogfQpAQCAtNDE4LDEwICs0MjgsMTkgQEAgc3RhdGlj
IHZvaWQgZHJtX3Rlc3RfcmVjdF9jYWxjX2hzY2FsZShzdHJ1Y3Qga3VuaXQgKnRlc3QpCiBzdGF0
aWMgdm9pZCBkcm1fdGVzdF9yZWN0X2NhbGNfdnNjYWxlKHN0cnVjdCBrdW5pdCAqdGVzdCkKIHsK
IAljb25zdCBzdHJ1Y3QgZHJtX3JlY3Rfc2NhbGVfY2FzZSAqcGFyYW1zID0gdGVzdC0+cGFyYW1f
dmFsdWU7CisJaW50IGV4cGVjdGVkX3dhcm5pbmdzID0gcGFyYW1zLT5leHBlY3RlZF9zY2FsaW5n
X2ZhY3RvciA9PSAtRUlOVkFMOwogCWludCBzY2FsaW5nX2ZhY3RvcjsKIAotCXNjYWxpbmdfZmFj
dG9yID0gZHJtX3JlY3RfY2FsY192c2NhbGUoJnBhcmFtcy0+c3JjLCAmcGFyYW1zLT5kc3QsCi0J
CQkJCSAgICAgIHBhcmFtcy0+bWluX3JhbmdlLCBwYXJhbXMtPm1heF9yYW5nZSk7CisJLyoKKwkg
KiBkcm1fcmVjdF9jYWxjX3ZzY2FsZSgpIGdlbmVyYXRlcyBhIHdhcm5pbmcgYmFja3RyYWNlIHdo
ZW5ldmVyIGJhZAorCSAqIHBhcmFtZXRlcnMgYXJlIHBhc3NlZCB0byBpdC4gVGhpcyBhZmZlY3Rz
IHVuaXQgdGVzdHMgd2l0aCAtRUlOVkFMCisJICogZXJyb3IgY29kZSBpbiBleHBlY3RlZF9zY2Fs
aW5nX2ZhY3Rvci4KKwkgKi8KKwlrdW5pdF93YXJuaW5nX3N1cHByZXNzKHRlc3QpIHsKKwkJc2Nh
bGluZ19mYWN0b3IgPSBkcm1fcmVjdF9jYWxjX3ZzY2FsZSgmcGFyYW1zLT5zcmMsICZwYXJhbXMt
PmRzdCwKKwkJCQkJCSAgICAgIHBhcmFtcy0+bWluX3JhbmdlLCBwYXJhbXMtPm1heF9yYW5nZSk7
CisJCUtVTklUX0VYUEVDVF9TVVBQUkVTU0VEX1dBUk5JTkdfQ09VTlQodGVzdCwgZXhwZWN0ZWRf
d2FybmluZ3MpOworCX0KIAogCUtVTklUX0VYUEVDVF9FUSh0ZXN0LCBzY2FsaW5nX2ZhY3Rvciwg
cGFyYW1zLT5leHBlY3RlZF9zY2FsaW5nX2ZhY3Rvcik7CiB9CgotLSAKMi41My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
