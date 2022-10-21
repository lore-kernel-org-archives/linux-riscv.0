Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2455DC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLQhY6/Zpf3riOx4BWE586ecMYIBFPlziN1cT1tcseA=; b=mH+jyTriBZldgX
	dPSTkh1gkiy0SEdDHgGQ8LMEpMLJTh1CPw1Zgp3pw9tPY/eZMuURAcSKkddUnMjnZPfZBln3C7SFq
	0vGs3XtSL+6VwpPxfpHmjz2lzDHNubu7sYSoqqRwNxhDwlkNKCpVw5Po45NjuPjf/n56ALD1+nKmj
	DW7J55cKcG0sLBpMoRCaOlVfi7krtqGnKd2gSzRaCYAy8OHOD7dFY4SzI8NPf8matVEZwMqbhF7/2
	jKFL4sQOEulHPTR3LdgcGYIo6amjOfGoDiWFt4U60aWexdZTUc1lZBrLYoqRLoU5QtHM0LAS/p7X7
	hui8GivXOxYLkbuHAGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrzJ-007uPH-7b; Fri, 21 Oct 2022 13:23:01 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrzF-007uJT-Gy
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 13:22:59 +0000
Received: by mail-ed1-x52e.google.com with SMTP id w8so3470184edc.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aTHKaZCiit3Ul01YDGFtP12Qx3iKFThlFmh66angHUc=;
        b=fiKApkDmp6tyrlKol5Kb4NK0cPmQ+F4mux4TjM51jKFVSqtU6Qcoizqk9zF9Af4k2Z
         AKGDRbIELDjq/0ek3b+/CKd+oxjLLIYsqPBU10Uok+k5CHQBv7lsiYRdZDgD1bRcUIaP
         UC9VBncfA7Mi+4PPHP+68gNwVaxFA0p57NuGRrG/4R3Wdb2PSpqrFJxiRMIUBQDUJBdW
         TsTG7SLdkLaoyy5P2famgp01xlnUgT7yVEYfVjcheym6Jl6U6GUU/ruy27ZPy6b328qV
         I9ixf1Q9xGAVdSAAJqyExDRc4TNobtnPbGnlmNp/QxAFiaffbdG06X3xPF0wPavtg7lQ
         TsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTHKaZCiit3Ul01YDGFtP12Qx3iKFThlFmh66angHUc=;
        b=Duo7A4AePsgjyhj6aOfJ1J6eTT0q53RsTYUm66fwgyOPDB4yC9LDrQNvNSGGCpKJMs
         0AEGoxyLg8QPiOa/sqyMDysdj502Og/bRSajRTDyekjLljqOwhsn1aMnbfhjCSbR+6Hf
         pqfx2q+O+pd3eqkzGYodSB/hgRQcrOz9nQYUBZ8gJr6EDSOgDnME7kf6yYzn/AONzfI5
         Cv3JOqrFwD0LFVkQ5IGYAoaGURhEqzcKCyptEVeADr8jEozEtSbBWhWigSO3hRqWVRfk
         jqTRMYQpcQQjppcEUkWsopYU9ijL2dSCuSXMGyxYvyYT17SFPryZC9p8+hBRzvq2i8Br
         LOmw==
X-Gm-Message-State: ACrzQf0sOCFPaOaCfzIDnsR291mHCNvYyZpHYVrHhPIRfmYQR2GaUlb0
	tAv54WEJNfqv2IkKri7tp6w=
X-Google-Smtp-Source: AMsMyM5syXbdOdYghEOb2IW3LQ96J2f99FQy3tqIx70r6rE6I/rZ/NQEu6JeomSCSuBNsoX5g4Hi0A==
X-Received: by 2002:a05:6402:28b7:b0:459:3115:aa07 with SMTP id eg55-20020a05640228b700b004593115aa07mr16798195edb.280.1666358573617;
        Fri, 21 Oct 2022 06:22:53 -0700 (PDT)
Received: from andrea ([77.89.52.45])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709061da900b0078e0973d1f5sm10694622ejh.0.2022.10.21.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:22:53 -0700 (PDT)
Date: Fri, 21 Oct 2022 15:22:48 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
Message-ID: <Y1KdKATQx16Xl/iL@andrea>
References: <20221019154727.2395-1-jszhang@kernel.org>
 <Y1HZFcBo21SQzXVj@andrea>
 <CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com>
 <Y1JaE/ot91Z0KXuC@andrea>
 <ed7c4027-8e15-245f-cdda-0551063761e7@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed7c4027-8e15-245f-cdda-0551063761e7@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_062257_642558_F95F0A43 
X-CRM114-Status: UNSURE (   9.22  )
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

Hi Tong,
 
> > > I use atomic_set_release here, because I need earlier memory
> > > operations finished to make sure the sp is ready then set the spin
> > > flag.

> 	Consider this implementation:)
> 
> 	smp_store_mb(&spin_shadow_stack, 0);

smp_store_mb() has "WRITE_ONCE(); smp_mb()" semantics; so it doesn't
guarantee that the store to spin_shadow_stack is ordered after program
-order earlier memory accesses.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
