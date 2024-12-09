Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96775E7717D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LiKgV1wOeWsrmvP9WbszKOOPwP/h5XEdIkZzfRjySYg=; b=Y8n+e9Sd/rS0GX
	7d9aQlLL/lxyl3adbo/rflBw8mylVE8NW5KnPo5Q6Eu1Seu2h1SaOGFiqAm6zRdyWTdXwnIl0pQ6i
	1tul9rqPW++pf0dQg4oU7Ruzc9h/0aGn2F6N3GFVNeR8+Cd6FQ/QaSxlCAo4IcQxHR9qDdHGFpFtT
	NxYQY19AqtsKzkkAjkXewvTaIoxa+jWeDP/4ZEAXTe9w1wtZzmQbRMR82Rn4NrCVXapY3CYmhaZ7C
	vK0rcwK4qKY+LQiCrGIX+Ag1Yl1EnHhaoq8IenGUxU+L04YJc0qYbdbh91xn91zUWg76nupVSaNKJ
	RQ4KeoL0hzHzFNo/EJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKg8q-00000008SW1-2nCY;
	Mon, 09 Dec 2024 15:57:48 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKg8m-00000008SUl-413x
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 15:57:46 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-724d23df764so4217037b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 07:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733759864; x=1734364664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJgfJRwWboyVVdp2yBixPX3pFCmRzBh4c7ZZuQR90II=;
        b=MJwcYJ6ciywF2nnGnBKXwpTfqpNlH1vfoKG5za0n/WNuyFfmCEIA9e0sZtnvxfV1LN
         n2zWU+GR9i+kBgdNmpcFAw5CB9s9JnP/j6+yqRvqRi6E6kdTtpo5OpI9IGLK5AR2D08Q
         ktNG+Nm+wCRMZqE9VX+T1GnB2ZLAHdrMYkYUwA0Sv7ClCBYgNeSoA/UrHfMRAJ4kcyUM
         lr+J4wy+z9CyxmUOqYikp/ytws9cQWjPV1dLRof6i/s40AtXqUtIL7EZJTV8bLx6oofQ
         sorI30VFoqWonsITQ1/bwG9LLuSOfXjIqcXJ8Y9QHBvL+dsHvmbh+MnCyuKHrCzgQgtq
         hOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733759864; x=1734364664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJgfJRwWboyVVdp2yBixPX3pFCmRzBh4c7ZZuQR90II=;
        b=hMhmE852MXP51sOksDXWfTxyfqQSTHlAM/Is4LZxzwzumNCw7XTY327gHg/QeJH9Oe
         B0QJWPXr/aF1Y2EG0VxH+hma6P92rTN5bnlt92uVYHFhLYp47uBFhMaYknSCyBdZTO1S
         GrB4DoC3KQR1BYgyCDyUsaokl+B2qtA+QhSE3fDKu1VeL95/XSPYn5CKeaHcCtKFgvg9
         xuG+dtT/lKT22LxHxkoo/lUtPU7BXkfzQ1L54xV2NvZ7eT8eDTLuC4PRqOfAq3cLZqNu
         swiiou1wkXZMwU1f+KYm+27wt947Rbl7QGIvib8uKScWSNbH4nws7CLMMfWcGLzJkcMO
         rSkw==
X-Forwarded-Encrypted: i=1; AJvYcCVMyGj297cioSEUYmu5HB2xJXmY0HG3yRXUrw0w+XLgXFWSCheJK9USwupMRU2m9UBRce/3QflFOc7yrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc0a/UbUAIN1SI53LCLB6RES8iK56/nrSk+sB5Cwc7e7G3Ixok
	VjABMSVl2znOOv0r+bsC9CFl/TypSxZdfFbKdAWME+Bp98os7YxQ9ppMBiWgU+o=
X-Gm-Gg: ASbGnct9kASXxlXKZpjZrVYoEuinO92Mveg6PCugyOzv6TjNsqIGp8p4ACimOGUReA7
	5rzDz/pwlUynjnlWnfFjfp/da9NKqw5o8EDc63LMkolblR3+CQhd8OtvCQfWUEVRtCfkAV2Uvah
	seaCI+F0oeDtt7TmKLUGs7/Zb8n+6WFFpTQ1JFm9FfswTkjEeITfZrfIwEXSmawf82AlHaGTh54
	R/aW+My4IpIb0glQvYOqWKqehbGmv9u6Qz3zTgCBhc0ZNmi5PU=
X-Google-Smtp-Source: AGHT+IF3SUxS6Oqh6v3V6CqksS4a3Vo4POx1ea0PFAbtVS5ly1340Tat37ZVq9GoRLgSr76MMFbbzQ==
X-Received: by 2002:a05:6a00:9289:b0:725:e499:5b8b with SMTP id d2e1a72fcca58-725e4995cc6mr7699800b3a.17.1733759863799;
        Mon, 09 Dec 2024 07:57:43 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d16e7132sm4295833b3a.152.2024.12.09.07.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 07:57:43 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anton Blanchard <antonb@tenstorrent.com>
Subject: [PATCH] riscv: stacktrace: fix backtracing through exceptions
Date: Mon,  9 Dec 2024 16:57:12 +0100
Message-ID: <20241209155714.1239665-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_075745_257113_89084D7C 
X-CRM114-Status: GOOD (  10.95  )
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

