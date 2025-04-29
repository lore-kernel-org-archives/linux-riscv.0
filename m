Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90E5C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 21:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQnTmCUIc0l+xgSYK0zlqcnmK4rrZmhMPKhDiBDaSO0=; b=f5zIF3u/TtPP6m
	Fe01l2JHpP3XSfyHjNk4aySklEIsPULGJRyE1QVpDJrqQ2nfIldl4OnIUHeQCFz0EIdB4ZhNccTC9
	PKaWcCilZLIaxotQ2/AZOEfTNMjcOTYSocLMgEvGnEe8dztZNNQsx5O+pODk65SUhfH7ZThCPds0D
	lF+pBT87aZ1qTjifJkLWZjb67JMPp33raqVOD8rkCQgFRls3aVvI9LytiIr5QtRL/W8iEHRqOTCKp
	IC+6qj6y8KVTurdcZJLu3ED6Vy2jBKtOLCH3QUl2EahnTVMcdq2z38O79sDHqlP759MPhuI1+ZzSJ
	Tg8JcraIjNU7mCiGPcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sn5-0000000Atfr-1wYA;
	Tue, 29 Apr 2025 21:46:59 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sku-0000000AtO7-02Xr
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 21:44:45 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-8616987c261so224578039f.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 14:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745963082; x=1746567882; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jR6+8yIAI0O5mZLd2KMAqTdJoRJKX7IRlTHsSNPOZQ=;
        b=jHz/Kv84LUesddLxqmPaprjoG2ChfV0MqCKfebOJQGWwLMcn5WjU29m9G0yDkUZ0JI
         keEWfi2xfBteThm0vop4lFTy4CjeIzimT2iP7Z31GO+Fwo9Q2wlAZ9C+ZrA4WAFQtTnI
         bon06RcsQvVBSbyOeOVX5QUy7UfSqjM2fUKN6oCKBR7yRc1bYGjrf24hIaizplFhV43j
         e4mjM90iqOdMsPU/3sUDFjWsKZzz3pJs2pz2Iz9sLUdJb5p3nyxwbZtAcz2vTfCQnFRm
         XfN59qCEsa0fAGyGePVHDkSXTt+QwRKXXbDavPxGq7iHZnVt449DAPaq10AxfGZji9DQ
         juAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963082; x=1746567882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jR6+8yIAI0O5mZLd2KMAqTdJoRJKX7IRlTHsSNPOZQ=;
        b=sQSpw846KhD4OarR76uyEjDBoh2Fnu2tyCKjEMAG371A5JaK1q+vfgUXKipzVi4Y3k
         ShxKu80sXR4kZdYBTXes6D2oVhoCtnD7Pzk1EkzsVxGEnMIhT3aViQtoOOuOhPSkLYUa
         Hn3bySbB+sRtrc5GWR4c6LvD11IQ8pGBTeP0Xh1TN9ipYic2ipSAOJvsIjt8RESb4p3E
         gTdPRv16oUwB++aIzmpZv0cmApvbQUPczukaPU8GuVSe4mtMW6z3wGEBMBuTI0DUBw/x
         0PTOGRINzvITxsGctrnMGEH2/w+A3m0caHr7kp92KdyFN9wqyldSeY8nOPrBUKmfc9bX
         Ztbg==
X-Forwarded-Encrypted: i=1; AJvYcCV4hW8dwueSokG0V0NHMcgdZtun4BwEjJqhCqLOt9CYUi8JDkzy0zKy5kzH2JPfYvO0khbJniLimEim7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YytOMKcsaBCjC8tI40+g+ndy2iIJr10So4RZUsuJc0N4aCAw1AC
	lIT+CWCZ3CgOeWf5bqCnkhvGWuMgEn89+YJ7FcmR2uu/RAhpahIGStGu+D1Tnp0=
X-Gm-Gg: ASbGncv5dclsToQ6DmrqE3NgMOY6giADd8VUWp6azSK8kOQGpk/TomPW5mCMCBhU4uj
	ryYKH2K7m0bpLH6mU4pP5SfZIJK50ZVT3+ZKfXIkgeiNWtdvU6PN9QBs91m9EditRa14yVgeJ70
	+JPkKoi+SDVyeXy946gR5bjg6Gt/UVBK9osWBRs0aIkVwYxyD7kWWAoPK9pHwK5SICHtO9yi/U/
	nknfSnV25V1S16vtdg8LZIjp2Yx2G3x9G5c6DwQuoWtsSHJiZEko049qgG0iU6iYFBC7OlSX5vv
	qsKbfIcRs4F5ZCOCBo+kqE5IeUbsAsIcxRxh3D2n5Z77K6nmvBHQ0xBCQyUePnFWcwG/aHmFXiu
	2mKWF
X-Google-Smtp-Source: AGHT+IHC804e4Eix/ozoxmgLuYyu4h8EDtpYTI9mJ8DxF3AanIg+BgD1P4qKeHonfHu4YLobsYIF/Q==
X-Received: by 2002:a05:6602:400d:b0:85b:577b:37c9 with SMTP id ca18e2360f4ac-86495f0f44emr144632039f.12.1745963082607;
        Tue, 29 Apr 2025 14:44:42 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8648c1df315sm42698539f.45.2025.04.29.14.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:44:42 -0700 (PDT)
Message-ID: <8b345c2e-876a-4528-b8f5-fe97abd11cb4@riscstar.com>
Date: Tue, 29 Apr 2025 16:44:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] clk: spacemit: add K1 reset support
To: Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250418145401.2603648-1-elder@riscstar.com>
 <20250421134218-GYA42923@gentoo>
 <95c672f35d6e5e1ac91feaa5628cf4fe@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <95c672f35d6e5e1ac91feaa5628cf4fe@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_144444_313166_A0F03B14 
X-CRM114-Status: UNSURE (   9.85  )
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

On 4/29/25 3:57 PM, Stephen Boyd wrote:
> Quoting Yixun Lan (2025-04-21 06:42:18)
>> Hi Alex,
>>    I'm good with this version, but would wait a few more days for
>> people to comment before taking them..
>>
>> Hi Philipp,
>>    Since these reset patches [3, 4, 6] are sitting on top of clk driver,
>> I'd assume you're ok with taking them through clk tree? I'd plan to queue
>> them for 6.16.. if yes, would you be able to give an ACK? I'd appreciate!
>>
> 
> No. Please put the reset driver in drivers/reset to get proper review
> from reset maintainers. Use the auxiliary bus to do that when the device
> is both a clk and reset controller.

OK.  I'll send v6 that implements things this way.  Thanks.	-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
