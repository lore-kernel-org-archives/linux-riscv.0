Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BDAC369D1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+YPNAAhb8ZOjXuIf1rdIWXKYfazt9p9oApR4l5/fHQ=; b=0j9P2m76wP5qpY
	ILqwEvzMEgKQURjq9mc7c7VkpcJ/bAe0pL8JtDk+anICywZjCWLYudCDXqSr9QDG2CsZmpFehU+xH
	AwN+oa42dSHKmgoXY35prSuTIwAm93wxfw8KzHNxp99lCub+hYe5PKdSijjMC0r9gYoQW0kZPjEyN
	+ReFr50DuMLXnT/DNyHoFFbNwP5v4wVD/ajPxXFdba999qI0haQS1iCyGDOkOIDZM8haqAc8xlShP
	GPl515rVJB0amdfQ6DHGdQWOc+1oSWPV1AkqgUer8bT8d2OsudL2YjTYL84Be7RAerE2H0QaAuFpI
	Gy1s8txuwMvD7aU2Ybaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jab-00000008LhI-0Oue;
	Tue, 22 Apr 2025 19:47:29 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GPf-00000007tTT-0qrq
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 16:24:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-73c17c770a7so6883714b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 09:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339038; x=1745943838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmBbq7nPpmDt102f7nSiOG4D5hySZc1qJkWls9LUQzY=;
        b=xpuOLiFc/q/aPi9rKxOvOyJR1XQQ0xZ5nvrsGz0beNsfPxxlTjZXqprQTd7KjV841i
         eWFEiuw2vavVidmnJPqmg5O3hxMF+e9BDh6hb3Ue9jEiljEemInR63tuiC1nQhLx0dnT
         XywGl84m+curoEpqvVmCqNJu4Lg5AF++mosW+9N5JTBtintmSa7NRF3a5stV/IpjXPv9
         gluLT9+pq10GS8uBV49JBOgSYX1kdMGwgcbAVCbl3tS66sITiN2tMtQzc8i+xl+/MqUz
         fGWx9SKpMljafa/ln0s3HJ4alnbfixq5lvP4aRABbITjjYmJMEymrhllruw2xaRa7FEG
         K/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339038; x=1745943838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmBbq7nPpmDt102f7nSiOG4D5hySZc1qJkWls9LUQzY=;
        b=qCGioBDAmPvMuTaoCM1XdIdya4bVBu7OBE8vlhuSU2sdBhwFLVIT6NDAOmymbkfoaj
         67SWOQ56fasJOnhvQ93rklZRGSa9ixbSRhaOn7397+OvT2TnI2QkhuREsBwlRm1YsOPz
         uD0XNhcBGRJGWlZlNy5VP2lwp3n5OFJ4fQa19npYnQTAFtGN9upMmTJGhsO7VTbCYUik
         uwA4nVLW99ertRmHZc1JxlxSlu1NrGVux1eZVjMPCdAoPbBQBZ3/PrDuxAOtinbfcMOU
         bLU26FOHRh5KjBli/SyS0PM6yZIWt7vqGi2nCJZkVd17QD1O8/MNfpBFHEUlnIdwvOcD
         +Wsw==
X-Forwarded-Encrypted: i=1; AJvYcCVX598auLlnae76pFBi1tqh6+8+T4xjeuUoHa2yE058nM1TrjmhJG6Qmu2/1VVXJNx1ILMYmIXxyjkXdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo8NfGK8lmoK3ZCsrtkfc27Ev1rOR4XwtX4DSvNa0fY/ebC74t
	r1+GoE4Wl+Fji4rP+PFgAmJXI3nsi1kjFn+eY3SDpDzGbzsd3Z2WdI9ubgXUhzs=
X-Gm-Gg: ASbGncurBbACSooIyj+rNMERHCpiTjHwFS+RancHbVeQPeRfBUvBTgUtEBQN162y9kd
	ntXYzfTKY6mGpS0uTC4dBOfjRCbODKGGC5V4DVoVtSOXr8+HeD1GWdTL5lAM6epIilnunCPBiK6
	2zQy4+LhG8RF9xtK7WWCQSwNOEUvOrAxBfDHidwCD1i7ZSQuefukJasvqgF6wrCSY5d3V1TzrWh
	YqvSffqreXTnECC50M9PM8tNTUPJcyXCm0K2CmEeiRmZ4ya7/3R/Qm88C63zzC5Bloai5rguGZC
	XqrHQKCJ8E2GYPRjGkkXOz8IEGMBhm3WziRydARCWA==
