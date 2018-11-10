Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF9FC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 08:35:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4910C2081C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 08:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lPOtN00R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4910C2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=packi.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yA1fNBmk/G9zYQiZ5cg9J7IwtprsQuzopVV1WjAFvoc=; b=lPOtN00R+vVeZOqkz/8M8l25dk
	MNV6pxzA4Z5g3VgsYLL7OUw0ftmYc7PLajg3OLKZSksAKq/v1LMrOWCEcL6A3FMPTPztv+mWilZ6o
	lZTUT8ExxCSYefKajX2LNvWNXFX8qYiJWUwhExKFyLd7Z3z0u8rHTK0e7bFVhGcU13R8FWOL74dUQ
	RQOUzmw1XsOXIq3IUr7EQDZYCaNqdcwI+EUAWEuTbli1VC3T+ms959FtP1SQkemfUoKETIdUANmm7
	WhPBtYyLFfHD4Wsh1krG45xl78tEe2zXk3ZH17sZBKbiseptttBAUbEoEvpRLRjuVupT16Po6MT+c
	tt+wXAag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLOjt-0000PR-6F; Sat, 10 Nov 2018 08:35:33 +0000
Received: from mail.binarylogic.ch ([2a01:4f8:222:24c1::ff02])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLOjp-0000No-DO
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 08:35:31 +0000
Received: from [IPv6:2001:8e0:2002:7300:11c7:1b28:a349:1c6c] (unknown
 [IPv6:2001:8e0:2002:7300:11c7:1b28:a349:1c6c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.binarylogic.ch (Postfix) with ESMTPSA id AD4B4DF386;
 Sat, 10 Nov 2018 09:35:15 +0100 (CET)
Subject: Re: [PATCH] riscv: add S and U modes to ISA string
To: David Abdurachmanov <david.abdurachmanov@gmail.com>, palmer@sifive.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20181110064543.12411-1-david.abdurachmanov@gmail.com>
From: Patrick Staehlin <me@packi.ch>
Openpgp: preference=signencrypt
Autocrypt: addr=me@packi.ch; prefer-encrypt=mutual; keydata=
 xsBNBFIh6GYBCADTiConXKy4X5gl7xi6gaNfLvvl6mZ+GVAhlVQtMgpkkO7D8+YQuBiuYAFj
 6btXXI5Y7hrbHkokyknGLFUcMEXCI/L2+W8ta+2iCpVv++oLzD6h0FxiabKBOTdA60upmBdr
 MBMdG8jBfm3D4gE/2grhvLL7SmHMEtF2F4lxykwon6cdvuDBL5Jkkvv0/YROC4QIGHFIOUVP
 GJxS1YWVi4pCVhju9fsrXh2C9GEpKVL53t3ixj7VpaogwfTKkCweb7mSKmUOHnJE6i9pvBNg
 x77WSnefzbz4yQFl0dfcD7mCbPegWXQGs1gNaJLhxV+i+FOXMibFZfF4p9ieTYBube0VABEB
 AAHNHlBhdHJpY2sgU3TDpGhsaW4gPG1lQHBhY2tpLmNoPsLAlQQTAQoAPwIbIwYLCQgHAwIG
 FQgCCQoLBBYCAwECHgECF4AWIQR9yIKJQW2d0IKUGDgLDiHrZr8WEwUCW1AxJQUJCw98PwAK
 CRALDiHrZr8WE5NAB/449UGo8HvWL5JY2oo1c9sUz28MRXlkvVHVrMwB45nhM+WdMcQwTWV7
 SONscsvJ4aDVDo+7Tq0hrdMfo97jciA1J5x+p5MVNhNJYXZ1xxWqL8xoxof/4aUQ1lMbLAQj
 ODxff8hol/8p9RdO8Zkhh+IeIi7lQUCdKCyP3XpC58QneVwvsVhPI85R2+lrWtVpkwxJWE/o
 0PCJUFHMEE08UxSg2APuywTv0m14+UCFl8zL65k/MW8RWrSGaTz+ez4MOaAxVBLZjM5SVMKa
 j3wYcEHaW0IUd+0jnKoGzssjrIA0Ezb7gZV43TXgHB5k7UWx/HrJqSATOWFo/HwpAaq3X+H9
 zsBNBFIh6GYBCAC3KYJQ2NKm1P0f9Cywy5iXUPoPoHiMMZQQtU3Guk9KDcukF3sLJc73ByRL
 /63hkf310DSdEPgETWpfN+6piQCTDkdoNcE33OdOvsLaHHGXDKYuddC1orzxkqb5wGCyEKX3
 Fe7cO6IHtRwhS9xO02mnclGoqZ+VQ0rojS9Ve7HST7WptZab/MTJhVpuaWQrZfrCRZ6LQvYT
 p9JozxZv0Pgf6bntVqMPhMe/dZdaL/ti+kBk86YyemKxyWK5Q5rRMxS8qDEuvJ7lc80y0K2B
 bjiin8NS25xZ5p30mHLMYvOLj0kSH0oGQszRn6e1z+KNloICk7A+DykOuJWjcSAyxDFdABEB
 AAHCwHwEGAEKACYCGwwWIQR9yIKJQW2d0IKUGDgLDiHrZr8WEwUCW1AxJQUJCw98PwAKCRAL
 DiHrZr8WE+7xB/9I0MhfuJZkVy42ApQpRJljHg6bRlt8kfbj31t/9/qG5oy1DU6DtsZQjChV
 JUrowoxlMecLhIHHkwqrX9xcz+YxZTWp5qbalZ+au1JxzjJPDIyeImx0Emg41NVzcxNrTfQD
 +Vu7sIG57U8aIltJPIvg1KvAg6LA2XAM2iz4JgRKFtxPt6R5uFuwVy5AJGOKYLtBVDIMCXeh
 QblQSwszFmlErg1xDqp2ynUvgpq67x8ushAKyOnLfb/T5CFBW0Xg2igZYx+UQAOduZfi3NQi
 BnOM4Yr7WWVPQ5GCckYX0KxVBbxm4PgwQyPWZ9Ya6T4UKJNiXAIhDWBNV+CsOTxPFtI5
Message-ID: <7958aa50-8808-e909-753c-e232b3d1f84e@packi.ch>
Date: Sat, 10 Nov 2018 09:35:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181110064543.12411-1-david.abdurachmanov@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_003529_607780_405FA7A0 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110083515.a6WE9tGGAv8uCLUir7G3hPQZVG8AO29zC60tcaBUBgg@z>

On 10.11.18 07:45, David Abdurachmanov wrote:
> 
> The patch adds the missing S and U modes.

This is the same patch I submitted earlier (see v2 here [1], based on
Palmer's feedback). Palmer stated that the "S" extension should not be
exposed to usermode.

Since two people arrived at the same solution, I wonder if the
supervisor mode should really be hidden from userspace, as it's about
the CPU information, not about the environment the calling code is
running as.

[1] https://lkml.org/lkml/2018/11/10/96

Patrick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
