Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60976107BCEE
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 02:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/v8oPsCQByI6Ju06AspFjD3/bBJDbZk0O6zRfWev8k=; b=nfOXM1JqbtJXNN
	ycFXi5C65bb8Py2e9u4kFGEXxwZ6H9v/RjQi3BWTUWZXTcmcTz2inpgI1MZtra1enMCbGibFWxWKz
	qlil0m6UKXQAF5yvdZCpkOxrXL0qw+jS7mxe/fgYFcskObvlvO+x8tKedgz5YlBoYZoNPkseT/frS
	WX1tZ/GFe9pWaZne/gI0WdEA+atCoKuqqb/8AKFHH9wZc/qxxnpb3CMtQ8Sbiheh/VXzkla39rQ1g
	gi8IlmRKjl/WhHn1XlC1laAChfkJ5wdhqE8nXtswuLg28VBVX/aKSNSDNNRqkolzl8TViI0nNJRPz
	v+XbM5qN7ayjzg6E1y3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1EJZ-00000001POd-25UE;
	Sat, 14 Mar 2026 02:01:17 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1EJU-00000001POJ-151M
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 02:01:15 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-64cb577e79cso3171170d50.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 19:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773453671; x=1774058471; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCvYTlqh1MWL8IyixDf4AN02tdUmB4IFN+TyGNNiUIs=;
        b=ipfXEt90xEXQdK/5zd4UzIjuXdYCeo8EIK+gEOvJSfBb+rM+6l5dafMxkl2jLWDuUX
         ZN0pNrXmMK7qf0HLrTRcEnu7BiMFY6dQNeua5NCvuYaQhoxM8MnX8SrTfwcY0VJuBBr1
         tszuq6yfY+SyNhD14maAnc4wgEOYXetlsU4AxjfMEaR29gDt99nmolALuRUghxETzGbL
         QKMsamacLcgOAzkex6mqWFH+BZtepMYLzalxSVeuSClIvMOKNkush790IPKl0UnaYJ0d
         8bvCjXh0jjx0jwmyaThWevB6he5KqoomR0vot4HaXgOetjqvF1z2fMZAQWc6cRNRFH9s
         DFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773453671; x=1774058471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCvYTlqh1MWL8IyixDf4AN02tdUmB4IFN+TyGNNiUIs=;
        b=DjvNDsrDYowBQulgPsomkHRVtvl+f0NIexaA5HSN91hl0m2Ynp/MT8NxM/KCVIxotK
         scjZkOItZ/qkDeTeReAqZ7kRX8dYMX+DreW2dzVk0d73YD1Pj0KRd4zgvzWdHEhZhxcb
         fbOD35UyhJnIs6wLxfRFKizBgyiYlhjUzZe1cRQB7SN9npl8EW/8hrCxcoTBzvyeDJqZ
         +F/2+7Ql+KElwiK0pJerQ8lO9EeNSMFRENMEsqXEtX+nhf2wjGhNgjRokFXSd0AujPrs
         HZrNCvIhaDwR9mVoDyu7gcufoLQ0TCFdHaV/Ha7IM5rs5FoWka80uWMuMDiZKGy9mSLY
         +EdA==
X-Forwarded-Encrypted: i=1; AJvYcCW110DntjLupNtvfptGB0u9tFcJAzkZKITT0DWk34BAf9JRXV2o2jAc+28Heh96aRBKIwUqkjZCToBIng==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCeqKPTx14DuzPGu7vfMv7aKJWsJBvp7EU93I0kkic15F32wV+
	JQZqTnkchEYolJoRVE3WrIFKGjR0NPwyXaT/iWqgpx3I8pXGPHcKRm3Q/oFJ4Vhd2Jc=
X-Gm-Gg: ATEYQzwBORAH3S6Hyv5g4qJZiuWBi1B1w4pUnOjCR/oWX+hTYO2iI/R584+qGwwHsoe
	r36l9HmvFm9lMtqXeYUQlJhuz6qyQe+EphRpCuoBA2lGBbBCzaBeeXAmI/ipQcUAyh+ktWoXItP
	JKHvp1C3wQpqTYEsPtGbCbbLWXjy4mESKnO2l6QL2Y/hr3YjEt7ZvuPNdTRuVZUHV7t/aROQwEO
	PYVeZ4iO2Uw96yiOv0keKn2SiQqikxPOwBUVsIRXanwY6dS9vHFd0R2XdJxUCqcoTKD6WpmzxD/
	j4HpRGXjpHE/vPXOax6fNXZYyTQ6DgFGIAlIFSTEuYexmypeXliG9zNpxbmcSbN/bjyhwlyixoY
	o+BpsicK/5ERNo6BLilpYBBhgf9rIpZOLzEa7vfCAZm4nS3jmOJx2//A9nNtOH1TM0Cy5uau1u3
	vjUyRGAgnHNNP8KeMjQAqk98dfQYD63XyjWys=
X-Received: by 2002:a05:690c:6e87:b0:798:1636:c330 with SMTP id 00721157ae682-79a1c18818bmr60490517b3.34.1773453670899;
        Fri, 13 Mar 2026 19:01:10 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917ee4a8esm58267877b3.32.2026.03.13.19.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 19:01:10 -0700 (PDT)
Message-ID: <47e9a3e0-c056-41e8-a175-442a3ba7e355@sifive.com>
Date: Fri, 13 Mar 2026 21:01:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] update riscv prctl for discovering V extension
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>, andybnac@gmail.com
Cc: alex@ghiti.fr, eric.lin@sifive.com, greentime.hu@sifive.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, nick.hu@sifive.com, nylon.chen@sifive.com,
 paul.walmsley@sifive.com, pjw@kernel.org, vincent.chen@sifive.com,
 yongxuan.wang@sifive.com, zong.li@sifive.com
References: <20260117233228.36088-1-andybnac@gmail.com>
 <20260313092012.64446-1-zihong.plct@isrc.iscas.ac.cn>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20260313092012.64446-1-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_190114_654104_36CCEBBF 
X-CRM114-Status: UNSURE (   9.98  )
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

Hi,

On 2026-03-13 4:19 AM, Yao Zihong wrote:
> It has been a while since the last activity on this thread,
> so I would like to gently ping for comments.

There was some off-list discussion about this around this time (anyone involved
please correct me, it has been several weeks), and my understanding of the
sentiment was that:

1) These sysctl and prctl() interfaces were introduced because adding vector
state to the signal frame was technically an ABI break, due to increasing the
minimum signal stack size. The prctl() provided an escape hatch for users to run
existing software that used a smaller signal stack size. Notably, this existing
software necessarily did not use RVV, because any C runtime that supported RVV
would have enforced a larger minimum signal stack size.

2) Using these interfaces for another reason is unsupported, and anyone doing so
gets to keep both pieces. Software that was aware of RVV at compile time is not
expected to ever run with the sysctl/prctl() disabled at runtime.

3) Therefore, hwprobe() is sufficient for detecting the presence of the various
vector extensions. The case where hwprobe() says RVV is available, but its usage
traps, is considered a configuration error.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
