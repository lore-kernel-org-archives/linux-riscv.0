Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6FBC88E75
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALROxalkxm2mcysG6qcVpOBztF/pwoh4yEDsILPsSd8=; b=sQMFbkK5arELi6
	j34dNiiQ++6ju8JCasOKMw2TKIj+t//s5zT90CQWh34Wfs1uypVCb6ZVtmXzE2vVGsobvS/wAZ1cu
	AZLFDKSTlbFyTeKJKG+/y7x5bB9DES+vIWrLnNDQXoyX9ah3JBGfqdNVHuIaUhYlrG41hhWWECgoi
	qn3+SLhD1sVj34fV7G+eYx+R45lusRUxcpQZZnB7P/ifXZ32iXLd1bwuDQBXWxlAku0r7F7JQh7k7
	WXUc/znoXcT6fg+RY5q0YtQ1kxgka7qOZ0L+B+gmt3NG4P1QOL+VzmSZ0kabA+HERd9u8b83KC1xW
	hsX7Lxxk/NmPGIKVWahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68ap-000000049wh-1Ic5;
	Mon, 14 Sep 2026 15:27:39 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68am-000000049vk-2kDs
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 15:27:37 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79fbso12864065ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399656; x=1790004456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PfRkneusuDLpVUWSi6geaiexHAd3QjIrlrdoCv9lokU=;
        b=aPBrNaQHj9qN0K5kn+DTpI9lHSvqd2PRZUtLblD+1E7Aana4gRay9tU9uKw44qbmw5
         Hmmu5V4vJd3jzF/zBV41ZVQfb1aAErSp/A0qLaCCDfO+KO8WB0iGPji5IYOVsSqjkgAc
         eZZm4xb5vL1GofH+tB7KhFp9Jh5d3qipuZrYCePtohEng8HZG/qSrD7f47jrdU/da3Es
         KB/ogNMjSFlnoPS0RvL8LMUXLBZ9EdqmCDuYnpbSjBS1099oOaQ8QdNbUjyGxEj36QZg
         N5JwRqG6+XNOr3Qqs9Pb0axGhcSIcyDM/dUWjs6v4TvgmSRFlM7Mp6w5FIztZ2YIV7gY
         3UFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399656; x=1790004456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfRkneusuDLpVUWSi6geaiexHAd3QjIrlrdoCv9lokU=;
        b=onptRHP1Reg4bcKELP5uhxQyrEQrMKxJkDDvOO9bL8S2UWCD3yk26PO5ji7y9lt05F
         uIVsST+RTzbpphSjN0mumTmGoNaTP4WpZrFcra3GNzKveIklTg9MlHzzHxk5ZDnMC0Ws
         VwD63jx+XUKEvDaZ6FIcvaKRHQC8bOYUXQ85IMAKoMlBLr238lKWTdARE/yMdGRZaf9L
         ZHlSZylXi4v8HM6CLUugSIrwh82Uezy47bkvTlsk0MW94eu9+nIYlHGUFxav0DdA375P
         C4DJPsugi9oZkLbZiYp6eTczsVqERT1cSZ3axhwV6sL0xPSLbYNTQnyT/EqnsrvL2w0e
         Jowg==
X-Forwarded-Encrypted: i=1; AKwUvBy4SiO69txWSOd0DMyGnpSruCluz4CwtAkW6TRL0uo9TP4bpADcsiymsrcBN0LTj3Iy0LKyb3XgvyG7Mg==@lists.infradead.org
X-Gm-Message-State: AFuF++ltPHFQbVzcDsrFqoNmcf0DelM8xNHK8LZ+exyEg5w4S8ZktmQQ
	X6okHR7sGauMJ++Wq0/CxlTkGSnGHioH4tPjotL+ftSOsb6OqKgARCKh
X-Gm-Gg: AYBFou3RQQSCjYrGcU3Cw1Jg274Urr3O0NDo1CdpJqKx2ehEmRownFWNKBNl4QgSjyT
	GJBpWkUU3Sl0IyW6RNusf1wRf2rbI9JCSByqgL8RhblvGfS4btNAZ/CDbMDmXZ+13U5HGC2zHBp
	I8JJKIQBpPgWLFastSzZx+EqaCZULTCyM59jjXt8grpv42ThMIZyaK1jeRGjN6UKhIq0ILrWfFC
	Kf2/X8FWXZM6k2MrkSsutmM0hinPAKvJ6TuzxDTTL1ABxjHraIDeE6S/Kt7yaivb4xXvNtgp1vH
	2ElYdGdG5EbtO1mJ6TDTwhxbAxYzcPJQ3c3iQLJU1INqmusb7cndeSFNjobG3pUj+NK8HLOE+zy
	2iH+Y+fPhSV11bROnxm1tf7PWSW5GaQq13r7mEwzxA2hDd3vk5yMg/t5e4IS9NvH2aqDrhjL9+j
	AH2GxP6PVBRv3T3IeGgV1uyRy/c/U+Js1RxFWtNuRj9IdttGXP8Ocg5kZr/0k6B7k3J6pBwwy3I
	Hd88j7RamDS
X-Received: by 2002:a17:903:1b47:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2dd75493c43mr14817515ad.18.1789399655793;
        Mon, 14 Sep 2026 08:27:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce92e99sm51522035ad.25.2026.09.14.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:27:35 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:27:34 -0700
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
Subject: Re: [PATCH v5 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Message-ID: <429a3f35-2ef2-4e92-84e1-be605dfef31f@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-3-522def70acb4@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-3-522def70acb4@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_082736_696338_418632CF 
X-CRM114-Status: GOOD (  11.20  )
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

On Mon, Sep 14, 2026 at 04:18:03PM +0800, Troy Mitchell wrote:
> Add the Sensylink CTF2301 temperature sensor and fan controller to the
> LM63 family binding. The chip follows the LM63 register model and can
> provide a thermal cooling device when #cooling-cells is present.
> 
> Do not provide a national,lm63 fallback because the CTF2301 is not fully
> compatible with LM63. It uses different conversion-rate encodings,
> extended local-temperature registers, additional fan lookup table
> entries, and device-specific PWM and ALERT/TACH configuration. An older
> LM63 driver would therefore not operate the device correctly.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
