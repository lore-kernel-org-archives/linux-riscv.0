Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABACCD1299
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+xeKkT5WO1cYK64blBToKvZ24ASQQrZ5aWjfJWIerg=; b=HECLk9DmBcb303
	Jh6T6QHjK2SngBbMHyAczs4gDrC7QE5q6zKDFucB1xbCvAo97KumQuXz20UJ4dvzlIb+Ti4tKIFgi
	BNQDigZjzstwCXwVO0WMhREYQb87qVbv5o0XcVmzhVKxA2St6VY1kcZYRWAJxONcHkjQZG4MQE1Fr
	oQlm502V9pxUgTdZEGa3jgI7L2t8VDoQu1WJ21s4YyccMoharJ/N3EHV+YIozbByvyFXqvV2vnq/Q
	TQRF/z4FbYi5iZz3JosPRfDA4Ly6dF23MX6pN8H0S2t/xeSzcHIljCEWnNNo/oGv4IL2i/ZGmbQ6Y
	Y7JGyMnV5/gQq0LPGevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1gz-0000000GUho-2C9i;
	Wed, 03 Apr 2024 14:34:21 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0Wv-0000000G8We-2kVy;
	Wed, 03 Apr 2024 13:20:08 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e2987e9d06so3697335ad.2;
        Wed, 03 Apr 2024 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150391; x=1712755191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HH3He2M5JGBbpn1IyUzwQbFpqNeS8i3zDjnB0NO5L0=;
        b=AJE3WnbGUhAwDJcB3ZG5ldW6A4tQjOwrz/14AwYD6oKv4BTvX+mBBX8gmkNVzPM1HN
         snn3T61q8V31n+X1fwriUtSqcC7Nmq61XwCzVcpuh3D2SGGqCUsO0gWmpEH4BcLn3lLv
         K+cJTNXD50Qnd42ruEVuasnXD7C6cx7EH4aDibvLQJNAiYDE7phyDBNBNj51JIkTSZzV
         cqlzRTYEjdI6azjYzMeCkf+AqUYTaaD02cGujF3HYXuS3YAvLNXy+DxVEoDj/7xs3uHu
         3BbtiqBGVIJ0kQaFmIsvXcfnftml8GLxl30JtA76Cco9AAYygell20bMdIgOyhQ3T30h
         2hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150391; x=1712755191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0HH3He2M5JGBbpn1IyUzwQbFpqNeS8i3zDjnB0NO5L0=;
        b=YpLPLWHeJk8wA7uYYxg1KVyxRdToE0vxTUlaaKTpeLZzhCz6j+3gSrUB/tJyNEplDI
         tyY88lVFltB0XzAHRxXB7HBkkK36ZnPb1CxJA+X/DyxH9rJ0aMWs9DlTIV2ZbwfAktJS
         gksVvRSufDHmREmBpnJeZJur/O+B78EOarOed0HjQ1JCWRp8cFcvhbG5VpRnaSxTC5Ku
         +YEvIx5ebdYXIwW3T4dV1E5Eca0SWjueAK/Cfbnm3vC/VE9bE4tT8scsofTf5GXoUmc1
         OOAY9OKK5Pb5H7rfh830VmezSoQJ94sc2gbsFDku6n/4rTluNESpOHv329G8EGCi8Eu/
         vsRw==
X-Forwarded-Encrypted: i=1; AJvYcCXWzw7PKqADoWuDxJWkO2+HpxgIQ7nKPi7ZwfSR20nbPE5lZase92c29i9UUQuwUgDsbT30HQdN4H4IyFdpyHy3awvHDV9Y6ons6SpIwSVLejisEXziaEggtuLhULczG6bATB2lyTFwfye026MvhPQCMeTFQQM=
X-Gm-Message-State: AOJu0YzPMss+MbtZjhDglvLgHIvktVRArmK+4noeJs2gmSisdM0SO2LB
	d3THAhmBxL43j3R68Suftj3kMzeg1CIq0WalVbwnYeoIm7DudtVs
