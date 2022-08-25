Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CFEC04AA5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkWTRPKozqfpz/EG+jiOiFqxJfC57WE4LJCHCmJ6ZRc=; b=T6LAJ0RZZlSPSb
	YH7GiLtmfcdlI2DEnZEMnj0/Uky+6jx7Eyp9gIk+ySXUalbSG5VC6DEjdpP2kvMG+9p6keu65T4Ii
	q0yaniVSy6D8Fyr1YZ0Kop/ZrBej4vlhOjcdb+ZRfzjuuYctxK7Zd7VeZshgJkq+Uy7pEHpQBjAq1
	1Vh49A9MGEgzXyZ11t+IEtKZYPvvoILsA0yHgojcPN50b80EJIFxbIp1cuVgia+jm+GAhlJjbJBZP
	2bq3Jtr8sUfqNzxmmfmQZNCs1Ypo2GCtPLQAN/hZ3IbkA1asWDzipkzqQFlFGEI9kytt1k7nBsAWY
	5xtUVuEAhAZ7i/4oI27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAgc-00CKy9-Ja; Thu, 25 Aug 2022 11:06:10 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAgZ-00CKfm-Kn
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 11:06:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id n7so24132979wrv.4
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 04:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=xDb+b/m0n+klNI3MyZmJA3s5Vf7qTobkubvvQlKUrhA=;
        b=Xg524UvqkXEorDOgtptPoBihbU/PP92MM0wPjghBTh3BoTLqbi0Crj9DZg9aXoOGq4
         Ec6RdzTjbKiokXnx6oDwXu153+UGLhSswQ5QHMISH2JBHsXksC+9p8WgIrdqBaUM0xd9
         pqo8PTo1kIGZ9OQz/65ueP7qPkzJdyfjGIXjGQOgKnD/LB0JhO28JCJChlwnoWTIHHpF
         CSYkPZQaM+Y0gwLOyLiKDp7RVTIxN3mwdDiNlSMsi1mkJAuMoc/ADJrKaspHyX6GFnGV
         fLBd3BqLYQYJQgv6/XDo2B2y96xfvwqHJLbPgt4jDCOKoko42KdfjReQQNp3Tf72erBl
         IndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=xDb+b/m0n+klNI3MyZmJA3s5Vf7qTobkubvvQlKUrhA=;
        b=e6YdbYmMVOMwrevtqFIiXAnfkRRMlThA0/2caFcUc+Yds6PKVU9vTlirp1DnBc2S6W
         L4VMLt1mZ5qRFlu5PWzoManlMQZie4fadpbWIhsPofFCWTGVsdC1SXNrUe2+k6Ml/WRH
         kgwo21As6m6ppkntUhT0Xpi69Dmv8PENrAegNUL3jNp+gOQzD3JGS8z2r45NZ0/Ew8Pu
         LhrFhJGsqzvUCp4abh1UyGmrZi22WXocFm5OizKf/9D4buMU6m3y5tbAqXaw+lfh7B4R
         iSvBfUvBKcjcqvwCfSskcwbMNGe+wt+/MnYjqLqTHd2mUItq4+2Q3l85y0FRoPHQ5aHD
         Lcmg==
X-Gm-Message-State: ACgBeo1W02caWpx6ICWwsTwSIjiloXXge2JLbbg9/1Td8JLBEgteGI74
	8pNZadgBRq8hxZkviNby2/wMlQ==
X-Google-Smtp-Source: AA6agR5wgTb85p6m68rmlF+R4Hb/Df4DO0dJEpedMfqx+JgbG58cN7d+hykqeR5FWUVhpIfFsRTrQg==
X-Received: by 2002:a5d:634f:0:b0:225:2ab4:d539 with SMTP id b15-20020a5d634f000000b002252ab4d539mr1864694wrw.149.1661425563745;
        Thu, 25 Aug 2022 04:06:03 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id a17-20020adffb91000000b002207a0b93b4sm19426496wrr.49.2022.08.25.04.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 04:06:03 -0700 (PDT)
Date: Thu, 25 Aug 2022 13:06:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor.Dooley@microchip.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	wangkefeng.wang@huawei.com, Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH -next v2 2/2] riscv: extable: add new extable type
 EX_TYPE_KACCESS_ERR_ZERO support
Message-ID: <20220825110602.bog5mjpascvikwxx@kamzik>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <20220815032025.2685516-3-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815032025.2685516-3-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_040607_702037_EFEF3E8C 
X-CRM114-Status: GOOD (  11.17  )
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

On Mon, Aug 15, 2022 at 03:20:25AM +0000, Tong Tiangen wrote:
> Currently, The extable type EX_TYPE_UACCESS_ERR_ZERO is used by
> __get/put_kernel_nofault(), but those helpers are not uaccess type, so we
> add a new extable type EX_TYPE_KACCESS_ERR_ZERO which can be used by
> __get/put_kernel_no_fault().
> 
> Only refactor code without any functional changes.

This isn't quite true. __get/put_kernel_nofault now sets a different
extable type (as the commit message says). But, nothing special seems
to be done with that, so there's effectively no functional change. Can
you please elaborate on the motivation for this change? Where will the
KACCESS type need to be distinguished from the UACCESS type?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
