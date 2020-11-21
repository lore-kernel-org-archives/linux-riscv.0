Return-Path: <SRS0=Y+49=E4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EEBC388F9
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2020 00:50:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9620207D3
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2020 00:50:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EQwYo81v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9620207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5x6zhMRyfZz5fvEY2y1Yua0GkrMNA2kBxvOjk07fxpA=; b=EQwYo81v4SWontZVw8jw3hvFj
	PMFjzkSzLvf6xgyRjAN3KAu6297q1fGZKOIPiSurTsWr2Nj9NHBNd2yeFqW4K9n+Fk1adgpall8bd
	0qde14tJ/0B7DcatISa35KxlqGklBhYwrtd/tY0RMcFuCwgG0RGJwYIuPE+vclu4xFK7GZRCLePl9
	/VYuBnue2KxHHGjDpJBSZB53BtDI/rZYfQvOpc77AHYdBDNJ3eSo6HJerKe8wYbtu06pJuhDvwmFO
	BfHAynlUoA9xKi1M9ttSRTQBmovBwD/h8NWgXPw1IU/NFmJkBi7be0CVV2eSfuP/i2sCbqMXzCpZB
	yj4WzAPwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgdZs-0004hx-PX; Sun, 22 Nov 2020 00:50:04 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgdZm-0004hf-5n
 for linux-riscv@lists.infradead.org; Sun, 22 Nov 2020 00:49:59 +0000
Received: by mail-ot1-f66.google.com with SMTP id o3so12559357ota.8
 for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2020 16:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zT5nsXtgRT2unke0UjU+1nY/84bCqRoQDrr11fu7upI=;
 b=pt3BO5fmz6M6js5pDqesNgAuAYtmQACi8UOr4TkJeEXZ2rtxc+C3p1NvCFumHuAjpB
 LKLH8m9d1cJazY88vs12T7AGlqJwmVyKbgzAfdF/f1Sx56vBGKnsfJOFtaGJN6yyMNN9
 bjKgNVwcX+mCl0nsjb7GsA3iYcexvJfjnZNehsVFYF+XIFCp4e/T8SEv6kGx4gqjwMvY
 MRKFFDphZnNaXN81z35OzAqdyQAMpBHPkfzGU4QbekdU3C+rE8quJli9OjUn8h1MNaTf
 p600sl8XUG7zGFuo0E3/rQUcwLZx/SEFukadC6mmftnNifcue5x9AAhvp4uc/BqXzke8
 qrcg==
X-Gm-Message-State: AOAM5314c0OqmJiu/1gt8LXm6xZ1THLP7ymSiYMSZuMCyXn/562pYUZG
 +hVf3oSTVOXiVSCh/ZMld1TjhldG5Q==
X-Google-Smtp-Source: ABdhPJyi6QF+v9vmlx3hcllz6h1KrSCTbE0w4UYo9A5MQQ+ajL0XRK+lVCrpTxHMBmU04hODW5FWWQ==
X-Received: by 2002:a9d:3ef7:: with SMTP id
 b110mr16411634otc.333.1605963487924; 
 Sat, 21 Nov 2020 04:58:07 -0800 (PST)
Received: from xps15 ([2607:fb90:5feb:6270:cdf7:680e:59f2:6ccd])
 by smtp.gmail.com with ESMTPSA id a20sm3071403otp.54.2020.11.21.04.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 04:58:07 -0800 (PST)
Received: (nullmailer pid 2085798 invoked by uid 1000);
 Sat, 21 Nov 2020 12:58:01 -0000
Date: Sat, 21 Nov 2020 06:58:01 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/3] dt-bindings: riscv: Add DT documentation for SiFive
 Bus Error Unit
Message-ID: <20201121125801.GA2085750@robh.at.kernel.org>
References: <1605182457-86046-1-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605182457-86046-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_194958_270053_E5D935F9 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, rric@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, sachin.ghadi@sifive.com,
 tony.luck@intel.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 bp@alien8.de, james.morse@arm.com, linux-riscv@lists.infradead.org,
 mchehab@kernel.org, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 12 Nov 2020 17:30:55 +0530, Yash Shah wrote:
> Add DT json-schema for SiFive Bus Error unit present in FU740-C000 chip
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-beu.yaml      | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-beu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
