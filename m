Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B94EECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVT8y0p0+X1XeJ2Dg8TDAoud6QEQPJsPYftMQq8Ft5c=; b=J0XZpx52acAAiy
	KF+WFUYMUH3uWUzBaQ6GKa02fwc/dH7V4Kyb3dtodPzGj/CTrtBjsG0FL6LRbEQbZjLZZJi6/AoRV
	UG9xz1GZ5Kjz18kt7F92em7ddlN0JvPLB7a4aSCHHmNnbkh+hfKiFoWOJ98CP5E5+eF/1+K7vkrkL
	Wr5JyTOoppCKos3yynkladCR0lmj0RzK6EmXNja88WpCdSKgUCEVoF3bMgBtedWtayO+ltJnhB/fh
	r65k3R/Z5wASJD/E/k9tUI/4muz/+2qF5XwPvfhSYVmylhzSTjQSna9042q5apFffuR4RSk1lXGlr
	COtXArdwlYk87qxG0iVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQpx-000LCG-5a; Fri, 28 Oct 2022 14:59:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooQlg-000Iym-IZ
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 14:55:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso6766933wma.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 07:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac/w80l4FKIDah81f++1L0CoZ28y1pe4iLjRj4Ja23g=;
        b=S1Nn80OmpbjgJrIUo7I2aKMCMeccbBqGgdPWIufPTiZ3XwjLixtflnBF56Jc43wQJ/
         Wbf/2ZANinng+YwCpIcVDMEOKsGoj+XSNd2zMVKtCvCffyF7wQOSqUtIRSfFNnaRV4S5
         LFRKDoavqfprFt4SUE+C8J0HmXnic/2X2EPZk8R0euzqe20h2YR276C/JbMZe5Z+bwLM
         kv7WxulABB/Vm/RgdMsN4NcT86369+yjuTGTD3CPaPP8cODamk1oFf2Hus2wFjmE2B50
         M1mYk5uv9eFj19EF1Pk74hixJrc+iaPKTYWu0gWG+i+6vFbhcL77VSTvuiejYyqZ55s7
         G3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac/w80l4FKIDah81f++1L0CoZ28y1pe4iLjRj4Ja23g=;
        b=1Fv7G2oK1HlUH2j3fHl/YSN2oBUlaZ39QDMSQgQYQfIqBWhtp+MP7lw1szlWFyYGgi
         huvhsDW+EXDzHY+PxNDziIXgHaxvYqfNO+CZIAfopsHVsR007QMPgS53uv6SfQzGmIWj
         ukHpZHa0geP6VFPP6g4j61lfS0u21myLMxozK/6NJ8GRFOkapNWV4P8Cr4mJbMLvUmgu
         aPtZN7zXwgUxIttcKcS0+s0HYxfR0kQu6+KKctjcxXeBchigtVWoxvDLbzy1FKN9wyGw
         rA9D0GlVnnsNgBIVCmYSCTe2xl1Xn15s8/l/o1fP+thhQLFnyf6fbEJTACKANkrdPJEq
         lk7w==
X-Gm-Message-State: ACrzQf2zOwUSgI+H9t7cqrtLwLcU5sBlI5hu0nADYfr06XxK+uOBoMIR
	L5aX8OdON+0GqScB6odwTn+kpPlEAqeFog==
X-Google-Smtp-Source: AMsMyM7Epdkvf+MB5RjgqO+XzoZwromUrDCRVQrqJd3i1vXFb6DKqC4rLt10lHX9rfcELa2akgleGw==
X-Received: by 2002:a05:600c:5109:b0:3cf:5fd2:877f with SMTP id o9-20020a05600c510900b003cf5fd2877fmr2067663wms.156.1666968929302;
        Fri, 28 Oct 2022 07:55:29 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c154f00b003b4a68645e9sm8565812wmg.34.2022.10.28.07.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:55:28 -0700 (PDT)
Date: Fri, 28 Oct 2022 16:55:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] RISC-V: use REG_S/REG_L for mcount
Message-ID: <20221028145527.fnmr4eknawq4nf6p@kamzik>
References: <20221027172435.2687118-1-jamie@jamieiles.com>
 <20221027172435.2687118-2-jamie@jamieiles.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027172435.2687118-2-jamie@jamieiles.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_075532_663788_E4F767B2 
X-CRM114-Status: UNSURE (   9.54  )
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

On Thu, Oct 27, 2022 at 06:24:32PM +0100, Jamie Iles wrote:
> In preparation for rv32i ftrace support, convert mcount routines to use
> native sized loads/stores.
> 
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
> ---
>  arch/riscv/kernel/mcount.S | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
