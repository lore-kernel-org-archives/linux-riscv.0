Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F97CC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 09:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69i+05L5YcR08ZGhSjbeVbaQwR7ztooi/t56zvMlC5c=; b=tsl942SW+htHxY
	J7EPP+WMndvyNVsjVokp5ykof9cyv3ufUyqbHEL8sX+XHcULjyxkRzCxUuguNbGpRw35Cc5W+M+WG
	XGOF1Z7IItAURUvlSCP6BohpeEhPcuGONyq9ALMxCEwBa3uyE7UcmmlxED6otX2mFHK6byON99dCg
	8g9vuJD0EHEgX7zIJ4Uqx1Uv8cvSvZxeKOLES+hKXABOQSrtkyqzFt6VTBUb5YGfuTXnJfzSz7CWP
	eEXSKps1JM8x8PwA/TW4pi2gib4EFYRhb9q1YFii1rar1ngRegYEtqx7c5g1XDwv/r18rcWSQih1Y
	+m4wKAQbni61qtm1eJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHNo-0000000HDKp-2Oxi;
	Thu, 15 Oct 2026 09:04:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHNm-0000000HDKG-3IOz
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 09:04:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so4166493a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055054; x=1792659854; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAp8nRUf9PkjRjYtrHFE+R8uyBzEHqKOUymE8wD/INs=;
        b=Awjt6MA9ApPXRLKxJXDynjQ0NindkhJubFgOzB2jSs/vLY5mGHZ5ZEMF0K8IUV6KYa
         pa4Q8hJMkizDayrRVAcxmd9ktjSN5bf/MbuNZt93ZcQFFNI/VyORN+FG0cmyZ/hG8ujw
         IIEkiJUNXASesrFMv4mOvPIhKdeZPfWzJ4YpDmQZbRnn891XZByxqxySmc0WJdSiuoi4
         6Lb9Qat/nJi1dRCzSqJmOzdbn7RHHHN0YTSDb951H3mXfMWMzh/EYnLmqfs1OBFsmYpN
         ngzn6Sj240N6bU6ZhmbQhmxNkMKuSwY7nKHpNrFej27tdmGQzoYHMz/yRU6l33SorFJI
         nmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055054; x=1792659854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAp8nRUf9PkjRjYtrHFE+R8uyBzEHqKOUymE8wD/INs=;
        b=CPEga5HKl+v3UJYvkfcAwTZoid0F+e51NfCA4LzL1wjaJSuYV/JDpEybcxjqfLP+J9
         mif+6yLT16aMWg4G5ljrPAiJhBIOxaJQbz+76hME9vJhrJPC4gR+smR0MH90vUHp0Jod
         5cxB4jJiOHbt3Je+NHVHeFLIekXd7NDIcR11A4ZouaDIw2BbIye/OSre1o6BZIve5/Lz
         QcUCroM6NoblRqKTtx13lLE4DvhtXhmfwzA1AGz3p0DyMU+/0Sd7ohajeqEre1/H3BYo
         3xOFk9AvND3wX/V4gw3ZaZhUnE9FpszAhNc9u2EgYvC4N7Ojc6M1/ZpjdiOuv6Es2zdz
         nD3g==
X-Forwarded-Encrypted: i=1; AKwUvBzr0HaSFAlE+wvXQjbBniSmDx+HFnmUsxActt+LfaHCyAojCWknekIuYNI4GwEhWWozx4zHIHqG0/X4gA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKCfxHo7CZx99q15PgoPSiJ8cx70iQ7cG3sS9BLH/rSh5726D/M
	luOYx3WiQIWmydoGymPe4c2uM6ow6LGFE6cgKzAdmMjI2LAl40k23xHg
X-Gm-Gg: AYBFou2rqITP2ERFY1ehDMTwlcVqFzYMKI8/KWPeLyLXY0C1c9edSWXFnadV8ieCvYK
	ZRhDLQ5v6Fe2o+vEaghzMTQpbU8Hu2rKdCOohctcMhpDPOg2xStC3sKBXtjPyM+WoOTdVjJH0jl
	WAA5EmxdxY/HwRCJiOeM9woXtlaYl2HFbo9Pq1qYhykt8/zWtJXIJeKihu8JiTvT5bpFDznXTEG
	wld0Yfb5cvSuehDC7CwsdO2i9iNSq8EyBAWNme+JfuFPA/OWNJ+lT+bHZau85q/bEf4CUIY7M97
	5YqCRvOrr7SD2YHPpohIKe42EsrRrH9nxlvwE+gI6eB9jsJfLq7tpT2bzP+65mhYr/kfq6ypJs9
	i0uHnx2wP9MCqd9qvdoTH0e0P8zYXD1ExLD8unbmT4yUWJkdseiSKplsKV8L8ici3KaBwQZFET7
	uCYcm8hSHDTZ5MumO3stalJmeQVaGpkPwdH+cFVIfLVsHDU+PSaLzfOgRxxEb85SDxEYpu
X-Received: by 2002:a17:90a:e7d2:b0:3ac:a521:959 with SMTP id 98e67ed59e1d1-3aca52109eemr559134a91.29.1792055053807;
        Thu, 15 Oct 2026 02:04:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm3869119a91.9.2026.10.15.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:04:13 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:03:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Message-ID: <atCWzDzmknrsMNNQ@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-4-inochiama@gmail.com>
 <20261014-romantic-pretty-petrel-36c7ec@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-romantic-pretty-petrel-36c7ec@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_020414_825394_BBB360FE 
X-CRM114-Status: GOOD (  12.16  )
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

On Wed, Oct 14, 2026 at 01:43:50PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 03:45:15PM +0800, Inochi Amaoto wrote:
> > Add eFUSE controller node for SG2044.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
> >  arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
> >  drivers/nvmem/sophgo-efuse.c                         |  1 +
> 
> Review code before sending.
> 
> Best regards,
> Krzysztof
> 

Yeah, I forgot this, I merge it in the wrong patch. Thanks.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
