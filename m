Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633DEC64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 22:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GO0o/yHzqxeQfvLN6tRFs6Dq21al5Nrald1bdRz99/o=; b=kmPUBCqK9+aV3I
	PStJCd6qDOFLogw521z0n9A0bWaeEWAhW+0WzdB9oYZv3VV2bgGlWzZlmMyuURXRS6HAZzzhrMqP9
	Ou13k5iAw5iEoJVgNWvQrwGBwcEZf7W9Q6koP9Kyr1tDu3d6GRfFscnpVMjg6yF03Pmqres+upXQ1
	khWNN3SiAl8qskKM/etvCz6MkrG1c5Q2z6z7ETwqdsQjPysZVRWVYk0JHqMniyeLlLWJWVnP6TFmp
	OeffZpDgCQjIYUquKGZVMJ7QYWK/ows9p0c/8TYZ8ce/753qF3XpWdPVx8Ob7uuzmJrGavXq8fkRD
	Zos01+8ILLw+NwYha68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWlza-00BS1t-Qb; Mon, 27 Feb 2023 22:29:10 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWlzX-00BS0j-J7
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 22:29:09 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-17227cba608so9056866fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 14:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFoqsd6EBPQ0PzNdCKJoWZA5o9P3njK484v747rHzjE=;
        b=zlwAfozQ4R2D9CtKPWRsNUuJMkWpC46nCDV4lFupxHFz7xVfMocutTU1j7FZWoqBlx
         EZLHPVJEzA4s0D6e7xGkp+3asO70IWNKixIhyi4coK87HBdLz19TXqB2bl86pnPKIH6/
         y15pwNkNEO0/KLDuFsEpqup27/I1PatVWzhC5eyg241/u43Pj6bPnF1qW28jaOiTB3Iw
         gvr6MTNuLVXGHCsdkTmCzCuYGLsUUxsuIVaMkueKYA6ooP3AZnljLguzSUg1AjUY/AJk
         ZpU121k/wL0UuO4yDAzgnd6xv1r8ZZxtyt2C3xvIZ9nDZ1i3MWyB+C6YNi/Hgw3Cb9Qh
         fgrw==
X-Gm-Message-State: AO0yUKXLi65FNG3mbKwFFG1u8E2m+/S155w1zYt4w7w8HkiLu0IN3dG+
	i9nfjRokierN6b6DDhFC6w==
X-Google-Smtp-Source: AK7set9EvaHbC0pq/Q5M8Jesf6gQwD4JT+CCUAwMK4iN767gMIlj2Bv0JNrjP2eDiCwdeJnGYGCy1A==
X-Received: by 2002:a05:6870:c113:b0:173:245d:d26c with SMTP id f19-20020a056870c11300b00173245dd26cmr271200oad.17.1677536945490;
        Mon, 27 Feb 2023 14:29:05 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x9-20020a4a8689000000b0051d13098c54sm3139588ooh.19.2023.02.27.14.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 14:29:05 -0800 (PST)
Received: (nullmailer pid 1215162 invoked by uid 1000);
	Mon, 27 Feb 2023 22:29:04 -0000
Date: Mon, 27 Feb 2023 16:29:04 -0600
From: Rob Herring <robh@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
Message-ID: <20230227222904.GC1048218-robh@kernel.org>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
 <20230220234335.GA615198-robh@kernel.org>
 <348796cc-72d9-4dcf-9f09-4c2aa55cb858@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <348796cc-72d9-4dcf-9f09-4c2aa55cb858@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_142907_665036_4BB00676 
X-CRM114-Status: GOOD (  21.26  )
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

On Tue, Feb 21, 2023 at 10:44:02AM +0800, William Qiu wrote:
> 
> 
> On 2023/2/21 7:43, Rob Herring wrote:
> > On Wed, Feb 15, 2023 at 07:32:49PM +0800, William Qiu wrote:
> >> Add documentation to describe StarFive System Controller Registers.
> >> 
> >> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >> ---
> >>  .../bindings/soc/starfive/jh7110-syscon.yaml  | 51 +++++++++++++++++++
> >>  MAINTAINERS                                   |  5 ++
> >>  2 files changed, 56 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> >> 
> >> diff --git a/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> >> new file mode 100644
> >> index 000000000000..fa4d8522a454
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> >> @@ -0,0 +1,51 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/soc/starfive/jh7110-syscon.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: StarFive JH7110 SoC system controller
> >> +
> >> +maintainers:
> >> +  - William Qiu <william.qiu@starfivetech.com>
> >> +
> >> +description: |
> >> +  The StarFive JH7110 SoC system controller provides register information such
> >> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - enum:
> >> +          - starfive,jh7110-stg-syscon
> >> +          - starfive,jh7110-sys-syscon
> >> +          - starfive,jh7110-aon-syscon
> > 
> > Is 'syscon' really part of what the blocks are called? Is just 'stg', 
> > 'sys' and 'aon' not unique enough?
> > 
> > Rob
> Hi Rob,
> 
> In StarFive SoC, we do have syscrg/aoncrg/stgcrg, which is uesd to be the clock
> controller, so 'syscon' is added to avoid confusion.

You've only added to my confusion. 'syscrg' and 'sys-syscon' are 2 
different h/w blocks and unrelated to each other? Or 'syscrg' is the 
clock portion of 'sys-syscon'? In that case, 'syscrg' should be a child 
of 'sys-syscon' or possibly just all one node. Please provide details on 
the entire h/w block so we can provide better input on the bindings.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
