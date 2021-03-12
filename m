Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9008EC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:49:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A06464F72
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A06464F72
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=48ubO15UlXa2xQGIfQmmsAWZuxRx1RJczEPnFtWXA5Q=; b=FlmmimUh7nwBCaAL4/+h6rdcf
	42eI1su5z3ZVShm6QnpnaZBnhkM9cwy1MxlKB3CJEFmAV8wv6bU7t6E6Rt7RIWxI5Rxaym7qrZVn8
	tLv9SGfECmzpRWBuUl+QuyRNo/7pv5gQU3n6i0MQfCB7ojYI5OKSquT9BQ3NDzfEYhomGobhtQCKn
	ZAlcPZeSwH4FE1ZNAvijVskMyKvU0ozlDx52x9fnSmHuo3XivvlE46+7bimQ51kOHdTAe6k71Fftn
	XlHRKcL+GlWtsMnyfKeVfgzgOd0VJCaX7LhCecElyiDjZufunGULo7WVWzv/opKsXeQEa/ZFuObVR
	eov75fVrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKk2d-00Brj0-E9; Fri, 12 Mar 2021 15:49:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKk2W-00Brgd-9W
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 15:49:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6A5665011
 for <linux-riscv@lists.infradead.org>; Fri, 12 Mar 2021 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615564163;
 bh=ITV8yYanRuLWRrhgdvQTLw9WWtU2HzzRTFEBHtl96RU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OAIFose9UQOl6WEjEMbhdYy1ZygespU3a3Ydisow9K3vTI8EpN6nNHdGDz/6EqvUE
 QVu6kIRRIGKrxZDYYGmwETEH2PwXQYnRjU0iuYKGJG4EDePoCRDXrFsc/TBWAkjNQI
 rz+wAfw4GaHxJ455g+O72PWpoRXSpNQJKoLZLPoT9Q6w8kpZF0hNY6nAK3/qWl4NpS
 dDjcHH8t8HvP5kS1zZl0WYP7NrXqATPRvspfTD60GjoLXge1EqEA5ePd+K5QOSO0iv
 u93zQ+mgvZVE0xy9qLCv5GnAgjGtxt2wHz8rTLKuJ3TM4M6DAfbboK4QklZ3OOU3mD
 Er/o6EDGzBAgw==
Received: by mail-ed1-f45.google.com with SMTP id bx7so8598039edb.12
 for <linux-riscv@lists.infradead.org>; Fri, 12 Mar 2021 07:49:22 -0800 (PST)
X-Gm-Message-State: AOAM533LHwIzuCG+2EF1hqIT+5W3ctlCyokoKhAkRtkexRs8gci9qupL
 AeWVUDMqhl5FIUqKJy+hYZXkFTu47UFO+yVDkQ==
X-Google-Smtp-Source: ABdhPJzPIjJEtlxOXhtTlMLI3nkgUMRWP0jfax7yMCce0mbCSNvsKUU38PwuXvjxbXhN6s/tpmkN6rboRA256BRYC8k=
X-Received: by 2002:aa7:c403:: with SMTP id j3mr14874186edq.137.1615564161374; 
 Fri, 12 Mar 2021 07:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20210311113456.15686-1-conor.dooley@microchip.com>
 <20210311174305.GA926017@robh.at.kernel.org>
 <b4c99657-e28c-cf4f-31e5-67a83ecbb4d0@microchip.com>
In-Reply-To: <b4c99657-e28c-cf4f-31e5-67a83ecbb4d0@microchip.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 12 Mar 2021 08:49:06 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLxX3rJiwp-Ljg8gvavdaqrkg5q7bj5a23+TK2ZCMfXCA@mail.gmail.com>
Message-ID: <CAL_JsqLxX3rJiwp-Ljg8gvavdaqrkg5q7bj5a23+TK2ZCMfXCA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: add bindings for polarfire soc system
 controller
To: Conor.Dooley@microchip.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Lewis.Hanly@microchip.com, Cyril.Jean@microchip.com, 
 Daire McNamara <Daire.McNamara@microchip.com>,
 Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, david.abdurachmanov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_154924_711610_3EDC6BEE 
X-CRM114-Status: GOOD (  22.66  )
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

On Fri, Mar 12, 2021 at 7:42 AM <Conor.Dooley@microchip.com> wrote:
>
> On 11/03/2021 17:43, Rob Herring wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Thu, Mar 11, 2021 at 11:34:56AM +0000, conor.dooley@microchip.com wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add device tree bindings for the MSS system controller on
> >> the Microchip PolarFire SoC.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  ...icrochip,polarfire-soc-sys-controller.yaml | 36 +++++++++++++++++++
> >>  1 file changed, 36 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> >> new file mode 100644
> >> index 000000000000..222557f96a13
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> >> @@ -0,0 +1,36 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: "http://devicetree.org/schemas/soc/microchip/microchip,polarfire-soc-sys-controller.yaml#"
> >> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >> +
> >> +title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) system controller
> >> +
> >> +maintainers:
> >> +  - Conor Dooley <conor.dooley@microchip.com>
> >> +
> >> +description: |
> >> +  The PolarFire SoC system controller can be accessed as a mailbox device.
> >> +  This document describes the bindings for that device.
> >> +
> >> +
> >> +properties:
> >> +
> >> +  allOf:
> >> +    - $ref: /schemas/mbox/mbox-consumer.yaml#properties
> > This defines a DT property 'allOf'. This would need to be at the top
> > level with 'properties' dropped. However, you generally don't want to
> > include consumer schemas. You need to define 'mboxes' property here
> > because you need to define how many and what they are if more than 1.
>
> In a previous version i was defining it like the below, but you didnt like the redefinition of the common property.
> Is there something in between the two that you are looking for?
>
>   mboxes:
>     maxItems: 1
>     description: |
>       phandle and index of the mailbox controller device node.

You don't need a description that applies to every 'mboxes' property.
You need either for 1 entry:

mboxes:
  maxItems: 1

Or for multiple entries:

mboxes:
  items:
    - description: What the 1st entry is for
    - description: What the 2nd entry is for
    ...

Same thing applies to all common properties where the binding defines
how many entries (reg, interrupts, clocks, power-domains, etc.).

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
