Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA50C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZlYlHX4XK0GPdDSmvyR/B7PfHvFizon/Zb/zi5MtZ0A=; b=XTvOwC/sjUw3qD
	+OVRgWhOUqOnOwSBAk7Nzv1NZGcT/Dhf7TwXZfDsAmJ8hLcoXm5dOrmH63HZLQ7g8S8+JZmPSRbRM
	fMsyukaiV9AgOmTLS0bZXLx6AFWWsn5qkNKMwd+6qbJGGfHAuMCNzCZOIJtnyHecdR1OyD5RN4MOk
	kJg3pDxiqNOHnyOX+WEPEvHhaqeEOBoe07NMBGmkvm0rGHfRSaKdfsPdJ6+xAoFiaLbkgZr01mH4H
	emsXBgJNgiWaZqLYMQXnScRRWfNM+rYPbacPPr/WJr821eA7DAsWpM+TQc/BOrBxQxzmJv5DUC1IR
	BTOc8GldF6yVZRZUtS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPUaa-0051xi-1R;
	Fri, 28 Jul 2023 21:01:32 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPUaY-0051wI-08
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 21:01:31 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6bb140524adso2093578a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 14:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690578087; x=1691182887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NfiXyqjOsuhBJ7gNzyGFQOYN9/v2M7YPA+xZ8F8OLCE=;
        b=DE5ugsNM9Doc3yveWcisFKCkH0mNaPI+BE0Mcedw99qW2USuJBMStQNGhvUERkv4Iq
         wjL76GT03yGk3EP9CP37Yk+9OTP5t0ry5Paum3Z3Dxl3gU7LMO+CtIy4EBMUC16P62q0
         h1O4wVHgNBpNsZhuSdpCRiwbm9mnepJeQQb+zcOINfSJcub60B95ZO6YDGaQmDoavdY+
         m4bpWWJv4k94RwVrsTY/6BhIMUEIX7ud0F2JtBL579o7E+aTUjqyBNw8j3+JsVgCF7ep
         OwDMH2Y7p6Ga46hQH1ZbJMxFEWWKvP3Vopro/wbacvgUDVtPoPXfatNVwPIcrvAwDlXx
         HaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690578087; x=1691182887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfiXyqjOsuhBJ7gNzyGFQOYN9/v2M7YPA+xZ8F8OLCE=;
        b=OSFaVJ7uR10Hpb4b2nhMhUIu3/+XWkrEYwOhvih0lEsQBoL2I4mD/H6wAn0J3Zcpp6
         Of4A2DrBDcKd44q+xoo9Z5J/J2AH0TkMJgC8B0I4OOjVe3gLb99wFKxn71iEv8c2DKQY
         DoaguCtjphHb5wCwHGIJK1NvA1WNg+hWIBozR+QWuFXIzHJGfRTlA/Xtz1szn0uPivax
         17nDjak5IicmQWU81axzaldlRl1nhSmbqM9qiWOELhqB/C3glBxYQPu0G5rwlcSzFg7u
         OtbGQ+/zL+6pObFX6vNMMjp2VRoGy3bcPSg7C13yIgUGZubqHEc3Z3MhkpPLAowvQEyu
         d1qQ==
X-Gm-Message-State: ABy/qLbesj076EWPdJzipLxbwwlujbDcFL+wWQecxgwP8AdP0iWY0fsg
	gS3bAQz5rHAF9OifWtBdY8vD/Q==
X-Google-Smtp-Source: APBJJlEnC6e8HublhqTxll43F9VC6kXXC0q22Q7/XrNujEjKjuYqyCI6oySh7bDLW+XpyVF1SWmQ7w==
X-Received: by 2002:a05:6830:1d8b:b0:6b9:6210:9014 with SMTP id y11-20020a0568301d8b00b006b962109014mr3761688oti.29.1690578087725;
        Fri, 28 Jul 2023 14:01:27 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
        by smtp.gmail.com with ESMTPSA id n11-20020a9d740b000000b006b9c87b7035sm1987769otk.18.2023.07.28.14.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 14:01:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/1] RISC-V: KVM: provide UAPI for host SATP mode
Date: Fri, 28 Jul 2023 18:01:21 -0300
Message-ID: <20230728210122.175229-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_140130_092651_DCC7C655 
X-CRM114-Status: UNSURE (   6.20  )
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

Hi,

This new version is just a rebase after the recent changes made by Anup
that landed in riscv_kvm_queue (introduction of vcpu_onereg.c). No other
changes were made.

Changes from v1:
- rebased with riscv_kvm_queue
- v1 link: https://lore.kernel.org/kvm/20230705091535.237765-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (1):
  RISC-V: KVM: provide UAPI for host SATP mode

 arch/riscv/include/asm/csr.h      | 2 ++
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 7 +++++++
 3 files changed, 10 insertions(+)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
