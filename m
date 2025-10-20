Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5A8CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ah9CLZBjhsSmeO5jiYPUctbZ+5jr5iJkoQ7G6UuGf4g=; b=I7yzAKvcpVTPOO
	bcwGV8kkak7KjCghtS8dHpSp4bXiWiBNkXDp5tlHCz+M0jCD3/lvFNy/2ApPBbCZztrqSBhHModFU
	F3wI+RH6bqoczPz/b/otErVTbB9s1dP/iN56a/GHo83+cHRMjps2c2iishxDshPBLDzZvvmIK2RHf
	C6J7eBEsfoy8F47hf+FLQmSYiNbFTVznly5feyek8hwQpWR2j1l3kz5a+YOjI7m149PGzw5RkA1Mk
	801rJNLICh2oyMc3nKj2SDQuWDrrAZKorx+OoLYb82dstKvQ6oqM40iKSM2f2B6m6tbL88vYvUecr
	4GpLa17DjYTBJ3smi9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt7D-0000000ENGw-2HOJ;
	Mon, 20 Oct 2025 16:52:11 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt7A-0000000ENE0-2Xaf
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 16:52:09 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-938bf212b72so189181039f.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979128; x=1761583928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTOagx7mvvjlab8+UNiNCbZ7xK3rTGi2vCmorF9bL6Q=;
        b=hwfJmeHiR67cxxYsbwUZOV8+ehZxP53vALiBuBlDT+OPNwELFXUrzRVdZ0UwMnJam0
         3LnQcHb3NJcAggGcVu1tAQn4y2Ru5w/fWFGGIc7tXUMyxFmDDUh7V39gMQkHtNEEFrxP
         xIHLoLfuzVoCw9/gXhwuyX8oJUB5iDegYLZrz17xpj2s463k4mIbrAVm+/lHRle+onL8
         NkANW+MVtrrfmxnNtag+VtcDBF/l6NbdQAk+1RKZRZRnK58N7UYEQhZ0234ShOLgfOhm
         hTSL0jaQPxejWQPoAUy6TptnPnGqyRsu2UMagO3J/HuqAjrNrlppNEQNdRWp4GkoIJ88
         Vtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979128; x=1761583928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTOagx7mvvjlab8+UNiNCbZ7xK3rTGi2vCmorF9bL6Q=;
        b=VWD0i6UHOhvbxA3FrLc7N0UM8yLZI+j4AQbusqaRBNi269Ulex8+qbo/Y92gZKCvat
         6TospRieDgbLwRXcSqkmEzpL566GUW3N0XiAqCMiSlX9CwKabalP5h4Amo5RzdTSdnaC
         1TgSe/5TjEpzq5LUke+vDRvvIr9oEK/1dPKhbunxlYReb3kEPtEJciLEoQoYdgqYZTGz
         IQ7rFAaIcm+Ca8BqF2tX0E2z4gDk9TNcX2m5f0KUHWWG0RofylzIqN+CT4q8tT1uIbwf
         LftkI5YitZL6cp8VAf2pv+hANzhOKILe/alTBn1B7zaIKibAXQGVlTGQD3VIUMUxSHNO
         oEQw==
X-Forwarded-Encrypted: i=1; AJvYcCV1gsg0E+87m2o4K/HE7uZbdSl6B7H5na7ewRm/2iSZTqJhxu1Sd2+9cYN1Caw7xTPW9qRuFSGFiejSrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPQn2X/a2GJxcZCuHTZge7rd37zqJ1twbK/xGirPe2dOjJiAbS
	9UfxCQzhs1zQAOJp7vY/o4xdib/QOGk3VQaEhW5AaG/pam/Jk2VKog9w/aZUk1ct41Y=
X-Gm-Gg: ASbGnctQTuwvMnK2oF0oMMphq+sKvYUxtGIK0XD7w+cQhzDMkUr1Xjl5j3Z4/L4J7zX
	I6OIEZ5WJWLyJFXGnW/9hBCa/wQPOvYn1WiGUTCKTzmqFHAdOMR0arDZ7LknSNKp2pZLsV/NKGI
	7fMVnk9LrWrz/Vx1C6vGLCxB+e9Y2AMY0UtzsNBfrHwnrLCBUGrtt1w+2zcUegyWwp3uBWfVLZ3
	nMDDuRrQGEqJ4fqFfKgpvlZhoRrXKCcmzYrNte7/Ezdk2wJ49SsphO6/U+DnLviJ+4dQmUJnJhn
	aOHmP8kxDPJlZt4rbyLDqBSADq+nbPZ0IpmFIO3W1w++DlehBhRJCDgace54izPC4HPdIIe8Knb
	Hz/iJfd/adHGl7OxJFp6Sza08o2ltQmHfkikoxtOBvSQPju2WwtAd0eulKkuelsMu0IXW9uMwRl
	PzTjztiSkF6wOo8x6Bxm5RkdTAUYnjMiNUFezZZXeOViZ0IKw+cO3zxw==
X-Google-Smtp-Source: AGHT+IHY1lIklOLT8YiqHf9RVDuR1yd+ypvubmcb+paaE3pfP/eJoAmmNPnDVT26Haw2R/FsMZwu/A==
X-Received: by 2002:a05:6e02:2301:b0:424:7ef5:aeb with SMTP id e9e14a558f8ab-430c526b27fmr218825965ab.17.1760979127806;
        Mon, 20 Oct 2025 09:52:07 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:07 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: guodong@riscstar.com,
	emil.renner.berthing@canonical.com,
	geert+renesas@glider.be,
	fustini@kernel.org,
	ben717@andestech.com,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] riscv: defconfig: enable SPI_FSL_QUADSPI as a module
Date: Mon, 20 Oct 2025 11:51:51 -0500
Message-ID: <20251020165152.666221-9-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_095208_679030_E6B9651F 
X-CRM114-Status: UNSURE (   7.99  )
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

The SpacemiT K1 SoC QSPI IP uses the Freescale driver.  Enable it
as a module in the default kernel configuration for RISC-V.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc2725cbca187..48afe30d42e88 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -158,6 +158,7 @@ CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_MV64XXX=m
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=m
+CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
