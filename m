Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43DDE6FE41
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 18:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LKoO5upWhhggQc0oAqBMwbFwFUut2fREBP3OibyAgGc=; b=cbzA80lKM5Yt6JUJWYWEz5JnFG
	cHFNScavSHrvo0bZQSZsbtH2DJVIzIEJo5a05qFCHkNj57DLhulPlyFX7hTng3vbIwqCUJXxNkhjw
	xys9OfReWZrW7BAoB2+x+vIa5PXUPIhdvRkc8OVlOal9CP+b7t8rYP9Y4zVdZ8rpaa8W/VklWPmsY
	ogiRyd1ffj7bcmnTco77jaIhEYI5o4pFqWOIFQF/yqTOSLwanuQbI9IlO+mDri9hWM2JqIU+9XevP
	ffH0piKE5qFlS21qZjEBBcWxKZHpyqCqre9DijUoOiTM8SoJqVZaLTvq/JMmT4oBRK+mLpx90dGbU
	qmIhAoPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sme17-0000000DKo9-3hCF;
	Fri, 06 Sep 2024 18:49:09 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sme05-0000000DKYU-1SRH
	for linux-riscv@lists.infradead.org;
	Fri, 06 Sep 2024 18:48:07 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2da4ea59658so1762143a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Sep 2024 11:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1725648483; x=1726253283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDfjnNTuhJ1M2Y8qERtlchXQOcy0y5eMF9qJKZkx/Vg=;
        b=UELN8+pvrryZpA8/ZE/16hapWj8vUxkF3QmEn19TtugWucgdOhSzQccM+1SPXdc+ob
         U12YwjxyhP9nWCqlc0oC6gjr9Qx61JhIcEROoK4JUakR+9lCCrLtefIwF5YhROZBJfMm
         g+Au0gjvk1gk7VmlA1s5qivOeNNGiALgmI3mI5Hf/KhYzabzwcLOIgx4GJjI9AUv4n4J
         g4mHb/KI0OihSj+B6OjI969hhANepKKWBlyru3jTewhvGy8Vcq6mzshEvmwHY/ZFLouz
         r2ijW44ptKT8GYaUrBq8NetabkJtK7YTJ55gek6oCNMpRQNYfFhT6eU8REbxDs+PM8in
         +s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725648483; x=1726253283;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDfjnNTuhJ1M2Y8qERtlchXQOcy0y5eMF9qJKZkx/Vg=;
        b=hvpqaH+yyOOj2XwbVo11sb18sOhlyKASn8DgaBt1GBQ4gR72t4qeO0bwqqq2oyzzy8
         bEOAr6T4/x5tKJ8JVXRfXsQJdjMvBxR1MkHuqbFoeEHyYjNHxHVifCwZT1qYEYwEHW93
         9fKcdwa8ineJayRkNdsMLQPlJwf20Ij2kgMSdsofZcKvP3SR48t01mOqNNccATpsuSVl
         WEOYB4HM9UBd0D76Cx49WFcKRXDv2+M+vEy3UZGb1mMHJ6Y2mtUZkZwZtjDyaANuMA4M
         glKtfYvy4zdgIxDSRn8MyAOUXSM15rDzRnLAQQD1CoI3Sso3VzwvIq+XmnlHv+1w64Rm
         JrlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/9gvb9B/tk5cotbmvK+o4Kx0lxYe/2x0PFWn/edHSUTndifDaOVt8XGYoEAFaflYmVy0EnqhETNLx3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGufJNyNgVzDC8TLaS4BHg3pw0Ld1LKY5xqWGAFHPz+z+rfswk
	lo6PCt8W+u4SuIva0tpRO8m1ybfT+qMjnWL9wYsRzeGuPuM/HquwIynUTKD3T/c=
X-Google-Smtp-Source: AGHT+IGSyjqaXLwQc37zez1HA3/9odmd9/yVOWTdmYy4wu/O1qCk3XNwZEvh8HYjK/OdZjH8X2vmFQ==
X-Received: by 2002:a17:90b:4c4a:b0:2d3:bc5f:715f with SMTP id 98e67ed59e1d1-2dad4df9581mr4811501a91.10.1725648483419;
        Fri, 06 Sep 2024 11:48:03 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc03700dsm1954913a91.21.2024.09.06.11.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:48:03 -0700 (PDT)
Date: Fri, 06 Sep 2024 11:48:03 -0700 (PDT)
X-Google-Original-Date: Fri, 06 Sep 2024 11:48:00 PDT (-0700)
Subject: Re: [PATCH 3/3] riscv: Allow to enable PREEMPT_RT.
In-Reply-To: <20240906151324.tVwX6lFy@linutronix.de>
CC: bigeasy@linutronix.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org, hpa@zytor.com,
  aou@eecs.berkeley.edu, bp@alien8.de, Catalin Marinas <catalin.marinas@arm.com>, williams@redhat.com,
  dave.hansen@linux.intel.com, mingo@redhat.com, john.ogness@linutronix.de,
  Paul Walmsley <paul.walmsley@sifive.com>, pmladek@suse.com, senozhatsky@chromium.org, rostedt@goodmis.org,
  Will Deacon <will@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: namcao@linutronix.de
Message-ID: <mhng-64eec780-df98-4e8d-bf6c-0aa07a8d85da@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_114805_594137_A980A1B5 
X-CRM114-Status: GOOD (  13.19  )
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

On Fri, 06 Sep 2024 08:13:24 PDT (-0700), namcao@linutronix.de wrote:
> On Fri, Sep 06, 2024 at 12:59:06PM +0200, Sebastian Andrzej Siewior wrote:
>> It is really time.
>>
>> riscv has all the required architecture related changes, that have been
>> identified over time, in order to enable PREEMPT_RT. With the recent
>> printk changes, the last known road block has been addressed.
>>
>> Allow to enable PREEMPT_RT on riscv.
>>
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> With the printk patches applied:
>
> Tested-by: Nam Cao <namcao@linutronix.de> # Visionfive 2


Thanks.  LMK if you guys want me to take this through the RISC-V tree, 
but no big deal if you want it somewhere else -- and if there's some 
dependencies already going in through some sort of RT tree maybe that's 
just easier.  So

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I don't have a test setup yet, but I figure it's a new feature so I'll 
just flip it on as a config post-rc1.  Presumably this just works in the 
QEMU virt board, or is there some wizardry I'll need to copy?

> Best regards,
> Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
