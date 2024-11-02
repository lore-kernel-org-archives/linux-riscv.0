Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB485E6F09A
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 00:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9kw9G4+mKRZ1cxST7Ntl6wCY65uiICnkTCKzIarcLw=; b=Jv9PIFjpte3KtO
	1tBOOphqhYHRniSxQ/fST4wWng40BM+3z/mJx194xPO/ZZGFZ+BNkWKPoUhQDp+8VAwFp5VtCNYku
	RxCzWK/2j/rotFL5EQdbernaogxIO4XdrhFhVWp7yrHCRnv1oGAs+1syzmvpFnqf17w32wfGn/H3e
	izJWM5NDCbspSNK54ljgbYvfirug5uQTxf1DtWPBA+5KIj9ZMPpQPMV81Wm+yxng4zradNmoa7Cn/
	d/dGtmRzuF73C+0DiCOf1qBlXt92IM4ldN1dh96g1uhM2pJ752rwqaCZ93UqkPatdGFWcVwSLJZXW
	kycCU1mJpfl5zIJOsA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t72M5-00000008dpA-3tFz;
	Sat, 02 Nov 2024 00:51:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t72M3-00000008doQ-16rf
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 00:51:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20caea61132so21835935ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 17:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730508662; x=1731113462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=02siiafPBB+WwrD70k7f5oYXgfNSeX3MzSwQ/u7qGxI=;
        b=VTeuQLLtpPCF+Mcb+EX8Xu2QfSxsTVHUBjjI5LM6EhW53BogwUnpplqTmvMBHWTje1
         pA4vofVxvdcJb2KTRW64BKf90g/h0kTHMY+gKNzVNAbjv9DAQX/ZqkEUXl7GroYfu855
         vOA78pD48xTECHtN75tlxVlN1vzlIFv2PFt8RJf1zu+7TKqu91PzDv+8fV9cmT8H1Got
         3EQb136EgtMVnCEHrEjdM9wx7ReWBmksFh3rvNwCjDOl5lPmjVeywzzVGt0fVu+UWhzL
         Y29ciL7hJKb11dezYlAp76f6+mh7eiDBNQTJfH9MEPXyf0lI3N8xWhHcak8riedcKyQz
         54cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730508662; x=1731113462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02siiafPBB+WwrD70k7f5oYXgfNSeX3MzSwQ/u7qGxI=;
        b=pQ/ch4uxAyYQv4YpMV3xDb0Nkz8JSgJ1QKNCjs8Qo/4CHeiH9oICiVmnI/4bOA0x+e
         NUE04fUx8T1U776AvMH7y5FkRvhtvv29Awg0czd5ktwuZ8kuyQg8vcNKozfg1kSg/Wdz
         RIVdzk6x0XGaRTKg0bd3wUthULp/npS8Q9sbHT23Z35waWf0monaAuQhK7RQBfTtzXss
         r1QYUrWcOjEgUYLXf9neNBm8UJoNPAEN1ZmfdpnhSDgjNRkbPJaqBA/GS3kIhKGGZ9C7
         fCvpAVDJhVNm3Q/zPMqC3Ot25ddc9tqGlXX6FrIjQJ76IkaAOBteQjWyn+QVX5+CwVdo
         /rrg==
X-Forwarded-Encrypted: i=1; AJvYcCXJMjy8DJRrVgU2cHQiQJK1UeYp6mV6HOC8iPRXA/vL77psjWzsIWfvgk+69+2O70V1t2K01GMJ3JwQRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyA8rgaofex9OCK9NLhnE7uwtSzZFfBhvZ1ElxvvrPdK4dG+aM
	cxBNrKNgjtkyRDVVP3xhhUcda+fX7BO/QwbtcOr/idyS9jGVQi9g
X-Google-Smtp-Source: AGHT+IFHGKcbBzTBN6w+LmMFrDb+s/iIBlF+oSnT13qe0i7i+AMUtykuFT0A6r8jbSq24XPs62aIow==
X-Received: by 2002:a17:902:da8f:b0:20b:58f2:e1a0 with SMTP id d9443c01a7336-2111aee4402mr74234475ad.18.1730508662020;
        Fri, 01 Nov 2024 17:51:02 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d44b8sm26490065ad.263.2024.11.01.17.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:51:01 -0700 (PDT)
Date: Sat, 2 Nov 2024 08:50:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Inochi Amaoto <inochiama@outlook.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: fix pinctrl base-address
Message-ID: <zfnisncpvhjtnsfdciwnqdzlh6bhcdslxx5tp76smmyskgtdpi@wcwdrllaeifo>
References: <20241028-fix-address-v1-1-dcbe21e59ccf@bootlin.com>
 <ihmors43w3ttfun7c4fj75ahh2hnhafdxhlmocbxfwttigj3fq@wxud2d2srisn>
 <MA0P287MB28221D96A094D7C3373C1865FE562@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB28221D96A094D7C3373C1865FE562@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_175103_324086_699FDDD5 
X-CRM114-Status: GOOD (  12.65  )
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

On Sat, Nov 02, 2024 at 06:28:50AM +0800, Chen Wang wrote:
> Hi, Inochi,
> 
> Will you pick this on sophgo/for-next?
> 
> Regards,
> 
> Chen
> 
> On 2024/10/30 11:50, Inochi Amaoto wrote:
> > On Mon, Oct 28, 2024 at 11:43:24AM +0100, Thomas Bonnefille wrote:
> > > Fix the base-address of the pinctrl controller to match its register
> > > address.
> > > 
> > > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > Fixes: 93b61555f509 ("riscv: dts: sophgo: Add initial SG2002 SoC device tree")
> > 

Yeah, I have quened this patch and will merge it once I have
space time, so please wait.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
