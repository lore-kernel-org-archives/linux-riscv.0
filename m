Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F6AC27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 22:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC9JbVEELZCxtc3MOoFOaJot6UGjXW3z8zBJvyc8Xe0=; b=krwFmtBmJ6KVAtmBGWTVHQKs8g
	Oc9LrndC8iPL9teR1Sqhp1hth1F0AXigQyZhXpSqjxPiJRIZ3Pa/unwKpCnydUitCFRMI8fi5rGy7
	w+mPGbTQbEm+B6YIG/ROpHerJL3vCRzh30UmZcVbLPKD1bgWT0yZbFoiUCh8ztzA7eQ+96Kx7USkn
	DrHtexuZ8jIE/p1sS8yRV90x25+m6QFj5k1XAVqGWuaTC/gXAimELLvKqvEwU8kyIzSfzJbakKpbT
	ycyXChsr4teArNy8XembU34WGVxUsbfpVqpWUkiNELQuGQ12Web3dzTVErhFL80nPQdQFe/Q+NzEt
	2Ium8yjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhee-0000000Fn5Q-3oSl;
	Fri, 07 Jun 2024 22:01:48 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFhec-0000000Fn50-3tdn
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 22:01:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7023b6d810bso2152406b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2024 15:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717797706; x=1718402506; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=75kpnasqev5JD+W3tO0sE6ARWTXSJTS2/9u8O9IAZK8=;
        b=PWPguE6kAq76UOPeBmEaQhgRhblhJFaMI7cNd4uYN3cHPufuO4rg8D+b0SUA8iz65w
         D4Qcl2DEDpsaRj5Gj/z0rQPZULw4fWNdfJydDxEkI5uLjY64VYdTUsXXFvM7oR5xCXWU
         C23rcIk0/2mZfvAeNWtCOVN1S9nz2uY3xcphdw9TtBpu43p8TMkMlnjR+WgW6U+Wu2i2
         35TQaXkBgpU59fSdmsvJW2DG3QaXBOGoeVT+Q02ZTIqy3oT7Zj5YeqqrOcouVoh7USIh
         lJiPpTEsBbXUQUgve84YxkYmtQTdUMUwDTKTa7tHmm4IpdB5NaviBA+cn4ONrx4qYo/Q
         PFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717797706; x=1718402506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75kpnasqev5JD+W3tO0sE6ARWTXSJTS2/9u8O9IAZK8=;
        b=PE0oQERYexEWVK/tes0rmlUrpcxrSOg9zlriB5MPv0TP57sJK98qJUTf9AEFfwuScZ
         VfrYLblIrIM0iKR5pCu6tXbjkIKivn0/Qn20IslODGNisTI9Fn/T6pVb+CQcFaJxBpts
         ETC06hoq4wjpG5CDzuahUOYghmM3skX+HIBazl5/Rt6dzTawzTM8fF2ZkMduyxoP8Vk/
         /e1w7XqtPAI705Ve+VZhit5zwYrCYjuPQVk3fC5UagsD/z0g+KmAbTprgySRBhjnASCy
         zrS+NyhiGZun+AODFPNvHLx4eYjwoloGPo1yNwOsWuMnGWT0bGj+rr20tGylTs8mhzRg
         W4Kg==
X-Gm-Message-State: AOJu0YzK3ddg8mDq97qOUPp4yLXO1beGtPxUkI9k+KSdHTA1LjjQ/6NW
	2y+uMkH155OztxMqXJT7i4K8K+bnxFcw7pHFioUzkosqcbuS6aPFYcAryViGdMk=
X-Google-Smtp-Source: AGHT+IFChtu4tG/SxDzBPzFrzoSYJnwGMc+HGLFVJlSWYwIe/rm/MSoAbdLGq//B/YyTZI5ubiDiXA==
X-Received: by 2002:a05:6a00:4649:b0:702:6f45:effc with SMTP id d2e1a72fcca58-7040c690d1emr4038399b3a.20.1717797705590;
        Fri, 07 Jun 2024 15:01:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7041fef8548sm394640b3a.113.2024.06.07.15.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 15:01:45 -0700 (PDT)
Date: Fri, 7 Jun 2024 15:01:43 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] riscv: Per-thread envcfg CSR support
Message-ID: <ZmODR+EMn5zW2Iu1@debug.ba.rivosinc.com>
References: <20240605205658.184399-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605205658.184399-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_150146_996615_2F7176B2 
X-CRM114-Status: GOOD (  13.72  )
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

Hi Samuel,

Thanks for working on these.
Patches looks good to me. I've given some suggestion for patch organization
and squashing. You can take it or leave it.

Other than that.

Reviewed-By: Deepak Gupta <debug@rivosinc.com>

On Wed, Jun 05, 2024 at 01:56:44PM -0700, Samuel Holland wrote:
>This series (or equivalent) is a prerequisite for both user-mode pointer
>masking and CFI support, as those are per-thread features are controlled
>by fields in the envcfg CSR. These patches are based on v1 of the
>pointer masking series[1], with significant input from both Deepak and
>Andrew. By sending this as a separate series, hopefully we can converge
>on a single implementation of this functionality.
>
>[1]: https://lore.kernel.org/linux-riscv/20240319215915.832127-6-samuel.holland@sifive.com/
>
>
>Samuel Holland (3):
>  riscv: Enable cbo.zero only when all harts support Zicboz
>  riscv: Add support for per-thread envcfg CSR values
>  riscv: Call riscv_user_isa_enable() only on the boot hart
>
> arch/riscv/include/asm/cpufeature.h |  2 +-
> arch/riscv/include/asm/processor.h  |  1 +
> arch/riscv/include/asm/switch_to.h  |  8 ++++++++
> arch/riscv/kernel/cpufeature.c      | 13 +++++++++----
> arch/riscv/kernel/smpboot.c         |  2 --
> arch/riscv/kernel/suspend.c         |  4 ++--
> 6 files changed, 21 insertions(+), 9 deletions(-)
>
>-- 
>2.44.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
