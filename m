Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D63C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 09:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAXcmIYq75cSiSeH4+tZdJFvYMuXC/PAo59A0Lv8AH8=; b=zj0Hd+GlFa/JKm
	1SX0Z7Lwwe2yfOjtOAguWbTnGkToPUQQ+tlPoUGlam9q/UasXhxRTpwOJXGbtCpACM1O67EtDxDdn
	Ts+6vomFCQFmGUREibrW9UuiDi6EVvXV0FythLRhnkfHlkhjYK/Mkfde/8pNE2jTem6M55Jx0D3Yz
	urSaz/2i5rZB0riU2WA7tHUpLoogZTaXZHmgDJIdKde5VzCXTVAJW1ONiyn3KKewslgE3h5jzL90T
	HHjmyAoOuCT3mTX3eOI8StsCAq1u+UaeP187c1DVWl/kIOhBQ99h+plDtiwvmNQfHIDtEIHRf2WPZ
	JjYyMDi++qlJf0HeHsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TBJ-0000000CEsy-3Rfm;
	Thu, 02 May 2024 09:56:49 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TBF-0000000CErL-0UwT
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 09:56:47 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6effe9c852eso6837812b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 02:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714643800; x=1715248600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sucCdO5kXmwHz0FAAtAAGExlkRhEC3HqOy4Cv/qw8KI=;
        b=kcVvUHvEOLcC5UQ+0V+2djM0b5pWkWeVYKYw+Zz1k9hjyiJiLEMdP77Nus6p0RCC65
         ASGRaf3kK4o11gWidtUqU7UGkPOuB/EDs/htQZoOlyERDNUiuSJ1QAAQErczrvBVWdfk
         SR1FobuN+q1D5MuIUXp0EL6/trCmlWHedFhSYBMs7Su89bOw8YGTqkvrr7ezI4p3+O1d
         kxr/rmRII05WcJhcezjPbzqrj2p7EEX+nCADkoB8ts4FrGjiD1R0KASOrJV4/musMpPE
         rLkT+KOqB2bhZEQOP8vHRLPH2VvytslN78T2DcwHW2LkejFY+FEDr7kk+0VWtPnqhoan
         AUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714643800; x=1715248600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sucCdO5kXmwHz0FAAtAAGExlkRhEC3HqOy4Cv/qw8KI=;
        b=rC1WVkwLF8+1UzDG7qCNEIyC/8fzXZIBhDDF+j9Kvdp0leUFRb1QrJtY9IY3ZFSKAM
         mIh0nn9buvZiGixFWxNsS8sN4HUOwU2Oy/TdL6mtH+QP3zLCyPkjhsxD6ITr2pCaMuXO
         Y9FIXc0CiVkNnOeQkJ0WNmPOPjfW3KQ3ot2EV3jFDQE0C8hzc82u0THbqFY33Cm5zWe8
         Kh3IWieK+ScnhMcbvVuSDArK9+aBPqH8eciu2Sk0/ELNOwz6nTO9Ega9GG/u/PZs8XBR
         8VcyItqSQ67kDK7Y//eus9WxvpYUS7mQl9D8PjjWS9FZGJbShRvqJAZ+Jt3GV4QVsYSk
         xf4g==
X-Forwarded-Encrypted: i=1; AJvYcCUueJ8TmhoTUv5crnHhAnH+L08T1Uo286/V1Dy3ikJWvi/xu37fW0ZmJ1qRFb9Z5c1kB+WzOUrZTrzGA2blky7cpACxc+lyWEJEWifE1cIt
X-Gm-Message-State: AOJu0YwkG60u1DHLjEddu95m5KygjjjD3tkiPVBRtr/UeBQQMpiIQBxC
	tgcephHE4QbEXurIEH7jjRpcuxQgGRumq75nbU/FE8GnF4G5jntUB80z707xmTgVGa3MAmOIjmj
	pxbw=
X-Google-Smtp-Source: AGHT+IEdqN4j0tZUjqkf7AiQCf6AILBV0FVoUPT7pSiU8sVSt1YtTCq7aHm3fUhXEYUOJZhfGVfIwA==
X-Received: by 2002:a05:6a20:7f86:b0:1a7:5402:8a92 with SMTP id d6-20020a056a207f8600b001a754028a92mr1702915pzj.31.1714643799826;
        Thu, 02 May 2024 02:56:39 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.19])
        by smtp.gmail.com with ESMTPSA id lf12-20020a170902fb4c00b001eb53dcf458sm864846plb.188.2024.05.02.02.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 02:56:39 -0700 (PDT)
Date: Thu, 2 May 2024 15:26:26 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH v5 01/17] arm64: PCI: Migrate ACPI related functions to
 pci-acpi.c
Message-ID: <ZjNjSpJus7EYT6zn@sunil-laptop>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-2-sunilvl@ventanamicro.com>
 <ZjNbVPYIjINdk4Fn@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjNbVPYIjINdk4Fn@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_025645_198701_42FDE307 
X-CRM114-Status: GOOD (  14.17  )
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

On Thu, May 02, 2024 at 12:22:28PM +0300, Andy Shevchenko wrote:
> On Wed, May 01, 2024 at 05:47:26PM +0530, Sunil V L wrote:
> > The functions defined in arm64 for ACPI support are required
> > for RISC-V also. To avoid duplication, move these functions
> > to common location.
> 
> ...
> 
> There are -M -C parameters to git format-patch. Use them in the next version of
> the series. (Note, you may add percentage numbers to each of those parameters
> to get prettier result.)
> 
Yeah, I tried different combination of percentage after you told me last
time. I just didn't see any difference in the patch generated. Let me
try again while sending next version. Thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
