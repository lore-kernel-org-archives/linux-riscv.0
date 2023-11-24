Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DB8C61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBWlWUT4ZLtBpv4XlCVfAO40y9YsyO9YKEloRGOSPQ4=; b=IRx2O0IXOBqLya
	UhqegLZublJ4Ee/dAFieUk4M9KMCrMvnLDzKUEZdptPwAbAoVfNNbQ3Mk/PgX4Yt8hstP95Sdtzf1
	TuHtP2vu77untajgVG1ov1oVT2jM0A61CslgMc1NZvjNsfBoE/x5GFfyqr+hFpJUIAqdHoDboU0Fe
	18A7NCrIwiPiMD+WW88nQejGrogn3mLck8V3zGiCspnQnr9EbS7951JaRjp7ofIjVqeRG6RF8pLsX
	FgtTVgVx3wbIIod2n3OgKZ7IFg6wMEgI/O8QSDXryf+NuwCsZWYeV2SDSQa+Lxg25D8pnm7RiCCz1
	1rZ9Iq34iw1h5Mwco9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKt-006Leq-3D;
	Fri, 24 Nov 2023 07:10:48 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKr-006LdR-1c
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:10:46 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6ce322b62aeso833760a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 23:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809845; x=1701414645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bsP20n9g/LbbgzyTFqfc2H9X3ZVkLkHm6HS5kmWZpw=;
        b=mOQSAGvxXDFKvYug0fvDpBSSSajzHGFrI0QlWTb+PYmYVeJplGe4GeMH2TfIqffBlN
         lyuwnXFtoYtdBb5Uo4oS1pWNuc95bxmycqx4B/u1RGgQl4VsveiySl6UlFaMdBQ/elpk
         EAGnztPStx8KGNitkv2QjiADZkOCaTelNCnoE0uNNhz8cxiDvu2y/dKDCFVCju3gjIGI
         Ys+MqMBo/EdIResHRFzIHFaCpfNjXeU0vM4TDd25rfm9L3O/8Gzb8oprLhgkkMwgJqXP
         llx1Przo6zn6ePUuGsYw7cOivss7qt3xdVwtH0s8iTdCY723o8OHhey5RU7G1JI/veN+
         MGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809845; x=1701414645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bsP20n9g/LbbgzyTFqfc2H9X3ZVkLkHm6HS5kmWZpw=;
        b=u+W7/lHFhl8mSUjgbRkJI9GFR6Fm5YW7P99pdlAWZpK2p2xpsw5ENS03H7oK1uWme1
         Tl7/+u+XiHanja5YcBG1hmqbRAqEWt/uw5/Q9Hct28Bq6AFvA7lkS8AFAyOPsQNtgpyI
         0sHaKbw0uLMS1X5wKTDxx1XAF3UZkJAWfrT5JnmbfOMJub15H3pxshN5Fq9fNYk59+lB
         B+2332jX4clEBx+2DC8T9tvo5pgCu+9qjOcFequxPL90Xig+NrQmiJx7FiY9nTIdNqrf
         WN0exW1ZVKVGSazM8LcFM0Zdxzuh0zeVo/4G/Q0xqzXIdmq2ZyC1hmlXH1Tqzqd5sO5Z
         DzDw==
X-Gm-Message-State: AOJu0YxzGdd9cHf+NAjzgTJF3ejbcrqajgd8gwIlPXCMfgK87yofi7uE
	0VrnRbjkMw0hVge5EnjxEBBVGw==
X-Google-Smtp-Source: AGHT+IGGDyExhQ3zRmOy5VYh2TdS7wOyXrHh9UCot+XT8qVfR5TFj+v/PJ24bsMRy6r+bIsB3Xrfng==
X-Received: by 2002:a05:6830:18f1:b0:6ce:4035:b801 with SMTP id d17-20020a05683018f100b006ce4035b801mr2096169otf.13.1700809844751;
        Thu, 23 Nov 2023 23:10:44 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:44 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 5/5] RISC-V: Enable SBI based earlycon support
Date: Fri, 24 Nov 2023 12:39:05 +0530
Message-Id: <20231124070905.1043092-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124070905.1043092-1-apatel@ventanamicro.com>
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_231045_536608_4402DFC3 
X-CRM114-Status: UNSURE (   7.43  )
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

Let us enable SBI based earlycon support in defconfig for both RV32
and RV64 so that "earlycon=sbi" can be used again.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 905881282a7c..eaf34e871e30 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -149,6 +149,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_SH_SCI=y
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
