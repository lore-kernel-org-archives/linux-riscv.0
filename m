Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9058FC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 13:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8tvGhvhRSE4JxNMyQzPQLrfpy9koG50YBzrUgpwe6g=; b=fot2987eqtqiv0
	bGtXyTQvZ5P7ETMvBHGsxyGWD7QwEB995/s7qZXASpVSfIZ+ucx1ljPF8BT4UgglAODBphFxCiHAt
	eFACIEFU/P2iBKPt78y91p7UlR1BhLiLtjKK8bB67DxAjNeJibZnq22CqWX1vAnEjNdH/2ouhlWXv
	HJYRWJ3PlIbPU8UoldLUU2jABOqQPmfUjJr8JpJiZtmxyJjClQ1oFZt5Qm19/FeciVm8deHvxtjtG
	fnjygxTAqwAuO+GpLPx4TaEvR2Vipwosmznjcl/ZfYtCkK80fUiKy9KQgQHk1+73WmoY3dDXYXlhR
	Bx47gYyLqKZaj3mDblFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGhM9-00EAg1-Cp; Wed, 27 Jul 2022 13:45:45 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGhM5-00EAdM-VJ
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 13:45:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id h8so24259071wrw.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7gGrlyDdirvdUA7riaI7TlemrpJ1LUBifzMGQQE/jDU=;
        b=aKoczN7k/b/+LolbU8csJT7jtDZsDTeSvx3Zk5EwoZBtEzljz8+BJasZmELiDP475B
         mEFBsLIGvifwWkMkXIYH2RcsiBiXb3wBrA1Q3rVg03uLkD8ToYWlnTudgtmSeEyJK6o5
         LRsIzG21yeKngXSQQPo3ZgGRuoRD7UP1vuerJ5Wf/v4+3Ui9Qz/F+Xt3h4+Itbn5i3PH
         To03EGaMHO0UuYhZHMs/ZioA2XpkC5ElpQYihO33E7SVqRU+62Wj5CZuctyUZllDX+g0
         L4py3NLskYAR4kEvkX3nR4WUg4EpXOmxb53sGNDBFjnjo2+QgUWi0/G3EpqNWyheC9lY
         Glrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7gGrlyDdirvdUA7riaI7TlemrpJ1LUBifzMGQQE/jDU=;
        b=TixGD+UbcmEH6dNESVjTaoydxHuZkHH+sJEtA7aOllrcp4Z058Dtv+owqecKpRK8x5
         fETXkmfO0sgG0+5xKxAYDTiyIuXExB/pZzxEYxERnrzBAN+dYvR4pIVk8CkGb0gIiy4p
         06eV5F/YkGG4WdxWPZ499UoERJZEaXT5knK6TL6w+Lkz/t41e3RdQQjA0sUjN6F2MmBc
         vsd5jcUucgO+4fvit/lyNG3yi8cUWmDyTx2JO/xqMO6974RZVfNsptCd7YzpuqAyUCU6
         M+jhPAyGJ+UI2jsMmtOgufY+eI+Pmrm4rfsl1+c2Ja4Qmtjv4IG+p65k0JiftGPG5Mj2
         Trkw==
X-Gm-Message-State: AJIora/xvAGz2JLx4n8/G1cC2XTI4ELaJgyr4UVnS66psqx9JTqGFOAh
	MLGcC6aHljoZrdb5A7zBOIl9eabN8K8xObamV3cI7A==
X-Google-Smtp-Source: AGRyM1vX7ezpYljF/hOQ0ZqLM8P3MfOOLiOVDi5erUYoEUOh9xltKy4QxFtI8mHqlZRaN5MibKtQN46hvKBVNtxOYxM=
X-Received: by 2002:a05:600c:5114:b0:3a3:3f7f:27ec with SMTP id
 o20-20020a05600c511400b003a33f7f27ecmr3109497wms.93.1658929539557; Wed, 27
 Jul 2022 06:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com> <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
 <20220727124556.owk3zlyzsg5uaa4t@bogus>
In-Reply-To: <20220727124556.owk3zlyzsg5uaa4t@bogus>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Jul 2022 19:15:28 +0530
Message-ID: <CAAhSdy0TSKhR8_2eU7pmgizybuxPbwAycn4YudvkfGWGbnXNtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property riscv,timer-can-wake-cpu
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Anup Patel <apatel@ventanamicro.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_064542_043689_AC3BB56F 
X-CRM114-Status: GOOD (  25.13  )
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

Hi Sudeep,

On Wed, Jul 27, 2022 at 6:16 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Jul 27, 2022 at 02:07:50PM +0200, Krzysztof Kozlowski wrote:
> > On 27/07/2022 13:43, Anup Patel wrote:
> > > We add an optional DT property riscv,timer-can-wake-cpu which if present
> > > in CPU DT node then CPU timer is always powered-on and never loses context.
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > index d632ac76532e..b60b64b4113a 100644
> > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > @@ -78,6 +78,12 @@ properties:
> > >        - rv64imac
> > >        - rv64imafdc
> > >
> > > +  riscv,timer-can-wake-cpu:
> > > +    type: boolean
> > > +    description:
> > > +      If present, the timer interrupt can wake up the CPU from
> > > +      suspend/idle state.
> >
> > Isn't this a property of a timer, not CPU? IOW, your timer node should
> > have "wakeup-source" property.
> >
>
> I agree on the concept that this is property of the timer and not CPU.
> However we generally don't need to use wakeup-source property for timer
> as we ideally use this for waking up from system sleep state and we don't
> want to be running timer when we enter the state.

It seems ARM is using two separate timer DT properties: one for
system suspend (i.e. arm,no-tick-in-suspend) and another for CPU
system (i.e. always-on). Is this understanding correct ?

>
> > Now that's actual problem: why the RISC-V timer is bound to "riscv"
> > compatible, not to dedicated timer node? How is it related to actual CPU
> > (not SoC)?
>
> We have "always-on" property for this on arm arch timer, and I also see
> "regulator-always-on" or something similar defined. So in absence of timer
> node probably "local-timer-always-on" make sense ? Thoughts ?
>
> --
> Regards,
> Sudeep

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
