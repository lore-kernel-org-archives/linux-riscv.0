Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D77C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 20:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4s3NEhk2tdJ+t5AGikrL08gDHgXWvhtmUQcPnLi6Pik=; b=eiR3LwVybBucE4
	lnxJ19GNvqX7VGxrAu+ih0u0xyjfKGC6noPmdZyO6cBD54X5l073feA4X3B7xGdP7Sr7sMlu+TGhm
	vtPaMixAzQr6HSgQ9MwwBovqXT8/6T+lxpSFMq9tZxgeWjC62NVhGiI2hf3Vec0h5LaiA38dsR3jw
	FquP1SiUKR+JuVlRQJpp2nYLBursCWU2q5VpSnI8zIErUoVoqFzyDbUky1TlYvxZjh9pXBpMa7Hn3
	9ckuPviRXKUTbIrYSuMdHHRLu2YGT0MYIK4i74ma28YqpdmpfaeCg3E1VCTVKjEgHfbQHujxL55Fn
	r1YHjiQRGox2NPDGBg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9pl-00000006ipM-2E5i;
	Tue, 24 Jun 2025 20:01:33 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8C7-00000006Ub0-2H8w
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 18:16:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso1526024a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 11:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750788990; x=1751393790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4tdqEiAfMmZSrDkN9ucWcWrVJ1NBqGwLO8dXph+7cM=;
        b=xtmNRtBkQikhH9haRh0M2xk2itN6qL9NabT9+AaVb9gKvMi4MLe9LeZKPU5ayxORZs
         okUahoytYVAtX0Yx86DxAIiad40d4PCHwuACe1JY4NgGi+6uc3/JF5266UV2wfJd7be6
         KsXL3QRRfu6o8kp5f95tOkExzE8s0M2pEYyDxldK04F/+9lhiqN3tyn/hgSUkLodyX7q
         v0wb3A5ywPZ8Ecsj4N39kFs/g7yPxqbvHC1nfwkmGX4R+u//bZoO1ZCC6NHH42YyAOze
         0DoujgDuBqYGkVtGc02lFazpt2J6cosrBtAGLdm2JO0awO3+SWH290nyTwdtHp5pTvl+
         GxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788990; x=1751393790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4tdqEiAfMmZSrDkN9ucWcWrVJ1NBqGwLO8dXph+7cM=;
        b=nqydKN9axcbHoLXISXKVCnrTYtnnSeomNPJLMZUoIoDWLpm+REtQ6WrF9dVUVO3CVU
         W9u3TCkZwIydTbijRu7z6A/XS3gC/fI/MyuARhch6Ddn7yUvcLDsW/0PeYKlEE++8MQ3
         DMkjSQK1tU9/8KNBnn1NzmjcSk0hVghMue4Xa/wO4yLz38mg2LbMFZi3OTAoteJEkkBh
         SSvysEoCXChV9C1JIIFtiZLv6dCfvwlHhd3/x9+WihEffY++RPUXyIHmqRXfE30AGzQr
         SF5+7sHv/6VLz07w0NVbYd6jdQqMXaoI+uPbCnFpHNebgq0M9aLM1Jz7GQfvShALXUZ9
         1soA==
X-Forwarded-Encrypted: i=1; AJvYcCVz/u5mi1Zgrsl15gvfX9lirx36oH+VK6NgiYf5zaWTnvOpZ1R0zpqXz58EK6+traRrexNwLUj/J1whlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFPhX7AM0Adq/M3TY/QlSmQbi5yUOb5eZ4PGC0RBQ6z1MHka8v
	ME4zmsNHTjBfYsFT6sZ+qSRgzRu83zjDOKiPtzt7eMotXR0vFxis86UTFyvif3HXbyc=
X-Gm-Gg: ASbGnctXRtIfaxgGreV/TTOPEkwysEuDnS7pCPc1GeQHXkz/5Oi+QYYFqXG2+bCQ31d
	2g8KUULW5mO+T1ObUeM+Oze2jWooHCB2ligA8edsFV7RTJOEGVp4prGXWRhdSThLDPwN10lS7g9
	roxJg8LGox35CvYN79GODwEXCEW689DeWBJIRi2lC9V6EM9R2oz5rtdK/lCEb02BXOotiBpttzi
	uB8wSvJ9Pk2T4PWwX5vZZwYlG8JCJRH7Or/CO6i5gqWPX+O4ZiRoSUkLMkNfMCy0vivIRaqTQk6
	qEkwDf5WalHpEb4hNvLt7ac3G09fPK98A9TQjXwFRCY/82GKwr5ms57Nz3zwcalTNXY=
