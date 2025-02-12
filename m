Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E73C0219E
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsZoKnh7uwiBgc3037Aq2yrjeA4N3/4QM4U1GyvUHLc=; b=fJLSdcq0A9JLk/
	SLANYlKttKzOSnFuoOdfMj2M9KIU1yUWicUmjHcG/sGUkR92yNzqtYnZSbJLQdwehJrxZ6O4siXuC
	5s4Ah1SLmuEDO1GgCGMFlwr4ub2csxzYrgs2ud9v1EfE5fovp2xuD7jTre+7GYZLJEe0EzaJwQZrv
	rUzWBet2b6SU7J+lcyH8P73Z6EizCBLcOzO6BNqfNSdqxxkC/ecS4+whPsX+TIG1twmMYoOu8cdiz
	3D3KtIpl2x0p8Y3ngCZABpqYMFCw7ve7zXGjroCLXCMbxPrddT2XrD3nDhS4Crc0t4cRro1UVj7od
	ruYmezkBlNovZBiV86+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7ny-00000006ZAN-18iS;
	Wed, 12 Feb 2025 08:09:10 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7nw-00000006ZA1-0QeU
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 08:09:09 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f42992f608so9887144a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 00:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739347746; x=1739952546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uzz/ztA8J5OEcraVsYIfYsDCP8O1/+bhCpXSvSiKTAk=;
        b=mC67IS4yg+SD10vSMCnTi2NXSgJrhSw7CbbmTgMp0CkmBXtQy2nBc1Pq1VlXTAtij4
         1+hP2tsbihIlWBVadWYk1Xz3L4HJfrrrsUGi1FmBBDcrIkNFUNeatXAl3eH+Q4P5Iy6G
         TXxsHnzhJmvlHTcpZ8EFtXf7HM90jY0Fw6iMLKEJsQyZr3XB9tn5g+0f5RsbcYqh/Bgt
         rM9IvIxf2yPXEJtxoVHpNLLf8TMs+1vNdDVLKmSPfv98/FwXAosm05pqK7vCtcak4pXR
         pHsnwk7sYD7jTWAooRX4hjWUDZ2mtCFXeM/dpBpKor1MW4VQPAecXuC95J2t5GnuH6MH
         HLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739347746; x=1739952546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uzz/ztA8J5OEcraVsYIfYsDCP8O1/+bhCpXSvSiKTAk=;
        b=VS7Sm4CTXuFE4QgtsjAUKhGxEC6XbWeBWPOS0wanSHTWUI9vFF6hrkTyy6gA0lwgLg
         nFtV5PWv5CsfH9/S9kQR9ZSz0r9MRzUJJKOBYwgbchcfl62BqGgYqmdsbsAFqZLCwl8E
         RULw/ULfEFCctth6ne2E+bJIsgfMkV2l/jiXnpVi42LAQbbSal4u7JT/JKRkE1iTYFs6
         X9o7sbBmEuzICRHD+QFKYI/lQfAZSeZf8acaAg1JHrqsv3Cx+kSID0PIaYOYjjCW5jzs
         7YzGiXeBl69XO9IKNPXbJFpRl7lCzRhJtq69ZXwmLMmQNyOlMpT9mrkMVPakVuCngSkK
         fOqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXL1b7AapSo6cUDqLyhJHC4OT3dnjVkgariiUlAgSeN5wyHbWp1tcKD7X2jKZHD5bZj4BZmALs1rMaxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTWbkxW4eYqc6bxikXK233j1luEZb3r118Xhii73mNrB43uF1p
	q8YfyfAuphpXAbk+aR6wDSgStA6jtFEUOyPHfOlMJhPgT+7X2/w0
X-Gm-Gg: ASbGncsoa1gm+DT269H9v6N/JsNy3A/ikDTuq7/ZCYnv8b/mmMRsK4OE/LcoDf2pZX1
	WEQbptnx2hJ8HNeZmRMSTapp+WDA5HLposx9/JsGdIamgcsAS0RWtLvvIENBvBH/2TX1D/Ytr25
	d4klg8E/RlGbJHMKrtnDNBak/qy0M/E/Fx802eoUE140sBQTpqem1OyT0QrBPrMGJmyZHexdJBz
	fpvI9pFxpwRgsU1MSGS4ovBb6A+nINKxjYkTptECsJoI/vr1rSZ3f+oz6GQ4LLLhl+xIdA4ltDK
	CfmHbmX4+oa7xDf/3RQTT8AoM5HuyfgWFl+pdbtFIqDOSj0qyQ==
X-Google-Smtp-Source: AGHT+IG2Bzz9E5EiedwHTMJWTWNMK7lgiuQCvQWlS4nGxBclsahMfq5ltIXb5KcmWhLepPoYJs0soA==
X-Received: by 2002:a17:90a:d64e:b0:2ee:db8a:29f0 with SMTP id 98e67ed59e1d1-2fbf5c603b9mr3426862a91.27.1739347746403;
        Wed, 12 Feb 2025 00:09:06 -0800 (PST)
Received: from [172.16.203.237] ([103.233.162.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98cfd03sm871927a91.15.2025.02.12.00.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:09:05 -0800 (PST)
Message-ID: <f827cbb0-f6ad-4397-9f30-ca43223c4853@gmail.com>
Date: Wed, 12 Feb 2025 16:08:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: Optimize crct10dif with zbc extension
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, ardb@kernel.org
References: <20250205065815.91132-1-zhihang.shao.iscas@gmail.com>
 <20250205163012.GB1474@sol.localdomain>
From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
In-Reply-To: <20250205163012.GB1474@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_000908_143187_ADC352DB 
X-CRM114-Status: UNSURE (   8.31  )
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

On 2025/2/6 0:30, Eric Biggers wrote:

> Maybe use 'const __be64 *' and 'const __be32 *' for the pointer, and use
> be64_to_cpu() and be32_to_cpu().  Then the __force cast won't be needed.
Maybe this problem seems dumb, but I have no idea to adapt both riscv32 
and riscv64. I have tried to use 'const __be64 *' and 'const __be32 *' 
pointer in patch v4, but I forgot to test them in riscv32, and it turns 
out the code failed to compile due to my mistake of defining 'const 
__be64 * p_ul' and of course it wouldn't be work for riscv32. Maybe I 
need some inspiration for this problem, or I still think it better to 
use 'unsigned long const *' since it works fine in both riscv64 and riscv32.

Looking forward to your reply and guidance.

Yours,

Zhihang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
