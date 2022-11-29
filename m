Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CB0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 21:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSOf7o1h+nC6+7Wl/vqa3Hy1OdP0bU8W8lbLY/M22p4=; b=PpL5ilHlAwyXhf
	4AzEWBuVeUhWPSMHqNEH8K+LMPB0xTvFuP30SlTgZWJjGfxvgzQ7RLqVGK9xs/bufmFrZA+qAFe6q
	/4T0/EoZVqiK8LW0UclY9Gsw8N7lKehcumNm7+a8kcZMcatHz1hT3xCRbPZLXpU5E3XKoZ9e6v4YB
	5ittctUVgmnsCra/p0oU2q6KIcf6Fng0Tdu5RCnFB1u6XfXQCJbGFpgSGlGISyZeclTTjy4KhgTIN
	GxubsNc9IKq//hFf8CL/EB9Y3N+/JPXm5bWQIT8q/7P422AtPZ4mW6iMzuY4E+wbn9EuDmQwIGuSH
	CKvv/pJGrJJ2OWH9xAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p089H-00BOKq-2A; Tue, 29 Nov 2022 21:28:15 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p089D-00BOKV-Kj
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 21:28:13 +0000
Received: by mail-pg1-x533.google.com with SMTP id h193so14215184pgc.10
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 13:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOvn+nx1mY316X5P5YVfiCOUUssYoSKyjM2gRJCplYk=;
        b=LMbeT03DIXsXPQb3DQKN1+WO3YnHfDTgAIpqqLPDjpKbBXUBNTskMRw7UCsrNWquAt
         8yd5FSQkt1uIHByl17WVzmnDYpygNmPzC6RyARPtIH+ncsPzCaODOm7RhiSO4ZzHMTXg
         25Ya+F/RCoZV8mXz8f482M+fMQq0vM9ioSDgQb37keeD1AgYCtQYuScLyQUCjNYGj4qE
         2oM15QEc0bJF/vmkAzLWSMtdlxviqeoDQYqryG7SzNgzuf+bLwYLe+fUhQaaMAauOw1c
         /w/azAnnOjYKlkp05ZMnlW/oRwUrZQ68REjUrDvb0MgUp7W96qUpmLEoFZXepr/U5hKf
         zLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOvn+nx1mY316X5P5YVfiCOUUssYoSKyjM2gRJCplYk=;
        b=KPgxRDdRnXx5m+WRnyjNrUlKk4pV2wKs+K5AftC8MuzkWGKRERg+2tH4Y1Wxiv95Qe
         9/Gb2MgZQxxxPqANxZhJwtOeOuHWsh8+aYrdtsBPMRKDIu2y8pi28+p4CxuVnXlW6XYk
         WqVNgUdjphfv48MhiD8WHmR7RHmIISYyAoTcNp+mFZ53ZA1wY1k2/Zc9u+V4lCAu3WZx
         7Dl+5nBV6LUeakRlAPn9d3Bm+xFAuPumSzYM/q6zT/1RoZ2kL5pm2kvxBLjBsQZ9RzWC
         R9XA+HuUGWU89ZwGOpOm6d/uNeSRXg0GGvJJP6vHnpAbvDJFPI10Kj3BNHXELNTpm8fg
         t/ww==
X-Gm-Message-State: ANoB5pnJHPvVak0FYeY0HmafRSy5lrWdz7RwX5BEQOYHYf8qh6vNYfdr
	/nJ4gIVvmKIBKBeQd0f3u9QwaA==
X-Google-Smtp-Source: AA0mqf5Hbr8ypFwWFx87qyJ8S6r6D/vHTbgbADI8BJC6zLwl6OtBFYNIhMUxGHqstqKvJo6MhlwZmA==
X-Received: by 2002:a05:6a00:1d0c:b0:573:7b50:acb8 with SMTP id a12-20020a056a001d0c00b005737b50acb8mr42312195pfx.59.1669757290118;
        Tue, 29 Nov 2022 13:28:10 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id t3-20020a6549c3000000b00477bdc1d5d5sm8794317pgs.6.2022.11.29.13.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 13:28:09 -0800 (PST)
In-Reply-To: <20221021160028.4042304-1-conor@kernel.org>
References: <20221021160028.4042304-1-conor@kernel.org>
Subject: Re: [PATCH] RISC-V: enable sparsemem by default for defconfig
Message-Id: <166975687110.10326.1643787645847753206.b4-ty@rivosinc.com>
Date: Tue, 29 Nov 2022 13:21:11 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: daire.mcnamara@microchip.com, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
  linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_132811_721315_CB81EA46 
X-CRM114-Status: GOOD (  12.49  )
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

On Fri, 21 Oct 2022 17:00:30 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> on an arch level, RISC-V defaults to FLATMEM. On PolarFire SoC, the
> memory layout is almost always sparse, with a maximum of 1 GiB at
> 0x8000_0000 & a possible 16 GiB range at 0x10_0000_0000. The Icicle kit,
> for example, has 2 GiB of DDR - so there's a big hole in the memory map
> between the two gigs. Prior to v6.1-rc1, boot times from defconfig
> builds were pretty bad on Icicle but enabling sparsemem would fix those
> issues. As of v6.1-rc1, the Icicle kit no longer boots from defconfig
> builds with the in-kernel devicetree. A change to the memory map
> resulted in a futher "sparse-ification", producing a splat on boot:
> 
> [...]

Applied, thanks!

[1/1] RISC-V: enable sparsemem by default for defconfig
      https://git.kernel.org/palmer/c/41555cc9e2e9

I put this one on for-next under the argument it's not actually fixing a
regression: if flatmem is now broken then that's a regression, but just turning
it off isn't really the fix (even if it's still a reasonable thing to do).

Maybe that's kind of pedantic, but it's late in the cycle.

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
