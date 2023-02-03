Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4BEC636D3
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 00:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nxiBNPG2PQPfGCD3uFBCbL1APPXNz4fJcdp5NvznmUQ=; b=EYQygUEq6ThPcu9tT4gxmTBVzV
	jeNR+DO1cXWGY0ygUVBvrR0Fjp9X/aIhoWtmVutI5FdulGmgcYrRMThzehf8CXB2wCZi8kLEPBk7k
	ZrSQ36BIxyQpo3E8YmT2f/olGMpN6ls5EF3uOUZJc7W1B0tyqY0m045P4TLeedsPuthgL2naewe0g
	VFnwajpgpdmHvi+fyupauDYFpvnZIYySzdHAXduRzH3WYc2rfhqnvrqF4zdrfdJNjLkUWQdSm0k8b
	QH/3as/uWyF2h8cEbHvbexkgVTlMGptrQDvyoeQ84+nk5ZpvsaGiGEj26bzVd0DiEl+DgN7UicG9u
	R+tLMbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjso-00HVHl-6u; Fri, 03 Feb 2023 00:24:50 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjsk-00HVFZ-1n
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 00:24:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id e8-20020a17090a9a8800b0022c387f0f93so7272107pjp.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 16:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S7e5WEqMk16Ay2DoIKqyJpIuF5AJjNAAjV63IUL/tk=;
        b=hQHP9qyZHVA+a+uHuTsMO8GZ8HIvjBwROyn/IiLj4UlR5kumKYQZiOaP0yjAA/1OSG
         C3MjFbaOYsrz20pQoZpTAzls1PAfIviVRvp3Q7r8Xwja45vzqoZLvAU0isd2qEdg9C9n
         G5MNgZKFWHjl+Qr7/mk/lTfoukCH46J1tvzyn3Y/sN3cqY1SJkbCpJ2lnecR/OO73t/I
         cM1IibAIrbvSVCWv5TbN7WvpARB41Vlge16J+7pGQy3k6qVx0zEauexfdpR3gA42h0nI
         ykfx23+DrjARrWRdmejWAqveHSHaMPBFdC44rz6oiK/2k2mP6PLIHKuJ4GQeSXLs69+h
         BDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/S7e5WEqMk16Ay2DoIKqyJpIuF5AJjNAAjV63IUL/tk=;
        b=IQIfjUF8bISjxe+W2QAu95HB9wDS0Tkf+TXnkHdlk9eoIbPkq5sj0ZGw7Yd4Up1V0p
         DEb2N9gtXTFNYpjNzlhBm0boshmDGIMEBcinDMsXSJeoTPBrqvLZunLSEYq1cJm4c8sh
         MELnv1Sv6o6W+ZV0Nqk7nM+Cyc7mQZ996RlaAkDJ4acHa5FNxYyNIdEFp/4VxFwsqsWs
         7N3wrEFS6kxqekuXGf5vO6luqk/ZI1NpMYYzGnfRn69shswaQqkfXVncGCJi5nwpOQPG
         AQgsbMCY/szg8ttQm+f+FqEP669hE2d4KxNRJsj8SfOhAov4hzdc/m1R2DGsAwJ1qfLx
         fwyw==
X-Gm-Message-State: AO0yUKUeQYy+/EzpE3IncoJ/XzP2eC27bQWJU1UsObz0FLhLYiHdlgfM
	osrckPYwwb3Cjg+Z97FoSfrq72G54+v1sr1l
X-Google-Smtp-Source: AK7set+rJWfbsNd7M3rDZo/kVRyVpyV17Qy08I1XQbG1fnSbrgJIKhyrLKBmh0Ll2t6sRL/UrW+9uw==
X-Received: by 2002:a17:902:ec8c:b0:191:3098:8b with SMTP id x12-20020a170902ec8c00b001913098008bmr3437192plg.58.1675383883696;
        Thu, 02 Feb 2023 16:24:43 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902a3cd00b001948ae7501asm238241plb.298.2023.02.02.16.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 16:24:43 -0800 (PST)
Date: Thu, 02 Feb 2023 16:24:43 -0800 (PST)
X-Google-Original-Date: Thu, 02 Feb 2023 16:24:14 PST (-0800)
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
In-Reply-To: <20230128072737.2995881-3-apatel@ventanamicro.com>
CC: pbonzini@redhat.com, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com, anup@brainfault.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_162446_111425_03E8058D 
X-CRM114-Status: GOOD (  22.89  )
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

On Fri, 27 Jan 2023 23:27:32 PST (-0800), apatel@ventanamicro.com wrote:
> We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
> and Ssaia (S-mode AIA CSRs).

This has pretty much the same problem that we had with the other 
AIA-related ISA string patches, where there's that ambiguity with the 
non-ratified chapters.  IIRC when this came up in GCC the rough idea was 
to try and document that we're going to interpret the standard ISA 
strings that way, but now that we're doing custom ISA extensions it 
seems saner to just define on here that removes the ambiguity.

I just sent
<https://lore.kernel.org/r/20230203001201.14770-1-palmer@rivosinc.com/> 
which documents that.

> We extend the ISA string parsing to detect Smaia and Ssaia extensions.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 2 ++
>  arch/riscv/kernel/cpu.c        | 2 ++
>  arch/riscv/kernel/cpufeature.c | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 86328e3acb02..341ef30a3718 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,6 +59,8 @@ enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_SSTC,
>  	RISCV_ISA_EXT_SVINVAL,
> +	RISCV_ISA_EXT_SMAIA,
> +	RISCV_ISA_EXT_SSAIA,
>  	RISCV_ISA_EXT_ID_MAX
>  };
>  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 1b9a5a66e55a..a215ec929160 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
>   *    extensions by an underscore.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),

This will conflict with that ISA string refactoring I just merged.  It 
should be a pretty mechanical merge conflict, but if you want we can do 
a shared tag with the first few patches and I can handle the merge 
conflict locally.

>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 93e45560af30..3c5b51f519d5 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> +				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
>  			}
>  #undef SET_ISA_EXT_MAP
>  		}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
