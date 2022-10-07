Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AC5C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 03:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjIb5iWcgRSH9fHlgrpL8/mhIk45HY4sBMj26JdJtqI=; b=E74Gwz4eIREtig
	AsWFbSQ5h1QZZjYMLLAMD7yFfe6buttQ+IntNLQCZ59cg49fP6HV1CG2vknCPOY9NElDi6D1lgvuC
	eWGPCZ72uXNwoNvSgeTRzt4DWuDxwx9WSw6IEL04zDMCf5slMIvHv+Em+TFzA8Ww2RlxoWC8Sk0e3
	a+AtVDQDNR3ThGnnc8c+AZB2tKUXv2zWigWilTnCMDtyXyWA+w676c1wQxWpJTZoNyX12wli0q31i
	kG13QZmfVLL6m70XletPtVNNoauZUXdyDyjmNPVbLww7cCOithy+8CDmoI4u16xPjZNGbO4QBwOaJ
	TMbVk1Q1EhO//rk4fyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogeOe-0071Se-2B; Fri, 07 Oct 2022 03:51:36 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogeOb-0071RO-Gk
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 03:51:35 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1321a1e94b3so4409923fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 20:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ywOJjC1iAeM1WckDzdDR6XJ9UsRidM3rIQ+Y2hJNDKM=;
        b=Cm8A2XN+mF9SQCfZ8U83Xr2/sdIj3A4gzywnUW/7Rg8Ps6TUj4mhzqhCDtGqP7rbCX
         cR0e5rS0OPRwXdYsVNItxkjYH46iUD/Bd/+KUmlHvltKz67cwSfZ1QPHMg10zi1Iw9bm
         vDZbb+QvIf3iyYRqE/pS19gScSSw1GkfnatsP8vKo8rbOgn6RPhSaNJX1B1SkuM2/vq7
         1ro4NazkBLM0NjJ1s+DFBjBdE1QhYGBWWpOMpKVLCIXLv5L9XAAnJtiRU9u+E/g+SHEl
         qm19+eysnC3NebtYzE6Z6Mi6JCPSiZIIXR689VTSW5J1/AfsM2qmJLQlgJZEeJllTKHy
         aB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywOJjC1iAeM1WckDzdDR6XJ9UsRidM3rIQ+Y2hJNDKM=;
        b=1KgGPlK8y8EENVTYApbSC5486Fy9mp1iHnmsNzcSsQrctp1fwmyB9flsMI+Mxcft9I
         E+BX+Ru1/YjZjvc7Q5QwODo0OB0yiNBiaPj0TJGCd4coOaJNpZCVE45j7U6MdB/7JCXs
         gvS1KbE2MO2OEq+Pfz7YKKtcM7VfRhGDPBf+Vp2T8zbSW36OXlJlnQP6Q45ltjlH3LGH
         5RSCgm+mhZVG5b2ZiSIFb1QufUQLtcI1n111pHd1rpDW4xzm2R+3Elu42ZvW1pl25Usz
         XxF1jt/Lk1ZBN7RvHEikpftUdNySWHEidUKj5RVZ1cSiNRkvO0/pyUhwhEONZRpL3uss
         WQlA==
X-Gm-Message-State: ACrzQf1jArV7F4RJ/J9pGgrw/7k5lDZHFl/fWZWH4oqH4QNnUO9EzRBT
	Wrj2CR502kpkP7+wJtcjsLfaNWoikP5jxurddC8ycQ==
X-Google-Smtp-Source: AMsMyM58r3x61gcQz490WPKR8f7M4ASa5M+2B+LqM+DSCDhS6Ek4QKEKnabKgdcccswhnXNdVIOArInEoUBb8fej4mo=
X-Received: by 2002:a05:6870:ac21:b0:132:f716:1804 with SMTP id
 kw33-20020a056870ac2100b00132f7161804mr4707931oab.248.1665114691420; Thu, 06
 Oct 2022 20:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220829062202.3287-2-zong.li@sifive.com> <mhng-050016e5-0f50-4366-b4bd-98b4b36a56bb@palmer-ri-x1c9>
In-Reply-To: <mhng-050016e5-0f50-4366-b4bd-98b4b36a56bb@palmer-ri-x1c9>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 7 Oct 2022 11:51:20 +0800
Message-ID: <CANXhq0qMuU3-R=5fM6WK28259dBBbM+6Sg6-=ayiSVLuccx9TQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: sifive-ccache: rename SiFive L2 cache to
 composible cache
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, greentime.hu@sifive.com, 
	conor.dooley@microchip.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_205133_601130_6AF7883A 
X-CRM114-Status: GOOD (  22.17  )
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

On Fri, Oct 7, 2022 at 10:58 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 28 Aug 2022 23:22:00 PDT (-0700), zong.li@sifive.com wrote:
> > Since composible cache may be L3 cache if private L2 cache exists, it
> > should use its original name composible cache to prevent confusion.
> >
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  .../riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml}      | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >  rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml} (92%)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
> > similarity index 92%
> > rename from Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > rename to Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
> > index 69cdab18d629..1a64a5384e36 100644
> > --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
> > @@ -12,8 +12,8 @@ maintainers:
> >    - Paul Walmsley  <paul.walmsley@sifive.com>
> >
> >  description:
> > -  The SiFive Level 2 Cache Controller is used to provide access to fast copies
> > -  of memory for masters in a Core Complex. The Level 2 Cache Controller also
> > +  The SiFive Composable Cache Controller is used to provide access to fast copies
> > +  of memory for masters in a Core Complex. The Composable Cache Controller also
> >    acts as directory-based coherency manager.
> >    All the properties in ePAPR/DeviceTree specification applies for this platform.
> >
> > @@ -27,6 +27,7 @@ select:
> >          enum:
> >            - sifive,fu540-c000-ccache
> >            - sifive,fu740-c000-ccache
> > +          - sifive,ccache0
>
> Looks like Rob's bot had comments and I don't see a v2.  Sorry if I'm
> missing something.

Hi Palmer,
We moved this series to the following patch set:
http://lists.infradead.org/pipermail/linux-riscv/2022-October/020196.html

Sorry for the confusion. Many thanks for considering this series.

>
> Also: I'd guess that we only had the SOC-specific mappings on purpose.
> It's kind of a grey area and I'm OK either way, but I'd definately
> prefer the DT folks to get a chance to review these.  My guess is that
> they're not looking due to the bot comments, but sorry again if I've
> missed it.
>
> >    required:
> >      - compatible
> > @@ -37,6 +38,7 @@ properties:
> >        - enum:
> >            - sifive,fu540-c000-ccache
> >            - sifive,fu740-c000-ccache
> > +          - sifive,ccache0
> >        - const: cache
> >
> >    cache-block-size:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
