Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22461ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTk3e88pugGuN98/vIe7bsUV33KSOgP0kLMZfx44y5E=; b=GWFYtuwrEO6LGr
	4HsW5KQhonTS2og0e94gyt5ghZvXGxybAju34cMyv2MpaPNggVAcofk90lnypjkQtP8HANiMbTNX6
	LdH1wPjLNuwUg1Sy/XBkhNTGJjX7WJqKdHuxDTZFZ/aphBMufEBCET9voEXnu8lNYieBltJQZXDd/
	A1rK+w+tAxkk+lfkpxN6kqMfbw+xPQenZAWtaLD5m+k2fSDARhW/2EHqQ8GGU3jcMe5ZyatC9CXr/
	J2B945nS5RHn25VH5S8VlkL98ZrS9vRvZKMQJKimNFpRnriNXEZdQNMuXe4xrpmq1YiKrh8lvTvB+
	lucChqyjXOGj4QngCjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdtb-007Yfv-MF; Mon, 12 Sep 2022 07:30:19 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdpU-007WFN-VJ
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 07:26:07 +0000
Received: by mail-lf1-x130.google.com with SMTP id u18so13363853lfo.8
        for <linux-riscv@lists.infradead.org>; Mon, 12 Sep 2022 00:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=S7qsMOJyMlwVuf8eNuNOSDhJ270g0hn497r6PO6XbXw=;
        b=Krnw8ElDk+wm306zYuf/qgqXG4VO9Aq8d+XWE2tq44Qx8y/W7EMY2m2//i7kIbEaU9
         nINjTyDNCFXLJOoBWwNwv1eCp7RzFaprzqaPyWvfFXIaze7+qNWSUdJV5w7HhgYEcdQa
         Mwket2fkauYFMfkZGaS4LHLkZg+X4l2dHIY7v6WdPkYV08d5Wa/WElHflGvNGPIDE6eP
         Y/RssHUwKL9D9PVWSJxVbIYlHldJ8LVfo0m1eRl2AhtrjUV57xOfGcWB/IYJYHXA1tPD
         quLvQbMVye2moBnXy9FWMGQTleum59k8x9Rn6V5Y8dzTMZgF6MfDgnqPuNchpHLTBTtB
         00jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=S7qsMOJyMlwVuf8eNuNOSDhJ270g0hn497r6PO6XbXw=;
        b=fkzLRBnCnaIE0R2xJxkMJhmv4P/xUaUfnQ63AdfVVqM2hlZmKGBT4cPBzgGfvDxFK+
         F7mTBgIcnyBLLOc0PvdFPWm6iTkuFFDKH9BCIezVX3GnLcv0+ZNITmW5CEB+hc5oSmZj
         XSs0d2vr9RgxoWNOYc2OKKLNBjlXjYx8NWSgBINt0PcuywjfCHE1lHGpwrDIv4ph/r/c
         1N7r02hxsdkx54Kz/Jyr9g8qI3C8RcLNXOV9al9FX/aKORoAOTWRgRWW4/RVEyV+Z/pq
         faKzAq9JuX/C3BMwsLWHUXVlLtx7N0O9ib2oiV7c25Mt82aO34CXKLyBoHG8+gtdmQlA
         sAsg==
X-Gm-Message-State: ACgBeo2Y1seZhKlBIUdiywVb7xJx1qTfTaOaKaBn9wa4plNj9pxjrwDg
	FARjLTWURqkcIRgPy4U7JTQ=
X-Google-Smtp-Source: AA6agR5F5pOWPsyydsoOnGUkI7IVqKKI0+x0s+O/0hyuEBgA03Rryq1NyCLoDy0+w7swkWktbMuodg==
X-Received: by 2002:a19:441a:0:b0:498:2943:a34 with SMTP id r26-20020a19441a000000b0049829430a34mr7502148lfa.238.1662967562276;
        Mon, 12 Sep 2022 00:26:02 -0700 (PDT)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id d29-20020ac25edd000000b0048a83336343sm897065lfq.252.2022.09.12.00.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 00:26:01 -0700 (PDT)
Date: Mon, 12 Sep 2022 10:26:00 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alexandre.ghiti@canonical.com,
	guoren@kernel.org, heiko@sntech.de, akpm@linux-foundation.org,
	panqinglin2020@iscas.ac.cn, tongtiangen@huawei.com,
	sunnanyong@huawei.com, anshuman.khandual@arm.com,
	atishp@rivosinc.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, falcon@tinylab.org
Subject: Re: [PATCH v2] riscv: make update_mmu_cache to support asid
Message-ID: <Yx7fCL3rMgT4Uh96@curiosity>
References: <20220904133710.117263-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904133710.117263-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_002605_065136_8AF99EB9 
X-CRM114-Status: GOOD (  13.81  )
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

Hi Jinyu,

> The `update_mmu_cache` function in riscv flush tlb cache without asid
> information now, which will flush tlbs in other tasks' address space
> even if processor supports asid. So add a new function
> `flush_tlb_local_one_page` to flush local one page whether processor
> supports asid or not,for cases that need to flush local one page like
> function `update_mmu_cache`.
> 
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> ---
> RFC V1 -> V2 : 
> 1.Rebased on PATCH9 of IPI imporvement series as Anup Patel
> suggestion. 
> 2.Make commit log more clear.
> 
>  arch/riscv/include/asm/pgtable.h  |  2 +-
>  arch/riscv/include/asm/tlbflush.h |  2 ++
>  arch/riscv/mm/tlbflush.c          | 11 +++++++++++
>  3 files changed, 14 insertions(+), 1 deletion(-)

Just FYI: I have been looking into the same function w.r.t. to its
ASID/SMP handling. In addition to what your patch is doing with ASID,
I posted experimental change following flush_icache_mm approach. That
patch takes into account other concurrently running harts as well as
possible migration to other harts later on, see:

https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@gmail.com/

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
