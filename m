Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6706AC001B2
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVlZ39p8q8LsWH84p+p/2Iq+iLx5mjVwwvUVbBR5nQI=; b=s/ANX+2z4hE6c0
	FsjsqGk+N8O0vKL7lg9o1OXPHeJfszE68ieQ0UUHkNYPG/tokyjqcRWDMsFFvIhGOOR5WQGwLND99
	qxtfIjbaXBo2FyHZbvDEiuw/q8ysdQz9tj75iEROJ4UFhCuaSVphvdYbNGpy/tz/p3+cmNqGYfmu5
	EVJHiCV6QScQVwbhaRzMQ6UWr4n/YZXV4hnSGW6LfT0CnmNnMOtFDOCiWPeX67pp+nJakNmaknlBR
	Ucbbq32Z7ZfWJylNotRNWVA675RwHo4api/ZXvJIzfb2iGDh6+ic3SyQkTNYhjm8aNU8bap6Nydhi
	51xJSnp01wYPNYEcmEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3OEn-00BVPn-Gk; Thu, 08 Dec 2022 21:15:25 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3OEk-00BVFK-Ri
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 21:15:24 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3f15a6f72d0so29080447b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 13:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RxLb6c3pV8MZQYOARt7wFYg4IvcTRaFrHi+WtxF8Db4=;
        b=lzDTGWDELDro1riwKG0siQz477cfqDaZbigVvRWIM9kyY1Y2ZaJm/6ScdYxqWk9A4w
         uRmTBk+AqMNB04d/2u8RFSfjO/sZaLnK/+RSu1G1PCfoRN/7l4y3s1OgBF7gG+tEAHtg
         glOHd1mrJtx3STLEzzYRw3xMVS32DpaFeEoFKQ6boob1WvMYQ6BVxDhPiyNUzW4YQ+Ar
         ntAI80HJc7iAx3daDrBeh9b9JJcM4FeHPiNNaUOOHs81KxK3kgoRompSSYsDBFxlqiXD
         jceM7dEHfsFCreLJOAxonQfz708upMPU89xbrmpPaV01mo6mWZo/qUFR1s3aj6zTZTtS
         2ptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxLb6c3pV8MZQYOARt7wFYg4IvcTRaFrHi+WtxF8Db4=;
        b=r5zH8COR1MQ5Itgbj1amQVOBSyCM5hfDPOzo4jyjhWqNnyJP6aUT/7ESQ+EIOQfZhn
         rqyL8YCmAQheue4hFpGc8D/4eRs/CYbE+ALWs1bJqE9p0Ay33y8OtDBujM+llfU7Ex2M
         mN58twRYEJ7IikixQinktfSJbmJOu0CHo3Bn9xu+O7/SrqtlfAwxG6YEQLLeitc8uoCn
         Md5P0nMpZeyrL9FbgOVJ3ybCu+t6Ukm8Dt8pYLlBGVEHrWxCxtorRVFBpZrkKMQRHygk
         xIbYEKw71fVVBcmlWLcEx3Ud1fmlUVMruIIT9TAsvocUHNBYuS87S159B7vVTrYa0Af5
         L1vA==
X-Gm-Message-State: ANoB5pmlo38TbUc/mGmCuHyN+5oEpr0vzUWHQvdEsBRTkKLHeZknvYr0
	fIwU3lUt1rIbAe8/scN70XjZN7Ny+90CTTVLIQYqgQ==
X-Google-Smtp-Source: AA0mqf5TMIaMGikCivHSN8QB/ySrGFpStI9jdjJ5wqz3y8/sxy4rK7Alc1fze08qJAV5K9Tf5G1tnU9ey8KciS44t3Q=
X-Received: by 2002:a81:5d8:0:b0:3f5:b69c:387 with SMTP id 207-20020a8105d8000000b003f5b69c0387mr10437422ywf.359.1670534118538;
 Thu, 08 Dec 2022 13:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20221207131731.1291517-1-william.qiu@starfivetech.com> <20221207131731.1291517-4-william.qiu@starfivetech.com>
In-Reply-To: <20221207131731.1291517-4-william.qiu@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Dec 2022 22:15:07 +0100
Message-ID: <CACRpkdbjaiDhPcVH115w25oxseWrz=Yb-ugkmCOiqhRDmDZj5A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: Add mmc node
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_131522_917311_DBD8998D 
X-CRM114-Status: UNSURE (   6.97  )
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

Hi William,

thanks for your patch!

On Wed, Dec 7, 2022 at 2:17 PM William Qiu <william.qiu@starfivetech.com> wrote:

> +                       starfive,sys-syscon = <&sys_syscon 0x14 0x1a 0x7c000000>;
(...)
> +                       starfive,sys-syscon = <&sys_syscon 0x9c 0x1 0x3e>;

These are registster offsets and shifts. Don't define such stuff in your device
tree, use #defines in the code and just provide the phandle.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
