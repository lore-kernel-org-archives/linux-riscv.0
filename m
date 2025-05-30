Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9702C5AD49
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3wHI4Wo55FsuIrhzpxmEBRpsgESXf91PAB7+h+wi/4=; b=0Lr2LG+Uhs3UiI
	MelgjN97Vowt5zgjf24AO9r54ATLPp6LcoMIxAifZxqVQkXnPigKUSbqIl08kjNPgWvmyOIjtExN9
	jtkiC5zIL6tDLQFdbmYVZqlBzbjlTxixD0X2RhyjmvUXB2pZKv+PpD9vi+b9fGQ76XxazlnF2kqfH
	sC582e2UakdXjzmel0HzijqyUSzPQi1NhJDJAcVddebg5EgBVVRXTvdfSIiPbxG3vA4RVIS0WdxBr
	yu1uBf5CBZ4wNFStoKcQZsSo+zzrVJpfYoJ4LLCfBuOkbdYxjIWaQJ8prwsHn7e0EKUnYBQlvZeCf
	iF0grpup3PZapxBdBKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL6mz-00000001rra-0z0U;
	Fri, 30 May 2025 20:57:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL6mu-00000001rpF-49vm
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 20:57:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-450ce671a08so15408875e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 May 2025 13:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748638631; x=1749243431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjZYZIbC6S4Uuu7UtNzxv6J4SIuS9iTbb5YJqO45QR4=;
        b=DMRHuUT5mbo+oRlV+DmN9iDwIhPsMARO8v29zQ7g3kyg+7Rr3MElLUFlhE1pPt4XZS
         kIkc+CLnhQJVlbWVPH7/YgstGq1K9OLMWay1wTB7fMc23rkbUbZky4Q6gg61cced3Cn9
         XeNokQhrvPQbjzlUhqhnCLpDgF9/Vw+kASnsKC3y9re9dtcUfZkvcqOYCiyTILfu3cvj
         kKaToKUZ1xxPOwVDQ7XS8WuuGGshRBJLfEHqOocti+DoZZCbkPdxiugttQ0Od8eAGQSm
         1a7PUBllrwlPlbLuOVqJ8CLGC1+e1lVSpTTvCUNBlr34Jy3mF/MWICjxob1jVBYrxMVX
         dvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638631; x=1749243431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjZYZIbC6S4Uuu7UtNzxv6J4SIuS9iTbb5YJqO45QR4=;
        b=dJBsudsVp8oolQTZemUZwR+T5MYhrW/KWR3WZyoic46FkjQaXDD/e8fhKzUCNdn1x+
         u2JUZGf0/oFYau05uFaKk/D0beFf6TB/QKwZdapAZekTo1/nSyaG+pvo07zBtX4bhlnC
         Cuh8sKJD8iOuv9L7YJitaCz6EJ7lc70YprgYZu2A947ZQ1fDmtPdtF6cM6VB1yF4joLx
         KCKuEELHoY24Blne1uS6/CN/YTJpQHk9lRGwqphu5hUPw6K+v7cr764gNU4rK7lD83GH
         c6fmRxXJMRb/iDIbBDYOXIxiqL63BApfI9XKKpHxQiKBYpH8GPWlO51j81e1xN1Z/xkL
         MopA==
X-Gm-Message-State: AOJu0YweXKwHdYqilZ3TGTKDShWV1AWLOTAUxrSM+KrVVp0weptqrl9R
	LcL9vwDdv1oLhA0nH2khBU+9m1nq9hjt3npp6wFwD/2jIgFVEKCy3MuAmEhiLcOiKhIAJTWoF+8
	Up7fe
X-Gm-Gg: ASbGncufVMEUhr5N/VTGCDUoOA1syMlG4sTzX0A+RZG6wtpJG+B2s+p8CDhUS3mFlkx
	zoKC9Y+gSYpf6Cdn7DJlGJUoc6GZpoqXyYoPrTXhK+xzExB8qGzM6+apNp1kaVqBt5o3ND3Indz
	KcteWTkq/jJ0Bio3IZw1OYWZmmt/EN44u8YTDyVognXuQZMvf3GyKMCXLqrkbX6Dk6H7w75w/GU
	gcR0g0mJ41Y7/DW0PwzBE1PXt3jCYxrBa0f6/BNN6hG45wKn5k8yiGG2lkvmNl+kL7ArsZQPMBK
	JC4nP/PaKiBeZnskmxl41PBw6oz4lupwHTiU9FhBfGZ0NohsnUVe/GCpEV93NUKcozHUHTpUNb5
	ev2cQCRR8OJlmslyMAlMZEsJIqXbOZy2F
