Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E50C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ecGX7B2QeijQgDX/ADJxjO4AXIeEtrdPn78p+2gerdI=; b=YTHSZP90TBRnbs
	nC3wVM7DweIriVa3Yc7YKvTWUz3pGji5+K9NedHyWbzjNK5n9C8paK3TI71j2pyxPRHN56w1+17jh
	+rk0gkb40Uj3rNnYUcfxTTbB1jgE7fF4bV6bfqPBwc6XtBeORWR9ZTW7eCM6vKrcwejAKYjL8FvXU
	++QCXm11PxL2AJjwxeKa6gnQV4Rr+s/aWSbQZ1s+wD/L9/49EN+SEh2mPuPrFLjll9b65cZKbk3rs
	uvIxxmTPO4rByFhRgKNks5HiwJLpFaprd0ComEnnO4m0FBsniqAPbBocxMI2GibY+63jGDgjlt+L2
	oavuZkxa/z2U0o/WQ8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLkz-0000000AGwh-1QPM;
	Fri, 25 Jul 2025 16:58:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLjB-0000000AGcL-3AOv
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:57:02 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b7766698eeso98780f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753462620; x=1754067420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVUDay0uTh9zSzuZqzWxGRuG4PrvulI7cJpPqBYzRSQ=;
        b=mkoz/KtXvshSUoNEWlbGaX6xzaoxAJ+Xs+qbNHJ78i8fpcf+2kQvQJUo7fw95Bab3z
         DGoAKjUpaPS8dv506md7YIG1PZ1vb1owLhBT67KoJe/0lsnlvuBrLGVpfEEsZS1Cdbue
         az6T7GZd51GiaCUY58W1G1KknS/jp9Sy1qvrKK2DR0FVppQg5+/tXK8Hc1RFuXk87762
         zZ/CIHT3HW9sLwf9TaDovfAxS85ujRDUcz9k453OAkh7615ljycSy47JCf3bKMZaaoX/
         Gh8WG9V+IhW9rWKUpAQ7sHD1S87HJ3VqDxJgyIYuyzXqwNsypdXHuvvV/b31n9U8n2yg
         yrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462620; x=1754067420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVUDay0uTh9zSzuZqzWxGRuG4PrvulI7cJpPqBYzRSQ=;
        b=CrsTMVQy2Wb1EluAZAGh74HBfj/NlEwaJFcftRPoMP30KiCZVEDctIH4X6PeZsrEYe
         +xc94YX5yMCEsTj5xzk4uy6tFz/LOe9hvZm2jIhnvtOlfoUbwpBcfFnb/l4tnW8XjfMl
         Hl+EtGUxIPuA4l6gVmhgdo8ghXKClGQNE1RfYV6L1WTVVi6sXMlYbfzA8U/Ya8JucsFc
         QWVJWiGEDp6m0YgsdscULlU02MZw+wNf2iDDwmTveIKBKT5Bj5ybCpAMVUMYHLE8zy7j
         cWeFjQA7lvyPKVNRy2gtRjTi9Pv8v8D1LajRyERfN4A6/U+59iR9E3FWEad/kU/j80lg
         iRYA==
X-Gm-Message-State: AOJu0YyaFR2k1xHZbqZ9DcSNoRzELJ57IheLiR4oCN+dbd8ILzfFMYFd
	rB0C+XJvUjHuYLwaMseerU8eDKqP/Agf+QGfZOZWtg/3Gt15PPaRHstJJ/9aconZA5sB9CJaBv5
	cmOi6
X-Gm-Gg: ASbGncshaRyLoBJF+9CRa+dzGe/S6hXJ/SMrXgqnu/YeQ3FiH0hJpUjiwMratoJ9SKs
	OyZ+WMyZt+71vfDHaX9w8zGJ4oDSWoMfsrh5FFNwKvzFhXNMeFWsA6sGge/3YPCijDW4xncCNgo
	AGYR3s9Z1vgcp5Uf9bTbqfm0QIov0mv9jg6/LkGRQL5LE3k7JaJGkZ0381UgRgACmgYd//2rm5e
	pBetpoHeBw5FwHYN/thD2WjlCbEdId30e59OwXos+PFz6PFhaAZK0ejzdFNAvaUFSFJRpijc87/
	rilAtikZjoQ6RqxFNIkINTS6QTFr81WosT7X6AEWrG+MywlKz85qRK8xkXInU56kvlrXt0lw4ID
	4gc5W/ymZXCgUq48mcjjFmKe3DYmoLA==
X-Google-Smtp-Source: AGHT+IG+sm9Xi5oMr3IceoYumTV1fBp9BB60EG/AQKP6WZ2A2EIRgkULY9UUCbn9Ae+S38jYGhjXtA==
X-Received: by 2002:a05:6000:420b:b0:3a3:6a3d:163a with SMTP id ffacd0b85a97d-3b77676359bmr880702f8f.12.1753462619680;
        Fri, 25 Jul 2025 09:56:59 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8c15:2281:5347:b367])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458705bcbb7sm61690015e9.18.2025.07.25.09.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:56:59 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v2 0/4] riscv: minor thread_info.cpu improvements
Date: Fri, 25 Jul 2025 18:54:08 +0200
Message-ID: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_095701_792127_D72E7A21 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgpJIG5vdGljZWQgdGhhdCB3ZSBnaXZlIHRocmVhZF9pbmZvLmNwdSB0d28gZGlmZmVy
ZW50IG5hbWVzIGluIHRoZQphc3NlbWJseSwgbG9hZCBpdCBhcyBhIHdpZGVyIHR5cGUsIGFuZCBz
dG9yZSBpdCBzdWJvcHRpbWFsbHkuCgp2MiBpcyBzcGxpdCBmb3IgZWFzeSBiYWNrcG9ydGluZy4K
ClRoYW5rcy4KCnYyOgoqIHRyYW5zZm9ybSBbdjEgMi8zXSBpbnRvIFt2MiAxLTIvNF0gdG8gc2lt
cGxpZnkgYmFja3BvcnRzIFtBbGV4XQoqIHRlc3RlZCBhbmQgcmV2aWV3ZWQgYnkgQWxleAp2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDcyMjE2MDU1Ni4yMjE2OTI1LTItcmty
Y21hckB2ZW50YW5hbWljcm8uY29tLwoKUmFkaW0gS3LEjW3DocWZICg0KToKICByaXNjdjogdXNl
IGx3IHdoZW4gcmVhZGluZyBpbnQgY3B1IGluIG5ld192bWFsbG9jX2NoZWNrCiAgcmlzY3Y6IHVz
ZSBsdyB3aGVuIHJlYWRpbmcgaW50IGNwdSBpbiBhc21fcGVyX2NwdQogIHJpc2N2OiB1c2UgVEFT
S19USV9DUFUgaW5zdGVhZCBvZiBUQVNLX1RJX0NQVV9OVU0KICByaXNjdjogcGFjayBydjY0IHRo
cmVhZF9pbmZvIGJldHRlcgoKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggICAgICAgICB8
IDIgKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaCB8IDIgKy0KIGFyY2gv
cmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgICAgICB8IDEgLQogYXJjaC9yaXNjdi9rZXJuZWwv
ZW50cnkuUyAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgotLSAKMi41MC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
