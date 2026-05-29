Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451E2CD6E43
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPFaPnKsAnlxXCf9m2xkwhb9NnxG2XUsoFRGzb3OpeU=; b=eXwzoPohH6GRAl
	UrH23wkZ87MtwapAyJCbyywlsGY8hhnjffoIu3pqiUqyTIGN1yRFnopPr/hAsWdbbVd+yVDcy6/GT
	WNShUpnWjfVCccBrY2hWc1toWNEbT+5sVFCrZxW9FUeI9/mi1sr01TOYqNBuaT5iJjrUyUBMSM/kD
	Ej9wTp1OhD/XWCrAZ5tDJ8Gk6PcJ+jS1hgYgg+88I5mn+2vTQ2P4jQ0gEARZOkLV7aCMu0cBTUHeN
	7oWX4c0ut6ojxS/pw9WL6Yt5YtyFNGZgnp9Pv6utnofRiL2H04986EWMx4oL32/83aiFJTeMKUY/I
	L+Jcbnmvj35IytnRj+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIj-00000007AND-2jEQ;
	Fri, 29 May 2026 10:18:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuIg-00000007AHL-1Xwn
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 10:18:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso88713285e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 May 2026 03:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049924; x=1780654724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4zSRLTrRKREVH9IqS8el7yHWyFDWA9l51ZOzDmK9sI=;
        b=fAUbDSchbLJ9qIHQLxHZIIBkOaRFYuE+rvO3hkT91ozfIE4uXMIZEfMxRrIWd0jjcc
         KnUhvYJnyQEsQ8stWABt9CMe7JmrLVA6YOXZ6o/gxMyh+RLXWr27hgi/aqkipWnc7GDU
         aDGQgxasVaDjSSL7IVJo764eeHAEHRVFSUViEqZCt4kkceQdbwCUwVJqH3l3UYx3+3Wl
         s+KOdeBIcdrfMLjLJ+/eNZFvLYPEexUNPdcBMbCDDTemkmTu1Sqs2WcXMqKpuY/8evvl
         eylscmZokUMLqY8hsqOEcb691AlYZwpzhHtUPkM29MAqFCtnf+LHl2zNxXHGT9BJwrdZ
         M6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049924; x=1780654724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4zSRLTrRKREVH9IqS8el7yHWyFDWA9l51ZOzDmK9sI=;
        b=jElk/gkZPIhQ49cs/UlNGdKLoldGM3TBXcIqwfvuoeNICPBHUAPApFVxIcka+gdBf/
         NiXqTlrIVE3rxBiupa4EWLSnANyNH31T/FYzhe0/+9s7IqSQjs17jwif7IS8uyNBkcWa
         Ah0+txE5QL9oTfimAWAJzqkUlvO7sWz3TEsdObtZLWsPVE9EGrOfzn8gtgJSTL38w82A
         cnZk9cZ3FKRIvxbAOnjRx+lcIubA1ZFK3SVsiAP4rfWO3qUr4BiwS2IKcmRshKc9qXbz
         WBu1SF4kf4OFhT5Drw/SJlZ1n2QRNgQTqENSzgk1QD4nsfof5iHiLnJ0SYEjxxFSe/ve
         HRag==
X-Forwarded-Encrypted: i=1; AFNElJ82qb39eZPL3IfnmaL0gGZVc6jnmdKTTw8OYuY7S0d+ufhZGvDHdQecboK9UWeRZG4r1nbYlHmI2Dmq9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv023mgzOk38wXwRTuHPk4hE273q70rpCUKLhzXHqq6XX2FZrM
	47GeElg2kpY3HOw+EBDisEnilGIjrxKy5CK/CwuOvdElodTRjp4kldXvGJjdQsEAydY=
