Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18D6C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 19:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2dJ+MSiQyxPp/UQMEyedwwrWd67wZPZymrTl3oFnKg=; b=oLwVRQDEmPrksO
	DKPycgSd1lsjimfEGL//BcDt6TZb566v0MXaBkUe/6d3VGRS7YxmJVt4YSxMsoB0icAbn4ZkwO9od
	NON06UnNEV9UvqXgnfzr32Cj2knAayYS78nE6vFO9r/PiZTOPkBoqLbckgNUWocAsjJMDk2AUTm+n
	7d6zkW9cqzDkP4NvFAGg8pAgC/Ez8xC9PklgKKsB2+C2F4yybsdSe062Lum8tGnXDLotB67CLeq1C
	Z9HE5hpG01s202gETH+GYWVw/K5AXLqj8ZBuJNIHU84nI/5BgzYnO3DskFd3F1x/ckaVP3QB4sca4
	Tr/RF8y0No1ebWGoL/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Bm-00CrgH-Ey; Thu, 13 Oct 2022 19:48:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Bi-00Crda-G1
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 19:48:16 +0000
Received: by mail-pl1-x630.google.com with SMTP id n7so2777908plp.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 12:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PKyqDLhwmXPlUdhrOFFEBt/uab4gB4wdiZD+rRvzv0=;
        b=oa+d1i4Vns0R2oqrhpWlUSOtEDshMIWWkCeJBhsy5zSAJa/Q+G8KdmDwnS/jYVN4qB
         ZQzOLvst2cLa2gX8HGIK9Qnb1iWAVGDZ3KthifDUdi+rC/6pq/LUCbBGMsbc8dK/abW/
         +BXmZ9CGp2VtztmjrE4oulZM9h89r6HQBLQpbsXfQyCzosPl3RMuRseKvvAxu6JJS2p5
         4E/Mu2VnAVxRaqybBdv6Bxs2rJ1clawxOdBri3n2JzNOlQxMfdPnMckK8o51dp7pngZR
         VIfVyUx0ot29VNgMASBf5w2sOsRfUY6lRv1HmFB0D+E0xJn/97dgWzCgSQccQnAatk6s
         kQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PKyqDLhwmXPlUdhrOFFEBt/uab4gB4wdiZD+rRvzv0=;
        b=hECSQBq2CuA13n9uDJgUr1A2hg5VufxdYBAWtPTnLCXhBE71ldhaplxga6lZVCj8TF
         i+zYa5IoQsJnD+b5x4abHRobmQh2llUbatzNyDshkcCnD3R08grJo3m9qB/cn+pnkbLX
         DzYnyDmwYAuCSKPjg7W8TUcUtuyvEtQ2CL/g2wCybgXvsr9i1KouUZaMMhP/xBfbw2aY
         dUdABq9ewKTc452QAWV/zJ6TfBq+jeZprvo0tT5d2b+offUptBn7eKj/fS4f8xqBz64u
         w3MGmxmdl2AvQXs92caDXO1NIcQYZbcoz53fXXdsfjbiHUdGpUgQjO1/a873/hECBSjk
         JVHg==
X-Gm-Message-State: ACrzQf3qSZjDz6DJOaUZArpmhkfHTiMl+WohwkTCNDfL06eV1LNUDNP5
	bzQcdTxOjcDhVlTenFerlgMznw==
X-Google-Smtp-Source: AMsMyM7rs4+Xvr4VuFSGLeN5dBixcWvSAhd5HBRs9TW0Yo62t4fsHya9i5qhDfSFJds2UqH0yoWvQQ==
X-Received: by 2002:a17:90b:38cd:b0:20d:8852:89f3 with SMTP id nn13-20020a17090b38cd00b0020d885289f3mr11945671pjb.41.1665690491520;
        Thu, 13 Oct 2022 12:48:11 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q10-20020a631f4a000000b0045fcfde8263sm93243pgm.53.2022.10.13.12.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:48:11 -0700 (PDT)
In-Reply-To: <20220913061817.22564-1-zong.li@sifive.com>
References: <20220913061817.22564-1-zong.li@sifive.com>
Subject: Re: [PATCH v5 0/7] Use composable cache instead of L2 cache
Message-Id: <166569033634.14806.7775220553152326118.b4-ty@rivosinc.com>
Date: Thu, 13 Oct 2022 12:45:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
From: Palmer Dabbelt <palmer@rivosinc.com>
To: bp@alien8.de, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
  linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
  greentime.hu@sifive.com, Zong Li <zong.li@sifive.com>, devicetree@vger.kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-edac@vger.kernel.org, ben.dooks@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_124814_551066_DE5EF5FC 
X-CRM114-Status: GOOD (  11.49  )
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

On Tue, 13 Sep 2022 06:18:10 +0000, Zong Li wrote:
> Since composable cache may be L3 cache if private L2 cache exists, we
> should use its original name "composable cache" to prevent confusion.
> 
> This patchset contains the modification which is related to ccache, such
> as DT binding and EDAC driver.
> 
> The DT binding is based on top of Conor's patch, it has got ready for
> merging, and it looks that it would be taken into the next few 6.0-rc
> version. If there is any change, the next version of this series will be
> posted as well.
> https://lore.kernel.org/linux-riscv/20220825180417.1259360-2-mail@conchuod.ie/
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
      https://git.kernel.org/palmer/c/44dce4b084f8
[2/7] soc: sifive: ccache: Rename SiFive L2 cache to Composable cache.
      https://git.kernel.org/palmer/c/ca120a79cf5a
[3/7] soc: sifive: ccache: determine the cache level from dts
      https://git.kernel.org/palmer/c/95f196f3212b
[4/7] soc: sifive: ccache: reduce printing on init
      https://git.kernel.org/palmer/c/3fb787e5bad5
[5/7] soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes
      https://git.kernel.org/palmer/c/696ab9bda22a
[6/7] soc: sifive: ccache: define the macro for the register shifts
      https://git.kernel.org/palmer/c/afc7a5834f0d
[7/7] riscv: Add cache information in AUX vector
      https://git.kernel.org/palmer/c/da29dbcda49d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
