Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DD7CA5FD2
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoXWU383cgCLWyL3XazQdcaEFmUYHoINjm7DSOupBuo=; b=RfCZy5RchiTWRk
	++ZoK2aMVSEeK7uDFaE7pu/a2MSBjrQmIPtOerhD57PRbDwuRs65yszyMv6oO50I08Lru4bj36It8
	2KF8XTzt8Rc0jEwmiYPwA7ypN/TGTbDe2bKLFxtKp9Fg+ZtJLDr00+bUNZbJofnj98GKBW6zqluhL
	Y5h5QsMptaas9+hSCgJf1tfeq3XrQlWnueFkbVDJNbrPJe+N3pWvXARUyhfS/zhRv3f8Erl78QN3D
	M7FCL/U+MP8YGF4QsoaP73j1oLoHzFrBCDy3V2ECL1VZXzOngkLgiTeTpFBbOw68yW1LatViKQJ7e
	ev7kdpN6j43uJjjqkf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCK5q-00000009nEd-3Bbn;
	Thu, 01 Oct 2026 16:57:14 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCK5o-00000009nCR-0d0I
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 16:57:13 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e79a408deso42865455e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873830; x=1791478630; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYoMqQ8ZvtqawNNIbF0bmVuGXHmouMQegpP9uov8hrk=;
        b=l8h8TYmZCgDOIE42z/oqXdjv6By+ZjAVhKWYbF1om6NgyJz35IEOijotUtn8H2WPPe
         zA+9pKRz3ke59XeYVPHbCQ3IwQARFfEsk3Nklw9iIOZ8MJv/G4hyANyFGLor5ODmmsI+
         cc8yc+IhMYCI9ySdiRxSz0WkPHysQ4wqDXSvwXKWS3yHC3SphLsL+pWxHqpeeHAUytCW
         OqOe1eEqURRxH4yokNmvgMjse9u1UCn/2f6Z31qgHmJ+hLNMUOJwahq0FTXUVP1PWXO0
         S7EVo83sBhJTf0zr45dHbpThq5Qob3xeWiLgVsCC6o9nyGZ075ap3O8V0mXVpgBMUjvl
         kJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873830; x=1791478630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AYoMqQ8ZvtqawNNIbF0bmVuGXHmouMQegpP9uov8hrk=;
        b=J2tNgNIu1wXJSbgfFSqSc1UCjkwIjYmNezsCDT0dssrl/ozIfMlKNSJlwuTleWv7U4
         bQvhTngkRO6bxUayg2DDcQ/mIqKxVkfSdZ6+W1UI0hQGy/GdP0zWn/R4EiEKjps2rbwt
         Axrh328Yh7/4dLBHBFQ5G+RJar6xubbMXVWqzf5WAG3D0Ni37qMOtd/fMylMEPoOxCxv
         r5wc9rp+jo2/Vi+z7oUS7DQKizuPef/1OQPLgg3UTvdvuUSGt3URTkhYPUSoK+jy5DEW
         ggVw5QlYj5mfvudNJ7gSbt5NHkhpe8kMwNGlptbUq2/0DAGi7pcOCe/HYZzpcVorst/8
         vidg==
X-Forwarded-Encrypted: i=1; AKwUvBxhhD1tcL1K0aklUILpAt2DlCrdNmYoPH+San0T/w2HUBUisR/kvwvzxdJbECMasHuhaJInK4/zpCEtnQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mgbkFA0l8h4WfVnnqxuhsK0+0nKP06ZtE9Z28qkE1HB6X7xey3
	ZMWuYnG3IiKH3B1WSAEBgifPkfvg1b5M7rcTOZHlcyDq3Ker6e7VxYCW
X-Gm-Gg: AYBFou1GKGk/K/0OkZdVGneB1uqQRM7SOaHsVWzsMw0Ib7A2cNdwMY9/k3k9NRWQWfy
	N/ABMG5ZbSUAAuJ3S0BfkSJL1Olw2iZKDa+hXCDugYFTDzYp68pRx7vPwLFyqUlNiZ8pkypNZXr
	SmouX+64hWiLH3G4TJrxTG1zm2qDeWt6aGS13VHkuzyLntOjhYHfwj9TADaY2Bh3lMwYgVqiRAm
	XGuPIGeLZ0D5DkTjkEZhDyqwielqyjiRcriv3xi3vC+jT9UGi5Q5FHZcilH1qNhMoU3kFD/yGbD
	lcYfykmkHbISk+uAO27qk+O5ggRMmUYHdXR4zXVVoeYHFLs3ykQql9T3bUktw0NY/xu2ocMkOdx
	hIurlA10GUH50LP2vtZTmUEQUFefp16mfM3HdsVjKmQHrq6jyW7qlIXA9MRiuipzHUYRqxCm7LL
	kbkY5vrUrSR+l0UGRTSqaYtcceCDSqooi/7n6SRnfzWi3GtX1f17FRKtKbKlxlbF5SuuWYI80=
X-Received: by 2002:a05:600c:6995:b0:4a0:159b:d283 with SMTP id 5b1f17b1804b1-4a0275857a7mr3761895e9.30.1790873830150;
        Thu, 01 Oct 2026 09:57:10 -0700 (PDT)
Received: from [10.2.0.2] ([159.26.109.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027906a11sm2044415e9.12.2026.10.01.09.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:57:09 -0700 (PDT)
Message-ID: <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>
Date: Thu, 1 Oct 2026 18:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
To: Hiago De Franco <hfranco@baylibre.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>,
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com> <ar6E4bQAKonCW3st@hiagonb>
Content-Language: en-GB
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <ar6E4bQAKonCW3st@hiagonb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_095712_202242_4887E357 
X-CRM114-Status: GOOD (  14.10  )
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

Hi Hiago,

On 01.10.26 18:08, Hiago De Franco wrote:
> Hi Andrei,
> 
> On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
>> Hi Hiago,
>>
>> Please take a look at the patch [1] and the discussion.
> 
> Thanks for letting me know, I missed this patch. Do you happen to know
> if any overlay was sent? I was not able to find one.

I haven't seen it, so I guess no.

> If none was sent, I am happy to send one. Sorry for all the noise here.
>>>> Thank you!
>>
>> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
>>
>> Best regards,
>> Andrei Lalaev
> 
> Best regards,


-- 
Best regards,
Andrei Lalaev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
