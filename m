Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BD9C04A94
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 01:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QaVa1o/1j14CYocV7M+/VUHCVV46wytV+jMpQzOeak4=; b=fvd5r52wsgMTyX
	0luT4XhA/mN0XBunfRo/Qe8pbNOXucyMs7BeDaEXAiisI+ePdmM6Q55cbWLoR3CDv0S7nU6hBxnhf
	p+foi6oFzRhN7GVSiy8We+aEWctFhtCYiG8fq61y8yiKPJVGJx+2e4dG5uPt22rGrv7LOWxLcArau
	qJ+u34RJp9S8SVgrmmsvBKX0yGunOmTxxaIw5NvSO72iF/fMCddwiMaNxuIcBOBuk3Ivi8rFPuLob
	NOW3Yj9kpugNkEGukUGnB7VZUMeyi8GXxJnBnTzukSiNgX1w11ru9WESN/AetFEeMq5aRmZgTSpJg
	u9tngkSPyB3iKZ3Xp55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGrY5-00EYcl-1n;
	Wed, 05 Jul 2023 01:43:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGrY4-00EYc0-1C;
	Wed, 05 Jul 2023 01:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=+CIieYmb6mVRTsNwMAL6FWj7Hi46927MygaAgC/G2u8=; b=MEXEtRtfTEi15i1Eoa1kMD7ZdL
	cuP7UlAMaWnr65iYw+WPaNWUMg7vadlCJSnllM0478PH7rnU0AsPQ/tia6vp7nodqlWLtu1Y/6Tqb
	hoTOdYve09wBokfmoAQukimEUAkg4ASt/eOd5mQjnIwBYkDrR2T6qfR0KlwF1dQB3sGrmcTPYVZoh
	yqqzuAkKyxkaPaqky9ny6J6iA1HR4vhn2KtjlU7OStlUMcrSgxyfPD+i7ry9OIY4/t+iKL1flFabu
	5gfaSupmIgxg8/NaFZwiO5xhDZZjrSRU8PbyNPvgIZY0KbBuGMSH+cXNf+JhRjCZkhtD5hb7sJXE+
	9edi0BnQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qGrY0-009eHE-NJ; Wed, 05 Jul 2023 01:43:15 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8Cx5_GuyqRk4i4AAA--.1122S3;
	Wed, 05 Jul 2023 09:43:10 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ82tyqRkCM4bAA--.17672S3;
	Wed, 05 Jul 2023 09:43:09 +0800 (CST)
Message-ID: <dc239a28-4314-1661-f556-670946a0982b@loongson.cn>
Date: Wed, 5 Jul 2023 09:43:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [11/12] fbdev/core: Protect edid_info with
 CONFIG_ARCH_HAS_EDID_INFO
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20230629121952.10559-12-tzimmermann@suse.de>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230629121952.10559-12-tzimmermann@suse.de>
X-CM-TRANSID: AQAAf8DxJ82tyqRkCM4bAA--.17672S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF4rtF4rKw1kKFWkJF1fAFc_yoW8Gr1Upr
	W0qa98trW8tr47W3y8Kws2vFW5X34rGFy29rZ7G3W5Kryqv3y5WFyUJrn0kr93ur4xAr4I
	yryvqw13CFnruagCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUQFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcV
	AKI48JM4x0Y40E4IxF1VCIxcxG6Fyj6r4UJwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0E
	n4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbc
	kI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	yj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07bbJPiUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_024313_380916_C8AC59D6 
X-CRM114-Status: GOOD (  10.85  )
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

Hi,


On 2023/6/29 19:45, Thomas Zimmermann wrote:
> Guard usage of edid_info with CONFIG_ARCH_HAS_EDID_INFO instead
> of CONFIG_X86. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>


> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> ---
>   drivers/video/fbdev/core/fbmon.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
> index 35be4431f649a..9ae063021e431 100644
> --- a/drivers/video/fbdev/core/fbmon.c
> +++ b/drivers/video/fbdev/core/fbmon.c
> @@ -1480,17 +1480,19 @@ int fb_validate_mode(const struct fb_var_screeninfo *var, struct fb_info *info)
>   		-EINVAL : 0;
>   }
>   
> -#if defined(CONFIG_FIRMWARE_EDID) && defined(CONFIG_X86)
> +#if defined(CONFIG_FIRMWARE_EDID)
>   const unsigned char *fb_firmware_edid(struct fb_info *info)
>   {
>   	unsigned char *edid = NULL;
>   
> +#if defined(CONFIG_ARCH_HAS_EDID_INFO)
>   	/*
>   	 * We need to ensure that the EDID block is only
>   	 * returned for the primary graphics adapter.
>   	 */
>   	if (fb_is_primary_device(info))
>   		edid = edid_info.dummy;
> +#endif
>   
>   	return edid;
>   }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
