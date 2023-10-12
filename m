Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91CDCDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 05:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdCr8B7oHr25iajIgSqX/0oKpOg19tUluZV/6H0VBuo=; b=Y8TEgxofE1W85u
	0Lx86mZkJBhXQXMoxO8fvFLxLh0iIHuvLquoxop+73qLNUPK5J8vtRG7t9ximzTUSgb7cRNB2p0Bp
	eYzfZtgfWRb72OJrihCNv5dBlKojK+j0jGfcwbRB6HWCgpAyYz/3nN3rW/LirPFqYGH+X31rg13sg
	3QAAAnhov1T7SkOxoUtL5jOZ5GpiiQj1JHcmG94HkAnD7isQrxT3NnBD+s1cWBRQx+eVfauYNUh+m
	pjmU8WaNjgdESNum6xH68RCKB3glgaL+nJAjRPvwo2MWvkohFlOU6609s3pnHEowZGCC6tZdedzzG
	68gwEUf5s+CJVJEtUBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo3C-00HRT5-38;
	Thu, 12 Oct 2023 05:15:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqo39-00HRP3-0I
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 05:15:57 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6910ea9cca1so434246b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 22:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087754; x=1697692554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF/0DZOVOE1sZojsrN9hmq2DR3MNn3xhzg86O8Xb4xI=;
        b=kvm/TBA9Xdy4XeysY9yQyVeOQ2PYirahlO3PnDVLgYJtuWSHWY5Fs7ThvVqkroUi0R
         qguO+FDtGReK/zRqiS2mms5g7YOToVIG1ZmazDIyjVI9xWsUK+MscGvIKQlN1UaWk4bT
         MTc94PpFjhTEBeo8xyMCl/U4XCjc43ayBuQo3rpkf0XYbCKkqCfuaDsVVHyVUhNk9onS
         QHCFi6ZI54MDWYfif5b3agHJ5TvWaS/o6kxCjcVbIV1UUHqFDIvmhchikvuXb66ASGrL
         l/aewKjxHg25EJ9r2rpPXJo85i11hvgcZSGF3IgVaBWNtyt+jgD8Q83BxfHJHC2I9dND
         LJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087754; x=1697692554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF/0DZOVOE1sZojsrN9hmq2DR3MNn3xhzg86O8Xb4xI=;
        b=GZZD4X44TFyQY7aWKoXaa8x31lpCoG08ApUochWONhz9xx8Hhw0sdwtSKVfU6u+qTe
         a05N5QvXi86PUbmS3xV7gD9lh3tq+sTdtIYTpSRN4pqi6z1QIO3wsUlia1IBckfUv1OP
         JhgmByahOgCjiTTUDHIpc0QJzTKR80vOKYOiuiIepkvu/uL7K38UROfCyhIuv5dgqzAg
         /cGFN/c0u6NNFNF1zf/aGLqkB0kEw4+xrbbfMZzbMikL1CpLT2Mbjv7kEiQjjmteQ7I5
         EyGF75hNn4S+7DGIEHBn65opHqsRwn8f1OaMCABY7ie9Exj+kuiacZUZo+40DVdnUk0y
         qu4Q==
X-Gm-Message-State: AOJu0Ywaalpx468pRehObadlFrNL0MMbzKp3TEkNCHrIRUqtj0lBQDud
	ZyB3j4Gv+v/8oYBMkH54oB/b6Q==
X-Google-Smtp-Source: AGHT+IHHIH1Tdrtn/mSat4PHYLTk01ptLU1brEyLKx+dYtjl1X4EaH3wN0nwyAyQPO2cGFlvgUSgrQ==
X-Received: by 2002:a05:6a20:918e:b0:162:edc2:4e9f with SMTP id v14-20020a056a20918e00b00162edc24e9fmr22994297pzd.62.1697087754489;
        Wed, 11 Oct 2023 22:15:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 8/8] RISC-V: Enable SBI based earlycon support
Date: Thu, 12 Oct 2023 10:45:09 +0530
Message-Id: <20231012051509.738750-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_221555_138385_A4357349 
X-CRM114-Status: UNSURE (   8.06  )
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

Let us enable SBI based earlycon support in defconfigs for both RV32
and RV64 so that "earlycon=sbi" can be used again.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9eab..f82700da0056 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -132,6 +132,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 89b601e253a6..5721af39afd1 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -66,6 +66,7 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
