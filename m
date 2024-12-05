Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD52E77173
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LkYsUK3dyYuX72lCJkTuKngVUTAYRjcYPQMb229lYqs=; b=U009tewTrrQjLB
	8NTHncnuujayOUhNlfPk9/Jh/I1K1aA/xOKvQMIcllQXLftsY7vgot9zp/8kl1W2t74uopbRAkcN9
	rMKmmmOV1GIN5HZi3JLrTiLsi4T5jTOBg0T9/6EIBA446OWHGwAhDGPxWRC4mTUruhbHkM3iNImW7
	hYEBCS4Q4kCzroxYTcMXx9t5scXeiAKL9U2mLEjB6EViKWPsPjm7k8Ew3rN4O00k/WjKoemLAJU5c
	wRudNI+qovFenu5FmEwrulgAKuQZdsHSJ8SJij6CkWEsttLCxlmDGZx1WHDpN7Igyp01gXKk1yEPz
	JbI0j+GMFe6Z0iHSZBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJVC-0000000HPcA-3Xws;
	Thu, 05 Dec 2024 21:35:14 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJVA-0000000HPb2-167F
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 21:35:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-215a0390925so14814515ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 13:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733434511; x=1734039311; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pwsdH+QfnICBuJ92pYJftuHgr7/FjfSggIF1Mo3ejbQ=;
        b=0kabb610sNOuLZm+6Jp5pp2/f1vGgXnxAVgqelhd1B6c67LY2mjQMzleJHJQM3sUMH
         uJo+qLIb3dcH2uxkTXPkBH4epnRtE+AFSFRXVvKJLfokciM9KJdylJqan4kpQpVyibsh
         m+QvmjCPo+Ji4VVw8JUfdIPtecfyg56m3jXWKXaHqG1hFYWXS7A9+LYF/q2h2GwaBEmi
         GOBu1QTwO5XYxHTm2g31At6a434gmuLsAuvBXHer+CBR6D+G3C4+RnZDSTpq5lTPYohw
         BWyGSYkhEXmZkgQH/iFToyZnEGvVRQVPvy1S5yqj3/67v5J6LutMacLBTR3ZTJvfad+U
         KCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733434511; x=1734039311;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwsdH+QfnICBuJ92pYJftuHgr7/FjfSggIF1Mo3ejbQ=;
        b=au36+Zi8msTlJFy1asqkDt0gXweSRZ7hRSAO2MAHoHmy0kLZAxADFevh0w7B32Zfj8
         ejuxY4GTFcQXxqOvfRZ+eX+K29uwtTqKwGSUzg+XrxayLG1W7r1d7lsyBU4RKtGWewUW
         zHi0kGKsUAcqLYMKLaKIV7gtwyDRIN78us+XfpN+Ftp04lQKu9c2+HBEyQ223UoiPgNJ
         2yAbWeFP+G/c/3vxkKKY6JLxSExjrmyOznDBmGFRctE2pobCP2zPbpdziu6z0qqH6ni3
         nTibZggS8nExcyR6ck2mQG+Lq2jfZx8fNTVFO5VCk0FlRfjqyc3COMSsFbapu/3xaY3Z
         bYYg==
X-Forwarded-Encrypted: i=1; AJvYcCWY1XIiGCRBjAkBhwUIHqGEs4vs98xefNrWnkOeIA9XZ47qmn2F7Xd18J/yUz0QsDv5rzLPGJXjH1+hmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YypVCC/HdvnIv2bC8rqRwqeukzhxXFFugI//uOxqvHTH+DrGNYi
	Vx8onAjEvElGpQ3/m9GxNhrWG7hEGT+xBkBZV3eGinrSgfvpsqmq5kja6KA4E+0=
X-Gm-Gg: ASbGnctK8tVQoFBXdMhxcwS6JmX+mqqwzEVLuzRL9h28kdS955zgN73q95nyLOTcqd2
	OuNVEh/Lx6QA72RGbbFl7dTiOYrP04moYss1OQFvfpT8jkLLmw+B0JPQIkRHILCCg+gdidgK2Uz
	NbEjAGsqJDvPMbQQiIkef8sT7RbRW3n3tXwMybm8PUg5Nce5HRVIwu5k0X/eeSnVv5xJ0UBz8ws
	7rqqIwZTtoYnfJKNpqCIhP/SkHt9fb6TzCuP+BRK8oF0QUu+jnmmhEV3EG2G5MiHA==
