Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9983DC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 02:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBGB1DRG/dp22lTr4ws9z0j0TbLHaAy0XoDZ6M5qBro=; b=jPCVvTNgq4O2ST
	o9OlKZIlk8Y42SHRRAQEl3asLENOJ0SK+dEchyhR7tnTvqZXlXLp3ek3JMuqhZURxZWEDpf4kalVU
	+/34+Wu6iGAf3ZVqsOy02NGij7B+5ZHOzkBPnXvHzCbTKbdr87VgMz00B4WBYlMk97DJW6xGCFWl4
	4vVDOdP9gVi+KMeV4fy5R76RKSNb5xgVBZZEgpOXLw0jcPtBg8zbuMOg9BC3FQBbV9BZjVeSf54LD
	YGIcJf58bUccYk9TmS/TwMCDbNnn5Me96ekdt1CmQQ863qLzh6d8TTuab3KMr2YyZF6bg9fA1nF0L
	mm4waK20J5MH1q9JJ3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdKag-0000000GgHZ-31KA;
	Mon, 12 Aug 2024 02:15:22 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJQs-0000000GaOS-0mxs
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:01:11 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3db14cc9066so2722759b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424469; x=1724029269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2F9HlOmYYBgfOGZ5Y5XAW+7ZHo7CSZJxIOIoseG4Ek=;
        b=JvDkiDM4LY4Let/Z10ykhhb9O+65gm3jDzWIAI4mB82Ca8kUhEINAF5HT/k8l+M6tQ
         ZFn6NcsShDOMWfUpvsE85y+kxvConqzQsoRUEMpK6qo0N6jUsbYZYfpRq47mHBuPmWBJ
         xK94BZSpS8zJC2wVV3lH0oUfG1Od3sM+wT3QhSuMJgwXdjkEk4Ew8MJJfXMFUeZD2/oY
         fuN0w0LgbD5qrfSiypJ79BqjM6qrW8BZ7HZ/dOaqIRRiR4CnkkqwY1rgQh7k0AUIfJlS
         79j0ZEUJmYMn67H7ZSPdDi4ngnBFoRJU6YMU7tf4okKJa2DdbTACmcRyMx8VthNFUvoy
         Z+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424469; x=1724029269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2F9HlOmYYBgfOGZ5Y5XAW+7ZHo7CSZJxIOIoseG4Ek=;
        b=Rv5KiQA9D5fu6CnFu9NZiwAdhtcX77WN/ezzf5k4XcYErTIMeja4eAJZCAFL0Aod/M
         tDj1tclR6uFkARLl+uiEno0rN4DdzrFJoVA+gkSw7jzPY2vODQf421tj7GRTlFv3XBqN
         afcH6Km/wgrHWeLH8PXrts6NDgTJJ1oK3fjnYma4f1Ak9RXOioRi/g3v2aRIJO4kU19f
         JsvRdjVIykxKskcYbZX+3kEltpwdr4MsOWh3FfIf2CqZVcBM4ciGFMl/VDBLtSXujeBX
         UfR4iVCu1eDnkHp9v+H9YmAxPMr6dOkybhZoGyLBlb14SVBSX9xp0v8S8ScLAJEyqGhf
         UqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGtjz53cMsZmVMHNq21BAthmYF6hNu6KLtXxk1psdpYbf6PWhGpe0jK6B0yUe/JmrTq0Czoq2QGRkDy/g3dTPMbVY1EHlgELs6iOxi1g6s
X-Gm-Message-State: AOJu0Yyrco8mL1s0MncJ02bpOvGfzBb4jua1hUs6K14JSjSHRpbjTW2d
	7DQsX89egd1Iqa5crU3ty1uXlA8FWMVQHtisngbEs/hcXKv43tdawFgqmW+z7W0=
X-Google-Smtp-Source: AGHT+IHZXV1nZ3pGHtKOzIjfGzSIJM5PQQnjoEr5t/Q7EAetVkMKeElEktJkKAiBNFFJkWIu7MYWBg==
X-Received: by 2002:a05:6808:bcc:b0:3d9:35df:8f2 with SMTP id 5614622812f47-3dc4169de4bmr11444935b6e.28.1723424469384;
        Sun, 11 Aug 2024 18:01:09 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.18.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:01:08 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 14/17] irqchip/riscv-imsic-state: Create separate function for DT
