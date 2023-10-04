Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA20CE7C4D6
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+KdRg0Vfjd1OLTt0yCcOWo/qLIYKr5JgyOmfPVFbK0=; b=vp+dSxKgpzVB3V
	p2Jp4su4T+kxKKeCtquAqZNY8Vrjdfr/dtTw79BSMRF6APEF/pWY76fvaSAfpIbDbpUz2TrFF1RTv
	bcDs49nJMTeKcbTtfnn+bct0q6vwWzzZl1SnY2Y1WiuQqXCisoTNXaOF9fdiNWKLLXWiCXGjFCtXy
	IlUE4qMuNWYvQm55n4NYBuf9DpbbMeeaBov34vUNOsF5oDjo7+YDRxx6Qi8ow//MwzR5F2D2CupIC
	Dt6l9z7SoqYbnxffVzF3wZzpX/gu/xJSmcq5ciRDMKxGck2vFHc++25ZlCeN50w5po0kzxHgzQTnn
	Mid1giU87PTjP8pnj1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a0-000JYv-1Q;
	Wed, 04 Oct 2023 15:14:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3Zx-000JXl-1o
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:14:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-405d70d19bcso4000335e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696432464; x=1697037264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7cbbMj+E5ZBlob6bJSyN7OfL5gwM5MZRfPIQhkQ9FM=;
        b=Ln6oFJ68DZXy6nNtakfKkd7xFe59+CVgePRpR8rgCJmZNSrtt3hPpP4yp6ZHlYWu4t
         EnUfSg3sDWfvxz4XPH8WN9XQNGtvreYifgCyD0oppU9jz97jujO1rvCSecmPQXFIuWyx
         towtXxowLm5T3zKYdf2Xq0xqx3iC3Fyfqjnu+0dXOO40HV6h1Os71EArLozz/wFucbfn
         LZSO9X+6Co1ZLFFYyOQP7A0arZH44KwFZLu2XC/AYOXieYYmH3JGgcSB+rfUD1ubWHOS
         J36ZBSJfIGsqL8gSAcJXig8qFkDPIB22SoNJtoaQOgstjog7t2Euwou+lZ9r+IB0qxjC
         i2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696432464; x=1697037264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7cbbMj+E5ZBlob6bJSyN7OfL5gwM5MZRfPIQhkQ9FM=;
        b=UendlYrKC9o1P1ypuTAfVhA9P3VKtWeJb9KAU+DM94xEvghtrWC01S1QrXw4czkmGQ
         aH09qD/xrAsp0twpjD1WjMdKHJT7pMTAeKPQEAYJ3uTEENineS7FozwuJXV74SBe8A9A
         dd9q3hQNXccklDARlgY0tBdkNRNaWfJVyQMnwTIIRcBe2rqhosWAWDVEi9nNWvDYKBk5
         gCVk4Y2iPiK24eV7cAliU4Y21JWhGeRuLnzNWGzEk6rNTomRPHH9U8KjxxqWtwnL0mbs
         h00W539epMEG/i3+ZxbFT3QdP9cg8nGUDIAekjIlAcWKvwIr0RsBG7h0cm4lFtxtZdHf
         M9aQ==
X-Gm-Message-State: AOJu0YztSpqRIxpkpyc8bwGON/bbA3bwm4Apn13Z0HngMVFtaFl+fsCf
	eY1Q4+dlWSWrrlj8LBvmhv2YbA==
X-Google-Smtp-Source: AGHT+IFUYTV7FQFGtTHrMfR1VYTiBZo398LRCCrHvZm7ekynuy7D8ReYeOuSobKwivtHrDzV0o76mg==
X-Received: by 2002:a05:600c:510b:b0:404:75cc:62e6 with SMTP id o11-20020a05600c510b00b0040475cc62e6mr2495282wms.3.1696432464039;
        Wed, 04 Oct 2023 08:14:24 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b00402f7b50517sm1768764wmd.40.2023.10.04.08.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:14:23 -0700 (PDT)
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
	Daniel Maslowski <cyrevolt@googlemail.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v2 1/8] riscv: remove unused functions in traps_misaligned.c
Date: Wed,  4 Oct 2023 17:13:58 +0200
Message-ID: <20231004151405.521596-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004151405.521596-1-cleger@rivosinc.com>
References: <20231004151405.521596-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_081425_598885_2FC3B3B5 
X-CRM114-Status: UNSURE (   9.07  )
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