X-Google-Smtp-Source: AGHT+IGzp4oN8GRSo/9EyN0xy1NOVYsP3l70Car4fBvR2s7g6gbB9/O+yleAACI5/eSTY78txokLLg==
X-Received: by 2002:a17:903:d1:b0:1e2:a177:d6b with SMTP id x17-20020a17090300d100b001e2a1770d6bmr229571plc.19.1712150391428;
        Wed, 03 Apr 2024 06:19:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h1-20020a170902b94100b001dd0c5d5227sm13149194pls.193.2024.04.03.06.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:50 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	x86@kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v3 05/15] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Wed,  3 Apr 2024 06:19:26 -0700
Message-Id: <20240403131936.787234-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_061954_154525_372BC30F 
X-CRM114-Status: GOOD (  12.21  )
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

VGhlIGRybV90ZXN0X3JlY3RfY2FsY19oc2NhbGUgYW5kIGRybV90ZXN0X3JlY3RfY2FsY192c2Nh
bGUgdW5pdCB0ZXN0cwppbnRlbnRpb25hbGx5IHRyaWdnZXIgd2FybmluZyBiYWNrdHJhY2VzIGJ5
IHByb3ZpZGluZyBiYWQgcGFyYW1ldGVycyB0bwp0aGUgdGVzdGVkIGZ1bmN0aW9ucy4gV2hhdCBp
cyB0ZXN0ZWQgaXMgdGhlIHJldHVybiB2YWx1ZSwgbm90IHRoZSBleGlzdGVuY2UKb2YgYSB3YXJu
aW5nIGJhY2t0cmFjZS4gU3VwcHJlc3MgdGhlIGJhY2t0cmFjZXMgdG8gYXZvaWQgY2xvZ2dpbmcg
dGhlCmtlcm5lbCBsb2cgYW5kIGRpc3RyYWN0aW9uIGZyb20gcmVhbCBwcm9ibGVtcy4KClRlc3Rl
ZC1ieTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8ub3JnPgpB
Y2tlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgpBY2tlZC1i
eTogTWHDrXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAZ21haWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpTaWdu
ZWQtb2ZmLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Ci0tLQp2MjoKLSBS
ZWJhc2VkIHRvIHY2LjktcmMxCi0gQWRkZWQgVGVzdGVkLWJ5OiwgQWNrZWQtYnk6LCBhbmQgUmV2
aWV3ZWQtYnk6IHRhZ3MKdjM6Ci0gUmViYXNlZCB0byB2Ni45LXJjMgoKIGRyaXZlcnMvZ3B1L2Ry
bS90ZXN0cy9kcm1fcmVjdF90ZXN0LmMgfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZXN0
cy9kcm1fcmVjdF90ZXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5j
CmluZGV4IDc2MzMyY2QyZWFkOC4uNjY4NTE3NjllZTMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdGVzdHMvZHJtX3JlY3RfdGVzdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9k
cm1fcmVjdF90ZXN0LmMKQEAgLTQwNiwyMiArNDA2LDM4IEBAIEtVTklUX0FSUkFZX1BBUkFNKGRy
bV9yZWN0X3NjYWxlLCBkcm1fcmVjdF9zY2FsZV9jYXNlcywgZHJtX3JlY3Rfc2NhbGVfY2FzZV9k
ZXNjCiAKIHN0YXRpYyB2b2lkIGRybV90ZXN0X3JlY3RfY2FsY19oc2NhbGUoc3RydWN0IGt1bml0
ICp0ZXN0KQogeworCURFRklORV9TVVBQUkVTU0VEX1dBUk5JTkcoZHJtX2NhbGNfc2NhbGUpOwog
CWNvbnN0IHN0cnVjdCBkcm1fcmVjdF9zY2FsZV9jYXNlICpwYXJhbXMgPSB0ZXN0LT5wYXJhbV92
YWx1ZTsKIAlpbnQgc2NhbGluZ19mYWN0b3I7CiAKKwkvKgorCSAqIGRybV9yZWN0X2NhbGNfaHNj
YWxlKCkgZ2VuZXJhdGVzIGEgd2FybmluZyBiYWNrdHJhY2Ugd2hlbmV2ZXIgYmFkCisJICogcGFy
YW1ldGVycyBhcmUgcGFzc2VkIHRvIGl0LiBUaGlzIGFmZmVjdHMgYWxsIHVuaXQgdGVzdHMgd2l0
aCBhbgorCSAqIGVycm9yIGNvZGUgaW4gZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IuCisJICovCisJ
U1RBUlRfU1VQUFJFU1NFRF9XQVJOSU5HKGRybV9jYWxjX3NjYWxlKTsKIAlzY2FsaW5nX2ZhY3Rv
ciA9IGRybV9yZWN0X2NhbGNfaHNjYWxlKCZwYXJhbXMtPnNyYywgJnBhcmFtcy0+ZHN0LAogCQkJ
CQkgICAgICBwYXJhbXMtPm1pbl9yYW5nZSwgcGFyYW1zLT5tYXhfcmFuZ2UpOworCUVORF9TVVBQ
UkVTU0VEX1dBUk5JTkcoZHJtX2NhbGNfc2NhbGUpOwogCiAJS1VOSVRfRVhQRUNUX0VRKHRlc3Qs
IHNjYWxpbmdfZmFjdG9yLCBwYXJhbXMtPmV4cGVjdGVkX3NjYWxpbmdfZmFjdG9yKTsKIH0KIAog
c3RhdGljIHZvaWQgZHJtX3Rlc3RfcmVjdF9jYWxjX3ZzY2FsZShzdHJ1Y3Qga3VuaXQgKnRlc3Qp
CiB7CisJREVGSU5FX1NVUFBSRVNTRURfV0FSTklORyhkcm1fY2FsY19zY2FsZSk7CiAJY29uc3Qg
c3RydWN0IGRybV9yZWN0X3NjYWxlX2Nhc2UgKnBhcmFtcyA9IHRlc3QtPnBhcmFtX3ZhbHVlOwog
CWludCBzY2FsaW5nX2ZhY3RvcjsKIAorCS8qCisJICogZHJtX3JlY3RfY2FsY192c2NhbGUoKSBn
ZW5lcmF0ZXMgYSB3YXJuaW5nIGJhY2t0cmFjZSB3aGVuZXZlciBiYWQKKwkgKiBwYXJhbWV0ZXJz
IGFyZSBwYXNzZWQgdG8gaXQuIFRoaXMgYWZmZWN0cyBhbGwgdW5pdCB0ZXN0cyB3aXRoIGFuCisJ
ICogZXJyb3IgY29kZSBpbiBleHBlY3RlZF9zY2FsaW5nX2ZhY3Rvci4KKwkgKi8KKwlTVEFSVF9T
VVBQUkVTU0VEX1dBUk5JTkcoZHJtX2NhbGNfc2NhbGUpOwogCXNjYWxpbmdfZmFjdG9yID0gZHJt
X3JlY3RfY2FsY192c2NhbGUoJnBhcmFtcy0+c3JjLCAmcGFyYW1zLT5kc3QsCiAJCQkJCSAgICAg
IHBhcmFtcy0+bWluX3JhbmdlLCBwYXJhbXMtPm1heF9yYW5nZSk7CisJRU5EX1NVUFBSRVNTRURf
V0FSTklORyhkcm1fY2FsY19zY2FsZSk7CiAKIAlLVU5JVF9FWFBFQ1RfRVEodGVzdCwgc2NhbGlu
Z19mYWN0b3IsIHBhcmFtcy0+ZXhwZWN0ZWRfc2NhbGluZ19mYWN0b3IpOwogfQotLSAKMi4zOS4y
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