Date: Mon, 12 Aug 2024 06:29:26 +0530
Message-ID: <20240812005929.113499-15-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180110_259427_3986A1E0 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="cp1252"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

V2hpbGUgcG9wdWxhdGluZyBJTVNJQyBnbG9iYWwgc3RydWN0dXJlLCBtYW55IGZpZWxkcyBhcmUg
aW5pdGlhbGl6ZWQKdXNpbmcgRFQgcHJvcGVydGllcy4gTWFrZSB0aGUgY29kZSB3aGljaCB1c2Vz
IERUIHByb3BlcnRpZXMgYXMgc2VwYXJhdGUKZnVuY3Rpb24gc28gdGhhdCBpdCBpcyBlYXNpZXIg
dG8gYWRkIEFDUEkgc3VwcG9ydCBsYXRlci4gTm8KZnVuY3Rpb25hbGl0eSBhZGRlZC9jaGFuZ2Vk
LgoKU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KU2ln
bmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+ClJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpUZXN0ZWQtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWltc2ljLXN0YXRlLmMgfCA5NyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jIGIvZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1pbXNpYy1zdGF0ZS5jCmluZGV4IDU0NzlmODcyZTYyYi4uZjllNzA4MzI4NjNhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKKysrIGIv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCkBAIC01MTAsNiArNTEwLDYw
IEBAIHN0YXRpYyBpbnQgX19pbml0IGltc2ljX21hdHJpeF9pbml0KHZvaWQpCiAJcmV0dXJuIDA7
CiB9CiAKK3N0YXRpYyBpbnQgX19pbml0IGltc2ljX3BvcHVsYXRlX2dsb2JhbF9kdChzdHJ1Y3Qg
Zndub2RlX2hhbmRsZSAqZndub2RlLAorCQkJCQkgICBzdHJ1Y3QgaW1zaWNfZ2xvYmFsX2NvbmZp
ZyAqZ2xvYmFsLAorCQkJCQkgICB1MzIgKm5yX3BhcmVudF9pcnFzKQoreworCWludCByYzsKKwor
CS8qIEZpbmQgbnVtYmVyIG9mIGd1ZXN0IGluZGV4IGJpdHMgaW4gTVNJIGFkZHJlc3MgKi8KKwly
YyA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25vZGUoZndub2RlKSwgInJpc2N2LGd1ZXN0
LWluZGV4LWJpdHMiLAorCQkJCSAgJmdsb2JhbC0+Z3Vlc3RfaW5kZXhfYml0cyk7CisJaWYgKHJj
KQorCQlnbG9iYWwtPmd1ZXN0X2luZGV4X2JpdHMgPSAwOworCisJLyogRmluZCBudW1iZXIgb2Yg
SEFSVCBpbmRleCBiaXRzICovCisJcmMgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMih0b19vZl9ub2Rl
KGZ3bm9kZSksICJyaXNjdixoYXJ0LWluZGV4LWJpdHMiLAorCQkJCSAgJmdsb2JhbC0+aGFydF9p
bmRleF9iaXRzKTsKKwlpZiAocmMpIHsKKwkJLyogQXNzdW1lIGRlZmF1bHQgdmFsdWUgKi8KKwkJ
Z2xvYmFsLT5oYXJ0X2luZGV4X2JpdHMgPSBfX2ZscygqbnJfcGFyZW50X2lycXMpOworCQlpZiAo
QklUKGdsb2JhbC0+aGFydF9pbmRleF9iaXRzKSA8ICpucl9wYXJlbnRfaXJxcykKKwkJCWdsb2Jh
bC0+aGFydF9pbmRleF9iaXRzKys7CisJfQorCisJLyogRmluZCBudW1iZXIgb2YgZ3JvdXAgaW5k
ZXggYml0cyAqLworCXJjID0gb2ZfcHJvcGVydHlfcmVhZF91MzIodG9fb2Zfbm9kZShmd25vZGUp
LCAicmlzY3YsZ3JvdXAtaW5kZXgtYml0cyIsCisJCQkJICAmZ2xvYmFsLT5ncm91cF9pbmRleF9i
aXRzKTsKKwlpZiAocmMpCisJCWdsb2JhbC0+Z3JvdXBfaW5kZXhfYml0cyA9IDA7CisKKwkvKgor
CSAqIEZpbmQgZmlyc3QgYml0IHBvc2l0aW9uIG9mIGdyb3VwIGluZGV4LgorCSAqIElmIG5vdCBz
cGVjaWZpZWQgYXNzdW1lZCB0aGUgZGVmYXVsdCBBUExJQy1JTVNJQyBjb25maWd1cmF0aW9uLgor
CSAqLworCXJjID0gb2ZfcHJvcGVydHlfcmVhZF91MzIodG9fb2Zfbm9kZShmd25vZGUpLCAicmlz
Y3YsZ3JvdXAtaW5kZXgtc2hpZnQiLAorCQkJCSAgJmdsb2JhbC0+Z3JvdXBfaW5kZXhfc2hpZnQp
OworCWlmIChyYykKKwkJZ2xvYmFsLT5ncm91cF9pbmRleF9zaGlmdCA9IElNU0lDX01NSU9fUEFH
RV9TSElGVCAqIDI7CisKKwkvKiBGaW5kIG51bWJlciBvZiBpbnRlcnJ1cHQgaWRlbnRpdGllcyAq
LworCXJjID0gb2ZfcHJvcGVydHlfcmVhZF91MzIodG9fb2Zfbm9kZShmd25vZGUpLCAicmlzY3Ys
bnVtLWlkcyIsCisJCQkJICAmZ2xvYmFsLT5ucl9pZHMpOworCWlmIChyYykgeworCQlwcl9lcnIo
IiVwZndQOiBudW1iZXIgb2YgaW50ZXJydXB0IGlkZW50aXRpZXMgbm90IGZvdW5kXG4iLCBmd25v
ZGUpOworCQlyZXR1cm4gcmM7CisJfQorCisJLyogRmluZCBudW1iZXIgb2YgZ3Vlc3QgaW50ZXJy
dXB0IGlkZW50aXRpZXMgKi8KKwlyYyA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25vZGUo
Zndub2RlKSwgInJpc2N2LG51bS1ndWVzdC1pZHMiLAorCQkJCSAgJmdsb2JhbC0+bnJfZ3Vlc3Rf
aWRzKTsKKwlpZiAocmMpCisJCWdsb2JhbC0+bnJfZ3Vlc3RfaWRzID0gZ2xvYmFsLT5ucl9pZHM7
CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBfX2luaXQgaW1zaWNfZ2V0X3BhcmVudF9o
YXJ0aWQoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwKIAkJCQkJICB1MzIgaW5kZXgsIHVu
c2lnbmVkIGxvbmcgKmhhcnRpZCkKIHsKQEAgLTU3OCw1MCArNjMyLDkgQEAgc3RhdGljIGludCBf
X2luaXQgaW1zaWNfcGFyc2VfZndub2RlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsCiAJ
CXJldHVybiAtRUlOVkFMOwogCX0KIAotCS8qIEZpbmQgbnVtYmVyIG9mIGd1ZXN0IGluZGV4IGJp
dHMgaW4gTVNJIGFkZHJlc3MgKi8KLQlyYyA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25v
ZGUoZndub2RlKSwgInJpc2N2LGd1ZXN0LWluZGV4LWJpdHMiLAotCQkJCSAgJmdsb2JhbC0+Z3Vl
c3RfaW5kZXhfYml0cyk7CisJcmMgPSBpbXNpY19wb3B1bGF0ZV9nbG9iYWxfZHQoZndub2RlLCBn
bG9iYWwsIG5yX3BhcmVudF9pcnFzKTsKIAlpZiAocmMpCi0JCWdsb2JhbC0+Z3Vlc3RfaW5kZXhf
Yml0cyA9IDA7Ci0KLQkvKiBGaW5kIG51bWJlciBvZiBIQVJUIGluZGV4IGJpdHMgKi8KLQlyYyA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25vZGUoZndub2RlKSwgInJpc2N2LGhhcnQtaW5k
ZXgtYml0cyIsCi0JCQkJICAmZ2xvYmFsLT5oYXJ0X2luZGV4X2JpdHMpOwotCWlmIChyYykgewot
CQkvKiBBc3N1bWUgZGVmYXVsdCB2YWx1ZSAqLwotCQlnbG9iYWwtPmhhcnRfaW5kZXhfYml0cyA9
IF9fZmxzKCpucl9wYXJlbnRfaXJxcyk7Ci0JCWlmIChCSVQoZ2xvYmFsLT5oYXJ0X2luZGV4X2Jp
dHMpIDwgKm5yX3BhcmVudF9pcnFzKQotCQkJZ2xvYmFsLT5oYXJ0X2luZGV4X2JpdHMrKzsKLQl9
Ci0KLQkvKiBGaW5kIG51bWJlciBvZiBncm91cCBpbmRleCBiaXRzICovCi0JcmMgPSBvZl9wcm9w
ZXJ0eV9yZWFkX3UzMih0b19vZl9ub2RlKGZ3bm9kZSksICJyaXNjdixncm91cC1pbmRleC1iaXRz
IiwKLQkJCQkgICZnbG9iYWwtPmdyb3VwX2luZGV4X2JpdHMpOwotCWlmIChyYykKLQkJZ2xvYmFs
LT5ncm91cF9pbmRleF9iaXRzID0gMDsKLQotCS8qCi0JICogRmluZCBmaXJzdCBiaXQgcG9zaXRp
b24gb2YgZ3JvdXAgaW5kZXguCi0JICogSWYgbm90IHNwZWNpZmllZCBhc3N1bWVkIHRoZSBkZWZh
dWx0IEFQTElDLUlNU0lDIGNvbmZpZ3VyYXRpb24uCi0JICovCi0JcmMgPSBvZl9wcm9wZXJ0eV9y
ZWFkX3UzMih0b19vZl9ub2RlKGZ3bm9kZSksICJyaXNjdixncm91cC1pbmRleC1zaGlmdCIsCi0J
CQkJICAmZ2xvYmFsLT5ncm91cF9pbmRleF9zaGlmdCk7Ci0JaWYgKHJjKQotCQlnbG9iYWwtPmdy
b3VwX2luZGV4X3NoaWZ0ID0gSU1TSUNfTU1JT19QQUdFX1NISUZUICogMjsKLQotCS8qIEZpbmQg
bnVtYmVyIG9mIGludGVycnVwdCBpZGVudGl0aWVzICovCi0JcmMgPSBvZl9wcm9wZXJ0eV9yZWFk
X3UzMih0b19vZl9ub2RlKGZ3bm9kZSksICJyaXNjdixudW0taWRzIiwKLQkJCQkgICZnbG9iYWwt
Pm5yX2lkcyk7Ci0JaWYgKHJjKSB7Ci0JCXByX2VycigiJXBmd1A6IG51bWJlciBvZiBpbnRlcnJ1
cHQgaWRlbnRpdGllcyBub3QgZm91bmRcbiIsIGZ3bm9kZSk7CiAJCXJldHVybiByYzsKLQl9Ci0K
LQkvKiBGaW5kIG51bWJlciBvZiBndWVzdCBpbnRlcnJ1cHQgaWRlbnRpdGllcyAqLwotCXJjID0g
b2ZfcHJvcGVydHlfcmVhZF91MzIodG9fb2Zfbm9kZShmd25vZGUpLCAicmlzY3YsbnVtLWd1ZXN0
LWlkcyIsCi0JCQkJICAmZ2xvYmFsLT5ucl9ndWVzdF9pZHMpOwotCWlmIChyYykKLQkJZ2xvYmFs
LT5ucl9ndWVzdF9pZHMgPSBnbG9iYWwtPm5yX2lkczsKIAogCS8qIFNhbml0eSBjaGVjayBndWVz
dCBpbmRleCBiaXRzICovCiAJaSA9IEJJVFNfUEVSX0xPTkcgLSBJTVNJQ19NTUlPX1BBR0VfU0hJ
RlQ7Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
