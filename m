Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA7DC88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLcCKCf49YLdM/ow4CEKjYJtHRFitCWrCMwjltquwSg=; b=o2b5dwPTIfeRBj
	JpjIak3Fnskt7xQGyk90tcy5sdOeQ4X0rl60DU3QgIzl/AduS2fWAd5HgsmMeqkpmmMDbS5og/2jX
	64PVf/w/u7iXbtIeDoRcbaz15WVWC9Isp6q5iKJVvjKA2Pb8WlOTEGNZAJYJfWo+Rk5M0UvpnWHKW
	FL8c1VGh5mZJMOy2PloYwIP7SBAB5pI3iXOt7qkLHnmsIh3eN34NLRMuwE2BYYZOWfrxzUeMoIen0
	D8N1THN/+t+f51KAkuvRN1guMHnunxU6YXjezLrv4DEwh18nk5H0SJ5s7JZmCoeHh7uq8/c07Gqmo
	hq4cBF6BxcanwxMpXbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68aL-000000049lN-0SBm;
	Mon, 14 Sep 2026 15:27:09 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68aI-000000049kL-2mwL
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 15:27:07 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79fbso12859475ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399626; x=1790004426; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rv9xIW83dIFufmAMVUXAe8Zj75CE5o/0qI0POtGfBo=;
        b=XQVGzZZ2tRwhiXkfHsSS3m5j5EKMO8/gANy3rgrwUTKOOYFb95Aq5ho8D7SWO1lPr2
         IbUWKEEjlKE5+dnCc73zK/FmDOTNm93KK8AODIV79MxC3qWql/8hifXbvRAP2V9/3etN
         qNc6ICK+5b0z2RPEXYA0CGYInOy3S3yeB/p14JTIWLiwtsm/+9Jgjmx+YowFAzRAAOW+
         GaYQM11nDlkpoBf7O05fp0jf31uq4UuBMfTiwzgLdyjCmuFu/jNJkYjI15foiXuocR0p
         gExmvKiTk7RsCnKzBsxNxq/Zkin7lJZ/R6fOhGy9R68m6FCSEUewcGXyai1T7lHuXG+0
         LIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399626; x=1790004426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rv9xIW83dIFufmAMVUXAe8Zj75CE5o/0qI0POtGfBo=;
        b=k+yu0mpSRgKihL0SVSPGly2tgMJFYtMTmV9PYiIGtMc9KZIhM1F1b2e+fsZDlLU4oJ
         7IN5Y5KpJsMPh3y3o+rHGVMauUgWglxYOvIGrjEPh6hzYspFhh4rdiUMJ01A5z1Rjsaw
         vYwvQ8kJmznEhpNZb3IPy3K2Odh2anaaQ4ASzCu0V0SGltrJrx+rZY7hhjPOa/yaxJMP
         JYUCHP42CnY+63Lbwr8P5my57WPaAh4ZxO72ZVNUN2Shf7XJCZXjkLNZpg5BYxtvs5dy
         HFq9vn1MXonv4Y/sa9XWRrfbpRL+8eCw/Q3+LTLs6kMITWggHnS5i+7DGB39iBpp50z3
         vy/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxagj984j/QcRJGbS+w6bmcNkL7lJC4gFcQOQLKiRaPAQXjauH1LahO/zYda9LTaYLcJDkf7kIcKpMaSg==@lists.infradead.org
X-Gm-Message-State: AFuF++mNsU1CkqUnDf2GlV5mvF8OwGEXuigxpQiypFecNH+qljZUHHJe
	UmZtslJJU/ZWqHoyxGhBUkPxQEmovMrG0QF23WT+U6WNicseO3xL+8NG
X-Gm-Gg: AYBFou2JeRXwSJyY+QO4Uul3FrlO9m3lVcfGN4fzPo6F64ol3YEOxHoYiHsTrTlRx+q
	2wjNzENgcFJQsGX3KnT2M5xmm+o+GuSZ6eLbxUVg48upt+FGI78jkgVFIwzfFOJKF+cl3jZaq8W
	0nA1luRJysyIIB0hadl11FzhsMYj13eZdXhD4TAD7Z0MezC+UiBDsDOTbLUGSFSOV0Vnqj0ZRqE
	nShKGEvLkzBWp2SlfZllSOYqPU+9uKpTNrh+FWjF8qz3uJGshmx7r3g6KQCN3QQMQ+pO6xkrDsg
	9l8CO4mpfKbhpwbdQBUzAUG8q8Il31SC9BhZ7ZFtoDpyrTqNOprDhNBEwtO/3I2VBZFbW+r4qiK
	sh8suKykGe8D5sJFr1XqPq87TtqKcr/D7T/STDjFJcb77o4rOorTNtPp6fd/0iDCH17YWvIkG44
	nlj4Hgx6nIE/6NqPqJUfg+dGm4SCwwB9N4mHssRG19a2Tnz/HnHzMFd5FneZc8amCMAtIUoLA8Z
	3RJliO86BE5
X-Received: by 2002:a17:902:fc4b:b0:2db:257c:9fd5 with SMTP id d9443c01a7336-2dd6c70df7dmr77776255ad.16.1789399625921;
        Mon, 14 Sep 2026 08:27:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc56b1sm51774945ad.54.2026.09.14.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:27:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:27:03 -0700
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
Subject: Re: [PATCH v5 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
Message-ID: <f9a4679b-52f3-45ea-b451-26c27dbebf1e@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_082706_721694_C02A41A2 
X-CRM114-Status: UNSURE (   8.74  )
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

On Mon, Sep 14, 2026 at 04:03:54PM +0800, Troy Mitchell wrote:
> Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
> of trivial-devices.yaml and into a dedicated binding. Describe their
> integrated fan control and preserve the optional interrupt used by the
> ALERT output. Permit use as thermal cooling devices via #cooling-cells.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
