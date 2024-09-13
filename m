Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39A2FA3727
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LTHdMBsJrVWJTR7G0TS9aUMxpWLvcCZ+jhmUgEao304=; b=glPmVhoifjJO3/
	2iNZEwYB925TEf7jXtMQNDWXWaYaKH6sVdTMVwmbvWTkxj1EATh3TBA/vUbwshPCxKyZvLC6zjvhd
	5V8d2Ta+b6xldj8soMD7lcbe5YRLWu/Mmk+6Jw3DmRFJcz/DjHBuqvkudNzxZ6izmWygI+wfe7aJP
	opkZpAPysrokvk9b3GEb2O+2cBxGWupN2mNdOCuM2M+OlVe4pT/W8+YlNgBNSsMRuj0icZ7Xp4/MH
	AdnffbRvYmGkQIVKnvPY05CfzzBmG4yp/+wumONB2OctptBeoUFKgfy0HcIWMjY9hocS2r5Agf9mt
	5qpJ6v1hydynbuVTHo5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp1G4-0000000FGrm-3y4p;
	Fri, 13 Sep 2024 08:02:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp1G1-0000000FGpw-2A6q
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 08:02:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-371ba7e46easo1388055f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2024 01:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726214540; x=1726819340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QUHpuEMdwgWMntNVHej8EuaNXUZ23ZaEtBMSS3bF7Ns=;
        b=Na2TQ44ycZBLHIWV6vpG9cgadCO0hruLfTbzrcxSfiUuE+41ZCFyU4L6YgIsNaNw/h
         V9Q9JF1h8F29XFBSE/dH1Ya1EhG2GE6rQoyFucrb+dXnN3rFA78e5jMxhPE7WST7/tpa
         89eaH6cxjzPoFlFIVTkgH/vqESNSib3L/XFr4cF7txoQ+2CKtWYcAoXjJIC1lc30Yogw
         Rkee6P6KwKcNVkDR2fDjKfhkeWWe4m514eRav+Kk/XQBmA5shl2h2El22WYe5ieS5WT8
         ME4nL2T8KV6/jQDvmL+9riBd9xYIcbi0iBar+1UyHGEjFhIuPW9Vq5qpwtkGza/WWmTn
         eB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726214540; x=1726819340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUHpuEMdwgWMntNVHej8EuaNXUZ23ZaEtBMSS3bF7Ns=;
        b=fIPDjCl+HeetQsB4+hN2hxEU2FJgx/Wt5G0nKJRp7skPqz+Pw+xEmXdCEqD9MT2843
         1JNyJS1omIb0/QkcXI6y7Ei6p36KWw5ooHW2j4lLq+s3CDE9yq0MNG/U42CpsCgc5jHA
         wE1lydL5KNrPRgsx99ohXR1DO4jms5wEynMbXSZ7QFwbWdCqeG9vuhM978y8wB/lwjOd
         Pj8a3qE1BUjKLNcfXHc2Ae5ztvezGobqQ7nGzhplA+aUDHOPBc3K+EKX7ON+7WSJtXnU
         D5Zv3VFWzehn8Edaz6LSpiiUa3BX3HMZsYwoICaO7FwsCQkgjS4khCgRUyYKeaWFVu54
         RJmg==
X-Forwarded-Encrypted: i=1; AJvYcCWqoM5NFCpYhprLcy2rxU4kAyA5Ap9BK4Zf0R11CjzbI8eHxhXoYrBRpjlxN4YIJUpfyjg9fshYzaO7Kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbyvWZwudBKXj5sdI7eBMKRcbzbT2La8ESck6tkqJxSrrumQpk
	Ze7kOH+qPaizbSR6ZKcvf9rQad2jSgnNXrF/LEH+eflznHG65Idx
X-Google-Smtp-Source: AGHT+IENGzKP3ZQJ/nGqRArc6ZbD50zoVdF5RGr5dExedp5Xbz+wd4r+4yFaJ/IlCZBXmyrU6Km2eg==
X-Received: by 2002:a05:6000:1110:b0:374:b31e:3b3b with SMTP id ffacd0b85a97d-378c2cd41dcmr3335594f8f.1.1726214539284;
        Fri, 13 Sep 2024 01:02:19 -0700 (PDT)
