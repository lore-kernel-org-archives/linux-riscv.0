Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF26C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mvhdz0+92wSsKHrVfT9EsTBRyXncFQlkOCICa2nfZZo=; b=MeUfMBXJDvfwFb
	MBaSP7Xva5DtG4yzEWILEGpUpllvtW+ootMZdXaLJnIxDatXHvjWFZ0tlJyN0rOtHoPz3duBaxkRZ
	AaO/7bo9VJLlK4DrRaaZvebuvvplB3Ok+fMbYmoC4dsvmoBFimAz9qVpgGbO+25etNiBL1LXg+1zg
	5etoS2rkGbXGdGc6Yq99Kt2dAWYJMZvU1sGDF1VaPEvOswZaJsgPGAzpT3TPQs2vJ3idnDtMewT+Y
	EvHItiXAELBM22WTKASvgnWmgQvhjZOuWDoMb6rgD/1cWg4tHTtCnHhC+zOmTOAVahEBqxKzW6T/8
	NoS2xXaRvNjK+f71L2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1j-00000003VTr-0Qog;
	Mon, 17 Mar 2025 17:13:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwv-00000003TZd-242I
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so13748295e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231304; x=1742836104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdADaa+vHUZsa5aS61sZ5FN/C9kboqasJ4Wux/Gk/Z4=;
        b=r7pu6PsfwyZ/wkICA5qsPheRxetJbOoNM9Y1aAiA95+CqsRen8zgLn7OavoRLCXsMy
         mQasNl0Mw9tHmSxr0cfvEXdS8PFBHngYggKhKBc/zep/TPUmz2jn8R169dsX7bbkMmFz
         3UA6DsYCyLi9XAaYHwA+ecKYpNfidP2d9EqGNEaews5ZM5DDbXEfZrkW/fxEZkcBRmmF
         vGT6MNgCrChF4dq1Np0z85ifyoBWVHcWao956K0wz1bjkevjRRhZnIQBnRBcEKCq4D7P
         8msXlBESMpLYVeOuPVCDnJMlZqvzlO9lM/MB9B2aTOepxdnk6UbGNlR7g5w+M9Ot3YcD
         cCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231304; x=1742836104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdADaa+vHUZsa5aS61sZ5FN/C9kboqasJ4Wux/Gk/Z4=;
        b=UQ3DSkFOtpg0wlAPuUHWVk98vYafrgNmvex+sIzXAwibX509+yJG15wDH3sBQLPxAB
         wOjXrO/UzDTgEQhSyY6uS+34sYvJ/BjdT10AxG1TSXkcPWXcweUs+BhqE1picIL7dn9Z
         XucHd4UYuZz6e4tZgmQpSD4E5tc5wqMSt20/42Eq2q7CM1mFEMOvQNJIPST/NK/lwV/H
         qNK0Jb9dYwhz5O3NPV0ZFNv2IJ88lDQInCmVBXB3sk/KZFc+uqBw1yvjxAGtD7Hvoxm4
         NcazE8GXYCYtESJGV8lXC+IWZay+ayu+dprYCTHhUpqKePHRdHh89ML8eG20yiFZlbzb
         qzsA==
X-Forwarded-Encrypted: i=1; AJvYcCXXg/5sbNokIOjVJBNIUpeeuPEG4xSkjwAYuGl9TDysv4SnFCdYMYoHli++dT33HA6EtN4uk8ZARE5fZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIB4LPczl8BJhJlFciGDtuKwz/pLWH3WzAWutGvRzjjsRyqX2w
	aCaqGZoTREWl8tizPik8OpSH7aWG1eUQgLVf75yenm0FYEkPTS3tRBrJAhd85CU=
X-Gm-Gg: ASbGncudX9QeeOPc1L7D+wjP6Eg4pG6kAn99MB0XciHDnU+P3WNGEvbgAfm6dzv8EY2
	4dyGWkkZOBHBQvTO7hVpPWFjfE+BQdNQ18NW9hf9lo4d1z2K9bUcjTu6CTxReAhv3WNomrf40Vr
	r0vCfNRK9bQvu/2D9h+iQS8DcAF4FVie2ycOD4r/u380P+EBtboKVX8+tmOOzQ2vO6F06HNs3Iw
	pIRX/YVeZO1C/9hiHl8SyYWQnTUzTXm8dCfNKjdQZPFykq7MyGi3plNQudircbmWR8jdJSiYCd8
	oHcvQ0vuHi2ov2vCwGHHBncB4SokD7uyZHJL58AWsWCvUQ==
X-Google-Smtp-Source: AGHT+IGGvUDucTyZhua2TIOWY68n/psfaPPQ4wKaNSWwyNxLgrTgzrMr5DXu7tUeZ+5c3PBxx/axlQ==
X-Received: by 2002:a05:600c:450c:b0:43d:609:b305 with SMTP id 5b1f17b1804b1-43d389790acmr6282865e9.17.1742231304068;
        Mon, 17 Mar 2025 10:08:24 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:23 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 15/18] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Mon, 17 Mar 2025 18:06:21 +0100
Message-ID: <20250317170625.1142870-16-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100825_525182_8CD62EAE 
X-CRM114-Status: GOOD (  13.68  )
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