X-Google-Smtp-Source: AGHT+IEUFcPaDicHrC6kAbAVuJBUW3hcGGkEc2u9n4KbT8XxA1Qh9pF/Jfy1ywddJWe+c7zGqGbcHQ==
X-Received: by 2002:a17:906:6a12:b0:ae0:a1c2:262e with SMTP id a640c23a62f3a-ae0bea2e0c8mr30082966b.50.1750788989758;
        Tue, 24 Jun 2025 11:16:29 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae0541b7242sm910719866b.118.2025.06.24.11.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:16:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 5/8] pwm: microchip-core: Drop driver local locking
Date: Tue, 24 Jun 2025 20:15:41 +0200
Message-ID: <6d6ef0376ea0058b040eec3b257e324493a083f1.1750788649.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2660; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=AeR5HOeXyWBOLfB7mM+468coOylmeYon8YOOLv3sS2c=; b=owGbwMvMwMXY3/A7olbonx/jabUkhoyo19EFDP+zZvpFbYjVt7snG2LB+ZhlY/D+i/uz3yuqu hSax5p0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjARaTn2P5xlnEEctl+8PW1+ WS1I6FlvckbW4KGcZOL6NU+nbxM/o9PzNXbux9WzxRaZTOeMOeD5etPtrVe27/rkHNqswqevPOX mO3vxnEPpT8L2RQo1zzrC7qOSYL86lVeOsfQoU4T49lQNqWK7WNa406ZcmU7vlKQfJwSdUKkVbd z20IJf3yirvNDbmudIT1bVjVvNufvuz1/CevJQsdnirV2RVY9OZs2cKh6zxfROuubK8Huz2xs/c ajvi+0xjrb6a7NXbLt63MSWdaF8D1IijFTWNCelvprEt9w17uyqBY9ezFw/7/2hQ+4Zi88lPTR2 8720XotL7WO7eLCVXHvv//mx4pwZC/Xu5zU/3XH55+EsAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_111631_580688_481918F9 
X-CRM114-Status: GOOD (  11.85  )
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

