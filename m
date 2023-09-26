Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EAEE7E64A
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYLtIeuiH42wCor5c53kSh6lxL/h5oG93fo4FAsXC8E=; b=dOzcfwgqATJJzc
	TJYKYJ5hmmWE7WoYpDLTzaas9XY1XXqhyKEyah8Qyw9trbGZV4rDlohhOFrnMPqwsETXzzn/ufhu9
	C6/X9DGCvCPQ/OcmxBv90/quOcEPDmGJEIkLY92vH4XF9GzzBj4eZfW8GaCKf5ZwmCs6TTEI8vQJN
	4l4q7oPJMgXDT5ORjYa9r/umWPHcn5/hDAZ1kiZcQeI7qMqa2HsuPMDKCSH4vgw8g5w1MkJ3eVADf
	Zg05vHOl815RD5pcNqiRW1fXOiErSLEZngZUSgZtKQ/yrx7CsUc43SejYDNRE9NRJhm7axLDHG5CY
	Ai8BsZZSNGhk29LtZDjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9be-00GbQo-0B;
	Tue, 26 Sep 2023 15:04:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bW-00GbL0-07
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 15:04:03 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3200b181b67so1192109f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695740636; x=1696345436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Plk1Hu+6o5eXVj2RFLi33sYNLLeCeOc6UN77fu78+Xg=;
        b=IYpJQPytXh6VY5MjdQ7+NjHg/H5fq7R1L568UmsjHNRV3SpXdH3A17mEOnh3Wzlap0
         yCPCvfrJtrI4cu557cOWD6SA4i/K1llP7/2O2L61eE9oHYci3PPHiqevr03C5wcyQRbW
         KkKGal3Sg4NrdH1O0mDBarS2hU997LbCmaZrIM+Of9mJfE6SNkP+9ltZo2ytNSt3P+EN
         1hZhbzDFVNLT9f/5WGrkpqO3hmKq4d0frGN2pyZ8FoNZ8ss14sDg/UuzEdUnC4aj1hEZ
         1roxt9r6sbki/b8CJmIWkXCiTVqRF898qalqHBWtTOkeeQ65c9IRtpic930Yar+kFCq2
         YwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740636; x=1696345436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Plk1Hu+6o5eXVj2RFLi33sYNLLeCeOc6UN77fu78+Xg=;
        b=KYrB9VHokWRMJtNFFy6xPJvw6WcjDeboW+xhm1RhanDW0F5rJq97io8YYd/TcA+BWF
         ZJxnbIYJkFnlah201+8LsRQvpy8Tx6Kke8dNBs0g5wRn8FbTBZ01vLXjk5qZJQcELpgS
         lsuFOg796XLYJA4mD9snrvSSd5DfOfybcSdzceq2Mhen84FIx10xrQCwRgCNM8D5ix34
         p0ty/D5gVbMSNJuhYyzLnKWzJslNMDCntHyKUrcMwzvDl8iRpChXuSau4UDkHnJRruDT
         ob/Js4P10qBz2VEG+pzpVfrtu839xmIBBVm9kulsDVaIjB+MJBca1L8T16Osn2uBc32p
         b4WA==
X-Gm-Message-State: AOJu0Ywqw65HgVf2zzE1Xz1hTH//Ztl8UGW9gfDCGcMCpnWCV8hvf9Tv
	n3MmzRYvaF5sHtte8adOfblu+fXpPueDiJlebQnOVA==
X-Google-Smtp-Source: AGHT+IGiGLM2tQNC0LHIOSMpA2Dcs0WL1ooiBKmdZNYUbPFyZ9WG+S8DbiY2Rr8TxTzPGCIQ87LWlQ==
X-Received: by 2002:adf:f3d0:0:b0:31a:e772:ddf9 with SMTP id g16-20020adff3d0000000b0031ae772ddf9mr8993186wrp.4.1695740636702;
        Tue, 26 Sep 2023 08:03:56 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2b3d:6c70:9dbf:5ede])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d650b000000b00318147fd2d3sm14926060wru.41.2023.09.26.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 08:03:56 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Topel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>
