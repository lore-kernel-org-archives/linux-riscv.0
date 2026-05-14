Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47582CD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w03R7OKRt2gBDpK1F9AAvIPsreBvYr6NdC2bEAdLD8w=; b=nueNPxyFpTpYhN
	ENk+OXd1+IzWoYI6dWSOlYb4xSfe8Bzw8apc1FYDUanZ/GS3ONnxfJGRbjyuy97T9nUo7xrXyQQyR
	BaZ89tzx0/FP1dZOsvInaTQ4dsRMEjTlXfNEO7Hf/UZM0pMJzvvP1W4DmVD73xd5qe6hT5/ycRuCE
	vk+Q59+3L8PytaoLjvu4ORvjWFKJ0afRpkXl2foYF3Ydya0BzwmB+zpAnBidCBCjDr3NGw9DwUIt0
	a2dZ2WSchAL8KmPAf/u5AXR8puWFc1gsJcgYtDQZvSCSDGv8m57361mcQP6ptBTzfA2jys+Wdifqw
	tTDF16eY+K/kF+zSJKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWpx-00000005glS-2V6Z;
	Thu, 14 May 2026 14:14:53 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWpv-00000005gkR-01VP
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 14:14:52 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-393da8f389bso81317991fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 07:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778768088; x=1779372888; darn=lists.infradead.org;
        h=in-reply-to:references:user-agent:subject:cc:to:from:message-id
         :date:content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiy+RcG64sX7mBz15U3yLb1GGjIVQtRuDeERnf48qdQ=;
        b=MLOnfVbpB0RtEF2VIKgk+1wirX45W4KZ3NfXLYhhmHlC/EooADKAOFmYWr7oqIwbBf
         NvJyX466TljbeBme0i7roibPRxC1kxMGTXVYGONO6APVdpfUYQy9dQp7O6c3dtWyojlH
         Ovm0hg6kXQoTrCta8BhkVOVBThlOHCIcOkYwFsfbfA4sEfHzZKJht0htNh7zUMjh1GW0
         z6q+3f5a+NhB4Es0boGWXWd+OoY6X8/KtmFO7Iy5P1sfogpXkgsdKtffmzoFj9TqIvQv
         S7kDnJn1CRZ0GxUobjvibGUuneEc62647Yql1JLhNndFJhsFyOtGYa2WkD0lIJ6AgF6J
         W5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768088; x=1779372888;
        h=in-reply-to:references:user-agent:subject:cc:to:from:message-id
         :date:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wiy+RcG64sX7mBz15U3yLb1GGjIVQtRuDeERnf48qdQ=;
        b=NGVRGHySW/rgGcw/EyS/ARHXFY/rfG81jnOqryQ3fOYalRvigUAJP4YMUjRV7okp+j
         RPdORDf86T+/7p/bHI2N/vM2vilQeetBHMzbDSUfRPURdoBN0o4KbyEEjJZq5ont8ku9
         sNszTFbRoP4umVOFm+qPqY61f/h5IjTL0bsHE1Lk4BNVPRkzAvCvNeQbJVZ32YZq2N1H
         0gJEZdph6RwAyM9SDT5LmDLkWEC8+fBnAMUw41G+WAsVUA/B8rRke9wwbDr1/uOQ8aq0
         reXMwwNge/n3iMxkH06VoBBmBhXqigwqRSLOW+5B8lPcnGVx6adYS/d9cBay/vfcJG0U
         +05A==
X-Forwarded-Encrypted: i=1; AFNElJ+FMHdETCTnW2UZyqhzoUAm3Cq67DETGQQg2OwhsCf0oYFX0zvoRj1iNsCC18FynlbzAp3180PyIqIvCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRDDBmzB23h/1IeUIKdRwpLObKn+5D4IxRpeZ+K61948iRFefO
	QbhaWwjfr6vSV6ZzVrN248Rkfz29wZC4P8WWefmbwoykm1zjBZ/lucBo
X-Gm-Gg: Acq92OF5vhYGkXnWxPRyCwzGZPPkZAa2KoYp3VLEWiW4eDhlZ2alaosDpukgJFkeSUQ
	b1MJXl1tnsowlRQU7IGxJYQXsS9au7WSpmyXZ/lK8UGZWonTcRODbv/IpH6uOGfXNLl4eEhwpft
	k3xYuL4ovIuvzLcQQA0vk5Eg+opbRJY+0xnuaBhkmtMDArdsRKK5X5ptC8YC0DwGUQw2Gztc4jf
	3yW/b32F+Uxa8gSKeHGpMtBu2PaoFNo01vWmSQEx0XffWjA9bMaAqiEfD49BRCzAXw2L5LJlGR9
	hSk4AuVWHuTzXXidQRXE/i67yfBw7gitVnGPDwbEkL/GTxUQpGS6Ek0LUHj5GFKEiScLz5hkRF4
	ZyHF7u+3IUDIg+HY9aaWej36jNXTAD4uYefgXAWoBNfGKS8BxJ9tfj0xb+QQvnLWpYWUgkFppp1
	v60/j/X/l2A38HCesP1k0eSQ==
X-Received: by 2002:a05:651c:198e:b0:38e:83a6:d4c with SMTP id 38308e7fff4ca-3944b38dbc2mr29469911fa.7.1778768087998;
        Thu, 14 May 2026 07:14:47 -0700 (PDT)
Received: from localhost ([178.205.236.109])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8859d0sm6586631fa.8.2026.05.14.07.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 07:14:47 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 14 May 2026 17:21:36 +0300
Message-Id: <DIIGT2B04NER.LLGB7WGGPC2N@gmail.com>
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Jiakai Xu" <xujiakai2025@iscas.ac.cn>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Cc: "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Chunyan Zhang" <zhangchunyan@iscas.ac.cn>, "Matthew Bystrin"
 <dev.mbstr@gmail.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul
 Walmsley" <pjw@kernel.org>, "Samuel Holland" <samuel.holland@sifive.com>
Subject: Re: [PATCH] riscv: stacktrace: fix stack-out-of-bounds in
 walk_stackframe
User-Agent: aerc/0.21.0-0-g5549850facc2
References: <20260514100711.838895-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260514100711.838895-1-xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_071451_079762_509FC5C5 
X-CRM114-Status: UNSURE (   9.00  )
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

Hi, Jiakai!

Thanks for your valid correction!

Jiakai Xu, May 14, 2026 at 13:07:
> -static inline int fp_is_valid(unsigned long fp, unsigned long sp)
> +static inline int fp_is_valid(unsigned long fp, unsigned long sp,
> +			      struct task_struct *task)
>  {
>  	unsigned long low, high;
>  
> +	if (!task)
> +		task = current;
> +

I would suggest to move this `if` into walk_stackframe() function in order to do
this only once before walking loop.

>  	low = sp + sizeof(struct stackframe);
> -	high = ALIGN(sp, THREAD_SIZE);
> +	high = (unsigned long)task_stack_page(task) + THREAD_SIZE;

Also after grepping `task_stack_page` I've noticed that pt_regs structure is
located at the end of stack. Maybe it is a good idea to adjust border even
"lower" to check that sp does not points inside pt_regs? (see task_pt_regs
macro)

>  	return !(fp < low || fp > high || fp & 0x07);
>  }

-- 
Best regards,
Matt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
