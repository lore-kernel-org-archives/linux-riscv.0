Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F89C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 21:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EEbGcIGlNnv6fiNUdIxC7QQ0LBbkHe7jv5+nh/UGzTg=; b=TxoGorugHPm+DcqvQAY2I/TtPh
	pzbB5KfDTViaKyAoKqxsPThgJpBsx2BiyaIKy1nnT7h20JZ/HIQsmqqBA8XXNccEow6/xiKx9p52T
	PbelO9DewooNPkYUbuLrR5jeJ1kVAeuQBGhW3qtok8I8Z1OgcKDZsurkUMGCsUESiVKXyxCYbi8Fp
	wLtYSipJ8MDJbC6XhlFaDBOZ5RI9B4UnzvsOBVpmqlXbCSUHfyd2WAIvLE+bEcFUZJubzzG/QbP18
	jJh/0I8I6O18ZChcMbEsp4GeeXVEDY56Iavsk/yecJ2aVsv1UZx0SdByMCRHenf9Y5brvj/s29JSX
	ALXzN8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmgF-009cJ4-Ty; Thu, 18 Aug 2022 21:03:56 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOmfq-009bvX-HV
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 21:03:32 +0000
Received: by mail-pj1-x102d.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so3018632pjf.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 14:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=ELcoH5gVXXKNS9r6sQsd+O52/5TSkTBmTFm8K7ORsqw=;
        b=WQMubBKNaph5pwkxw2tnVEU0ZXHH7pZR6cqKz2+4Y3c+DRJMOIgdDbs/2ixVID2UDH
         L252bhKG5xAJo4hv5C6IBtfHRds9CMD8/2+vXivSdO3nGtQBlwD0QpJSPL2F0q7jDC2i
         rSZj8Nce0eQstqKUlGuh50H7apLZ9mCKA8o5C8S/oZooXR0XcOc86Jg5x3yGTlyN4sYk
         wSCQOcGBlIQZKHy56IPcxXtlS2ic1hlsZ1RJTn2rNtP30mQvs67WG1XR4YP0H8TtIFhh
         cPoWKCVxqtC9WDJU0MZxBCSgc8NnQUJj+x0VNHc+WQ5d2d4nWwwcMAWE2h09J93p8hkX
         Zsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=ELcoH5gVXXKNS9r6sQsd+O52/5TSkTBmTFm8K7ORsqw=;
        b=w3uWuH9Vb+REfH2svZ8GzlIdpDq9LUeaDGJlN9nH5EjGhpRiICKLyEElYBGwfjwpci
         0dfrC4fwyrebvuMSEuvENRIGsz5+fk/x7cCQURyZLWOadT5OWDdiHiE5eYBOINz3x9O7
         87ZbhtB4B5KY1tPWjY0140vE6tDc6o9xyiK/1jqyrIM4T+7pM2GdudIB1gYuJGwCi0jS
         nG/elkiE7gIfuoYjgyhowRC52B3BYQ9aAxoEvnN1mQsfjyt+4qLcHlkC7xD8YKUDdvik
         xm1pnfDnBKnsXwuw1RjqXsuVhSDgSHC3HDbTeCgsObBRsOH9YDH4xEcbSXY5O9TBtUJi
         ntWg==
X-Gm-Message-State: ACgBeo3SGpJ8cFiibzFMStqqAGiEd1njXPGfP9JcNMKoZknbbC7s5HDO
	aA8hMcdXiKp0zaTYUvMfKYu6uQ==
X-Google-Smtp-Source: AA6agR77U4vTHE89v0SovmRRB/C5pTdUWWokk9RXeAPG/OObpqvPuOsLYN1eeILaWp+6/QyC455uOA==
X-Received: by 2002:a17:902:c602:b0:170:bf85:8ccb with SMTP id r2-20020a170902c60200b00170bf858ccbmr4024845plr.38.1660856606246;
        Thu, 18 Aug 2022 14:03:26 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id u16-20020a17090341d000b00172aa97b628sm1801658ple.186.2022.08.18.14.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 14:03:25 -0700 (PDT)
Date: Thu, 18 Aug 2022 14:03:25 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Aug 2022 14:03:22 PDT (-0700)
Subject: Re: [GIT PULL] Fix RISC-V's arch-topology reporting
In-Reply-To: <4849490e-b362-c13a-c2e4-82acc3268a3f@microchip.com>
CC: sudeep.holla@arm.com, catalin.marinas@arm.com, Will Deacon <will@kernel.org>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  atishp@atishpatra.org, Brice.Goglin@inria.fr, Greg KH <gregkh@linuxfoundation.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-fc4d9b57-2284-40dd-97f6-d32369b41cde@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_140330_605964_1C86590A 
X-CRM114-Status: GOOD (  31.81  )
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

On Mon, 15 Aug 2022 15:14:55 PDT (-0700), Conor.Dooley@microchip.com wrote:
> Hey Will/Palmer/Sudeep,
> 
> Catalin suggested [0] dropping the CC: stable for the arm64 patch and
> instead making it a specific prereq of the RISC-V patch & making a PR,
> so here we are.. I was still up when -rc1 came out so pushed it last
> night to get the test coverage, but LKP seems to not have reported a
> build success since early on the 13th so not holding my horses! I built
> it again for both ARMs and RISC-V myself.
> 
> I tagged it tonight, so it's on conor/linux.git as riscv-topo-on-6.0-rc1
> with the prereq specified.
> 
> Not sure if you want to merge this too Sudeep or if that's up to Greg?

It's a little bit vague what you're asking for here, so I'm just going 
to kind of guessing here but this on riscv/for-next.  I'm not sure if 
you were looking for me to just merge the arch/riscv bits or if this 
should be on fixes (just looking at the patch makes it look like it 
should be), but I don't want to send up some arm64 code to fixes without 
it being pretty explicit that I should do so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # arch/riscv bits, for 6.0-rc

in case someone else wants to send it up before I get back to this, I'm 
fine either way.

Thanks!

> 
> Thanks,
> Conor.
> 
> 0 - https://lore.kernel.org/linux-riscv/Ytac7G1zlq6WW4jt@arm.com/
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-topo-on-6.0-rc1
> 
> for you to fetch changes up to fbd92809997a391f28075f1c8b5ee314c225557c:
> 
>   riscv: topology: fix default topology reporting (2022-08-15 22:07:34 +0100)
> 
> ----------------------------------------------------------------
> Fix RISC-V's topology reporting
> 
> The goal here is the fix the incorrectly reported arch topology on
> RISC-V which seems to have been broken since it was added.
> cpu, package and thread IDs are all currently reported as -1, so tools
> like lstopo think systems have multiple threads on the same core when
> this is not true:
> https://github.com/open-mpi/hwloc/issues/536
> 
> arm64's topology code basically applies to RISC-V too, so it has been
> made generic along with the removal of MPIDR related code, which
> appears to be redudant code since '3102bc0e6ac7 ("arm64: topology: Stop
> using MPIDR for topology information")' replaced the code that actually
> interacted with MPIDR with default values.
> 
> ----------------------------------------------------------------
> Conor Dooley (2):
>       arm64: topology: move store_cpu_topology() to shared code
>       riscv: topology: fix default topology reporting
> 
>  arch/arm64/kernel/topology.c | 40 ----------------------------------------
>  arch/riscv/Kconfig           |  2 +-
>  arch/riscv/kernel/smpboot.c  |  3 ++-
>  drivers/base/arch_topology.c | 19 +++++++++++++++++++
>  4 files changed, 22 insertions(+), 42 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
