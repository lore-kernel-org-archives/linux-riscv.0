Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B0DCD4F25
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 20:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=dPlHx/57G8eN9qfHL1j1vgUUSNxP+p16/XPNa+irobc=; b=RPeGII/k9DZmG6
	7v6wvSz/kBxHx6ff2OQTh++zr37Uu+MV9j/hfmSAQyecJTDZGYBjVFE6FuG+1OlsLBADeDoew63F6
	aVweqEAVRH3f0NoIIjwHOov5wi5AB//XcLQrjEZVkiYJABKZkKClO6mWsDMjVEopi0tfwbS0u21p1
	z1KCBJLwRqBPOjwjo3rxlO+3KC5tDM1EWJLCBZSubhEiSxdqJr8aHhdvSvZR96qI/F2/gSJz+HwUI
	y6j83Z3k8bDpk/VaHGu/eQlQAgOG6sq8RBN0JaV/uHOmtJT6+u8v7i9PUEIzM4PTkE5zH6UrAAE6m
	//+HkI94Hcqw4l2VltZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGFr-00000003iYS-3HS2;
	Wed, 13 May 2026 20:32:31 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5L3-00000001oOI-0NzG
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:53:10 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gFnKv3DD1z8Xs79;
	Wed, 13 May 2026 16:53:07 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 64D8r4bc045011;
	Wed, 13 May 2026 16:53:04 +0800 (+08)
	(envelope-from liu.qingtao2@zte.com.cn)