Received: from localhost.localdomain ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956ddda1sm15955681f8f.95.2024.09.13.01.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 01:02:18 -0700 (PDT)
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
To: paul.walmsley@sifive.com
Subject: [PATCH] riscv: Prevent a bad reference count on CPU nodes
Date: Fri, 13 Sep 2024 10:00:52 +0200
Message-ID: <20240913080053.36636-1-mikisabate@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_010221_580532_C2D1B5B4 
X-CRM114-Status: GOOD (  18.29  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, palmer@dabbelt.com, cuiyunhui@bytedance.com, sudeep.holla@arm.com, linux-riscv@lists.infradead.org, =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

V2hlbiBwb3B1bGF0aW5nIGNhY2hlIGxlYXZlcyB3ZSBwcmV2aW91c2x5IGZldGNoZWQgdGhlIENQ
VSBkZXZpY2Ugbm9kZQphdCB0aGUgdmVyeSBiZWdpbm5pbmcuIEJ1dCB3aGVuIEFDUEkgaXMgZW5h
YmxlZCB3ZSBnbyB0aHJvdWdoIGEKc3BlY2lmaWMgYnJhbmNoIHdoaWNoIHJldHVybnMgZWFybHkg
YW5kIGRvZXMgbm90IGNhbGwgJ29mX25vZGVfcHV0JyBmb3IKdGhlIG5vZGUgdGhhdCB3YXMgYWNx
dWlyZWQuCgpTaW5jZSB3ZSBhcmUgbm90IHVzaW5nIGEgQ1BVIGRldmljZSBub2RlIGZvciB0aGUg
QUNQSSBjb2RlIGFueXdheXMsIHdlCmNhbiBzaW1wbHkgbW92ZSB0aGUgaW5pdGlhbGl6YXRpb24g
b2YgaXQganVzdCBwYXNzZWQgdGhlIEFDUEkgYmxvY2ssIGFuZAp3ZSBhcmUgZ3VhcmFudGVlZCB0
byBoYXZlIGFuICdvZl9ub2RlX3B1dCcgY2FsbCBmb3IgdGhlIGFjcXVpcmVkIG5vZGUuClRoaXMg
cHJldmVudHMgYSBiYWQgcmVmZXJlbmNlIGNvdW50IG9mIHRoZSBDUFUgZGV2aWNlIG5vZGUuCgpN
b3Jlb3ZlciwgdGhlIHByZXZpb3VzIGZ1bmN0aW9uIGRpZCBub3QgY2hlY2sgZm9yIGVycm9ycyB3
aGVuIGFjcXVpcmluZwp0aGUgZGV2aWNlIG5vZGUsIHNvIGEgcmV0dXJuIC1FTk9FTlQgaGFzIGJl
ZW4gYWRkZWQgZm9yIHRoYXQgY2FzZS4KClNpZ25lZC1vZmYtYnk6IE1pcXVlbCBTYWJhdMOpIFNv
bMOgIDxtaWtpc2FiYXRlQGdtYWlsLmNvbT4KLS0tCkkgd2FzIHdvbmRlcmluZyBpZiB0aGlzIHNo
b3VsZCBhbHNvIGJlIHNlbnQgdG8gc3RhYmxlLCBidXQgIEkgaGF2ZSBub3Qgc2VlbgphIHJlcG9y
dCBvbiBpdCwgYW5kIHRoaXMgaXMgbm90IHJlc3BvbnNpYmxlIGZvciBhbiBvb3BzIG9yIGFueXRo
aW5nIGxpa2UgdGhhdC4KU28gaW4gdGhlIGVuZCBJIGRlY2lkZWQgbm90IHRvLCBidXQgbWF5YmUg
eW91IGNvbnNpZGVyIG90aGVyd2lzZS4KCiBhcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyB8
IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NhY2hlaW5mby5jCmluZGV4IGQ2YzEwOGM1MGNiYS4uZDMyZGZkYmEwODNlIDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYworKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jYWNoZWluZm8uYwpAQCAtNzUsOCArNzUsNyBAQCBpbnQgcG9wdWxhdGVfY2FjaGVf
bGVhdmVzKHVuc2lnbmVkIGludCBjcHUpCiB7CiAJc3RydWN0IGNwdV9jYWNoZWluZm8gKnRoaXNf
Y3B1X2NpID0gZ2V0X2NwdV9jYWNoZWluZm8oY3B1KTsKIAlzdHJ1Y3QgY2FjaGVpbmZvICp0aGlz
X2xlYWYgPSB0aGlzX2NwdV9jaS0+aW5mb19saXN0OwotCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAg
PSBvZl9jcHVfZGV2aWNlX25vZGVfZ2V0KGNwdSk7Ci0Jc3RydWN0IGRldmljZV9ub2RlICpwcmV2
ID0gTlVMTDsKKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCAqcHJldjsKIAlpbnQgbGV2ZWxzID0g
MSwgbGV2ZWwgPSAxOwoKIAlpZiAoIWFjcGlfZGlzYWJsZWQpIHsKQEAgLTEwMCw2ICs5OSwxMCBA
QCBpbnQgcG9wdWxhdGVfY2FjaGVfbGVhdmVzKHVuc2lnbmVkIGludCBjcHUpCiAJCXJldHVybiAw
OwogCX0KCisJbnAgPSBvZl9jcHVfZGV2aWNlX25vZGVfZ2V0KGNwdSk7CisJaWYgKCFucCkKKwkJ
cmV0dXJuIC1FTk9FTlQ7CisKIAlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiY2FjaGUt
c2l6ZSIpKQogCQljaV9sZWFmX2luaXQodGhpc19sZWFmKyssIENBQ0hFX1RZUEVfVU5JRklFRCwg
bGV2ZWwpOwogCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJpLWNhY2hlLXNpemUiKSkK
LS0KMi40Ni4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
