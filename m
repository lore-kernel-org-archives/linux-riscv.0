Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F07C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 01:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6+jrxpY8QlHNjeqLCtfKk3/nf/aaoFRjOH6lusGd+Q=; b=c2JcP0LE5A4POY
	773usmL7GHi9NwYuMF8OWiYiG+4zWO81cSmMkGiWTBb5EaXnNotz0SZH1vbHvqDFY3IbfE4B5PZgu
	9M8zz4hQJvMnJjrMSRuouIfqDdsFrpDnnK2sseBUKu3R8Ezi3GteUBClvCzbGp3poSAWrJawnvdAy
	0luQh6JAs2xWk+lxociinaxDfkRaFKXQbl/qT5Ll7hR0FaBOq8QTknBu6ik1ulYo9Bmeq6xk5Zs8C
	U0gJhKkPFkWfANrF7pBEzkxdedLjkxzEnJl2zCBEQWkDKR7EnKbRevpR5SSLDH4SjN/0LHkOBfCIv
	yF/ZfdgYaub+Wm4RgfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1y8U-00000002UaI-22xn;
	Tue, 08 Apr 2025 01:52:22 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1y6I-00000002UOq-3WzJ
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 01:50:08 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4767e969b94so87154601cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 18:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744077005; x=1744681805; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wA0C35qf2r5ulHhjFJvznSvn1eaLA3vowI+Z+27d7UI=;
        b=hziSnrQKZKUCUYShYjaljK9OESH7Z/yjiYPApkjmjlyoDJR1ghY7x/7+ndDTy+Nrj5
         KGP0sxhheN1H4753cI5bAoFWv1zOcp9wDDq5aQSvtMD+n4nQcVSplQTlmRVZMKSM87K+
         xWAiWrWJG3HJP+IfhRDx6U68LwmLomXLuInHy1K2Cf9app3sbG8vm1VKX49KEJ5u8eDN
         b/Qd6n6EbpwGo2YGYzU1tpqdpzMLwZfgWNZitU4S5iXEtZVSIokzQ/6tkv1KI4WiXGkj
         EdvH6CGCGQcy53D55K5P6vLISwHfDKB2a4L2OfIeyh7iIZCFZkCSQkZ2pRP9SlVhW6X5
         2scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744077005; x=1744681805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA0C35qf2r5ulHhjFJvznSvn1eaLA3vowI+Z+27d7UI=;
        b=hzHDPt8TM4su/wOoP2b6ic2n0ng9iEy/E3iya6aYJQP4P38JNkxIDFrOVjd1ww8Y+Y
         KsXnS4yTyVbuU+/jATRWzGNTM5iv4eOQUdhiMUYK3jMvQ7p2SpHpxpdvecUbwGzUcH6H
         zJM2fEHpyPaM4CdD+mrulk4Q3iS5yN1KeNwY+6PcjGlnJKMlTL9ypqaZiZioOfL702ID
         a49A8YSAbDNmj4Kme3ok7JsA+o/aC+Gj1Z+ksC5BEgeWj59wD7PyqqADBh9xGKR6PPrV
         8Ir4/ON8hEbop/JmH1zYCm96TuZsUz+Q+MlCxpxchfrCw62+CCgWDRp3gLnpBQSPJarW
         aYKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjtngVO0gm81l9nU0Qn13ylYlOGPw4aFKgfh5pTUdgPF5rBGdgMb4vjwRtKLxfLiq+GA1Yz2sQaNDfGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YztpHsSe/BS/MF6FVWVYEoLoexi/CGnsqKoaHS4qZP/uC2uiGL5
	sCRol5XD+fte/eCfvlS5epSP3jtWTsoipBC1N2uHVF8x52wfSIsC
X-Gm-Gg: ASbGncsj0Wz4Ux5rphyhUfN8X18EplAkNkIE8G+r9tlDz8uOdnVq4qJwxyrCwh0NiJC
	utp/foHDJWE/Hhle3f/KJ+81SHqf6zUpXJcUEpk3RJl1KK5kODbcp8/oGhYWiz10pG2Ai+JaGT/
	TePdGnqp2LFOxp/HLawoo5Pql3JPfsYPt4OrcHIl/8EMMdrYvnQAZSVC5OWnNt1Jx5IOqfKQwDv
	ly0mrASnhfQS/T/NaSTTH9BFb6LZopcqfV1U8nbe9t20muxaFHN+nCnvNqGYxovo9g33MEV0ksC
	ixuYzLqmAw2WGl+zpQ9txzOrre06cIU=
X-Google-Smtp-Source: AGHT+IGKXt940d2WnT5dZ67Npfj4M6ycvJnxt5e+7ElGZNZ74lDTPp7xT9blL1C5HT5rNhqMbcc+BA==
X-Received: by 2002:a05:6214:21a6:b0:6ea:d388:dc09 with SMTP id 6a1803df08f44-6f00de70533mr215421436d6.8.1744077005257;
        Mon, 07 Apr 2025 18:50:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0efc060asm66725596d6.1.2025.04.07.18.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:50:04 -0700 (PDT)
Date: Tue, 8 Apr 2025 09:49:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost <2990955050@qq.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 9/9] riscv: dts: sophgo: Add initial device tree of
 Sophgo SRD3-10
Message-ID: <4fhs7v3m7qdyfpqxllm5mbxqnr5i2sa4jkqnwkwnuagky7ql3l@q6o6ohvpgu4h>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-10-inochiama@gmail.com>
 <MA0P287MB22628DD45C86FAD169AEAB15FEB52@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB22628DD45C86FAD169AEAB15FEB52@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_185006_881583_D7A420BA 
X-CRM114-Status: GOOD (  10.16  )
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

On Tue, Apr 08, 2025 at 09:40:53AM +0800, Chen Wang wrote:
> Hi,
> 
> I see reset ID in sg2044-reset.h is continous, can we move this file to
> include/dt-bindings/reset ?
> 
> Chen
> 

I do not prefer to move, although the id is continous, it describes the
hardware abi not the software one.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