X-Gm-Gg: Acq92OF5/rQ4MKEsMgJiOEwHoeI41T1Si4MoEsCMU1FMElgeBf/rNbrlMMVuTQN68b5
	C3F9e3GmgyBRXriNHmJ4fWGs0kcDs/dJts/jML47ieqjvQnoztA/YKTi2sw9S/R/eCsoDF+/AcA
	V3iMwQc6pH6bGH3Oosmdti9YE3RuENbMHCMLRVK64F6uWLm5zR58r6Qy8aU4rdnKrf2moweda+2
	C9LVbGIYE4GUQ6QGdAMu8CinB92YCVFDgt/acw8V6gGifuF5HK3k34OIbGwaxEE6UOr3pYNcv/S
	+TYI5Glw4wcoStL/JIb15CRRs0+PbtTMQponCYpiUNCVpD9gyaWkWf3dZqgNNcWHEwcbQOXZJDP
	8tkkKWjX3Vw7iRSGb1VLz81vxMVldubJdBmRXgrj7kpYJh2m5YTVX49C7xHQztsBMzRv1isacfc
	tqqMEizGB5RrX1bpbDARCkGvCSOM0xfSIGXhEjWb6U3Db3JH5jJ3rUZCg7QCGB/gNw5zI6FfC7K
	a1rC8socMxT4dMyqmHpb80uXw==
X-Received: by 2002:a05:600c:58ce:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-4909c0b546cmr30191565e9.24.1780049924381;
        Fri, 29 May 2026 03:18:44 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909c0ad269sm11855695e9.11.2026.05.29.03.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Samuel Kayode <samkay014@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v1 4/6] power: Use named initializers for platform_device_id arrays
Date: Fri, 29 May 2026 12:18:19 +0200
Message-ID: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5348; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=W9xT+mzvNTBez1lAU3xkbd8dVtQp/hVdeRLR+vfLdCE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWfy0bX/m5kq8Arlyt5XE8Z+Ge+pZiRLveebn 4cklmt0zVmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln8gAKCRCPgPtYfRL+ Tgj4CACZl/QxMesCrrIl4aNkVxWwxHLc2F2zJNbXP7mUNUZy6iSAQRmCPv/wrBPSa2TyyvCYd7T zCUw3L9LezGtcTAcu4AT6betYFrT3vdx2aMXWqk/lunJew9bTfAOihdCMJcA3jLt0SHECHUBYCt 8ibifSKnMpS9cmgT1+nXA/3x0Zp26IE6mNdFJai3hgNrNtpW+8MKMX2tBk/3VT6uv4nv3bzs5JR DZ9/1h8ng6iT+z6mSE3NjM83dSCzN+fkhK6EXTAZ8k0GaxqyY4TdqZSyZdPCeFum1xeDSRiVunl YedBpxql0w3n64ysMOen1PE+PCNSTxrCd0ATCblCqdxOqrhO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031846_455682_B06BF7FD 
X-CRM114-Status: GOOD (  13.99  )
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

