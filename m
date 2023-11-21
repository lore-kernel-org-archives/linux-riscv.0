Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B53FC61D97
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 22:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TZR4fp7+NrhYCwWrzUFkmsbGpf9s8ybDfy9UH8Voyw=; b=ZpehOx/dyZg77a
	E2fi5dT/7v3GlIKs1cCl1y6alxlmWtYUpEtZL7OJq9vGy9VyaPiKt2WRcAge4Eecd1RpmKXE9EBn3
	Fgnf6865HYvu84Rkf/bGjlm1/BR11BnTnA//I4Sum2Ln3h4Az0obdTVeIA2DM+DmGDYB9NjRheKCu
	3XnVuQTkKn7D4KX+bVK8G3oe9uB89PNS1Oxy57lxu/R7r1T7IMzxX0NA8z0wz+VitjF7UcweT7ZIK
	kBfxuior/9ru1vHgFvhm4WCNkbe7U+Ivq+o5BxtegrH74Htc8BJnbzadmiqB8mCUdWLZc5IyYxUdy
	wT49j1GF16MHtdPXA7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Z74-000AaS-0w;
	Tue, 21 Nov 2023 22:20:58 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Z72-000AZT-0j
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 22:20:57 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-35937f2fadeso20704585ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 14:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700605255; x=1701210055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Z8WXu/fiJNNXFNteHhgEV4qN2i0FU5wTM5NTjIv1Ec=;
        b=AYyBeOHiwwnsda4CdLuX105XSv+UPGVcop1ir4ArypL0z5WyrQP1mU92hPYAI9szvW
         p5AqJEOSPxhjIeTBbQValPPoGFMOV7dw2et6YUKKnRCHJRtIr6wKdB3PPY8gopcRtjQr
         QuoKhzITIGFaiqkj4/Th/PBCBcFq5Fwtwdm3yAzY+YaJbKVW0LhQq64gUf9Z2Sx3hWM1
         38L3L7c+bFDvfbzDZE812gOqLAw390XbK4NYIhk3/VBMpo5VD/Dn5jwZt9n9BCp/oEVy
         2Kq0A+fXFwb6wbJfh1iTtaowrUXSovrQ97N5yVXMqn4PIqIW6JeAehICMhSRj+/XLvIi
         OXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700605255; x=1701210055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Z8WXu/fiJNNXFNteHhgEV4qN2i0FU5wTM5NTjIv1Ec=;
        b=RI3Lti6+YPGoPBcA+uAUzQbNRQVDnlfMIZfoqZF8iHFQSFHlPac9F5I21amMXkneGQ
         mpPe6id6l64aN5oVGLZOQuQjE+igLrfvux0pYEsDl1fS1fx9Zy6OdWqiGhGyNybb77gR
         hnIOGn4StJ4hjYmBvo+0AjwVGe3QZqFRoJe/mZEccTWuhuUzpqoPjVSakkkn2rvMq6aN
         Sy6XynJd372opup5tpPx48KHlf6orQch8x+/9fXo8jUBRFWoEdzOgdiHQ//95eRTG2Jz
         rIo/uIgUiDSve50TJfVIMEZXHJshrT3pdjguGiZPgAzY3NHv8UIEjboVHlkNJTk5CDm9
         GoiQ==
X-Gm-Message-State: AOJu0Yw+zLsJBcBGqx7E92lKkiPy2NmW+5lQNVDno4oLt1+oaog9J4Er
	+fZ4IlWBBIy85aHbDwDHjs31Xw==
X-Google-Smtp-Source: AGHT+IHnEzmXNMqVmbAle3y5pw8fBSNlcSrzJYfQGkwCwmsEPf93tuSlpeOlgv47mg2chlhnMyjDeQ==
X-Received: by 2002:a05:6e02:2146:b0:359:50f2:88b with SMTP id d6-20020a056e02214600b0035950f2088bmr407808ilv.11.1700605255051;
        Tue, 21 Nov 2023 14:20:55 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:9465:402f:4b0a:1116? ([2605:a601:adae:4500:9465:402f:4b0a:1116])
        by smtp.gmail.com with ESMTPSA id bc23-20020a056e02009700b0035742971dd3sm3505623ilb.16.2023.11.21.14.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 14:20:54 -0800 (PST)
Message-ID: <ddb9d0cb-5f78-4242-b431-878d0372884b@sifive.com>
Date: Tue, 21 Nov 2023 16:20:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: select ARCH_HAS_FAST_MULTIPLIER
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231121144340.3492-1-jszhang@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231121144340.3492-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_142056_338257_08A12B31 
X-CRM114-Status: GOOD (  12.54  )
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

On 2023-11-21 8:43 AM, Jisheng Zhang wrote:
> Currently, riscv linux requires at least IMA, so all platforms have a
> multiplier. And I assume the 'mul' efficiency is comparable or better
> than a sequence of five or so register-dependent arithmetic
> instructions. Select ARCH_HAS_FAST_MULTIPLIER to get slightly nicer
> codegen. Refer to commit f9b4192923fa ("[PATCH] bitops: hweight()
> speedup") for more details.
> 
> In a simple benchmark test calling hweight64() in a loop, it got:
> about 14% preformance improvement on JH7110, tested on Milkv Mars.

typo: performance

> about 23% performance improvement on TH1520 and SG2042, tested on
> Sipeed LPI4A and SG2042 platform.
> 
> a slight performance drop on CV1800B, tested on milkv duo. Among all
> riscv platforms in my hands, this is the only one which sees a slight
> performance drop. It means the 'mul' isn't quick enough. However, the
> situation exists on x86 too, for example, P4 doesn't have fast
> integer multiplies as said in the above commit, x86 also selects
> ARCH_HAS_FAST_MULTIPLIER. So let's select ARCH_HAS_FAST_MULTIPLIER
> which can benefit almost riscv platforms.

On Unmatched: 20% speedup for __sw_hweight32 and 30% speedup for __sw_hweight64.
On D1: 8% speedup for __sw_hweight32 and 8% slowdown for __sw_hweight64.

So overall still an improvement.

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
