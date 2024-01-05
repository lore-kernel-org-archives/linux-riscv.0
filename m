Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104DDC3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QCWnwrL9l2ZgyUOyz/nLvTLdNx3Hb/vW4DUMamBvtE=; b=bU9vpA6nrjk9Z+
	qXC1Bg9PVbQJWc+0jD79XWlG0lLgJ8/zYH7CLvpwkfc5fGFKkP/+Yn2feMjis2sl/xm5I6yd/n/pe
	l1rT9VSk2oPFy2LPGdPo7BMl4+hbC8TSbqaWrFKufuoKWbwiP0gASfLbkQQg8v8APo+7KXepSiF5m
	TWgRhHrwQQBH7yee37Ovqam5vWHIJqqpJqXGItSp+pqjHADYXWlpRtFVMizAeEXkX/B/T2TqNtkWt
	+qoIhg45YPDpziWe/1hjzZ7/NxyYyncwCHrCIMv2GEX4ITG8FUsjdBrEMbQ2txc+2fbUgZwLmZTf3
	VHK3eWv7piXnR/t8SXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLen2-00GAPR-2Z;
	Fri, 05 Jan 2024 07:38:48 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLemy-00GAOO-1T
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 07:38:46 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-555f95cc2e4so1566919a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 23:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704440320; x=1705045120; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9xbMRyk1Q8N40M3FG4qo7cue0pJiuY6oG4D1rJ0mRFg=;
        b=ZXc8OX0lnTo2Ctig3I7L4yPiPwxUZfptzSSr3pt+IRyVQPicLIvGHQvhzp4H0V9646
         2FFP+AehalP6imNqeKeRF/L/8ILsiKnGDSfZPJwjulba7fTr0ZDKqGV7v7gFaHKNC2we
         pngtcXU/qKDEURMqF22PdqZkM3yxPE2h1H25bld0ydvyTXf8zyPw8ZTiJJMHqWb71Ylb
         HiLdq3ZJIlrGaapuE6105atnC3NdFzJpbLC+jNjh0JgKg3UvjfJeFWfjN9i3wYJgUGDH
         fj/Up8E6S3GwTgb/vnZ8VsMAAiKXq52NDrof5q2YlB17dYg+EJC76lbaaovFs7WpVLyY
         FsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704440320; x=1705045120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xbMRyk1Q8N40M3FG4qo7cue0pJiuY6oG4D1rJ0mRFg=;
        b=N7rJvDS08EwMNPD8Oe2yyj11lPfp+vHSw1fjvvddc4sl92U7IpcrxcHxpVEFBVy62/
         y8r4Gakk0tQyQZqO4WLGlcKIlQhY1AI2H/UYTTCDbYUEDlsajFmlInjBitEO7tUYyys7
         Q04r3pj0wJRd7CiRRH8kdK/pQeZRvHeJ0YxgbAJKd40yrCGGXALSeeFYf2NKXdKXDjnF
         6pZDs6Db9X2+F1mXWfSkbhjlvyC1Y/bOCO9vVSw9gcuGJI1YWbZvyLjtdvnYQtRXftTN
         HbuarIRzgenZfFhMiK1zKsX+tSQtAVnMo2Q4+NYck657gH/wZQUU3kzBESe+VT347NZj
         lzOg==
X-Gm-Message-State: AOJu0Yw5ddfz9co+E9XcCWwGeWBDcn8+hIVadTdxYuHdT1GRY0y7TSe4
	VTX4ggq3z4QChTSPxwmSxTXg04PtRf837w==
X-Google-Smtp-Source: AGHT+IGiSm5dGtRrsw5R2/4RG5Ea0xNgOoH5nfO9zv4MQzIegx4Srmv6aiLOEZrZaQeubMROlPP4XA==
X-Received: by 2002:a17:906:5305:b0:a28:d5dd:574f with SMTP id h5-20020a170906530500b00a28d5dd574fmr638290ejo.31.1704440320419;
        Thu, 04 Jan 2024 23:38:40 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id lb24-20020a170906add800b00a28fa7838d2sm567579ejb.18.2024.01.04.23.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 23:38:40 -0800 (PST)
Date: Fri, 5 Jan 2024 10:38:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3 0/3] riscv: modules: Fix module loading error handling
Message-ID: <6f715492-dfa7-44f0-98fc-fc76e095b7a3@moroto.mountain>
References: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_233844_521805_76BF4920 
X-CRM114-Status: UNSURE (   8.82  )
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

On Thu, Jan 04, 2024 at 11:42:46AM -0800, Charlie Jenkins wrote:
> When modules are loaded while there is not ample allocatable memory,
> there was previously not proper error handling. This series fixes a
> use-after-free error and a different issue that caused a non graceful
> exit after memory was not properly allocated.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
