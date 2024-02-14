Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51593C48BC1
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 12:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MjBDF142sANNtmttmdHDgjzRzRm1gVpkKXhMY7A5K7g=; b=2UWwoEYqF2VUBb
	dvKNfw5NiPVMM6WmO8ynEqC6D0/1q8qQTEWn52zTlYLS3ifJG6jGlDHAX6mpu1qQgheBRvTz1snd6
	fM94l1z92MKIeXIiAJOTmEJI16sy+3guauFzc+lNIa648M215ynh3gPmivDU4jKOyfVzCq8lfl0h+
	qtzAXLzel+xHx5/oTHVQdvMnQ1ZTS5Mssc6yVdmPZVMR4/hckA+8TrZX0ijvbZnnYFViMmmeUH5Ii
	hE+Iox1rB9TBw51C02Cxgrhf+VyC2cUDUxAG5/yjtnsTt/X6bdjtR2/SqlwikXD3BE1fBq5/455ny
	ji9bRSjy7netix9ivw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEWg-0000000Cr43-2uSB;
	Wed, 14 Feb 2024 12:38:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEWd-0000000Cr37-1kGb
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 12:38:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d911c2103aso27683785ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 04:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707914285; x=1708519085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iD3cuXtEG7eHzyqCNYQgPp1hH9CYhg6P7cRdMsq1rYY=;
        b=DZ3VFa+B1m0COREmtUjCIL1AVHimCMscAgvxp4IWYyp+OGznqJqxkRe+0WU7cJoMrf
         fmBIcKLgQUfMsIlU8zh+4ZhJklyDGjijzICF2Oblx2kqrYIYjGAQGZSjpHJx4JyClYPf
         fMB9m1x44CXWFoyr59KFPrxD1dJr2oxl2HeElR5GAuM0Kx+4CBaz5lpoSXHWg0q4lu1N
         T8rD9dYUarLTc0yJBiJrI3a3O8EF/jKrrGLFpZATB/wvJ5bLo9Z4V4sicPGRZB/LoFLz
         Di4cpxZ/t/9MJpTTDocG3bF7VizfsZzGhSTUss6kPmx0epbQLx/QRYiER9zsJAtKkGMQ
         eQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707914285; x=1708519085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iD3cuXtEG7eHzyqCNYQgPp1hH9CYhg6P7cRdMsq1rYY=;
        b=mHr1AXQpwu3ZlIful7AXN73FhJC7kdVWlklHuzfbaJiQnR2YdgbTZZoPT9fxC7RSGQ
         eknQQFlE3eJMA95sZu7447LM2ixclDzcLR+d6px2dNDC4JGzvVPTF11xxF5aavQS7R6y
         vGO9ZtD9cbUVnnso0IThNIzcN2sOjkvOgY3nyRoj3au7XrUjIUoen9fubolu3uajVRcj
         +GBcYtGa/wZT6cnUMTwcENlE7E0/FsUtFGJWQpwJksgGNaF/xa+HomIqkAC5z0FRM9ry
         VxGPUNE892xnDoXZx4Khmay3+qXTtXuRgATIdSJ9Z6rhFvJvY3+sceOhcVsmqByGPosI
         SfvA==
X-Forwarded-Encrypted: i=1; AJvYcCVV7pKICRjfhhyRjsULQMFGM5he4H6souwCHScG1lXe7LKXV9a+UNzxaIePAJTwZ5bmHBThSN2V+MCQNqG3s7Gzcc3UrRxdjfIuU7plEijp
X-Gm-Message-State: AOJu0YyF9Ff6H0a50rbdaa9nNz3KZbfdPqLXsi+lg+FMYM7nGojkKT26
	A8SuEsh/f+S4V6Yxm8re6e8rUQ9thfp7uc7TEZJb4ZbFbtCx1Tcxv/YeJP6aVUQ=
X-Google-Smtp-Source: AGHT+IFTw5RXXW6Nviw3HgBB2tAXtXFmyAmPUcr6f2y5ZPZmWt6NKLCHnP/2J5spjEjEEYGaO/fojg==
X-Received: by 2002:a17:902:dad2:b0:1db:299e:2409 with SMTP id q18-20020a170902dad200b001db299e2409mr2740913plx.22.1707914285501;
        Wed, 14 Feb 2024 04:38:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5cE4cGphxkpfqoHCDjRDQGwH9kyBOGqRNO8ol/US87I9xoe50dsAFuGlj4hxA0+kAZf5pPJWDqNEkeC2RIj3Vvt2KJcYCbWMysCaqHa5OwJh7GiVKlFO37WlvSiT/srsA4NwiCgOfjMlt8HDufJOraEaEttR9Owkusc6QvBL2JhtrHkgZup/cXkyIGWGjprYtxQoHfxCezRAtyXJEGyTDSMeKJd4F4t3HuwNTiFJ6AvmIt3uO7rSFwiY12zIOneCAodd5/6Ti/S5czsPooP91jZHSND8cl0vaSaVU1cbyKG3jx7CSUoq1us3gpQAs+7CQlbXfZl+IfEk1ibVJBOLvwFWkfETK414IR/DrGdnOtUwQQS0kDztcTKFOZQg095iz1hX5LOowJ0Pu+F3y3NEoPxVUbesMl2OIALDao83ElpDxCX4HG6WVyvJp5w==
Received: from anup-ubuntu-vm.localdomain ([171.76.87.178])
        by smtp.gmail.com with ESMTPSA id o20-20020a170902e29400b001d9b749d281sm3041419plc.53.2024.02.14.04.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 04:38:05 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/5] KVM RISC-V report few more ISA extensions through ONE_REG
Date: Wed, 14 Feb 2024 18:07:52 +0530
Message-Id: <20240214123757.305347-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_043807_483322_69DBA809 
X-CRM114-Status: UNSURE (   8.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series extends the KVM RISC-V ONE_REG interface to report few more
ISA extensions namely: Ztso and Zacas. These extensions are already
supported by the HWPROBE interface in Linux-6.8 kernel.

To test these patches, use KVMTOOL from the riscv_more_exts_round2_v1
branch at: https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_more_exts_round2_v1
branch at: https://github.com/avpatel/linux.git

Anup Patel (5):
  RISC-V: KVM: Forward SEED CSR access to user space
  RISC-V: KVM: Allow Ztso extension for Guest/VM
  KVM: riscv: selftests: Add Ztso extension to get-reg-list test
  RISC-V: KVM: Allow Zacas extension for Guest/VM
  KVM: riscv: selftests: Add Zacas extension to get-reg-list test

 arch/riscv/include/uapi/asm/kvm.h                |  2 ++
 arch/riscv/kvm/vcpu_insn.c                       | 13 +++++++++++++
 arch/riscv/kvm/vcpu_onereg.c                     |  4 ++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c |  8 ++++++++
 4 files changed, 27 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
