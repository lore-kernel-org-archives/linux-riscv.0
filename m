Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1143C27C79
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DIVE9g115XbstNcU4KS/xjgwm/4Wc+nN5EGwE8XVeM=; b=TPsCMTnHWjRPe7xz4uU1yYHz0a
	q4pIuEONXbPy7TEgbUBD73K5rNTt7iykx/5dIvSggVN1Pcn+FhUipat+p6DSyQbR9sdPqgEG12/1y
	XTjxuXOc51+7UdqIB3n3afrLsC6JazXzeIrdwsz+C0ZeqnMrJcsQ//b0RF53nAN9NbIbrPCnOWlIX
	ZpS+ika+uK/hGI3lMksBC4wQp9o0yG6FKkewiA0DqGTmNn91s3MeoLE5sXPRS/LM22tdblkVdgyq6
	Bgy9u41Up4GrQLP8bizDa1bhzEdz0IJSZ8PrVjrMfvOJIBNRQ5w3+cLKM2Fh6n0m4vaRqzfXTYArr
	LrTlArIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyjE-000000029Ph-0R4I;
	Wed, 19 Jun 2024 17:04:12 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyjA-000000029OD-2sBp
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 17:04:10 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2c2dee9d9cfso43618a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718816647; x=1719421447; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TAmY0dpTBtMx4Mn7recj7mq784whApdYU20AquEoqcw=;
        b=vyhmzrKyTU436KXRsF8hXZKwzVtrn+EX8RI8Sg8XNdcZ37lCwUnrF/W4taXxG0Rl1W
         vNE2BoQx5opisUZ4d5/whEYowATMGzsWi7Iygb0AtNK1Pl5ICDkXLD9IQENnTDJozzlS
         ydBL9NN862RnfYJDRYsU8sF6xmvNp8wjVxewsPvAHlKZfDlqmdzZrxguhESn0zJExIQu
         whXRSuhgn9svW7zQFny/AAtdAD8MIxYBTN/2qSK7hHDciGuWjC99RLlTbQYIe4ryDwxU
         v6/FmawWyuzJCwQa39/qA5uI8VKCrub/xdp3R0Aaog6cnHM8b++Bhgd3cFVAUcc+VfMC
         jyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718816647; x=1719421447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAmY0dpTBtMx4Mn7recj7mq784whApdYU20AquEoqcw=;
        b=YYvYGjt6t14VeC+aCPhlAeqqGNJ0emVTCeJ195ova49kCgB1dnA5w/1AkPqGM+5NS0
         AJRPuGIotivnzcgH4opREZLLESJLl+CgyH096UlspVEx35UPlch8TvX5q+Z+wrPWxS92
         uQDUy09ilbEkhptD/iBEd152hYTy1RHuZYmXK0yh2cYVybwmzOKOIizH4n02FU/jSNv0
         3bt8j7LvPWEjsO5gZar5zKZvm1S1uVXU+jasx8zJO9XN0RrcZ/1xWpOSqe5aGVJbAp5s
         ueVp8kFasMhiRY6ANn3qHz9Bm2roFJXMQNxQfUfmjbZDVAXS9QQ2uAAucOeBbavTuKe0
         4SYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcDCqzaoywGcDkzQC/oDAI9VfSUO6OGrVy01/yDTKMe70smll4RJA6ilZOsmq2EAbR0OTFxZ6HvZlyh0UmKCMETt4tdmzCtTaazUc8Vuul
X-Gm-Message-State: AOJu0Yw12S2tNm+7xr/nyWb4K3OhpFbeQtBD5xWMN4qJbrUFkXKZd8jR
	Mn6xbrRmieXZ9psHnsxxPDIQaE4THXrW9DIAruEYx+KRpGRR0Tw/vLkQ0XG9RN8=
X-Google-Smtp-Source: AGHT+IEUXk33dow3y7Ft7RbTfxe/eeqqRE8L7RgGsxt+H4OKHabp0dQGgOvRijuFe3sL5j8D4BwSOw==
X-Received: by 2002:a17:90a:ea83:b0:2c3:c80:9ac8 with SMTP id 98e67ed59e1d1-2c7b59f0c7emr3179324a91.9.1718816647303;
        Wed, 19 Jun 2024 10:04:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c7c989b35bsm1446583a91.46.2024.06.19.10.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 10:04:07 -0700 (PDT)
Date: Wed, 19 Jun 2024 10:04:05 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Clement Leger <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] riscv: convert bottom half of exception handling to C
Message-ID: <ZnMPhcaTKFRbbE1i@debug.ba.rivosinc.com>
References: <20240616170553.2832-1-jszhang@kernel.org>
 <20240616170553.2832-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616170553.2832-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_100408_746959_1CA05A7C 
X-CRM114-Status: GOOD (  11.55  )
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

On Mon, Jun 17, 2024 at 01:05:50AM +0800, Jisheng Zhang wrote:
>For readability, maintainability and future scalability, convert the
>bottom half of the exception handling to C.
>
>Mostly the assembly code is converted to C in a relatively
>straightforward manner.
>
>However, there are two modifications I need to mention:
>
>1. the CSR_CAUSE reg reading and saving is moved to the C code
>because we need the cause to dispatch the exception handling,
>if we keep the cause reading and saving, we either pass it to
>do_traps() via. 2nd param or get it from pt_regs which an extra
>memory load is needed, I don't like any of the two solutions becase
>the exception handling sits in hot code path, every instruction
>matters.

CC: Clement.

I think its better to save away cause in pt_regs prior to calling
`do_traps`. Once control is transferred to C code in `do_traps`,
another trap can happen. It's a problem anyways today without CPU support.

Although with Ssdbltrp [1] extension and it kernel support [2] for it,
I expect asm code would clear up `SDT` bit in mstatus. Whenever `Ssdbltrp` lands,
I think `do_traps` should expect nesting of traps and thus cause should be saved
away before it gets control so that safely traps can be nested.

[1] - https://github.com/riscv/riscv-double-trap/releases/download/v1.0-rc1/riscv-double-trap.pdf
[2] - https://lore.kernel.org/all/20240418133916.1442471-1-cleger@rivosinc.com/

>
>2.To cope with SIFIVE_CIP_453 errata, it looks like we don't need
>alternative mechanism any more after the asm->c convertion. Just
>replace the excp_vect_table two entries.
>
>Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