UmVwbGFjZSBtYWNyb3MgYnkgdGhlIG9ubHkgdHdvIGZ1bmN0aW9uIGNhbGxzIHRoYXQgYXJlIGRv
bmUgZnJvbSB0aGlzCmZpbGUsIHN0b3JlX3U4KCkgYW5kIGxvYWRfdTgoKS4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCA0NiArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKaW5kZXggMzc4ZjViMTUxNDQzLi5lN2JmYjMz
MDg5YzEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwor
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTE1MSw1MSArMTUx
LDE5IEBACiAjZGVmaW5lIFBSRUNJU0lPTl9TIDAKICNkZWZpbmUgUFJFQ0lTSU9OX0QgMQogCi0j
ZGVmaW5lIERFQ0xBUkVfVU5QUklWSUxFR0VEX0xPQURfRlVOQ1RJT04odHlwZSwgaW5zbikJCQlc
Ci1zdGF0aWMgaW5saW5lIHR5cGUgbG9hZF8jI3R5cGUoY29uc3QgdHlwZSAqYWRkcikJCQlcCi17
CQkJCQkJCQkJXAotCXR5cGUgdmFsOwkJCQkJCQlcCi0JYXNtICgjaW5zbiAiICUwLCAlMSIJCQkJ
CQlcCi0JOiAiPSZyIiAodmFsKSA6ICJtIiAoKmFkZHIpKTsJCQkJCVwKLQlyZXR1cm4gdmFsOwkJ
CQkJCQlcCi19CitzdGF0aWMgaW5saW5lIHU4IGxvYWRfdTgoY29uc3QgdTggKmFkZHIpCit7CisJ
dTggdmFsOwogCi0jZGVmaW5lIERFQ0xBUkVfVU5QUklWSUxFR0VEX1NUT1JFX0ZVTkNUSU9OKHR5
cGUsIGluc24pCQkJXAotc3RhdGljIGlubGluZSB2b2lkIHN0b3JlXyMjdHlwZSh0eXBlICphZGRy
LCB0eXBlIHZhbCkJCQlcCi17CQkJCQkJCQkJXAotCWFzbSB2b2xhdGlsZSAoI2luc24gIiAlMCwg
JTFcbiIJCQkJCVwKLQk6IDogInIiICh2YWwpLCAibSIgKCphZGRyKSk7CQkJCQlcCi19CisJYXNt
IHZvbGF0aWxlKCJsYnUgJTAsICUxIiA6ICI9JnIiICh2YWwpIDogIm0iICgqYWRkcikpOwogCi1E
RUNMQVJFX1VOUFJJVklMRUdFRF9MT0FEX0ZVTkNUSU9OKHU4LCBsYnUpCi1ERUNMQVJFX1VOUFJJ
VklMRUdFRF9MT0FEX0ZVTkNUSU9OKHUxNiwgbGh1KQotREVDTEFSRV9VTlBSSVZJTEVHRURfTE9B
RF9GVU5DVElPTihzOCwgbGIpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9MT0FEX0ZVTkNUSU9OKHMx
NiwgbGgpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9MT0FEX0ZVTkNUSU9OKHMzMiwgbHcpCi1ERUNM
QVJFX1VOUFJJVklMRUdFRF9TVE9SRV9GVU5DVElPTih1OCwgc2IpCi1ERUNMQVJFX1VOUFJJVklM
RUdFRF9TVE9SRV9GVU5DVElPTih1MTYsIHNoKQotREVDTEFSRV9VTlBSSVZJTEVHRURfU1RPUkVf
RlVOQ1RJT04odTMyLCBzdykKLSNpZiBkZWZpbmVkKENPTkZJR182NEJJVCkKLURFQ0xBUkVfVU5Q
UklWSUxFR0VEX0xPQURfRlVOQ1RJT04odTMyLCBsd3UpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9M
T0FEX0ZVTkNUSU9OKHU2NCwgbGQpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9TVE9SRV9GVU5DVElP
Tih1NjQsIHNkKQotREVDTEFSRV9VTlBSSVZJTEVHRURfTE9BRF9GVU5DVElPTih1bG9uZywgbGQp
Ci0jZWxzZQotREVDTEFSRV9VTlBSSVZJTEVHRURfTE9BRF9GVU5DVElPTih1MzIsIGx3KQotREVD
TEFSRV9VTlBSSVZJTEVHRURfTE9BRF9GVU5DVElPTih1bG9uZywgbHcpCi0KLXN0YXRpYyBpbmxp
bmUgdTY0IGxvYWRfdTY0KGNvbnN0IHU2NCAqYWRkcikKLXsKLQlyZXR1cm4gbG9hZF91MzIoKHUz
MiAqKWFkZHIpCi0JCSsgKCh1NjQpbG9hZF91MzIoKHUzMiAqKWFkZHIgKyAxKSA8PCAzMik7CisJ
cmV0dXJuIHZhbDsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIHN0b3JlX3U2NCh1NjQgKmFkZHIs
IHU2NCB2YWwpCitzdGF0aWMgaW5saW5lIHZvaWQgc3RvcmVfdTgodTggKmFkZHIsIHU4IHZhbCkK
IHsKLQlzdG9yZV91MzIoKHUzMiAqKWFkZHIsIHZhbCk7Ci0Jc3RvcmVfdTMyKCh1MzIgKilhZGRy
ICsgMSwgdmFsID4+IDMyKTsKKwlhc20gdm9sYXRpbGUgKCJzYiAlMCwgJTFcbiIgOiA6ICJyIiAo
dmFsKSwgIm0iICgqYWRkcikpOwogfQotI2VuZGlmCiAKIHN0YXRpYyBpbmxpbmUgdWxvbmcgZ2V0
X2luc24odWxvbmcgbWVwYykKIHsKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
