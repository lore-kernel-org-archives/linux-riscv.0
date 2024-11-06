Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EFFD29FB8
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 08:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgCHswyURTlUviNUOIVxZFqaul5ZlqU4TutG4u5+2TA=; b=S/GgIlnuF45hkg
	oM6gtuhxz1V4zQZf6fWk3WQ5dGsufS8mSZQWRov6baWHlTuLBuZ64rXkSm+R28PS1nsgZ1jjCujiT
	Fr/NNU5uNcAjkcgdnZZ8FWqVXqPpT8lJBtIjfuv6TDtxr8IH9is6DqSvai+tGxlp+s37X8C9GdMmZ
	Jkb61zmEG6stFmZcd9eNyhoPcZ75YP9JIBpTNr5pM9Ln2BpOaaTfsQBsNra5G48DtN80pVgldq6rG
	NIWSGGuZnoocokdgnDu17+A3bkNgj5Pm+7AQA6XT/OwRLW4szcjpawP6vRzgTRk90L2TTBBW0KMsQ
	Zl9M+2qV8f1mo9LW8Pvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8b0p-00000002DJH-3u90;
	Wed, 06 Nov 2024 08:03:35 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8axH-00000002CRT-2IZw
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 07:59:57 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-20caccadbeeso69101035ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Nov 2024 23:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730879994; x=1731484794; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxeNK5t7CfGOlB6qBbFwH4xASU+xK3fI87OxOC6j0kA=;
        b=CPogRUtz0eyZxsT/K+9HvWtjxiT2olRzisnWIBFNSF4VWRU4cgYT5t+GPlQxTRSJp+
         nxWYq8C/iekazCbBw5f1cVwjfcTPQJoSGCiAQ8vOu+VxE0IZtUa3aLbADSjJuOTDnrsC
         /qU1mTi23bNZSQ+K4WVcjRHfaUBj+qEmO5Ls8E+Ajc3+NJjazhI6PzTyV9jdI+KNgyyv
         H+ag+DSIV8yQ3H6eeq8seCYUmMTrwBEZxINYYeMcHOeULcVnzJp1yoHeR4nzI0E/ldkM
         I+fPEZSMzm4dRyXe43sUKKCU4GX1ZAXGiY1FyZfErlLIBFt6eA518oczBsr6reyyq+Od
         bodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730879994; x=1731484794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxeNK5t7CfGOlB6qBbFwH4xASU+xK3fI87OxOC6j0kA=;
        b=qDvTfre/BSMaAXylbggYOVmLuMpb7kH1MaY2xF/seO+iNFOjS2GOneU2U+HLGoTLim
         FHx8wX38iGk5f+Z+sOo9YFrBQnE2qnX/L0EX/BJW39zMNvSFBm1lkGRHIJAiSXnhBSOI
         dcacZ630CW3h0fo9YILEOu9/XcUSRVL9mtUgHEEL7HPR+qgDeVhyn+0y14pnPWpH/TOO
         ioD0O/LlBIh19BFVPMiQmuwWbYdZUN2f4q0sKp5x/VmsNel2B4GaazwwcyShXqzuYdc3
         hzaGibJCUMMOGYM4qqG6SqQpEJ1djAAY+IgdRLdSaGM98yZFU10ZlZORJBTxtTMuJC+A
         NaSg==
X-Forwarded-Encrypted: i=1; AJvYcCU9LGvUy5MP3f8i6tZkyICyooRZ944hcHq4BB+w2awdu1CNK+FcAi06JBD9mOkdmYficmARlk388Xrteg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbHGDg2C3nNXeVROpd58n689LbGj4asrnZ+glvjLBRI7o7o7bu
	YqKmhImYSAgj9ah2T3YH6MDkMKYhMANscziPo2RWQMhWxDIE+gNN
X-Google-Smtp-Source: AGHT+IGdUmH8GzeKzxo8Se6JpdbU41SzCRP9as3jCkSxf4igM8ZAicZPCcbsg5EEVD4fY1rEZXHrNg==
X-Received: by 2002:a17:902:e890:b0:20c:e169:eb75 with SMTP id d9443c01a7336-21103abcfbbmr319126455ad.2.1730879994195;
        Tue, 05 Nov 2024 23:59:54 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:100::2b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21105706886sm90012895ad.68.2024.11.05.23.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 23:59:53 -0800 (PST)
Message-ID: <97096021-db00-4b4c-98f7-4c4a11f2c144@gmail.com>
Date: Wed, 6 Nov 2024 15:59:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] riscv: spacemit: add i2c support to K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <stpzkggfwseaqy6kbppiog4xfbpq4r2jwix2nvredbmmjqzbsi@wkllt4jlingv>
 <edfaccd7-ac96-47fc-a174-912c8aaf0f5e@gmail.com>
 <o55tg4zybyfroh7on7b6pxwbkw46fgafryzlc2gczmgecxr4ph@lptxs2timypu>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <o55tg4zybyfroh7on7b6pxwbkw46fgafryzlc2gczmgecxr4ph@lptxs2timypu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_235955_629568_A051A42C 
X-CRM114-Status: GOOD (  17.47  )
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

On 2024/11/5 22:21, Andi Shyti wrote:
> Hy Troy,
> 
> On Mon, Nov 04, 2024 at 08:23:23PM +0800, Troy Mitchell wrote:
>> On 2024/10/31 19:43, Andi Shyti wrote:
>>> Hi Tony,
> 
> Sorry, I misread your name :-/
It doesn't matter
> 
>>> On Mon, Oct 28, 2024 at 01:32:18PM +0800, Troy Mitchell wrote:
>>>> Hi all,
>>>>
>>>> This patch implements I2C driver for the SpacemiT K1 SoC,
>>>> providing basic support for I2C read/write communication which
>>>> compatible with standard I2C bus specifications.
>>>>
>>>> In this version, the driver defaults to use fast-speed-mode and
>>>> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
>>>>
>>>> The docs of I2C can be found here, in chapter 16.1 I2C [1]
>>>>
>>>> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
>>>>
>>>> Troy Mitchell (2):
>>>>   dt-bindings: i2c: spacemit: add support for K1 SoC
>>>>   i2c: spacemit: add support for SpacemiT K1 SoC
>>>
>>> As Krzysztof has asked, please do provide the changelog, it's
>>> important to track the progress of your series.
>> I saw a compilation warning sent to me by the robot, and I've
>> fixed the warning. Should I resend V2 with the changelog
>> what I miss or send V3?
> 
> Please send a v3. When there are compilation issues, normally
> patches are less keen to be reviewed.
> 
> You can add the changelog in the Patch 0/2 to avoid editing all
> the .patch files.
Thanks! I'll send v3 after I get a response from Samuel.
> 
> Thanks,
> Andi

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
