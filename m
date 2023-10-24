Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E30AC25B48
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wT9Mc/bhbDUSq7hmzKza4T0vYe+1CgrAlfVHUlWe9Pw=; b=m/g+Ahl3vuS8dg
	qSteoJ075x49kR1c7ZZkk3NHVXBNKqvNkMeMmvMbfwB8/5RlcGrbmmJ27h8VS6zLM1johdhF3KCNy
	Nt3PRMyIJ1VpU1NzIcWFDCU10NS/McoaM4tBzJ/Pg+Epdok30r4W0QQGaR4UJo31Xv9bv5XjFoqWL
	NSNlHcIPXsHV7TlQcNxDF3V9zVh4VH6ruzezM3JgO6V/3rvMDzRx/rdIVVokRLvWGu/Alj5pXTlZd
	OsGohwHJxfNbpA9A+kBMmX5XMRYdjgn6WsUYXJbuY0EKiouGYmJ2wns2zkDTrT6Lx79LrcUg9h0Pe
	tc4Ce8kIwROTALdepsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHRx-009wpd-25;
	Tue, 24 Oct 2023 13:28:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHRs-009wkk-1r
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 13:27:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32da4180ca2so924277f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 06:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698154074; x=1698758874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzJW8mbLnPSn6J2V5LPD0tHMd0DjHcRVmnBobw7QLdA=;
        b=LsEDaW3pRUJBFK/JiHwNNP/iJhTBkQXGMFUi0uuFHgYrvc2SOi/tmeXDkbem7yfB2G
         aFt3KHXxJPotNxbB3Nz12wcC0O4zrm4DbSfz4SeDKygDR0KJDU0btkJc4KK8HKHylHKJ
         HpFmdyanPqNiCMOEPE1zgAZRW43fHqO/xjfxQKlw63CWf0D0ZXiAX27Qi3soYsOELxlQ
         ABmLT8PbWdY4O1UyfnEdSRYaG1ewhqjsTsEOY7XRPg56nUZTeoB4mcPqXXcgjYQuqOXT
         CM81AWk7OX9xH2Nad4iAnh2FyLHLuoJRqEYTMSmGDSNWJQShcgk+vjNkanA8fy84MTox
         TU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698154074; x=1698758874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzJW8mbLnPSn6J2V5LPD0tHMd0DjHcRVmnBobw7QLdA=;
        b=K1BKHxowFRahEnoRlSNPBPTwLlJBlZXbONkKVP3LZllpGqbfqOHsvxSe9dBqEnF8/u
         7qIFa0WLvBX6mVyZvTrCnz5yTAcx5CJiU9XVLGrd5B99WVr/AF87fZfGs7ZNFmnE4GHa
         f2NycfGlbVYDD9Fm4KUqseMGv92gL/coltwf/jgQM+3C0o1OHWHlLdbHjhsrhkv2UOFy
         AtrlkqXgv8/EbOT0CZCNR1edrntZg9resFEFo3EimYFBv7UGNmM8W6OGkvr7Ovk72HgG
         gRuk4O9L4jg6wARMph3uJpgnoSi/F8tzHfJDC5Q9IbSg1UiwyubcsPryyGue5cAYeVJi
         YAJA==
X-Gm-Message-State: AOJu0YzxcrtlFFK9qg0ZDIfsHBdG1ju+pPHewwU8oNXUkx3vGnTGAD5t
	Mp2rLhJIixm7sAHC+zkAYFLKvg==
X-Google-Smtp-Source: AGHT+IERNbVtk7/d9BXKHcuFefqmMm7PIZc2yEvA/OiXxfNb0j+FczZRM6x6rXgzSE6bj8c3/9Em7g==
X-Received: by 2002:adf:a455:0:b0:32d:d8ed:d6e0 with SMTP id e21-20020adfa455000000b0032dd8edd6e0mr7575871wra.0.1698154074488;
        Tue, 24 Oct 2023 06:27:54 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:597d:e2c5:6741:bac9])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d4151000000b0032d87b13240sm10034964wrq.73.2023.10.24.06.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 06:27:53 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 3/5] riscv: kernel: Use correct SYM_DATA_*() macro for data
