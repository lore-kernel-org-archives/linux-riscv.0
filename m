Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BF8C28B30
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Mar 2025 22:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOPc/asEwMzMzJSUuSx3fO9ekc5BhixHUuiEVFjXSw8=; b=ijXsMTNTXsLaT7
	6v861f/OMvw5OH87MN+LSB4hkLPBptp2bGvlC6cghA8xzGqAjiRs+zM6jHsIgvhyVlrIP+28cE3JO
	1XOv25RbwhJyFnSB9JVjLMc0ZOuH7zMWe4S9ZQn3ArbCozaLs/fldTyLmdCBh1IbOLg4WN8/P0j7B
	U21/9DXAv1you2vHVggwF9125Mboe+ML/u352VPyMh2t/1iA3YRglfjvguCUned20F1kKq091ZvjF
	hyLa5mkLCq2GPI5V99PVxHToeDXi0TVYBQQ/07EKdxubzn7T60rAGOSfkldsfsnW6ykIVmlZewR/3
	/FLtDE4oWwRjcUWffopw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twTq1-00000001oVE-2ruW;
	Sun, 23 Mar 2025 22:30:37 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTpy-00000001oUm-3D5K
	for linux-riscv@lists.infradead.org;
	Sun, 23 Mar 2025 22:30:36 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-85b5e49615aso331389139f.1
        for <linux-riscv@lists.infradead.org>; Sun, 23 Mar 2025 15:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742769033; x=1743373833; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTRlExMDyawWBV8YJuZYM4CxYbcHVqfU+45dmVV3tsQ=;
        b=Gf/W5BSEo6xy+ReRLljHDEBoS/T6RjjqBzItASKTdvE66VYh7hy53jfGF9S6UIQujb
         SvQtL4nWITe7MuQLWrdAh2hG65+Au4MB4ZiSF9cKw3/czAaZdREOYgFErN4RGcmhB6/B
         6aFHTPQMiCF39ktdOI5VE3QrXHH83DkcoHOv41P+srNKRJCd6o42aFuG/ZLmpMIxMz/W
         tpH7A8Bsg1bO0nhjwCThG7PqpoMd7hnLZ7Siao/COuJBixsFjvq3KZyDAOy/OW8Rf+od
         z7aQ7+OcWTD2RNd6Z3Gv0NhckDrpNGlAIE/YbVQvFu07+cHJR2YlssHiw6ZThql3Ztue
         dZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769033; x=1743373833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTRlExMDyawWBV8YJuZYM4CxYbcHVqfU+45dmVV3tsQ=;
        b=IiF5tMyeWrklSdwJT7Zl0PYgHE4LV8TPJOSQfTX3L1GiV3WFom0DzJv1nyjuUAIKfz
         nvtKrEAmbE6aqjWwv39VHH/WpYGIRvfxTPYv0vPR6gV/WLz7sCvlByaKM3VofeRMXQ9f
         WSaatsscTGiMSLMdfAfX6pyjGx+XrDA4GDIgsqHPNxgKzTpGduvnImE+TB2PiRko8OSz
         PCjrh97B7yyRQdrkLm91baEyqVRTJJkrtlBvj95u5T3qeKEtGHEfNudWgXys8Iw7kGMR
         59idxgLLHD1xMrEKxbKfip2UQCWHdrezFqeRoX1jZ3yLdCIlt8hoYQhyW3pjLg4riFgo
         //RA==
X-Forwarded-Encrypted: i=1; AJvYcCWDfyT1k/+e/gXZ+1BvSNuyj9lB2oN2d19tVqSUojTrFp/YBQqyE+gxKfH3ZKKSukyHpeJIcBwjRTdF6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzunE/KDEhHstv+hNarDnR9S7ylOzPeH/tGTQNE0Ggvikfa4/M3
	YpmaSwPtkDAh39mlmd5OvyKZPBUjQD2YBttONRwZg+C1Jtfqo2Gn4Fn1sEjeGE8=
X-Gm-Gg: ASbGncsLqR3Y7n+VVI1HAIZ0Qsvq/sewi2AxTFgG3SGssY98rZBX9mm9HxfxiCTeveO
	fDU+TJOCdH3khXmtACOFhRsk8ItNlLZncSFQsvPUjfydg2fB/kTlXp8gOTsO9Y70r5gFM4lIorg
	NlI4283I8sdpwZNaiw3xF9O6HgAEd5grCBK0Gki6qY1laK0m4iC87UVcFGktBGrpgUMUZGj3HWQ
	mR0Z/JONdS37ocOX1t+sH4WbM0a32yA0cGNR6fcnGuEBapyQKSF1nTa5Agz5BltWR1Bh/8vI5Hy
	YgTkAwEpfxAOSsUwvakL43Sa0gzz2mxwwcNEuM2OHfMS/uIhHdX4ZhY3ij1N6FS11Zt8wMOnZk7
	BgL30odixufK2orrJxQ==
X-Google-Smtp-Source: AGHT+IGH7axJe7eTCwDAhgnxz/2TT8RhnJt+UseNxV/R3diYZCOSlRPsij/3sX+uVBgUHGoEXTkhpw==
X-Received: by 2002:a05:6e02:3e03:b0:3d0:239a:c46a with SMTP id e9e14a558f8ab-3d596114994mr121950535ab.9.1742769032889;
        Sun, 23 Mar 2025 15:30:32 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbeb52f9sm1538014173.130.2025.03.23.15.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 15:30:32 -0700 (PDT)
Message-ID: <661457f2-aad9-4b3c-926a-6ee021355dac@riscstar.com>
Date: Sun, 23 Mar 2025 17:30:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com> <20250322155034-GYB11633@gentoo>
 <45526855-17b2-4de4-8e12-6320b7d84c8e@riscstar.com>
 <20250323130430-GYB15267@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250323130430-GYB15267@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153035_080062_899E5EFB 
X-CRM114-Status: GOOD (  13.75  )
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

On 3/23/25 8:04 AM, Yixun Lan wrote:
> On 07:43 Sun 23 Mar     , Alex Elder wrote:
>> On 3/22/25 10:50 AM, Yixun Lan wrote:
>>> Hi Alex:
>>>
>>> this patch change relate to clock only, so how about let's fold
>>> it into clk patches (which now has not been merged), so we make
>>> the code right at first place? cause some moving around and renaming
>>
>> No I don't want to do that.
>>
>> The clock patches are Haylen's and the are getting closer to
>> acceptance.  Let's not confuse things by adding a bunch of new
>> functionality.  Get those patches in, and mine can follow not
>> too long after that.
>>
> 
> I only mean patch [2/7], not all patches, as it's still clock related
> but, either way fine by me if you insist

I see.  It would be great for Haylen to implement this, it's a
better way to do it anyway--you can define the number of
elements in the array using ARRAY_SIZE() this way also (rather
than having to count them at runtime).

Haylen is welcome to use my patch as the basis of this, but
if it doesn't get into that code I'll add it.

					-Alex

> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
