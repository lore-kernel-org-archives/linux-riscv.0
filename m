Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FCDC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 03:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=L+7qotk/P0aYxi4BinqZB4iOh1rv06sSwMKM75oMF98=; b=m6nJr2+18PjjHqneGwQ/FULeQp
	SspBOxHdoUhCXVyXo3OpLDn/1du2k2VoZt3pY5ypKsYivq0oogMJy7br8R+rATsB+Ox97JfsG40hM
	7nOMTMIo3haKihY58QrvyWrF7hTK7EA6xZJ5tEpSPJsoXpWPnj/2QbSuCJ8CCZ0r/Hxt7jZ+e1vtz
	0dNhzF3zPoDY/suUSmeVXPwHBErlF4U6hntmOHrPPCqtELGL2fLqC7Ts1NZ0haUub8Obi90a9EwdR
	lNy3rM7B9xQ7h0tNYPZSvwLAib3ncA/W4/0KQVfYQjqV7YvYWscOv3OdFLtwPbEaisTQg59iHYoLg
	ugIxI2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poyfc-003tRX-2Z;
	Wed, 19 Apr 2023 03:39:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poyfZ-003tPw-2w
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 03:39:47 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b52ad6311so3228635b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 20:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681875582; x=1684467582;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0e/blrL6Tf9C9Zm88s7yEUaau7+OiJEMt6DtUxmn8U=;
        b=heQMR9KeF4YP7cYFKebZxUoa0zwSm6yermCbrw1yWPuH8qOnanz2PICoK7wFsHoCii
         ITyyopfMMFdHPQ3l53RQJ9R0iCJNIqSOBu8v2kGorc56fgoHdo+lwQn7Rtyot6Fc2TRr
         edENA3S1GqNaFQoyAISXSMcD9w43pa2t9HmnVeof/RNZ8rjOMFaCqEAh77zgB8EAoQ6W
         kv4VzctHo6uh6MWOsPvjXLQbUvLQo6wLB2L4hbWjvmnu6qu8dtL4oR5XBt2/YOm2Avu/
         Hj08KoyiW66V1OPkWan8ZU06NlDH8ZrKHOh5SaFHvZXODbRYM1HW4zSJDCITBvWtjQwK
         dRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681875582; x=1684467582;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0e/blrL6Tf9C9Zm88s7yEUaau7+OiJEMt6DtUxmn8U=;
        b=Txg6wyLVEeJdu4oV9+eKjzisNN96VjWjaKDMyEE6i/aCnkLSPmMpwPjODvK0DqiUKA
         vzv7fxQ8o5faY2fnQErAodGP08ZXcsxCXtroqkavhkCw4omI63r6xoQzTwKOTKrbR1gJ
         +HYdgPniCtKziPSqAWS1Q5mIqEtStKHunksBVpUcrGaqwRd27efi50GL5PT/uzRl8jLR
         Po52ip7WaW21Qze/SoEyYz5DklxnxqlfHUwBKXlhHjWnyEZdMo5n0fR9pB78gr8eLtx1
         D5nBnMIZ/OPolYNDozKmAiernTNOzbgnQsuXtFpX+TYCf2d5yZW80XmQsJ80lxy3/c3m
         RG3Q==
X-Gm-Message-State: AAQBX9esMx0AcPUaCaWbqLb0kxx7gCLzrjZ+VpvaQ6m/nnMoG+umxOi2
	ksvGxPec0FIG1aiWFf6jkbS8PtPtm9Jzl5c6XRg=
X-Google-Smtp-Source: AKy350bVWhvudAUkLl/P0TT9j1GmLD1pufJBRjFi20EeKXYqEO3qjLGawXTfX3mlLaN9b1oPB/HNmA==
X-Received: by 2002:a05:6a00:2e94:b0:63b:89a2:d62d with SMTP id fd20-20020a056a002e9400b0063b89a2d62dmr2618037pfb.20.1681875582590;
        Tue, 18 Apr 2023 20:39:42 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id n9-20020aa79049000000b0062ddcad2cbesm10270224pfo.145.2023.04.18.20.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 20:39:42 -0700 (PDT)
Date: Tue, 18 Apr 2023 20:39:42 -0700 (PDT)
X-Google-Original-Date: Tue, 18 Apr 2023 20:39:34 PDT (-0700)
Subject: Re: [PATCH v1 3/4] soc: sifive: make SiFive's cache controller driver depend on ARCH_ symbols
In-Reply-To: <20230406-subdued-observer-cbb0e2f72cc7@spud>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com, sboyd@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, bhelgaas@google.com,
  Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-pci@vger.kernel.org, linux-serial@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-8318a24b-b187-4056-ba08-3dfe2054d4fe@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_203945_949478_783E7180 
X-CRM114-Status: GOOD (  16.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 06 Apr 2023 13:57:49 PDT (-0700), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
> use of such symbols on other architectures, convert the SiFive soc
> drivers to use the new ARCH_FOO symbols.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/soc/sifive/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index e86870be34c9..139884addc41 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -if SOC_SIFIVE || SOC_STARFIVE
> +if ARCH_SIFIVE || ARCH_STARFIVE
>
>  config SIFIVE_CCACHE
>  	bool "Sifive Composable Cache controller"

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
