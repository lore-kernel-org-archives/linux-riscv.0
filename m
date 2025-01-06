Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2064E77198
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaWcjoc4TeehkNEj96Cyu8peRSC5RLmauQsSM03gPC0=; b=byQByqqAN4h3KQ
	1w7Cn6a5nRzWGUgoP0r2PhbsYhYSogPMt7cP3MEfK06O9wa7y7QPiaM/1XBS3QdcTAIYb/0gGkN+g
	2kizGiJ9AEobf3/mEl7+oQKl4r28zaGrERhU6PEKw3atxTsZfApd7T+9bK4nvIxPk3NbuGgxMYOQ3
	dHWdvAN5wE3kxCNLvM18syeVgL8MJz+kavzrfd1RQQrBChN3Mc93N0Nx3KzifswKiWhWU3Rff77DM
	n7nN42rL1G/qD+cX7cPcHzRtL9O4VrwDALftHa8YhcymdsFDTrccs3ljyzqEwbdL5HRgFelVcNv/3
	5pslvjDrmxrkj2r6xadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpNg-00000001qbP-2gNL;
	Mon, 06 Jan 2025 15:51:04 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpMI-00000001q8s-1aIG
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:49:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21619108a6bso195047075ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 07:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736178578; x=1736783378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcVyV1LOtw6V8Ho5gVIQl8YkyD+SXwNo0hQboe95Nr0=;
        b=ph3AREFcLMqmMhOcbRQWEq2HNeIpEu3b9bPSXz9JnHt5hiI8ZXgPLT7s+XiY6GXeLE
         04LAVABxQSxALfwhlzJPKQ9KWdYlRNgFgwbpxMD5LBZWWIn17HQnHdU1rbE2N2XARMqs
         E+Sy1S/Sxgx1HC8kqG38visRHLDfXji1t2GH3U5uB457c5PHy784mKw9/RLMHowvMAD3
         aQlMofnCZVSYZeT/gTKCi13WI8FFUuaLFS+eisCd+bolEVseAc9/dflwEhItG+vu51eS
         gqo4sqTIoOvbU5qNyMo0/Gr35mmopBNNByMImbSfvvEuZIRx0B54L92TLHIV/gwAVzKO
         nSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178578; x=1736783378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcVyV1LOtw6V8Ho5gVIQl8YkyD+SXwNo0hQboe95Nr0=;
        b=luPsBGitQjZBf1sKD8KbWmq9YusZofZGUHjv6YJTJOhL7l3rXAWkTuP8cNU4jjSKNO
         Llnd8Omlemihi/aNENtbG0dlVF0mzLjiEIcYUKb+QUzmEeNKWGd9QrN73KK9/VYgIoLc
         51v+/V7Z0BF+woIgwUi+A+/4tJzEDuozyBu2J3T3Rd1QtwNRe3RTKb246qUv4WW2YeVR
         hJIO9rzTQIa9b6IN8vAy5e9B2IGvfyLBU6Ek7f0lq7BqC4+K5RbGBDNd8gqUB0ttKSSd
         LoRT/AujNLiwguradlGoJFMAQ2QljaI5WrK2E+nbcwmxPM0fct4K19qWLvdzm6OV5dYP
         wkmw==
X-Forwarded-Encrypted: i=1; AJvYcCXTP5Ri5GrphiAoQEml9L0Ecy+H8ZO8RhdmFIxjEsug+J/xVogzEWBB1UsqWXRoKjZHhA4pp3WA+HvQiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzrWt0wViCuDZp3cWdt/sywYTVqr4gkjkIijexwhoUiLJC468n
	S4LX+iNM4yG9nFpxXmUxnUaCUHfTcWPUoS/oaVHseEdjcSlt+wW88vEGgrIAezg=
X-Gm-Gg: ASbGncsa+hVmdN+l5jt4m4y8GKQaSklmfsvtQ3qqlT638gEezNQ+YtV+avGbOKoYtva
	vXP2fDfI1HuNBa3pPccqO7Lfuc0KyOajI1gEl4GhIf3HcV3oNhnfM8J68MkRmEqMqMCJukHpmbr
	5me4i8f97gqQpstxcQOzp6tYLrce9y7lpZuhf7ZhySuLI06btxWmdt2GKYKjfDmFV5x+9QhI1bS
	9KwUSBzchHyfiOlGMmev+H7ie9C9t/e3zC+hk/i+1QsuDYdqAqZ0MnjBQ==
X-Google-Smtp-Source: AGHT+IFsXBphfyy9s3JHMbepbPzIKCpal6gBIDcIfNIg+T9QhHs1bx0Q0ootfBFREr+mo3N4LGUQPA==
X-Received: by 2002:a17:902:fc8e:b0:215:522d:72d6 with SMTP id d9443c01a7336-219e6f0e605mr939915245ad.38.1736178577712;
        Mon, 06 Jan 2025 07:49:37 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm292479535ad.214.2025.01.06.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:49:37 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH 5/6] riscv: export unaligned_ctl_available() as a GPL symbol
Date: Mon,  6 Jan 2025 16:48:42 +0100
Message-ID: <20250106154847.1100344-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106154847.1100344-1-cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_074938_406069_4CEE12D7 
X-CRM114-Status: UNSURE (   8.81  )
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

VGhpcyBzeW1ib2wgd2lsbCBiZSB1c2VkIGJ5IHRoZSBLVk0gU0JJIGZpcm13YXJlIGZlYXR1cmUg
ZXh0ZW5zaW9uCmltcGxlbWVudGF0aW9uLiBTaW5jZSBLVk0gY2FuIGJlIGJ1aWx0IGFzIGEgbW9k
dWxlLCB0aGlzIG5lZWRzIHRvIGJlCmV4cG9ydGVkLiBFeHBvcnQgaXQgdXNpbmcgRVhQT1JUX1NZ
TUJPTF9HUEwoKS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCmluZGV4IDRhY2E2MDA1MjdlOS4uNzExOGQ3NDY3M2VlIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC02ODQsNiArNjg0LDggQEAgYm9vbCB1bmFsaWduZWRf
Y3RsX2F2YWlsYWJsZSh2b2lkKQogewogCXJldHVybiB1bmFsaWduZWRfY3RsOwogfQorRVhQT1JU
X1NZTUJPTF9HUEwodW5hbGlnbmVkX2N0bF9hdmFpbGFibGUpOworCiAjZWxzZQogYm9vbCBjaGVj
a191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiB7Ci0tIAoyLjQ3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
