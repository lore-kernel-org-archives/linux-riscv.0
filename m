Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D91C369B8
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMO1cUq5Z9nhXzIkv2YiuAJMHQlxR0O3YkG3rmfyhNE=; b=R6io2Le2+2UmJZ
	boZk4Envtx4sw28RaYyanr/jNNCZQA3GcIL4C50ftbrZlasUFL1DtjDhajQMmcumoWKxHTr8jtkZv
	054cyhgQ2G40Y1Glm5IK/JQOp4SSqmVnRfrCcLGiBStS8r9bpSyTZU/gUFytBJY+lTjMBDRSnZE3S
	VPeEFVR5YbfsxMOCaf36AomBFtNo4FBtKGsW14+nqKOu9JPxof7Z6pn+9MBtmTbb6IdnPSYMiqDuJ
	JIU0A/2aBHmX0usbNRKlc7vD2618zWBn3I7qDXRE5y9FXdpJYeK4Msbk7iunYNA9G7HOzClwAK/aB
	6fs1Yaj0Ck3Ypv3OqSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J4f-00000001yGs-1T7f;
	Mon, 14 Apr 2025 12:38:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J2a-00000001xdj-0dbf
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 12:35:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so2659028f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 05:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634155; x=1745238955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68pbaLtpMYwVIsLVPcwWXXG5wNjqWZdJ0gKFjaMSW/8=;
        b=AUgQqcYhZ0ZtV/0RnxMugswc3jje51e2WFkGH654fOF+T2QtTqWvH4/XpKguZLPq1j
         l211VWkPHeEUbYyv3CWU3Z1zU+ejQgt8gtQ9ZUZ4CyhxO72FTh86R2iCukRNtgQ+uTIB
         O30UIfbBoGgwPQ3Mq2U4a5g7cjCImMGO6/CTQlDjPqCSzdYyc27WrDQWywK95sD0D1yx
         Ax2g0N2UDW/BBqlj5ql4SWiZsc2ho7RcL+d8I908P3bM3LnYrr9jzNdxj/UW+s40fnbo
         sYUyISSq/y6Tkh9GivW1faDsR7B4pmB2MBbHcOnnV5pCZFagCYeKPED00awxj97/de60
         ENmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634155; x=1745238955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68pbaLtpMYwVIsLVPcwWXXG5wNjqWZdJ0gKFjaMSW/8=;
        b=sXndTVwZnQSKiIovxj2prsrLHM16Q/c/+12DaXinrJ9E/+Ytca1/XIZMjwg61mWK21
         WBsPLP3sBl6eHTkcKhaLfWQY0n5v2b0xL/6i5TcdesGyOxgsTbY7AasTONi484XEMX2a
         LJ5LAjC5BkpuMSTqeAFVaGdsmpxjCI78vjgJjqbh+wyzyyWbnyve9o/EVYqDyg6oACVx
         qOr/BuVoJH5UEPzFnJdnS6x8qwbkH1DqyzXQyQsXc/Kiwk1lGQktb+KHomsSMZHbiiLT
         y1cy1hLMH5W3JP5gqi1ExZDVLs6OWr+LnHBMglQZ5tCw1rdRO0JSuLv7DvvRvLku/Ps4
         gBRg==
X-Forwarded-Encrypted: i=1; AJvYcCUmwwUiB75HBEt7THjUOIA3xs5Twkj6mXY2McJ81T133sdhrn46llgPYJiGCJHHUxcHFpxZHcPAmP3QuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YynJbPfYUT+An2UXv8ZjlgSB/5PoGRR6R8cZLypI6xM7SblppmX
	om6FlnD2uNV44y9ztw+Ehn/u2SI5aIvTJqkSPACLQ5r1LjjE23UrRgWZQcUNOh4=
X-Gm-Gg: ASbGnct4ByFoBk99dirNJRBgWtsZr+jdgJrJ10oox4brc2k/T+Q7DQzScoWHqLHw4lf
	1NUy/TRNVWS3eQaqqLH6LuJ6XhICr2ZvAD/sQdFcxWUwBrNLNrKFIPX6fC1Mb1ko9zI5JZE/ux1
	ANR8Yt0YRnE2hHi1zPJqLVSFpwhz344Wkhst0VJ+DBcu2T+SldkVHlncpSdOUSOsz6OdAeXtu3B
	IIknBD6sVIuFxx/dWybmlM7ab0xw7U806IcfXm1t9hV0/7kNtOYZiLc/c7i5qDYkWC1QIV5LU1e
	XAMIEzg7sU/LJxrjoNfmF3KmdDIJzejq0yYNL4V3+Q==
X-Google-Smtp-Source: AGHT+IFbK/KsiJbbEgc4z7Wr5HZ2HsrmZowacWDhKFk2K2SS3hDxowzVqH4JTYQk6zOp8F3mGhATxg==
X-Received: by 2002:a05:6000:250c:b0:397:8f09:600 with SMTP id ffacd0b85a97d-39ea51f5717mr9014815f8f.13.1744634154552;
        Mon, 14 Apr 2025 05:35:54 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:53 -0700 (PDT)
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
Subject: [PATCH 1/5] riscv: misaligned: factorize trap handling
Date: Mon, 14 Apr 2025 14:34:41 +0200
Message-ID: <20250414123543.1615478-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414123543.1615478-1-cleger@rivosinc.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_053556_207801_7AE989DD 
X-CRM114-Status: UNSURE (   9.91  )
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

