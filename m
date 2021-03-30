Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0563EC433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:54:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D6DD61874
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D6DD61874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=WM3GNDUCFebPHowj/wTyVTX/e87XiYJ8Y/A4/EGwSPA=; b=J84MRep5q9Doj4TdN4Xv5PJNm
	4iMNQM5suirLTeZ/rdyhMJFoFu6KGLXPNgdKtdZvi/HpQcPRbUegjEv08X+PradiHV/4wXMXMNTpe
	hTy/FSQU4C20B2YFGXX2aCWTDVhTsK/XD7HU4glUxc+tacwOlbjl5rDnu0beAFaPqO+GNNTHUA7Gy
	+uWjrIy9W5So1m9c0asavdwL9IcTfhamqXEGOi5b8Ij5cvVW15sYAtyxQabWbOrFSZQUzvtfe4aBC
	0Jyd6HoK5vwxFATSR2xeLJUOKN9QjUMrvRyh+WLTAFZmc4518SptRO0QsrB2egjCULBwfmV7AUWoY
	GmhhdrckQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR7Ka-002ncy-Sn; Tue, 30 Mar 2021 05:54:25 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR7KW-002ncC-5x
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 05:54:22 +0000
Received: by mail-pf1-x42d.google.com with SMTP id l123so11392167pfl.8
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 22:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ULHvWovowCzcgsVAcye9+8nDN8kG4FPChtXUvkrF8dc=;
 b=C2vTCndtRJJ005jcly56OIHJ8oEzYdRlpJdwbQ4kxqm17peFNaZngpOQSCTMDpD5UY
 bysGhULBk8YeYqoectTdu5H56G7GUcbwqziTjd49M0hNoTTEH49TuIF8rTWTdc9ZlOvY
 Io4krfeRAfJAYHsYyMd5N7ceIThABEyEbq6AGD9dMUErLsZrYNAdSq7XUoLuoEtsdvg1
 2JMUAbQpBeh3CQBHkVC4de/sk1teysE5bpVbXTG4DPCdmVe8dTh/lG5N9avEnlKdEwTK
 GonUgf1uv5y7QVBsf+8qLYzT/AVdlDvgOARI9OFxc9g2Fp4p4gTcMsb0AN5650fBevSL
 tz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ULHvWovowCzcgsVAcye9+8nDN8kG4FPChtXUvkrF8dc=;
 b=tjl9MXD2c9U4Csi5KYF2uoT39rPA23y2Vd3WS3Mne8q/HZ2NtvfyqwT96Uf5ArhdYc
 zjBvyY601oNsRcoA2FMAr/9/ejcAuOcWWu5Aeo/LFep6jNHnXD6bky3z19T7aTRgyvUz
 9oJH2MpeYu5ec1OfZMm+ixvTklfZGRg/8TKmvrLksID3v5eZUmkPYuJjy6bSKJe2TVXb
 DzxaU8csL0+Nqqbiet6+31m7kNzcxPAqKv+muA3MzsTX0AzaUYEtvz1XTCacBumBxhzw
 Ein+MnAwZXbeF8ZmhHSeSe0zMaC+FNksOpvxPBXxWZ416pUIZdMqKu0gXACFvXaMzU9n
 3W3w==
X-Gm-Message-State: AOAM530Q+CCz1+EDGJO99KvT5sQpU6NeMJrrrNW+RTox1buAvJDm9onI
 0cWBIm836W0nyhEkA1SweeJuiDGrjxee5w==
X-Google-Smtp-Source: ABdhPJxratnlnJNCe1ARb2oeJGfz/Zx7jg6R2XcRyILqncEt8HCAT/cf3O8AK2BT4GdXdpoaSeubpA==
X-Received: by 2002:aa7:824e:0:b029:20a:3a1:eeda with SMTP id
 e14-20020aa7824e0000b029020a03a1eedamr27872954pfn.71.1617083658670; 
 Mon, 29 Mar 2021 22:54:18 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v14sm1505969pju.19.2021.03.29.22.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 22:54:18 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:54:18 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 22:50:14 PDT (-0700)
Subject: Re: [PATCH] riscv,entry: fix misaligned base for excp_vect_table
In-Reply-To: <20210317081725.28412-1-yuzihao@ict.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 yuzihao@ict.ac.cn, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yuzihao@ict.ac.cn
Message-ID: <mhng-400b7987-97a8-4f74-8fbd-a11057c46d0d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_065420_453181_D17A59EB 
X-CRM114-Status: GOOD (  16.52  )
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

On Wed, 17 Mar 2021 01:17:25 PDT (-0700), yuzihao@ict.ac.cn wrote:
> * In RV64, the size of each entry in excp_vect_table is 8 bytes. If the
>   base of the table is not 8-byte aligned, loading an entry in the table
>   will raise a misaligned exception. Although such exception will be
>   handled by opensbi/bbl, this still causes performance degradation.
>
> Signed-off-by: Zihao Yu <yuzihao@ict.ac.cn>
> ---
>  arch/riscv/kernel/entry.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 744f3209c..76274a4a1 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -447,6 +447,7 @@ ENDPROC(__switch_to)
>  #endif
>
>  	.section ".rodata"
> +	.align LGREG
>  	/* Exception vector table */
>  ENTRY(excp_vect_table)
>  	RISCV_PTR do_trap_insn_misaligned

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
