Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6AEC83F12
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sev0ABGf7SBJO+qKtrpWu4el2TASeh6YsomMqxVYawU=; b=1IkAQ5bNYwDhgz
	i57p89e6ZU+fqpdrOeNu8yJ/QNxjkpCD0c5QWlYc7ndg5IsuP2vWyfqmg4MP0TZt1wuU0vbQYUIu3
	RTfTEC7J01ZbyPBZ6yKD550Tx3XkTQNEZX3DS7+zC6/ItqRsWdkZB5bVHT2JnQ3QsZrJRxhOvOlIv
	c49v4vcwty3M+o7iP5kjAL0mej1SkS/OrjWP1hK8U5gP/SHLXcHSLWVVbYARFE8dgIfGRk1XVxws+
	RG1kPZU9JZyUZYAJ9S0BO21ZY8ZvKO3syuc2lLFMTNcG6hMpzraFICnaE3PS6HavvwUxHEgZOSHaK
	xqfkFwMxYOhiwZnjSOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbhTS-00FLC1-2o;
	Thu, 31 Aug 2023 13:12:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbhTP-00FLA6-0w
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 13:12:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-401d10e3e54so7372965e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 06:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693487554; x=1694092354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egv6cBK34EgIbjBrWp9fTvnprfq8zkhKE0zbSvUdTM8=;
        b=LX9MUNcpgvh80Tg86kv0xD+W8VCxUuxfghY5Oe7kQS7a5TjeXoFULqiX1JixJSrsGd
         l22zbVXjp+vGTqMZasZ4SI/L4hVdDX9ZPKH31aiqdljcgcYg2uIlHB6J8Wm2RxZnZag5
         s9W+er4cUGTAny4ITq+IvJIKWIFoP6F6h6e5L0x4Sl20sP0paq5S0y9hC49r5rFNnJJP
         nRHVmb60Erh8o7kCNH9KiNZzor1JtBmyI4g9yDyu8pjb+0ii9eduJCK5aQ/jUhrEWLPy
         72FCjv6ylEw8k8rkXDLZAS1tIcqAd6nHoLOog7rLxFaEpYELA9K1EmovEfjllrlkC5/j
         b0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693487554; x=1694092354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egv6cBK34EgIbjBrWp9fTvnprfq8zkhKE0zbSvUdTM8=;
        b=ZpMTEA1jsekFomou92u1M48i4Qy2gXNbsuPXI/uUBW9xH2wLuh67iVCVpjuWLmSKe9
         IwcxlndLtcOGWZEg6ynIJQnQ1ecs4+/bCdZkhjxVBYbALXgfuGWXqHqEYgkYR9hlpoB8
         MmXzsegQRrt3KvqJF6TJcMndLrqWzkoEkhLdZTvmvWDSKeJe5f7ddNZG4VHlJnetmeMS
         Axdu3JpOSyxTA4Xj2L1paArHXj2h9covh4MTyTniDKadn4oJ1aPevDHDLze/xj2kwQJk
         CTe6xaikgqY+/J3P/VRwqHqC9USIVVhElyj1NiYR2xlgH3gQN2Wfo2ou0UjeiVZW/92J
         Uuog==
X-Gm-Message-State: AOJu0YxpKFdboh6L1CaifzHTf//3sC/9J9eraZsea5bV3bP6fgnpBFqG
	LkTY6eVcr/k2ou2EUmMfVc0=
X-Google-Smtp-Source: AGHT+IFNloiz3CzOTUOmKRegrJpuf48gN1sNQVaqZVlmbqhoFqXkrky0uDTwEvywMEW/CZlXcMQGhQ==
X-Received: by 2002:a5d:5689:0:b0:31a:dbd1:bf6 with SMTP id f9-20020a5d5689000000b0031adbd10bf6mr4195294wrv.68.1693487553990;
        Thu, 31 Aug 2023 06:12:33 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-54-170-241-106.eu-west-1.compute.amazonaws.com. [54.170.241.106])
        by smtp.gmail.com with ESMTPSA id a28-20020a5d457c000000b00317f70240afsm2206607wrc.27.2023.08.31.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 06:12:33 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	pulehui@huawei.com,
	conor.dooley@microchip.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	song@kernel.org,
	yhs@fb.com,
	kpsingh@kernel.org,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v4 3/4] riscv: implement a memset like function for text
Date: Thu, 31 Aug 2023 13:12:28 +0000
Message-Id: <20230831131229.497941-4-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230831131229.497941-1-puranjay12@gmail.com>
References: <20230831131229.497941-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_061235_329730_8BB76462 
X-CRM114-Status: GOOD (  15.79  )
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

