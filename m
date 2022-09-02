Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8AEECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 19:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWe/A7h78PZ4lND1xFlQaaa9S6kRe4IqyE6C/9FwR1g=; b=1NOIv5Mr72cjV0
	c+F2oE89b2h7Tq4kHpFNHFgV/+SMVTpT7Ud68pCDgZRL8ENVFmIFDzcq0BcXQQcwY7S8AgXp75/0D
	qol8QrFG4FTWrgR3MCMFBB2JPmaJwNHi1olFHzYnDNR1On7GCOkfwjd256vG7g8rNgrbn7R7zYxWB
	Qle/c/7X7KGMchJ/VLuftWoV5e4AmtxK9u1MufrHFqNZz17gfCnTB4hwYtBLW8kkdJKDGoQUMf6Q9
	XNiaaFwu+1FCFAcj67F1wDd+Hgxg7IM1cgJhp+2+gRARhU73kaP6rt//TDLDr6gze2/izZrPo/1oA
	D+SQjXuZYF/8hEWBihQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUCMc-00AKh9-Sb; Fri, 02 Sep 2022 19:30:02 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUCMZ-00AKeJ-Rr
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 19:30:01 +0000
Received: by mail-qt1-x82d.google.com with SMTP id cb8so2310065qtb.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 12:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=IMZh5xqdMog0WQzJBL6EltSg/Pj8GlUcQe7Y1qvJwhU=;
        b=bID99jNOKTrDhg2oC20F2PzFgxlwcRnvH8SeMJmICRgrzXBQs8Oj8FUnKGD4VPZeQ+
         pJrucSPZRTBsSlTAAG1heVmMbS18WhW+ZlyLigxanb+Ij8LNNl6mJo50fAHB72ZnsReS
         EccDncFwE5HnkBYS7taqPd7PHLOaLaaW3FQmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=IMZh5xqdMog0WQzJBL6EltSg/Pj8GlUcQe7Y1qvJwhU=;
        b=TC/RqePaJxufk0KKuECAZLW4PnNG2f0pMKukHO/qTX1vNEzAWjs/b5aMF16O/OE0r8
         YmmnsxBRUTnH7ETU9juaPKjlFEjiUP/kGJpOGYFFM+KDZA6LS+aKMQi64fFkiC0E3+pQ
         PBRJb5EswUHzNZVbHaEUR59V/b5vNkbfbGupeNUK+OJ3olxD2gs8B2dhnkfr7oynio3q
         JD8rr8LiRT6yGEVfWoCcpuD5vZtS7CdHxKT0ofMbx9zCqigsHh1169QTR6EdvnmBzNaI
         oHwrT6QmblMn6p8CvEkYTTXzNzDvdLCcGG7DpIBoGonE9MnqCeXA9oUPybKbi4SBzSfb
         w4RQ==
X-Gm-Message-State: ACgBeo2NwxhIMuQJY1xs9dE46mq9II0BThslBPTIOSprs6bzZiJZAsmI
	VGYFB5OeNzFF7Wef6JwcM7ySVA==
X-Google-Smtp-Source: AA6agR63TriAjfL7x5Rep66Wfr0k2UaIs0zqH3AhrLPQLPn5gX9vZbioyR42+LvNUDLDiQe8umVRXw==
X-Received: by 2002:ac8:5856:0:b0:342:f8bf:3582 with SMTP id h22-20020ac85856000000b00342f8bf3582mr29435146qth.573.1662146992375;
        Fri, 02 Sep 2022 12:29:52 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id u17-20020a05620a431100b006b9c355ed75sm1932806qko.70.2022.09.02.12.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 12:29:52 -0700 (PDT)
Date: Fri, 2 Sep 2022 15:29:50 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Conor.Dooley@microchip.com
Cc: heiko@sntech.de, ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
	apatel@ventanamicro.com, atishp@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] riscv: cleanup svpbmt cpufeature probing
Message-ID: <20220902192950.ojetwk6fkhjzo7xg@meerkat.local>
References: <20220901222744.2210215-1-heiko@sntech.de>
 <20220902094939.wvzovl6ytujtjbtm@kamzik>
 <2910587.GUh0CODmnK@diego>
 <464dbc2b-e281-f9ad-f8c7-ba66e8247432@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <464dbc2b-e281-f9ad-f8c7-ba66e8247432@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_122959_917788_58446F16 
X-CRM114-Status: GOOD (  11.77  )
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

On Fri, Sep 02, 2022 at 03:26:21PM +0000, Conor.Dooley@microchip.com wrote:
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >>
> >> but now it looks like I need to go back and reply to each patch
> >> separately.
> > 
> > I'm not sure if tooling like b4 can handle Reviewed-by's in cover-letters.
> 
> Yup, it can! At least `b4 {am,shazam} -t` will.
> I am not sure if the new `b4 trailers` does.

Yes, it's the default behaviour for "b4 trailers". It'll probably become the
default for "b4 am/shazam" at some point, too.

-K

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
