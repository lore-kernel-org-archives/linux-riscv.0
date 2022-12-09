Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D78C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 19:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yKMkkUJvO5OmSkMw/qgiinqUyIg8MVqRdBWTc69dDww=; b=f9oKT0cjMghRjYhdTQFMDDeFS+
	+K4uqCiiSTNAR70azaKqh1pPPMDY68ZQeh1TyZDPeE0MRA3DQFlcc6Zj76TzpaNMzLgSTzxX/R9Xu
	YLbwhlgSbEeGRZgj4zT3dCnQ7FRic7ldsrUWq80BfQ7iTgKH7XrnEztZapBu7+t85P8Aans6oP18G
	qZuQSKKhgn26gThcA9xKhcN/ibsEACUBv4dmUbYHLiAJv8Kfs0hR66r1a960Y8e1a3CPDF3zw32iN
	/+rIIwBEbXneVECPG7RYn0I4NQJ7LK0OiyUghYH7nTZhVLNtdmhuuiER+s9NVDuHZ8kTAUMRFiMGa
	N9M6Na4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ipe-00AfCs-FY; Fri, 09 Dec 2022 19:14:50 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ipW-00Af9Q-Ie
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 19:14:45 +0000
Received: by mail-pg1-x52e.google.com with SMTP id f9so4156686pgf.7
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 11:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ng1RhCjjgJxlAMj/eBzYgJZBujugnuk3KFNVzl7SR1k=;
        b=kuax1zp5PPVbbsMHx2tHlga+RouRPVqfrOzC/greEof/sWS5OJk0Sv8nj7QYJ6M1gw
         PilOoJMZHMiT3V1TlCMFSX5AqEQHr338xZVW7fusZymU0TB8wmrdz2g0B+9/zie+lK2Y
         xZ919NLbiquoq5tkuXvkIkwTk3EmbOMd7azOUmxGo3N3UhUNImEIYvuIXM3jsLhFOKYX
         yfXdJRomn9w8iKq1+t9WMJiOsB17O+m2k4qgHkccR701ksF+pS8cGxBlFbbK+EJZZS3H
         /ktTiZ6TjyU1i5JEdvtS31OUpfvAr99tfChC4CGMk2wV2iTaNziUlFOhGZjZ+VsgR56G
         xuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ng1RhCjjgJxlAMj/eBzYgJZBujugnuk3KFNVzl7SR1k=;
        b=MuAyl7JBR/zmXD1UQ22yeQi26BAeKDA+DyZBSF52aM2d4iYUNLXArmxdwzZZHeNPtq
         j462fpLwMk3vpyTDaVQZ9AusaG4udvw7SSfmTHQao8DB2TF2I+7q38tf0x5vfOAC3irG
         UuaJWETYjrriqfeS9swt9+DcDYayVT+TjLqEYIqgbVfqxPrEsw56QcfXox8MzyAyNtN7
         7mRtQGS4X+C7+jLRPK7WZ967DAd9Oufql1u7K6YvWAWJItqPWuQ68JCDuCd9Wsail2Eq
         63APBjITSFK2QygvxTkwMqlbLnD0OgTeG8nncvfIOhQg7z+9x/uPoqW3pnvwXGc9vPt3
         CQFw==
X-Gm-Message-State: ANoB5pmgpVkEbY2G9y1n6nOzRDUv20AqEpX8tSroh1lY96rVARX0+KOu
	ggfhQNOJUGGiWNjWV8d34g9niA==
X-Google-Smtp-Source: AA0mqf5xdkWcge2HsPPTKQw/T0PiZ1TlDl+mmQnZvW92kI0eqJDFGtO9cNkOhYQvH9PMI4ZRWj9HkA==
X-Received: by 2002:aa7:8589:0:b0:56d:74bf:3265 with SMTP id w9-20020aa78589000000b0056d74bf3265mr5592710pfn.19.1670613280696;
        Fri, 09 Dec 2022 11:14:40 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id x3-20020a626303000000b00576ce9ed31csm1556787pfb.56.2022.12.09.11.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 11:14:40 -0800 (PST)
