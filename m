Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF888C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 14:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JalMUb5qgrwjmPm8fctrcn2GAPeReJmv90Sgydr0GZw=; b=oRzYODY5ojDi8g
	zYlE3gohggsIX3m/HbBheivvd+TkJAYMDjKX1y3JP1BspNJsNrZscR+m8hK6q6Ux43Bj6ietwxRw3
	fMJG9IH9U1WQLISOMI+WSLCGEUictWm2fwQuYu4lKtb6CexXS/dFsdYOXpNevl04jg6vCdaIjguiK
	EQqXq4IwPAceS/8daRKSMNu57Z4mjs7QxlWmJglthXefllXVExz65BaJwpmm0+ghb0qIHizc2vls8
	SnWsdpb8rNBOCKIQiLARbdh4915tBPhIdg1dybiX/OPOKvpIzI3ln1Qpn3s0oh6q0r/P0HCuf9Lbx
	tH6puBzFSkeM/hODeejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMq3M-0000000AdWY-0IIW;
	Thu, 27 Jun 2024 14:24:48 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMq2y-0000000AdQp-18cv
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 14:24:39 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-7067108f2cdso4305870b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 07:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719498262; x=1720103062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/eLI45W/ooqVC/MA9zQHUWk1MIJ0qMRX6RqXTFEWV8=;
        b=Jk8GNP0SLF1EOejaMP+bRcipt6jExvMLpO4CNmiGTW/a7GUlp9Me6yrf1BkxjSWWAk
         ya5MhwVd0ftE9zwgC+J6F63C2e+LlBOYGfNtM1bYZzdmdRgeyOFAmBF2oLDv69IgMJgx
         KBqTtyiQI2qzuNKg8CtkFFc9Kx6i0kQL/8hQJTbfqWof1f6feVsBLgrOXyDTMv1kQ04W
         GmyvSRGXpB4ycpjp70TrX+3pBdMc8asmzlKHqFgK6Lkr6Thp+r9r69zeS11u18nSdvuj
         vJv0zBwJXvRvJZavRmMQwtWhPQKDL4i+JmtyphwUH2bo1ItjU8Cm/YR6qdfJWqt+xCkZ
         K7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719498262; x=1720103062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/eLI45W/ooqVC/MA9zQHUWk1MIJ0qMRX6RqXTFEWV8=;
        b=CVyvuURodPZiBz5AQxOcSLqqwGW8JVHQYAy22tzeI33db8WYPVY8IcHglEWstU45Ls
         w7JuJHccAdAFVDZ3pvpSVuD+BWeGEnoJs0m3m6WxVS16mC8yxewn1qoiqsaxs+mnaYMA
         pO2ycJTzXGdjTslebajgiy4qZaB2e0qEYt4rGgg0hv0hSxG6JThxVSbfF7Jy8z8TBZ5h
         rcM4x8XlStwv2axWXgQFUxn+SpVybViZQfTQzx+/g+gpeUASZwLMHcvCrzBLfWwuxwE8
         pZrncuusbXLosQmXzk8oJozdi2222qpboCzHAvPpLQZ0UI3/bvHHbtxcrSirVQBVR/dH
         KEOw==
X-Gm-Message-State: AOJu0Yy7XSR4lOj5DlN+EPWz5ldwgzE7T9tdsWkT2MXdpOgzjHzvDBsu
	qpyuNRez5ouW9L7hVGJ4atsUYoAz2fvZL6vih+a3pdoQWxWVejZnJyiOn7M+y4g=
X-Google-Smtp-Source: AGHT+IFaXa2jgWVK9qwyyMjsUe+VJC/FCmmJqXZaBPd98yzohBR8g9ipU8NKxlQpPhyhZJZYUcyh6Q==
X-Received: by 2002:a62:b609:0:b0:706:4889:960d with SMTP id d2e1a72fcca58-70670ee7812mr13853487b3a.16.1719498262365;
        Thu, 27 Jun 2024 07:24:22 -0700 (PDT)
