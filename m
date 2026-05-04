Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D3ECD3423
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 07:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWxnSzmnTEOv0lhTF+6G/12B3Y9jBIaABFw0DABkl6w=; b=ZvcZfCQkIF3P/Y
	vK5gAxdrJ7k+SxX3sxiJMuwYbRNT6MEWCU+sJe/9ybUWJtBZBsaFg53NJKlnuds8QMtKrxbieHIhe
	KGXo18AegcfSblsS17xtWDPkwfx13qBDuj0WenZSJNnK5lHIjWroQAB5OUVYtEk5wCc4XyxOT/LpV
	Jl6knL7fhsmViXeOrxoUaRGN2RkUCdz8s3qXi634DUsk7EUf1bT7s3p/Yaznt7Uc3kJ1RwGe+pldA
	IjsItpyg8VQIKOZg1zEPsFg0yiAVkiK2B7frSaLwDNHMJA+2b8lhnM+MMcWxN9356+Gxn36PZg36X
	DNKFHNH5V8kRWHLAQQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnwi-0000000CdBD-1Lq4;
	Mon, 04 May 2026 07:42:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnwe-0000000Cd9v-19y8
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 May 2026 07:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gOKf73DcJr3/JAze0LuQpsRljfWR1d0ve3pogQMoikE=; b=iARh4AbXuG9ZXmGm8EjMIgVILf
	1qeB3vXWnjbSnkuYYQR2XAH2OWGZPAQNQZm6QIm9b6YWWtj2JKTogm+QX/7Mh7yEp4m4rLHtZGay2
	odc6JCgNnzeP7KgLryN1piYaqrNzWlogoa+cJUr8v7w6vygr0CI//yBFKfwHkyizWC0MV/mzyLS4n
	HesLbQLxtReOFAMz/lOs6gI34sm/Oe24h+TefwGlwgzSpUqQ3fe7/Tk2IRmMkRysQLXRjbFGVGt3r
	72uddPQx9iKaLOckmOmySxepvWmDv/e09ORWXVIpHvy/IC/k0crc9cCAXlv87fUaBrjvqv2rP1Eq0
	Eub+pt6Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnwZ-0000000B3vN-0whu
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 07:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777880530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOKf73DcJr3/JAze0LuQpsRljfWR1d0ve3pogQMoikE=;
	b=Y5UheWgbIBO4BpUm1M/Ov3ZiOLd2ifgnE8DJbX9xcHY7AzrO9boAnStbxALUvFqMGqZWq3
	d4TQ6nEC6GMczxWzbRqApDddYpY9ZU0NBTL9CajFl3rHOlgLukdDxGJq4faqcTeymOLSrS
	9sLWQMljXNXUa8o6PcBgwZSlN25E0X4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777880538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOKf73DcJr3/JAze0LuQpsRljfWR1d0ve3pogQMoikE=;
	b=Y5vjIklYh4Jhlce8K1yeejMVQwnj7uZHxnnKk6rAVBPjb1XpuiQYlK5TC+m69jW5jS3mTE
	vzTp1TK9InGdawb+eaO83UdmRThH/Ml4N7WInczg8JprOTgxOFLUCjcRUTeLb+o5ZXcnjj
	igTw8y19rtIYTnHJs9H8T/Hn92vrYSU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-577-oRkOntUwMsyWrjHIIS31fQ-1; Mon,
 04 May 2026 03:42:09 -0400
X-MC-Unique: oRkOntUwMsyWrjHIIS31fQ-1
X-Mimecast-MFC-AGG-ID: oRkOntUwMsyWrjHIIS31fQ_1777880525
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE5E21956088;
	Mon,  4 May 2026 07:42:04 +0000 (UTC)
