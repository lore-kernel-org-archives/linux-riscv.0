Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1504BCD11DF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 22:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEgd/Yb9H6LBB6DRbUO/NYGQRc8XSh3KpI0xJw6anXg=; b=ncKBWFT6U+mSdSnE6JvyPYDSTl
	BBdJlwcjDdb+XhEkA9Eo77y0sLiUhnzY502dmMql2RL8DrP6ZfZ/14Dw2cUtgsLNiQe2gEmE4MAiM
	lOgWH0ejyzWjny/dBRSgMvfRbW6IgvT776+5PnReeL12F8itrljTSWDvSbRD7cBQKRJ18V1WOcLhN
	cApotEY+kZzy6/0zH6R4p4XvIfdoJTK1d5oKDXYc1Ebt7jA2W+4uKNvNWzwQEYPavVjJ4gXH4Fal1
	qsOHUHrWb0ZEzSiIK7GYW3H1l5SC7roPKjrkK8Tb8zQj89Y7IhCChn8fJMpFQ9gJgRUoTCSfg3/V7
	KwkZ6S5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpEwx-00000006ckb-46Zm;
	Tue, 26 Mar 2024 22:07:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpEwu-00000006cjr-1wXN
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 22:07:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e0edd0340fso11783565ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 15:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711490833; x=1712095633; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3fmf1adB2/rvktIlF/K8tyaOGpYk92mIufdpsSn9O0=;
        b=BqF9eM/kfvAwUMmpqwYdVQgNhHSG7j+xVBHzkK5VCbRbReT2Scm6pm4uD0uvfvvFyz
         zo2aZrvCsor1BFSqVo6OCCH0iUIMXhv/2nZh4SvOkdF3+XdPwAts2aqaeyDfzErL5Ghh
         yqGln2DetzVrKgFpoYcFryFq+UmU/2OQ7edqmrG5ci+BJbOF3r+9z1Ys6vGXSE2LNIx9
         UiPhBhBJHzFiG3kSnjLrch3SD5h7zYDz1MUybJvJrwgF9HbfQYHxKYYm+dxJuDcmdd3i
         ljQ5BgwRRRWJTunomnhCGuICYpCXVi19eQ3aNRPy5Bc02wWHVXzzvrVQXwiNHlKkXgK9
         0h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711490833; x=1712095633;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3fmf1adB2/rvktIlF/K8tyaOGpYk92mIufdpsSn9O0=;
        b=m1Ij53DOdw9CSDrUSN/iMyhcPnsdZUziX61uqSSxEkSdBfOcCUjZnvJ6nrD32ZI+64
         Jg4KPhM1y83BxfjyRpvAnM9N9fiiJfp3buwq1/IyZZJzLv1b3dcWpd81hP/pussODNjB
         cGlSfheY1OOrw49IC8xOiysNCuvlHpCXc7fNMGWOnhHuLBU2wDKkGxem9nB/whwHLK/7
         5dDchbx1L7QSSZIpWpkLvVILg+qHsmOJ0zxEi7cpzaAHrkaZEFc+oJiEnQKP7m8pVDmy
         eWfwVzpMeNnefk+sVDMC29/H7kQz56Fd2SdM9CIu0tcKW5kxGaUP4B6a/LJ2fKyI+nAL
         CLoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo7HbCKFGvC/oZOgy2+6RS+y1PW2/fla+ToyXhnYldQ7SUU2RSriPfW6LlK6INPtakQyZfAYIrMox0oNFn15kDHq+YIwtp/5QVgeKBe79q
X-Gm-Message-State: AOJu0YzO+t9M6Grw8KNbCeg4BP6MacWvaVTg20UwJNNxpb/7ua0vXJyB
	Y/YO9+EbUnBwQyW/DtZU68W7AVA2sQHVLu556/B2ehbwGwXtoQHz
X-Google-Smtp-Source: AGHT+IFxaXNxU+DnOrLBeSwZcxi9osHaZNBS5Ck+rrtSNCA3ap4piacyMK02b6gEPK269uVMRKmOLw==
X-Received: by 2002:a17:903:120c:b0:1e0:fb8c:f45f with SMTP id l12-20020a170903120c00b001e0fb8cf45fmr2491401plh.2.1711490833528;
        Tue, 26 Mar 2024 15:07:13 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902ee4d00b001dddcfca329sm7436304plo.148.2024.03.26.15.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 15:07:12 -0700 (PDT)
Subject: Re: [PATCH v2] riscv: dts: starfive: Remove PMIC interrupt info for
 Visionfive 2 board
To: Conor Dooley <conor@kernel.org>, ganboing@gmail.com, kernel@esmil.dk,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shengyu Qu <wiagn233@outlook.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org
References: <TY3P286MB26116B828A34D614C09F4E8898202@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <20240326-create-motivate-2792be1692c5@spud>
From: Bo Gan <ganboing@gmail.com>
Message-ID: <f472affe-d1ef-cbdb-b5c5-76f6b3ac78b3@gmail.com>
Date: Tue, 26 Mar 2024 15:06:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20240326-create-motivate-2792be1692c5@spud>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_150716_540843_5B6DE707 
X-CRM114-Status: GOOD (  15.71  )
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

On 3/26/24 1:37 PM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Thu, 07 Mar 2024 20:21:12 +0800, Shengyu Qu wrote:
>> Interrupt line number of the AXP15060 PMIC is not a necessary part of
>> its device tree. And this would cause kernel to try to enable interrupt
>> line 0, which is not expected. So delete this part from device tree.
>>
>>
> 
> Applied to riscv-dt-fixes, thanks! And I didn't forget, so I re-wrote
> the commit message to add some more information as promised.
> 
> [1/1] riscv: dts: starfive: Remove PMIC interrupt info for Visionfive 2 board
>        https://git.kernel.org/conor/c/0b163f43920d
> 
> Thanks,
> Conor.
> 
Hi Conor,

Thank you very much for taking care of this. Actually the PLIC may silently
ignore the enablement of interrupt 0, so the upstream openSBI won't notice
anything. My modified version, however, will deliberately trigger a fault
for all writes to the reserved fields of PLIC, thus catching this issue.

Hope it can clarify things a bit more.

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
