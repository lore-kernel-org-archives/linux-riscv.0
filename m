Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBECEC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m6D+oOTiGvMbBFVePrtjzpFDheThv+j1p0WtP70hK6A=; b=RcAQuDupKTfdMT
	n5vcxllm3/HxYC2nGRxB+7prLWi8wnUVuFgWblgkrSutDUqDhB7Qnd4vV0NMfHz5z15Pf8sV2Rb2x
	FbVlt0f1h94yeTzqjhs4qZplDLsFoomxnXFEN6OfEgOep55bk0qEK6LjUN41ctzZS2+24sOrqmdAP
	65/uuDvX3an9tgzR16fJydDNO4kdO6g41FNd+HoqOnzk1vSgQQbkmrywuKN8dKaAyxnuHLV/jdVe6
	F3EAkOaPpGnhhK2C6/sSEY1FAvHfXFLOXAtnXicbp24Wx4UVFY1n3+MiguKaW1RQhxVXZIvsuCsVF
	8b93FWvwiIwzqRZXmD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5neO-0021gO-1b;
	Wed, 22 Nov 2023 13:52:20 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5neA-0021Z9-02
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 13:52:18 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-28554922cebso3148a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 05:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700661123; x=1701265923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7husD+9d3F1Gv9OOp27OuBbyYe5n6sJHNp6uS06FL8=;
        b=qyPUZ4V5+Kc6jG3+k8Lk3Dt+QJ47MSQCMohcNkT2I2T1GgVnC3SBFNSY7Jvun844N0
         kjz0mYnIgGHFvZ1ZojmS8MzdScVllqYjM/HiTgZY4U1RouDTUf7khspxh3As2eiEjKtM
         7qcLOcPK47+XxVqqqZ73+P1ilmeaGN41TuRKIK5Ct3syq/hcUSICLyF9f6OiKClkNAql
         6V/bCBWlNl6hb0/ZMiEAgYZ35apAnMrArPNtwOfSJpdM+GW3oUE5hPzBiHiBLGvtKgPB
         B92jNH8UAboodOk1ON+BP4Ek84d9lIIrWNdE7lWrq6Pn750/GYQtMfBsyVZt7l0QmnvG
         dTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700661123; x=1701265923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7husD+9d3F1Gv9OOp27OuBbyYe5n6sJHNp6uS06FL8=;
        b=oTijIVe301pLEpHfWupiC+3oglQKV12HhStG4N0Aq6IoSqZa3JBFGGaRVwtODE+zq0
         qQGrkZqGPqfmYYHpREsGuxxI5NkmkxeBU8B3j5FNsjJyQs4HO1Rzn5x5QlypKgPXkfVI
         cjd7FW8pMN97OLPkz6CZqbch7tXqKa6CkTTIKI7+UIffK+G2ifNgefVSUDbVrxUcu4hL
         9n5ABrvUKU6FUeV+adHTzM2lEcItWGDPLoWDM2Ft0t7jtqCcg9Gwupr4pX96jWNrdZ6r
         00u+VOkFOlgarJtre52OAq/6RHu8BtcTk3Z97thtyaXODyHDNyCI2mYRfFlx3F19btyb
         jgSQ==
X-Gm-Message-State: AOJu0YzjPAefzZTu4QnBPlam6M6lKxEIDQXXHBjq7bHbG/MQKPNoSE0+
	iNVevQWM2GoNHlLma5jvSjoJqEj4uFfJhltNitc=
X-Google-Smtp-Source: AGHT+IE5Dg+TMXVzZNn0mFXompSbIgWw4KFeIm5Q5UstyfAp14qFST/CkbxoGCVx/IGuAn9WPK835w==
X-Received: by 2002:a17:90b:d8a:b0:285:e55:68b8 with SMTP id bg10-20020a17090b0d8a00b002850e5568b8mr2374428pjb.1.1700661122833;
        Wed, 22 Nov 2023 05:52:02 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:edca:1f11:8726:b116])
        by smtp.gmail.com with ESMTPSA id rj1-20020a17090b3e8100b0028031e87660sm1387947pjb.16.2023.11.22.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:52:02 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: fix incorrect use of __user pointer
Date: Wed, 22 Nov 2023 14:51:41 +0100
Message-ID: <20231122135141.2936663-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_055206_278103_D5625472 
X-CRM114-Status: GOOD (  12.32  )
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

