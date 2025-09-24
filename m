Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BE5CAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 19:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaW7iQ1GSx1hRa2c9dqHS2Rc77PSv60OK2WS01Ilbg8=; b=QWfrQCWs0mtbb9
	UzBC9IzsxaLB20kxrpYCINDpRy4lOdhNzQGl+49rSP8N0GyheBM+II8++VIJQd4509ub58MTwIDxk
	Wm7uN/nv6zrR5M0pdamc3ZOEdBe0rlGaww7489L6eHKD4V1hvQFOfIvUsOpvsfYBrmPpWrogWJTmd
	5ANBjJ15IOgkzGzU3cZns2GtRRASV4HXOnKSETbJPfvoI8l1H1y2oAD9okxI90RXAW+Y7LqPm0U38
	ewiYdL4uj0S+3GTCYU87gmgFQiBpTl+FqTpU4PDKHoWLMfkcGeBRtg9jgotalFWUvXTLYD3R1G6Ag
	8WvsfZzy7SZziodYIPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Uwn-00000002y0F-30t8;
	Wed, 24 Sep 2025 19:14:37 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Uwl-00000002xya-1NkN
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 19:14:36 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-8935b53bb14so10095939f.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 12:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758741274; x=1759346074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Nd+DKJZTe3XmkBYj9enRckjCcI4kpUCuGO+uMkJQh4=;
        b=Qkv/0j4jJlWZmaLDMRnG30M841WCIuZarXLEzJ5IKz3DgQKNXxv0HGHemZ6Z/A6i4R
         rNOImpPq6m2Jq29kqoUbQ8LN4/Zo2vH3fs84QS6bf5YTaaUgRoKlYc2BlqX00Dyp1qs8
         vsOR6/ba/slIfDr1RoURaRokHQ/1mK1xFj2jx82nsznDAtHy7bJwpDOkmkhGdSQkVqQ+
         a418+u4dMiHkiGEIwgS/W0m95xU6sriz/9FJUPn/MYno5Foh2sy9lBIu1O9bOw/lH7br
         Kxug08P60NWVRJsXFP9ufq8ukrQt6cUqeIGsbklq7Y+AY92F+rPogFd6taB65hEc0ZKM
         3t2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758741274; x=1759346074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Nd+DKJZTe3XmkBYj9enRckjCcI4kpUCuGO+uMkJQh4=;
        b=gbhXMEAVLT5Bi7YtJtBCUAXzW28GpImuAate+fdYY687ZPKvoOyWHuuktpcr6wc4lI
         pctx8p0AzG0qyZfuI8amS5mqHlI+VEMoWRF0v4sl5Yb1MGfgwAnRe4BA8Q2MXdZrpqkX
         Qyz7kNvrL2pfcTwU1XdRR+GYASnpFAqOf98nvtSw/WrhbYGObFUVYnGlvmRGVYYw9esc
         Rj1uo5ko/YXPirdA7BXsyGv1MmPXKonaI0rt/5JoxMIRHh5Vki4dKDEqt/BP5dUQIcv6
         vawxoE3qfOeUTw76p1jX6RgPOW0gJwIf0c+eFELga+8jWf8znI3PhvY+8e8vgZs+Czs9
         PGpg==
X-Gm-Message-State: AOJu0Yyvy1fgwZfB33KJ1bismDIY86ART/JYmzm/WQ3fde6UOTCxcuaZ
	6RMx1Q5xpu6crWeOLdxQZBr3FLDnh/MdAE2f3wS+2k7+NFS+CXuQYKWq37nyLJhapQA=
X-Gm-Gg: ASbGncsHUKluqK8ALlRwvCYEWsuYInIjf7ET/8NPb0BVXnBoeql5S5zp5PRtewKuSd0
	ajnmMyX4nhtBU34L0Qi39pMEX6P4wai5qjuj4kSsVdts6NMEjZPgZWl7ahCgRhoIwV67JPK7XAo
	FbBd0sGAYMDUnCoviKmvJ9Fq7otet7q7OeNvaZk35vqMU6hk2eeluj7pCM1vlGfaPP5Vwj81Lo8
	Q28RfT9YOWiYoq5Lsmmf9R7i5d/g27DYF9MHr2R4nO4Oh7IUysxXQuJi8UG4ED1Uuj1fMuuJQ+J
	Ghl9ECj08BNCZUm+Wq5cWbs4jy+VBKCjgCrS71Ehtyx+iPU66HYkn7KTBe0EsLDb/qDVDVVWJJa
	iOmUH9C62zEdWvH7lZjD1eTq5
X-Google-Smtp-Source: AGHT+IE8j5KYhi3s3Fl3nePo4cG2h6YA9lTgwUwfMOBBlO+umYeSjsVMSefHFKLReHBV2ObV3vdJcQ==
X-Received: by 2002:a05:6602:1d4e:b0:8a6:e722:a9e8 with SMTP id ca18e2360f4ac-901540c745amr111897939f.6.1758741274424;
        Wed, 24 Sep 2025 12:14:34 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a46b2f3405sm671174739f.1.2025.09.24.12.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:14:33 -0700 (PDT)
Date: Wed, 24 Sep 2025 14:14:32 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zihongyao@outlook.com, zhangyin2018@iscas.ac.cn, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v1 0/2] riscv: hwprobe: add Zicbop support
Message-ID: <20250924-b6258c49a33a07d027bdc04b@orel>
References: <20250911121219.20243-1-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250911121219.20243-1-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_121435_372204_F353E2FE 
X-CRM114-Status: GOOD (  16.53  )
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

On Thu, Sep 11, 2025 at 08:12:07PM +0800, Yao Zihong wrote:
> Add UAPI and kernel plumbing to expose the Zicbop extension presence
> and its block size through sys_hwprobe(). The interface mirrors
> Zicbom/Zicboz.

Yes, the changes to add Zicbop support should closely resemble those
of Zicbom/Zicboz. So I suggest you grep / git-blame, etc. one or both of
those extensions in order to read how they were done.

With a quick look at this series I can see several changes are missing,
such as

 - an update to the documentation, Documentation/arch/riscv/hwprobe.rst
 - a bump to RISCV_HWPROBE_MAX_KEY (as the comment below the change
   this patch makes says to do)
 - test(s) added to tools/testing/selftests/riscv/hwprobe/cbo.c

Thanks,
drew

> This allows userspace to safely discover and optimize
> for Zicbop when available.
> 
> Yao Zihong (2):
>   uapi: riscv: hwprobe: add Zicbop extension bit and block-size key
>   riscv: hwprobe: report Zicbop presence and block size
> 
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