UHJpb3IgdG8gY29tbWl0IDVkNWZjMzNjZTU4ZSAoInJpc2N2OiBJbXByb3ZlIGV4Y2VwdGlvbiBh
bmQgc3lzdGVtIGNhbGwKbGF0ZW5jeSIpLCBiYWNrdHJhY2UgdGhyb3VnaCBleGNlcHRpb24gd29y
a2VkIHNpbmNlIHJhIHdhcyBmaWxsZWQgd2l0aApyZXRfZnJvbV9leGNlcHRpb24gc3ltYm9sIGFk
ZHJlc3MgYW5kIHRoZSBzdGFja3RyYWNlIGNvZGUgY2hlY2tlZCAncGMnIHRvCmJlIGVxdWFsIHRv
IHRoYXQgc3ltYm9sLiBOb3cgdGhhdCBoYW5kbGVfZXhjZXB0aW9uIHVzZXMgcmVndWxhciAnY2Fs
bCcKaW5zdHJ1Y3Rpb25zLCB0aGlzIGlzbid0IHdvcmtpbmcgYW55bW9yZSBhbmQgYmFja3RyYWNl
IHN0b3BzIGF0CmhhbmRsZV9leGNlcHRpb24oKS4gU2luY2UgdGhlcmUgYXJlIG11bHRpcGxlIGNh
bGwgc2l0ZSB0byBDIGNvZGUgaW4gdGhlCmV4Y2VwdGlvbiBoYW5kbGluZyBwYXRoLCByYXRoZXIg
dGhhbiBjaGVja2luZyBtdWx0aXBsZSBwb3RlbnRpYWwgcmV0dXJuCmFkZHJlc3NlcywgYWRkIGEg
bmV3IHN5bWJvbCBhdCB0aGUgZW5kIG9mIGV4Y2VwdGlvbiBoYW5kbGluZyBhbmQgY2hlY2sgcGMK
dG8gYmUgaW4gdGhhdCByYW5nZS4KCkZpeGVzOiA1ZDVmYzMzY2U1OGUgKCJyaXNjdjogSW1wcm92
ZSBleGNlcHRpb24gYW5kIHN5c3RlbSBjYWxsIGxhdGVuY3kiKQpTaWduZWQtb2ZmLWJ5OiBDbMOp
bWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgotLS0KIGFyY2gvcmlzY3Yva2VybmVs
L2VudHJ5LlMgICAgICB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIHwgNCAr
KystCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9l
bnRyeS5TCmluZGV4IDIxNjU4MTgzNWViMC4uMzNhNWE5ZjJhMGQ0IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9lbnRyeS5TCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKQEAg
LTI3OCw2ICsyNzgsNyBAQCBTWU1fQ09ERV9TVEFSVF9OT0FMSUdOKHJldF9mcm9tX2V4Y2VwdGlv
bikKICNlbHNlCiAJc3JldAogI2VuZGlmCitTWU1fSU5ORVJfTEFCRUwocmV0X2Zyb21fZXhjZXB0
aW9uX2VuZCwgU1lNX0xfR0xPQkFMKQogU1lNX0NPREVfRU5EKHJldF9mcm9tX2V4Y2VwdGlvbikK
IEFTTV9OT0tQUk9CRShyZXRfZnJvbV9leGNlcHRpb24pCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3N0YWNrdHJhY2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwpp
bmRleCAxNTNhMmRiNGM1ZmEuLmQ0MzU1Yzc3MGMzNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc3RhY2t0cmFjZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwpA
QCAtMTcsNiArMTcsNyBAQAogI2lmZGVmIENPTkZJR19GUkFNRV9QT0lOVEVSCiAKIGV4dGVybiBh
c21saW5rYWdlIHZvaWQgaGFuZGxlX2V4Y2VwdGlvbih2b2lkKTsKK2V4dGVybiB1bnNpZ25lZCBs
b25nIHJldF9mcm9tX2V4Y2VwdGlvbl9lbmQ7CiAKIHN0YXRpYyBpbmxpbmUgaW50IGZwX2lzX3Zh
bGlkKHVuc2lnbmVkIGxvbmcgZnAsIHVuc2lnbmVkIGxvbmcgc3ApCiB7CkBAIC03MSw3ICs3Miw4
IEBAIHZvaWQgbm90cmFjZSB3YWxrX3N0YWNrZnJhbWUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNr
LCBzdHJ1Y3QgcHRfcmVncyAqcmVncywKIAkJCWZwID0gZnJhbWUtPmZwOwogCQkJcGMgPSBmdHJh
Y2VfZ3JhcGhfcmV0X2FkZHIoY3VycmVudCwgJmdyYXBoX2lkeCwgZnJhbWUtPnJhLAogCQkJCQkJ
ICAgJmZyYW1lLT5yYSk7Ci0JCQlpZiAocGMgPT0gKHVuc2lnbmVkIGxvbmcpaGFuZGxlX2V4Y2Vw
dGlvbikgeworCQkJaWYgKHBjID49ICh1bnNpZ25lZCBsb25nKWhhbmRsZV9leGNlcHRpb24gJiYK
KwkJCSAgICBwYyA8ICh1bnNpZ25lZCBsb25nKSZyZXRfZnJvbV9leGNlcHRpb25fZW5kKSB7CiAJ
CQkJaWYgKHVubGlrZWx5KCFfX2tlcm5lbF90ZXh0X2FkZHJlc3MocGMpIHx8ICFmbihhcmcsIHBj
KSkpCiAJCQkJCWJyZWFrOwogCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
