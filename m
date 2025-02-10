Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A10C0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 17:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHu8VrapUZkBoX7SQE/FPhOXNL4LAmHCk6/jWsZ2bRc=; b=hTWQjiKuGnddsZ
	1nW6xN0UXlr0CDj3vcw8eJiyHN3bCycJOdlMbsOJd5TaoGzJyNaJ9iLo0MoLy73v/xkX3wT8O/fzQ
	iahi2icGlyI9zaO1pOouM9vlAwfKaGTIXdnQz0y6eUeZxwC7g5tZpCm5KNngv90SrUgDTWene1DDJ
	95XleoD3PD+pBvI0jduXjius5B0qGQbaE0qJcwPE6TrLJoU2SzHNLGLGItddRKG73W2zsE4T+DpMK
	QuTBgvjvvVEK0Q4MOndE3mUpf1wp/7hnOabVRqaFMk8X3Z0EgnLWTj+uaNIXaFBCrQqnETyk2gynU
	CQLmRmsEzdkoLuUoPSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXYx-00000000ikr-1fMJ;
	Mon, 10 Feb 2025 17:27:15 +0000
Received: from mail-yw1-x1141.google.com ([2607:f8b0:4864:20::1141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXIn-00000000fJJ-3l7p
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 17:10:35 +0000
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-6f678a27787so41529427b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 09:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739207432; x=1739812232; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJMRwPZx3iU33VFjfO3EAQ5wMZ8xyLmg7gDRe7Q3+/s=;
        b=d9ZkHfps8mEz/dM7Dvb+orVNzFEAVQHcN9KuszA4d1WzmnBup7GFa1YcTjs8OF3dHt
         rl7Hzcptj+Thg7r9mGjV3M5fBbLkrUdeFgO4G68sl4VbeKVZFrFwr8IIvKnlasUO/YYV
         WsIKHso8pSwmxvxBLO3qRQef++LalVchqbRX+P3TY6fcbpVxwl0Ert1acYlTAgUSgpYD
         cGfafDVchbUIijqu+zdx17/TwasPfoIvAytg8HTAABvBt6NFxgBfYxkpgUGlLYp/4+PW
         LZGyDjgrq8RR7HmkLnc2PCJXKA6IhPDg71e2n/Xt50TiideDh5VF2D/XEJfBm7N8bGbk
         El5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207432; x=1739812232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJMRwPZx3iU33VFjfO3EAQ5wMZ8xyLmg7gDRe7Q3+/s=;
        b=Fulo4DWu2t65YoAiSIML4FV+Fl9IiQSEXchPXhgqmNdTGcreiVNrjtRDfPsEcUeGrf
         ZYqp2D2YDhb4xclTLIZrqnhOcuVkeHfVZQaDc53qWE9Ir0qQLvoVUET8tu9iZ6Hv66ch
         dyUWOIaAXz0Lvn9FsA8mhMMocr+MQq8wA/5+lWTUU7WnOHi4DAraD+0UjVZKaEXN4zok
         6SuJX23RE3QmrccfzAwRXKBkpuCiqCfU4kb+O4OXOviuXBTbED3BrrF3X0t9v2pUMQRr
         EdzY8QgeYAtNUbNcsjPyG2G0wh9hPtTtuBDKjWYM8XJwMkuPy6o/usk56sIkhtX0htfu
         rLzg==
X-Gm-Message-State: AOJu0YzXiD8xsjR8trDB5zrkmaD1jY5Osjn/TWWiomfx4+PZ1X+z3kBi
	RotbiBe1hT/SA6kw5s0U4h6BStqBFqsQM0TKJyAQcwJIVMNgLrPnQQczRPQgZDg=
X-Gm-Gg: ASbGnculNMUW68uonwLE4so1QgqbnB/bRBht0Ig0/2cIAJORIWN8DAm5AjVpJQr4sAr
	Bagd6d9eSgqERYxN4vIYkVqgGlpNCyrHcLm3DyqixEhO+49xmlbrwbOUJONXJRstO0ZyzOQCBpZ
	y9yF0KREtEYP+AKeIQYryxJt5B6ZWyvfqdI6aLlv/2ep3YMrdAzE+pknBsGla4/wDb9/OhC/mff
	0DHqYxO/fcvA0wUerIvyPuSSRILkj4Djnd0LrOneu6SX5QNyrrivIuGPRqCZ+qWzfvjorVm/Gah
	f4A=
X-Google-Smtp-Source: AGHT+IF7lKxvTgaEV/I4an/VqlLCpMFOtwQL5q2GuuLjaCF02RBe/SO5iWJjxKW9CNbSttB801OpuQ==
X-Received: by 2002:a05:690c:6f8c:b0:6ef:e390:1d4a with SMTP id 00721157ae682-6f9b2876ac4mr138897167b3.11.1739207432175;
        Mon, 10 Feb 2025 09:10:32 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fd557absm17268277b3.56.2025.02.10.09.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:10:31 -0800 (PST)
Date: Mon, 10 Feb 2025 09:10:30 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6ozBlumaaAReM7l@ghost>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <20250210-51cedc94f4cba8c96516adc5@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210-51cedc94f4cba8c96516adc5@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_091034_188997_675B5734 
X-CRM114-Status: GOOD (  24.81  )
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

On Mon, Feb 10, 2025 at 10:43:18AM +0100, Andrew Jones wrote:
> On Fri, Feb 07, 2025 at 05:22:52PM -0800, Charlie Jenkins wrote:
> > On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> > > Probing unaligned accesses on boot is time consuming. Provide a
> > > function which will be used to look up the access type in a table
> > > by id registers. Vendors which provide table entries can then skip
> > > the probing.
> > 
> > The access checker in my experience is only time consuming on slow
> > hardware. Hardware that supports fast unaligned accesses isn't really
> > impacted by this?
> 
> That's true, but...
> 
> > Avoiding a list of hardware that has slow/fast
> > unaligned accesses in the kernel was the main reason for dynamically
> > checking.
> 
> ...I'm not sure why we should try to avoid determining hardware support
> by its description when a description can be provided.

I worry about scalability of this. This to me seems like a slippery
slope of hardcoding performance tables into the kernel. There are a lot
of riscv vendors and allowing anybody to add a table to the kernel to
dynamically change behavior specifically for their hardware could become
a maintainability nightmare. Avoiding this maintainability issue was the
motivation for the runtime checker.

> 
> > We did introduce the config option to compile the kernel with
> > assumed slow/fast accesses, which of course has the downside of
> > recompiling the kernel and I assume that you already considered that.
> 
> yup
> 
> > 
> > Instead of having a table in the kernel, something that would be more
> > platform agnostic would be to have an extension that signals this
> > information. That seems like it would accomplish the same goal and
> > leverage the existing infrastructure in the kernel, albeit with the need
> > to make a new extension.
> 
> Yes, I agree that another profile "named feature" may be the best
> approach. I'll consider proposing one, but [1] implies there may be

Yeah that thread does highlight the unfortunate way that riscv has
evolved, but I hope that wouldn't be a prohibiting factor here.

- Charlie

> some resistance to creating something like that.
> 
> [1] https://github.com/riscv/riscv-isa-manual/issues/1611
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
