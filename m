Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1BFC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTmFZ9nZI2q4yA5+xZazXNnHt5925aZWNgkt5C902ds=; b=r8QXuHFlQEy70u
	IgfFutWwhqb1RUKGahUM2bjC6MNBAeRGKDABkS9ppV5rgUhYYP27Qna3wegahWOg1rqAsayeTNk8/
	rq0FWJ9+w5A5XPpQcWHAoUDsE7LvbiyvRZzz8L2Po6JJ7y/Xl5sCpHrbVdR3Dp7ZjJSSKstxL7cjP
	+VIcwXrONWQybEYzA6AcU4hrhbeq+IAXaRZk2+33mhNsePGDZBWFCjV+BhX8AdL52mhPLor5B38Os
	agn+szq1IJHbrRoPALMMHRc16uqc+wWnXkyzOn4bgQkB/O5k1J8Z8FywUKypK3BSmAv3A52xC+EPX
	+2Wu+6ck3Nv7AajhpU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDoNL-009jgi-DI; Tue, 19 Jul 2022 14:39:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDoNI-009jbV-BI
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 14:39:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id n185so9082370wmn.4
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=imTKpFKOrgfWO7iUyvSCYCv8Lb+VDPpMM2BTlsZvYLQ=;
        b=F0qdPjV2GSP2ZkwHu2L25Tz9ftuegf5GaxCiMz8ZV1DGduiGMH+1aRBQfjP95lCeQS
         hhbesrziT39bZFz97hV1PILbAd9xAQpXXoFAG+gyQkab4VX4l6tEkhUlQugmnO+HixG8
         Y5rkvOVfRCHHYYJ/jkTyykLSLWu8wE74/xXY7khC6wxZypP2LM1HDTq1Ut9M6B4zaVGs
         h+ly62adnOsMM38bUaeYVF/8HENiLN9ZJmoTkJFErHohtUB3GjfmY4Af8stRhchAoxE9
         38iM5ziWUwCCm+frWPgYhzPeWa4yWANuqU/z07WefyeziExYKuQmpY4iGzCAMC+hr1QS
         AQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=imTKpFKOrgfWO7iUyvSCYCv8Lb+VDPpMM2BTlsZvYLQ=;
        b=cuxqaRz85px0i6UlkPkjrh5pandVe6MPVEYxpOLvNIq1U3EyVY4bdYLXJHiGB8fdA9
         swiAa5xwC5rNtVjpXg7DZAzGWRQdqsLIxLtXdvJ1Zh0t1NKN/VoaiML2ZtGL2DaFzA6g
         KKOJKCtwth1NoyDN6SdmXHScnkHz7IDrTOjF1QzFq2MrmD4g8+0iN70KO6TAiiF04HH2
         xBWFzEsJ13J1TUlA1Vl7mYGce5162bISoVOu76PKiN+2VcyXguk+wMYD2EsW5PdUhlT3
         7Mp2/Oy91XRQ4dGs8GOp6ks9OfG+569DLlI+3OBtD/d3pzBMhNOIUSzlNMlOuAzeb6Em
         72Kw==
X-Gm-Message-State: AJIora8UzO3ygevLw1a4sTvpE3Lr9or2qte9jk8cngfbW0i4QGqcWGoG
	ZHuZ4950B150Knsmhc7Q638lRg==
X-Google-Smtp-Source: AGRyM1tZwk6O4/zSO8sVVluA38td/bJjHrs9+Jk4AZ2G6prb0wpJs/bRw4ZSLU+Liu5PfXA3DUgnwA==
X-Received: by 2002:a05:600c:5128:b0:3a3:2160:7a7b with SMTP id o40-20020a05600c512800b003a321607a7bmr4693067wms.204.1658241536044;
        Tue, 19 Jul 2022 07:38:56 -0700 (PDT)
Received: from [192.168.2.90] ([109.76.0.125])
        by smtp.gmail.com with ESMTPSA id a8-20020a056000100800b0021db2dcd0aasm15768055wrx.108.2022.07.19.07.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 07:38:55 -0700 (PDT)
Message-ID: <933a217f-49f2-4868-e5cf-d022c90e7580@conchuod.ie>
Date: Tue, 19 Jul 2022 15:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
Content-Language: en-US
To: Ben Hutchings <ben@decadent.org.uk>, Guo Ren <guoren@kernel.org>,
 Conor Dooley <Conor.Dooley@microchip.com>
Cc: emil.renner.berthing@canonical.com,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <Ys/8SFo/oC1TFZYk@decadent.org.uk>
 <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com>
 <f59e4a64c541c5781bd10dd81c8622249d785c70.camel@decadent.org.uk>
 <CAJF2gTQ3V=TWib_cbw=r-wFtH9Ee=m7tG9OzizQhiZOU11Fa-Q@mail.gmail.com>
 <CAJM55Z8Eq-iUBFb79HJpykgGOFD-QykNdOJ7Xvj2-azeFJehLA@mail.gmail.com>
 <CAJF2gTTtEUL-o9Y+AbxWzT0Uf-8UwUqw8EgihZFn7D7huJvkmg@mail.gmail.com>
 <e896e651-89ef-6205-b2b5-ad9f4905f698@microchip.com>
 <CAJF2gTTFg3+0k57kdE4qVAsO=r=76k_rnJ1-CrLoqfTUwURVqA@mail.gmail.com>
 <2579A2A7-7E88-4F80-AC7A-FE18D176785A@decadent.org.uk>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <2579A2A7-7E88-4F80-AC7A-FE18D176785A@decadent.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_073900_429730_646DB649 
X-CRM114-Status: GOOD (  13.44  )
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



On 19/07/2022 14:55, Ben Hutchings wrote:
> On 19 July 2022 12:35:55 CEST, Guo Ren <guoren@kernel.org> wrote:
>> On Tue, Jul 19, 2022 at 6:29 PM <Conor.Dooley@microchip.com> wrote:
>>>
>>> On 19/07/2022 11:15, Guo Ren wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Sorry, I missed your patch. You are the first person to catch that.
>>>>
>>>> + $(build)=arch/riscv/kernel/compat_vdso compat_$@)
>>>>
>>>> The above is also good for me.
>>>>
>>>> For that one, Could you add "Fixes: 0715372a06ce ("riscv: compat:
>>>> vdso: Add COMPAT_VDSO base code ...")" in your next version of the
>>>> patch from Ben's and add "Ben Hutchings as Co-developed-by:"?
>>>>
>>>>
>>>
>>> Why would Ben get a Co-developed-by?
>>
>> Just a suggestion to "Emil Renner Berthing".
>>
>> My reason is:
>> 1. I think the "Fixes:" is also necessary, and Emil could directly use
>> it from Ben's patch.
>> 2. He also found that problem and shared the information with us. The
>> key effect is to make Emil's patch quickly reviewed (Although I missed
>> that patch).
> 
> Please just let's get this applied.

That's always the goal :)

> I don't need credit for a trivial fix or commit id.

I was more curious as to whether Guo knew something I didn't!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
