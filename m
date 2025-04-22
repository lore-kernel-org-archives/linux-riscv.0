Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B988AC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1t1UhPd0yrE6Y1LAqBLY7Jx0GlZSl5LXTmqRRlU6FQg=; b=wQfex8o0GpzNAz
	657aIRuH90SWZaVZzafoIqptyv6q7hZpK/em8+EnQuhSoibt83ayCy9HLOqyA8IIxo26EllBFW/+R
	QycVMEE/Ybv8E68NWX+vGHAGVVIiY8JoTAeIk6SQHY0t2L8tf/LD3ftasi9S6VjRKZyVZ7wJmk53G
	y00tI6ugve4F8wqn+qqD7ZzrSPUU1Owdtp8802lAWGQfOvbr4+kXt/Vrb0k6r2SKenRrUa3RNCU3p
	Ac0lWwRdhf0fMlLDQnE7W/DgxKTFuY9pSrtbtJbn+QYwOuik0PS4QsuRCZUZFxIYpqNy6AlnB3pwe
	vs0sgpHMgzeIc2Fs++og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jab-00000008LiE-3XLp;
	Tue, 22 Apr 2025 19:47:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GPn-00000007tVF-2aNr
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 16:24:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7399838db7fso43551b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339046; x=1745943846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCsItzx1CW8cAI7eK80VGXHXyDDk8PWaNf7CXRhWciY=;
        b=rzG3EdV+Jaz7zKIjdRfq5xMBJGUl2KH1bW0BZuik+K/OTizxlIoHgadduWAnQiODHb
         DKuAdwWS+Xf3MSEipudwAqhik1bW2k9MDtWBPxiM7aG4EpkhKwzx334mNrKXvaTIcred
         l5w1KcNfFzEOSRT0dferohRiHI+8hKRHWtgNPF1CkQfgOM6/Kp24bt+j/Eg4+TAvzEro
         pQ1RtlUjmSieiG5EGiqOQikDVYw4u8a8kd7xiWfKKGu0w/gh7SGhoiObBv7aNWthhtJc
         ctc4Oy6zdw7gJLTRAfk99F+sQksplX4LN3HAN9HSEcK2u5RmSUCtsMGjW3CWXKWS8+Lh
         RIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339046; x=1745943846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCsItzx1CW8cAI7eK80VGXHXyDDk8PWaNf7CXRhWciY=;
        b=RDlhFWY3/b9qjsHrBABeWJl+2Irr7WIdZ0AW9oAdGKhrlAakpcJxtO+gYA3Uh04Zq8
         qm1sU+W7NjhTl0zmOEUm50h7LMLG5Ddo3t58A63A/Zio+RJLlIB5l0xqeFrJqpFKo3Ii
         Lhl1CuUGOgXfcp7wN6pPftDRHsDzWMGGlmap0Tt+IwGeHOYI6gjiCa6r2a2ufbuDEobE
         zd8x3sBHOrRfQnJRjQv+ClJMopeRvrWULQg0NZV+gRU2kR9YVqLMz1lvsF5fyfW+hH4u
         J63m7/NcNocVRMvkm51+KhRPoQrikLVLGuQIVLKRfSOUaAQj8ZL7mTMpjRchg3PPjMDP
         N1gg==
X-Forwarded-Encrypted: i=1; AJvYcCWoBvmY93cFngCj7CzjeNNvyMdTwpU6s8kaBTXZjyw44ph+LxtXpEsZ7x4EXly/7mUHQZuWDRpauRcopw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6H5zk038IzYgIUaZuYS7CAA9jVN6obS0ycwCLZi5zp/YsKaHs
	In/2EWS5tACRoufctIIkDZzzaVIm3fm8n+ll2hYQWUGnEAYklzsoxUY0MeAKiPk=
