Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B78C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 14:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bo+53GwBzvhYLULEmeLhOhUm2deYQiCrPd81JGah8ks=; b=fHQwIF81ugayJY
	LeJZLbSETYcAAzW1sGYf8V2bVw6S72Uh3uA3evTGrpSOWbE2fN7+GjYxwLyfwB632h/0r+9HdQ1Zk
	7iS5ZyO0AtqjF9mbcP/zywnLkF/jw1gW5KqpOnTalixaTz5BPguai+2Xvn7br4N5ecMmKB3sCMr8+
	FcdQEvyRCRJh5O8LHEG0+OfuiB1Fx7OXpVX0h7gq1DQ+QfcO3Rp8vTQPAvAaupBu9fgkbRmT++DUg
	ZvCkvCoJ1QCG9IiijXR20RkXsPA6TGpSLJcl8si1CprmmtVO3ntPbqA8es0G/SWUKqfN9GMsIFt+m
	I++n8dlvUTvdaRhD2CVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbsy-00BkbS-MN; Wed, 11 Jan 2023 14:15:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbsw-00Bkah-3m
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 14:15:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id e3so5944673wru.13
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 06:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1SUCpd1X7B4/RhrBq3jHqkQo6F5mqVmLPbT9jBpoO94=;
        b=LmmpHbeobrL6FTzFukw6SJkTOTvPok+gj7ZMQd4Iq10jubcxPKCHo7saUgeOmitcRc
         3PEhaomvSOB41p5yW/V34xYoXmPIhAFQWFPOhsUBwBLUTVeJkl/1yfogrkTNICItvocv
         VlN2Yq0lJ7YvpgnK4Lv0H/9BqAj4DMsI1wmUaNi0vP+HAr0GOo8ZR/GhmNMLF4fyMcjO
         aVxCuLnSA36zzbvtMEcbnr41UV5OxLNou44qCmM17VV94lo6qFMTddKrv2jyQvzwqQeS
         mt/ZpQOalt7tcBQY9pMANKnq6iTyyucMbpESgnfE5GOCE3JG+3TRlHQ7pcv2QkvN7OLK
         dQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SUCpd1X7B4/RhrBq3jHqkQo6F5mqVmLPbT9jBpoO94=;
        b=laEhCtkHVC1hh1DWjhizdMWfNu9ONVUjWJ3O2G4nAjyZ5tkMtM97UpmK6NmPcSDfHV
         E9954TwtrumdTUQoDx4u0/3t9IJK6InQixfRamc425jukhmYx7va0LcBMYTV93GuVHVA
         /deZC3H4tEM6r9fdHwJB0ZVmZWQs8P3ATWEQnAjeMRLwhTiC+ZHPgczvfLHU4yfyFL3L
         BpjWsvEfKm03tM2RbZA7A4/1lGoFsv/TQNliYfyHkpJnxe5AbwKkZbW1RJiwjTc9KcwV
         MhEGXbsm7ea1SfvWeNkNbvhKh0fDYx10VDgDPszWYwyp7GGT5eYb1rl/Pmxb72MqDiCr
         JTCQ==
X-Gm-Message-State: AFqh2ko9Hvmg/05qWayQuMOrwVWcJzP9z2La/WET5dpi3WCdnqUpE3Ca
	j8QqTjBOBiVlhoz2KtUMBwtjSQ==
X-Google-Smtp-Source: AMrXdXsbvrn99UVmxiGFP1oXK/CP27OewAa/kznw9c2IcQwzW0LCTYZoovQXDMogZyb/iUxB/QWHyA==
X-Received: by 2002:adf:ec81:0:b0:2bd:c83a:6e3 with SMTP id z1-20020adfec81000000b002bdc83a06e3mr801943wrn.7.1673446520737;
        Wed, 11 Jan 2023 06:15:20 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n6-20020adfe786000000b002bdbde1d3absm3631993wrm.78.2023.01.11.06.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:15:20 -0800 (PST)
Date: Wed, 11 Jan 2023 15:15:19 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 3/5] RISC-V: fix jal addresses in patched alternatives
Message-ID: <20230111141519.rv674omn3jllhzhe@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-4-heiko@sntech.de>
 <Y763FrvFkrNGkIDN@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y763FrvFkrNGkIDN@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_061522_170799_6D681F2C 
X-CRM114-Status: GOOD (  13.90  )
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

On Wed, Jan 11, 2023 at 09:18:14PM +0800, Jisheng Zhang wrote:
> On Mon, Jan 09, 2023 at 07:17:53PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Alternatives live in a different section, so addresses used by jal
> > instructions will point to wrong locations after the patch got applied.
> > 
> > Similar to arm64, adjust the location to consider that offset.
> 
> I already submitted this in a month ago.
> https://lore.kernel.org/linux-riscv/20221204174632.3677-2-jszhang@kernel.org/
>

Hi Jisheng,

It'd be great to see a v3 of your series on the list, since I'd like to
base zicboz work on it.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
