Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CC3C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jun 2022 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEn0vhjiRThebpttuLcS8Uuq+St8A6y6omjElmcOC6s=; b=hjt158K2qUH/Ja
	kLqN2+j9/mEh+EsBAlv0QLxJdnmGqZ6Skb38x9jTKkKIqWR2K68dvVDBtQRK3UUtLLVPx0NJF4Z6D
	rYaLUdBO0UEJCfIvSB7zE7G8vl1KAdw55mec25Y9nZ/mp3q0belSVquDsjCV+5KLS0AimPFZvnBaG
	3k0iW6c7nfBAtQVplwxENCMEtvLPuVsEH7HsxHTVDxfC6B6UMU3Az23k0gIEJQiwvpN6GLJhwlqf1
	9m9vX6oyh9heM8eet9Vd+C/bxNLycc97Q87QJgmWa7wkV3kelF+ZWaRKYkZobkg5xQZs8WYSXVB9X
	euYfW6K451pKG8lAGFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5NNQ-00AYkG-48; Sun, 26 Jun 2022 08:12:16 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5NNM-00AYgX-KD
	for linux-riscv@lists.infradead.org; Sun, 26 Jun 2022 08:12:13 +0000
Received: by mail-lf1-x12d.google.com with SMTP id t24so11583387lfr.4
        for <linux-riscv@lists.infradead.org>; Sun, 26 Jun 2022 01:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iOnjf5psLNx3xWw/YTRg8ZpCATrMjddLsDZJOrN+BW4=;
        b=k54NS7IqzjlNIZVmVTc6McX1MLgAw+flmY4PqpowXZKgbYbu53c72jpinkaZmxgq1u
         60zdMOXixeJxI6IbY3zp2LRTv5VjnRGtBjT2m6/Ntr4eZdwWdsCo2iil27SOg9mxnEMU
         VJ37OUjumrxri4l7wCCU7oa/+Cfo5tlDeEkW6v33AQUK+2fuNXM1aGMKRmumts91Dm/T
         MuReA4LCxLWP6aFIIVqAXUzAhhHGYO9KtQqMSOtTE5UowHBZ2Iy4I6vD2IqfHK/5hcym
         VMS6s01sRj+zShlvkz9v/XgEovRL+gIgYRy46VkdxN5xTI2xo6Dqi4vfvn892vOEWhd3
         WUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iOnjf5psLNx3xWw/YTRg8ZpCATrMjddLsDZJOrN+BW4=;
        b=NL8qg4lNnuvEmrWaUddeyPpLi/L+uoGnmxDv8aLRfUbjqdsO1wVujnwtFaj4ucE4fu
         ABCW2FeSB0V39wMLQN9N++yhnJ64b2PkVfqcgD07LFdU4QONMExXQ6UE3szwoAcg83UN
         48kCoaQ6WgbowK5DC9OdLXI7LZjkodVzDLCwOZGMUWyOm6cnAfLlAMFG2fxWYCXyakhF
         08hAP1UbWZezB59VJChBxSMgURo82eVVHogd0WK82LKA1Xq75sAYYs6qT/vj4Ylk92wn
         mtudNq4kftj3WZNFiBKpxuVXyOdilfZ9iOKcGyK8cChpFtKmeyLsxTBcT2LEWySsVg5y
         PjQA==
X-Gm-Message-State: AJIora+gp5Is/lx8c88wrrupEuwDfuZVdBt7UmeMFElX/AWCEfEvbO2G
	w6SohVeo8oT0HbX4ZGvVZhZ2VEwi2YW6EA==
X-Google-Smtp-Source: AGRyM1tOfbn58R5lZ+IXspFd1q2JtucmAP6wJ5+26Jd9PIP4JmKoWo/UKZYt8ZTksw1a+UyAu8qpkQ==
X-Received: by 2002:a05:6512:281a:b0:47f:aea3:357e with SMTP id cf26-20020a056512281a00b0047faea3357emr4943615lfb.450.1656231122976;
        Sun, 26 Jun 2022 01:12:02 -0700 (PDT)
Received: from [192.168.0.100] ([46.219.3.46])
        by smtp.gmail.com with ESMTPSA id p13-20020a2ea4cd000000b00255a17d5bfcsm880835ljm.106.2022.06.26.01.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 01:12:02 -0700 (PDT)
Message-ID: <c04b84c3-65f3-c15e-d20b-adffdf89b4ec@gmail.com>
Date: Sun, 26 Jun 2022 11:10:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Tickless timer regression in v5.18.3 on riscv
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
References: <bca6d76d-1708-fede-8008-d2588a14b656@mail.ru>
 <8887d851-19b7-ee10-a89e-fb69d54ac41e@sholland.org>
 <CAAhSdy3CoRVs7Rn=TDBRrfqaNEr1R6h4r1cdgGR-QKCtg7QYrw@mail.gmail.com>
 <CAHBxVyFv57ggFhoJTCUfVPsosjRTdCy=2+TD=P3SSnT-NG-Y1g@mail.gmail.com>
 <76741e1c-056d-d3ae-fc20-eeb8f6e996f6@gmail.com>
 <CAAhSdy1pYZsRqKTt5jEsOy4MsPcSZDmBzY6FJGBhRTRLjC8xNg@mail.gmail.com>
From: Eva Kotova <nyandarknessgirl@gmail.com>
In-Reply-To: <CAAhSdy1pYZsRqKTt5jEsOy4MsPcSZDmBzY6FJGBhRTRLjC8xNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_011212_732198_A6353AEA 
X-CRM114-Status: UNSURE (   6.94  )
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

On 25.06.2022 10:22, Anup Patel wrote:
> Clearly, "riscv,timer-always-on" DT property is more appropriate
> since it describes HW behaviour

Well, I think this is fine, I was just worried that this was merged into
stable kernel without a way to override it yet.
Hope the "riscv,timer-always-on" hits stable tree as well soon. Thanks.

Best regards,
Eva

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