bWlzYWxpZ25lZCBhY2Nlc3NlcyB0cmFwcyBhcmUgbm90IG5taSBhbmQgc2hvdWxkIGJlIHRyZWF0
ZWQgYXMgbm9ybWFsCm9uZSB1c2luZyBpcnFlbnRyeV9lbnRlcigpL2V4aXQoKS4gU2luY2UgYm90
aCBsb2FkL3N0b3JlIGFuZCB1c2VyL2tlcm5lbApzaG91bGQgdXNlIGFsbW9zdCB0aGUgc2FtZSBw
YXRoIGFuZCB0aGF0IHdlIGFyZSBnb2luZyB0byBhZGQgc29tZSBjb2RlCmFyb3VuZCB0aGF0LCBm
YWN0b3JpemUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDQ5ICsrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDI5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IDhmZjhlOGIzNjUyNC4uNTVk
OWYzNDUwMzk4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTE5OCw0NyArMTk4LDM4IEBAIGFzbWxpbmthZ2Ug
X192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9pbnNuX2lsbGVnYWwoc3RydWN0
IHB0X3JlZ3MgKnJlCiBET19FUlJPUl9JTkZPKGRvX3RyYXBfbG9hZF9mYXVsdCwKIAlTSUdTRUdW
LCBTRUdWX0FDQ0VSUiwgImxvYWQgYWNjZXNzIGZhdWx0Iik7CiAKLWFzbWxpbmthZ2UgX192aXNp
YmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9sb2FkX21pc2FsaWduZWQoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCitlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUgeworCU1JU0FMSUdORURf
U1RPUkUsCisJTUlTQUxJR05FRF9MT0FELAorfTsKKworc3RhdGljIHZvaWQgZG9fdHJhcF9taXNh
bGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUg
dHlwZSkKIHsKLQlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Ci0JCWlycWVudHJ5X2VudGVyX2Zyb21f
dXNlcl9tb2RlKHJlZ3MpOworCWlycWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9lbnRl
cihyZWdzKTsKIAorCWlmICh0eXBlID09ICBNSVNBTElHTkVEX0xPQUQpIHsKIAkJaWYgKGhhbmRs
ZV9taXNhbGlnbmVkX2xvYWQocmVncykpCiAJCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywg
QlVTX0FEUkFMTiwgcmVncy0+ZXBjLAotCQkJICAgICAgIk9vcHMgLSBsb2FkIGFkZHJlc3MgbWlz
YWxpZ25lZCIpOwotCi0JCWlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOworCQkJCSAg
ICAgICJPb3BzIC0gbG9hZCBhZGRyZXNzIG1pc2FsaWduZWQiKTsKIAl9IGVsc2UgewotCQlpcnFl
bnRyeV9zdGF0ZV90IHN0YXRlID0gaXJxZW50cnlfbm1pX2VudGVyKHJlZ3MpOwotCi0JCWlmICho
YW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQorCQlpZiAoaGFuZGxlX21pc2FsaWduZWRfc3Rv
cmUocmVncykpCiAJCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywgQlVTX0FEUkFMTiwgcmVn
cy0+ZXBjLAotCQkJICAgICAgIk9vcHMgLSBsb2FkIGFkZHJlc3MgbWlzYWxpZ25lZCIpOwotCi0J
CWlycWVudHJ5X25taV9leGl0KHJlZ3MsIHN0YXRlKTsKKwkJCQkgICAgICAiT29wcyAtIHN0b3Jl
IChvciBBTU8pIGFkZHJlc3MgbWlzYWxpZ25lZCIpOwogCX0KKworCWlycWVudHJ5X2V4aXQocmVn
cywgc3RhdGUpOwogfQogCi1hc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lk
IGRvX3RyYXBfc3RvcmVfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKK2FzbWxpbmth
Z2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9sb2FkX21pc2FsaWduZWQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7Ci0JaWYgKHVzZXJfbW9kZShyZWdzKSkgewotCQlpcnFl
bnRyeV9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzKTsKLQotCQlpZiAoaGFuZGxlX21pc2FsaWdu
ZWRfc3RvcmUocmVncykpCi0JCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywgQlVTX0FEUkFM
TiwgcmVncy0+ZXBjLAotCQkJCSJPb3BzIC0gc3RvcmUgKG9yIEFNTykgYWRkcmVzcyBtaXNhbGln
bmVkIik7Ci0KLQkJaXJxZW50cnlfZXhpdF90b191c2VyX21vZGUocmVncyk7Ci0JfSBlbHNlIHsK
LQkJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X25taV9lbnRlcihyZWdzKTsKLQot
CQlpZiAoaGFuZGxlX21pc2FsaWduZWRfc3RvcmUocmVncykpCi0JCQlkb190cmFwX2Vycm9yKHJl
Z3MsIFNJR0JVUywgQlVTX0FEUkFMTiwgcmVncy0+ZXBjLAotCQkJCSJPb3BzIC0gc3RvcmUgKG9y
IEFNTykgYWRkcmVzcyBtaXNhbGlnbmVkIik7CisJZG9fdHJhcF9taXNhbGlnbmVkKHJlZ3MsIE1J
U0FMSUdORURfTE9BRCk7Cit9CiAKLQkJaXJxZW50cnlfbm1pX2V4aXQocmVncywgc3RhdGUpOwot
CX0KK2FzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9zdG9y
ZV9taXNhbGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCWRvX3RyYXBfbWlzYWxpZ25l
ZChyZWdzLCBNSVNBTElHTkVEX1NUT1JFKTsKIH0KKwogRE9fRVJST1JfSU5GTyhkb190cmFwX3N0
b3JlX2ZhdWx0LAogCVNJR1NFR1YsIFNFR1ZfQUNDRVJSLCAic3RvcmUgKG9yIEFNTykgYWNjZXNz
IGZhdWx0Iik7CiBET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxfcywKLS0gCjIuNDkuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
