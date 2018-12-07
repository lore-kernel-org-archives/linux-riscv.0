Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98188C64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6237420672
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1Gpsw20";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HS7T7XYQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6237420672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Z+bBlwBTfA6ffQEJBFWJBWG50eJU8P42VV33fSqBNzo=; b=G1Gpsw20VfseEu1UKrlRxwhl/
	o4paqcQRDHF2qw/9TnJ99MVjRm5QQfmP4/sHYOy7kayzDPItrIaBOmj5TEN7UlMR99NO/lCoQS+mc
	cebnx7Isi+UrVwEcfNdhhY9k8XNarC3q+fjOeQmX1g3bSFTtA0en2VMgkucXJIZ2dPBfH4C0XvWAO
	Jvd09whbJesrwB0G9wI2rCVw2FOrlh16kO3M9YQ4AcKtd2MxVlfeaNWcNhqdHTSQbbEBLxHC/WJ6p
	MnRVqzpLIgn+PVTKDwtzfcB9TpLNdoFy9oYcqBex4zIvC/5YRulIyDEOHTIAIHy32dGvDDZUwmy9g
	kzUGQkBXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVKu0-0006DA-UY; Fri, 07 Dec 2018 18:31:04 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVKtd-0005mc-6q
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 18:30:59 +0000
Received: by mail-pf1-x441.google.com with SMTP id w73so2317114pfk.10
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 10:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=R9PUU0FNjTSFmRmOZPuikthkbKAg6d5AV4SisW2jsDs=;
 b=HS7T7XYQ8aSTb3k0jPHZuYP59cXKfdSK3+6dfe5Y/LfrLOzdEzqkQUwmrzYv5/4+41
 9OI5yukbDg8tyWwW8eS4do/1SS7jfnCkRE/ba4Je0ejBWCYtrfSTH5v0xrJJrTDAYPit
 VrgWKVXE0Cwf5YIq3d0hHmm2AUdlUG3Asy44BLBWx+MK/S3aisfA6lCNAiLY/R4lI4e1
 CEGF1Kb0+y8vk09x6hEHmxsr6Rb6cs5PEcwerk0YuKR/r1ElewYqSXoK+w3ClSTibOVB
 Pmt9nLKY69G/0rJ6QNHBQlrct4oKiENvWkdxX4WvzzPeC/u6HHv/0JD8SEO2RY9P6hVE
 cTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=R9PUU0FNjTSFmRmOZPuikthkbKAg6d5AV4SisW2jsDs=;
 b=gtGKy65mo9vDTlmjOuAOC232pMy9SUxTUdRGA7AcZKTK+ekvsGmeBdgn12Z/jF8UBQ
 0Umocfh8yTMzNm8SrXV9zb3bPfRZdyzs6GCIWS0wzqEUoGXkIhU+QISdYcjlrbrVQHKX
 aYbJJknDFZP7RtVNp4uCj0Y1SHX0ObuPSj/mCOuNNczsufxcGmbmi9M6cC4LuvTlMSjX
 jJ9bCN8oixfqev7l0pCmZSGJ2Z+Qr6PwPT0N6ObFgY7Dt7UxP0RgXZbOb9/rjmf0ctR9
 sWFoQVGwamatkDe8iYc9wvJvsDiYRJANOUoeaJcvBAOiuU547NM79ejFkhVsRskTtwGv
 R7zw==
X-Gm-Message-State: AA+aEWZqviHy6xetPcaGVcnIff/9e/vY+EgOQARzh7rQpH9OPEZ5Q4Mp
 BYGcAYJpHrvZd3CMZwReTnO4mw==
X-Google-Smtp-Source: AFSGD/U04cLTf3NhnXZ/uxjhcDVRmAe/A414or6dW+sVRh4tbHY/hOzm5qc3027mjItIGLVgvUNQuw==
X-Received: by 2002:a62:824c:: with SMTP id w73mr3284033pfd.150.1544207430782; 
 Fri, 07 Dec 2018 10:30:30 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id t21sm5268636pgg.24.2018.12.07.10.30.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 10:30:30 -0800 (PST)
Date: Fri, 07 Dec 2018 10:30:30 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 10:20:29 PST (-0800)
Subject: Re: [PATCH 2/3] RISC-V: defconfig: Enable RISC-V SBI earlycon support
In-Reply-To: <20181204135507.3706-3-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-7d4e0657-9343-4a8d-b24a-3ea0acba45db@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_103041_482330_32C6A9AF 
X-CRM114-Status: GOOD (  15.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, aou@eecs.berkeley.edu,
 Greg KH <gregkh@linuxfoundation.org>, anup@brainfault.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, linux-serial@vger.kernel.org, jslaby@suse.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Dec 2018 05:55:06 PST (-0800), anup@brainfault.org wrote:
> This patch enables RISC-V SBI earlycon support in default defconfig
> so that we can use "earlycon=sbi" in kernel parameters for early
> debug prints.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ef4f15df9adf..f399659d3b8d 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -46,6 +46,7 @@ CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>  CONFIG_HVC_RISCV_SBI=y
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_DRM=y

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
