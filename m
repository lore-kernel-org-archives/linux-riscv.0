Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B72C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVn3cwf+BKgC5BOVFQ4HGQhVmA3XmvoQqBdir5dc7OA=; b=pa9DPI1ky3nvsk
	i/4LbeXQdu2BfffsYvVqx42hkGnqy6CbKjPSdqUPRdAf0PajB2C0LIEAxf+CReoJC99AgIYS4A3QQ
	CR0pZEisv3D5QovPoQ+tvh0WbinjZ4Z7yOIwlsFr9Ub8n1UK3HVTaoaTrA7I/MT4gxj603bV61DIL
	E6/LALSUlyDzdxN+Sf7s1LqHN5Om71P7xSWIkVnFO1R2Umc6tQ3JeBer39pouoJ+UfHKOvKO77IVM
	OPXXl53pKeZDMRMT77iOT0watPslrSBme6TPpxAqOQjFrPdHeXLC68qsbTTfMT1aGJgl5r+g1tMFH
	fBGXm7BE4s489hCYm71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdlG-00G1sF-0s;
	Fri, 08 Dec 2023 16:31:34 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdlD-00G1rb-2x
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 16:31:33 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1feeea75fbfso1099267fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 08:31:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702053091; x=1702657891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0dh91LsH3FMgzR6j6ESovfFZbs4+hPOeOOy5RhBvXI=;
        b=ColRoyvl4jeWXEx98xp9av13IAOdwEDyxVOeJ1vVBUdlhzbEn4ZEO8EnOAG89aifx5
         +oJdEJGWZ2DfqroImQJhv5a7jsWxWgX6vRtgLlyuTjjLjc6x7JU8hjBYDAB2VeRVEQrh
         7rlry4T+kEjYFV2RZSeC584kOSdZOG8ofdoL2osZ/u66YN6pr/Bm6UxnLqzJkSHQ2Itv
         RfFVP2QX+VFO34rWC/ssyv6MbujyKO0CZDvgJOVLcInimOo6x5qAmVuBzYuZP+8dJiEf
         TBs8a5cNbDgPOtj0sEfVBPhtqRx3HT5eoIRHPtBFNSS067ETSv6Ccvb/HNN3kXBW6Fcj
         DiwA==
X-Gm-Message-State: AOJu0YyEr0NV0KMtnCBNXAwHh2Ddt81xxMUF1uh8bMvhKPrKYlh5+ULQ
	ujjBSMxhZbCj77dobHZ3stzFDXSlhQ==
X-Google-Smtp-Source: AGHT+IHDm3wqp2WeSg6dUcKIT7qXKxWAFG2zul4H7tfMEgrUVi5XlJJQvhg6VUWNouCkEz0LkhH29A==
X-Received: by 2002:a05:6870:700a:b0:1ea:c913:3494 with SMTP id u10-20020a056870700a00b001eac9133494mr394403oae.6.1702053090816;
        Fri, 08 Dec 2023 08:31:30 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id pv21-20020a0568709d9500b001fb4dcb74ebsm455362oab.54.2023.12.08.08.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 08:31:30 -0800 (PST)
Received: (nullmailer pid 1679055 invoked by uid 1000);
	Fri, 08 Dec 2023 16:31:29 -0000
Date: Fri, 8 Dec 2023 10:31:28 -0600
From: Rob Herring <robh@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com, xingyu.wu@starfivetech.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, palmer@dabbelt.com, p.zabel@pengutronix.de, shengyang.chen@starfivetech.com, jack.zhu@starfivetech.com, changhuang.liang@starfivetech.com, maarten.lankhorst@linux.intel.com, suijingfeng@loongson.cn
Subject: Re: [v3 1/6] dt-bindings: display: Add yamls for JH7110 display
 system
Message-ID: <20231208163128.GA1659919-robh@kernel.org>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-2-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231204123315.28456-2-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_083131_958461_9ADBE94E 
X-CRM114-Status: UNSURE (   6.42  )
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

On Mon, Dec 04, 2023 at 08:33:10PM +0800, Keith Zhao wrote:
> StarFive SoCs JH7110 display system:
> dc controller, hdmi controller,
> encoder, vout syscon.

What are yamls?

I prefer not using 'yaml' as yaml is lots of things that are not DT 
schema.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
