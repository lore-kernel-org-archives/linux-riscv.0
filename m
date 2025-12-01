Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6383D116F1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64kBN3rfWsCzSQtaGq3BVpHalnowzGeNmEe7+WHCMcI=; b=HSBkmAi0QvvHXi
	YF2rdKQz2UpI/4hQ4uimwV7Z0cv8Y65J8fArWgRN0zQfebqVbdsQUaEOgH/XCcs83TZP4U4ktw8v7
	4uIwzWfp9vwOpUt/uzNQQC5nh1HCoybxctqOCoKu0+puS+c+Py4Q0LDIOZuZ7J4p0lwLLSqiVlV7t
	44yoOJFjx7ayrOFwBP8W++UdFi/L4NiURc4L+F7PasAXIehtDzp0q42xTlBkcTT8Se02/AYibOdet
	QgWIUOdKsX+fwCIdHJYYRHD5UpsrouSDUzfEw7D4g7l7ySqpmYvoYRj7qdgQyIigqWu1m0VceVQml
	szvo/5vF2GVf6kYjjjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4Hd-000000042mK-0fnz;
	Mon, 01 Dec 2025 13:49:41 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4Ha-000000042lY-1KZE
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 13:49:39 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-94900d3ef9bso192483039f.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 05:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1764596977; x=1765201777; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LX4Z8WF4/u+atBhlBwzBrhy4vIEbhmKBOl8pVRCNa2E=;
        b=t0BWIpVsMy3EE/+OOjgbYqcrHu6PKRTE65SuRFen68Tv1H85J/Bl/vddsCajwWtEAO
         wzKiwLKC4526Nlau/bTse9UrSpWEoeoUrtgdav3nWbeOO1D4SuOLxDTib5NcsR3DOCDp
         9gPjf3BDDbp1zU/TcADQFYZl2actr6HzlHJjYt/DtDaM6wIsT03iy5FhOqqmUMs+tyAp
         N11RE67AQZv3InJ9UfFAzDWhFCMKlcj3DW+wUHdInr5m4fkv7v/mp+2vsXyrVLozBc/b
         6tHji+PHWIJprd73XRClBTVnzvOHKobNMQQhSaHiotA64Iw7mG0CGMloXSbyTZ4KMm1Z
         Ovrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596977; x=1765201777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LX4Z8WF4/u+atBhlBwzBrhy4vIEbhmKBOl8pVRCNa2E=;
        b=sIiSxiI+SWC+HVw4io42iDh3wVn6BKxnXCWc4IqgKL2vfQfhvBru2ssuMkmbvS7hyR
         Zur+LSj7OTJhoHp8tqm8FnFo2Pgsc8Nx+VGPGxOt7bZqsPNTnQKOFGua0MipDZdmcSls
         rFeKIlfmAxGCq2tSOaiIo+F/ZLgqr+dNZPMBIMizYui1JMObS9hX5SfvE3Bi42RbDoY4
         Da3KM+PIy7hOFdtIg+z26uMhETWGW4ZZAjrigTWK81RT5T6/V0WY237/iUGdsd/ma+md
         lr0xJRL4ujjIVT/7q05NcOOtxbjWH5m2DvibadX/ytaY/6iEbkfu6+DEdAVLYjJiAi/D
         fJKw==
X-Forwarded-Encrypted: i=1; AJvYcCX7Y4KG5PrnRF9QFCSAZZB/d0JhRCmwBkL8hHwF7BhHxC189fOlykLkksByNPYZCaIYgq79mSDhhlKZsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNnj6PvCuiesUg6vPto9Ix8sqBR8HEhq/1ZZbQsvLBVmZJG+BY
	DHnIxbl3Hq9mVD9RDGNbFi9NsiZ/eHU7UnFE6AeDGk0qRQbeI76Rc8V/FDzDy2UvcXw=
X-Gm-Gg: ASbGncswk8588e2ccpD8ve5B7NaK9X2HNVN0ArjN0bROmal6AoQnZfi7kuGujA9/0rh
	LGDAgQmFE8bxxlq9Wv9iqrMnLWvoOnNVfszza6ImmO+cPbkCTagi8h/640zhIfk5uDZQQYEAtCS
	aX8tM7UbxaeYJ0BNtDzIU4WbvUiAVQEbBT+bxsX4E0FbaKmgW/vGr+iOMBesn0hqT4+/td0tihb
	yHcmgPDm91rzQFZI5XlV9eB2biyG9d6oBCfOfiJIc51oFz83cF8jD6biG3DGMfnhbZWG0rqTEwZ
	+XJlPGViuFa+aKQfTPEpGutk06D5SbwoywZjgRCA2QPoIOP9AMYSPkUZs5ghd9oClY1Dzsr1I5n
	ThENRtWWStBnxF0UDIyk9AJo8ze35h4Le1vd+oYJhT4k9adMWAY2ZtP0VLISepPJllZ6zf/+CpY
	elt7Gfyzf+jSJzA1JiTioptcsrFbMaSLtPNUDkAy0ElreWuyoFXA==
X-Google-Smtp-Source: AGHT+IGpW4lDtcEJPQ43JCM3nfwACbMBWQNMoO/13AWgIOHeyQlkqEJM34cP/OgXfBBv5XVqjVJ6NA==
X-Received: by 2002:a05:6602:6411:b0:948:a6b9:3d08 with SMTP id ca18e2360f4ac-949488ae3b6mr3137565939f.3.1764596976940;
        Mon, 01 Dec 2025 05:49:36 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-9498fbee405sm609850439f.8.2025.12.01.05.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:49:36 -0800 (PST)
Message-ID: <bd9680a1-5b91-4e80-890b-8331ce8ef302@riscstar.com>
Date: Mon, 1 Dec 2025 07:49:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] phy: spacemit: Introduce PCIe/combo PHY
To: Neil Armstrong <neil.armstrong@linaro.org>, vkoul@kernel.org,
 kishon@kernel.org
Cc: p.zabel@pengutronix.de, dlan@gentoo.org, aurelien@aurel32.net,
 guodong@riscstar.com, linux-phy@lists.infradead.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Junzhong Pan <panjunzhong@linux.spacemit.com>
References: <20251113214540.2623070-1-elder@riscstar.com>
 <20251113214540.2623070-5-elder@riscstar.com>
 <ba532f8d-a452-40e5-af46-b58b89f70a92@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ba532f8d-a452-40e5-af46-b58b89f70a92@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_054938_591171_10C8C459 
X-CRM114-Status: UNSURE (   5.30  )
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

On 11/18/25 2:56 AM, Neil Armstrong wrote:
> 
> Anyway, no big comment on the code or the API usage, all looks good:
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Vinod, I never saw any indication this would be merged
(and the bindings in patches 1 and 2).  Was November 18
too late for the 6.18 release?

Should I expect someone else to take this PHY driver?

Thanks.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
