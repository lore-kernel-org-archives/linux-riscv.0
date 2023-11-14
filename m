Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DE3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSYarMD82CQgRC+4DWuujXBMIVQySFwWyftwXQKPy3A=; b=zgzn3YJlMQ+d6z
	apq/Chd/5Vwc46rvlzEEIRnWWHVLWVLSrYK8RNfw/ZFo6hOMrsnbUKMoj6rRzRuF3ehJ5dGFpKXbx
	6IJ2f9FQqGSjX9Y7jFI6D+Y4eLOe0gG5fqii6lZai+kX/jm3Fc9tGvvge18rLswyaAIks2c4hxZUv
	yX0oUMcb/YWN6wiXHMMzB74sneMRtWQSJT1zOlot9adhNeVMqU1aYn3On8/Diuskd1+CSxNja66TA
	0ff83Nb548J/UX7Jbv1O9xcBwm67B9BynIHHMM8oFkPugvo4doaX9wedlY0VN8aGbWzaMmVEBg8ut
	YHrwe/Jl2hfzfGz+S03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uBC-00G9Vp-0J;
	Tue, 14 Nov 2023 14:14:14 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAw-00G9Al-2h
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:14:00 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-77773d3246aso14497585a.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971237; x=1700576037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oJqbvRhcnLQ4NxthWPQmg85qomzW1aIjvQdZvqQ+P8=;
        b=wKXNhWZ4X6OIDwJ7o5oz8E06uLwwEKx5X0NsnX4b+MbSzltFT1UlRz9rdkFvoqlofo
         DlwoTTfowhWyAxt4sGPUyKz0aEwdC/dqdEKCD6r3+qJ1OPNloVpOFMFvp6fuzMmUvq1P
         IoGe1Iq/ClEHplbT/Is3WOAcSZiYvHyNqQ8SQt6UeEmHGHXZ27AIN1TvDLLNiU8IAUGC
         Ttu3JWF+aDwLLJzBRuPXGy9Zgr7UBOZpwv8RWmETi2beDNAOBo3KsTWyGNJjdOVGSi3E
         j7gmRzLNwKeXTmcF3SToCM5uxgA5MIVI+YagmNn3kw0adVYOtQWyvueQGDQu7+p2vPdA
         6Xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971237; x=1700576037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oJqbvRhcnLQ4NxthWPQmg85qomzW1aIjvQdZvqQ+P8=;
        b=EXulhsxwUiX3HDGFRW6nd9pg6T+h/cCxFPS1qnWM/e+e7cMPO+VV4nBEMEfIvDJtBU
         cla+j/YPo39X1m6OkCLGUOl4eou5qTYC6d5X5oh/E4mreLHJ4HDxU7ectTDIBI5FbEeu
         4WGrb8/CY9se/sdQOIsGW9+MkdePuxpG799YkWaosyvX6hJQzd7VjPnha1WunDBnxqCe
         JGcQY0/ZTi6p4ordsEH8Haw6t0Fhdy1noCzLNJPouwZiMdxSjaB+kazHcAMO8EbYCz8/
         sNQAkxpduWgTzP40y6D1aIdDUXHY9i9GVE0kGNAANrRGuIhfe59Rq3IiI65t0drzu4HY
         SU7w==
X-Gm-Message-State: AOJu0Yy8BAl6amqMpAq2kGOvYDlJG5yStlHhPff+D1HGkcUPGt2381+5
	n2H/aLIU9AVJYk5r2kr6POmrxxl8qLcMJxujcVw38Q==
X-Google-Smtp-Source: AGHT+IF9EjIfzzCxNwPyM1ga1yNOhI5yYokOjuEfqsXGtogg+vNsqW/HCxpZN6Ez5oZMRSmIbkGJGw==
X-Received: by 2002:a05:620a:28d4:b0:773:a789:cd15 with SMTP id l20-20020a05620a28d400b00773a789cd15mr2090356qkp.6.1699971236775;
        Tue, 14 Nov 2023 06:13:56 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:56 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 19/20] riscv: hwprobe: export Zfa ISA extension
Date: Tue, 14 Nov 2023 09:12:55 -0500
Message-ID: <20231114141256.126749-20-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061358_948297_B7F9F905 
X-CRM114-Status: GOOD (  11.10  )
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

RXhwb3J0IFpmYSBJU0EgZXh0ZW5zaW9uWzFdIHRocm91Z2ggaHdwcm9iZS4KCkxpbms6IGh0dHBz
Oi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMVZUNlFJZ2dwYjU5LThRUlYyNjZkRUU0VDhGWlR4
R3E0L3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgotLS0K
IERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKIGFyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3N5
c19yaXNjdi5jICAgICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IDg5NmVjZmJiZTVmNC4uNDE0
NjNiOTMyMjY4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xNTcsNiAr
MTU3LDEwIEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgICAgICBkZWZpbmVk
IGluIHRoZSBSSVNDLVYgVmVjdG9yIG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCBlMmNjZDA1
NDhkNmMKICAgICAgICAoIlJlbW92ZSBkcmFmdCB3YXJuaW5ncyBmcm9tIFp2ZmhbbWluXSIpLgog
CisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pGQWA6IFRoZSBaZmEgZXh0ZW5zaW9u
IGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFs
IHN0YXJ0aW5nIGZyb20gY29tbWl0IDA1NmI2ZmY0NjdjNworICAgICAgICgiWmZhIGlzIHJhdGlm
aWVkIikuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0
bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBz
ZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3By
b2JlLmgKaW5kZXggZmZmYzY5ZDlmNmJhLi45MWZiZTFhN2YyZTIgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNTUsNiArNTUsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9i
ZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUhJTlROVEwJKDEgPDwgMjkpCiAjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkZICQkoMSA8PCAzMCkKICNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pWRkhNSU4JKDEgPDwgMzEpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
RkEJCSgxVUxMIDw8IDMyKQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQog
I2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZp
bmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
cmlzY3YuYwppbmRleCBlOTA1Mzc1OTNmNWYuLmYwYmQ3YjQ4MGI3ZiAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jp
c2N2LmMKQEAgLTE5Myw2ICsxOTMsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0
cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlpZiAoaGFzX2ZwdSgpKSB7CiAJCQlFWFRfS0VZ
KFpGSCk7CiAJCQlFWFRfS0VZKFpGSE1JTik7CisJCQlFWFRfS0VZKFpGQSk7CiAJCX0KICN1bmRl
ZiBFWFRfS0VZCiAJfQotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
