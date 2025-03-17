Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413ADC35FF9
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zc66dH/dQqU2rsSTkTZVDkgZr2PpvljLZSzMNkZJMY=; b=saS2v/QM3gqAIr
	YFc32AdD4Es1MTY3K1hzsvgX12kbp/ESpWytXzA1u0pFsiIWlMC1uft09BHSqe21TufTMhDHVv7GQ
	qe3ZLKmmnGCNFnVlcJZVzTSQnqmu2KSOxtRXBVAjCawVXmXkCj2KjgGcsZq9oCMjlRZUPa7DD9Puw
	GhwFBOWqYiXjGZG3CL9LUy1wxRl+0ntonY5UsFg+b6POIJ6a2SwBZjRjClmpkcM2yYG5VbSR7Cn5g
	05w1iJc+YIZhQxDl3ZnCqEOIg/cYcQInxUbWT7GD5yDJSoCwmU6RLmbJOYu6rTc3CD0goYFgGRYa/
	n6SDoMxx1M286EQGQQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1S-00000003V0h-2dFn;
	Mon, 17 Mar 2025 17:13:06 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwm-00000003TRx-2w0k
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:17 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43948021a45so25174915e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231295; x=1742836095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kTF+ccGFA3pCz5oiuUa/A8mZMPFTX0HIKuC7hxXfUI=;
        b=v/zRCOPmgZ5fjeXN5kkWNwlsgOVBp6z5MRFvR/4fB3IvoSOUDLlv7HY72lvJHAVB7y
         3ltQH8FCpEW/zZR9eh4BPcbS2TAyzARhle6ChVs1DThQQRgEFt4yxT34WAZJoeh+ddrV
         f/bV0SOaxnmSGbT7Pzb8cOX5UC21TI0VVtjNmia5CronyzRvRP8gBljxpQX/zmL7DBrT
         EgjfGuJyg/blJKz4lOZvDNTZQ+asJSykU36B4jKAmdkqbgaYMnl1GJVcie+xmR7WLR8K
         z1AV1EItKNDT0Xue2bPkDYxv882aaLqbrTGk8pSKL6jL1VfIiat3iH48itOzJ1NDjCIk
         sqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231295; x=1742836095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kTF+ccGFA3pCz5oiuUa/A8mZMPFTX0HIKuC7hxXfUI=;
        b=mni1nRRt65gvGbYATney/QH5IRUd9Pp0s8HhpSufY40HdT1PC8/y8FkTGX7aRGhBwV
         tEc76Z95fQqQOb2UR3IXP3hFhU56cQKEQ9ikGHgkVS+HFwfayug7uS6LWbK1XokAcP+c
         nKu6ulumFQHpWRr3vkiB1bUmm8Dnr/7JhLp7ETAfGI+p6TzBkIs80dgS8ROW2FFgVvBj
         ZcIwPrQNxY5VEkVmnjnI1kzuZz+g6B1og3nDFp3RS2fPzXQPclJ6/ZgLnHCiIBZdY5u7
         Xfw6PuwU3HeunsOlOgZ2g6FGhA9gnmOtRyhaEWBbp9Wh9H3AxwX7uGEEE8wGXqmq25nt
         hesQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9I2/LsMWaZbX4z2tLed96ex07qztg66fYx0buymes80RBedlBZBrPeVnlptN8Os8OwEEWGMZvrPGwMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxajmRzEVVZeXztw7sgeHVVpaq3QB35hUWjdPK6fvijzi6oBKYL
	QfklqFjk3UyE9jZD+r+ICnlVqcKkyOe/QCa5j8OY0hwi5UY/rG2oZ5LHTW95jzg=
X-Gm-Gg: ASbGncvmu7vWJaoAox2ucFSZrgy9EbygtNT3NwhH1t6FM/oZI7PGgIVfSQyGNL8/QwJ
	YVimbccU/xSDRSHNSKrcwSyZgdqCuyl8H8YKkeYqyWAqRojLfilQ11efTK9eITfLjzAFF+vCKzX
	6SW6lm7qBBGRqCqdBvKhbjP+soaUI31sM123u2wpjQF7BM348zSNiBV6SErvlwVIZeR3fBy2wvr
	JBLiBnzEFPRnNF3TpVOev0ARObzlHVT0/7F2kamcuw450JohpU4ZhzCVHG7F9Yn7MRHfFJrVccS
	WiWXtpwP/t39CftuYUUIGLCYr3kwy8kSi3CnLUKbh8L19A==
X-Google-Smtp-Source: AGHT+IH4sjX9gto0lgEtyEEfUnQHUD379+GVWmuhA4p7t8yk18Gi55URplLVQo2Ek/+dIEHXcxDHKA==
X-Received: by 2002:a05:600c:314b:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43d1ecd894fmr147448025e9.30.1742231294732;
        Mon, 17 Mar 2025 10:08:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:14 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 07/18] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Mon, 17 Mar 2025 18:06:13 +0100
Message-ID: <20250317170625.1142870-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100816_734505_AC43B897 
X-CRM114-Status: UNSURE (   9.83  )
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

bWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5lZCB1bmRlciBDT05GSUdfUklTQ1ZfU0NB
TEFSX01JU0FMSUdORUQKYnV0IHdhcyB1c2VkIHVuZGVyIENPTkZJR19SSVNDVl9QUk9CRV9VTkFM
SUdORURfQUNDRVNTLiBGaXggdGhhdCBieQp1c2luZyB0aGUgY29ycmVjdCBjb25maWcgb3B0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMKaW5kZXggNDU4NGYyZTFkMzlkLi44MTc1YjM0NDliNzMgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTM2Miw3ICszNjIsNyBAQCBzdGF0aWMgaW50IGhhbmRs
ZV9zY2FsYXJfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJcGVyZl9z
d19ldmVudChQRVJGX0NPVU5UX1NXX0FMSUdOTUVOVF9GQVVMVFMsIDEsIHJlZ3MsIGFkZHIpOwog
Ci0jaWZkZWYgQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9BQ0NFU1MKKyNpZmRlZiBDT05G
SUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQKIAkqdGhpc19jcHVfcHRyKCZtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVEOwog
I2VuZGlmCiAKLS0gCjIuNDcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
