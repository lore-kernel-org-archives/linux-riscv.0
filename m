Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559FAC25B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/N79IirO1tT1kAkTrs/dbwjWyT7xzBMwdIMhfzVlW/g=; b=VtvvDcq9i93k/e
	SaSuby24SYXNiKz7WDlOVUbruhaUDSZW+LjlClHBUFRTCtZKGghv/QBtkPWCVFgcgQfNG+MrtiIG6
	BAWe5LOpvlT1xOHJIWOPZgKgbbDtAPWVdU27lt6lUwS/9YhnAD7xrd3g8nHH8XxC9SmS6EAFDVvBQ
	1Q7dAYVTczgYgabJxKkEeIR7RQ5OjUuuCAmpAaPv19SDOBP226ocjSgzgyWH9yaSMH/XVd5caMBXW
	XBqKCOxrhVRopRL4joL55LKEGX/JGb0DmiOpWM49YBuRXK+U/MAVCWSvhMNER03QcOmAKQ938RvUO
	PLwbGFd8Q7ZOGnSmEuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwzR-00000000q32-2vt7;
	Tue, 28 May 2024 13:35:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwzO-00000000q1o-0vKk
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 13:35:43 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-357f1c0b86fso611888f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716903340; x=1717508140; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjGXaowzOpIF3QbPazGFsBGPsl4FgWIVG9cNH5OZlLw=;
        b=W7Gmi4XzAHR63IJQYCDLhx9uhhxKobocUaBlJ5OksXI9VzXpqCBWzfWQWtYQu7BOiS
         FrwVySSUaGoDudKArLPMU++WuLZvBf0CjzCh6lnnLZUyMSlaVXW88/mKIL1+7cuWl2/S
         qTDJFhxLnoys4PG7++Nf3Apn2f00ySFencTF0/UljKQmCe5E6PvBDcJvEKhwowx0Qj81
         KF4Fk0HipxcY8witXuZpdI498sGK6iW7N/KWXAvQg1/QbAWpSf7NA2gAqjbFUEuKBF/y
         reKi/IMCNyrwNaZrDCUNAK+iTwI1GOO9NNTEJMoYozgRgQLYW4nj3v+4fD/LArtIcIeo
         7x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716903340; x=1717508140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjGXaowzOpIF3QbPazGFsBGPsl4FgWIVG9cNH5OZlLw=;
        b=HjU5ie0t+Qy5Di3htN/YxHm3/FSBwb9ZndxOTySMC/0G4HFX+z98R8UgFVkY9zgAjN
         ZJ8nchG5yDtPI8P/YCgSLDIQmnsm/pSInO09LD4EcQiNqDdxnKzII/Fgqujm8Do6w6H8
         hj5OkESVi0nKDOanpn4i1GiaFifFAx/RCS3mSuDS4pAejN9xVVrrBl+v9VGPjxh5BF82
         u1HD5zUXPtzkMYBSPuro4DQvOBQsqWZZ7cMRVR3UJu4X2HWObcgjQ4prcOIAiksaEvZa
         jTgCZ/IPzleOgczxFX6gJSvECRLnbF+Qd2n934E6K32nJF5DVlBLnUO7AE3QRNSnY9oL
         nG7g==
X-Gm-Message-State: AOJu0YyAlxk2oVSdnwjCqfcQaNKnTncNDvh7TsSgWu5yeluwxElQJ7pR
	hjMNbIWQZ4hykIWz1Fcckxbq4MzF4hke4yS+UirqBiXfR2ZXXgsUlJGTSP3ztBt9SWn1jjvZzs+
	8Q+E=
X-Google-Smtp-Source: AGHT+IFbOwoRSz6/nVrWGNSVmDQHjWUjIuJdCuhVXgFdFXelciHbbbL1yL6O7el2JjJ+1u9RO6CYZA==
X-Received: by 2002:adf:f08e:0:b0:354:dd23:7607 with SMTP id ffacd0b85a97d-3552fdfd438mr8792336f8f.57.1716903339771;
        Tue, 28 May 2024 06:35:39 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3582917b222sm7268083f8f.93.2024.05.28.06.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 06:35:39 -0700 (PDT)
Date: Tue, 28 May 2024 15:35:38 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, xiao.w.wang@intel.com, pulehui@huawei.com, 
	Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Pu Lehui <pulehui@huaweicloud.com>, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH v3 2/2] RISC-V: separate Zbb optimisations requiring and
 not requiring toolchain support
Message-ID: <20240528-4a498a28af8d912561d1a103@orel>
References: <20240528-applaud-violin-facef8d9d846@spud>
 <20240528-opossum-flavorful-3411811b87e2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528-opossum-flavorful-3411811b87e2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_063542_292175_EC2ECF93 
X-CRM114-Status: GOOD (  15.81  )
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

On Tue, May 28, 2024 at 12:11:12PM GMT, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It seems a bit ridiculous to require toolchain support for BPF to
> assemble Zbb instructions, so move the dependency on toolchain support
> for Zbb optimisations out of the Kconfig option and to the callsites.
> 
> Zbb support has always depended on alternatives, so while adjusting the
> config options guarding optimisations, remove any checks for
> whether or not alternatives are enabled.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v2/v3:
> - Per Drew's suggestion, drop the stub Kconfig option and instead push
>   out the toolchain dependency to the relevant callsites.
> - Delete a bunch of comments about only attempting Zbb if alternatives
>   are available, since they always are.
> ---
>  arch/riscv/Kconfig                    |  4 ++--
>  arch/riscv/include/asm/arch_hweight.h |  6 +++---
>  arch/riscv/include/asm/bitops.h       |  4 ++--
>  arch/riscv/include/asm/checksum.h     |  3 +--
>  arch/riscv/lib/csum.c                 | 21 +++------------------
>  arch/riscv/lib/strcmp.S               |  5 +++--
>  arch/riscv/lib/strlen.S               |  5 +++--
>  arch/riscv/lib/strncmp.S              |  5 +++--
>  8 files changed, 20 insertions(+), 33 deletions(-)


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
