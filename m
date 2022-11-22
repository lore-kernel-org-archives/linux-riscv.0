Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D290C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1ShWyfX47TwRK0dfPMBt673r6krPGSIEF4Z1A5VIUE=; b=NozhwGrf6BPWhj
	y2tjSf14+LlxEolU1OmBepzP8tsmJIUSULlyZ8DpRvVI/zfc0kW9avisZDGLoOxpKN7V52IRiIXcx
	7Bi1d2azZKe1/xhA6uhAm2LSxxEyJStSR+YKcO/czBOXSJ2SAbbW+/6w+nODWVdaX4rZxgx7DcisN
	Bl6QSfd3DNBfv/K6xdfwh2cC91Zrk2i/i+mJh4jK5SKU6GWm2es9XGARoQxRruzBfWFcI6/4prqQX
	pUd7VzRaTrqATnlSu4z4wMxBrmOlgfzqDFqDp05gMzq+IwBPHUWx2okLtUj7tbGRDQBB2vbWP15W/
	CjBecN/XNc9FtM3G7/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOlr-006Kug-UI; Tue, 22 Nov 2022 08:36:47 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOlo-006Krj-DG
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:36:45 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-39e61d2087dso61949197b3.5
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 00:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lUUgD95//RU7QNfaqwzY3u2n51Gl06HD4BZ0NZiwqZk=;
        b=fdRi8jqB82MbdhC/mDQxvLI8IL1vLHj3nLqB63J4wlOVnjP3ErEnflvFv9n97fXATT
         VUYbeAdL+jb70TEKLjHPdTIn/t/zzAtNVw/jC7TU++lst6wYGGTLVHf23xD7QbySOvXA
         ZgUeGiiKiwak+sployhEZFifSSodamyizVnaE23Kd91vtW5Zglol3Mjwi4Suv85XK5rC
         kNC4wULi6a1NIHPI6Pcz5WaSyyWrXuM2qSAzjJ9sjk7n0GEUEqzYtdE5ZSgye/Bz3NfD
         +dNT0MF8PPOUcTPHHWue7J2XsLbNGxQX/1QaqiQDqpeGZx8A2gZyE9gVlX9gV75oYSJx
         DEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUUgD95//RU7QNfaqwzY3u2n51Gl06HD4BZ0NZiwqZk=;
        b=Fyffa0vmbz9gswIMTmjNqzw+NaZrWIO8TMmfcxn/WHGDkQaXaV6vawWJ51fgVSTzbw
         CdcAedOji4Vfqns9u42aJscGnBYaR4qy9c7AJsBm0IY4JHl/dy+wqDqnmd0Ko9mKkgdP
         n6U5hp4mThTiqQkhAndL7Js/QFIp6Brv14NAn5kPu5Uo+ipSP0MdyCM1hSAjDL2ck5VF
         6M199Iv7aJtXl01xjD8DLBo2GBdCJxHexJgU8tpVJKWDkJzfO0ZjtVH3h2+Mjqpn6bfr
         uB8AxCuC5Gu52GlwwO7h+DUu6XMBDJZP7x0PWvH3awNsqWt/2DMH/KuWYIXcRXjhMIlN
         BgOA==
X-Gm-Message-State: ANoB5plfrPMR/9haBvbFNIYM9DojQz8OXKt/thOx3wzzfzPcD8gc9iVB
	Ng5Rfc+SZt/dUOGV2fCkqepzwAlLeyiUpcNSNmFPhA==
X-Google-Smtp-Source: AA0mqf7gJGL8BNHxmjcbLv085HdAVJ2BC5W4/LeM3apSj6BBZi4iDOLuIfjo/uIeUd18Uxg0LBYyqp0bf8dqjoK6b8g=
X-Received: by 2002:a0d:fdc7:0:b0:37a:e8f:3cd3 with SMTP id
 n190-20020a0dfdc7000000b0037a0e8f3cd3mr20960901ywf.187.1669106203169; Tue, 22
 Nov 2022 00:36:43 -0800 (PST)
MIME-Version: 1.0
References: <20221122075853.2496680-1-zhangpeng362@huawei.com>
In-Reply-To: <20221122075853.2496680-1-zhangpeng362@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Nov 2022 09:36:32 +0100
Message-ID: <CACRpkdbj56x+HwxrRzmR+wUQmYuViqu4JCuUGn6p9sCitTanyw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: call of_node_put() when breaking out of for_each_available_child_of_node()
To: Peng Zhang <zhangpeng362@huawei.com>
Cc: damien.lemoal@wdc.com, seanga2@gmail.com, palmerdabbelt@google.com, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sunnanyong@huawei.com, 
	wangkefeng.wang@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_003644_488580_8B0394B7 
X-CRM114-Status: UNSURE (   7.50  )
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

On Tue, Nov 22, 2022 at 8:34 AM Peng Zhang <zhangpeng362@huawei.com> wrote:

> From: ZhangPeng <zhangpeng362@huawei.com>
>
> Since for_each_available_child_of_node() will increase the refcount of
> node, we need to call of_node_put() manually when breaking out of the
> iteration.
>
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: ZhangPeng <zhangpeng362@huawei.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