Subject: [PATCH 5/7] riscv: add support for sysctl unaligned_enabled control
Date: Tue, 26 Sep 2023 17:03:14 +0200
Message-Id: <20230926150316.1129648-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926150316.1129648-1-cleger@rivosinc.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_080402_075523_6D2646BF 
X-CRM114-Status: GOOD (  10.35  )
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

VGhpcyBzeXNjdGwgdHVuaW5nIG9wdGlvbiBhbGxvd3MgdGhlIHVzZXIgdG8gZGlzYWJsZSBtaXNh
bGlnbmVkIGFjY2VzcwpoYW5kbGluZyBnbG9iYWxseSBvbiB0aGUgc3lzdGVtLiBUaGlzIHdpbGwg
YWxzbyBiZSB1c2VkIGJ5IG1pc2FsaWduZWQKZGV0ZWN0aW9uIGNvZGUgdG8gdGVtcG9yYXJpbHkg
ZGlzYWJsZSBtaXNhbGlnbmVkIGFjY2VzcyBoYW5kbGluZy4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L0tjb25maWcg
ICAgICAgICAgICAgICAgICAgfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWdu
ZWQuYyB8IDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXgg
ZDYwN2FiMGY3YzZkLi4zNTE1NTEwZmU0MTggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZp
ZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTE1Nyw2ICsxNTcsNyBAQCBjb25maWcgUklT
Q1YKIAlzZWxlY3QgUklTQ1ZfVElNRVIgaWYgUklTQ1ZfU0JJCiAJc2VsZWN0IFNJRklWRV9QTElD
CiAJc2VsZWN0IFNQQVJTRV9JUlEKKwlzZWxlY3QgU1lTQ1RMX0FSQ0hfVU5BTElHTl9BTExPVwog
CXNlbGVjdCBTWVNDVExfRVhDRVBUSU9OX1RSQUNFCiAJc2VsZWN0IFRIUkVBRF9JTkZPX0lOX1RB
U0sKIAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCmluZGV4IDA0MWZkMmRiZDk1NS4uYjVmYjFmZjA3OGUzIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC0zOTYsNiArMzk2LDkgQEAgdW5pb24gcmVnX2RhdGEg
ewogCXU2NCBkYXRhX3U2NDsKIH07CiAKKy8qIHN5c2N0bCBob29rcyAqLworaW50IHVuYWxpZ25l
ZF9lbmFibGVkIF9fcmVhZF9tb3N0bHkgPSAxOwkvKiBFbmFibGVkIGJ5IGRlZmF1bHQgKi8KKwog
aW50IGhhbmRsZV9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7CiAJdW5p
b24gcmVnX2RhdGEgdmFsOwpAQCAtNDA2LDYgKzQwOSw5IEBAIGludCBoYW5kbGVfbWlzYWxpZ25l
ZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJcGVyZl9zd19ldmVudChQRVJGX0NPVU5U
X1NXX0FMSUdOTUVOVF9GQVVMVFMsIDEsIHJlZ3MsIGFkZHIpOwogCisJaWYgKCF1bmFsaWduZWRf
ZW5hYmxlZCkKKwkJcmV0dXJuIC0xOworCiAJaWYgKGdldF9pbnNuKHJlZ3MsIGVwYywgJmluc24p
KQogCQlyZXR1cm4gLTE7CiAKQEAgLTUwMiw2ICs1MDgsOSBAQCBpbnQgaGFuZGxlX21pc2FsaWdu
ZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIAlwZXJmX3N3X2V2ZW50KFBFUkZfQ09V
TlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRkcik7CiAKKwlpZiAoIXVuYWxpZ25l
ZF9lbmFibGVkKQorCQlyZXR1cm4gLTE7CisKIAlpZiAoZ2V0X2luc24ocmVncywgZXBjLCAmaW5z
bikpCiAJCXJldHVybiAtMTsKIAotLSAKMi40MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
