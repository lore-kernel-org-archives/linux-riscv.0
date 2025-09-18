Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49C7CAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 15:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SMSGwNBSyQnH9twjndbx3jSnXeWU+Zmn+4ZYAN+5Hg=; b=TioqU14x/jaymJ
	iWdpAjpOw/KMwBdUMm6BSERGF7mKBiYWEXbRfqXu2r+nTEdwphKnUbkcMH3CNPXuiRJs11c6O/egp
	rc2jpm1Tv4I1Mq1UTOGAsYW0hHzV3VjtUWKGngE7CyTUWB/zgobOfUH92yTnyXnv/MvD+ZHNLx9Rd
	6vpunlrr1BTDxxTeMtdju0fNXRowXG289ctb06aHgGXq2MkD/VsJN54JCeDkXlbRDv18cKAePJnCN
	x36R2l3jNRgv1nn1goVZj6xe+Sa7q1K3bNLmvLgiYvrOp/ooMFU3dJqhg1rK7kByUuiZVojIXIZ5w
	cqh7ZmbE7XsfKOIaSStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGo1-00000000SxI-16Cr;
	Thu, 18 Sep 2025 15:44:21 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGnz-00000000Swe-0s0J
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 15:44:20 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-88f2740619bso36340739f.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758210258; x=1758815058; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYhrldrOGtsDoKDXkPai5Tm2eHb8T6uZE7LbE34+y/M=;
        b=cfcyNtTK/X7nw2cFKO1bIa6Ls10p3exvBbe5VJn1tpjCZ+iG93hnxdxo5tAtAQiKKD
         7N0eLgwq0zgkNX1JQ2ZUzLhJX90XZmqSGbwItjHMMh5yRe6J7kyAfYGQJmfzpjceZbvh
         vBg6onhpqmf1WeZemOLt6Nt6NPjNBqr3/61iLBA5mODmQ3+OSyTcX51UrWSUVPQGR3zg
         l7acqIMrxmdP5XHSj5PJFHPQYourdGt3/ZwSPSB2yBrpK5Zd466nbIfabzH+2cWQZDrd
         NQQZdZ9WM4nohHHzPJlkBDKq7QiKOHQitU+ea0rLrssN6F6ypRFiYrlSi/yv/vMOnZCL
         IFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210258; x=1758815058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYhrldrOGtsDoKDXkPai5Tm2eHb8T6uZE7LbE34+y/M=;
        b=Slyjs6q6tNfRLlRPX/oWQfCtzIkcYB4CUdfjwbR3JwzUilxg5AgHgZMzJyJp5yIFS9
         DYIUJh+vIFeRDiFOkspzxoWxuLl9RUuHlSgc0x3ZD8s7do0fluwCwlkSoz3IuIicP3EI
         1JA77eCiIwLRbxDbnzXZtQJtqxbgspG2xQR+B2EmdaoI687wGhbKbd8ouNYLIc+UO3MM
         goMKaHsXR7m7k/F51OY7pMpDRShXc6peQCtvFTAxAEi5lPIMSYTHoR5IzVIqyBhrlQqz
         4AGSQx1Xs0YRv5szYLQkSKM2tgRgImSwFQunEykEg1b3ixoncEOtxTCY4Pf8mYZznZKA
         clYA==
X-Forwarded-Encrypted: i=1; AJvYcCX9OI9uDvzsK3i+2aXXlPRzpTV2KyFne+bKu6HydGg99kP9JlzxWYjXzpRFm7sk1XyXgGgJd/rfq1hB1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH89mIiAXEsCret9l3ClApOHjddPwnnWsSJP5m5aetioeEm3UX
	oJ0vbff4N9eGyWFDIaRugeBQjIOiL+3PmY5qfZsIpH7yL+XOUjnJTcFdgPzsl/sgusw=
X-Gm-Gg: ASbGnculrk4HfbTyiVBmUXFbrpxV3HfnsyaYKDjf3wGrh8piK92whEnkCecFb8Rbs3S
	AvfQ5srHj+aTKAxOuZE3/NzdaJX8/ZB3MmrSJUpPrV4zkovmNX/kluOfFoCjLS92d/64BOpiOq4
	BbvMTbw7zDF8MhKT2RJE4XteMmZHrtRnX9+g6ClfTUvt2L4qwMM7adIdh6opgNI32xMvFPxTVqL
	Vqo/yK3Ga4K51dxp6hGEc9xsakt93xjLE9GsWDO7fILwXl/Dw4VE8wcgdWVpUCeycctL9uaXIZ9
	95g8qyz+ywZM7nfhmA3PDit6G77uv4Le3o7L3pANePjuuW8W+LE8Vj0wP7mdmlMcl5HR2476XXH
	GZXtyNB7HrVk6/MxGNh9z4BrlkV0Bi/R8Lngn4I5sRPqvIbLtLh6eM7+b5ZtK0Q4Dma9XBVnCXE
	NozoUMtw==
X-Google-Smtp-Source: AGHT+IHyY949yC9PkpeT/QOBqAaxoqc0DHrnN3CUC5h5A0iVJ6RUW339AkYSX5xvq1CVEEDiEGOZ/w==
X-Received: by 2002:a05:6602:2c95:b0:887:50ab:5c8c with SMTP id ca18e2360f4ac-89d28b42cb0mr960281739f.12.1758210251747;
        Thu, 18 Sep 2025 08:44:11 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d560d3993sm1050465173.67.2025.09.18.08.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:44:11 -0700 (PDT)
Message-ID: <057f2f54-c370-455c-95ca-83f97d884f3f@riscstar.com>
Date: Thu, 18 Sep 2025 10:44:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
 <20250918124120-GYA1273705@gentoo.org>
 <034cecd3-c168-4c8d-9ad5-10cc1853894b@riscstar.com>
 <20250918143928-GYB1274501@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918143928-GYB1274501@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_084419_256297_8CEA5958 
X-CRM114-Status: GOOD (  10.55  )
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

On 9/18/25 9:39 AM, Yixun Lan wrote:
>>>> +	void *bufp = io->buf ? : dummy;
>>> simply s/bufp/buf/, embed pointer info into variable doesn't really help
>>> let's leave compiler to check
>> I called it "buf" originally and changed it to "bufp" because it
>> actually advances through the buffer (either the one in the IO
>> structure or the dummy buffer) in the loop.
>>
>> I don't understand your comment about the compiler.
>>
> for the compiler to check the type.. because people could even name it as
> 	u32 bufp;

OK now I see what you're saying.  To me, "bufp" as a pointer
that moves through a buffer; it would normally be initialized
to "buf".  Where used, "buf" doesn't change (points to the
start of the buffer), while "bufp" does.

It is an established convention, so at least to me it's carries
that meaning.  I am *not* using the "p" to indicate it's a
pointer.

I looked around for some examples, and there aren't a ton of
them, but here are a few:
   setup_dma_scatter()
   __cmdline_find_option()
   tmc_etb_dump_hw()
   dnet_start_xmit()

I'm planning to keep it "bufp".

					-Alex




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
