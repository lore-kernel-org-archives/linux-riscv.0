Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA59BCA0EFE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 10:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UUf4rDbV9bT/DN97ndLU+x4NxjmEoyJrwFhzZpZ3AXY=; b=uMhmpTEf0P1S9F
	PzJaeAKk6vokkhHk4+WvPrT36lLmGsqGTMKdy/xf+X9pb6e7aiSpU+Ucyi6Whg/kkI1V/eGh88YUa
	K1BctA7PR5hgJAPS2Zc4vw3FSsk/2/seoUKzo1AwnQQAyQHcWZ6bCfjmm2yGVcahl/GME/JxeocNk
	kb+hWodrLrY+CNpDWRA6RzDVpC53uDXPIJGzfLkTWoYvf4VB9Y9e0+Y6yAZpVO7svolu3RBGJjf2j
	8x1tLMIAEEc6cGtR+2Ldf2MJzI1zCHl1OlPC+z3dVqUu7sgeob0qSl4kr02TpMmTAklz+uNN+zvCW
	nZymhC9A936LIImTVycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyRS-00000005gJr-0fQ1;
	Fri, 30 Aug 2024 10:01:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxK9-00000005Qwt-2f9T
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 08:50:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37182eee02dso990256f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2024 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725007779; x=1725612579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iGJL7OIFuIkfLAFkoMGwwROnKpnDuEMTd89ued1Cebg=;
        b=eVNN57aCs7tu+B8l27J1X0o1AdJLk2E4+tvbURXPCHoutSaUX5WCf+dRvNuEes1fDy
         3nywArDRHFMmPlzumu8sy3zoJLGZRiCfLb5VZe7esglI8Rmi4y2MUMetiWELXUlR5wZz
         NR0B8kL3hGgCb+aH5LUDsfEkgxVpKbAKiNIgqhrONmjlHtUoUqKuZMVfvLw2tMkBdPK6
         gsmMxtKkgBq8tTX/dAc46zSxa06mEeAzptJdlHJxZy2pG7ceU5F4UDiDDLzJnteU4DxS
         j2pkJzm43WRSQ2AtkytfvBgXXgmMEZ7rTTCS0/uDHFwJlZtgMQm+MbquLLqcHUBZjNSN
         z1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007779; x=1725612579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGJL7OIFuIkfLAFkoMGwwROnKpnDuEMTd89ued1Cebg=;
        b=cjEZ81detA20hXsrDVnUdsuMPdQzOlTwKDFIW4OzIu5L5PtKbKLOpk3bePemycMEqE
         0m9B6m/GNYGVWcW6XX0ubEat8eSE3bsGF3SERufySKp4JIIsndkAqfoisCK3r1ZFQOrf
         GI5QBDTDkzuINXgRC3+OsDnRwepW6cqophJ/GR6/V+Im1AycaGjHg6I1CBNFq9svyUyo
         vawz0/COBmlc93Ji7ZplGNnFHlgUnM0cRr7AKcsv91kHUNBbzFJyxWEqcJvOVef5/i9j
         I4QGohpfni/0UiwdB97ThYGkPoHoxRr/ZdUTK46Orc/MpKyKlS26jCu5htsKuAmgpncf
         FXhw==
X-Forwarded-Encrypted: i=1; AJvYcCUyKvZsJm6LvKW0DxG0czRt0Hg17D3uWlzQAAlo6izNQ4SBOkcqd8c8qIHtGAtrpq2SDKvIHXCE8BpnrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfhDmCaZGqkVI0Uf87Zc6kXOmCVy19gtID7hm5+uQNZnJwMGUP
	St6fvPA1j8gzzdqFvtNn7POyDVt7oy5QlzNafQWS1qSOsMLiynZco2O5yOI3rGE=
X-Google-Smtp-Source: AGHT+IE35PnHcXWnBWcAufXm2itAOGM3bjIxxoVO2EORI0hpbo/KkZo9FhT5TSGQ+S/KMoIRwGKHwg==
X-Received: by 2002:a05:6000:1e90:b0:36b:b174:5256 with SMTP id ffacd0b85a97d-3749c1a9d0bmr2933640f8f.6.1725007778972;
        Fri, 30 Aug 2024 01:49:38 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee73fa0sm3373144f8f.43.2024.08.30.01.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:49:38 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: remove useless pc check in stacktrace handling
Date: Fri, 30 Aug 2024 10:49:32 +0200
Message-ID: <20240830084934.3690037-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_014941_961438_D32CB7A4 
X-CRM114-Status: UNSURE (   9.85  )
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

Q2hlY2tpbmcgZm9yIHBjIHRvIGJlIGEga2VybmVsIHRleHQgYWRkcmVzcyBhdCB0aGlzIGxvY2F0
aW9uIGlzIHVzZWxlc3MKc2luY2UgcGMgPT0gaGFuZGxlX2V4Y2VwdGlvbi4gUmVtb3ZlIHRoaXMg
Y2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5j
b20+CgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2Uu
YwppbmRleCBjNmQ1ZGUyMjQ2M2YuLmY5MzRjNTczYzA4NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc3RhY2t0cmFjZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2Uu
YwpAQCAtNzIsNyArNzIsNyBAQCB2b2lkIG5vdHJhY2Ugd2Fsa19zdGFja2ZyYW1lKHN0cnVjdCB0
YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCiAJCQlwYyA9IGZ0cmFjZV9n
cmFwaF9yZXRfYWRkcihjdXJyZW50LCAmZ3JhcGhfaWR4LCBmcmFtZS0+cmEsCiAJCQkJCQkgICAm
ZnJhbWUtPnJhKTsKIAkJCWlmIChwYyA9PSAodW5zaWduZWQgbG9uZyloYW5kbGVfZXhjZXB0aW9u
KSB7Ci0JCQkJaWYgKHVubGlrZWx5KCFfX2tlcm5lbF90ZXh0X2FkZHJlc3MocGMpIHx8ICFmbihh
cmcsIHBjKSkpCisJCQkJaWYgKHVubGlrZWx5KCFmbihhcmcsIHBjKSkpCiAJCQkJCWJyZWFrOwog
CiAJCQkJcGMgPSAoKHN0cnVjdCBwdF9yZWdzICopc3ApLT5lcGM7Ci0tIAoyLjQ1LjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
