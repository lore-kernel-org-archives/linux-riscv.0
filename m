Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6F4EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDPsnrGK9yn60LJNUwHDQ6PON5ueGZT1GiPxBl2h0A8=; b=LdqO9gECh4ih7l
	OPwZDpPM7YwdoiTCX2xkFtl+oWU0uy69AVmQhN1Phvt8ANg5byjhwXIrB5polVh3ZSS5O/eimf6mJ
	mFZuj4vmVnbtPK9g2Q32kNBshjrwMLWf1QeYvckQ+L3+d2Y8HkQcTm/k3U3e0E7CXY0rNuE7neXjf
	GDXzNHKB3/SBOcSQhQeBqGcMS54j4iq1PvVJnVEX/ksZVDQc/HPbGRoYhbQoYo3JEUdnF8FUNfV8z
	4jkCrmQZAPtLtRV4Q9NMkL7/yq8Bk6Gcfvu6ywYYKC/97+ee2PZX6QXPD4R2XZ0ixI4Y2WibVBX+g
	lreXhLVe7XEpNv247Now==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJAy-00AZVt-0N;
	Mon, 03 Jul 2023 13:01:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJAt-00AZV2-2l
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 13:01:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3143b88faebso349788f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688389262; x=1690981262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qx5WaH4RmPmPZx1WuP5j36Jr81nkIdIHWjQ2gOPPQY=;
        b=YbT19crgLZeG3vUFlbnUcWc9z58dvbbpGCzZsASfhwG94VUG91/IUiVH6xkJs3fHkh
         SR1c9y2VmonoIv6jvBIKU05WuIkDXMjkf1Zeg67YqLCajjyRwzbkr9zs90+/CS1D6MWJ
         Ke/V/krB6FAKfGU06aWh9J7in6Xy4K7IKzUsHtAkarq0jvWeEsHF9uBp/+Cc6k0SJVxG
         Snmg3M3lf8NZXBZFFNcxPGe+J4H6hsxKdAlQsBRtXvYJkROPDAVJNdOehYlkKEiEY49f
         cAeYwBm+hGcc8pQs1S28NNicYuqIAXey0MaI107nPThcBsJxGTHLGFOOlHgq1t8Emhh8
         o/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688389262; x=1690981262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Qx5WaH4RmPmPZx1WuP5j36Jr81nkIdIHWjQ2gOPPQY=;
        b=HUOLe7nXWASRuW/QDFRMUGv8LJtFfa/HB+bmPIzRTsm2aemZCQtho934SUBkGKkznB
         sBvdyLbtAKjKj+2mDA4/1X5zCTqzPwVybyFc8zDjYVDxeNLptf99nohf109wqCduz7Y4
         3f00uX9m1YTmYUWCczSIS2Zq7JQbEUFuGsi1NlfTQ+zfbE/CirjkL0adQWIUailG7Gya
         w2u81n8Br4qJ/tElIJ29PGYPmC14NowBIKUtwjTdpT/nN1LWnSccYnD7zL7+Zo3DLzVr
         BQab8aWtbF5mhl5Oa+uhAbTYVxYENg4+yMCKtJvoshrCxbAevz0ieIaXPdFX+kG8qfDJ
         UEAg==
X-Gm-Message-State: ABy/qLYEim7v3yoSQqEDwgD2e655eJu6YmBLHvw0YYSc3KNm8ArQd4jG
	R74B53Z3Jm2mGkvNbBFfg2PGAw==
X-Google-Smtp-Source: APBJJlEN+VabvQdO5H7YoBZJ8Cb4TARJQCqzXHsTLOVDSYj8C3Bev8Jj3MHc7OGthoWrz3vn6v+ObA==
X-Received: by 2002:adf:fe8f:0:b0:311:1dba:ca65 with SMTP id l15-20020adffe8f000000b003111dbaca65mr9754678wrr.51.1688389262225;
        Mon, 03 Jul 2023 06:01:02 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f3-20020a5d58e3000000b00314329f7d8asm4254951wrd.29.2023.07.03.06.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 06:01:01 -0700 (PDT)
Date: Mon, 3 Jul 2023 15:01:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: ardb@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, rminnich@gmail.com, 
	mark.rutland@arm.com, lpieralisi@kernel.org, rafael@kernel.org, lenb@kernel.org, 
	jdelvare@suse.com, yc.hung@mediatek.com, angelogioacchino.delregno@collabora.com, 
	allen-kh.cheng@mediatek.com, pierre-louis.bossart@linux.intel.com, tinghan.shen@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, geshijian@bytedance.com, 
	weidong.wd@bytedance.com
Subject: Re: [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
Message-ID: <20230703-71f67eb66a037f5c0fb825c6@orel>
References: <20230702095735.860-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702095735.860-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_060105_406151_4C0CEC84 
X-CRM114-Status: UNSURE (   5.65  )
X-CRM114-Notice: Please train this message.
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


(This is a reply to a non-existent cover letter.)

I'm not a big fan of adding yet another interface. Have you considered
doing something like [1]?

[1] https://github.com/tianocore/tianocore.github.io/wiki/UefiPayloadPkg

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
