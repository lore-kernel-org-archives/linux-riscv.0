Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DA3E7AD77
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 03:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VYH+nFfG59BJrAzr3o4FLfrxy8FiGOGkDzXcgqmPT9M=; b=tas1OiDF0iAji9
	8rBUIKT84hCGWNGQSYWoXtiZ8ekuWL/Ak30+x+qEEJLQQrA437F0/ZcppoPgFP5/5yVA7aatopUCo
	IN+ca0g/YTLe8kNUoV1pcbWby/jk9K74o6zCSFmA3zgy/25vHR65xJRZ+2MYqVkjPG9Cgmihv/+Fx
	lSiRq2k2X7Q+6wPJaXEZhVIfD7eDy/hv95auduz9b32WD7jEPsskg2hAhAZnEMjhY/9W75v5CYpq1
	epzP+DBRin/S09d0aD+jvybba0XagSnk026COXjIRBvfmb/XgjGzDZqiTW7cggrTtZx9cXgDbj8z8
	8iMC1kTU1iWnV2FNMldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyQO-00000000rEd-3A84;
	Fri, 26 Dec 2025 03:23:32 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyQM-00000000rEC-3Pd2
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 03:23:32 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so5303818b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Dec 2025 19:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766719409; x=1767324209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BwFWAVw6h8Xv312S1VyjkPWwDUVKMnLN9A7mXa09Pw8=;
        b=h+ZFp4JDF5GL42UPVwVf3nDgeMmNPj67KpMz7hrE9ohlywV0MeIJ65d/gCFYwG4m0V
         z/qMngaflyAVMosMiFmjWUqh6Jim6Cqoafzr8oq3s6lf7OVp3n/jz4uIjXQ9+cN2zIY3
         KdY6xEdhhvoZxCUa9Nv379+ehD6WyizTOc+4c4kku9973eQF2TvHEzP20nl4O08ksD6c
         umqfwZiebFwdTNqEe3aXPGtDPRJozzmycb+F8h/OaTDXKZiRiRqQaIXtt5IojPJjgDXN
         fJ9Jbr4ZuNFl2KdXxVOgCblkL4hLR5Ax1YSwvu9Aqeav59fLCUDeluh0mV0fmz+YXSWm
         DbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766719409; x=1767324209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwFWAVw6h8Xv312S1VyjkPWwDUVKMnLN9A7mXa09Pw8=;
        b=hXdjr+HeDxDq3Tzt/93udUJ4jXDjgGPn2efMtQaH3NZRbte2LdA6qCEO02DmOXWI4t
         iN9eopZqxJPECP/UicJBPRy0S0n4ILBSS8QDk0RSoArqfGr5H6Z53krkrZH5N/rJ9KUJ
         d7PNnWKHQqQa0TZ/25QFLIHO0/IsNMXT6+91NMRVu+g5RDb451+F9osD4kJZleanczRV
         FZjLBPF+oDetVwBz5W8WPKfeZzCx1tCO3Ke8m00wwBaxoQPkOCvt7mqyjRpsxjhYB4jv
         PkFSnGurrjfwT4FX6g8NAe3IM7DoLuO0zOHFrwUaIO5mstuyinCesZt3P228YFlGF9HI
         vMDw==
X-Forwarded-Encrypted: i=1; AJvYcCVfff8pBhhgj6tjsG1juQTppIYl/rq94t0GUmZ9WtvZiybGHAlDJzzyr8OgO1zgOSQW7agfoVO8Pm6LGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9UQvvNl6QAdtLt9/FcQiRJx6qy55CsIUNvkXH4n0VJchJ49XV
	X1AcPCfEF5EWXIDaErIKbe0ZqfCiECp44i4vO3tEtzXGSP8mIRX5EQEC
