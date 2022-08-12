Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0611DC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 16:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jq92qV+yhStx6+gVw7dGjHO4QJa6H4jEMjabKxB55QU=; b=bcsPpLCkyPU9Zp
	f+b2QAl4Tih4gagE0oQiR7aBsjCg+2J2pLX8tLBvuoZRRAdpsVwTBDaqViW6bFz1PDOrC7y40179g
	Fy1m1r6K4OiDHPO83jG0TT+QtYAozfj/ee5Igv5evlSGA15vS/3tmShzNZkcYhROV6w4Abtfe2o2B
	/vQ0VVPnZHa/QqYFbrOHqLmM6c3j+A9rwXkLayT3PrRGjiBIbjRotNefldcmtNw5MrDdmnL7k7VI9
	rKYVo4RjcKJvACgeoBqZAefK6YLFAT/hwwNApEqCBnQFC1AdTW0oJ6vJitjUHIubiE9yG5RsNdnwB
	tceT75PlBYm7V8tzmviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXgF-00Awm3-8H; Fri, 12 Aug 2022 16:38:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXgC-00AwiZ-Jq
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 16:38:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F11C8B824B1
	for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 16:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BE4C433D7
	for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 16:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660322313;
	bh=q+LQGQUDWTwgah/gHIGUKH/VSzB98ablADDbuzvDZew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DaWfyfIjuUHxEV2ogd6+ttE+sjHKaNy/CpzeQu2kKXiByXZtLyfbgWldxhXJ/2U2S
	 Mm15hB/ij+11BP33sLB4uDevAUdrG4Dn1jnS53teKqKL+u/XTtN5UjW5FWxSATqaEU
	 EMfUSgxB0/w69QQjg/nwWEEtJ1yCV5LrYDHbjh8nMmNj1umFDxurSuQGuirllt2dXR
	 Zh152+ky7Ieb7P3Ui2VVzYq8BEibo5AuA+gvDWjUzbA8G9TeWK88DizEIAOcnSH2yg
	 7bfPwpygUbUOySn1VQBaF59L/MevHwggsjMij13vynpIY6iK2CDU65KLchE1Yrc35k
	 lKu8StzsQmrmw==
Received: by mail-vk1-f177.google.com with SMTP id bi51so739888vkb.5
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 09:38:33 -0700 (PDT)
X-Gm-Message-State: ACgBeo0wmS+sMl2jSN70FUJamu/vtIw2T6Cb8FobgHNERbXcdEZvPPZt
	42PDP8UvDqzP8FIJL9aA2YxQqxfBHjQ43jz0HA==
X-Google-Smtp-Source: AA6agR5bOtmCd8QV+awVagZr3ZgQKPegm1dDNeB255ytg7BB2YmuwcapMNgNnSGw+9tCavOS9vEWjSKZJ0ko4+hwT+4=
X-Received: by 2002:a05:6122:4f9:b0:377:f03a:23df with SMTP id
 s25-20020a05612204f900b00377f03a23dfmr2294192vkf.19.1660322312625; Fri, 12
 Aug 2022 09:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220811203151.179258-1-mail@conchuod.ie> <CAL_JsqLOGLZD6vrNPqDUqYypkz8xoCPJ4DA4JF-BrG=WHWPurw@mail.gmail.com>
 <46c51365-b4a5-9666-bc3a-24ff833d8fb2@microchip.com>
In-Reply-To: <46c51365-b4a5-9666-bc3a-24ff833d8fb2@microchip.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 12 Aug 2022 10:38:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKZ2N7rTb0Fm0Y8CjN8XrTkBsu2uU_TFfhU0iwjSz5row@mail.gmail.com>
Message-ID: <CAL_JsqKZ2N7rTb0Fm0Y8CjN8XrTkBsu2uU_TFfhU0iwjSz5row@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: cdns: add card-detect-delay property
To: Conor.Dooley@microchip.com
Cc: mail@conchuod.ie, ulf.hansson@linaro.org, 
	krzysztof.kozlowski+dt@linaro.org, yamada.masahiro@socionext.com, 
	piotrs@cadence.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_093836_960919_5BCA166C 
X-CRM114-Status: GOOD (  20.40  )
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

On Fri, Aug 12, 2022 at 9:46 AM <Conor.Dooley@microchip.com> wrote:
>
> On 12/08/2022 16:33, Rob Herring wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Thu, Aug 11, 2022 at 2:32 PM Conor Dooley <mail@conchuod.ie> wrote:
> >>
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Upgrading dt-schema to v2022.08 brings with it better handling of
> >> unevaluatedProperties, exposing a previously undetected missing
> >> property in the cadence sdhci dt-binding:
> >> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: mmc@20008000: Unevaluated properties are not allowed ('card-detect-delay' was unexpected)
> >>         From schema: Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >> Should this have a fixes tag? If anything, it'd be
> >> Fixes: 84723eec251d ("dt-bindings: mmc: cdns: document Microchip MPFS MMC/SDHCI controller")
> >> but idk.
> >
> > No, the common property 'cd-debounce-delay-ms' should be used instead.
>
> So it's a case of "what's in the dts is wrong so it needs to change"?

Yes.

> For the future, where is the line drawn between "don't break the dts"
> & "don't use bad properties"?

Depends...

> Only if the property has consumers?
> I don't mind, just want to get it right next time ;)

In this case, there shouldn't be any compatibility issues because the
mmc core has supported the common property longer than the dts
existed. If that was not the case, then we'd probably be stuck with
the property in the dts file. That still depends on usage in the
kernel or elsewhere, in dts files, stability of the platform support,
etc.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