Date: Fri, 09 Dec 2022 11:14:40 -0800 (PST)
X-Google-Original-Date: Fri, 09 Dec 2022 11:13:40 PST (-0800)
Subject: Re: [PATCH v3 2/2] mailbox: mpfs: read the system controller's status
In-Reply-To: <20221123175652.327859-3-conor@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, jassisinghbrar@gmail.com,
  daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-33aa5a63-85de-4a94-a1d5-d4507a0f55c7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_111442_885167_62456FFE 
X-CRM114-Status: GOOD (  36.12  )
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

On Wed, 23 Nov 2022 09:56:52 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Some services explicitly return an error code in their response, but
> others rely on the system controller to set a status in its status
> register. The meaning of the bits varies based on what service is
> requested, so pass it back up to the driver that requested the service
> in the first place. The field in the message struct already existed, but
> was unused until now.
>
> If the system controller is busy, in which case we should never actually
> be in the interrupt handler, or if the service fails the mailbox itself
> should not be read. Callers should check the status before operating on
> the response.
>
> There's an existing, but unused, #define for the mailbox mask - but it
> was incorrect. It was doing a GENMASK_ULL(32, 16) which should've just
> been a GENMASK(31, 16), so fix that up and start using it.
>
> Fixes: 83d7b1560810 ("mbox: add polarfire soc system controller mailbox")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/mailbox/mailbox-mpfs.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
> index cfacb3f320a6..853901acaeec 100644
> --- a/drivers/mailbox/mailbox-mpfs.c
> +++ b/drivers/mailbox/mailbox-mpfs.c
> @@ -2,7 +2,7 @@
>  /*
>   * Microchip PolarFire SoC (MPFS) system controller/mailbox controller driver
>   *
> - * Copyright (c) 2020 Microchip Corporation. All rights reserved.
> + * Copyright (c) 2020-2022 Microchip Corporation. All rights reserved.
>   *
>   * Author: Conor Dooley <conor.dooley@microchip.com>
>   *
> @@ -56,7 +56,7 @@
>  #define SCB_STATUS_NOTIFY_MASK BIT(SCB_STATUS_NOTIFY)
>
>  #define SCB_STATUS_POS (16)
> -#define SCB_STATUS_MASK GENMASK_ULL(SCB_STATUS_POS + SCB_MASK_WIDTH, SCB_STATUS_POS)
> +#define SCB_STATUS_MASK GENMASK(SCB_STATUS_POS + SCB_MASK_WIDTH - 1, SCB_STATUS_POS)
>
>  struct mpfs_mbox {
>  	struct mbox_controller controller;
> @@ -130,13 +130,38 @@ static void mpfs_mbox_rx_data(struct mbox_chan *chan)
>  	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
>  	struct mpfs_mss_response *response = mbox->response;
>  	u16 num_words = ALIGN((response->resp_size), (4)) / 4U;
> -	u32 i;
> +	u32 i, status;
>
>  	if (!response->resp_msg) {
>  		dev_err(mbox->dev, "failed to assign memory for response %d\n", -ENOMEM);
>  		return;
>  	}
>
> +	/*
> +	 * The status is stored in bits 31:16 of the SERVICES_SR register.
> +	 * It is only valid when BUSY == 0.
> +	 * We should *never* get an interrupt while the controller is
> +	 * still in the busy state. If we do, something has gone badly
> +	 * wrong & the content of the mailbox would not be valid.
> +	 */
> +	if (mpfs_mbox_busy(mbox)) {
> +		dev_err(mbox->dev, "got an interrupt but system controller is busy\n");
> +		response->resp_status = 0xDEAD;
> +		return;
> +	}
> +
> +	status = readl_relaxed(mbox->ctrl_base + SERVICES_SR_OFFSET);
> +
> +	/*
> +	 * If the status of the individual servers is non-zero, the service has
> +	 * failed. The contents of the mailbox at this point are not be valid,
> +	 * so don't bother reading them. Set the status so that the driver
> +	 * implementing the service can handle the result.
> +	 */
> +	response->resp_status = (status & SCB_STATUS_MASK) >> SCB_STATUS_POS;
> +	if (response->resp_status)
> +		return;
> +
>  	if (!mpfs_mbox_busy(mbox)) {
>  		for (i = 0; i < num_words; i++) {
>  			response->resp_msg[i] =

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm assuming this is aimed at some other tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