Date: Tue, 24 Oct 2023 15:26:53 +0200
Message-ID: <20231024132655.730417-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024132655.730417-1-cleger@rivosinc.com>
References: <20231024132655.730417-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_062756_625195_D581EFC1 
X-CRM114-Status: UNSURE (   8.64  )
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

U29tZSBkYXRhIHdlcmUgaW5jb3JyZWN0bHkgYW5ub3RhdGVkIHdpdGggU1lNX0ZVTkNfKigpIGlu
c3RlYWQgb2YKU1lNX0RBVEFfKigpIG9uZXMuIFVzZSB0aGUgY29ycmVjdCBvbmVzLgoKU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1i
eTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TIHwgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50
cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKaW5kZXggNjRhYzBkZDYxNzZiLi5hN2Fh
MmZkNTk5ZDYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvZW50cnkuUwpAQCAtMzI0LDcgKzMyNCw3IEBAIFNZTV9GVU5DX0VORChf
X3N3aXRjaF90bykKIAkuc2VjdGlvbiAiLnJvZGF0YSIKIAkuYWxpZ24gTEdSRUcKIAkvKiBFeGNl
cHRpb24gdmVjdG9yIHRhYmxlICovCi1TWU1fQ09ERV9TVEFSVChleGNwX3ZlY3RfdGFibGUpCitT
WU1fREFUQV9TVEFSVF9MT0NBTChleGNwX3ZlY3RfdGFibGUpCiAJUklTQ1ZfUFRSIGRvX3RyYXBf
aW5zbl9taXNhbGlnbmVkCiAJQUxUX0lOU05fRkFVTFQoUklTQ1ZfUFRSIGRvX3RyYXBfaW5zbl9m
YXVsdCkKIAlSSVNDVl9QVFIgZG9fdHJhcF9pbnNuX2lsbGVnYWwKQEAgLTM0MiwxMiArMzQyLDEx
IEBAIFNZTV9DT0RFX1NUQVJUKGV4Y3BfdmVjdF90YWJsZSkKIAlSSVNDVl9QVFIgZG9fcGFnZV9m
YXVsdCAgIC8qIGxvYWQgcGFnZSBmYXVsdCAqLwogCVJJU0NWX1BUUiBkb190cmFwX3Vua25vd24K
IAlSSVNDVl9QVFIgZG9fcGFnZV9mYXVsdCAgIC8qIHN0b3JlIHBhZ2UgZmF1bHQgKi8KLWV4Y3Bf
dmVjdF90YWJsZV9lbmQ6Ci1TWU1fQ09ERV9FTkQoZXhjcF92ZWN0X3RhYmxlKQorU1lNX0RBVEFf
RU5EX0xBQkVMKGV4Y3BfdmVjdF90YWJsZSwgU1lNX0xfTE9DQUwsIGV4Y3BfdmVjdF90YWJsZV9l
bmQpCiAKICNpZm5kZWYgQ09ORklHX01NVQotU1lNX0NPREVfU1RBUlQoX191c2VyX3J0X3NpZ3Jl
dHVybikKK1NZTV9EQVRBX1NUQVJUKF9fdXNlcl9ydF9zaWdyZXR1cm4pCiAJbGkgYTcsIF9fTlJf
cnRfc2lncmV0dXJuCiAJZWNhbGwKLVNZTV9DT0RFX0VORChfX3VzZXJfcnRfc2lncmV0dXJuKQor
U1lNX0RBVEFfRU5EKF9fdXNlcl9ydF9zaWdyZXR1cm4pCiAjZW5kaWYKLS0gCjIuNDIuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
