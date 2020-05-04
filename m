Return-Path: <SRS0=z6m9=6S=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CA3C3A5A9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 May 2020 22:10:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A28D207DD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 May 2020 22:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FFDNUtMh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="MmB3Bq0S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A28D207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jZLyHH0FOwiw9uaFhugdV/Ka8e6kSYMG1voxw4n6zE4=; b=FFDNUtMhZiKCPI
	5tmhj6JYcEsPn0RsR0R6u/bNXtLZicURYmv7yHEo7vFTYsJMwIevQ9AwX8wzwC4XG40nJbyNYXsHF
	wfWTx5BkFmTL+lQCa+MvWnHQl3qV9LcU/uB9vvG6KLtpklX8QyWWMTWfszrQyWnaAqX0mELZrjaZr
	JE3T7N9Gz6NZyE9zbuLKilmoA447LNFvzeB8HP5+SEeL5n0bj1MERR7s/r1+wCs2OYiv0uiQDY19t
	ezhsOIQ2p67gPcPr0t+fO32xYRGBlAd9byXjO8G7n9HBLZ+FBRq+pgwFGVLYabHyovnIBrVu0PJqv
	XpjSM9Cr4VHOtrqYlFSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVjIC-0000t1-B6; Mon, 04 May 2020 22:10:28 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVjHx-0000Z5-70
 for linux-riscv@lists.infradead.org; Mon, 04 May 2020 22:10:14 +0000
Received: by mail-pj1-x1043.google.com with SMTP id a32so91321pje.5
 for <linux-riscv@lists.infradead.org>; Mon, 04 May 2020 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jZLyHH0FOwiw9uaFhugdV/Ka8e6kSYMG1voxw4n6zE4=;
 b=MmB3Bq0Svs+rjKoFS/i+2LTtsnNZGfywx63UfiAkbK3FtnIoF8p6fmj2XjUiW4bUb6
 R8YZEMWFy5WnJTtNGzSql1UoGmkMYGd5IxZd2tzhGtnXIfgsgstUTckYT01tdRSqWn++
 mE4FIZRFIEQYZtldnyT6vlylljYv+EXsOfX592bKErbvK9ynfEThFGY0j8+v9yL5+AYn
 2L8UtEV8btm8yMsHYX41rEU4NZWACwluL1ZQEUck3x1d7WUsJVlADU7tkSZPVlOqRfbF
 zWt6tyEH9zFe0oc93kh+0ghawzhaIp4RGYUaOCMuidQUWyUUfKEqoe0qMA5/9tnalteu
 swHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jZLyHH0FOwiw9uaFhugdV/Ka8e6kSYMG1voxw4n6zE4=;
 b=f2zl7ehWxHdM1HDmH/AfWenGUk4W07O1U6BPiksf7F7a7TcAhG4WIMJC84wZNy/lnv
 XKlFC5qzn+K1q2TZxEwQq8az6/nZS0+hIe4vVHFearNlylVIs+OBD88z+lVGAVDBgRdD
 EorZzF164RaXK0wjutPotiRGp2xFCW1JQnHggk8ZE9k2RLrng4O0t4HUNVXhjfItydd9
 phdYqNug3e7qjKF9TOmwgbfYLwxKNNSTtlfdZiquZITjVH33f+7WnwC6KLW9th3PH1gO
 p9WGcPt3kK9cQJfCBa+vuJP1zw+VAtcP+v0aC2enjsTFQEan/xUeNPL3b6hrgjewxjbj
 SPvA==
X-Gm-Message-State: AGi0PuYOwoaqtNlXyctgApyab7MwNVSTDVCW4wqJE0BGxoEKRaBHJ50X
 seSY91lahELqjm7s+CnIvvGFmg==
X-Google-Smtp-Source: APiQypJJPcF0dlqI2sacmykdGez1Z2nDV2mUtw2uVa6WLfP1A1vNVDcBNDSbyg81qVrCEIJS07OSsA==
X-Received: by 2002:a17:90b:46c2:: with SMTP id
 jx2mr296161pjb.67.1588630212239; 
 Mon, 04 May 2020 15:10:12 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 14sm86208pfy.38.2020.05.04.15.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 15:10:11 -0700 (PDT)
Date: Mon, 04 May 2020 15:10:11 -0700 (PDT)
X-Google-Original-Date: Mon, 04 May 2020 15:09:13 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
 A00 board.
In-Reply-To: <1588240732-13905-2-git-send-email-sagar.kadam@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sagar.kadam@sifive.com
Message-ID: <mhng-ccfe9c83-41d6-47a0-b7bc-347573973fec@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_151013_255896_0BF1A20D 
X-CRM114-Status: GOOD (  12.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, sagar.kadam@sifive.com,
 miquel.raynal@bootlin.com, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 30 Apr 2020 02:58:51 PDT (-0700), sagar.kadam@sifive.com wrote:
> Enable MTD based SPI-NOR framework in order to use spi flash
> available on HiFive Unleashed A00 board.
>
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 4da4886..970580b 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -80,6 +80,8 @@ CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
>  CONFIG_MMC=y
>  CONFIG_MMC_SPI=y
> +CONFIG_MTD=y
> +CONFIG_MTD_SPI_NOR=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_BALLOON=y

From the second patch's description I'm assuming that MTD still functions
correctly without that change?

