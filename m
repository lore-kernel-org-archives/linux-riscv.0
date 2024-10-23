Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CB2CFA45C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 18:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9KJI4aXULGtK9O1qblXD4kPWGB6vGcBkrr6Bz//eP4=; b=qppGCuDFJNx4/D
	Oa/QlXqxTmn/iHh8aKbxiCxj+RXcdhl74M630QHRZDZIWU/1Ct/bUcyUUBHoUAQb5xVRh+N7Ag7Ws
	LQnhFwGs7K3IHDF2sRwyXtojCWQjbvOVCjeLWBBbVxEKoBOhDUdstv9MpyK5rQBWeCpGMiK//80/H
	jDVo5Oi9T/pxzKVX4PQ7+3CnCh5T6VzjMHUSiZcij8/7dcxM4AErK0OHqfUGrVad9Y8BdeTFTzDj2
	lrnfSuVsCmnSjhiPF3szP8O+f+Ov3z0aeWJC/iD6sGv5WrL/iEahLeob6qkPRhC5nqSe4EgARi4Hv
	F/BfUiiwkXtp6u+UAUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3g1V-0000000FVur-3SFk;
	Wed, 23 Oct 2024 18:23:57 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3f2O-0000000FLtg-1Vs5
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 17:20:49 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ea7e250c54so16930a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 10:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729704047; x=1730308847; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nEQXo9Sz7v8bN7Q1vJX5DWcUwb1IgUSqRx5epQQcFPc=;
        b=oujSZdOxxqBGelOYgLym8CMLO4mc9zTdiHa2Cvl89DAKRMYa3wj+FROAJD1pcNC964
         8x0ofKEaQFF+01h81IpYFniCmlLtKhVs2O/OzbJa8c354PpVlVdjrwHxj890Yw+Iy6Y4
         dUfJdVLPmIsc0myQwWUFs9HKtvF+48h/syjwbfziL0h2DlfEeZHm94zBxzgzmFQdeevK
         tJSUw92LIsevqX/uYwa6GvFm4R9pLMJbO2ECROQS+6NAA2HSp90Cu6z5kjrVXxJ+/WlY
         irVKajxu1NiVhez/N+rN4VROujMBvo7Zi2/vkknCEc+StGikqkX5CIOYwDf3RUoV2idm
         p1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729704047; x=1730308847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEQXo9Sz7v8bN7Q1vJX5DWcUwb1IgUSqRx5epQQcFPc=;
        b=lT5f4VXkKtUqjPZdk0iI2zSB8zvVu0yM+crd0BzlgY21hfsZ5faUkbUsFldHWurUkz
         b+eNEHXFOhdr1EnwrI46XOOR6P8E9gsWNSI+x1YAJAN3Saj+92Tp4TBbViAnnvZzdvHU
         2zSg7YSCjo4mAGl/oMH4ElNF0K0QTOIT8n96cBFWdF5cJskEIDVg/iAGECMHVZzEcBeT
         QikBbmaV9oAVBaZWLsdajumjqZPCe4BXen0APcJKSphyPtlWSMxagQnyon6pRU+NZQjU
         DaLBwInW2XzZmiDTq9cXjRdaBwlaHQ0NqiUT/Di5mq1YkPaTfKMPh8s0CrsArxozc8IU
         znsA==
X-Forwarded-Encrypted: i=1; AJvYcCXTC1KHNePdghLzCiUYMxvRUyVN96asr8aOFcsMzx3cgSysolq0DTHy22gHVOhpXI6ahMdzXpt5cSFJOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwktxLvhIEdGsInimLHUxbEUqWOFaQijZR2F54yHB8ambcsGZhp
	by7RaIvdbeRl3ZzjF5houiNa3u5VeUOttwf8Jz39eNq0d+WwM1JIjG7EmWy2Xxc=
X-Google-Smtp-Source: AGHT+IHPr4QZhkAAGeXAcDGgKolf50uTjkGhkmYrtjSOEjEXstK3U1GYg0d0gYasNFQ1xIHEov8Cbw==
X-Received: by 2002:a05:6a21:399:b0:1d9:3acf:8bdc with SMTP id adf61e73a8af0-1d978bb358fmr3064226637.46.1729704046752;
        Wed, 23 Oct 2024 10:20:46 -0700 (PDT)
Received: from [10.211.55.3] ([208.115.86.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec131477asm6838596b3a.10.2024.10.23.10.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 10:20:46 -0700 (PDT)
Message-ID: <01a7b872-494f-4ea1-aef5-b40abc4bec06@riscstar.com>
Date: Wed, 23 Oct 2024 12:20:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: add DeepComputing FML13V01
 board device tree
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Guodong Xu <guodong@riscstar.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, Alexandru Stan <ams@frame.work>,
 Daniel Schaefer <dhs@frame.work>, Sandie Cao <sandie.cao@deepcomputing.io>,
 Yuning Liang <yuning.liang@deepcomputing.io>,
 Huiming Qiu <huiming.qiu@deepcomputing.io>, linux@frame.work,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241020134959.519462-1-guodong@riscstar.com>
 <20241020134959.519462-4-guodong@riscstar.com>
 <ae5gels34ozgzrcrwz53wj22hoy5cq3crn3dmkhitxlffmnavt@6lbmrcpjmqyd>
 <20241021-unroll-empower-3ab903615d6d@spud>
 <c048d270-7a07-4807-b816-0f4e0aeb67f7@kernel.org>
 <2b449955-6596-4c9a-9799-f15d186e260f@riscstar.com>
 <20241021-crimson-translate-291eaba4e640@spud>
 <CAJM55Z_jp7ZGUcV=4Ciq0ZMPbrf_YARpSDwWgxBa9OjbYzhiFw@mail.gmail.com>
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAJM55Z_jp7ZGUcV=4Ciq0ZMPbrf_YARpSDwWgxBa9OjbYzhiFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_102048_634389_D780DBE4 
X-CRM114-Status: GOOD (  10.30  )
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

On 10/23/24 11:49 AM, Emil Renner Berthing wrote:
>> Ultimately, it is up to Emil how he wants these laid out.
> Thanks, but I agree. Please begin with a patch moving the nodes that are no
> longer common out of jh7110-common.dtsi and into the vf2, mars and pine64
> consumers. You should probably do the same with the &usb0 node instead
> of overriding the dr_mode property.
> 
> /Emil

Thenk you Emil, we will prepare the next version of the series
to do these things.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
