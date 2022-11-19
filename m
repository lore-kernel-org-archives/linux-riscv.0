Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A72BC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkSVWlAuKn58LoeU2gVFanDnr92dWWtJ/cV+b7jTej8=; b=G/fUAivFBuqVzY
	RY2lFiCAhM1LGcxNCd+r4/DFisCQocNNwhTOUYawLg8yHgckVokPG3pwSE+XV+woAOIfWndYTI6E9
	Jw+eZbGhfSxiO9x46L2OkWE8qLQqL82dqfw4yOASq8ty6+bWcirpG6CwhnI4xJnjybXtHI3C8LX5B
	InAED7tH0n4NMkBbBs1f5au9pUmBipq6AnJR9tunAV4kToNAo4FA2scIYZi4ECUXA7YDVl7Qx18gu
	X+AsBMuch0EJKGJAouJfAGzKYMuTv3rLqRlWwdecQSBfhHVuaVQlMlM5OzZzdEgFrvM6OkOS+qjwf
	1aCVMP14jZwhwoqxnaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owMxQ-00DXcr-Vo; Sat, 19 Nov 2022 12:28:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owMxO-00DXcV-HF
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 12:28:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D729260959;
	Sat, 19 Nov 2022 12:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDB2C433D6;
	Sat, 19 Nov 2022 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668860905;
	bh=wE5OEvsthhALiWj82z3FTGHoJwibmtNBVW6RpZKEPTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e8xb/bFoMKPcdDTdUndazLOIPlFWtx82eSSFaOWsk2jxglhOiQ0bV4wTd02jhQrv1
	 7MsN5LHIlMISHv57/P5gA6qYR8GtX/9MNTfEkqCEsM0mBpsxowaBESy0BLEDDsm2Zh
	 /zh7a+sUa1lA8OKKdW3h7a46NXA4vx6vGx1zC2iU5G/1uxxr0BeHxLddqTtE24Lms4
	 RsXTtVa3QOBRGhKBB0Ltv9QJW+WsBYubq5f21Dv9F+zfOdSAAZqNJMvIKMeXso0wng
	 PRnBm+TUTt7y443jzg4e0beRHkm8T7ItN7on+hlw6mh/YVktT7kf56PhmFzizoPYG8
	 8ZGSyzU60Trxg==
Date: Sat, 19 Nov 2022 12:28:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: defconfig: add SERIAL_8250_DW
Message-ID: <Y3jL5QAI3c/joB3o@spud>
References: <20221119121953.3897171-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221119121953.3897171-1-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_042826_631792_0210729C 
X-CRM114-Status: GOOD (  15.89  )
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

On Sat, Nov 19, 2022 at 12:19:53PM +0000, Corentin Labbe wrote:
> jh7100-starfive-visionfive-v1 DTB was recently added, but all my try to
> boot it in kernelCI failed.
> This is due to a missing serial driver in defconfig.
> So let's add CONFIG_SERIAL_8250_DW which is needed.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

See here also, StarFive guys posted the same patch:
https://lore.kernel.org/linux-riscv/Y3d0tL6UoAbdhHKE@spud/

I'll try to harangue Palmer into picking up one for v6.2 & if it
happens to be this one:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index f7f32448f160..9a35ff88bec2 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -123,6 +123,7 @@ CONFIG_MICROSEMI_PHY=y
>  CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
>  CONFIG_SERIAL_SH_SCI=y
>  CONFIG_VIRTIO_CONSOLE=y
> -- 
> 2.37.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
