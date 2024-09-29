Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE13CF6499
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VC8SmbxDqlICXpZXYK13dOtlGkLq31sYqz8zantCCbQ=; b=vwDGaZhZ+YaNiS
	sDw3WJ4AeSSnNMRnoeRBcpUfsxU/ATm+S48dzMbERsxu1IQUfPuL6ikk+NWTUjR2/gjq6DMi1MZ+E
	bbTPKVdU+vRE1Y2V2RdUJLUtzaFXvZUWz5XMwIVW072GsF9VQeJf3H3W9PCDO+T/k4uF74+P40iPC
	ZlDaLGuXywHIyq4mioOLIMkuxBjP4n6/7yhrrtIOJDZiUexVslcQfwDsbzjO55X7kHyYk8uxOBn3A
	NVVMd3yK2WvToiNJcpzNqqv/k+1+BIhU/0F+vbNK14TnzI1TTV5wnsFN+f6QvEdn9zRKv7+kMBcu3
	Q4e94cBqH2AQFvPLk33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suvh3-0000000EwhJ-3371;
	Sun, 29 Sep 2024 15:18:41 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suvh1-0000000Ewgt-0IJC
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 15:18:40 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5e5568f1baaso2068754eaf.2
        for <linux-riscv@lists.infradead.org>; Sun, 29 Sep 2024 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727623118; x=1728227918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=imJC1hs8xVR2r/Q+v73yDPCnloHPi54lag+EQ6u1EYw=;
        b=kjSy9QxdCIp94WAxIJ5WphbVS/SL1DmlbQu2Th/H9ELDETAi5LWVmLtiYg6kSrLrek
         d0OHBj2L+jOr3+SiERCSCjY9cmxGKySadQqgJ6f3QvUthHpLJRXmPJ/Irar+pEyYRV8e
         5xyNbHQxX2/MCbqBbJ0GYT44vuJT3kjakUd6xK76W9M9tkeqeiaT38pH8e9ei0K1y7Aq
         JXgUGk3LAOnUaizkcvCuJi+rloK9CJ65TEu80lctym8fs3ryttZT+jLFzjfwdZUYeF6H
         dUEew3v4eD2GXDMq5/wO1UmNMkWMwBoxjlUSfDuksn0ZUAAA9ShrbJe40VLcKBooKHEb
         yaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727623118; x=1728227918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=imJC1hs8xVR2r/Q+v73yDPCnloHPi54lag+EQ6u1EYw=;
        b=j+qlMym8liI0yVHiILjnJ3WDV93ckB9GoaSRe7X7kXiFrPAOoL/pETFSMz49mTpypk
         mjkAjd1CPVWpM6UcQ0FTBojqcfZZnhlN1WQoKf1EH0hlI25x9VOXhWyiAeMvymanvcQs
         9oPOx5dU28a29gbDpZTotdF50viG1w4QmTFs0JHOVx4LtRQ/pTMEOlqhFPPA5ZVSlQke
         GvtRbeVq2BojvpCIQkCmMnk2z26YrhX3G8n73WbjFxNsMI5Q9CuKwuZDlDmWtp6Ypd0w
         /0kbJEFo/WHPXL0HRXe4HXzZsPeqp7AqQvdMm6Fahq1pWoG7AR1URLnOXdL2qsnIQAct
         7NsQ==
X-Gm-Message-State: AOJu0Yy8XJH1hWlQbTOKyyPRBoxpMgydtOB00FwkavipKgSKJAe2gtug
	tU/ppDjhW7fBAgw/fQ/2mWv5FTKfmhUiAoRZ2WWyZ7XooeYiTBip
X-Google-Smtp-Source: AGHT+IHubO/W4m/DhcTaYjbm14mH1csjFESgWKEJzDFHz75oLDhQQl/JJnl+6BeYH+IR7OGTXNjF0A==
X-Received: by 2002:a05:6820:61e:b0:5c4:144b:1ff9 with SMTP id 006d021491bc7-5e7727c46fdmr5783586eaf.5.1727623117913;
        Sun, 29 Sep 2024 08:18:37 -0700 (PDT)
Received: from [172.31.0.109] ([136.36.72.243])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5e770eaa056sm1686395eaf.31.2024.09.29.08.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Sep 2024 08:18:36 -0700 (PDT)
Message-ID: <cbbc9925-12a5-4043-a6c5-ccd1ef0997c8@gmail.com>
Date: Sun, 29 Sep 2024 09:18:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Page sizes supported by RISC-V
To: Florian Weimer <fweimer@redhat.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Xu Lu <luxu.kernel@bytedance.com>
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
 <e55950a2-beb0-4f2a-81da-1c66724116d7@gmail.com>
 <8734lixzss.fsf@oldenburg.str.redhat.com>
Content-Language: en-US
From: Jeff Law <jeffreyalaw@gmail.com>
In-Reply-To: <8734lixzss.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_081839_146807_31B68923 
X-CRM114-Status: GOOD (  12.03  )
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



On 9/29/24 9:08 AM, Florian Weimer wrote:
> 
> I understand that not making a call in the specifications avoids the
> need to resolve these conflicts.  But if you don't define a maximum page
> size there, it is effectively specified as 4096 bytes.  This will cause
> problems if distributions targeting large systems want a larger page
> size because it better aligns with the kind of hardware they target.
> It's really bad for cross-distribution binary compatibility, something
> that's important outside the embedded space and probably necessary for
> mainstreaming.
> 
> (Of course you know all this. 8-)
Yup.  Once it's baked into one significant distro, it's doing to be 
bloody hard to change.  I'm sure we both remember the PPC pagesize stuff 
from a few years back ;(

I strongly suspect the lack of specification here is mean to give 
degrees of freedom to the implementors, but sometimes those writing the 
specs don't really understand the implication of leaving things like 
this unspecified and how much pain it really causes in the end.

Jeff


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
