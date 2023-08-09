Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F628C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5k8WhhCFUoJv66iyi7hVmPUckPoLcerCUGRGybcvU4=; b=Iw0Oats/TyJQi5
	thMnx8lzMZV3op8VlVigkhp5rQDOimhqjRsbCkity7ghIAI0c4fUiYRvuWx0bnmtF+Y7r+66JAhxv
	Ma5IBL7s2JoApjQbjZiPPXoQwrLzzZnv6I9jdkGDvyL6f0mH21fJmLPUo59jWsRb6gTXzIhAAiE3e
	p/4cBJJL6zHQAoiFpBJsLTeoyEXa7qC9cpiWD4l8YVuAYjoZJbwI/pLpljNaR3ZspG+bbMKqb9K2l
	JSOrmOXK1R2VXLqWFJP1DEBZgLAYdab05ocswaLA8tq58+9Iw1gD+ciFmkrHvWol3lNiJvlJlr3yC
	cYDP1cvoDu6qEiAvjVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjuF-0057iX-0d;
	Wed, 09 Aug 2023 14:11:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjuB-0057hC-34
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:11:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bc1c1c68e2so43987615ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 07:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691590278; x=1692195078;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mIY98ATs8Sp2k6Nt4Ma3culh4Cy5LNj7LG1rUaO2uQ=;
        b=mUSvPNf4SywhNdU0KLw2DVBUXXkzCbKtkpcbJo1jNcgImlXRw1cK/W9dvtgf8L5+R0
         E8fH3jdEK8qnFwyIx45geAkJtGWffjEvnahOytEy6wlANrFhl2bKx0euN0KGVvUlUreO
         2i2eDPVjJDxqGQRHyaPQGr3Tvgm1GswZKHCVdXlQGMTYh7L/6dOnXaQYBA7QJ9qkce1/
         iQ6HGNOmf2a2Dhq11yLTdXbAeTWaD+iVua5GcpyiZjrPpgb/tvEAz+KnGgqPSHJ97HhJ
         0dvEJ2kYpZxwDqeNw3fKn07AvxTWlTRtn1ReSoIhlZNf5RwLO4Jd1JWs4K7fglTZSJh8
         b97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691590278; x=1692195078;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mIY98ATs8Sp2k6Nt4Ma3culh4Cy5LNj7LG1rUaO2uQ=;
        b=PfowNrlXmr23ObDTADd0Dwg5S8mZbQCx3kENHa4oZlvZQ3F4qxYPsjo8jDxSeCxWMf
         NXa0tebQX83MeQB7IR364CWr9jGTd3r10pKeILxcSTD69Jvu0KMEqTEdAKua2JMUYM9Z
         uexH/6hnpD85IXHYOWvWoKY4Yx3FQb48temtezNsi+28A/OtW+Bmbn5nvBIUSoDDK+7I
         WyTWr95WHmJUZj06PgiRJC5TSpa6eIBp7E9MFvrCXc25u4X0RKWHv10zscyjF/1YIMq8
         JoZ6Aaaybg+/tNTHV3YfwNY2jByDX7fVIhIuAgK7F/Hs2taEVOEIqt1b2JcuaI4BUaha
         +9Pg==
X-Gm-Message-State: AOJu0Yx7ExsdwgSjiB06My4cnkMebDvLJRxPFDTG8fw99ehkkc3bbpZp
	UAPniC5ICsiYq1XbAudPx2cBrTPkItyS7viloRPZLQ==
X-Google-Smtp-Source: AGHT+IFwQu4yz7lexZBMwWkILLgIn4eDHexDHimT+VBPX58RpGr/KUCDxSL4aDpoZ3RB8Vp3KOUmuA==
X-Received: by 2002:a17:903:2450:b0:1bc:7420:ea1d with SMTP id l16-20020a170903245000b001bc7420ea1dmr3192596pls.67.1691590278176;
        Wed, 09 Aug 2023 07:11:18 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id e16-20020a17090301d000b001b8b2fb52d4sm11176934plh.203.2023.08.09.07.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 07:11:17 -0700 (PDT)
In-Reply-To: <20230723165155.4896-1-tanyuan@tinylab.org>
References: <20230723165155.4896-1-tanyuan@tinylab.org>
Subject: Re: [PATCH] riscv: alternatives: fix a typo in comment
Message-Id: <169159026877.18421.6107684619447151446.b4-ty@rivosinc.com>
Date: Wed, 09 Aug 2023 07:11:08 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  falcon@tinylab.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, vincent.chen@sifive.com,
  Yuan Tan <tanyuan@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_071119_985363_B9B81D52 
X-CRM114-Status: UNSURE (   5.99  )
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


On Mon, 24 Jul 2023 00:51:55 +0800, Yuan Tan wrote:
> In the usage of ALTERNATIVE, "always" is misspelled as "alwyas".
> 
> 

Applied, thanks!

[1/1] riscv: alternatives: fix a typo in comment
      https://git.kernel.org/palmer/c/174e8ac0272d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
