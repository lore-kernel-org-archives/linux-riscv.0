Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A79C0218D
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CD6jb0jd2CCchGvMv3du+5opscB/a0VRt/wQw03p5fQ=; b=tR8Pf9x4Mt6b0Q
	s5tvwcXWTxZwa1S35ZmMc61FNkMvcktS878hnWwN0Bk1k9iBA8fXD/ftjnC0bPhwA5YiEhYF+pmgM
	EUMKUekIM8IxaQb+d2GP5+s2/dpZUIMPoT2K728cbLvBby7IuU+seqRSin6na1IJr87DL1VGYu5x/
	vOMaCtbxZruIRDadFewTZFCB0PTWA+uMWtEbvvEhaeDjAfuIK482a33IDXNnKv968PYKb1UZnvHH4
	+UFnJEINwPf7EdW4RwaC7Re52KJNPyigz53nCEBqSvbn2vxE/P96KxghgW9dgpeng1oSh8rido6fF
	to3CdVdvPIA3YT8vp5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdlLt-0000000A6RU-0Hh6;
	Fri, 31 Jan 2025 07:22:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdlKa-0000000A6Hr-2qza
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 07:20:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so996328f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 23:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738308046; x=1738912846; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P2lpuXw9XPLRPbvNS5Bw5c4ZfI8/OoJg8oaMTOnKaNs=;
        b=hRYjOlgFhPcDOAfANmOSTRKhnNyVvsgm1Lt7oPlKB3xYMD+rht6Y0+lqnSR+N4d7X9
         rWYMrmqoY8DHUzeN1cJYIkx6T5PrF6GnD6Z+g6QplhYPcG7j7gPfLt2tG9f7jYyqmvBB
         YW0nFPm7Mt8Y8ImOCGhxCvUFa8EpyzxTO7MYzvCwZ5T1ZPIceusulZIULmONN+01EnVo
         a5tR769qEz1AB22vNZ5Ok8PYa5TA7zGS/bFyudw4vGMMrKAYCauDKKtbwu0S1joiB4Bt
         suUFz4qOB3klAIi2YCyJZUhxWjTPvGtFg0ETo4Uq6XPoEAbHhooznrGs11BrFtW+87tp
         yaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738308046; x=1738912846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2lpuXw9XPLRPbvNS5Bw5c4ZfI8/OoJg8oaMTOnKaNs=;
        b=aj993FFR0XU7C4qLyP4nxW1zDWfFUS31oQFoXDYz6r1ECC72H6Ji+ydhvaTiipo0Hw
         xTr7PFOJEeZFcklplFLCLo2g8w4lgHvqatmyanaStRVds3/0hFYdBaEWMQhrmdK8GiB2
         O8U3+LSqrXVcoAlmWAAFh4xd7u97YJl8oekMlZ9EVp+O+fnMeOYpoqVnI/BFNFs8nyFY
         bKqoD9Ze3mX02vOsxu2pWB4HWONCAGfuVRe/yE8EDGW/Kw384wBiaKtpvDVadcI15i62
         KR2bK4w2mOUlxbQS/CO5R9L323cIq138xJim1QBnx7ffEE6Xw+hw5qHEtQJJuLPUWDtd
         1X8g==
X-Forwarded-Encrypted: i=1; AJvYcCUYMsFXy77kpZyyN0n2t1b7hlGdAkD7G4KE85v8hrGCxsYEhGxbP4PMQcOXNuX8GwmwZPbRzTjVjP3Kxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTtYQ35PnD+nEwK0uy9RVIlH2BO0eh/2pjnQ2zDSkzD9dfq8d+
	Ct4RFAb4Z9OnZmIMVcfJYc4IIRtWdB7ifFlYwGIA4raUtjkbJDilNPP1EXv90nk=
X-Gm-Gg: ASbGnctHp32a6UK5dqd2su/AZtgd+o2/wktAwqlJuzPGQVJ0rS/R1faciK9jjb7xvvU
	aOQUtxpmGOa8BtthkVW2P9ihPyOzIi7klUMz3LffW79H5MeTOsFoYGAhssBHd14MI8iGsmntSbl
	/wwmlRPydx3BOPwXklG1o7zrV+14SE+4zRdI2SOEA2GPG9jkuLIBmfyXk5IgGGFfPc4ReBeb6wj
	6D070HAVUvOpCVj6cYYL38sNHZSwqEpZlDOPbcny4+Ga303r1JQyRjdDd1vlMHE8+AJb2j/+6d2
	jshy/V+8Fb3JG6eHilXN6fV7ampFiIZY5h59K6yemJkz
X-Google-Smtp-Source: AGHT+IGRfxjMkTqEhRIMBV+fsGJAYVQ8sx3PjOb7qCx6efCdQQ2O7kVBZoPCP/rCNG4l34JXqbtMJQ==
X-Received: by 2002:a5d:64ec:0:b0:385:df17:2148 with SMTP id ffacd0b85a97d-38c60f657admr1863229f8f.20.1738308046544;
        Thu, 30 Jan 2025 23:20:46 -0800 (PST)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf40asm3874927f8f.83.2025.01.30.23.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 23:20:46 -0800 (PST)
Date: Fri, 31 Jan 2025 08:20:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>, linux-kernel@vger.kernel.org, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Fix the PAUSE Opcode for MIPS P8700.
Message-ID: <20250131-3286dd5adf8e5ff083bcbda4@orel>
References: <20250129131703.733098-1-arikalo@gmail.com>
 <20250129-museum-slider-3bb634d124de@spud>
 <Z5wEKS9q8-nYPO7h@ghost>
 <20250131-unknotted-yoga-bccacad0c6d3@spud>
 <Z5wgZHnvu9EeE4xq@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5wgZHnvu9EeE4xq@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_232048_724453_6F44F4ED 
X-CRM114-Status: GOOD (  21.07  )
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

On Thu, Jan 30, 2025 at 04:59:16PM -0800, Charlie Jenkins wrote:
> On Fri, Jan 31, 2025 at 12:43:12AM +0000, Conor Dooley wrote:
> > On Thu, Jan 30, 2025 at 02:58:49PM -0800, Charlie Jenkins wrote:
> > > On Wed, Jan 29, 2025 at 04:19:58PM +0000, Conor Dooley wrote:
...
> > > > Why don't you use the same implementation as the !tools
> > > > copy of the header? (I'm not sure why they're different in the first
> > > > place).
> > > 
> > > It is different because the headers in tools are userspace so it doesn't
> > > make sense to have alternatives.
> > 
> > I assume that's an answer to the first part, and not the bit in
> > brackets since the "first place" difference is about using the .4byte
> > versus having an ifdef/else and you're talking about alternatives.
> > That looks to have been some sort of sync issue or oversight in
> > 6da111574baff, no?
> 
> Yeah it was a response to the first part.
> 
> As for the second part, yes it look it was a syncing issue.
>

I just forgot to update the tools copy at the time of 6da111574baff. We
should first sync it (but with s/RISCV_PAUSE/0x100000f/ to avoid the
need to include insn-def.h) before modifying it with this patch.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
