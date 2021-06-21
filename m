Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1122FC4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 13:56:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF7B660232
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 13:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF7B660232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nZwZHzTdcHhtvi6Ju1RyvVCOxBs9NIuqr2Xd5kiJQ/Q=; b=Dyz4mhW4XpF7f3TKBnPO9x+e0i
	o84/MBKVBhyxZuLOYXKPV6VB+of3LZjaeOcT6W1hBhU2NTDwcLc6qqLfoKN/xot/HPxfIHBFZEnTJ
	f/jmAuzdsXXxrbif23fpoPxjKo80IcAKMbBpiYX2CJRjWN9PG5I6zK87pDDWTEkaAsZecc282YNMP
	Yxh9MzE3wxmr28BgHn3//e64g7jkBEvq2p/wu2mkzvKpxfoDMnLK3eNh2Hcaw9aBD+gSn+KTwk4DP
	ywJ1iezxPFBv0Sg/4N3BWc7QvBbcKIcTPALknVo57OX5DyBgNRm26amYPR5MrmfsjyGnEMw3/HQg3
	2/vkFZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvKP5-003e8H-Bw; Mon, 21 Jun 2021 13:55:55 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvKP3-003e7P-5j
 for linux-riscv@lists.infradead.org; Mon, 21 Jun 2021 13:55:54 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso30377pjp.2
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jun 2021 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o9p8RT2f/7XUjthgkleACKKBqWg4rXyZN+ioEdrcfpc=;
 b=ut1usfHc2xYgvfkU0LEGtCoLXNP10NyUOIIz5hskW7nTeJWxS24dyt2quu/ZImSFwu
 NaRhKP02a6Agz3T2vxgGqjLacHfedIW1Cbo6WpsXBfmdj4awNa2t2nBf4NCu1QEJ+ZND
 83lPz3fV4ftdL2Jdb8uyR0uDgoI9QP6DmkonDq0/189kd0a2JaLugU3HtU1EwiG0Qkyx
 fh6ux0UeQDo5bJRTrK9z2YR1r21axVKYDaTG9+Rm7eiq+lnpCLBiWZcyCB8wpW9bZw/U
 QIKyZwM99m5uSrnFm9PCOt1IZnqHignF+zUKYRzU1pnIcZxq2xBQzUVQVQzMgNniNq/K
 pX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o9p8RT2f/7XUjthgkleACKKBqWg4rXyZN+ioEdrcfpc=;
 b=YXXWuy75vtSM7XDYiG8CsQ/Kpx39aaOxIRh3iVs64Jfl6JuEBYIh5pw+NSgUSll64A
 u0dKXztq7JT2AyXkFgEdlEXmZ5heXwfAgAdQ73VET3FvTce/tRh2zL5ek6VxDJ/+wqQo
 Pbi6CJ2ASy5yo6pzAcbYKRtvmXqDUOcQ4MEgsNKJkBT6z9MbvgHjGwRT1Blp7pfbV/+P
 j6xO9cSabNgu1gRZsMx0sh3ENI8li0u0ihk5bNbI2p5c4v4nm/rOHnZjPNrgIwrZhJpt
 j9WqQW9MjBYjv8Lp4gYJhs5UYR63zq6n47pyNUeZIcxLyqEyEb6UbKsZ6ePP2EiteEQ+
 9vKg==
X-Gm-Message-State: AOAM531ts5J0o+yDF9i6eRjeicNYPW0ryQH5jvxhOORMHv/mPj6IbLXE
 8vv4Y8Bfs3CvQqIMwpNsA34=
X-Google-Smtp-Source: ABdhPJxc1cAtv4pgRzzOtG/P5Y94ypdmp/68e3bc9ZgsIESJifSz8S0+GCpkTYi7ml1HfLA+/5idRw==
X-Received: by 2002:a17:902:f54c:b029:124:109f:fd6e with SMTP id
 h12-20020a170902f54cb0290124109ffd6emr7336829plf.67.1624283752261; 
 Mon, 21 Jun 2021 06:55:52 -0700 (PDT)
Received: from [192.168.1.123] (163.128.178.217.shared.user.transix.jp.
 [217.178.128.163])
 by smtp.gmail.com with ESMTPSA id v6sm17817995pgk.33.2021.06.21.06.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 06:55:51 -0700 (PDT)
Cc: akira.tsukamoto@gmail.com
Subject: Re: [PATCH 1/5] riscv: __asm_to/copy_from_user: delete existing code
To: David Laight <David.Laight@ACULAB.COM>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
 <1b454390-cee5-a414-509b-3adb25ec0330@gmail.com>
 <fc86aa3f50a24a30891bf032aef591cf@AcuMS.aculab.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <1b96e0c6-bbfa-8ef1-c227-f4f5d02d0072@gmail.com>
Date: Mon, 21 Jun 2021 22:55:49 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fc86aa3f50a24a30891bf032aef591cf@AcuMS.aculab.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_065553_288404_7191BE93 
X-CRM114-Status: UNSURE (   9.54  )
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

On 6/21/2021 8:45 PM, David Laight wrote:
> From: Akira Tsukamoto
>> Sent: 19 June 2021 12:35
>>
>> This is to make the diff easier to read, since the diff on
>> assembler is horrible to read.
> 
> You can't do that, it breaks bisection.

I know, it is intentional, I explained it on the other thread 
with Ben Dooks.
I just focusing make it easier to be understood of what the
code does right now.

Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