VGhlIHB3bSBjb3JlIGFscmVhZHkgc2VyaWFsaXplcyAuYXBwbHkoKSBhbmQgLmdldF9zdGF0ZSgp
LCBzbyB0aGUgZHJpdmVyCmxvY2FsIGxvY2sgaXMgYWx3YXlzIGZyZWUgYW5kIGFkZHMgbm8gcHJv
dGVjdGlvbi4KCkRyb3AgaXQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tbWljcm9jaGlw
LWNvcmUuYyB8IDE3ICstLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1taWNy
b2NoaXAtY29yZS5jIGIvZHJpdmVycy9wd20vcHdtLW1pY3JvY2hpcC1jb3JlLmMKaW5kZXggMTI4
MjFiNGJiZjk3Li40ZmYzMmJiNGMyMDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1taWNy
b2NoaXAtY29yZS5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1taWNyb2NoaXAtY29yZS5jCkBAIC0z
Niw3ICszNiw2IEBACiAjaW5jbHVkZSA8bGludXgva3RpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9t
YXRoLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Ci0jaW5jbHVkZSA8bGludXgvbXV0ZXgu
aD4KICNpbmNsdWRlIDxsaW51eC9vZi5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oPgogI2luY2x1ZGUgPGxpbnV4L3B3bS5oPgpAQCAtNTYsNyArNTUsNiBAQAogc3RydWN0IG1j
aHBfY29yZV9wd21fY2hpcCB7CiAJc3RydWN0IGNsayAqY2xrOwogCXZvaWQgX19pb21lbSAqYmFz
ZTsKLQlzdHJ1Y3QgbXV0ZXggbG9jazsgLyogcHJvdGVjdHMgdGhlIHNoYXJlZCBwZXJpb2QgKi8K
IAlrdGltZV90IHVwZGF0ZV90aW1lc3RhbXA7CiAJdTMyIHN5bmNfdXBkYXRlX21hc2s7CiAJdTE2
IGNoYW5uZWxfZW5hYmxlZDsKQEAgLTM2MCwxNyArMzU4LDEwIEBAIHN0YXRpYyBpbnQgbWNocF9j
b3JlX3B3bV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpw
d20sCiAJCQkgICAgICAgY29uc3Qgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpCiB7CiAJc3RydWN0
IG1jaHBfY29yZV9wd21fY2hpcCAqbWNocF9jb3JlX3B3bSA9IHRvX21jaHBfY29yZV9wd20oY2hp
cCk7Ci0JaW50IHJldDsKLQotCW11dGV4X2xvY2soJm1jaHBfY29yZV9wd20tPmxvY2spOwogCiAJ
bWNocF9jb3JlX3B3bV93YWl0X2Zvcl9zeW5jX3VwZGF0ZShtY2hwX2NvcmVfcHdtLCBwd20tPmh3
cHdtKTsKIAotCXJldCA9IG1jaHBfY29yZV9wd21fYXBwbHlfbG9ja2VkKGNoaXAsIHB3bSwgc3Rh
dGUpOwotCi0JbXV0ZXhfdW5sb2NrKCZtY2hwX2NvcmVfcHdtLT5sb2NrKTsKLQotCXJldHVybiBy
ZXQ7CisJcmV0dXJuIG1jaHBfY29yZV9wd21fYXBwbHlfbG9ja2VkKGNoaXAsIHB3bSwgc3RhdGUp
OwogfQogCiBzdGF0aWMgaW50IG1jaHBfY29yZV9wd21fZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hp
cCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKQEAgLTM4MSw4ICszNzIsNiBAQCBzdGF0
aWMgaW50IG1jaHBfY29yZV9wd21fZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3Ry
dWN0IHB3bV9kZXZpY2UgKnB3bQogCXUxNiBwcmVzY2FsZSwgcGVyaW9kX3N0ZXBzOwogCXU4IGR1
dHlfc3RlcHMsIHBvc2VkZ2UsIG5lZ2VkZ2U7CiAKLQltdXRleF9sb2NrKCZtY2hwX2NvcmVfcHdt
LT5sb2NrKTsKLQogCW1jaHBfY29yZV9wd21fd2FpdF9mb3Jfc3luY191cGRhdGUobWNocF9jb3Jl
X3B3bSwgcHdtLT5od3B3bSk7CiAKIAlpZiAobWNocF9jb3JlX3B3bS0+Y2hhbm5lbF9lbmFibGVk
ICYgKDEgPDwgcHdtLT5od3B3bSkpCkBAIC00MTUsOCArNDA0LDYgQEAgc3RhdGljIGludCBtY2hw
X2NvcmVfcHdtX2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2
aWNlICpwd20KIAlwb3NlZGdlID0gcmVhZGJfcmVsYXhlZChtY2hwX2NvcmVfcHdtLT5iYXNlICsg
TUNIUENPUkVQV01fUE9TRURHRShwd20tPmh3cHdtKSk7CiAJbmVnZWRnZSA9IHJlYWRiX3JlbGF4
ZWQobWNocF9jb3JlX3B3bS0+YmFzZSArIE1DSFBDT1JFUFdNX05FR0VER0UocHdtLT5od3B3bSkp
OwogCi0JbXV0ZXhfdW5sb2NrKCZtY2hwX2NvcmVfcHdtLT5sb2NrKTsKLQogCWlmIChuZWdlZGdl
ID09IHBvc2VkZ2UpIHsKIAkJc3RhdGUtPmR1dHlfY3ljbGUgPSBzdGF0ZS0+cGVyaW9kOwogCQlz
dGF0ZS0+cGVyaW9kICo9IDI7CkBAIC00NjksOCArNDU2LDYgQEAgc3RhdGljIGludCBtY2hwX2Nv
cmVfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCQkJICZtY2hwX2Nv
cmVfcHdtLT5zeW5jX3VwZGF0ZV9tYXNrKSkKIAkJbWNocF9jb3JlX3B3bS0+c3luY191cGRhdGVf
bWFzayA9IDA7CiAKLQltdXRleF9pbml0KCZtY2hwX2NvcmVfcHdtLT5sb2NrKTsKLQogCWNoaXAt
Pm9wcyA9ICZtY2hwX2NvcmVfcHdtX29wczsKIAogCW1jaHBfY29yZV9wd20tPmNoYW5uZWxfZW5h
YmxlZCA9IHJlYWRiX3JlbGF4ZWQobWNocF9jb3JlX3B3bS0+YmFzZSArIE1DSFBDT1JFUFdNX0VO
KDApKTsKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
