Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A13EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 06:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=E28hfs2cB7KQJHliKMYM/MVuT19nPwPiBVYfu5DHinA=; b=jyHtYRRRuW9OeaAFbLMiw6ryYz
	NqoMKWkSlSzxS07mMGJkbQ4qtAX9bWTFNW+TTfBnJHmRlsRL7A3O8whC9WO7y0fWBpTnDFTE1kSFs
	SIgmmBGZ+PgniODsv6JvRC8JnHcTQ20Nh1nJXqJ6W1Y3rd+lhhIJWxl1UvVL2UsJ7h6ASjzOFquXK
	aKelaLwHCb3noljG8X7c47ED7DGV+uYl5g/AjNwhs9Qsm2a6Uj38qDT0r8MfphEPB0HubAgT9p7wZ
	05ito0mSZS81Cf1Khsna03BqF0wYUCKLgnn5St3T3lKRuX9WNlHK2tT74RF3ta5xdA5RMtEX7yqT5
	KDGe6sgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTcJq-00472M-2l;
	Wed, 09 Aug 2023 06:05:18 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTcJn-00470s-38
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 06:05:17 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6bc886d1504so5783269a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 23:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1691561113; x=1692165913;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cY5+9Nxr3hMpBIcVjJ2A1HxHHNO3+KvDHFWewPfKnaY=;
        b=jp0dxee+U3RXZvnECVOyxh2RjCyxB9djh4j2mgSb0QC1A9ADttg63b9ycQDXsTqnqS
         BDY8CPSxu4A+97tRTnz7XenlI9UyPlr0J4aibWlgKBhVfn8ZLQ8ZW49rbYV9F8znc6M2
         zErq4mu1m9ZBOI4SsheDBq16unV2QPkNXdA8CUtTRX+UE8O/zEQoyhPw6J+BVEXxSruO
         UbH7V4JQ+jDh8ACDojhD8cUH6d4SVV7RNoQWjfPrd5afEZkL7Lr9HBSJqnM+OmWFhgYj
         3hVEaOLGdRDiXm0i3QRNZizZxOreMm71oG0QbRqU+Z0VW6XAqBiVJ478NCPt6mZLEbsZ
         ee2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691561113; x=1692165913;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cY5+9Nxr3hMpBIcVjJ2A1HxHHNO3+KvDHFWewPfKnaY=;
        b=L2bECNLH+IhO4p/FHB6jB5QIZWmsrLFgLf1TZ0zjxddopHeqyUYi35xQ/6BM+jIebE
         cwgTpihWjO++BvYcAYKjsTORNhrbNfAzT1+roONx7Sp4SQm+kZpoiVYb0ZMMxc5+Vofa
         2O4rzBBjUtd/Zc/HlXGrnHvobKFrT2G/GyDnvIwia0AYJkh+YZD2RYEiUcTxemejXsqx
         uw8MnSkwKcJ9ojEcJVqVEIJHXu5YNVLt5dFcWeHiu4gzgYzmmCRncpM+Kvo52tuPGZEj
         D2bXkIPxp5f4eCGKR9nDcr19QC6sfTjKu8+ec2mo8P6Yf9xSe7bI6SkUsAAQbKLJmMT2
         e70A==
X-Gm-Message-State: AOJu0Yw7bb6InrQGcr4WNNkSJ01wFZ9uKJREZaq7X0F8KDCzGABv74DB
	uMZabtS6hZ2qkrmsK0+arsORNg==
X-Google-Smtp-Source: AGHT+IEUdB5DcsgWdt+hFTJoViDD+LvjFcHNIz6EXmTULjgjgtlX4VZ/p3u9kBuJeAetVGdlgcYW6Q==
X-Received: by 2002:a05:6358:4285:b0:139:e7db:3f3f with SMTP id s5-20020a056358428500b00139e7db3f3fmr1624901rwc.10.1691561112849;
        Tue, 08 Aug 2023 23:05:12 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id j14-20020a633c0e000000b00563826c66eesm7466161pga.61.2023.08.08.23.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 23:05:11 -0700 (PDT)
Date: Tue, 08 Aug 2023 23:05:11 -0700 (PDT)
X-Google-Original-Date: Mon, 07 Aug 2023 06:56:35 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix local irq restore when flags indicates irq disabled
In-Reply-To: <20230725070549.89810-1-luxu.kernel@bytedance.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, luxu.kernel@bytedance.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: luxu.kernel@bytedance.com
Message-ID: <mhng-a0239c56-385e-40a9-8a71-45d50e28b45d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_230516_226454_CD91E777 
X-CRM114-Status: GOOD (  21.69  )
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

On Tue, 25 Jul 2023 00:05:49 PDT (-0700), luxu.kernel@bytedance.com wrote:
> When arch_local_irq_restore() is called with flags indicating irqs
> disabled, we need to clear SR_IE bit in CSR_STATUS, whereas current
> implementation based on csr_set() function only sets SR_IE bit of
> CSR_STATUS when SR_IE bit of flags is high and does nothing when
> SR_IE bit of flags is low.
>
> This commit supplies csr clear operation when calling irq restore
> function with flags indicating irq disabled.
>
> Fixes: 6d60b6ee0c97 ("RISC-V: Device, timer, IRQs, and the SBI")
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>  arch/riscv/include/asm/irqflags.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
> index 08d4d6a5b7e9..7c31fc3c3559 100644
> --- a/arch/riscv/include/asm/irqflags.h
> +++ b/arch/riscv/include/asm/irqflags.h
> @@ -49,7 +49,10 @@ static inline int arch_irqs_disabled(void)
>  /* set interrupt enabled status */
>  static inline void arch_local_irq_restore(unsigned long flags)
>  {
> -	csr_set(CSR_STATUS, flags & SR_IE);
> +	if (flags & SR_IE)
> +		csr_set(CSR_STATUS, SR_IE);
> +	else
> +		csr_clear(CSR_STATUS, SR_IE);

Unless I'm missing something, the original version is correct: 
local_irq_restore() must be paired with a local_irq_save(), so we can 
only get here with interrupts disabled.

>  }
>
>  #endif /* _ASM_RISCV_IRQFLAGS_H */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
