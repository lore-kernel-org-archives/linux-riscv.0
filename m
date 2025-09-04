Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32477CA1002
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkXT25yoBflyL5unAiC2YaPy/MnqbCUKy2p+t05Xwcg=; b=oJqDTvXLPSdsdg
	J0V+hbgCE0dH0k8T1L3AVzldPzvyejaF0GRhXFBQkxBuxX9ZDlPiAKag8UEhZzNXZxce6VF2Nd9fu
	uFECEG+Emwqa6Uwno1avMovjggbpFqwioFTG4d4ZiBe225CjtPts6AHohJpJIFjlcIqz/1mMN9eYr
	vRknlqbONoIuF1aoKB/Yyk3ikaf4bFqtJlK2Qxk0Vq+boMz2WKY7XYCISXbfoXNhRwRbA2fQ7DZDY
	FgLK5gOlmWRAxwGvQu0UghayTe5Wy7tGinv9/fsBfrXFpmWUEbdk9OwBlufeuyFtzxKh5AJyh3qQy
	4o+KC/ee3iDSGrDy29Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7on-0000000B6lD-3WBs;
	Thu, 04 Sep 2025 11:07:53 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6zl-0000000AoTt-06un
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 10:15:10 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-71d6051aeafso9207287b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 03:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756980908; x=1757585708; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TUjaia+OhMAEZTusU0F5Oa10icPeXNIDTIJALCJZSU0=;
        b=LAZ3Qny5Y0WIjKd2vh1m2B6yAMsJzcxEeCZt6kYxmAM1SIM8UMO5WX9S/1eEB7HQGo
         cwz2Jbr//qGsg2C8rKank2P4bocUdFL+iSLWsuG2cWNZFC4FXbHzTisaAiq7JjCBYzxh
         iY4HP6nKPDg6SZA03hPZpxaq3Ugfa9pOxpXKkPS84nMc81BIZAnNxt/ZBYtyOCPBR02u
         1dR6/0fz3L8dhuQR5syFMArXPV/q33nao2TTD3Wf9wlKMF/C8SiLQss0zy3cdJrrFjZa
         0hdSKoyX0y9+Zuf2tC0OWcZ55o3JVyLxpYIJW3be946cADbva83MeT1bzAMBrediu24W
         GgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756980908; x=1757585708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUjaia+OhMAEZTusU0F5Oa10icPeXNIDTIJALCJZSU0=;
        b=YqiQNLOiSDWmyFr1VJ1+byHPegQMph82Z8xuk7zZnwyMD3VH+ZmylmH1adFatQLKXn
         1xcTEUttIun2qSsJ5A6DuZ59s9lK5Ne5gi9WQfJ1pZbETqwyWOv8rGtrsJUY7MXqZU8S
         GEQZ8THIdSdPz+eh/txA2/X9w4eod8c3dITFZ512Iy4U+A9Z0h0SfdOqG5a3uFCLH1Hl
         2plLDcgjRuGs+lAyz1p8fYpsgKsfyeBNL6fceDpl/lngOL5Vveh0cWdWlR8J3zJoUyJl
         b4k/iFSJjg7kxCG7vBDLnJ3T+/JjPAEnioZ8dLVd/dg9NmomENG4VJr2RA1AIVL1Tla6
         ltwA==
X-Forwarded-Encrypted: i=1; AJvYcCUDek4gqfuAB8CbGlS9QWQPL6nc3Dx0M9JiaNEfG8vejPTe33lLLdQ0xSXMULmlfZfN4uDyRkozwK9nKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYOUcnuoLXvGwph/5/GvKSYgjeBbkOahxftDZ602KpRizFs45T
	pyNgWMwq3i6tuPPEDT5Dlbbv8IKGtU9EveGfEmUvUE7/hApRvQyL4tTuBfSGjnpzM5nvl23uU3c
	u8r+Cq+TcPTLUol2myI7F6vS2QNpDw8OpV4hx4M0Rlw==
