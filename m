Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1BDC021B2
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 21:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2j2Kry0PuSkBQ2LUXs0ZpmM+qP0urD38RlAKytovwcg=; b=zke+UhAHjDCZ3S
	CPq1dpiuCCipL/hxsHsZDxoSMeTa8/b8jMFHpbfa9hKvOlYLSDhCYKbTmgQ1R7Kk4HiYJ/oSYSSFd
	jUUHWL0l660CtLi1xxZ3SAplYY4lzAdXhfMHT6tBNkm4di38RzOd/LwEClEQekuW/sgXwpYZYcK54
	/cc2ze+k4keLh64xDgSYITPMNkS/qBInxipDwxQ2pBeBTkx/H+tEQBXYD/6XBfpkxW7fVU8Q9xbk8
	Iy/w8WBv14ZndjGZ1wiKVWngb4axGri1qkrHEt0m7OvRkZXe8CCMfTaNm+WHj/Vn6rUN7/PfhevfF
	mpsFBPQLnLoX0cH2OaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2SS-00000001YG2-3nOL;
	Tue, 25 Feb 2025 21:27:16 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2GQ-00000001VRo-3czv
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 21:14:52 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3d2b3c0b3fbso47603705ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 13:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740518089; x=1741122889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xh2s6sLjIXbWIAOmjMi7Yyx9NKVsC0mal+LFgBmzJUY=;
        b=u77W0P9jfVVbc/4tEQvD7jPozktG9nFmB9Uuw8yVt7xu76Y6lCra7Q9i+JMJtvTN0f
         DRtNKRHnh1HPwchSS4DafTCrDgxIKp40FwjuIjjw0zdZc582mTxbDPKSQ/U/MTuw/ulD
         3n4Uvk3yINf3yV5T2T7YJfiygxA14IDzIOgRBijkLjviAkFmhbYRq7eAGj+zdZDxdclM
         0tETUSkYLBR9O3gA62cyTR/r7yJYb6lBMsJkSRLsEpZByGZ4YQojB+ypm3BOmcdhyPFg
         0lA7zO2hujsl4bmHyLfHfPenJX4VuVBf5bQwKGo2ZQlbY+ym1qCPvq/QRurHgyR5dxeK
         efEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518089; x=1741122889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh2s6sLjIXbWIAOmjMi7Yyx9NKVsC0mal+LFgBmzJUY=;
        b=hgEHrYZT8JowN98Ue6mNr37yjXxHbcEhdOj0OohvuEpYpfqXZf33Z7LFIEu/KA4oht
         tWD6Nw053vL7Bl5DZe3y72yfJDspMtFanEp7gmNkuBc+O03YSTv9WHkWm/htnQuAneSB
         vJohs8LI1TRBcBVkcoPUpeszCVzQL0NWwRyjxRhxsrXamVS1ylYnBwG3NuzRbWo3otM8
         HXwP2QtFOwgu2MW/N73ZpfAp6DuGz//EOOAmK/wNKImLZE0tandYH5GVpfjs6jY2qftb
         jeKarH6hmUAfKp6dQZcO7PdIglUPP4J3f+RJWH1RbQ0AxeS3W14nQ8LnlWxwrB0wVT9F
         2w+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiXdcBLnx0rqZXi86iztJ6mDCkTuSKhEMfRCzRDmP2ybgRJkrD6LBJil7LiL3UMF45WEwH0NLXDe7b8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUxlxSHCnVZfNVGbSfzd/cbYZTRN+/7e0joaOO3+RIZU1EPvRm
	zR53CSSItLsWPzLs/8P2f7YPQsJGDT7CVkAFOmcVy3NbUcbZkO+0J1KbD/FnvPzGOFbEAe9wCko
	gAfs=
X-Gm-Gg: ASbGncswLaGYZi5/MVQ1ZwH8edA+HIxz6vSeWUemMFiE+4QbnrCq5hk4ucA1FWuGpXi
	IWjCWMsdN1bSVDS5MeN+0Pi5Mb8nAlgCfTyncoRxZ+Wy3UU9oPlKOn04t4d4fSuDfHH7ipdOzh5
	fPCW7wQNhzw4f3McfP6tDorfBqFuGSSsPkfSQ4E1U3twFLuEKDVmBIKHyW9SoH4O1YcHAPQixrm
	CFbJoBRMkKHBl/cPtQKhLt9WdC0oMGT49fioZhyiuk6+w9WMd17+mO7vWYZ9eeYigDlJ9naAyIB
	p7Y1X2w7YJLR+Rl3rV+GM6lgnV4q+JEZpPV3Nv486sM1/wzgf6jZIhiAsdlskOrmNQ==
X-Google-Smtp-Source: AGHT+IFYiGdbqXZivMiTUNph/SuErSNuziRQ4+AzafOTADCcFATdduAQ55CPRDAy/XVPlsW8jn+L5Q==
X-Received: by 2002:a92:ca0f:0:b0:3d0:1fc4:edf0 with SMTP id e9e14a558f8ab-3d3048802e7mr47557345ab.15.1740518089508;
        Tue, 25 Feb 2025 13:14:49 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d361ca210bsm4894255ab.55.2025.02.25.13.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 13:14:48 -0800 (PST)
Message-ID: <34666c12-d10d-49a1-8316-bdd18cf1319b@riscstar.com>
Date: Tue, 25 Feb 2025 15:14:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
To: Krzysztof Kozlowski <krzk@kernel.org>, Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Guodong Xu <guodong@riscstar.com>
References: <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
 <Z6rdBhQ7s2ReOgBL@ketchup> <19e5129b-8423-4660-8e4f-8b898214d275@kernel.org>
 <Z63T_EDvXiuRQbvb@ketchup> <2ab715bd-e26c-41bb-ac64-baa864d90414@kernel.org>
 <Z7BTVu10EKHMqOnJ@ketchup>
 <7c697e9a-d6d9-4672-9738-93ce3a71beb6@riscstar.com>
 <4f7bf109-bf18-42be-971c-5d5edd9595b5@kernel.org> <Z7mrdrACFp3m-7sy@ketchup>
 <6ea8ac17-42c8-46fa-b970-77ba89de66c4@kernel.org> <Z7xHRAFE4-QEA6PO@ketchup>
 <976a2029-c0c0-4093-a3cd-71e1524db032@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <976a2029-c0c0-4093-a3cd-71e1524db032@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_131451_163614_632C4381 
X-CRM114-Status: GOOD (  10.66  )
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

On 2/25/25 2:12 AM, Krzysztof Kozlowski wrote:
>>> They were brought here to discuss for some reason. Long discussions,
>>> long emails, unrelated topics like hardware or different devices - all
>>> this is not making it easier for me to understand.
>>>
>>> Best regards,
>>> Krzysztof
>> By the way, I made a summary on the hardware covered by this series in
>> one of my earlier reply[1]. Could you please comment further on my
>> proposal[2] according it, or pointing out anything that's unclear or
>> missing? It will be helpful for things to improve.
> Thanks, it looks good.

Sorry about my earlier message; I hadn't reviewed the discussion
carefully enough, and what I said didn't help.  It seems like
Haylen is on the right track now, and I'll wait for the next
version of the series to comment again.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
