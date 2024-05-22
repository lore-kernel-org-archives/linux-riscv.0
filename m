Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D50C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ip+8XVcQKLVRaQBtAZDw/DNfS6HwsU7BMebJF5I/V2Q=; b=rMK/oY0vZMb48H
	KOm/KnFjOW4WwKB8eKMcrW+J0lFhXv//o66U1SSE0mT+Ccka7l44oaea8xhwn3ojrpSR0hJxsLWr2
	oZY/n8KWxZdIPKQ1CIVNDPayetJFKC9IEm6PXuCp/WxDd67xe4aXgQwFqquP0aE2TJrdVPmvZ6EJY
	Hm4TM3i92JESv9H1xFtF4gnVlrkunL9LbTqgarNM+RFgjkpMjmA5kLJNfouXUGus6hivrB1N2fg5d
	zi44ju1Jns8ODuTNfcI1+TrsDGN21OcRZAneL3+imrcsQuswc+I3Afu5iNJgutwBOzttPVCJbedIi
	uxW8hB75MZjl0JyKdE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vVW-00000004Sq7-38dP;
	Wed, 22 May 2024 23:36:30 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vVT-00000004Sp3-2KMn
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:36:29 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-36c86ad15caso5765465ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 16:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716420986; x=1717025786; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxGBy+OPXkVQsg70GHc4dBA7DwixWSOZ/j8bxRcEzyM=;
        b=Wkfeq9psZdBgNyzUSvxC7P1XUKor3vAMT7lb5aUMBJZr44Y7KRpQPyNtezbjadScyd
         /6JTtA86FgnJDc0zfyIoWeRnda2HfJ74LZwKxXcT082hB6/JW1zpI/hPRsWGDa4rCaB3
         yk6cvsONP11ymGFdJOtlr2mGUOfP8gPQs5ekQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716420986; x=1717025786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sxGBy+OPXkVQsg70GHc4dBA7DwixWSOZ/j8bxRcEzyM=;
        b=nggsK7iZ2cBmOcdgk445ga5Vx6zJRczy81rVIxGPuHQ+5HcakbPtjrYXFm3v4cLT+b
         fxAvE3FEoT2GPYUSX9fsmKX0A8Za7z1rEnEWR9Cihmr+HZVBY5AesUa96U1hQC+GfdTo
         9BlDlCALYCOfgSolP2lO6M2wfRdSXxnCjBzhKqYU0AKT1Od3ZMUjhyTcG2VO8Py57nox
         M1sbwl0Aek9jOnPWjdOsG/W5XKdcm8zjBbbikpActsZ8BLL8SG986pShUpCtzMDdQjBt
         I3fd/neEBvNNa/HN/9+LAiu4uDmk3gM11ebHbxzBt5gR0iLWlXgC9/bbrIk2RHsGqEdr
         KZLw==
X-Gm-Message-State: AOJu0YynstWdazLFQwX3+PBC4QPwp0aBVMKsWlGaWPfO31tendftXDD1
	Ec1iVxC/wEV79HWcQoF9ejS0KR1VkLvtsfDLoyxsUbrc8cUWVhpmG0HllpbmBmbZ4Xvdm3ZvXur
	I
X-Google-Smtp-Source: AGHT+IEtjCdVroZaUVcNGRtUK5AuBGREUnts03x3VGGBxpKu0QVXWygNx3tOfnTDzg2xubxhKgFDyA==
X-Received: by 2002:a05:6e02:20c2:b0:36d:9ec4:54fb with SMTP id e9e14a558f8ab-371f674c2fbmr37234675ab.0.1716420986020;
        Wed, 22 May 2024 16:36:26 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-36dc81b6747sm32595975ab.11.2024.05.22.16.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 16:36:25 -0700 (PDT)
Message-ID: <29c1f444-6c58-48b2-90b7-a17ca22ad309@linuxfoundation.org>
Date: Wed, 22 May 2024 17:36:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/68] Define _GNU_SOURCE for sources using
To: patchwork-bot+linux-riscv@kernel.org, Edward Liaw <edliaw@google.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org, mic@digikod.net,
 gnoack@google.com, brauner@kernel.org, richardcochran@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ast@kernel.org, daniel@iogearbox.net, davem@davemloft.net, kuba@kernel.org,
 hawk@kernel.org, john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@android.com,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240522005913.3540131-1-edliaw@google.com>
 <171642074340.9409.18366005588959820799.git-patchwork-notify@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <171642074340.9409.18366005588959820799.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_163627_660609_6EEFA4B4 
X-CRM114-Status: UNSURE (   8.72  )
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

On 5/22/24 17:32, patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
> 
> This series was applied to riscv/linux.git (fixes)
> by Tejun Heo <tj@kernel.org>:
> 
> On Wed, 22 May 2024 00:56:46 +0000 you wrote:
>> Centralizes the definition of _GNU_SOURCE into KHDR_INCLUDES and removes
>> redefinitions of _GNU_SOURCE from source code.
>>
>> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
>> asprintf into kselftest_harness.h, which is a GNU extension and needs
>> _GNU_SOURCE to either be defined prior to including headers or with the
>> -D_GNU_SOURCE flag passed to the compiler.

Hi Tejun,

Please don't. We determined this series is no longer necessary.

With the patch that Andrew applied:
https://lore.kernel.org/all/20240519213733.2AE81C32781@smtp.kernel.org/
make its way to Linus? As you say that's a much simpler fix.

thanks,
-- Shuah



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
