Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B0EE94108
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+LQrwerObzXxVbU69J671TSiUFl86sf9kg1pQhK16I=; b=f6PxGrJkjn1QPZ
	DeKGPGEHZu6zJt5vIti7nzu8ZcEWUIYVbghkopp9KDNsNrPAI501Id+ZjHGAXnCg78XJSJc8qCATY
	/p8cLeeX6m8C9dOYw/+ihlEyZNcOtw/JB5o6pfQO95w+olbH2UJpEFBkVQX0Jc8DMZ4KH+I+zqjyh
	GPwkmkSzyHevBrIkWlBuv2CVi4Qg3TuufZxJESO9XajUAHD4lQzaGw2qAu+NmmD6u8G1YI/Z7wBjk
	Xi4t38j+RXC41Vrf33QqlIwYlnxPzF1sl9BZgUaWXhJa8GgJeJ6XLAnsTYPol3FkpN1s9Oqg0Ltll
	1LaLLOBKyw1JGBXUwjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNwO-00000004C3u-1pGU;
	Tue, 30 Dec 2025 00:50:24 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaNwJ-00000004C2b-3kRJ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 00:50:23 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8b1e54aefc5so847021385a.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 16:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767055819; x=1767660619; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GmB4IaDnBQbcN0DZ+rksSqBNuUUAz/TbWbwNTx7EuUk=;
        b=dWj3KAyl5FOtacOkAocWzDO2reByorDx1Ps72gppw9+95cTfEvmMQGzcVKQfsI6hvf
         GmpVKUFhi5edWUOHKHfuUQMZHUVFlFAf6XN6A4hjM+DGZpQfncf9UkKBgX/63iXauLsf
         S37nL/PwHEt6xmohH9MWXpxRiOYPLeR9uUc4Q91DOBx+hhrD8VLKzjgN8EHsE7sigtV6
         Gw3dMfII3/QZDlBIIHytZoPv/zpMhJcheov/m/X3Ye3w8+7ElVJr8bb+zglfRqDp3N8F
         RRWL9Skdgn5Ew8SIgW/gqHAuog60kROaZg46Lb3qOSwlWMtznL3+xGv0L+kK5ht5EucN
         I7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055819; x=1767660619;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmB4IaDnBQbcN0DZ+rksSqBNuUUAz/TbWbwNTx7EuUk=;
        b=dFaBlKVrqYeDvt8YjiKEnAL2Rz0iY9NYnOJvt6tyrfNufXes0VSA01RRYP7NmnKu7q
         wkiLUcug3AJTerSYsGYtzXUTwnUw5z/dcle+BdikyVo36lB92+hBmVqhXlZdSzHwELKq
         B1uKvWv1iYvbZzovt2LMoKfr0e8QMvyAES22SM76yHmRBfdrUaMqjXhUx+h/RYdaw1/B
         P8/+8m3tYcW/7EBV2k2HUCSsolULHVQJPYfQXTzETOVSdqZbMe6sWV/rdHhtsfqV/d0G
         jkaXvgZPNRXflupJWFHFGAaRo2mFqeKI0nW58KZwGjMeID8apcNvKkm07HaW7+E0umuY
         KTMw==
X-Forwarded-Encrypted: i=1; AJvYcCWsR1PdqCA00GA5FA/8hwinEgRbZOZsRkmViPILV7JaezKOJoYZsPs7WhTdy/Tr8fuKe4HVO62omZw/+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWj2gZe2iMkaiwx/FKzFmd7mbJLUsny+pQ5DIs+2W3u1rlSAXL
	xtAbSb6tZMJaDerf4jlChGxNW80VEoCe/4mLmlZP72l3vhM1800EvzKURWFKPoJfrcs=
X-Gm-Gg: AY/fxX7hTt/NkhZ8gQt9AjtLc3rgbkxzp2vOGrAWWKwO3lPdS6kX+wff4xOQk1I/qct
	Oev8bKpSEcCD3yHdixa5LwMVOxAlGSR90lnBx7Vc4O1KsPRCleHzc1vu324vtraORHGk3qUbzMg
	rw8i77PQSju7eZR+QbfyzH2JGEj6FNP9WqNLV+tBQibvSWADCl9VCjuxAlqj4FnTEmXahW8mJPU
	eThPoNrXD/b9V1FLlMdDVikom2/aldNlg6GCwgofE5qdOMtHSi8qTa/KFO8v69qReRD24luXhHD
	d1t51U42exPc6iKCzSDfZreKwQmDPRDvLspnyXOCnm+I5FsYC/RVat4DmZasw4TC1polzS7E0er
	kp9ONbtcbKDW9gFhAI91wOO4GzkxQqWqClpOwllD9/vT0oVjLcZJTU7odMFCucXarB+vLJ02+Pb
	XmScaw9Xgp2Ewl3l8lGHAuyzW5piuk8fhCAITMPkCxGajv4a/OsbE=
X-Google-Smtp-Source: AGHT+IEqx11qIx1fExQIVt8RthOfBqirsnQypMP24TGrYewLCr/1F0cNPLqYX2PYXTzLqSFzTJNaAQ==
X-Received: by 2002:a05:620a:2950:b0:8b2:f269:f8a1 with SMTP id af79cd13be357-8c08fabf8f5mr5613056285a.71.1767055818602;
        Mon, 29 Dec 2025 16:50:18 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096891558sm2482817485a.15.2025.12.29.16.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:50:18 -0800 (PST)
Message-ID: <546ab443-d0b1-4f21-856c-c74e84511d06@riscstar.com>
Date: Mon, 29 Dec 2025 18:50:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2 3/3] reset: spacemit: fix auxiliary device id
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
Content-Language: en-US
In-Reply-To: <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_165022_041949_CE7A2D6E 
X-CRM114-Status: GOOD (  13.18  )
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

On 12/26/25 12:55 AM, Yixun Lan wrote:
> Due to the auxiliary register procedure moved to ccu common module,
> the auxiliary device id need to be adjusted, otherwise reset driver
> will fail to probe.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   drivers/reset/reset-spacemit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> index e1272aff28f7..8922e14fa836 100644
> --- a/drivers/reset/reset-spacemit.c
> +++ b/drivers/reset/reset-spacemit.c
> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>   
>   #define K1_AUX_DEV_ID(_unit) \
>   	{ \
> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> +		.name = "spacemit_ccu." _K_RST(_unit), \
>   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>   	}

The above macro is named K1_AUX_DEV_ID().  Why don't you
define K3_AUX_DEV_ID(), which could use "k3" in its name?

Anyway, if you go this route I suggest you drop "K1_" from the
name of this macro.

					-Alex

>   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