X-Gm-Gg: AY/fxX5Ei0E1dXbS6NlIYtxxWTt0zVdnHYEbRP1r3dpYQx9Pkm4FbaVL7xpjC7iNPrc
	9n32yGA12U33C+gDFcF4t8obwpmAxbnm3FPBuYKoBHfw/ASvHjry7ZvT1pO6DzYU6glyIx7ZWD9
	bZwxbe0ZM40tHe3c79VYE/WzsovjsGjBxgAkD90XgkRmu4KgjmJlTfu0g6qsFbdQz6VNVDmeg9l
	8gpv5y0ifh6OaNjbStiM+d17HP2lB0lbFQ5bG8BI5wMBS5DLCv8cahy9givzghUs8MX6ZsLFGH2
	/IIh3hdSc0kIXVNXpvYs4wpjHPIZPmDgl5mpN7MxtqWXjODeb9ECJe6FcD+xlWpCXIxjjAqEb42
	skAlZtpnMwmoklfYAulpaF+FMDXoEVFzWMTrOlV0o+T2dRmmrcr6KYHdW5aeh87OGMv124RR8IF
	rrYgC4i1+EORv+nEjp
X-Google-Smtp-Source: AGHT+IE07m7Emrj+WzeP1mfMN9OpZdPRM1bkJLjkAvmxllAWcr2fU1Q4i/ulJEELcKU252kxFBcRKg==
X-Received: by 2002:a05:6a21:3287:b0:366:2677:4b38 with SMTP id adf61e73a8af0-376a75e76demr22310059637.8.1766719409132;
        Thu, 25 Dec 2025 19:23:29 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018586sm17909152a12.15.2025.12.25.19.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 19:23:28 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <jiakaiPeanut@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jiakai Xu <jiakaiPeanut@gmail.com>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: [PATCH v2] riscv: fix KUnit test_kprobes crash when building with Clang
Date: Fri, 26 Dec 2025 03:23:17 +0000
Message-Id: <20251226032317.1523764-1-jiakaiPeanut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_192330_854630_75C10E17 
X-CRM114-Status: GOOD (  10.17  )
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

