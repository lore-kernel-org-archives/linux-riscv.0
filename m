Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC6EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 07:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CA2pMhN+xk+Chd4CmTJytBqHuKuLqusGo5a9abTvUBc=; b=2u+vieuNIQeMv3c92Hz5ZxjJFL
	7kddfOI8OfExz3Q+tuhQ+UV3wnm0814OV6oKI/j0ktTwmv0ie5T871f/mvAxKJvI0DAmfjlhD5s7t
	gljL+2yHyUuGBNu73VMlW9pFOAwb5kqsBh/kxRxm5NUroBL4oJ7i9xa9abZwPbkS2cEpGMvyaDxeB
	5amR5U7BRsJE/9n7/Q/GCP0upN0HbN/EYEEIL+Xn7zFD6PG8mYvLPwr5avDfz6dXf0FAS/HKrKkmJ
	FEGDijGPxyY6agDERi7Qgary7VmAg6k0NVI2GG+mpVGPZr174ataW4vsqHMgVNpoh71x4K3Th807j
	jRIKKV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4e09-0011ph-DS; Fri, 24 Jun 2022 07:45:13 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4e06-0011p0-3x
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 07:45:11 +0000
Received: by mail-lf1-x132.google.com with SMTP id g4so3022957lfv.9
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=NchjUSZ7bsPtfYUbnFjNc8rS98X1NoaQCaTs+rsISfQ=;
        b=YktYM87vr9qyoynAKx5BVqyGPGiD64LNzYzC0/fMzQQ7r05Nm2L6jp8aFvCLSSudlW
         CXGrKqb6d/1rFhlpeAHDTwY+30eRvPP7EzZ5XZ77Kg9ri2om6wSpLEV2r2x8D9e52LHB
         PZq2mFIVhOGv6Td5W37Sywx97b07ccciMrg6TBrAQbsO6O6+MjkE14jspol0oZDgVk/b
         8RRwLmhifpc1DFmohO6MIMl+yx/121MJcC4rbygVenpksoCI+h/VZtv817fEB6n8QhS4
         qBr37daKruVQHLMc3SvK6cS4GrIwIa63wyRyOixsBqPkWyPwxINniUJMbvwHSy3ksb0c
         Ow5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NchjUSZ7bsPtfYUbnFjNc8rS98X1NoaQCaTs+rsISfQ=;
        b=EaWab4o7XfZppOqTjRq/DxePFh2F89XPLYKaGika4HIX1DsfFZwh5LXLo8Z94jnoLQ
         Smrlk5oaOZ05pgN+NoALhKmqPKZVwDw3eXH4aMNZiNIWkQmRfDzhAMdXl5cnd5iK/G/I
         wAoWmVju1zoh9vVML5WTW3AmfRzrLTnTicuqaa/8A4NPtAFGYm+VZGXNDJoSuDsMwcJJ
         3p9wOREF6UMFMP7XLh//5MIeRWDiHOnJLvoDvW3OIXWAKyXXMy3vVA09FIsdeW40IHsZ
         OG3APWFptB/F+mU7W/s7tUplLrKAtaEkvELU8G+y4SArleHEIKWhGWaENwglzmxO+Vn4
         nLQA==
X-Gm-Message-State: AJIora+EEobCnkRHuRTLqYYKzZQQ5+8GbLxJjK/JMx0eOpFntGyO4Q6q
	FOGJCCegFOs/OOVYo/I5AfGBi0OpjQAJGw==
X-Google-Smtp-Source: AGRyM1s8wfGqgQkqV1yfGKT0TSCcphK3AU6lNrJN4bDx5nKPuvE1jxH3c7OvJmsnUD83lq7vpv8ZVw==
X-Received: by 2002:a05:6512:3b95:b0:47f:bc38:6bfe with SMTP id g21-20020a0565123b9500b0047fbc386bfemr796997lfv.507.1656056708140;
        Fri, 24 Jun 2022 00:45:08 -0700 (PDT)
Received: from [192.168.0.100] ([46.219.3.46])
        by smtp.gmail.com with ESMTPSA id x5-20020a05651c104500b0025a672e97a6sm186447ljm.80.2022.06.24.00.45.07
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 00:45:07 -0700 (PDT)
Message-ID: <76741e1c-056d-d3ae-fc20-eeb8f6e996f6@gmail.com>
Date: Fri, 24 Jun 2022 10:43:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Tickless timer regression in v5.18.3 on riscv
Content-Language: en-US
To: linux-riscv@lists.infradead.org
References: <bca6d76d-1708-fede-8008-d2588a14b656@mail.ru>
 <8887d851-19b7-ee10-a89e-fb69d54ac41e@sholland.org>
 <CAAhSdy3CoRVs7Rn=TDBRrfqaNEr1R6h4r1cdgGR-QKCtg7QYrw@mail.gmail.com>
 <CAHBxVyFv57ggFhoJTCUfVPsosjRTdCy=2+TD=P3SSnT-NG-Y1g@mail.gmail.com>
From: Eva Kotova <nyandarknessgirl@gmail.com>
In-Reply-To: <CAHBxVyFv57ggFhoJTCUfVPsosjRTdCy=2+TD=P3SSnT-NG-Y1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_004510_224441_A2B5DF8B 
X-CRM114-Status: UNSURE (   9.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 23, 2022 at 8:59 PM Anup Patel <anup@brainfault.org> wrote:
 > I suggest we introduce an optional "riscv,timer-always-on" DT
 > property for each HART. If all HART DT nodes have this property then
 > we don't set C3STOP flag in clockevent device, else we set it.

Is there any particular reason not to implement the opposite DT property 
"riscv,timer-s3stop" for timers that stop in suspend?
Right now, this patch breaks the behavior of previously fine working 
boards (worse sleep precision, higher idle consumption), and these 
boards have none of the mentioned issues, so why should they degrade 
after a kernel update?
The CLINT timer is already well-defined and worked for years, i don't 
see how suspend issues on particular hardware can justify going against 
the official spec.

I do really think this should be addressed by the platform SBI 
implementation (that's why SBI exists after all?..) or DT properties for 
suspend-affected hardware, not finding holes in SBI spec and introducing 
fragmentation in the SW ecosystem.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