Received: from [192.168.1.153] (headnet01.pony-001.prod.iad2.dc.redhat.com [10.2.32.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE79D1955D84;
	Mon,  4 May 2026 07:41:56 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 04 May 2026 09:41:27 +0200
Subject: [PATCH v8 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
MIME-Version: 1.0
Message-Id: <20260504-kunit_add_support-v8-3-3e5957cdd235@redhat.com>
References: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
In-Reply-To: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
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
 Dan Carpenter <dan.carpenter@linaro.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Alessandro Carminati <acarmina@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777880489; l=2693;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=bGqCNzhIOGnVl/NfnUqExLX0/n0ZkI03UY6zDNsA5Oc=;
 b=Jb29iLKaaVTR7v5Dlr1/i2Ay+tOHiXVtL5zSM8WqXh29zv8ysgXgUHMDrE0l6z7IQH7slKIiX
 vNIBwlPkSVqAHz8EpMgT6x8oGYb3Y71H/+mI7IaMSCNPTqLSIsvuS26
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: hawXtmnj2uE5Bgo8ABS0bmdTji2xWQ9dlYHrmPyCY38_1777880525
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_084219_716986_F684D5E7 
X-CRM114-Status: GOOD (  12.82  )
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
YW5kIGRpc3RyYWN0aW9uIGZyb20gcmVhbCBwcm9ibGVtcy4KClRlc3RlZC1ieTogTGludXggS2Vy
bmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8ub3JnPgpBY2tlZC1ieTogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgpBY2tlZC1ieTogTWHDrXJhIENhbmFs
IDxtY2FuYWxAaWdhbGlhLmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29t
PgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBHdWVu
dGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+ClNpZ25lZC1vZmYtYnk6IEFsZXNzYW5kcm8g
Q2FybWluYXRpIDxhY2FybWluYUByZWRoYXQuY29tPgpBY2tlZC1ieTogRGF2aWQgR293IDxkYXZp
ZEBkYXZpZGdvdy5uZXQ+ClNpZ25lZC1vZmYtYnk6IEFsYmVydCBFc3RldmUgPGFlc3RldmVAcmVk
aGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5jIHwgMjMg
KysrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1f
cmVjdF90ZXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5jCmluZGV4
IDE3ZTFmMzRiNzYxMDEuLjgxOGUxNmU4MGM4ZjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZXN0cy9kcm1fcmVjdF90ZXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9y
ZWN0X3Rlc3QuYwpAQCAtNDA5LDggKzQwOSwxNiBAQCBzdGF0aWMgdm9pZCBkcm1fdGVzdF9yZWN0
X2NhbGNfaHNjYWxlKHN0cnVjdCBrdW5pdCAqdGVzdCkKIAljb25zdCBzdHJ1Y3QgZHJtX3JlY3Rf
c2NhbGVfY2FzZSAqcGFyYW1zID0gdGVzdC0+cGFyYW1fdmFsdWU7CiAJaW50IHNjYWxpbmdfZmFj
dG9yOwogCi0Jc2NhbGluZ19mYWN0b3IgPSBkcm1fcmVjdF9jYWxjX2hzY2FsZSgmcGFyYW1zLT5z
cmMsICZwYXJhbXMtPmRzdCwKLQkJCQkJICAgICAgcGFyYW1zLT5taW5fcmFuZ2UsIHBhcmFtcy0+
bWF4X3JhbmdlKTsKKwkvKgorCSAqIGRybV9yZWN0X2NhbGNfaHNjYWxlKCkgZ2VuZXJhdGVzIGEg
d2FybmluZyBiYWNrdHJhY2Ugd2hlbmV2ZXIgYmFkCisJICogcGFyYW1ldGVycyBhcmUgcGFzc2Vk
IHRvIGl0LiBUaGlzIGFmZmVjdHMgYWxsIHVuaXQgdGVzdHMgd2l0aCBhbgorCSAqIGVycm9yIGNv
ZGUgaW4gZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IuCisJICovCisJa3VuaXRfd2FybmluZ19zdXBw
cmVzcyh0ZXN0KSB7CisJCXNjYWxpbmdfZmFjdG9yID0gZHJtX3JlY3RfY2FsY19oc2NhbGUoJnBh
cmFtcy0+c3JjLCAmcGFyYW1zLT5kc3QsCisJCQkJCQkgICAgICBwYXJhbXMtPm1pbl9yYW5nZSwK
KwkJCQkJCSAgICAgIHBhcmFtcy0+bWF4X3JhbmdlKTsKKwl9CiAKIAlLVU5JVF9FWFBFQ1RfRVEo
dGVzdCwgc2NhbGluZ19mYWN0b3IsIHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IpOwog
fQpAQCAtNDIwLDggKzQyOCwxNSBAQCBzdGF0aWMgdm9pZCBkcm1fdGVzdF9yZWN0X2NhbGNfdnNj
YWxlKHN0cnVjdCBrdW5pdCAqdGVzdCkKIAljb25zdCBzdHJ1Y3QgZHJtX3JlY3Rfc2NhbGVfY2Fz
ZSAqcGFyYW1zID0gdGVzdC0+cGFyYW1fdmFsdWU7CiAJaW50IHNjYWxpbmdfZmFjdG9yOwogCi0J
c2NhbGluZ19mYWN0b3IgPSBkcm1fcmVjdF9jYWxjX3ZzY2FsZSgmcGFyYW1zLT5zcmMsICZwYXJh
bXMtPmRzdCwKLQkJCQkJICAgICAgcGFyYW1zLT5taW5fcmFuZ2UsIHBhcmFtcy0+bWF4X3Jhbmdl
KTsKKwkvKgorCSAqIGRybV9yZWN0X2NhbGNfdnNjYWxlKCkgZ2VuZXJhdGVzIGEgd2FybmluZyBi
YWNrdHJhY2Ugd2hlbmV2ZXIgYmFkCisJICogcGFyYW1ldGVycyBhcmUgcGFzc2VkIHRvIGl0LiBU
aGlzIGFmZmVjdHMgYWxsIHVuaXQgdGVzdHMgd2l0aCBhbgorCSAqIGVycm9yIGNvZGUgaW4gZXhw
ZWN0ZWRfc2NhbGluZ19mYWN0b3IuCisJICovCisJa3VuaXRfd2FybmluZ19zdXBwcmVzcyh0ZXN0
KSB7CisJCXNjYWxpbmdfZmFjdG9yID0gZHJtX3JlY3RfY2FsY192c2NhbGUoJnBhcmFtcy0+c3Jj
LCAmcGFyYW1zLT5kc3QsCisJCQkJCQkgICAgICBwYXJhbXMtPm1pbl9yYW5nZSwgcGFyYW1zLT5t
YXhfcmFuZ2UpOworCX0KIAogCUtVTklUX0VYUEVDVF9FUSh0ZXN0LCBzY2FsaW5nX2ZhY3Rvciwg
cGFyYW1zLT5leHBlY3RlZF9zY2FsaW5nX2ZhY3Rvcik7CiB9CgotLSAKMi41My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