VGhlIEJQRiBKSVQgbmVlZHMgdG8gd3JpdGUgaW52YWxpZCBpbnN0cnVjdGlvbnMgdG8gUlggcmVn
aW9ucyBvZiBtZW1vcnkgdG8KaW52YWxpZGF0ZSByZW1vdmVkIEJQRiBwcm9ncmFtcy4gVGhpcyBu
ZWVkcyBhIGZ1bmN0aW9uIGxpa2UgbWVtc2V0KCkgdGhhdApjYW4gd29yayB3aXRoIFJYIG1lbW9y
eS4KCkltcGxlbWVudCBwYXRjaF90ZXh0X3NldF9ub3N5bmMoKSB3aGljaCBpcyBzaW1pbGFyIHRv
IHRleHRfcG9rZV9zZXQoKSBvZgp4ODYuCgpTaWduZWQtb2ZmLWJ5OiBQdXJhbmpheSBNb2hhbiA8
cHVyYW5qYXkxMkBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3
ZWkuY29tPgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KVGVzdGVk
LWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wYXRjaC5oIHwgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYyAgICAg
IHwgNzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2Vk
LCA3OCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
YXRjaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRjaC5oCmluZGV4IDYzYzk4ODMzZDUx
MC4uZTg4YjUyZDM5ZWFjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhdGNo
LmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRjaC5oCkBAIC03LDYgKzcsNyBAQAog
I2RlZmluZSBfQVNNX1JJU0NWX1BBVENIX0gKIAogaW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQg
KmFkZHIsIGNvbnN0IHZvaWQgKmluc25zLCBzaXplX3QgbGVuKTsKK2ludCBwYXRjaF90ZXh0X3Nl
dF9ub3N5bmModm9pZCAqYWRkciwgdTggYywgc2l6ZV90IGxlbik7CiBpbnQgcGF0Y2hfdGV4dCh2
b2lkICphZGRyLCB1MzIgKmluc25zLCBpbnQgbmluc25zKTsKIAogZXh0ZXJuIGludCByaXNjdl9w
YXRjaF9pbl9zdG9wX21hY2hpbmU7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRj
aC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwppbmRleCAyYzk3ZTI0NmY0ZGMuLjEzZWU3
YmY1ODlhMSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5jCkBAIC02LDYgKzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3Nw
aW5sb2NrLmg+CiAjaW5jbHVkZSA8bGludXgvbW0uaD4KICNpbmNsdWRlIDxsaW51eC9tZW1vcnku
aD4KKyNpbmNsdWRlIDxsaW51eC9zdHJpbmcuaD4KICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+
CiAjaW5jbHVkZSA8bGludXgvc3RvcF9tYWNoaW5lLmg+CiAjaW5jbHVkZSA8YXNtL2twcm9iZXMu
aD4KQEAgLTUzLDYgKzU0LDM5IEBAIHN0YXRpYyB2b2lkIHBhdGNoX3VubWFwKGludCBmaXhtYXAp
CiB9CiBOT0tQUk9CRV9TWU1CT0wocGF0Y2hfdW5tYXApOwogCitzdGF0aWMgaW50IF9fcGF0Y2hf
aW5zbl9zZXQodm9pZCAqYWRkciwgdTggYywgc2l6ZV90IGxlbikKK3sKKwl2b2lkICp3YWRkciA9
IGFkZHI7CisJYm9vbCBhY3Jvc3NfcGFnZXMgPSAoKCh1aW50cHRyX3QpYWRkciAmIH5QQUdFX01B
U0spICsgbGVuKSA+IFBBR0VfU0laRTsKKworCS8qCisJICogT25seSB0d28gcGFnZXMgY2FuIGJl
IG1hcHBlZCBhdCBhIHRpbWUgZm9yIHdyaXRpbmcuCisJICovCisJaWYgKGxlbiArIG9mZnNldF9p
bl9wYWdlKGFkZHIpID4gMiAqIFBBR0VfU0laRSkKKwkJcmV0dXJuIC1FSU5WQUw7CisJLyoKKwkg
KiBCZWZvcmUgcmVhY2hpbmcgaGVyZSwgaXQgd2FzIGV4cGVjdGVkIHRvIGxvY2sgdGhlIHRleHRf
bXV0ZXgKKwkgKiBhbHJlYWR5LCBzbyB3ZSBkb24ndCBuZWVkIHRvIGdpdmUgYW5vdGhlciBsb2Nr
IGhlcmUgYW5kIGNvdWxkCisJICogZW5zdXJlIHRoYXQgaXQgd2FzIHNhZmUgYmV0d2VlbiBlYWNo
IGNvcmVzLgorCSAqLworCWxvY2tkZXBfYXNzZXJ0X2hlbGQoJnRleHRfbXV0ZXgpOworCisJaWYg
KGFjcm9zc19wYWdlcykKKwkJcGF0Y2hfbWFwKGFkZHIgKyBQQUdFX1NJWkUsIEZJWF9URVhUX1BP
S0UxKTsKKworCXdhZGRyID0gcGF0Y2hfbWFwKGFkZHIsIEZJWF9URVhUX1BPS0UwKTsKKworCW1l
bXNldCh3YWRkciwgYywgbGVuKTsKKworCXBhdGNoX3VubWFwKEZJWF9URVhUX1BPS0UwKTsKKwor
CWlmIChhY3Jvc3NfcGFnZXMpCisJCXBhdGNoX3VubWFwKEZJWF9URVhUX1BPS0UxKTsKKworCXJl
dHVybiAwOworfQorTk9LUFJPQkVfU1lNQk9MKF9fcGF0Y2hfaW5zbl9zZXQpOworCiBzdGF0aWMg
aW50IF9fcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXpl
X3QgbGVuKQogewogCXZvaWQgKndhZGRyID0gYWRkcjsKQEAgLTk1LDYgKzEyOSwxNCBAQCBzdGF0
aWMgaW50IF9fcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBz
aXplX3QgbGVuKQogfQogTk9LUFJPQkVfU1lNQk9MKF9fcGF0Y2hfaW5zbl93cml0ZSk7CiAjZWxz
ZQorc3RhdGljIGludCBfX3BhdGNoX2luc25fc2V0KHZvaWQgKmFkZHIsIHU4IGMsIHNpemVfdCBs
ZW4pCit7CisJbWVtc2V0KGFkZHIsIGMsIGxlbik7CisKKwlyZXR1cm4gMDsKK30KK05PS1BST0JF
X1NZTUJPTChfX3BhdGNoX2luc25fc2V0KTsKKwogc3RhdGljIGludCBfX3BhdGNoX2luc25fd3Jp
dGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKIHsKIAlyZXR1cm4g
Y29weV90b19rZXJuZWxfbm9mYXVsdChhZGRyLCBpbnNuLCBsZW4pOwpAQCAtMTAyLDYgKzE0NCw0
MSBAQCBzdGF0aWMgaW50IF9fcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lk
ICppbnNuLCBzaXplX3QgbGVuKQogTk9LUFJPQkVfU1lNQk9MKF9fcGF0Y2hfaW5zbl93cml0ZSk7
CiAjZW5kaWYgLyogQ09ORklHX01NVSAqLwogCitzdGF0aWMgaW50IHBhdGNoX2luc25fc2V0KHZv
aWQgKmFkZHIsIHU4IGMsIHNpemVfdCBsZW4pCit7CisJc2l6ZV90IHBhdGNoZWQgPSAwOworCXNp
emVfdCBzaXplOworCWludCByZXQgPSAwOworCisJLyoKKwkgKiBfX3BhdGNoX2luc25fc2V0KCkg
Y2FuIG9ubHkgd29yayBvbiAyIHBhZ2VzIGF0IGEgdGltZSBzbyBjYWxsIGl0IGluIGEKKwkgKiBs
b29wIHdpdGggbGVuIDw9IDIgKiBQQUdFX1NJWkUuCisJICovCisJd2hpbGUgKHBhdGNoZWQgPCBs
ZW4gJiYgIXJldCkgeworCQlzaXplID0gbWluX3Qoc2l6ZV90LCBQQUdFX1NJWkUgKiAyIC0gb2Zm
c2V0X2luX3BhZ2UoYWRkciArIHBhdGNoZWQpLCBsZW4gLSBwYXRjaGVkKTsKKwkJcmV0ID0gX19w
YXRjaF9pbnNuX3NldChhZGRyICsgcGF0Y2hlZCwgYywgc2l6ZSk7CisKKwkJcGF0Y2hlZCArPSBz
aXplOworCX0KKworCXJldHVybiByZXQ7Cit9CitOT0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5zbl9z
ZXQpOworCitpbnQgcGF0Y2hfdGV4dF9zZXRfbm9zeW5jKHZvaWQgKmFkZHIsIHU4IGMsIHNpemVf
dCBsZW4pCit7CisJdTMyICp0cCA9IGFkZHI7CisJaW50IHJldDsKKworCXJldCA9IHBhdGNoX2lu
c25fc2V0KHRwLCBjLCBsZW4pOworCisJaWYgKCFyZXQpCisJCWZsdXNoX2ljYWNoZV9yYW5nZSgo
dWludHB0cl90KXRwLCAodWludHB0cl90KXRwICsgbGVuKTsKKworCXJldHVybiByZXQ7Cit9CitO
T0tQUk9CRV9TWU1CT0wocGF0Y2hfdGV4dF9zZXRfbm9zeW5jKTsKKwogc3RhdGljIGludCBwYXRj
aF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBsZW4pCiB7
CiAJc2l6ZV90IHBhdGNoZWQgPSAwOwotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