X-Gm-Gg: ASbGncso7Bca1E5qhk2C/EJnB4A6E6JUU/l7D1VOJTuXM1C5Wcli66VI7CtwXo85MvO
	JrC5WyrmvrP5U2aAbzXNpLgjoEvgyBGQaPHwsFOEOcVAddG/vv3xteBpFr/wL/bwgiHHzbsnHB0
	mj+jj5NfxG+lr3wsEQUyjzcgrBKVz89Jng/ifv2npyEyxXpp7BMIitVpwpipvfSIF+RqZSQJGnT
	0y9lqN0
X-Google-Smtp-Source: AGHT+IG8ldfxQaFlFR9n1LdiPDQHlQEpQI4SJcztaYgkxIV+25ENTr0NTKySauZEe4IfUI9wm1RmPMFKF6lcMHOVLNM=
X-Received: by 2002:a05:690c:2606:b0:724:be89:9b69 with SMTP id
 00721157ae682-724be899db1mr15536087b3.3.1756980907994; Thu, 04 Sep 2025
 03:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250818074906.2907277-1-uwu@icenowy.me> <20250818074906.2907277-3-uwu@icenowy.me>
In-Reply-To: <20250818074906.2907277-3-uwu@icenowy.me>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 4 Sep 2025 12:14:31 +0200
X-Gm-Features: Ac12FXx0dPstIEelprge7mji5eoxeEe15kSVfZZNfNFrPoUORBDZRgDPR8LTXnQ
Message-ID: <CAPDyKFombYNFvTsChewQ6cFY2woS+vSb1YUV0Bp_+DcigrFFXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: thead: create auxiliary device for rebooting
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_031509_080679_B00C9B1E 
X-CRM114-Status: GOOD (  23.56  )
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

On Mon, 18 Aug 2025 at 09:49, Icenowy Zheng <uwu@icenowy.me> wrote:
>
> The reboot / power off operations require communication with the AON
> firmware too.
>
> As the driver is already present, create an auxiliary device with name
> "reboot" to match that driver, and pass the AON channel by using
> platform_data.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/pmdomain/thead/th1520-pm-domains.c | 35 ++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
> index 9040b698e7f7f..8285f552897b0 100644
> --- a/drivers/pmdomain/thead/th1520-pm-domains.c
> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
> @@ -129,12 +129,39 @@ static void th1520_pd_init_all_off(struct generic_pm_domain **domains,
>         }
>  }
>
> -static void th1520_pd_pwrseq_unregister_adev(void *adev)
> +static void th1520_pd_unregister_adev(void *adev)
>  {
>         auxiliary_device_delete(adev);
>         auxiliary_device_uninit(adev);
>  }
>
> +static int th1520_pd_reboot_init(struct device *dev, struct th1520_aon_chan *aon_chan)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
> +       if (!adev)
> +               return -ENOMEM;
> +
> +       adev->name = "reboot";
> +       adev->dev.parent = dev;
> +       adev->dev.platform_data = aon_chan;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret)
> +               return ret;
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(dev, th1520_pd_unregister_adev,
> +                                       adev);

We have devm_auxiliary_device_create() now, I suggest we use that instead.

That said, I think it would make sense to convert the pwrseq-gpu
auxiliary device to be registered with devm_auxiliary_device_create()
too, but that's a separate change, of course.

> +}
> +
>  static int th1520_pd_pwrseq_gpu_init(struct device *dev)
>  {
>         struct auxiliary_device *adev;
> @@ -169,7 +196,7 @@ static int th1520_pd_pwrseq_gpu_init(struct device *dev)
>                 return ret;
>         }
>
> -       return devm_add_action_or_reset(dev, th1520_pd_pwrseq_unregister_adev,
> +       return devm_add_action_or_reset(dev, th1520_pd_unregister_adev,
>                                         adev);
>  }
>
> @@ -235,6 +262,10 @@ static int th1520_pd_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_clean_provider;
>
> +       ret = th1520_pd_reboot_init(dev, aon_chan);
> +       if (ret)
> +               goto err_clean_provider;
> +
>         return 0;
>
>  err_clean_provider:
> --
> 2.50.1
>

Otherwise this looks good to me!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