Received: from localhost ([212.107.28.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706b48d0cc0sm1403803b3a.28.2024.06.27.07.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:24:21 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: linux-riscv@lists.infradead.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: linux-kernel@vger.kernel.org,
	"Dmitry V . Levin" <ldv@strace.io>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Celeste Liu <CoelacanthusHex@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] riscv: entry: always initialize regs->a0 to -ENOSYS
Date: Thu, 27 Jun 2024 22:23:39 +0800
Message-ID: <20240627142338.5114-2-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313; i=CoelacanthusHex@gmail.com; h=from:subject; bh=Q2jff5QT5dahZ0NplzuKdapGzNO6RH+dDW7S1GCf5v4=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMabWlrwIU5LWUEn9rPF/0ydqKUdQyc8m/pJOixUUZJ 13/7OoyCesoZWEQ42KQFVNkEdv59PWy0kcflvGazICZw8oEMoSBi1MAJlLxmeGvREWem4374e3C c6fzxbfX3P67q/yrnX/Nzpn1sZNtBZb0MvzhrGy8bzLFos5JPNT+mve8nBXcHib3J30+45vrduH V0jYeAI3ZS6k=
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_072434_042698_16F6D0D9 
X-CRM114-Status: GOOD (  13.57  )
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

T3RoZXJ3aXNlIHdoZW4gdGhlIHRyYWNlciBjaGFuZ2VzIHN5c2NhbGwgbnVtYmVyIHRvIC0xLCB0
aGUga2VybmVsIGZhaWxzCnRvIGluaXRpYWxpemUgYTAgd2l0aCAtRU5PU1lTIGFuZCBzdWJzZXF1
ZW50bHkgZmFpbHMgdG8gcmV0dXJuIHRoZSBlcnJvcgpjb2RlIG9mIHRoZSBmYWlsZWQgc3lzY2Fs
bCB0byB1c2Vyc3BhY2UuIEZvciBleGFtcGxlLCBpdCB3aWxsIGJyZWFrCnN0cmFjZSBzeXNjYWxs
IHRhbXBlcmluZy4KCkZpeGVzOiA1MjQ0OWMxN2JkZDEgKCJyaXNjdjogZW50cnk6IHNldCBhMCA9
IC1FTk9TWVMgb25seSB3aGVuIHN5c2NhbGwgIT0gLTEiKQpSZXBvcnRlZC1ieTogIkRtaXRyeSBW
LiBMZXZpbiIgPGxkdkBzdHJhY2UuaW8+ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6
IENlbGVzdGUgTGl1IDxDb2VsYWNhbnRodXNIZXhAZ21haWwuY29tPgotLS0KIGFyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKaW5kZXggMDVhMTZiMWYwYWVlLi41MWViZmQyM2Uw
MDcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHMuYwpAQCAtMzE5LDYgKzMxOSw3IEBAIHZvaWQgZG9fdHJhcF9lY2FsbF91
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJCXJlZ3MtPmVwYyArPSA0OwogCQlyZWdzLT5vcmln
X2EwID0gcmVncy0+YTA7CisJCXJlZ3MtPmEwID0gLUVOT1NZUzsKIAogCQlyaXNjdl92X3ZzdGF0
ZV9kaXNjYXJkKHJlZ3MpOwogCkBAIC0zMjgsOCArMzI5LDcgQEAgdm9pZCBkb190cmFwX2VjYWxs
X3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIAkJaWYgKHN5c2NhbGwgPj0gMCAmJiBzeXNjYWxs
IDwgTlJfc3lzY2FsbHMpCiAJCQlzeXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7Ci0JCWVs
c2UgaWYgKHN5c2NhbGwgIT0gLTEpCi0JCQlyZWdzLT5hMCA9IC1FTk9TWVM7CisKIAkJLyoKIAkJ
ICogVWx0aW1hdGVseSwgdGhpcyB2YWx1ZSB3aWxsIGdldCBsaW1pdGVkIGJ5IEtTVEFDS19PRkZT
RVRfTUFYKCksCiAJCSAqIHNvIHRoZSBtYXhpbXVtIHN0YWNrIG9mZnNldCBpcyAxayBieXRlcyAo
MTAgYml0cykuCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
