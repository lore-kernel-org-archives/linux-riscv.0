Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5C1D0E6D2
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 08:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Pd3n9Q4e2z7BOmi6v0OWM66fMQheohMFJQKuD7/RFI=; b=oi0EtJeeSwMgtF
	Ev2n5UryGHmOD12M3eHXukvOPtUO7P9XnQ7rlF3/qJPPqK6Rd45mrTVt2I8sBvmOixECVBbBSNgQl
	xUxSoPWqp75dyVvkQX0Svtztet4Ch2IG+BnFFo3Ro/OHYpb+OLymetkPbBspdd4vXPREnvbN99zlC
	urx3dTkxqX05d2/jLnLcjag36b9YNY05Pvv+8OjH+B5SycgY3RXKrXqk4HXjtOGz1lBZAsJaoNKhj
	5gR327oDhPoTpsctSc+gTL94AAAR/XtfjM7/+Ef2RwGTQkZrFFXplR4aXRglUq60+uLkG4uCyhb20
	H1/8+nIW8APZAqyAQUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o2W-00000006bFO-2Iop;
	Mon, 21 Oct 2024 08:45:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mob-00000006N75-0tAp
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Oct 2024 07:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CXvcCpfsJOPp154vFwKXQKRadddvDYDxZELGpa9JLd4=; b=NdCIU5w6sJjC+ClfUBxonfwrkX
	InnK0DbzT+OkXkFbcac33hwvHMImaFAkap4DcFYuYBv5FhDNQ3w3qMhy8wKzvAJ3e01M1oUajkERs
	GjdfRyEWwH/cAJTWuOfyjLC/u/KYBku5X09hHZ50tMAomSuX4Blnacvr7pMbVun7NttfPdxUIxTgg
	rlZeQnZ7MK1sl7T8DNK1IH+XqOwVAJ4AsGQ7bKvpbgE0IAZhWgKZe0k48q/ydyCM21fPaIjNxZJmw
	zgQXW2nzbr0dj3vpOj9glDIMYQKzXI1dg341I2//A2HBjqcYFuL79JBiAVSiKRTKrgyNjz8Qn2mXq
	3Rm40LyA==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2moX-00000007qZz-2LDu
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 07:26:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c805a0753so34697935ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 00:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729495611; x=1730100411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXvcCpfsJOPp154vFwKXQKRadddvDYDxZELGpa9JLd4=;
        b=k6nLoxUbNWlhwBghyeJHdGPt0i41fkEHIf4PhA0U600nLBU5wUjWPR7iQf54ApfJlV
         nKj9AiSUU6OPetbObln7kgn9cuZqN7epyDP90StuiuejO1QnX+Nr5fBgTCrrwMJ0nEEg
         4/DX81UEnx5pVZ2mYGCEyiaS1ukqwFCxMfq0xFxjOZin9miq7gWEYL21IBiianh/la8e
         xeQ7YHf/A4RK1V2hzbm0INYOkz6gUQZ2h29BJXWcww23aZqk2YFxPnHjWtZJdLW7KNgg
         pet/QGkEG4Z7FKi+pxH+S5DiJ5QOM2U7+NlZljwUIkSybFbM1hAfSEVjq0vQxDOUIg4o
         LmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495611; x=1730100411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXvcCpfsJOPp154vFwKXQKRadddvDYDxZELGpa9JLd4=;
        b=P91MnIhPBoOqLNVVjO07NpMkcz2mDFfL/agA15pDsbwmobq6oYdJIYNspNmhur+4cw
         mrWTkBIlM95LxNK2Ejn3RyYrqNhl9GNxLPL5NZjdmx65ID5Azm2Yryuc6fzUzsKYVKeC
         hk2VfHLxdUu1OdNm9tlgz3qkRF3FUQggGMgeGIPZSkavGNdxAzGd02lCcNMlenZdASnj
         xzJSCyTEaxZNZtyDUJeYrsfX9/MJeupPIEHspalY4jiVFXtC5JuKBXkP2Q6P6zGQ16sj
         mnULFrdxQbxj5M7XnkovaQ/rK7imqeSqZZJlRre6gt3Jgx2i5p6gQnweOCYnDdXH2kgi
         NuJg==
X-Forwarded-Encrypted: i=1; AJvYcCXzJb+VBNH1tZABA/HjSzt0ca+LJvXtxLpEpaRJz+mHZDlUUi/zrIvZEZXa72vvNepHJHlN3ADZifzfWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzRooSw/zd8N64RyZIl/MPg5dVr7zNtGXWIeTEsriyNbEDsLlB
	9NI8k1g5rXRk9jQR8U9Y7Z58z9fsHcPkbbpk+hnPYKoOB3A7yJ5c
X-Google-Smtp-Source: AGHT+IEsGe+lBz2zwyzbRMjnO083MGG92UylU4sVnq+SoC37wyN6vFExnIVCz0Vn/kD0D2CooUtaXQ==
X-Received: by 2002:a17:902:db04:b0:20e:5997:c107 with SMTP id d9443c01a7336-20e5a8fb320mr151344175ad.39.1729495610968;
        Mon, 21 Oct 2024 00:26:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee884dsm19919975ad.9.2024.10.21.00.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:26:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] serial: 8250_dw: Add Sophgo SG2044 quirk
Date: Mon, 21 Oct 2024 15:26:06 +0800
Message-ID: <20241021072606.585878-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021072606.585878-1-inochiama@gmail.com>
References: <20241021072606.585878-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_082654_359904_BD2FCE74 
X-CRM114-Status: GOOD (  12.34  )
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

SG2044 relys on an internal divisor when calculating bitrate, which
means a wrong clock for the most common bitrates. So add a quirk for
this uart device to skip the set rate call and only relys on the
internal UART divisor.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index ab9e7f204260..51894c93c8a3 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -750,7 +750,7 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
 	.quirks = DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
 };
 
-static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
+static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
 };
@@ -760,7 +760,8 @@ static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
-	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_starfive_jh7100_data },
+	{ .compatible = "sophgo,sg2044-uart", .data = &dw8250_skip_set_rate_data },
+	{ .compatible = "starfive,jh7100-uart", .data = &dw8250_skip_set_rate_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dw8250_of_match);
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