X-Google-Smtp-Source: AGHT+IFFDiOg0ELjNJBx/TmG4aDGrLUMzGWJBFq4CzZb3gUeDCQ/BIo5wyF05rQAokGbHbkjDRQWAg==
X-Received: by 2002:a05:6000:2c0d:b0:3a4:d994:be7d with SMTP id ffacd0b85a97d-3a4f7a5d340mr3529790f8f.23.1748638630978;
        Fri, 30 May 2025 13:57:10 -0700 (PDT)
Received: from carbon-x1.. (amontpellier-552-1-200-51.w109-210.abo.wanadoo.fr. [109.210.255.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b79asm5666527f8f.2.2025.05.30.13.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:57:10 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in get/put_user()
Date: Fri, 30 May 2025 22:56:58 +0200
Message-ID: <20250530205658.624195-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530205658.624195-1-cleger@rivosinc.com>
References: <20250530205658.624195-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_135713_044209_2C01BC54 
X-CRM114-Status: GOOD (  15.44  )
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

RG9pbmcgbWlzYWxpZ25lZCBhY2Nlc3MgdG8gdXNlcnNwYWNlIG1lbW9yeSB3b3VsZCBtYWtlIGEg
dHJhcCBvbgpwbGF0Zm9ybSB3aGVyZSBpdCBpcyBlbXVsYXRlZC4gTGF0ZXN0IGZpeGVzIHJlbW92
ZWQgdGhlIGtlcm5lbApjYXBhYmlsaXR5IHRvIGRvIHVuYWxpZ25lZCBhY2Nlc3NlcyB0byB1c2Vy
c3BhY2UgbWVtb3J5IHNhZmVseSBzaW5jZQppbnRlcnJ1cHRzIGFyZSBrZXB0IGRpc2FibGVkIGF0
IGFsbCB0aW1lIGR1cmluZyB0aGF0LiBUaHVzIGRvaW5nIHNvCndvdWxkIGNyYXNoIHRoZSBrZXJu
ZWwuCgpTdWNoIGJlaGF2aW9yIHdhcyBkZXRlY3RlZCB3aXRoIEdFVF9VTkFMSUdOX0NUTCgpIHRo
YXQgd2FzIGRvaW5nCmEgcHV0X3VzZXIoKSB3aXRoIGFuIHVuc2lnbmVkIGxvbmcqIGFkZHJlc3Mg
dGhhdCBzaG91bGQgaGF2ZSBiZWVuIGFuCnVuc2lnbmVkIGludCouIFJlZW5hYmxpbmcga2VybmVs
IG1pc2FsaWduZWQgYWNjZXNzIGVtdWxhdGlvbiBpcyBhIGJpdApyaXNreSBhbmQgaXQgd291bGQg
YWxzbyBkZWdyYWRlIHBlcmZvcm1hbmNlcy4gUmF0aGVyIHRoYW4gZG9pbmcgdGhhdCwKd2Ugd2ls
bCB0cnkgdG8gYXZvaWQgYW55IG1pc2FsaWduZWQgYWNjZXNzZWQgYnkgdXNpbmcgY29weV9mcm9t
L3RvX3VzZXIoKQp3aGljaCBkb2VzIG5vdCBkbyBhbnkgbWlzYWxpZ25lZCBhY2Nlc3Nlcy4gVGhp
cyBjYW4gYmUgZG9uZSBvbmx5IGZvcgohQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9B
Q0NFU1MgYW5kIHRodXMgYWxsb3dzIHRvIG9ubHkgZ2VuZXJhdGUKYSBiaXQgbW9yZSBjb2RlIGZv
ciB0aGlzIGNvbmZpZy4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKaW5kZXggMDQ2ZGU3
Y2VkMDljLi5iNTQyYzA1ZjM5NGYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCkBAIC0xNjks
OCArMTY5LDIxIEBAIGRvIHsJCQkJCQkJCVwKIAogI2VuZGlmIC8qIENPTkZJR182NEJJVCAqLwog
Cit1bnNpZ25lZCBsb25nIF9fbXVzdF9jaGVjayBfX2FzbV9jb3B5X3RvX3VzZXIodm9pZCBfX3Vz
ZXIgKnRvLAorCWNvbnN0IHZvaWQgKmZyb20sIHVuc2lnbmVkIGxvbmcgbik7Cit1bnNpZ25lZCBs
b25nIF9fbXVzdF9jaGVjayBfX2FzbV9jb3B5X2Zyb21fdXNlcih2b2lkICp0bywKKwljb25zdCB2
b2lkIF9fdXNlciAqZnJvbSwgdW5zaWduZWQgbG9uZyBuKTsKKwogI2RlZmluZSBfX2dldF91c2Vy
X25vY2hlY2soeCwgX19ndV9wdHIsIGxhYmVsKQkJCVwKIGRvIHsJCQkJCQkJCVwKKwlpZiAoIUlT
X0VOQUJMRUQoQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MpKSB7CQkJXAor
CQlpZiAoIUlTX0FMSUdORUQoKHVpbnRwdHJfdClfX2d1X3B0ciwgc2l6ZW9mKCpfX2d1X3B0cikp
KSB7CQlcCisJCQlpZiAoX19hc21fY29weV9mcm9tX3VzZXIoJih4KSwgX19ndV9wdHIsIHNpemVv
ZigqX19ndV9wdHIpKSkJXAorCQkJCWdvdG8gbGFiZWw7CQkJXAorCQkJZWxzZQkJCQkJXAorCQkJ
CWJyZWFrOwkJCQlcCisJCX0JCQkJCQlcCisJfQkJCQkJCQlcCiAJc3dpdGNoIChzaXplb2YoKl9f
Z3VfcHRyKSkgewkJCQlcCiAJY2FzZSAxOgkJCQkJCQlcCiAJCV9fZ2V0X3VzZXJfYXNtKCJsYiIs
ICh4KSwgX19ndV9wdHIsIGxhYmVsKTsJXApAQCAtMjk3LDYgKzMxMCwxNSBAQCBkbyB7CQkJCQkJ
CQlcCiAKICNkZWZpbmUgX19wdXRfdXNlcl9ub2NoZWNrKHgsIF9fZ3VfcHRyLCBsYWJlbCkJCQlc
CiBkbyB7CQkJCQkJCQlcCisJaWYgKCFJU19FTkFCTEVEKENPTkZJR19IQVZFX0VGRklDSUVOVF9V
TkFMSUdORURfQUNDRVNTKSkgewkJCVwKKwkJaWYgKCFJU19BTElHTkVEKCh1aW50cHRyX3QpX19n
dV9wdHIsIHNpemVvZigqX19ndV9wdHIpKSkgewkJXAorCQkJdW5zaWduZWQgbG9uZyB2YWwgPSAo
dW5zaWduZWQgbG9uZykoeCk7CQkJCVwKKwkJCWlmIChfX2FzbV9jb3B5X3RvX3VzZXIoX19ndV9w
dHIsICYodmFsKSwgc2l6ZW9mKCpfX2d1X3B0cikpKQlcCisJCQkJZ290byBsYWJlbDsJCQlcCisJ
CQllbHNlCQkJCQlcCisJCQkJYnJlYWs7CQkJCVwKKwkJfQkJCQkJCVwKKwl9CQkJCQkJCVwKIAlz
d2l0Y2ggKHNpemVvZigqX19ndV9wdHIpKSB7CQkJCVwKIAljYXNlIDE6CQkJCQkJCVwKIAkJX19w
dXRfdXNlcl9hc20oInNiIiwgKHgpLCBfX2d1X3B0ciwgbGFiZWwpOwlcCkBAIC0zODUsMTIgKzQw
Nyw2IEBAIGVycl9sYWJlbDoJCQkJCQkJXAogCQktRUZBVUxUOwkJCQkJXAogfSkKIAotCi11bnNp
Z25lZCBsb25nIF9fbXVzdF9jaGVjayBfX2FzbV9jb3B5X3RvX3VzZXIodm9pZCBfX3VzZXIgKnRv
LAotCWNvbnN0IHZvaWQgKmZyb20sIHVuc2lnbmVkIGxvbmcgbik7Ci11bnNpZ25lZCBsb25nIF9f
bXVzdF9jaGVjayBfX2FzbV9jb3B5X2Zyb21fdXNlcih2b2lkICp0bywKLQljb25zdCB2b2lkIF9f
dXNlciAqZnJvbSwgdW5zaWduZWQgbG9uZyBuKTsKLQogc3RhdGljIGlubGluZSB1bnNpZ25lZCBs
b25nCiByYXdfY29weV9mcm9tX3VzZXIodm9pZCAqdG8sIGNvbnN0IHZvaWQgX191c2VyICpmcm9t
LCB1bnNpZ25lZCBsb25nIG4pCiB7Ci0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