Message-Id: <202605130853.64D8r4bc045011@mse-fl2.zte.com.cn>
Received: from njb2app07.zte.com.cn ([10.55.22.95])
	by mse-fl1.zte.com.cn with SMTP id 64D8hURw067028;
	Wed, 13 May 2026 16:43:30 +0800 (+08)
	(envelope-from liu.qingtao2@zte.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 13 May 2026 16:43:32 +0800 (CST)
X-Zmail-TransId: 2afb6a0439b49a7-f3b0c
X-Mailer: Zmail v1.0
References: 20260213093334.9217-1-qtliu@mail.ustc.edu.cn,20260213093334.9217-2-qtliu@mail.ustc.edu.cn,6ba2a916-739c-4c4a-92a6-951707aaa212@kernel.org,20260428212336808bXjbShOLllb6pYKXa129p@zte.com.cn,20260428231045453wLt2Gv66dV7Noa4l7ATlD@zte.com.cn,20260430171839401JJ1qBY9RPFfFISK8d2gVZ@zte.com.cn
Date: Wed, 13 May 2026 16:43:32 +0800 (CST)
Mime-Version: 1.0
From: <liu.qingtao2@zte.com.cn>
To: <krzk@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <marex@nabladev.com>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <rdunlap@infradead.org>, <geert+renesas@glider.be>,
        <quic_zongjian@quicinc.com>, <arturs.artamonovs@analog.com>,
        <robert.marko@sartura.hr>, <hvilleneuve@dimonoff.com>,
        <thierry.bultel.yh@bp.renesas.com>, <julianbraha@gmail.com>,
        <flavra@baylibre.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <liu.wenhong35@zte.com.cn>, <dai.hualiang@zte.com.cn>,
        <deng.weixian@zte.com.cn>, <jia.yunxiang@zte.com.cn>,
        <bai.lu5@zte.com.cn>, <yang.susheng@zte.com.cn>,
        <shen.lin1@zte.com.cn>, <zuo.jiang@zte.com.cn>,
        <hu.shengming@zte.com.cn>, <gao.rui@zte.com.cn>, <tan.hu@zte.com.cn>,
        <liu.qingtao2@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MSAxLzJdIExSVyBVQVJUOiBkdC1iaW5kaW5nczogQWRkIGJpbmRpbmcgZm9yIExSVyBVQVJU?=
X-MAIL: mse-fl2.zte.com.cn 64D8r4bc045011
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.qingtao2@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Wed, 13 May 2026 16:53:07 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A043BF3.000/4gFnKv3DD1z8Xs79
X-Bad-Reply: References but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_015309_447657_1F9669DE 
X-CRM114-Status: GOOD (  24.26  )
X-Mailman-Approved-At: Wed, 13 May 2026 13:32:29 -0700
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

Thanks for your kindly review. Sorry for the delay.

> On 13/02/2026 10:33, LiuQingtao wrote:
> > From: Wenhong Liu <liu.wenhong35@zte.com.cn>
> >
> > Add documentation for LRW UART devicetree bindings.
> >
> > Signed-off-by: Wenhong Liu <liu.wenhong35@zte.com.cn>
> > Signed-off-by: Qingtao Liu <liu.qingtao2@zte.com.cn>
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Thanks for the notice. I will change the subject to "Add devicetree binding for ZTE LRX UART controller"
in the v2 patch series.


> > ---
> >  .../bindings/serial/lrw,lrw-uart.yaml         | 49 +++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> >  MAINTAINERS                                   |  7 +++
> >  3 files changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/serial/lrw,lrw-uart.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/serial/lrw,lrw-uart.yaml b/Documentation/devicetree/bindings/> serial/lrw,lrw-uart.yaml
> > new file mode 100644
> > index 000000000000..a2d41c278c4f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/serial/lrw,lrw-uart.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/serial/lrw-uart.yaml#
>
> Never tested, NAK. There are several other issues here, but I am not
> going through rest of review if you did not bother to even build test
> it. Please open any other recent binding and apply same style here
> (filename, descriptions etc), so you won't be repeating SAME mistakes.
>
>

Sorry, i tested on an older version kernel.
No errors or warnings ever showed up running the command
"make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/serial/zte,lrx-uart.yaml".

Log from v2 patch:

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/serial/zte,lrx-uart.yaml
 SCHEMA  Documentation/devicetree/bindings/processed-schema.json
 CHKDT   ./Documentation/devicetree/bindings
 LINT    ./Documentation/devicetree/bindings
 DTEX    Documentation/devicetree/bindings/serial/zte,lrx-uart.example.dts
 DTC [C] Documentation/devicetree/bindings/serial/zte,lrx-uart.example.dtb

> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LRW serial UART
> > +
> > +maintainers:
> > +  - Wenhong Liu <liu.wenhong35@zte.com.cn>
> > +  - Qingtao Liu <liu.qingtao2@zte.com.cn>
> > +
> > +description: |
> > +  Should be something similar to "lrw,<chip>-uart"
> > +  for the UART as integrated on a particular chip, It supports
> > +  multiple CPU architectures, currently including e.g. RISC-V and ARM.
> > +
> > +properties:
> > +  compatible:
> > +    const: lrw,lrw-uart
>
> No way lrw is a chip if this is a company.

Sorry for the name problem. lrw is a subsidiary of ZTE.
We will use ZTE as company name and lrx as chip name in the v2 patches.
lrx is a chip that will be comming up soon.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - current-speed
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    uart0: serial@e0001800 {
> > +      compatible = "lrw,lrw-uart";
> > +      interrupt-parent = <&aplic0>;
> > +      interrupts = <0x12 0x4>;
> > +      reg = <0xe0001800 0x100>;
> > +      clocks = <&bar_clk>;
> > +      current-speed = <115200>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/> vendor-prefixes.yaml
> > index ee7fd3cfe203..ec9bf262f466 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -961,6 +961,8 @@ patternProperties:
> >      description: Loongson Technology Corporation Limited
> >    "^loongmasses,.*":
> >      description: Nanjing Loongmasses Ltd.
> > +  "^lrw,.*":
> > +    description: LRW Corp.
>
> What is the website/domain address?
>
>
> Best regards,
> Krzysztof

There won't be such problem since we use ZTE as company name.
ZTE was described in Documentation/devicetree/bindings/vendor-prefixes.yaml already.

Thanks,
Qingtao Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
