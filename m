Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FA2EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HJJlGtjyuTRx+8SfMM8dB3ZuQVomR5KVu4YsIrEjUc=; b=UVN6yfQ4XvjC76
	VypJM7BvFQfboNcD3KqDWg4wMAZW08R0WsWKWyTuH4FUxxld1ElN1mf/N0piKnlxmgDKhHx2ZpvJF
	cp7CyZHxGDusBQ6frTFBNa38f/x4XPXIverJ8cKmM17uZrBp8p5+0CiexukVsF9U+Yhp1VinUjU4R
	KkcooC8ojCPQvYLSyHNAaiy0DP17ZVK0CgRvgSXdzomP/ARjxtkP2jBgMUbxwSL3CL7x0korkV61v
	Dn7ungk69y50o6W7uxEOeIVZ3uV5krY143zN7ttkDLuIiBOz9cHXBszdVuxPzLNt+XJktPMDUssXB
	62KdsuINsuYC/CAVgzgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFeU-00FJFR-0v;
	Tue, 11 Jul 2023 15:51:46 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFeR-00FJC8-0F
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 15:51:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6687096c6ddso3370464b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 08:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689090699; x=1691682699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h0Eo8sEWwi+QlL6TwKCEAUf0c6tdOFvYOKUGXKFLpnI=;
        b=VEHl1YDonMq0agfdUsVKQhxo8RItH5aI7RFQLbPPlyzgiEZLoC2QTbgKfhaUAXb0Xs
         mt2OV6GTXYF+7hq2+LNiL0/ACbBpJ/nlAWB7DJdT+a6lnDl//ZGmngeWOxRP9eIddcv/
         F7Yri1Yx+qPeciVnr2KrQ5EVMTSFWvZEHVvVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689090699; x=1691682699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0Eo8sEWwi+QlL6TwKCEAUf0c6tdOFvYOKUGXKFLpnI=;
        b=Yi9FKSVnEvgrTsqBciT4iehjDn3PhUgzAqBsqQvO4mSUCs2vCeSB9p3T01DMtbC0gR
         zTCIbf9lRF7+L+YFjWN/wSp3emMc8Nivmi09czH1IQoHSQxBRdPzxJOxBmZLtaKKupNa
         xwBpUmjjCKsS9BqLPSMiYtwTxjbmyviyBvpSBBkhBguvSLTKVaeX+LqkoggrzqrRXN+E
         4tGAYPVALw27rUriU/wmY3RsqK2Im0zMhjjCBCqWQsxmHDMc7O1+YZKxOo5ADjY9Tyay
         5U63PVsNjCd8NPDFHbCKz7vxFN/1j7JTVXdrc7V1sL/DwqZ2P1hpR6iBNo37WW7ZxA8q
         ge3Q==
X-Gm-Message-State: ABy/qLbgmtapPTu6p+UbgdQs1a3fBcEhrsIuR6XrbDq684X/9JVViQGB
	zU5jZFTDYnw8RW14OfGwmhy0dQ==
X-Google-Smtp-Source: APBJJlFNryFmhWoGlqCtUbbFGrpblHly2Pt7q3F0N7u90O+eVHxQGOhARPP/AvkikwP6Li4cyHQmng==
X-Received: by 2002:a05:6a00:22cd:b0:674:1dde:4c59 with SMTP id f13-20020a056a0022cd00b006741dde4c59mr14931253pfj.28.1689090699562;
        Tue, 11 Jul 2023 08:51:39 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x13-20020aa784cd000000b00682a61fa525sm1934182pfn.91.2023.07.11.08.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 08:51:39 -0700 (PDT)
Date: Tue, 11 Jul 2023 08:51:38 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg Ungerer <gerg@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, palmer@dabbelt.com,
	viro@zeniv.linux.org.uk, ebiederm@xmission.com, brauner@kernel.org
Subject: Re: [PATCH v2 1/2] binfmt_elf_fdpic: support 64-bit systems
Message-ID: <202307110851.7F2EB003@keescook>
References: <20230711130754.481209-1-gerg@kernel.org>
 <20230711130754.481209-2-gerg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711130754.481209-2-gerg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_085143_111722_639CDAEA 
X-CRM114-Status: GOOD (  15.15  )
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

On Tue, Jul 11, 2023 at 11:07:53PM +1000, Greg Ungerer wrote:
> The binfmt_flat_fdpic code has a number of 32-bit specific data
> structures associated with it. Extend it to be able to support and
> be used on 64-bit systems as well.
> 
> The new code defines a number of key 64-bit variants of the core
> elf-fdpic data structures - along side the existing 32-bit sized ones.
> A common set of generic named structures are defined to be either
> the 32-bit or 64-bit ones as required at compile time. This is a
> similar technique to that used in the ELF binfmt loader.
> 
> For example:
> 
>   elf_fdpic_loadseg is either elf32_fdpic_loadseg or elf64_fdpic_loadseg
>   elf_fdpic_loadmap is either elf32_fdpic_loadmap or elf64_fdpic_loadmap
> 
> the choice based on ELFCLASS32 or ELFCLASS64.
> 
> Signed-off-by: Greg Ungerer <gerg@kernel.org>

This looks good an is consistent with what the regular ELF loader does
with the sized types.

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