VGhlIEZXRlQgU0JJIGV4dGVuc2lvbiB3aWxsIG5lZWQgdG8gZHluYW1pY2FsbHkgYWxsb2NhdGUg
bWVtb3J5IGFuZCBkbwppbml0IHRpbWUgc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24uIEFkZCBhbiBp
bml0L2RlaW5pdCBjYWxsYmFja3MgdGhhdAphbGxvd3MgdG8gZG8gc28uCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8ICA5ICsrKysrKysrKwogYXJjaC9yaXNjdi9rdm0v
dmNwdS5jICAgICAgICAgICAgICAgICB8ICAyICsrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5j
ICAgICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hh
bmdlZCwgMzcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5o
CmluZGV4IDRlZDYyMDNjZGQzMC4uYmNiOTA3NTdiMTQ5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX3ZjcHVfc2JpLmgKQEAgLTQ5LDYgKzQ5LDE0IEBAIHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0
ZW5zaW9uIHsKIAogCS8qIEV4dGVuc2lvbiBzcGVjaWZpYyBwcm9iZSBmdW5jdGlvbiAqLwogCXVu
c2lnbmVkIGxvbmcgKCpwcm9iZSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKKworCS8qCisJICog
SW5pdC9kZWluaXQgZnVuY3Rpb24gY2FsbGVkIG9uY2UgZHVyaW5nIFZDUFUgaW5pdC9kZXN0cm95
LiBUaGVzZQorCSAqIG1pZ2h0IGJlIHVzZSBpZiB0aGUgU0JJIGV4dGVuc2lvbnMgbmVlZCB0byBh
bGxvY2F0ZSBvciBkbyBzcGVjaWZpYworCSAqIGluaXQgdGltZSBvbmx5IGNvbmZpZ3VyYXRpb24u
CisJICovCisJaW50ICgqaW5pdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKKwl2b2lkICgqZGVp
bml0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogfTsKIAogdm9pZCBrdm1fcmlzY3ZfdmNwdV9z
YmlfZm9yd2FyZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4pOwpA
QCAtNjksNiArNzcsNyBAQCBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqa3Zt
X3ZjcHVfc2JpX2ZpbmRfZXh0KAogYm9vbCByaXNjdl92Y3B1X3N1cHBvcnRzX3NiaV9leHQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgaWR4KTsKIGludCBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNh
bGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsKIHZvaWQga3Zt
X3Jpc2N2X3ZjcHVfc2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKK3ZvaWQga3ZtX3Jp
c2N2X3ZjcHVfc2JpX2RlaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiBpbnQga3ZtX3Jp
c2N2X3ZjcHVfZ2V0X3JlZ19zYmlfc3RhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQg
bG9uZyByZWdfbnVtLAogCQkJCSAgIHVuc2lnbmVkIGxvbmcgKnJlZ192YWwpOwpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCmluZGV4IDYw
ZDY4NGM3NmM1OC4uODc3YmNjODVjMDY3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCkBAIC0xODUsNiArMTg1LDggQEAgdm9pZCBr
dm1fYXJjaF92Y3B1X3Bvc3RjcmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCiB2b2lkIGt2
bV9hcmNoX3ZjcHVfZGVzdHJveShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB7CisJa3ZtX3Jpc2N2
X3ZjcHVfc2JpX2RlaW5pdCh2Y3B1KTsKKwogCS8qIENsZWFudXAgVkNQVSBBSUEgY29udGV4dCAq
LwogCWt2bV9yaXNjdl92Y3B1X2FpYV9kZWluaXQodmNwdSk7CiAKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCmluZGV4IGQx
YzgzYTc3NzM1ZS4uMzEzOWYxNzFjMjBmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKQEAgLTUwOCw1ICs1MDgsMzEg
QEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJ
CXNjb250ZXh0LT5leHRfc3RhdHVzW2lkeF0gPSBleHQtPmRlZmF1bHRfZGlzYWJsZWQgPwogCQkJ
CQlLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRElTQUJMRUQgOgogCQkJCQlLVk1fUklTQ1ZfU0JJ
X0VYVF9TVEFUVVNfRU5BQkxFRDsKKworCQlpZiAoZXh0LT5pbml0ICYmIGV4dC0+aW5pdCh2Y3B1
KSAhPSAwKQorCQkJc2NvbnRleHQtPmV4dF9zdGF0dXNbaWR4XSA9IEtWTV9SSVNDVl9TQklfRVhU
X1NUQVRVU19VTkFWQUlMQUJMRTsKKwl9Cit9CisKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2Rl
aW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJc3RydWN0IGt2bV92Y3B1X3NiaV9jb250
ZXh0ICpzY29udGV4dCA9ICZ2Y3B1LT5hcmNoLnNiaV9jb250ZXh0OworCWNvbnN0IHN0cnVjdCBr
dm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSAqZW50cnk7CisJY29uc3Qgc3RydWN0IGt2bV92
Y3B1X3NiaV9leHRlbnNpb24gKmV4dDsKKwlpbnQgaWR4LCBpOworCisJZm9yIChpID0gMDsgaSA8
IEFSUkFZX1NJWkUoc2JpX2V4dCk7IGkrKykgeworCQllbnRyeSA9ICZzYmlfZXh0W2ldOworCQll
eHQgPSBlbnRyeS0+ZXh0X3B0cjsKKwkJaWR4ID0gZW50cnktPmV4dF9pZHg7CisKKwkJaWYgKGlk
eCA8IDAgfHwgaWR4ID49IEFSUkFZX1NJWkUoc2NvbnRleHQtPmV4dF9zdGF0dXMpKQorCQkJY29u
dGludWU7CisKKwkJaWYgKHNjb250ZXh0LT5leHRfc3RhdHVzW2lkeF0gPT0gS1ZNX1JJU0NWX1NC
SV9FWFRfU1RBVFVTX1VOQVZBSUxBQkxFIHx8CisJCSAgICAhZXh0LT5kZWluaXQpCisJCQljb250
aW51ZTsKKworCQlleHQtPmRlaW5pdCh2Y3B1KTsKIAl9CiB9Ci0tIAoyLjQ3LjIKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
