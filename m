Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B943EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asWqYZR86BwkL/qY4iu0UDRhtxL8AENLxDv38iZjtI8=; b=cnAdwwJn7MZZ1D
	cytqch9/yvljuP7axJvt3LJzz7gMdpLwONjDhAn/0xdsJJe5ieJIlOo5d6tV9c3KVp7ruQFtxG7RV
	2ciLlqRCMy9QOPF95XkLvBDvVl4OHL+WECCyS60R/knxKdz3jgjpNlRVIb3MYjdlt9FXzThypIPQg
	cexOl3hXNPm5H3Cwtgj+UoDqgAFUJJK+4/6qiGdwoXr3LN74uBKus7GjQhHIfPlo0EjfoL63iEawB
	eRuECJ+Np3p4UCzWF8UqbMAV3wG/A11jTYbQXYWT3h79IUs1bTC4pW+XXFT8w40rT0wRS7ix37nvY
	17nbwSgT6iccHLCZfATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFgg-00FJel-1D;
	Tue, 11 Jul 2023 15:54:02 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFgd-00FJdH-1g
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 15:54:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b895a06484so29722465ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689090836; x=1691682836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/cNKZT0w/ttrTTuQnq2pupPxaZ8+d56ppimt6LWSmTY=;
        b=I7NZ7oudXfX7DjTOHGibnmEqu5Y6r8jhwGNq5nuByp5Cm8CzCU+gBB6L8H3wfxEBLH
         PCkIik1Ed0RTDeFUuIdLGcrQrp8GWBfKtwRkSFpJawxZhaTPedElAPQxXBeihxdL+vKe
         wuwPQtwSgiId3KLkKrEBCOCzZMeONSlUH1xrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689090836; x=1691682836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cNKZT0w/ttrTTuQnq2pupPxaZ8+d56ppimt6LWSmTY=;
        b=YG/FUNuyRRn9O2hIN2prW3czaX20lCVFYqcR3t6eL1iJlnsqqJDFS9P0qH5GVrb/Hm
         DQNhFPHoHDaSJs3H3TpqrJ7OgQ70EhdrCSBWdDNFFyBjo9+0izRZ8494MeQf+s14Vss3
         VNZLoFUiJUuKOIOBSAH+aALx4GgChGqy42EV2X9jSEzxWxvgeVnfpCEDMwEUQgMTalS6
         9vEL4m7CfK1WvHi0R2PaRwBANnObE0f6wPpyH2G/WR8R2wGGcK3agnAn8PPwOohcjw9o
         J5587ca9cqTJgl3ccZYpdV8ULdX8eyq26tmPj0w9UacvBCS3Vr+olVEo1aMN3FhiGNU2
         F36Q==
X-Gm-Message-State: ABy/qLaBHI9p0YHJeUkSHab7WOGB51KohA3HXx8DZV/xExD252y9Pl0c
	MvUFEWSw7Y8ZysZ+N8ekfs8lDg==
X-Google-Smtp-Source: APBJJlEHiRUlipZEYAc51ylR+oPacMfWIOIrJlTW8swND/ECBm1TJ7EYHrvDwuWGBCO4tdrgDY7W6w==
X-Received: by 2002:a17:902:c212:b0:1b8:5bb4:8230 with SMTP id 18-20020a170902c21200b001b85bb48230mr12101183pll.50.1689090836550;
        Tue, 11 Jul 2023 08:53:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i5-20020a1709026ac500b001b8918da8d1sm2100722plt.80.2023.07.11.08.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 08:53:56 -0700 (PDT)
Date: Tue, 11 Jul 2023 08:53:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg Ungerer <gerg@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, palmer@dabbelt.com,
	viro@zeniv.linux.org.uk, ebiederm@xmission.com, brauner@kernel.org
Subject: Re: [PATCH v2 2/2] riscv: support the elf-fdpic binfmt loader
Message-ID: <202307110852.E093C93F@keescook>
References: <20230711130754.481209-1-gerg@kernel.org>
 <20230711130754.481209-3-gerg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711130754.481209-3-gerg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_085359_574946_2C54D70B 
X-CRM114-Status: GOOD (  11.51  )
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

On Tue, Jul 11, 2023 at 11:07:54PM +1000, Greg Ungerer wrote:
> Add support for enabling and using the binfmt_elf_fdpic program loader
> on RISC-V platforms. The most important change is to setup registers
> during program load to pass the mapping addresses to the new process.
> 
> One of the interesting features of the elf-fdpic loader is that it
> also allows appropriately compiled ELF format binaries to be loaded on
> nommu systems. Appropriate being those compiled with -pie.
> 
> Signed-off-by: Greg Ungerer <gerg@kernel.org>

ELF stuff looks fine to me. If the RISC-V folks are happy with the rest,
this looks good.

Acked-by: Kees Cook <keescook@chromium.org>

Please feel free to carry this in the RISC-V tree. If you'd rather it go
via execve tree, please let me know. :)

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