X-Gm-Gg: ASbGncsW9Z9phxh8ZClXUKptpV9RJpRu0ImL3rN/nNVvHSI9o48uRMqspp3hGmUQGzg
	EJ2TdbYb3JZmPhfCofriVL4tOsYFUv/wNsfp2fgg78bf8L82LIhjzWx6bJaG8yJlZcjvXeKH+Fd
	bcYHUk2JRBOOFC/U9qQ70NRklmBFVF9AsL7hJsI0leXbUcurQkIu2u9aiUvvNthEbVym6jJliE3
	pW4aR3y69L3vnqxB9duu6qG/RfhWBpWAchownQMMNJBNGrsG6ZQKcu2rjrwVXulXOJQj3hKtodj
	yMmalb90QG2pyrz17XIdsBke4Ru/HP8N/A5LQhlmUYWNWT0VDjb8
X-Google-Smtp-Source: AGHT+IGpp8Vb3J0UHalvNL44o+7PVRW8uyjzoX0zSKYSZndRHv6HkVGApSau1aMm3e/cFnTOOl9eew==
X-Received: by 2002:a05:6a00:6c92:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-73dbe638b2bmr27078656b3a.12.1745339046287;
        Tue, 22 Apr 2025 09:24:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:24:05 -0700 (PDT)
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
Subject: [PATCH v2 2/5] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Tue, 22 Apr 2025 18:23:09 +0200
Message-ID: <20250422162324.956065-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162324.956065-1-cleger@rivosinc.com>
References: <20250422162324.956065-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_092407_653087_7DF0C7C9 
X-CRM114-Status: GOOD (  10.83  )
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

V2UgY2FuIHNhZmVseSByZWVuYWJsZSBJUlFzIGlmIGNvbWluZyBmcm9tIHVzZXJzcGFjZS4gVGhp
cyBhbGxvd3MgdG8KYWNjZXNzIHVzZXIgbWVtb3J5IHRoYXQgY291bGQgcG90ZW50aWFsbHkgdHJp
Z2dlciBhIHBhZ2UgZmF1bHQuCgpGaXhlczogYjY4NmVjZGVhY2Y2ICgicmlzY3Y6IG1pc2FsaWdu
ZWQ6IFJlc3RyaWN0IHVzZXIgYWNjZXNzIHRvIGtlcm5lbCBtZW1vcnkiKQpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyB8IDEyICsrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwppbmRleCBiMWQ5OTFjNzhhMjMuLjlj
ODM4NDg3OTdhNyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYworKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCkBAIC0yMjAsMTkgKzIyMCwyMyBAQCBzdGF0aWMgdm9p
ZCBkb190cmFwX21pc2FsaWduZWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGVudW0gbWlzYWxpZ25l
ZF9hY2Nlc3NfdHlwZQogewogCWlycWVudHJ5X3N0YXRlX3Qgc3RhdGU7CiAKLQlpZiAodXNlcl9t
b2RlKHJlZ3MpKQorCWlmICh1c2VyX21vZGUocmVncykpIHsKIAkJaXJxZW50cnlfZW50ZXJfZnJv
bV91c2VyX21vZGUocmVncyk7Ci0JZWxzZQorCQlsb2NhbF9pcnFfZW5hYmxlKCk7CisJfSBlbHNl
IHsKIAkJc3RhdGUgPSBpcnFlbnRyeV9ubWlfZW50ZXIocmVncyk7CisJfQogCiAJaWYgKG1pc2Fs
aWduZWRfaGFuZGxlclt0eXBlXS5oYW5kbGVyKHJlZ3MpKQogCQlkb190cmFwX2Vycm9yKHJlZ3Ms
IFNJR0JVUywgQlVTX0FEUkFMTiwgcmVncy0+ZXBjLAogCQkJICAgICAgbWlzYWxpZ25lZF9oYW5k
bGVyW3R5cGVdLnR5cGVfc3RyKTsKIAotCWlmICh1c2VyX21vZGUocmVncykpCisJaWYgKHVzZXJf
bW9kZShyZWdzKSkgeworCQlsb2NhbF9pcnFfZGlzYWJsZSgpOwogCQlpcnFlbnRyeV9leGl0X3Rv
X3VzZXJfbW9kZShyZWdzKTsKLQllbHNlCisJfSBlbHNlIHsKIAkJaXJxZW50cnlfbm1pX2V4aXQo
cmVncywgc3RhdGUpOworCX0KIH0KIAogYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rp
b24gdm9pZCBkb190cmFwX2xvYWRfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKLS0g
CjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
