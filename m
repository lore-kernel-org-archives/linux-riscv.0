Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDC1C88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIxzUYLCVI3o6WuC+gj7wNi8CwB22v5KuzbEfSZkOHg=; b=Hh/KVGUAl3Cosd
	mjMwt+PA9nqF9S+QGsxlxEh8FZWzl6RqajrXrgxSXXI7VtWHxu8khRqun5pMbq0TKhYW1hBemmuVS
	mBajNiKc+V6465L6ZOd5aRnmGeTfhPiQvVjkhdI7d7V8Uhbast2p+azbZiVAm0j4ew5LB3bB4egFq
	fccAz+y2hDM2ZJAthFIoFtsH1n8LU9ZlLoFIlAdHMguE+8iC3yHGCoaarcw9XsTpcV5L+U7P1mWj/
	w5n2mhL03BQGtYYkGG74BwsPS6/sl6ZqmDaWAaBud19wuBPGi0Viljcj2MwcejmHrLRCcwsf14HQt
	8wlchR7KtlRLhsI/QXOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Zv-000000049ef-3bj0;
	Mon, 14 Sep 2026 15:26:43 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68Zt-000000049da-00wQ
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 15:26:43 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d90ba1d807so30379565ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399599; x=1790004399; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=WLixHfMHBi/6GZlZiZewcEI020Q6RnijvzoZGh6zwnSh4I9ZfBjmuDtrfMLD/dIR4+
         1mqYrmNoCwj2Nf9DWE0CkFbm1+wIuc6l0nmKLyRW8liahQ/Whfx+xVUDD7WgsHS17etb
         xjW+SQOTpx9GadUN4rbXQk8NAJYqMmFrzct2Y6Te1h0hV3gnFUv635MlA69r3Cm2UXuH
         jk1vEOU1OaXJD8WdQLfoBCsadaWCX9cf8RIayYoW9rgkOGYyyToQjKq66GPL+nZxUXiM
         ESDYWnOjfE7VovnP3+RC7xJTm0HDGiweKKEk8dAI8nXmcosJ+Aa0YQpGjdfBwVvMWfHD
         MyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399599; x=1790004399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=n8NuZBYoP+izjMxCoOAC2MxJ9gHB5Yi4VmNwYeCQb9olyBNxngGvc993LOsNGg1gIV
         2mG3X9U3jSGY4EdAfoVdpZ/b4V604r2CStyobIQw05NuhI/ey2i+ilhoJUUwg5mspMie
         ez5ISI6cqkjvUl75ufq0WJ6ejFgMHmjHLAZtjPhFKCbSIM/fupBGB2ZsNRqug44JLJwj
         xDPxo9elIFyA7wdmJM4cEMV948k5kNfxb1Df92uWQsGW5tRLH3+jNGtkePwLXTKbepyy
         PBL+Bd/sCImYHHCseC0jcB1CMTk0FI7SXAipVqui+2w6cYoO7tKz8LMgw6UcuGypd00b
         kM7A==
X-Forwarded-Encrypted: i=1; AKwUvBzjW2RZXgJB6kg+NVmx+ujQTNtcXkq+EQOuwdQoyyqbBpOI3AGpIlOUDgdg2ch2jZQ+NfUQ0DZ8Fp/lrw==@lists.infradead.org
X-Gm-Message-State: AFuF++kWIRGUTvMl58eB9bZIqpQOCLlAUvRWTaKkgDWQVrPFy8wzNuQr
	rRveWjEJgSLeGMVR5cKpsYiVyVm+HBSzHuGhMyHRp1XolnjAJmdnuRSPPs+D0pzy
X-Gm-Gg: AYBFou07IuybAZUjDf1B8Zr5IZpQanJqPsvyIBG2vn6kucUIV1RfS0FUb/RIBa0VSlV
	d1TuI3gScW5Yr4Y3Jsff1BMXj5dY6H3X8UQ6PVTRxdjiBPuhgOduiU52mgzmLQwpHrmVXmGUcR5
	j5Ui0zsnMg0vUsjrJ4rTZU8g5EGRDfkOIzHn5f3RUGDE4qgGDqbio0gqzj6C1bjZpwL7Nu2eEH5
	BRoObUZeX0+pvX7PxTKjuU3/a5x9DaM8LD3aoSvkKVWjUPaXKW35Ol2r5PNSBI2mHz8rHAeVB+c
	uhuUppD3Yv2tUdESgdKbnqeBEQgTK28NfNJZ2QX050KEsunbLbirfG0JDwb1CgAPRJbw3y1aEZ9
	UXzNt0gAaGbkwe8ZRB/Ty46b6AdJHcSyUHsOgihXm3r0MuNhLzMMnkD7o/XS5FS/CHUVIRj5d/Y
	VEVweUA1ObSp/QOUgkzIzQXoXKkVzgjHNRmKWUhVecv844UIEfpCJu/NUmEsaq2vwKEPjb+JHv8
	G+JRIs63VKi
X-Received: by 2002:a17:903:35c6:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2dd6c6c0cc0mr59735695ad.10.1789399599255;
        Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfdc15esm51211505ad.66.2026.09.14.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:26:37 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:26:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <35ea8534-5446-40fc-b1a7-72a115bc40b6@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_082641_043174_C124E55E 
X-CRM114-Status: UNSURE (   7.95  )
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

On Mon, Sep 14, 2026 at 04:03:53PM +0800, Troy Mitchell wrote:
> Add the vendor prefix for Sensylink Microelectronics.
> 
> Link: https://en.sensylink.com/
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
