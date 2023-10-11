Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA595CD6E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EY3g1xXCJ6nWRnBrfKBTGixV9JlE5HlcHLDpXKdMsgM=; b=Lx1TaV7F4IKeJd
	VHjYPx/1CQkLqdZb+bszuJ1MrfmcJ+njyQbEfQIotR0jEA8btXYK+dqgCMQt7JCDwBKtrxVby1XQR
	qpMP5ASkgFrcKMVt9xpyHOB7O51DLJY+yGatWN133xfCiCIhGnxIHmv/horNJqLwViBBwLWceFnA8
	pP68XeMSJORm3/vcaPLCsEsbtLqOxvLADysPIuBu40Q4zSXxyu5q/bqu56gRKZCxZk52y9mjKc9lI
	jrfuCpktIIcw6aME85245qkj6kRIFBWmUfvv1sLEuvZ20IKhdBpNVtoa2jhU/Ttm/gBJl8gpNGrFS
	+OH4x3plV2uGYUlevyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFO-00FjLa-2R;
	Wed, 11 Oct 2023 11:19:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFG-00FjEg-1N
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:24 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18557885e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023154; x=1697627954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5dECHie5t7w/LFj+hSn2EZYYIuSxKSWdwgSHs3GrYQ=;
        b=LAxK1Chz8L16nxiDXmZ44SW7A+rGJqyPrkr0hf8hmxpeZKLZ5zBAcRvMJpmq2NzDnS
         QJ7UbR9KMBS2Zxljd9WtH4fd2YU2AONKLjYZw8Kp+2lJ44XmkM1W6MD6IbGMwm6b1elj
         8Ob73IFCctJrSDOoE69T47yQ5QEwVDA86RBSHVi7z8FS25DZZfQqSzTzhJ5dTxYY8VZm
         3OhcrGzBRwvqr3ZudC/zZDma6jGONdxalyBiOkRSX9toOW8t5zTkXDopHSwF7eHzsrjs
         u+qzF9y7ueJCjedAIGUArHksiZenFCEJrHwvjPewhJwDJlVKH6Wt5SybQRK1J0DTgQk1
         0ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023154; x=1697627954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5dECHie5t7w/LFj+hSn2EZYYIuSxKSWdwgSHs3GrYQ=;
        b=Xcn8e/XJJ+bSB+PQXfv9zudlFX5rZPwOpzFFFxsAumqMKcA+IkwJGcSBTbad+uUq3N
         zx2EoyqdsIWNrjongxKaI5/Qw13ZGpaH9BH8XErN8vEpjXGwktDY6BoUT7UG00yUFy7M
         dX/Ag9an7EM2PbFI3rUUr/rb7mGgCQRXXmryIe5LjjQzjMIIjikx4KnXW0pv1gB3ZG1J
         Q6vf4yKLhM8UhqcpN48Ps0/jMMAfX9Zk+Uy5I/wWDD/96gWzsrnMl89V6QQ0DHMxKzhA
         VTb4Q9KyrFL1XzHvN/QGGpYXYmIdg3vbZX2uX2TirIf4omvPAAVCzpHeatqMuFyzeGfV
         UD0Q==
X-Gm-Message-State: AOJu0Ywj9T502ECZJjq9kD/C+p0iX8+QSfzbjsqBfHoEkEBrnDRV5Wl5
	+U9aOMb0S01Q1dgNvi9gkpb0V3zJMaRWGt0MV78oUA==
X-Google-Smtp-Source: AGHT+IGqaMr2lbwiCk/m+ySyisBsIBIICm+Ha1304s+KwZsHP3G7Q7GtnKq3prSiP3Z7bET+xFCu8A==
X-Received: by 2002:a05:600c:214f:b0:406:513d:738f with SMTP id v15-20020a05600c214f00b00406513d738fmr18787352wml.2.1697023154659;
        Wed, 11 Oct 2023 04:19:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:14 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 01/13] riscv: fatorize hwprobe ISA extension reporting
Date: Wed, 11 Oct 2023 13:14:26 +0200
Message-ID: <20231011111438.909552-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_041918_636008_739CD8A0 
X-CRM114-Status: GOOD (  10.52  )
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

RmFjdG9yaXplIElTQSBleHRlbnNpb24gcmVwb3J0aW5nIGJ5IHVzaW5nIGEgbWFjcm8gcmF0aGVy
IHRoYW4KY29weS9wYXN0aW5nIGV4dGVuc2lvbiBuYW1lcy4gVGhpcyB3aWxsIGFsbG93IGFkZGlu
ZyBuZXcgZXh0ZW5zaW9ucyBtb3JlCmVhc2lseS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlz
Y3YuYyB8IDI2ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwppbmRleCA0
NzMxNTliNWYzMDMuLjVjZTU5M2NlMDdhNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX3Jpc2N2LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKQEAgLTE0NSwy
MCArMTQ1LDE4IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3
cHJvYmUgKnBhaXIsCiAJZm9yX2VhY2hfY3B1KGNwdSwgY3B1cykgewogCQlzdHJ1Y3QgcmlzY3Zf
aXNhaW5mbyAqaXNhaW5mbyA9ICZoYXJ0X2lzYVtjcHVdOwogCi0JCWlmIChyaXNjdl9pc2FfZXh0
ZW5zaW9uX2F2YWlsYWJsZShpc2FpbmZvLT5pc2EsIFpCQSkpCi0JCQlwYWlyLT52YWx1ZSB8PSBS
SVNDVl9IV1BST0JFX0VYVF9aQkE7Ci0JCWVsc2UKLQkJCW1pc3NpbmcgfD0gUklTQ1ZfSFdQUk9C
RV9FWFRfWkJBOwotCi0JCWlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FpbmZv
LT5pc2EsIFpCQikpCi0JCQlwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQkI7Ci0J
CWVsc2UKLQkJCW1pc3NpbmcgfD0gUklTQ1ZfSFdQUk9CRV9FWFRfWkJCOwotCi0JCWlmIChyaXNj
dl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FpbmZvLT5pc2EsIFpCUykpCi0JCQlwYWlyLT52
YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQlM7Ci0JCWVsc2UKLQkJCW1pc3NpbmcgfD0gUklT
Q1ZfSFdQUk9CRV9FWFRfWkJTOworI2RlZmluZSBDSEVDS19JU0FfRVhUKF9fZXh0KQkJCQkJCQlc
CisJCWRvIHsJCQkJCQkJCVwKKwkJCWlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShp
c2FpbmZvLT5pc2EsIF9fZXh0KSkJXAorCQkJCXBhaXItPnZhbHVlIHw9IFJJU0NWX0hXUFJPQkVf
RVhUXyMjX19leHQ7CVwKKwkJCWVsc2UJCQkJCQkJXAorCQkJCW1pc3NpbmcgfD0gUklTQ1ZfSFdQ
Uk9CRV9FWFRfIyNfX2V4dDsJCVwKKwkJfSB3aGlsZSAoZmFsc2UpCQkJCQkJCVwKKworCQlDSEVD
S19JU0FfRVhUKFpCQSk7CisJCUNIRUNLX0lTQV9FWFQoWkJCKTsKKwkJQ0hFQ0tfSVNBX0VYVCha
QlMpOworI3VuZGVmIENIRUNLX0lTQV9FWFQKIAl9CiAKIAkvKiBOb3cgdHVybiBvZmYgcmVwb3J0
aW5nIGZlYXR1cmVzIGlmIGFueSBDUFUgaXMgbWlzc2luZyBpdC4gKi8KLS0gCjIuNDIuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