X-Google-Smtp-Source: AGHT+IGw0B69pcIiyWd5mzMp+7QZEvAdzKCqvYC84V0ko8+KVSirsXGLwn19nZI7HpRamxqVkm4+8A==
X-Received: by 2002:a17:903:110c:b0:215:6f9b:e447 with SMTP id d9443c01a7336-21614db3f47mr6536815ad.30.1733434511348;
        Thu, 05 Dec 2024 13:35:11 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e3e414sm16857975ad.56.2024.12.05.13.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 13:35:10 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 05 Dec 2024 13:34:43 -0800
Subject: [PATCH v3] riscv: selftests: Fix warnings pointer masking test
MIME-Version: 1.0
Message-Id: <20241205-fix_warnings_pointer_masking_tests-v3-1-5c28b0f9640d@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAHIcUmcC/5WNwQ6CMBAFf8X0bE1bKIIn/8MYUusCG0NLuk3VE
 P7dwtEbx3nJm5kZQUAgdjnMLEBCQu8yFMcDs4NxPXB8ZmZKqFIqUfIOP+3bBIeup3by6CKEdjT
 0ykMbgSLxoq4ElF2hS9WwLJoC5NcWud0zD0jRh+/WTHJdd+mT5JKDkdBUlbZwNteAyRM6e7J+Z
 Gshqf1Wla3y0QmrRaM7Xf9Zl2X5AUDmzdUtAQAA
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2769; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=wdD8jAZRCjMd3Gu+Lv3upW2aM9UHvcVExGMABP3l5PM=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qQTFPQcfty272Tki0Tp9hVqomnGGX7rOyL86y7/yaNf
 fN5Hq2OUhYGMQ4GWTFFFp5rDcytd/TLjoqWTYCZw8oEMoSBi1MAJmIgzMiwOLJj3XaT6aty+7UK
 Hu/M+srF3f3i2TzBPw5xLmF8UWd7GP7XRf/XLcy/e0Dgwf7+0zbnVmu8eVK56/itfR/y7CYxVp/
 jBwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_133512_319991_ABFE9F24 
X-CRM114-Status: GOOD (  10.40  )
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