Q2xhbmcgbWlzaW50ZXJwcmV0cyB0aGUgcGxhY2VtZW50IG9mIHRlc3Rfa3Byb2Jlc19hZGRyZXNz
ZXMgYW5kIAp0ZXN0X2twcm9iZXNfZnVuY3Rpb25zIGFycmF5cyB3aGVuIHRoZXkgYXJlIG5vdCBl
eHBsaWNpdGx5IGFzc2lnbmVkIAp0byBhIGRhdGEgc2VjdGlvbi4gVGhpcyBjYW4gbGVhZCB0byBr
bWFsbG9jX2FycmF5KCkgYWxsb2NhdGlvbiAKZXJyb3JzIGFuZCBLVW5pdCBmYWlsdXJlcy4KCldo
ZW4gdGVzdGluZyB0aGUgQ2xhbmctY29tcGlsZWQgY29kZSBpbiBRRU1VLCB0aGlzIHdhcm5pbmcg
d2FzIGVtaXR0ZWQ6CgpXQVJOSU5HOiBDUFU6IDEgUElEOiAzMDAwIGF0IG1tL3BhZ2VfYWxsb2Mu
Yzo1MTU5IF9fYWxsb2NfZnJvemVuX3BhZ2VzX25vcHJvZisweGU2LzB4MmZjIG1tL3BhZ2VfYWxs
b2MuYzo1MTU5CgpGdXJ0aGVyIGludmVzdGlnYXRpb24gcmV2ZWFsZWQgdGhhdCB0aGUgdGVzdF9r
cHJvYmVzX2FkZHJlc3NlcyBhcnJheQphcHBlYXJlZCB0byBoYXZlIG92ZXIgMTAwLDAwMCBlbGVt
ZW50cywgaW5jbHVkaW5nIGludmFsaWQgYWRkcmVzc2VzOwp3aGVyZWFzLCBhY2NvcmRpbmcgdG8g
dGVzdC1rcHJvYmVzLWFzbS5TLCB0ZXN0X2twcm9iZXNfYWRkcmVzc2VzCnNob3VsZCBvbmx5IGhh
dmUgMjUgZWxlbWVudHMuCgpXaGVuIGNvbXBpbGluZyB0aGUga2VybmVsIHdpdGggR0NDLCB0aGUg
a2VybmVsIGJvb3RzIGNvcnJlY3RseS4KClRoaXMgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGJ5IGFk
ZGluZyAuc2VjdGlvbiAucm9kYXRhIHRvIGV4cGxpY2l0bHkgCnBsYWNlIGFycmF5cyBpbiB0aGUg
cmVhZC1vbmx5IGRhdGEgc2VnbWVudC4KCkZvciBkZXRhaWxlZCBkZWJ1ZyBhbmQgYW5hbHlzaXMs
IHNlZToKaHR0cHM6Ly9naXRodWIuY29tL2oxYWthaS90ZW1wL2Jsb2IvbWFpbi8yMDI1MTExMy9y
ZWFkbWUubWQKClNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFj
LmNuPgpTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+Ckxp
bms6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay83MzhkZDRlMi5mZjczLjE5YTdjZDdiNGQ1LkNv
cmVtYWlsLnh1amlha2FpMjAyNUBpc2Nhcy5hYy5jbgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20v
bGx2bS9sbHZtLXByb2plY3QvaXNzdWVzLzE2ODMwOAoKdjEgLT4gdjLvvJoKLSBEcm9wIGNoYW5n
ZXMgdG8gLmFsaWduLCBhbmQgLmdsb2JsLgoKLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90ZXN0cy9r
cHJvYmVzL3Rlc3Qta3Byb2Jlcy1hc20uUyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90ZXN0cy9rcHJvYmVzL3Rl
c3Qta3Byb2Jlcy1hc20uUyBiL2FyY2gvcmlzY3Yva2VybmVsL3Rlc3RzL2twcm9iZXMvdGVzdC1r
cHJvYmVzLWFzbS5TCmluZGV4IGI5NTFkMGYxMjQ4Mi4uZjE2ZGVlZTllMDkxIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC90ZXN0cy9rcHJvYmVzL3Rlc3Qta3Byb2Jlcy1hc20uUworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC90ZXN0cy9rcHJvYmVzL3Rlc3Qta3Byb2Jlcy1hc20uUwpAQCAt
MTgxLDYgKzE4MSw3IEBAIFNZTV9GVU5DX0VORCh0ZXN0X2twcm9iZXNfY19ibmV6KQogCiAjZW5k
aWYgLyogQ09ORklHX1JJU0NWX0lTQV9DICovCiAKKy5zZWN0aW9uIC5yb2RhdGEKIFNZTV9EQVRB
X1NUQVJUKHRlc3Rfa3Byb2Jlc19hZGRyZXNzZXMpCiAJUklTQ1ZfUFRSIHRlc3Rfa3Byb2Jlc19h
ZGRfYWRkcjEKIAlSSVNDVl9QVFIgdGVzdF9rcHJvYmVzX2FkZF9hZGRyMgpAQCAtMjEyLDYgKzIx
Myw3IEBAIFNZTV9EQVRBX1NUQVJUKHRlc3Rfa3Byb2Jlc19hZGRyZXNzZXMpCiAJUklTQ1ZfUFRS
IDAKIFNZTV9EQVRBX0VORCh0ZXN0X2twcm9iZXNfYWRkcmVzc2VzKQogCisuc2VjdGlvbiAucm9k
YXRhCiBTWU1fREFUQV9TVEFSVCh0ZXN0X2twcm9iZXNfZnVuY3Rpb25zKQogCVJJU0NWX1BUUiB0
ZXN0X2twcm9iZXNfYWRkCiAJUklTQ1ZfUFRSIHRlc3Rfa3Byb2Jlc19qYWwKLS0gCjIuMzQuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