TmFtZWQgaW5pdGlhbGl6ZXJzIGFyZSBiZXR0ZXIgcmVhZGFibGUgYW5kIG1vcmUgcm9idXN0IHRv
IGNoYW5nZXMgb2YgdGhlCnN0cnVjdCBkZWZpbml0aW9uLiBUaGlzIHJvYnVzdG5lc3MgaXMgcmVs
ZXZhbnQgZm9yIGEgcGxhbm5lZCBjaGFuZ2UgdG8Kc3RydWN0IHBsYXRmb3JtX2RldmljZV9pZCBy
ZXBsYWNpbmcgLmRyaXZlcl9kYXRhIGJ5IGFuIGFub255bW91cyB1bmlvbi4KCldoaWxlIHRvdWNo
aW5nIHRoZXNlIGFycmF5cyB1bmlmeSBzcGFjaW5nIGFuZCB1c2FnZSBvZiBjb21tYXMuCgpTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8dS5rbGVpbmUt
a29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL3Bvd2VyL3Jlc2V0L3NwYWNlbWl0LXAx
LXJlYm9vdC5jIHwgNCArKy0tCiBkcml2ZXJzL3Bvd2VyL3Jlc2V0L3RwczY1MDg2LXJlc3RhcnQu
YyAgIHwgMiArLQogZHJpdmVycy9wb3dlci9zdXBwbHkvYmQ3MTgyOC1wb3dlci5jICAgICB8IDgg
KysrKy0tLS0KIGRyaXZlcnMvcG93ZXIvc3VwcGx5L21hY3NtYy1wb3dlci5jICAgICAgfCAyICst
CiBkcml2ZXJzL3Bvd2VyL3N1cHBseS9tYXg3Nzc1OV9jaGFyZ2VyLmMgIHwgMiArLQogZHJpdmVy
cy9wb3dlci9zdXBwbHkvbWF4ODk5OF9jaGFyZ2VyLmMgICB8IDIgKy0KIGRyaXZlcnMvcG93ZXIv
c3VwcGx5L3BmMTU1MC1jaGFyZ2VyLmMgICAgfCAyICstCiBkcml2ZXJzL3Bvd2VyL3N1cHBseS9y
dDUwMzNfY2hhcmdlci5jICAgIHwgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Bvd2VyL3Jlc2V0L3Nw
YWNlbWl0LXAxLXJlYm9vdC5jIGIvZHJpdmVycy9wb3dlci9yZXNldC9zcGFjZW1pdC1wMS1yZWJv
b3QuYwppbmRleCA5ZWMzZDFmZmY4ZjMuLjg0MDI2YjA0MmVhMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wb3dlci9yZXNldC9zcGFjZW1pdC1wMS1yZWJvb3QuYworKysgYi9kcml2ZXJzL3Bvd2VyL3Jl
c2V0L3NwYWNlbWl0LXAxLXJlYm9vdC5jCkBAIC03MCw4ICs3MCw4IEBAIHN0YXRpYyBpbnQgc3Bh
Y2VtaXRfcDFfcmVib290X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB9CiAK
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lkIHNwYWNlbWl0X3AxX3JlYm9v
dF9pZF90YWJsZVtdID0gewotCXsgInNwYWNlbWl0LXAxLXJlYm9vdCIsIH0sCi0JeyAvKiBzZW50
aW5lbCAqLyB9LAorCXsgLm5hbWUgPSAic3BhY2VtaXQtcDEtcmVib290IiB9LAorCXsgLyogc2Vu
dGluZWwgKi8gfQogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGxhdGZvcm0sIHNwYWNlbWl0X3Ax
X3JlYm9vdF9pZF90YWJsZSk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcG93ZXIvcmVzZXQvdHBz
NjUwODYtcmVzdGFydC5jIGIvZHJpdmVycy9wb3dlci9yZXNldC90cHM2NTA4Ni1yZXN0YXJ0LmMK
aW5kZXggNjk3NmRiY2FjNzRmLi4zN2QyNDhhOWRmMTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcG93
ZXIvcmVzZXQvdHBzNjUwODYtcmVzdGFydC5jCisrKyBiL2RyaXZlcnMvcG93ZXIvcmVzZXQvdHBz
NjUwODYtcmVzdGFydC5jCkBAIC00MSw3ICs0MSw3IEBAIHN0YXRpYyBpbnQgdHBzNjUwODZfcmVz
dGFydF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogfQogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9pZCB0cHM2NTA4Nl9yZXN0YXJ0X2lkX3RhYmxlW10g
PSB7Ci0JeyAidHBzNjUwODYtcmVzZXQiLCB9LAorCXsgLm5hbWUgPSAidHBzNjUwODYtcmVzZXQi
IH0sCiAJeyAvKiBzZW50aW5lbCAqLyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShwbGF0Zm9y
bSwgdHBzNjUwODZfcmVzdGFydF9pZF90YWJsZSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3Bvd2Vy
L3N1cHBseS9iZDcxODI4LXBvd2VyLmMgYi9kcml2ZXJzL3Bvd2VyL3N1cHBseS9iZDcxODI4LXBv
d2VyLmMKaW5kZXggNWU3OGZhYTBhNGFhLi41YWI1MTRmZjVjNjUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvcG93ZXIvc3VwcGx5L2JkNzE4MjgtcG93ZXIuYworKysgYi9kcml2ZXJzL3Bvd2VyL3N1cHBs
eS9iZDcxODI4LXBvd2VyLmMKQEAgLTExODQsMTAgKzExODQsMTAgQEAgc3RhdGljIGludCBiZDcx
ODI4X3Bvd2VyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB9CiAKIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lkIGJkNzE4MjhfY2hhcmdlcl9pZFtdID0g
ewotCXsgImJkNzE4MTUtcG93ZXIiLCBST0hNX0NISVBfVFlQRV9CRDcxODE1IH0sCi0JeyAiYmQ3
MTgyOC1wb3dlciIsIFJPSE1fQ0hJUF9UWVBFX0JENzE4MjggfSwKLQl7ICJiZDcyNzIwLXBvd2Vy
IiwgUk9ITV9DSElQX1RZUEVfQkQ3MjcyMCB9LAotCXsgfSwKKwl7IC5uYW1lID0gImJkNzE4MTUt
cG93ZXIiLCAuZHJpdmVyX2RhdGEgPSBST0hNX0NISVBfVFlQRV9CRDcxODE1IH0sCisJeyAubmFt
ZSA9ICJiZDcxODI4LXBvd2VyIiwgLmRyaXZlcl9kYXRhID0gUk9ITV9DSElQX1RZUEVfQkQ3MTgy
OCB9LAorCXsgLm5hbWUgPSAiYmQ3MjcyMC1wb3dlciIsIC5kcml2ZXJfZGF0YSA9IFJPSE1fQ0hJ
UF9UWVBFX0JENzI3MjAgfSwKKwl7IH0KIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKHBsYXRmb3Jt
LCBiZDcxODI4X2NoYXJnZXJfaWQpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Bvd2VyL3N1cHBs
eS9tYWNzbWMtcG93ZXIuYyBiL2RyaXZlcnMvcG93ZXIvc3VwcGx5L21hY3NtYy1wb3dlci5jCmlu
ZGV4IDMzY2EwNzQ2MGYzYS4uY2VkMDdmNzFlMGE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Bvd2Vy
L3N1cHBseS9tYWNzbWMtcG93ZXIuYworKysgYi9kcml2ZXJzL3Bvd2VyL3N1cHBseS9tYWNzbWMt
cG93ZXIuYwpAQCAtODM0LDcgKzgzNCw3IEBAIHN0YXRpYyB2b2lkIG1hY3NtY19wb3dlcl9yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2VfaWQgbWFjc21jX3Bvd2VyX2lkW10gPSB7Ci0JeyAibWFjc21jLXBv
d2VyIiB9LAorCXsgLm5hbWUgPSAibWFjc21jLXBvd2VyIiB9LAogCXsgLyogc2VudGluZWwgKi8g
fQogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGxhdGZvcm0sIG1hY3NtY19wb3dlcl9pZCk7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3Bvd2VyL3N1cHBseS9tYXg3Nzc1OV9jaGFyZ2VyLmMgYi9kcml2
ZXJzL3Bvd2VyL3N1cHBseS9tYXg3Nzc1OV9jaGFyZ2VyLmMKaW5kZXggOWJiNDE0NTk5ZjE2Li5j
NjA2ZDdiYWZjYjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcG93ZXIvc3VwcGx5L21heDc3NzU5X2No
YXJnZXIuYworKysgYi9kcml2ZXJzL3Bvd2VyL3N1cHBseS9tYXg3Nzc1OV9jaGFyZ2VyLmMKQEAg
LTc1NCw3ICs3NTQsNyBAQCBzdGF0aWMgaW50IG1heDc3NzU5X2NoYXJnZXJfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2VfaWQgbWF4Nzc3NTlfY2hhcmdlcl9pZFtdID0gewotCXsgLm5hbWUgPSAibWF4Nzc3
NTktY2hhcmdlciIsIH0sCisJeyAubmFtZSA9ICJtYXg3Nzc1OS1jaGFyZ2VyIiB9LAogCXsgfQog
fTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGxhdGZvcm0sIG1heDc3NzU5X2NoYXJnZXJfaWQpOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wb3dlci9zdXBwbHkvbWF4ODk5OF9jaGFyZ2VyLmMgYi9kcml2
ZXJzL3Bvd2VyL3N1cHBseS9tYXg4OTk4X2NoYXJnZXIuYwppbmRleCA0MThiODgyYjE2M2QuLmIw
ZWRhMmI1MWU3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wb3dlci9zdXBwbHkvbWF4ODk5OF9jaGFy
Z2VyLmMKKysrIGIvZHJpdmVycy9wb3dlci9zdXBwbHkvbWF4ODk5OF9jaGFyZ2VyLmMKQEAgLTE4
OCw3ICsxODgsNyBAQCBzdGF0aWMgaW50IG1heDg5OThfYmF0dGVyeV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2Rl
dmljZV9pZCBtYXg4OTk4X2JhdHRlcnlfaWRbXSA9IHsKLQl7ICJtYXg4OTk4LWJhdHRlcnkiLCBU
WVBFX01BWDg5OTggfSwKKwl7IC5uYW1lID0gIm1heDg5OTgtYmF0dGVyeSIgfSwKIAl7IH0KIH07
CiBNT0RVTEVfREVWSUNFX1RBQkxFKHBsYXRmb3JtLCBtYXg4OTk4X2JhdHRlcnlfaWQpOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wb3dlci9zdXBwbHkvcGYxNTUwLWNoYXJnZXIuYyBiL2RyaXZlcnMv
cG93ZXIvc3VwcGx5L3BmMTU1MC1jaGFyZ2VyLmMKaW5kZXggYTQ1Nzg2MmVmNDYxLi40MTAzNmY0
Y2I2NGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcG93ZXIvc3VwcGx5L3BmMTU1MC1jaGFyZ2VyLmMK
KysrIGIvZHJpdmVycy9wb3dlci9zdXBwbHkvcGYxNTUwLWNoYXJnZXIuYwpAQCAtNjIyLDcgKzYy
Miw3IEBAIHN0YXRpYyBpbnQgcGYxNTUwX2NoYXJnZXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQg
cGYxNTUwX2NoYXJnZXJfaWRbXSA9IHsKLQl7ICJwZjE1NTAtY2hhcmdlciIsIH0sCisJeyAubmFt
ZSA9ICJwZjE1NTAtY2hhcmdlciIgfSwKIAl7IC8qIHNlbnRpbmVsICovIH0KIH07CiBNT0RVTEVf
REVWSUNFX1RBQkxFKHBsYXRmb3JtLCBwZjE1NTBfY2hhcmdlcl9pZCk7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL3Bvd2VyL3N1cHBseS9ydDUwMzNfY2hhcmdlci5jIGIvZHJpdmVycy9wb3dlci9zdXBw
bHkvcnQ1MDMzX2NoYXJnZXIuYwppbmRleCBkZTcyNGYyM2U0NTMuLjUzNmFiMjliNjU3ZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9wb3dlci9zdXBwbHkvcnQ1MDMzX2NoYXJnZXIuYworKysgYi9kcml2
ZXJzL3Bvd2VyL3N1cHBseS9ydDUwMzNfY2hhcmdlci5jCkBAIC03MjcsNyArNzI3LDcgQEAgc3Rh
dGljIGludCBydDUwMzNfY2hhcmdlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9pZCBydDUwMzNfY2hh
cmdlcl9pZFtdID0gewotCXsgInJ0NTAzMy1jaGFyZ2VyIiwgfSwKKwl7IC5uYW1lID0gInJ0NTAz
My1jaGFyZ2VyIiB9LAogCXsgfQogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGxhdGZvcm0sIHJ0
NTAzM19jaGFyZ2VyX2lkKTsKLS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