V2hlbiBjb21waWxpbmcgdGhlIHBvaW50ZXIgbWFza2luZyB0ZXN0cyB3aXRoIC1XYWxsIHRoaXMg
d2FybmluZwppcyBwcmVzZW50OgoKcG9pbnRlcl9tYXNraW5nLmM6IEluIGZ1bmN0aW9uIOKAmHRl
c3RfdGFnZ2VkX2FkZHJfYWJpX3N5c2N0bOKAmToKcG9pbnRlcl9tYXNraW5nLmM6MjAzOjk6IHdh
cm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3JpdGXigJkKZGVjbGFyZWQgd2l0
aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1yZXN1bHRdCiAg
MjAzIHwgICAgICAgICBwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7IHwKICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+IHBvaW50ZXJfbWFza2luZy5jOjIwODo5OiB3YXJuaW5nOgppZ25vcmlu
ZyByZXR1cm4gdmFsdWUgb2Yg4oCYcHdyaXRl4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlCuKA
mHdhcm5fdW51c2VkX3Jlc3VsdOKAmSBbLVd1bnVzZWQtcmVzdWx0XQogIDIwOCB8ICAgICAgICAg
cHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwoKSSBjYW1lIGFjcm9zcyB0aGlzIG9uIHJpc2N2NjQt
bGludXgtZ251LWdjYyAoVWJ1bnR1CjExLjQuMC0xdWJ1bnR1MX4yMi4wNCkuCgpGaXggdGhpcyBi
eSBjaGVja2luZyB0aGF0IHRoZSBudW1iZXIgb2YgYnl0ZXMgd3JpdHRlbiBlcXVhbCB0aGUgZXhw
ZWN0ZWQKbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4uCgpGaXhlczogNzQ3MGI1YWZkMTUwICgicmlz
Y3Y6IHNlbGZ0ZXN0czogQWRkIGEgcG9pbnRlciBtYXNraW5nIHRlc3QiKQpTaWduZWQtb2ZmLWJ5
OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgotLS0KQ2hhbmdlcyBpbiB2
MzoKLSBGaXggc3lzY3RsIGVuYWJsZWQgdGVzdCBjYXNlIChEcmV3L0FsZXgpCi0gTW92ZSBwd3Jp
dGUgZXJyIGNvbmRpdGlvbiBpbnRvIGdvdG8gKERyZXcpCi0gTGluayB0byB2MjogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNC1maXhfd2FybmluZ3NfcG9pbnRlcl9tYXNraW5nX3Rl
c3RzLXYyLTEtMWJmMGM1MDk1ZjU4QHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2MjoKLSBJIGhh
ZCByZXQgIT0gMiBmb3IgdGVzdGluZywgSSBjaGFuZ2VkIGl0IHRvIGJlIHJldCAhPSAxLgotIExp
bmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDQtZml4X3dhcm5pbmdz
X3BvaW50ZXJfbWFza2luZ190ZXN0cy12MS0xLWVhMWU5NjY1Y2U3YUByaXZvc2luYy5jb20KLS0t
CiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMgfCAx
NyArKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3Yv
YWJpL3BvaW50ZXJfbWFza2luZy5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJp
L3BvaW50ZXJfbWFza2luZy5jCmluZGV4IGRlZTQxYjdlZTNlMy4uMjM2N2IyNGEyYjRlIDEwMDY0
NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5n
LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2lu
Zy5jCkBAIC0xODksNiArMTg5LDcgQEAgc3RhdGljIHZvaWQgdGVzdF90YWdnZWRfYWRkcl9hYmlf
c3lzY3RsKHZvaWQpCiB7CiAJY2hhciB2YWx1ZTsKIAlpbnQgZmQ7CisJaW50IHJldDsKIAogCWtz
ZnRfcHJpbnRfbXNnKCJUZXN0aW5nIHRhZ2dlZCBhZGRyZXNzIEFCSSBzeXNjdGxcbiIpOwogCkBA
IC0yMDAsMTggKzIwMSwzMCBAQCBzdGF0aWMgdm9pZCB0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNj
dGwodm9pZCkKIAl9CiAKIAl2YWx1ZSA9ICcxJzsKLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7
CisJcmV0ID0gcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOworCWlmIChyZXQgIT0gMSkKKwkJZ290
byBlcnJfcHdyaXRlOworCiAJa3NmdF90ZXN0X3Jlc3VsdChzZXRfdGFnZ2VkX2FkZHJfY3RybCht
aW5fcG1sZW4sIHRydWUpID09IC1FSU5WQUwsCiAJCQkgInN5c2N0bCBkaXNhYmxlZFxuIik7CiAK
IAl2YWx1ZSA9ICcwJzsKLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7CisJcmV0ID0gcHdyaXRl
KGZkLCAmdmFsdWUsIDEsIDApOworCWlmIChyZXQgIT0gMSkKKwkJZ290byBlcnJfcHdyaXRlOwor
CiAJa3NmdF90ZXN0X3Jlc3VsdChzZXRfdGFnZ2VkX2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUp
ID09IDAsCiAJCQkgInN5c2N0bCBlbmFibGVkXG4iKTsKIAogCXNldF90YWdnZWRfYWRkcl9jdHJs
KDAsIGZhbHNlKTsKIAogCWNsb3NlKGZkKTsKKworCXJldHVybjsKKworZXJyX3B3cml0ZToKKwlj
bG9zZShmZCk7CisJa3NmdF90ZXN0X3Jlc3VsdF9mYWlsKCJmYWlsZWQgdG8gd3JpdGUgdG8gL3By
b2Mvc3lzL2FiaS90YWdnZWRfYWRkcl9kaXNhYmxlZFxuIik7CiB9CiAKIHN0YXRpYyB2b2lkIHRl
c3RfdGFnZ2VkX2FkZHJfYWJpX3BtbGVuKGludCBwbWxlbikKCi0tLQpiYXNlLWNvbW1pdDogNDAz
ODRjODQwZWExOTQ0ZDdjNWEzOTJlODk3NWVkMDg4ZWNmMGIzNwpjaGFuZ2UtaWQ6IDIwMjQxMjA0
LWZpeF93YXJuaW5nc19wb2ludGVyX21hc2tpbmdfdGVzdHMtMzg2MGU0ZjM1NDI5Ci0tIAotIENo
YXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