VGhlc2Ugd2FybmluZ3Mgd2VyZSByZXBvcnRlZCBieSBzcGFyc2UgYW5kIHdlcmUgZHVlIHRvIGxh
Y2sgb2YgX191c2VyCmFubm90YXRpb24gYXMgd2VsbCBhcyBkZXJlZmVyZW5jaW5nIHN1Y2ggcG9p
bnRlci4gRml4IHRoaXMgYnkgYWRkaW5nCl9fdXNlciBjYXN0IHdlcmUgbmVlZGVkIChsb2FkX3U4
KCkvc3RvcmVfdTgoKSkgYW5kIG1vdmUgdGhlIF9fdXNlcgphbm5vdGF0aW9uIGluIF9fcmVhZF9p
bnNuKCkgaW50byB0aGUgaWYoKSBicmFuY2ggdGhhdCB1c2VzIF9fZ2V0X3VzZXIoKQp3aXRoIHRo
aXMgcG9pbnRlci4KClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMxMTE2
MDYwNi5vYkdPT3dCMy1sa3BAaW50ZWwuY29tLwpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKaW5kZXgg
NWViYTM3MTQ3Y2FhLi4wMmFiYjY2MTY4NzMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGln
bmVkLmMKQEAgLTMxOSw3ICszMTksNyBAQCBzdGF0aWMgaW5saW5lIGludCBnZXRfaW5zbihzdHJ1
Y3QgcHRfcmVncyAqcmVncywgdWxvbmcgbWVwYywgdWxvbmcgKnJfaW5zbikKIHN0YXRpYyBpbmxp
bmUgaW50IGxvYWRfdTgoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGNvbnN0IHU4ICphZGRyLCB1OCAq
cl92YWwpCiB7CiAJaWYgKHVzZXJfbW9kZShyZWdzKSkgewotCQlyZXR1cm4gX19nZXRfdXNlcigq
cl92YWwsIGFkZHIpOworCQlyZXR1cm4gX19nZXRfdXNlcigqcl92YWwsICh1OCBfX3VzZXIgKilh
ZGRyKTsKIAl9IGVsc2UgewogCQkqcl92YWwgPSAqYWRkcjsKIAkJcmV0dXJuIDA7CkBAIC0zMjks
NyArMzI5LDcgQEAgc3RhdGljIGlubGluZSBpbnQgbG9hZF91OChzdHJ1Y3QgcHRfcmVncyAqcmVn
cywgY29uc3QgdTggKmFkZHIsIHU4ICpyX3ZhbCkKIHN0YXRpYyBpbmxpbmUgaW50IHN0b3JlX3U4
KHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1OCAqYWRkciwgdTggdmFsKQogewogCWlmICh1c2VyX21v
ZGUocmVncykpIHsKLQkJcmV0dXJuIF9fcHV0X3VzZXIodmFsLCBhZGRyKTsKKwkJcmV0dXJuIF9f
cHV0X3VzZXIodmFsLCAodTggX191c2VyICopYWRkcik7CiAJfSBlbHNlIHsKIAkJKmFkZHIgPSB2
YWw7CiAJCXJldHVybiAwOwpAQCAtMzQxLDcgKzM0MSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHN0
b3JlX3U4KHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1OCAqYWRkciwgdTggdmFsKQogCWludCBfX3Jl
dDsJCQkJCVwKIAkJCQkJCQlcCiAJaWYgKHVzZXJfbW9kZShyZWdzKSkgewkJCQlcCi0JCV9fcmV0
ID0gX19nZXRfdXNlcihpbnNuLCBpbnNuX2FkZHIpOwlcCisJCV9fcmV0ID0gX19nZXRfdXNlcihp
bnNuLCAodHlwZW9mKCppbnNuX2FkZHIpIF9fdXNlciAqKSBpbnNuX2FkZHIpOyBcCiAJfSBlbHNl
IHsJCQkJCVwKIAkJaW5zbiA9ICppbnNuX2FkZHI7CQkJXAogCQlfX3JldCA9IDA7CQkJCVwKQEAg
LTM1Niw3ICszNTYsNyBAQCBzdGF0aWMgaW5saW5lIGludCBnZXRfaW5zbihzdHJ1Y3QgcHRfcmVn
cyAqcmVncywgdWxvbmcgZXBjLCB1bG9uZyAqcl9pbnNuKQogCiAJaWYgKGVwYyAmIDB4Mikgewog
CQl1bG9uZyB0bXAgPSAwOwotCQl1MTYgX191c2VyICppbnNuX2FkZHIgPSAodTE2IF9fdXNlciAq
KWVwYzsKKwkJdTE2ICppbnNuX2FkZHIgPSAodTE2ICopZXBjOwogCiAJCWlmIChfX3JlYWRfaW5z
bihyZWdzLCBpbnNuLCBpbnNuX2FkZHIpKQogCQkJcmV0dXJuIC1FRkFVTFQ7CkBAIC0zNzYsNyAr
Mzc2LDcgQEAgc3RhdGljIGlubGluZSBpbnQgZ2V0X2luc24oc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
IHVsb25nIGVwYywgdWxvbmcgKnJfaW5zbikKIAogCQlyZXR1cm4gMDsKIAl9IGVsc2UgewotCQl1
MzIgX191c2VyICppbnNuX2FkZHIgPSAodTMyIF9fdXNlciAqKWVwYzsKKwkJdTMyICppbnNuX2Fk
ZHIgPSAodTMyICopZXBjOwogCiAJCWlmIChfX3JlYWRfaW5zbihyZWdzLCBpbnNuLCBpbnNuX2Fk
ZHIpKQogCQkJcmV0dXJuIC1FRkFVTFQ7Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
