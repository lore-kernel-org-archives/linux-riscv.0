Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCAACD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Igg1/Pz7JxXB91N497A7jEBzgo+fMuk3Dv0eKGyfAEY=; b=VtkWUTu4d9EyEj
	Riun7L1vt2so86gWxn/diMSpM8VvePfY+VeZ3TGoUU2SILEVEaveNVbBriH+k0Ivckyo2zdg7K4S8
	Lv37f5hk4X2niG2dRJZOzI1V55SYA6CCPXEQsftDjkAs3RkGhtQ3XsPwZM+OQWR5TXI7RsATyFzti
	q4IfmsawDd6ytDrEa7OupJWrf6Z+ZThw9H2VZh+7OVR5zc0VG/37nUKAkYoH0J+DiASVQnonjTEIv
	9bcIvsRs8sDbACx7sXtPvjQ+br9PxAxvQfQ8fR7bICoyanCbxHuO13e9VPK/fwuht/LmEN+B9BVN4
	z/qZtLBJd+mOt++kkkPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzI-00000009ZZf-2NKl;
	Thu, 11 Apr 2024 00:08:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzB-00000009ZSP-1jXd
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:08:15 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e24c889618so59413225ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794093; x=1713398893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nwzSC0mjOXawHhzlfTnID2LKW7HdSbdpZLlPlBet3o=;
        b=UIa+eVqpAHZXWl3rjunHPWrS5k6oUj9VaXrki/YgPqEWxcHoFVFrsu17WdN8flpx8y
         Raw+SLfGI0t4ukyKopZXmZC/PVeYL7V9TDLgytQee/zPk6uJi63PzMo1CGBJC9zMj9cg
         2YLFdEiNecO5DhVU4qrT67k210t3LYcy8fYLqAQyWIDpHReN464bYKX1yIECkj8oKkps
         J7AaDH2WZ68L660WrHh+af96XGdccfuDw2zwM/Uw3cBtxKozHikccaY+GcB5yTlcN2sH
         q4bj8yBr9WKzsfQocZHzM8Bg2dxbgBrFShCOXOnpiSPxn3jWEsFgW+Ae98cs8lfEsVxV
         aeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794093; x=1713398893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nwzSC0mjOXawHhzlfTnID2LKW7HdSbdpZLlPlBet3o=;
        b=vscZDbfQ9gmogmYUpKBwjhFakTlQ/DUQeZ8Tky5BGOtEf+zOAHd/Rl3w5yHt5vFbP7
         K2bgWd+qaREy7SNq90wyEzJgIGCi36YWCQjXP4+BA6qL8Bh21i/hNd6g4yiCI4AddoJF
         nDmTU3ZgG2DmQPH35iWocKJeefj6w1GgI3GLG0lutuuMf1ITMqGncsGk6ckvgTUN7Fv9
         Q2IvMIzzP8seqvCjag6gP57vp3Jhy+8Z02eZDuIomtrOeaUlZlLgKKOeHguULepYIyhj
         spODd+o6JqBAVt4EYehWrppsuTQ4YRJkQQseCaupQ73WSlJcgsCsu5/YFOYS39lcmxpa
         3igw==
X-Forwarded-Encrypted: i=1; AJvYcCVe0l53xxHHkJiqkdbnhrT9j3kWqoL+oiGRWCsGOrbTBDUkZAy4Xs8VIVhI/zH9YCyiMcuWVT49DnKlJLrHJiGxXL6SUKK29/dEIhRjaVJP
X-Gm-Message-State: AOJu0YwSMPNEQmHN5cIC28eGKxEx4ivG1fSOnuFQiwPApVdaMSHO//Ni
	zJ6xkwRmDrrnCfrQn/UYo2k3UNbVzj6WFuhCIoNrrOkVUkzXMQ6hxWFRDOuK62U=
X-Google-Smtp-Source: AGHT+IG6OqYaJjg7MK1R6d7hiCeHot83RH1wCuW5h1sC+EdY34oQu3GEIDBFrBS/g+puRrw/WL9vMQ==
X-Received: by 2002:a17:902:d511:b0:1e0:b62a:c0a2 with SMTP id b17-20020a170902d51100b001e0b62ac0a2mr5130331plg.51.1712794092857;
        Wed, 10 Apr 2024 17:08:12 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v6 02/24] RISC-V: Add FIRMWARE_READ_HI definition
Date: Wed, 10 Apr 2024 17:07:30 -0700
Message-Id: <20240411000752.955910-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170813_514197_23E64C10 
X-CRM114-Status: UNSURE (   9.26  )
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

U0JJIHYyLjAgYWRkZWQgYW5vdGhlciBmdW5jdGlvbiB0byBTQkkgUE1VIGV4dGVuc2lvbiB0byBy
ZWFkCnRoZSB1cHBlciBiaXRzIG9mIGEgY291bnRlciB3aXRoIHdpZHRoIGxhcmdlciB0aGFuIFhM
RU4uCgpBZGQgdGhlIGRlZmluaXRpb24gZm9yIHRoYXQgZnVuY3Rpb24uCgpSZXZpZXdlZC1ieTog
QW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KUmV2aWV3ZWQtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgpTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9z
aW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAppbmRleCA2ZTY4ZjhkZmY3
NmIuLmVmODMxMWRhZmI5MSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmku
aAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCkBAIC0xMzEsNiArMTMxLDcgQEAg
ZW51bSBzYmlfZXh0X3BtdV9maWQgewogCVNCSV9FWFRfUE1VX0NPVU5URVJfU1RBUlQsCiAJU0JJ
X0VYVF9QTVVfQ09VTlRFUl9TVE9QLAogCVNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRCwKKwlT
QklfRVhUX1BNVV9DT1VOVEVSX0ZXX1JFQURfSEksCiB9OwogCiB1bmlvbiBzYmlfcG11X2N0cl9p
bmZvIHsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
