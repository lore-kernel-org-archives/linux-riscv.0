Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2358EC71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 23:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2AvmmOE0mGvBGzkfBy6h/vJ2tPTg43Vm4tYVWZr1Rk=; b=Et1gNOvtdnzqnw
	5dx/tJkuqrRpzuhCpsSFR1Q4bwXP59xNxXCPSYeYRku9o5J25kpj9vkaBWuvTNDgbCFfZ6J40pKuy
	iaILrA9ZIZlsD0lW2MZGmYbHgWG13bU2nKVrRx9tZNvBe6VeWX39cHEKNnQzfC9+9Zw2epwefYqhV
	+1iiAsJWbKGQSCkLX5+u86rAEwsGPhNiIBQjmeWMsGADiENLJ5QAn3DH3jBssQyuCRRKJH3P+B9ov
	8qCJHTkLA4FSkh0IS0C91+tISNFFgkOYhLjGuxVe7WYucZ/cxVPiEf0jZ2GkUZ2WRylDRYyqautjt
	fWKEl0GiuId3F6cMWqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfVZ-00000008bIE-0lTh;
	Tue, 17 Jun 2025 23:14:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfVX-00000008bHr-0L4L
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 23:14:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2363e973db1so1410465ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750202062; x=1750806862; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EGBYSwd2ZHfMGSOUy0pV5HM6pjaKicXfvLPu6XGQKPg=;
        b=kAZ5BB2UA30ITIwKly0zImbHIs9rDavKVlaeIn28tNlrlsRdK/TrL3y3luwa82uq0n
         4D2I3kBr3Odnr91H2W62WVm7Lhw0l4x5perp/smk0q/Bw8RwRKCNzM4MtghFZlEPGJfw
         F+CUnEp9AHmlR1Yks5MCxJQLChtPCGIsgNflcM+B4z+53I6TnHACO23ISgfP8PuBCtHz
         2eKu7LgpCYXeyNavnV9wJs52VjVITcw1wbzGiW+H+OqhJdT4l4XpgXDG+JoHyyKvqzRn
         AtQhIwukBNAgPMME4IXVJ4BkAjlc8oaifoqNAC0RYMsC4+kmbzgR/2fyZFJaeaH9gJlR
         VTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750202062; x=1750806862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGBYSwd2ZHfMGSOUy0pV5HM6pjaKicXfvLPu6XGQKPg=;
        b=kQWeiKGVzeUgSVL+c36udLBkCK37ZnL+a7Z0ECXn2XvBVhXpqQW98eug8aLGPMFAQf
         x+ahsRV0NpwSzqaX5u6y/UkOfDdBv8wOq2Lk1ZWcFguaI2lC38qw3n9b6FabyYR3OeBP
         whoRLUMQ5Hd4vDWig012vhKUItIkgshNkoKgTx7fDHsDnyIvxdfm6NENo4Wvg18Mi1wy
         pFYU9B1fQDMUYCl0uAkSDKLX00aY9hPwCV2Pf3pEaa80pPWB12qbRLW15YgikXSJZxkm
         xK2JRhQC0P7tO/NGZ+z7oPj6gcd1KByHrAPoy4rJcNhIpgEZyX1Ygn3Z15T8S6k0tojj
         PIOA==
X-Forwarded-Encrypted: i=1; AJvYcCVj9Pt1Cmdr+H/rMFXqfYgetj0yXJHR3yBomunTpfaTD2mbAq9f2rPTYbU7zR7DpWaVsslD5Ca7mUIgvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLwgr2fcthyZjsXiVhdGKLc/MPBXqHZ24U1iDlgIp2Y2KA/sJt
	sGH4I09jg9WW9nnAAwvp12bCEAPaT6/7ByBSYcuv3ng46sI4REeXsPft
X-Gm-Gg: ASbGnct28fgifttnrLz9IlBTudMwrrPhEoepOvi22MdrxVKwfRvP65VNkJJVV53ysH1
	67Y23XqjUbKYZ7fUEPj5s60tMRIcYv+b/RMP/WpJhx/SQ3wGW6Ru83iEtQ8vMK+oskTlckK0pnj
	EkxsWyhcGFCiFqWd4bU8RGjAKH/e7NuEeuaNp1t9kjSl0SgqmuyTMFmvSUIZ+oGs5Z81PZ1Zl3Q
	GdWdDz9G7TQgrmWqf4q2SvPddC78NiT5KwkikgQxE75iIg3kLlmRr2qqIaIB7NhYZxTuEc+YOen
	HHnbBSBTmfF4xX5G4M0HufP+qzJ2g3zbCraa1n7gf3qlM3Nd+IkmRwrixvXxOQ==
X-Google-Smtp-Source: AGHT+IHV7psFrMmfaxJ1IV6J338iQx2HCKSnK63uEQGDNoDbLglPoYovMqJVxLQHE0+ZHMqLW7PAuQ==
X-Received: by 2002:a17:903:15c7:b0:235:1b50:7245 with SMTP id d9443c01a7336-237c2047aafmr5335835ad.7.1750202062010;
        Tue, 17 Jun 2025 16:14:22 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365de78169sm86179965ad.123.2025.06.17.16.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:14:21 -0700 (PDT)
Date: Wed, 18 Jun 2025 07:13:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Ze Huang <huangze@whut.edu.cn>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <jwehvuaywhkmrnmjxz4s6vv45seof5aihvb33upwbjv73bt5ak@e6yt2wdo2mzd>
References: <20250617070144.1149926-1-inochiama@gmail.com>
 <20250617070144.1149926-2-inochiama@gmail.com>
 <175017325268.2418026.3599473248491336605.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <175017325268.2418026.3599473248491336605.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_161423_126288_4401E322 
X-CRM114-Status: GOOD (  19.39  )
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

On Tue, Jun 17, 2025 at 10:14:30AM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 17 Jun 2025 15:01:39 +0800, Inochi Amaoto wrote:
> > Add bindings for the reset generator on the SOPHGO CV1800B
> > RISC-V SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 
> Missing tags:
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

I removed this tag due to the the small change to use enum.
It seems like that it is not necessary for such a small 
change. I will keep the tag for the next time. Thanks for
your explanation.

Regards,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