X-Google-Smtp-Source: AGHT+IHJ0hD1BX6oP9p44ibBdnegPGhkVm172MRAQDe1UgxH2sSUHeHwPJE2BCcGpoc9ezKvgoF/MA==
X-Received: by 2002:a05:6a20:394e:b0:1f5:8eb1:d5d2 with SMTP id adf61e73a8af0-203cbc5594bmr24479521637.13.1745339038438;
        Tue, 22 Apr 2025 09:23:58 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:23:57 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 1/5] riscv: misaligned: factorize trap handling
Date: Tue, 22 Apr 2025 18:23:08 +0200
Message-ID: <20250422162324.956065-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162324.956065-1-cleger@rivosinc.com>
References: <20250422162324.956065-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_092359_239590_6C290DB4 
X-CRM114-Status: GOOD (  10.85  )
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

U2luY2UgYm90aCBsb2FkL3N0b3JlIGFuZCB1c2VyL2tlcm5lbCBzaG91bGQgdXNlIGFsbW9zdCB0
aGUgc2FtZSBwYXRoIGFuZAp0aGF0IHdlIGFyZSBnb2luZyB0byBhZGQgc29tZSBjb2RlIGFyb3Vu
ZCB0aGF0LCBmYWN0b3JpemUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDY2ICsr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM2
IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IDhmZjhlOGIz
NjUyNC4uYjFkOTkxYzc4YTIzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTE5OCw0NyArMTk4LDUzIEBAIGFz
bWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9pbnNuX2lsbGVn
YWwoc3RydWN0IHB0X3JlZ3MgKnJlCiBET19FUlJPUl9JTkZPKGRvX3RyYXBfbG9hZF9mYXVsdCwK
IAlTSUdTRUdWLCBTRUdWX0FDQ0VSUiwgImxvYWQgYWNjZXNzIGZhdWx0Iik7CiAKLWFzbWxpbmth
Z2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9sb2FkX21pc2FsaWduZWQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCitlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUgeworCU1J
U0FMSUdORURfU1RPUkUsCisJTUlTQUxJR05FRF9MT0FELAorfTsKK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgeworCWNvbnN0IGNoYXIgKnR5cGVfc3RyOworCWludCAoKmhhbmRsZXIpKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKTsKK30gbWlzYWxpZ25lZF9oYW5kbGVyW10gPSB7CisJW01JU0FMSUdORURfU1RP
UkVdID0geworCQkudHlwZV9zdHIgPSAiT29wcyAtIHN0b3JlIChvciBBTU8pIGFkZHJlc3MgbWlz
YWxpZ25lZCIsCisJCS5oYW5kbGVyID0gaGFuZGxlX21pc2FsaWduZWRfc3RvcmUsCisJfSwKKwlb
TUlTQUxJR05FRF9MT0FEXSA9IHsKKwkJLnR5cGVfc3RyID0gIk9vcHMgLSBsb2FkIGFkZHJlc3Mg
bWlzYWxpZ25lZCIsCisJCS5oYW5kbGVyID0gaGFuZGxlX21pc2FsaWduZWRfbG9hZCwKKwl9LAor
fTsKKworc3RhdGljIHZvaWQgZG9fdHJhcF9taXNhbGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdz
LCBlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUgdHlwZSkKIHsKLQlpZiAodXNlcl9tb2RlKHJl
Z3MpKSB7CisJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZTsKKworCWlmICh1c2VyX21vZGUocmVncykp
CiAJCWlycWVudHJ5X2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MpOworCWVsc2UKKwkJc3RhdGUg
PSBpcnFlbnRyeV9ubWlfZW50ZXIocmVncyk7CiAKLQkJaWYgKGhhbmRsZV9taXNhbGlnbmVkX2xv
YWQocmVncykpCi0JCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywgQlVTX0FEUkFMTiwgcmVn
cy0+ZXBjLAotCQkJICAgICAgIk9vcHMgLSBsb2FkIGFkZHJlc3MgbWlzYWxpZ25lZCIpOworCWlm
IChtaXNhbGlnbmVkX2hhbmRsZXJbdHlwZV0uaGFuZGxlcihyZWdzKSkKKwkJZG9fdHJhcF9lcnJv
cihyZWdzLCBTSUdCVVMsIEJVU19BRFJBTE4sIHJlZ3MtPmVwYywKKwkJCSAgICAgIG1pc2FsaWdu
ZWRfaGFuZGxlclt0eXBlXS50eXBlX3N0cik7CiAKKwlpZiAodXNlcl9tb2RlKHJlZ3MpKQogCQlp
cnFlbnRyeV9leGl0X3RvX3VzZXJfbW9kZShyZWdzKTsKLQl9IGVsc2UgewotCQlpcnFlbnRyeV9z
dGF0ZV90IHN0YXRlID0gaXJxZW50cnlfbm1pX2VudGVyKHJlZ3MpOwotCi0JCWlmIChoYW5kbGVf
bWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQotCQkJZG9fdHJhcF9lcnJvcihyZWdzLCBTSUdCVVMsIEJV
U19BRFJBTE4sIHJlZ3MtPmVwYywKLQkJCSAgICAgICJPb3BzIC0gbG9hZCBhZGRyZXNzIG1pc2Fs
aWduZWQiKTsKLQorCWVsc2UKIAkJaXJxZW50cnlfbm1pX2V4aXQocmVncywgc3RhdGUpOwotCX0K
IH0KIAotYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX3N0
b3JlX21pc2FsaWduZWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCithc21saW5rYWdlIF9fdmlzaWJs
ZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfbG9hZF9taXNhbGlnbmVkKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQogewotCWlmICh1c2VyX21vZGUocmVncykpIHsKLQkJaXJxZW50cnlfZW50ZXJf
ZnJvbV91c2VyX21vZGUocmVncyk7Ci0KLQkJaWYgKGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKHJl
Z3MpKQotCQkJZG9fdHJhcF9lcnJvcihyZWdzLCBTSUdCVVMsIEJVU19BRFJBTE4sIHJlZ3MtPmVw
YywKLQkJCQkiT29wcyAtIHN0b3JlIChvciBBTU8pIGFkZHJlc3MgbWlzYWxpZ25lZCIpOwotCi0J
CWlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwotCX0gZWxzZSB7Ci0JCWlycWVudHJ5
X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9ubWlfZW50ZXIocmVncyk7Ci0KLQkJaWYgKGhhbmRs
ZV9taXNhbGlnbmVkX3N0b3JlKHJlZ3MpKQotCQkJZG9fdHJhcF9lcnJvcihyZWdzLCBTSUdCVVMs
IEJVU19BRFJBTE4sIHJlZ3MtPmVwYywKLQkJCQkiT29wcyAtIHN0b3JlIChvciBBTU8pIGFkZHJl
c3MgbWlzYWxpZ25lZCIpOworCWRvX3RyYXBfbWlzYWxpZ25lZChyZWdzLCBNSVNBTElHTkVEX0xP
QUQpOworfQogCi0JCWlycWVudHJ5X25taV9leGl0KHJlZ3MsIHN0YXRlKTsKLQl9Cithc21saW5r
YWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfc3RvcmVfbWlzYWxpZ25l
ZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwlkb190cmFwX21pc2FsaWduZWQocmVncywgTUlT
QUxJR05FRF9TVE9SRSk7CiB9CisKIERPX0VSUk9SX0lORk8oZG9fdHJhcF9zdG9yZV9mYXVsdCwK
IAlTSUdTRUdWLCBTRUdWX0FDQ0VSUiwgInN0b3JlIChvciBBTU8pIGFjY2VzcyBmYXVsdCIpOwog
RE9fRVJST1JfSU5GTyhkb190cmFwX2VjYWxsX3MsCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
