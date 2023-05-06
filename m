Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAEBC77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2qD+CoDYfj1DLnfM+yNJTqU6MWVUG9yPXCTKvS0uO0=; b=xGqNeItf5caI5o
	6M8TJ+zp+F96sNdryQAEZKDmKO4thChth1/3NGHBUdcwy/hvpj0as8G1mqLVMNopN/brF63+7dhBN
	jV+1NHVA+1SAwbZlfYXkFGbU/sZuUQgae3EH7KPibbI2ZR6B/7OaisfnQhbEGNoqo8AVbowycBZiA
	bn/QVATw3zQlOX9mqEFYr1ykoxj9ikWrdGfdCjJ4sxw71mmojb/2gH4ClwCI7qgkb58LDetVfUHHw
	RoLRoWQh0pqlO3wgWBK9D9JdFMWEwHZZ+aSH+jnmh2HpojFqdEEoseKdTfoJxyYp0SBOCuoQy5RXY
	RlqPN2eNOH2OPrhtaeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvHW0-00DU1N-30;
	Sat, 06 May 2023 12:59:56 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvHVw-00DU08-2L;
	Sat, 06 May 2023 12:59:54 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bd87539c2so4432128a12.0;
        Sat, 06 May 2023 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683377988; x=1685969988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R63ySz+V7ttCFAv2NgG95z4OLLtMXFqMOA23r5CKM3s=;
        b=ZaTXIxnXuWngC2EDRE6syeFBaz/BSK6g+5+DWgtqjX0vVyDFUC5V7KXPWESgkmlQBl
         RaQH4e7ri0z5JE2HfG73a6c/CA5xV8xT3vpeZdFNyw/DCPWG5CbN8+Ra9NYec90sa2VP
         Jp/t+mr1Vlu/Q9LqjOZ2a3YfI6BRSngcc2ZoP2+WsYcrINAM77LmvNF81as/t1n8A3fb
         AoirCUNp4ehe6D3KE7ZoHf2t2OW+w8SwrYW/5mfe8GpZMemC5fI28VKXiUWSCIyBaraO
         fkIJDpc4okhQwYIK/gHpm5G+SD5IY1gBnUiN3ecr1JANwwWPZHqB0KmxzvczMG9UTPFj
         gzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683377988; x=1685969988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R63ySz+V7ttCFAv2NgG95z4OLLtMXFqMOA23r5CKM3s=;
        b=YyJll8wtpJLcalnS4R983LD6BtO4D9o8+EjwumzKIKx7cqRXwRJMkUepHP4UE+o5xG
         ZH3eUtyXKADKtuhMLlRbJC417lTfyCx77qAYTkeHhc6iFD/RR4+jQFJ5MY09bI4ZFgWf
         W55UIA61ciTjxE4z2c1zAS5idpUqYkF7ZGcYY1fHiFNeua8LQeUkzTu+gymNapMKbCKf
         EKgzlpOlYVifml+SN9vq8CCZRRg8toJqvxa8DoXsYqeiLU9RYWuwglj3OgFlANJ8iA0l
         8uxGqkB9/YQVWjIQsfhE4jx9E/SNJeYReGScbVpv9XLOiZZEd24CYgpzHTvo/Gch4FbX
         zcAw==
X-Gm-Message-State: AC+VfDyLH6kitg7zTcPzqG6PNKpvVwhMQIvIoEpA4GUALgjvJvLp4oj4
	rpbQZRtaGrCjyYYlqrEFBqZa+D4khAFY98wuPcs=
X-Google-Smtp-Source: ACHHUZ6DkTuVM4bTLPk7/b7rUBOl2lOEsBgignS7yOAg+Qy4rPo7Ev+AnOErulzJoivJRsJSH9JfWH2dEpM0tr2qvAc=
X-Received: by 2002:a17:907:168d:b0:949:55fd:34fa with SMTP id
 hc13-20020a170907168d00b0094955fd34famr3968057ejc.39.1683377988143; Sat, 06
 May 2023 05:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
 <20230506073018.1411583-2-bigunclemax@gmail.com> <e38cbcdf-5963-fb00-d7b2-66d4129f9fce@linaro.org>
In-Reply-To: <e38cbcdf-5963-fb00-d7b2-66d4129f9fce@linaro.org>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 6 May 2023 16:59:36 +0400
Message-ID: <CALHCpMhp07DwL+cUZN8rwa1N_PHQ1KstOB+Gw_mCWFzm5rSVrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329 SPI
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_055952_790243_C159E6CD 
X-CRM114-Status: GOOD (  11.04  )
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

> Should this not be set up as a fallback compatible, per Samuel's
> suggestion here:

Ok, I'll do it in the next version.

> I wonder what is the difference of DBI compatible. You refer to "helper
> functions", which sounds like driver... do you mean some parts of SPI
> controller?

According to the D1 datasheet the SPI_DBI controller uses the same
registers layout as the regular SPI0 controller.
But also it has an additional DBI mode functionality. Support for this
mode is not yet implemented.
So there is no difference between 'sun50i-r329-spi' and
'sun50i-r329-spi-dbi' controllers types in the SPI driver.

Maybe we should drop 'sun50i-r329-spi-dbi' compatible struct from here
https://lore.kernel.org/lkml/20230506073018.1411583-5-bigunclemax@gmail.com/
for a while the DBI mode functionality will not be implemented?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
