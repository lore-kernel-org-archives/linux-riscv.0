Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D03C5B572
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hY6Vg/6EYCNnm6JNyuMrj8/99/on9d1wgSbSbH/sRSk=; b=YtrQq/ZvnWz8wj
	XCniZ82DtkPIAq+qL/mpD+OBtjDgjklJ07IkNWq8CmqEvK0VJa/WgAuiU3KkjJB0+YxWNXnMoFtaC
	ijdsxFkIMgEZFPxYtwcaBq3O1MHxh/dX8HEqljJdRTeJNXq6nH8Uud+5dl1OoAezPgpMfSQUPpW2P
	848teDcfcd9RCcD/y9yZCOdpW0N9gv4cErr+X00pOTEMpA6jbGGkHClRD9f6Zu1xiGjrnYF1nanWg
	pSAmWs4/gEFS2lGr5Medm0xX8g+XkfkYM7lvxaSRca8ieKrFuFs8ZX5J/O4uxiaH21DHcSFVmEbt2
	maT4GpY40CP39ANzY1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu84q-0000000GC6x-0p9z;
	Wed, 12 Aug 2026 12:29:00 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu84n-0000000GC6V-36mX
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 12:28:58 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc891373e0so14624075ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786537737; x=1787142537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPkqpQK/eCI2cRMpLKiUTi0EsWR+uqYYbKQlHRPEe9c=;
        b=NtuZKZ7bA9S3MQqnEh5ot8/lF3GYCbS8IezC5/91M32ERe0d0mdkmbi/diYL71KZgz
         /neS8Jbd+2EtM/iryBrMpqwn7YfynKQ6cAy4DrJu9ayRo0v1OWpUtx4uAZBPSR80DwZX
         sp5norR4LhTK5+fHYdZ5kicZG0u0WbJi5B9jQfrCUVDcah/EeCPv1ZN+cEIMROSXOujg
         9TgZPPJrREHDcCz/dGy2soMdvcq25W2Nm2QIh+1etnTVB7dtYZcNo7ggaHP+sOH7qlEJ
         VU2aQxUM3u3gkusssNcmDGz0+jnWllEVzEJ2V/pu6G/CXaShNZnubkXK+Kv4yT1cNS2F
         tULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537737; x=1787142537;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPkqpQK/eCI2cRMpLKiUTi0EsWR+uqYYbKQlHRPEe9c=;
        b=bxnovdnKtojc2lURjID9bz3ivsCRyt/dY/ooEQxE+emWDTat0OP7DBuENR/ye6DdvX
         PAzBoQ45ISdUZxUCnMQu/CvEqycRjEyg/ZVWzHi0pkgebpDz9Mwc4kZDC3QonMxJTubx
         5IW71FOdrc8UubuLDd726tF7q0T0VHqcjYePxfGciTHk9mf3PoRGfMZuXo0umezvVBIX
         pkrZVrsSGhnCAx6GDPXQJnw/BpyJDiJxj9pDZ64Ix1Pyw2LAL3difAeUGFAsnMNFX5rF
         ZswulIN6elZXrWMtFRi8L32rSG2TUjB3D7/klNFd7dxlq5QhWMs6wivP9480qFFrL6j4
         repg==
X-Forwarded-Encrypted: i=1; AHgh+Roux9WPbT+9IDwui9r98H37dkrCT/ULz/pv1boao4JqSwKJlA/GQflv3Tp/gRkR6BJMouzAFhxrB+lvrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOILQhmEO1uts8YiM8yCMNKp5TJQuunzO+EeN3sKA3gy3alvmz
	1YptpM/67nQieB2bpOYPnTzWpAQ9ZYM24gOe6axV4pGPUkzCKb9iyqOZzVvmuAJKBPU=
X-Gm-Gg: AR+sD12O2DHtZ/ceRXEE1LjzTRNq6BRj4pGhATMyR4kQVAVx//lMNfUYUUak/ekrSuV
	M9yQq9QflqtwitCcDP5f1615IwVTv489loidPY2U6baAN/YUWPwWarM6gd2QyIhsuGgBvE7Oydz
	1+3M5GGimdbirXxI66E42ccBdaZkMViv4yVLMCHvEUFqTQG7KBklX6u/suHUD74PUGCqHRTaKe6
	4qdTs/27J02SBAXYC+N6htB49smkVxN02HiEaT7hjuXmLJc0MZb8Uo6lRvMr4OG15h3ffE8G6NK
	r/IHoyneSQrtwszKDW+zBnNPbRxRx+9bUzleWALBG/3VMGLYalnEdttcOyaWvI7a22Z0dXCbIY1
	6yr52vGLAZ8FRNDxDJ++zIo4LWnpOXZu1naULTwMm1tPg+i92K1b8t8NSQAvnGVefkoF3AKNxZj
	0PEGkYCpd7HN8Gw+uYxEsfDXxotgcfHMrPQ27fVa/Sz5oVn499eMMeGWrjTb9p7UrYb0KNqS0=
X-Received: by 2002:a17:903:2a8b:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2d345629565mr62290465ad.21.1786537736769;
        Wed, 12 Aug 2026 05:28:56 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d350fb02a3sm5735585ad.6.2026.08.12.05.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:28:56 -0700 (PDT)
Date: Wed, 12 Aug 2026 20:28:45 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, samuel.holland@sifive.com, dlan@kernel.org,
	dfustini@oss.tenstorrent.com, michal.simek@amd.com,
	junhui.liu@pigmoral.tech, darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org, zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com, pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com, jim.shu@sifive.com, zong.li@sifive.com,
	greentime.hu@sifive.com, robin.randhawa@sifive.com,
	scott@riscstar.com, dave.patel@riscstar.com,
	raymond.mao@riscstar.com, anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [RFC PATCH v3 3/3] dt-bindings: access-controllers: Add SiFive
 WorldGuard Checker
Message-ID: <anxm/dqmZ8J0v4aE@plin-1878>
References: <20260812122131.1534906-1-peter.lin@sifive.com>
 <20260812122131.1534906-4-peter.lin@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260812122131.1534906-4-peter.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_052857_780071_7C5680E0 
X-CRM114-Status: UNSURE (   6.32  )
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

> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "#access-controller-cells"
> +
> +additionalProperties: false

The wgChecker is always an access-controller provider, never a
consumer. Using additionalProperties:false prevents consumer-side
properties (access-controllers, access-controller-names) from
appearing on a wgChecker node, which unevaluatedProperties:false
would not.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
