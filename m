Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88060C636C9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 02:17:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC3C613E0
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 02:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC3C613E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNfJASd2GRFyyxNkTWn4aMm7/+ANU8rz+2JjWmD9ly8=; b=itZHwx0DPi+WeY
	R5VbihJijmiyAkWczUbBBAR3Y/Ed9OUBAeSJuJWk4RpRudR8bF/oGlRrs+alxk/px25qDy9ecbbv3
	6DGJIfN1C0OGoAbYWs5QgngsPVa61JmRTNaPWklNF96TAmLu65CPFcmPsG/sNGdxTs28YN8og8ruw
	xpsHnX+yTTi+O+HMPRVmW4zGWYWeVbmKJ0bfao2zqYDrZ8lUcpr0NYXN2XkhsO5rpjVgPZZeoo0rA
	mzqAIm8MxX2Fyu6GAkDgOv07hy4dzHKHdJPmjdO6+2XrarXYUay/UAs4KXK50CZy7VcQ0p3uRF9I3
	RWJnadS484P5d1rqXiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4DQ2-002tJR-LP; Fri, 16 Jul 2021 02:17:38 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4DPz-002tIW-UZ
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 02:17:37 +0000
Received: by mail-yb1-xb29.google.com with SMTP id c16so5617280ybl.9
 for <linux-riscv@lists.infradead.org>; Thu, 15 Jul 2021 19:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SzFD8deSpIF82vtstmuO6VWbyrhuzFl/J29D7XRCMAk=;
 b=inc9V1KH8aEiyfn31KxXZl4ez7Qdr+jj6KJIPVaOqVKu4uiT9U7eC3Yy+injev8tM7
 FaX8kyWazkj8Ro/dyDeX6q47FXgmJhGF0/jQRgnPMnJ1hUfcTCDMrUxTNEvIIK/YbOH3
 eCK7/fmYI2xK8jrd4a4HZKuUnUOyN9F/AV+cP0TcaOeO4tPYZFNexHIpPL3z9tWUrNq2
 INyqwHKBrfEEXzxzxHfMoLdWhqllPfHHZ/6qnBMzELpHC0Pckb5hnL0tR7K3NCHDkYC2
 Ru5idEiV8elJZW2yS+s/LZVGUL4ZsyWdUsFRolDnUqEb/jfk0SAZnhfQ9uhuhT6b4rEX
 L9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SzFD8deSpIF82vtstmuO6VWbyrhuzFl/J29D7XRCMAk=;
 b=lcrHfBctakA94kLrywA9vHgkwuMi9KHgao9xmUS8N9sXOO9d1r+faSA4QbZBBnz4Rz
 fTFmIOfk8eZO+ZMCUjDWEWqjVEp3mMbvEFZFc8POGTyqacwbYtk7HagnOrqKVOiQEMvQ
 D+p7Fg3qYX9g53Aol12IULW7f2Z8wtiN/9pq3GFM1yM4Z8tPHwqGvow0Vr3RXG71O3J1
 OYkg/cwCKOi3Cj4nk1TMo5UTrrNG9WF3retuB1pcWWoFH+yFnkAd+5/V0ZqTUYgc6GKC
 PvV95s01KP3LjJNydVTdt5SIg8o89amRXMbLqwf5CTqo1hdkUSJ0a5l1lklnlrY4ASpj
 T7ow==
X-Gm-Message-State: AOAM530klYFCh9j33S2ZZAmiJ1wz7V7eNUyApaAJwe/wtVMa95+qH7Hh
 eqoy4gproWAmr5syIENCHzlG7Q/M12lO2skIAWo=
X-Google-Smtp-Source: ABdhPJxadUYKFD/WgWos+BbybLpBn6YAco20OzKvWAAdIxTADz9WxT/jOGGdBqKi4VcbDJMEtzxT5158wfVWDyMpo3c=
X-Received: by 2002:a25:cf0f:: with SMTP id f15mr9430531ybg.229.1626401855030; 
 Thu, 15 Jul 2021 19:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210713063018.3000459-1-drew@beagleboard.org>
In-Reply-To: <20210713063018.3000459-1-drew@beagleboard.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Jul 2021 10:17:23 +0800
Message-ID: <CAEUhbmUg0DX__jSzjm1X_eCiHnkjHVXeq7CYLbW4xpydPS1G3g@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
To: Drew Fustini <drew@beagleboard.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>,
 Wei Fu <tekkamanninja@gmail.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_191736_037047_62B1830E 
X-CRM114-Status: GOOD (  14.17  )
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

On Tue, Jul 13, 2021 at 2:34 PM Drew Fustini <drew@beagleboard.org> wrote:
>
> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> BeagleV Starlight JH7100 board [2].
>
> [1] https://github.com/starfive-tech/beaglev_doc
> [2] https://github.com/beagleboard/beaglev-starlight
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v4 changes:
> - removed JH7100 SoC revision number after discussion with Geert
>
> v3 changes:
> - added revision number for the board and soc after question from Palmer
>
> v2 changes:
> - removed "items:" entry that only had "const: starfive,jh7100"
> - correct typo in Description:
>
> Results of running checks:
>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>     CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
>     DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
>     SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>     DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>     CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>     SYNC    include/config/auto.conf.cmd
>     UPD     include/config/kernel.release
>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb
>     DTC     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
>     DTC     arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
>     CHECK   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
>     CHECK   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
>     CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
>
> The dts file is from vendor repo and is being cleaned up right now in
> preperation for submitting to the mailing list:
> https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive
>
>  .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
