Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF9C77B7D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 21:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8yGEPPMN1cJ3rvS26zB+yR8OK88NexJrrzrcutkYkk=; b=ue+/a3mip6p2pZ
	JFQW2/3bTY0gYHL75IgLG1eQfD8qlVr+BU9C7qRAckWyD6es7YTcvCCENwlEaAUCW59Tz8eB7LHp0
	wopvPrHvR2WNs6QOhTShYwPZp5cHHXDf5/siLJJi3GvAJQ9t5i2dlamE8KRmF1U9JXbPh3L+d2HIG
	VYeDmYFnHQixy2JBv8itiBnWTGveuX9KZF/8SEiaU8Ycs5FolZjt2daHiaAzULGfGfQAcDcqmXpM7
	NPHkL0cfSiHVOUo6XFEwZsQqV+dwvxzaYyjsle+QoXuMnu5fWCrQEZnRZPRLN2hTYOXrQA94usZ2H
	+rxKzJTM4zFnJZs0/DbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv2vb-00BptI-04;
	Fri, 05 May 2023 21:25:23 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv2vY-00Bprj-0j;
	Fri, 05 May 2023 21:25:21 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so4034011a12.3;
        Fri, 05 May 2023 14:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683321914; x=1685913914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PVt2/GzWyz5Ess7y+OCZ33ZvS4WPkfBPz+s8yoY7/9o=;
        b=cBhPsq7jc79GPzYqA9o+PUh5onUk8i5uaj49kXEhrw/1lEyz5LxLW/7/fVWlojfhKK
         F/8GRStnKtjRe8D3XJpOieqLlOBSAwYFMxUU2YiPGwfDQNplUTfZ6jz7LmZrfojhrFMY
         Hhgj9ov39uVCjETc9guBXenKjp3+W0YC7xT/a2TTlJUk1v3MOK5XvT/UChQYX39DE3il
         eWK0qiavlThnGZPE/Au01gwhHp1NVu1FD8vgzIc4J5lZGDsJTMlLe6zvM1IxGyT4fSS9
         Hr7e/LSBMx5Ek302/V8iR0+9eJk3iL7W9Sit+dXKZQl+iXl+CLuhGZrMbWYbr1rJGWBL
         N+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683321914; x=1685913914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVt2/GzWyz5Ess7y+OCZ33ZvS4WPkfBPz+s8yoY7/9o=;
        b=JW47nCl2FP5El7RAazA6ucD5oUugm1GszhKVIR3q2H40dMsxPU++6iZu6WooNtRTGC
         Cragysp4qqKMx9RgGRh3QlLuCJYM/HYaxju1NMVKZSZEtFqOEnPDC21KlyT94/pDimbL
         Dp3t7RArxQTodjWAiVZVjQvcGW1FQ7ULe/b6bOPZfzAo6tAb+W8H7HC8rrykQaAmb3++
         hLXTvyW7uQZgt9Q4Db06EopWfeH1jSSoxac1KRfKnYc8A8aA6g5EyzwHrrr12tB4a/gM
         zFViEy9plHzCdjt5RWbNlpyytD0Z8uRJNzZFlRxSBTj3OZ/vrB7qqlSoyJw78EmS4GTa
         rN4A==
X-Gm-Message-State: AC+VfDzHv7t6N0ictprkUtodToY0RjEhfBUYTmwgUMkEMWeVgvw8NNwv
	u4wIkxTTU1j8ti4XxQHdLKyQCzaGvM8c81lL5s8=
X-Google-Smtp-Source: ACHHUZ4uG8c0N6L9crKfvVhzWNWIj4OGzXKzRUKG1CM3TRYjrUABbTN/yhe0vAftEiN/MCLVhaCovH677AnMW9adMYk=
X-Received: by 2002:a17:907:d86:b0:953:42c0:86e7 with SMTP id
 go6-20020a1709070d8600b0095342c086e7mr2517436ejc.4.1683321914389; Fri, 05 May
 2023 14:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230505074701.1030980-1-bigunclemax@gmail.com>
 <20230505105805.548d1a1b@donnerap.cambridge.arm.com> <CALHCpMi8=t1bMceTOfZjh7aKEQcEEpfeG4wi9pB=5o34Ca+N3w@mail.gmail.com>
 <20230505170015.664c18bc@donnerap.cambridge.arm.com>
In-Reply-To: <20230505170015.664c18bc@donnerap.cambridge.arm.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 6 May 2023 01:25:02 +0400
Message-ID: <CALHCpMiwqkMRV2Nv0sKG8ZD2D6jbjVaB6_jcShf6hMBUP3D3Dg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
To: Andre Przywara <andre.przywara@arm.com>
Cc: robh+dt@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	icenowy@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_142520_263651_1EBA3FD3 
X-CRM114-Status: GOOD (  10.52  )
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

> Can you please try these patches, and use:
> compatible = "allwinner,sun20i-d1-spi", "allwinner,sun50i-r329-spi";
> for the compatible string?

I tested my patch (with compatible prop changed to
allwinner,sun50i-r329-spi) on top of these patches and it works fine
for me.

> If possible, you could revive this series, and add the D1/T113s support on
> top: just add the compatible string combo to the binding document.

Just one question. Should I do it now, or is it better to wait while
Icenowy Zheng finishes work on the next revision of this series?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
