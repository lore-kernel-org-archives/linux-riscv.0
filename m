Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67862CAC5B8
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vVcsAmbn5sIbiBjNfawxyu+fh9naoXjXi3JeGHTd+Y=; b=09YQbrjRMIzMQq
	cvDZbnyhNTRlRDQOCPLfWnt7zxd8hHdmcGJOdGbaO73nvdaqPHdY+FBewJTqUS3ynujmIy3iKKFwh
	NErS95LwLyZXI6Of8d7GYZFIqC750JHZ6vOcKA29FonKnhZ8PwVksJWb4tUbKFdtv+op0SLxu+0kA
	3K3pvKFZWLC00jVQAotuOXbQFjc3pML34v0LNL+VluRccwboUg/aeH2yLIJ0mhIQnvP3lbkYmf9tf
	JQXlHhCQvsOcBM278BQWgJIec36Pmxld2RE6d2P8zu5frt6hI5P0QZZK7292Jla14loZ5mJCicSqR
	c3Zx+unNW8syV9msA0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cqH-00000005j3t-2HHK;
	Tue, 30 Sep 2025 16:04:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cqF-00000005j2G-0YTL
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:04:40 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso12450675a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759248277; x=1759853077; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BSHENZMRnVeUFapxRU95YDUstKUost4pQtLkCBW/Xrk=;
        b=KelaYENdZbFVYxdYKllh/IYTqIa87p7qzOVBHdxRiWDFKIhk3Bp2Ti/fb8QOsNmsaz
         17CxpzS6m9zXZqQ6FtFbGt7OWl1bGpxVx7JZAFFkjomlzg2+A/KaF9sqEoAAIZ5htFfh
         NMCYytptPGz9d0wdrRgCJdEz93acMFJbpGl9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759248277; x=1759853077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSHENZMRnVeUFapxRU95YDUstKUost4pQtLkCBW/Xrk=;
        b=Jgs0Fdk29dFQVh9R4xwlJV+ZSbhHAO1ZzoOQtSjq54OsHbmGerblHHFiF6TiJCUgpY
         IccYvJBbmwauPI/yn41vzPBSY8lKJT3r8PzNHJ+OuUC8xSMb50fM5exYussBnfrHfaKT
         iLYNkDw18RmdXl/v8/PdxiEuGjAIGrhFQkml8x8e0pq0hQDgHOB+50dCv6L+kA+kQp7c
         DprZpCYca1HbTIFMZg5CFILz/NOcmG/E/P3EbLBxDVw4vg9jt+30iTO4PEJ3Y8MXBMiT
         1GS/KijQ/jz6a03IEcFL9CLjWYN6zAfbfHsDnGGZWRUKE+VWOGMlS/Y6EVtJlYrNEF/t
         fRnA==
X-Forwarded-Encrypted: i=1; AJvYcCUOHXWnLipSpHrk9ax1BrRsvPzhYzB1UFCBnBWCLty/Yb2eUCqmJe80U/mhDJ8Wp7aOVJpB02piIecQiw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+eIani7thTbJqhwVGGeYNaINzQWxLnPKXkCFDpM+Lmo0FVVhs
	bTxQNWbAUbPOvVYJWPvQF3Fn1Ak1QoF9FJN1vsojTzR9HeFWSq2lJBscI2RgQHXV5SyFgSUBTPl
	MUIcE0+c=
X-Gm-Gg: ASbGncvniS2Bh16+UFTg4q4sHnYFG0o70iN1QiitPqUIGlcJ4479xxO98pGnqrugKiM
	HOFd4JBBhtKfFv3gwS9vA/oJPr5K+EqHAyNTIElGfG3Q/x26aiRkeYY8qJ2/sQwU5VcEb9WJzQb
	de9L3cZEpb45tykWpZz/uhydJJnu5N8H2Wa1d5Hxh7mye3WDX4AUVr4mV/Rq8Sdig8/5z/Rb+Lt
	7RD3kOmvn0kJELsASycQ50sswDfyaj1xnD4IuaJaC1tGmkCPIKJOd7H7W7LNh21Z9u0mhB6AYOA
	+ImcsVlrbN7VvoZrzQC1jd2IJDXM4LV6BeC09BWozqwgprI9fPIQCKSzyn0fQjpIAtt+B6mZCLN
	Q/1/XQYn9QaJQ7otwHDqz3WMus+//BW6Jx3Gswy8Iqu/fX34pN94zE8c7+D/CAtrklPNQC9lCSS
	ix5UsZ7MgR59ExDnA+npzbsnakmU0OX1w=
X-Google-Smtp-Source: AGHT+IEWwAXbq7/LoND1vHx3TEzbdqid4dFzT3lNtQIXR/wzAHG87uaO/NPUsjq95SB7iTq2HgQazA==
X-Received: by 2002:aa7:c894:0:b0:634:b3d3:70f9 with SMTP id 4fb4d7f45d1cf-63678caec17mr335166a12.28.1759248277004;
        Tue, 30 Sep 2025 09:04:37 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-636361773a6sm4955602a12.6.2025.09.30.09.04.36
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 09:04:36 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3727611c1bso1140332666b.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:04:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6jSS+yv34Qd9Levcl/aJCftJikwTa4KCDIPdOGuYHEDF1uky/42CCUdeERVLs0jU/DJ2L3NMr+H0/8Q==@lists.infradead.org
X-Received: by 2002:a17:907:3e21:b0:b3a:ecc1:7774 with SMTP id
 a640c23a62f3a-b46e99537d0mr14481366b.53.1759248275871; Tue, 30 Sep 2025
 09:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org> <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk>
In-Reply-To: <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 30 Sep 2025 09:04:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
X-Gm-Features: AS18NWCqeDn9EkWAwf5x-TTOiUz0zNTGkg_UlVmAWbsgKTQHGgJnTYZePr2tmYQ
Message-ID: <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_090439_203139_64E1A406 
X-CRM114-Status: GOOD (  10.98  )
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

On Tue, 30 Sept 2025 at 00:25, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Is there any chance some of the big-endian work we did is getting in
> for this round?

Oh Christ. Is somebody seriously working on BE support in 2025?

WHY?

Seriously, that sounds like just *stupid*. Is there some actual real
reason for this, or is it more of the "RISC-V is used in academic
design classes and so people just want to do endianness for academic
reasons"?

Because I'd be more than happy to just draw a line in the sand and say
"New endianness problems are somebody ELSES problem", and tell people
to stop being silly.

Let's not complicate things for no good reason. And there is *NO*
reason to add new endianness.

RISC-V is enough of a mess with the millions of silly configuration
issues already. Don't make it even worse.

Tell people to just talk to their therapists instead.  That's *much*
more productive.

Really.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
