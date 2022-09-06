Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D66C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wh/D/qQkM95wiV6R+xGEGb/PB+Gpl50aD2AcLdNnDNg=; b=n422jrLQs8wojQ
	CcC/P7MHAJaz+3mRyfqN6nAwm+Yx4tXpfiUp+5W4DDVk6rZmGJ62N7V4ztfQRmZ1zmVXSH4TfT4ix
	mSUhf/t+8QerfZvgOuADjoEtRgwn2+NQdKe5GjFt9iUKXBYlWjHW3j1Ao9Ifq/VX63I4ru+hZseyL
	+QWXBfMy4iS+9pwEWF1CA3WxLKTmJz3L/0e1UmxMVDqUqz08w1MpYGl2GnXT3GqTWlDzg7gHLgG5K
	JWN9386R1g/6vLTR9/A4w95tfgmsn8bh0HDL+F0XTohDDyi0dF9Yt86KN9XPQlR4q7SyA3GPbOUSX
	7JSsyhcJt3AkAPvyI8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUuq-00Bq0j-2g; Tue, 06 Sep 2022 09:30:44 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUtm-00Bovr-Fi
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 09:29:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id e17so6714809edc.5
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 02:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=uoLdzYZIQ73QiH2KlBK+XvPFCZIvsaW+sunj9P1p7ys=;
        b=glHC5//tuWiNALLduE29WNfx8FXq4A8chfN7YlQnurMpedwC13ybaU0M3+8YCFwQP9
         ocQsUJJclSBWX6Y2YIjXSqDT4jTREskZ8qzP27Fmp7TGAW1jw6hcC5jrSiogsVOmPZpM
         tf79M+2KMt6oiHipGwJtkVHpN8wfMKcRwkTXAu5k9VM6orGuPO4yjwBWIC8d+Ejz6mil
         k/R7yIEcdymLd15QT0SNl18S/bQFtFR5GfM+UKnOfdNqyWn8AH/DKlf1APT5XDNGy0ny
         1auhqVO5JHNiZj1XOGid4dGlRRcL7g2h3tBUlAD9/Wf1buy/yhOZhubZeXjCAcC5bNv5
         6cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=uoLdzYZIQ73QiH2KlBK+XvPFCZIvsaW+sunj9P1p7ys=;
        b=AbQ1ps5BU8XoWq5h0RJxTDAh6tLi90D1zSgPp0We6S6VWnCyJzWGQpw/p+ORnUZ8CJ
         2gY152JlO1OdgrU+g8Vkue6cqrWuG9i+yJzigfbG5xorDsYJpaun8fKWuOzj29BAZzO6
         psvHDVQI3AZild4bauv6a1y7qsRvGVCOos1InYje92jDgqtGRZEsl+6Nj+p3UP1HpBYl
         Ai1AfSPegl4TtBP1j+GpK/pqkaPxXUW+kZJjrBQPNKhdTu/yNpj9K7/M+0fMV/MQgnrB
         kF4FtLm0pZJJOWrgjV2T71Keh2LFrbq3Znhni3ghchqDbxcWtf/BIqFMxjmolTaBq3Oj
         o4wg==
X-Gm-Message-State: ACgBeo2cVGVQhLJf/IIuQIAwlYkCVHDaiF2x6FCKGd0PAC7sm1oCKURP
	e6zqWMCm73p2cYA6++5sjzIUIQ==
X-Google-Smtp-Source: AA6agR69XuBCvK3Op74jZfUH+5dI+mdxAjZfur3ymI9ZjYhdhwNbtPicqP9fY9GXSOkWjp+AT5WrHw==
X-Received: by 2002:a05:6402:1911:b0:448:da24:5f23 with SMTP id e17-20020a056402191100b00448da245f23mr28940510edz.61.1662456575684;
        Tue, 06 Sep 2022 02:29:35 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id j10-20020aa7ca4a000000b0044ed7a75c33sm903155edt.6.2022.09.06.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 02:29:35 -0700 (PDT)
Date: Tue, 6 Sep 2022 11:29:34 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, heiko@sntech.de, anup@brainfault.org,
	atishp@atishpatra.org
Subject: Re: [PATCH 1/3] RISC-V: Output cbom-block-size
Message-ID: <20220906092934.mn45eil73xh2lgel@kamzik>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
 <20220906083555.931806-2-ajones@ventanamicro.com>
 <3da2f5bd-104d-4562-3748-847b2d1c8166@microchip.com>
 <20220906085533.orfbu5gyeur5xj6i@kamzik>
 <b24c9045-d0f7-f88a-a34a-ab13b8b1167a@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b24c9045-d0f7-f88a-a34a-ab13b8b1167a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_022938_582752_5E5AD32C 
X-CRM114-Status: GOOD (  33.72  )
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

On Tue, Sep 06, 2022 at 09:00:20AM +0000, Conor.Dooley@microchip.com wrote:
> On 06/09/2022 09:55, Andrew Jones wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Tue, Sep 06, 2022 at 08:40:23AM +0000, Conor.Dooley@microchip.com wrote:
> >> On 06/09/2022 09:35, Andrew Jones wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> Provide an info message with the block size when the Zicbom extension is
> >>> present and the block size has been determined.
> >>
> >> Why might someone care about this?
> > 
> > I was unaware of anywhere else besides hardware descriptions where this is
> > published. And, while dmesg isn't really publishing it in a way that is
> > useful to anything other than human readers either, it at least makes it
> > easy for a user to check it for sanity purposes (which is what I used it
> > for) or even for applying it if they want to write something that needs it
> > and the OS provides U-mode access to CMO.
> > 
> > I'm not married to the idea, though, so if people would rather have less
> > logs than this information, then I'm fine with dropping the patch.
> 
> I don't really care either way about logging it, if it helps people to
> be able to see it perhaps there's a better location than dmesg -
> would {debug,sys}fs be overkill?

Thinking about this some more, I think sysfs would probably be the better
way to go from the start. This patch should probably be dropped and I
can try to add a sysfs node. The hard part of that will be the naming...
How about

 /sys/devices/system/cpu/cpu*/cache/cmo_block_size

Thanks,
drew

> 
> I was just more interested in the motivation behind the change itself.
> Maybe some of the above in the commit message wuld be nice?
> 
> > 
> > Thanks,
> > drew
> > 
> >>
> >>>
> >>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >>> ---
> >>>    arch/riscv/mm/cacheflush.c | 4 +++-
> >>>    1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> >>> index e5b087be1577..8595baf8e403 100644
> >>> --- a/arch/riscv/mm/cacheflush.c
> >>> +++ b/arch/riscv/mm/cacheflush.c
> >>> @@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
> >>>                   }
> >>>           }
> >>>
> >>> -       if (probed_block_size)
> >>> +       if (probed_block_size) {
> >>>                   riscv_cbom_block_size = probed_block_size;
> >>> +               pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
> >>> +       }
> >>>    }
> >>>    #endif
> >>> --
> >>> 2.37.2
> >>>
> >>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
