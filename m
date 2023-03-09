Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B73C64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d56Q+PL2GcaQeb4aWysjz0o73jHsq8vj+rqOLutWDQw=; b=zX5DzU6rnT49FZ
	ecjy0wkBBYKR+/wZ5uVQhcVOjlLaL2Yqdy1w91k/Wju0x+580/rlIws5iocixRFkS9RfFD1s0MTnB
	lrwVj8XGy0Zlt0npssPLNjl8j/Axq32jQoYck51X+T91RnZ8BKAecgV9fW8BrVMeMpjVmKjNjxUrh
	TtecfbXVBmqe1PafGEtMPJ4/sHAr0sGMnIlWztau38xXOwqNXvbdKR+GsDhZGv3J8eO6zj6ZoZZ1t
	rW7NjHxYG3JLeSgADMBee0LMYfn5i+j7/wVrKhU+mAd/RyJSumsEDbw7buQ2IRnrUk1ALN0iYT0rv
	sOEnHj0gdciQgRNWgSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paI2q-00AqZw-RK; Thu, 09 Mar 2023 15:19:05 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHnD-00Al8V-CI
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 15:03:03 +0000
Received: by mail-pg1-x52b.google.com with SMTP id s18so1236192pgq.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Mar 2023 07:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678374172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mpG+8TjRKU1Xq1b7ChN1vz1PZS008U/FxhApKNmqYlY=;
        b=ELYbTvyRDRvOH8dgBQ/Fwx17+m9R3aqgz5pT7V7fAkZJsA+oV5WiXFMZLcOenBBcbo
         Iomz7JdnKuw/g52XHENDsg9hzunSk4MHravqG2QuI/iiHrQirjr8y73m7ZbBXY/o7vLg
         qvwNTEDQsWU9Of4q0G3fEWJe30V6onvW2a3+JTt/V7Y4xmemTnj3zMSH2yh0yqy6v2Cj
         a/57s24pd09PXcbhcLZVSXqhgklg7hVV+a1VfUTBgAPlfhwUzkjH5KHMImC7zUxFSqTO
         FQHaGZXufx854DG2kV0GcvrLGNTYFThFRHLCUDrtkIwO46cukE2cBALux/qu3ME/ggcP
         lUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678374172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpG+8TjRKU1Xq1b7ChN1vz1PZS008U/FxhApKNmqYlY=;
        b=kH5SShSwJJysPhcnAUUAH/3KJ/0yXb02P7hsTpLTjToTXx+2QMaqxHy8gWhDwnmISk
         dysaOGP4Gg03FgWQOcfp/feKf/K+tfHglmnbegtuM2W5JEq5pxCZa39ZxcDnuJaXv0tI
         NvRgYsfXKOQa7Gc8EpjA84TT4RQ3sXH45WwYXiZdHNHHqjMONfLLMN38W5HwRgfwjDut
         IkJMBXYvQa+rJnXrM7ilwu2XUTW/08ZvQQnaNVxdq12FkYEkTFHSpcctS8xwCg/9UOnb
         z7aYasXIU0YgChdCoiYwizg3gO7IlhsQ4zJXeQXMpEaoO9OPtpj6LDIZae7ynpreAeTU
         tmhw==
X-Gm-Message-State: AO0yUKVFwwNF761Q3KYHB2+5cRZyQjVhUx0VM7uil0e5CJNZhI1BX/ud
	dMFTF6fubqtszDlqsL0vyoJr9EGUpM9CUIMgyE2kvw==
X-Google-Smtp-Source: AK7set/Pu4XGzKcyUzu0ET/xIBNGm/Mc7zvqzaKEVvMGZxTLOsJ3vWQd5u10L1Z/1FJ77TF3nXXUVY+1mwvJkbrIn10=
X-Received: by 2002:a63:bc02:0:b0:4fb:d6b9:abea with SMTP id
 q2-20020a63bc02000000b004fbd6b9abeamr7692841pge.5.1678374171737; Thu, 09 Mar
 2023 07:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20230307024646.10216-1-william.qiu@starfivetech.com> <20230307024646.10216-3-william.qiu@starfivetech.com>
In-Reply-To: <20230307024646.10216-3-william.qiu@starfivetech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 9 Mar 2023 16:02:15 +0100
Message-ID: <CAPDyKFp204LOmo9rD7DS5hE=s2jHuFfgsaj05MRzdTKNrscWWQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mmc: starfive: Add initialization of prev_err
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_070255_494156_F3FAC4C9 
X-CRM114-Status: GOOD (  15.61  )
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

On Tue, 7 Mar 2023 at 03:46, William Qiu <william.qiu@starfivetech.com> wrote:
>
> Add a incremental updates to fix a bug that prev_err is uninitialized.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reported-by: Dan Carpenter <error27@gmail.com>

I took the liberty of updating the commit message a bit, to try to
further clarify things. Moreover, future wise, let's use the prefix,
"mmc: dw_mmc-starfive" for the commit message header, to be consistent
with the other dw_mmc drivers.

So, applied for fixes and by adding a fixes tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc-starfive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-starfive.c b/drivers/mmc/host/dw_mmc-starfive.c
> index 40f5969b07a6..dab1508bf83c 100644
> --- a/drivers/mmc/host/dw_mmc-starfive.c
> +++ b/drivers/mmc/host/dw_mmc-starfive.c
> @@ -51,7 +51,7 @@ static int dw_mci_starfive_execute_tuning(struct dw_mci_slot *slot,
>         struct dw_mci *host = slot->host;
>         struct starfive_priv *priv = host->priv;
>         int rise_point = -1, fall_point = -1;
> -       int err, prev_err;
> +       int err, prev_err = 0;
>         int i;
>         bool found = 0;
>         u32 regval;
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
