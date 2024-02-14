Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C381C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvgrPuTOd1rHJ/OwOmHKgFpr+L7nwMP7jMM0eMQXIis=; b=SEZhwLhEEjXeid
	CV3qXEPapZr3F0ZjHmy2fh47KkxPmA8WEtSTe61LIIjqy7xUf8+m8V34pTPQEXjzRMaX50ThNTVyh
	4pnmVgu8qEz1zGeopsM/kTT9FD2/Q674O399lqbA+7jRA+6ckeZ39Gnqtqn8Pmo8yDUR5us6qla2A
	Z9ZBGysPT1GOWWI3y21q/G0Vwb4vwrw0z/SUEnjbqAOLtkPxRDoBorB3/fM1nfIdbsVpQntWEljBv
	P+hdeTVSl8+3Dh35nXgNZ+3M850AEgaEcNQE2g1SfTss1jbm75xFi5XGY/rK918EB2SbT9cLO9cbc
	qFCmBE6N7ZvZj2wIhIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHRB-0000000DMor-0owe;
	Wed, 14 Feb 2024 15:44:41 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHR7-0000000DMmb-1oKV
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 15:44:40 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7c029beb8c9so244217239f.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 07:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707925475; x=1708530275; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8H+tRUVl6VTTJ+I26hI6HADTZ0Un+fCkMERAMbKsgaY=;
        b=Ho6j4U+IJ4sUoAsvVFce468BCANfRqdDBwvLE4X8h77azQl0OzouL9Va4HbI118XBt
         tEM2rSWF2TpSS9u45TcUMcmm5KEegEF+1kPULifA4BxKW+owxCx8dFf5kwevfPxE6Mmb
         XMs4SvH9bh3ehRnpL5yso0XFwTRq5C/FGrAboULhB6o5BewOcjD+BsSKc5HvT+tFjSEG
         7k68CxXGhYAbXe94UKPJbGmYcOIsedYUFlZxuwGX0D6A6dnTbVY9nHILD4EoE64Effm9
         C+5vOXEnUGTAKFKjQOO36DPhWpQfdzey+jP0c8CONgSU1eeWa3wR+gMc7hLLY81hV3IR
         t7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707925475; x=1708530275;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8H+tRUVl6VTTJ+I26hI6HADTZ0Un+fCkMERAMbKsgaY=;
        b=I1FTVpHpol05EqKzN0iFAU1fYRLFkhPUL4hP4XyIJz0LBOELsYnUbvYqDre+qkR+1S
         WQh2txKU35j8d4xRO59wZJP6DAQeNrelkc6FCwzlw5243nuKyV+3sPrQBxhAJ2xUqn7S
         snoSOGJNERQbjcOslM+ul7SqzfPZZ9HpuPglUrxB/EbV/PujGVqgRw4DVdOOPEUIMrgW
         C0m8RPGPR0AibrHrej6sMV6ohpPzPwY9vdaxb/Dgsu4Njl172q/GM6e9iSUT2IJHi1Ol
         7FpwWV+vWqblh5SCgwXv6SCBkeQ01w3IkSEfZSzVCeR2riMCibZbDTPk9txRLmhG4DrB
         73dw==
X-Gm-Message-State: AOJu0Yw36jFTk9nUZBN1+EPPEhDKsqjNQ+XS3MLPMzfc7Fnw3jYzlzNS
	lakx6/RNKESjTv7mnxCxzn0lHb66WTK5TDMAhXLjct2ob01XkGaMnOUHo1y4IhA=
X-Google-Smtp-Source: AGHT+IFSYvJVra1vjtWRcKFPj8EVyDWmX9NPiOhHx5QSIIUGMlUmsQm/kaGm5mHv2EhcHDI6PNBp7Q==
X-Received: by 2002:a05:6602:5c2:b0:7c4:6b0f:ee7 with SMTP id w2-20020a05660205c200b007c46b0f0ee7mr3689037iox.7.1707925475720;
        Wed, 14 Feb 2024 07:44:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVppKyfQx+1K0Z9etHaCtXFjcZ0ltuX51rMZRw8r7Hn3rqRCqUQHSe34BMQK/vibc3EGnEXzCUDXX4aJ4y12fqw+eikFKbJZP5ND+IEH7dP2qbcptphPDaBqWt6hz5g9bUIJV9GCWSVWJQfbnnJCnu+LWiS+SRarXPQRnWJTg09a0MPqcpWI1tHAeJJhPB9tsBX2LLa5o0Ei26c6kfq9Z/xqc6LTR/9BVl/cNEVsrCWD6pzUEwyt1h8UvE1LbIBZ3ZLy4AoX8qKzUhS5qD94rXCEkllJmhGAkmWyzjq/AkRUe6mlU60S889xjiUSdlaavBP8ScOM07xOKaOA9kzG7a5an3KUfuaOFIjoK/zPTvrWtL54g==
Received: from localhost (c-98-32-39-159.hsd1.nm.comcast.net. [98.32.39.159])
        by smtp.gmail.com with ESMTPSA id a26-20020a02ac1a000000b0047133a05f33sm2484253jao.49.2024.02.14.07.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 07:44:35 -0800 (PST)
Date: Wed, 14 Feb 2024 07:44:33 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
cc: linux-riscv@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
    jirislaby@kernel.org, Atish Patra <atishp@rivosinc.com>, 
    ajones@ventanamicro.com, apatel@ventanamicro.com, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
    linux-serial@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH] tty: hvc: Don't enable the RISC-V SBI console by
 default
In-Reply-To: <20240214153429.16484-2-palmer@rivosinc.com>
Message-ID: <0e41108b-2a64-2144-34f1-e7c0f1ec952f@sifive.com>
References: <20240214153429.16484-2-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_074437_548420_4659173D 
X-CRM114-Status: UNSURE (   9.94  )
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

On Wed, 14 Feb 2024, Palmer Dabbelt wrote:

> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> The new SBI console has the same problem as the old one: there's only
> one shared backing hardware and no synchronization, so the two drivers
> end up stepping on each other.  This was the same issue the old SBI-0.1
> console drivers had, but that was disabled by default when SBI-0.1 was.
> 
> So just mark the new driver as nonportable.
> 
> Reported-by: Emil Renner Berthing <kernel@esmil.dk>
> Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI driver")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
