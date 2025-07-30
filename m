Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D26C87FCB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpG7/QSaqwBbYmGQPrNH0of4EdoFrsrugVbwvUXn9AA=; b=bnhHMQKMwrmyWC
	JmJXrz+GpdHLhY44cMLhKtZiMczfjc59gok+2/UCMvCkkKMbsLHH4xJB06c+MEacUTnRQiWDAhRFy
	NeRTgw7dZwhIzncB8bswIrfSbk4OGz8V7yUHKW7kN7G6vjJbnDRZjCG1W3brUMdrhPkBS1ThAaHUI
	tNsZX8mArUuPd0CV1V7+06R9Yzy0As3BPuKGNXNa3x5jyVYnQ/gnQQ7M8KsrIP95KWYEmCy5OnGMC
	0d3/CdkOjb7TPrWjopwj2+g1k+wFs8los4KvCvZctosh1fBOJlOKMHmq5c+iVfnoH2F5VWcaUY57m
	1h+ox38thKmu7X2YLYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhFb6-00000002Zx7-2cIE;
	Wed, 30 Jul 2025 22:48:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhFb4-00000002Zwj-2dE2
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 22:48:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-236377f00a1so2689895ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Jul 2025 15:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753915709; x=1754520509; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NP6vcGcK02YLX4Uh++vawCQkxiZgTHh/2PlbBRfDZHI=;
        b=NnVR30/Bj/t3/1QPpQbTgdRjjhSZoaI+t/KhQylFAm/ozvI14kSKAcS+ZDW6xpJhO+
         rw3QFP3tNG0iOUReabQtmG6v1Yc3cF8rEYGsi7suvgeIy4lCdGhXQYS8T8LHKfX95rd9
         dUcrHTdAm9xeef/9iYgamAbAljN6txElKhf8q/sVN829/eR2c0/EayM8bW5e/JwyEpNH
         sP/pke43DlgTiWl+HN1pATv/p38JMk0vzhc44dp4URbnxq7djqtT94pw+uePXmS9/c8Q
         kibYHXa9trawSRn++pulSCWA823iI3f/3kteluJNIKrEBjIWi8Fg54N1IOWCqN4GvKh0
         4aDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753915709; x=1754520509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NP6vcGcK02YLX4Uh++vawCQkxiZgTHh/2PlbBRfDZHI=;
        b=VzvkvvvmCl3tWQ/WeYa5rR32yydfuEKNAGHDmz/QHu6cr7D9QeIoDguSvxrqMz/kNg
         +/VIjcQbNus+4XM4bwILhnyZiAb5nRDJzSgPJPAurhPu7aSR2dvxAZbrx4SsXWgCRCxS
         yT/Wk4+b5qoBld9UXfI/2TF2lZaWiL3XCsS0/RkqiJc3GbV/tQJxN5Rg3R9n/4JOoVfo
         oJaz5j9xyLo3TE7SGkHxE4xcrUNeFFGToIHL3qNL5szDYFJtu91Y9MBVi2C5y9Ifl4x9
         gZ8TNra+Cgbcp0xfoBH9tMkB/pukppGP7x03DaFzVR60mSIhs5VeXbc+JbEqgs6urS7U
         K9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVNap6xfyx1vmGmtAHnJcJoSg+G0R02y2YrqTqiTCVY+U0LZTICFBKcZvuK7hmZUhy3mfoLf+opVck/Zg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/FI5F1NClSh47vvJ+NkU4Yp4ixS67RY+lhbuPvWgDOCZRQ+ZG
	tklMpUj2FvOUdtcKwP3VckmLJ4UC2YB/RGt5Jq+pLElsfQvSdbwD+HNxcBRALQ==
X-Gm-Gg: ASbGncvGpL4Uertf+KxyVQBtRcwvQSrm5G82Yw0xhotO822pjOTuluMzZfXjot7xP4e
	+SG0pb30zGegin3r+DLgUQXXv2UhENhutMaGyzflSobVaF2WvUOznhbvC4j+KG79KmA5eLnfc2p
	2IX+hflkKcDhAvc4COLq1Yte5Kg/M5if7c3DUzBg3S1iUFbctiGaIsz/U9cOxKrUNHGVdjwxD9L
	1Ck5Wcbt56kMINmhXoLj4hp4rwO1bFl6T9yzrkNswbBSgbHeEpXy89SJhY9LRxHnwebvQGhGVbw
	I1EKNzI/Rk5VkXSzUhamR6FPgfqV9wZl9au8pzaPqXH00tel3ppZlxynSdqh9MOy/jWzJp1sT3X
	KSoGHntq1pwnt6SSt3/5JkQ==
X-Google-Smtp-Source: AGHT+IHdHRz5ygZhpTYyipXzL2+kQpjXt95ma7h5f7Ng2oXDH8vIiDfPKBBpkWpLagLHgSt57lXBqQ==
X-Received: by 2002:a17:902:e80e:b0:234:8ec1:4af6 with SMTP id d9443c01a7336-24096b4158dmr76980525ad.45.1753915709361;
        Wed, 30 Jul 2025 15:48:29 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241e8976a06sm1475055ad.81.2025.07.30.15.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 15:48:28 -0700 (PDT)
Date: Thu, 31 Jul 2025 06:47:51 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Inochi Amaoto <inochiama@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for
 Sophgo CV1800B SoC
Message-ID: <fm3ayx67ip4km5qhn77v7s76bo5iyppmbrxhbcqdbc4pz2zstb@fbrishsvcazn>
References: <bfvsmafcsxy4gr4dsprn4z4yl2lltgje2oilsny7vanb7rsolq@t2prbsfisioc>
 <1856fbcb55769ae0.5ecf256b8267239e.f51806827c8576a5@Jude-Air.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1856fbcb55769ae0.5ecf256b8267239e.f51806827c8576a5@Jude-Air.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_154830_697360_B07C0E42 
X-CRM114-Status: GOOD (  50.56  )
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

On Wed, Jul 30, 2025 at 08:59:15AM +0000, Junhui Liu wrote:
> On 30/07/2025 14:05, Inochi Amaoto wrote:
> > On Wed, Jul 30, 2025 at 03:57:09AM +0000, Junhui Liu wrote:
> >> On 29/07/2025 16:31, Inochi Amaoto wrote:
> >> > On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
> >> >> Add C906L remote processor for CV1800B SoC, which is an asymmetric
> >> >> processor typically running RTOS.
> >> >> 
> >> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> >> ---
> >> >>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
> >> >>  1 file changed, 79 insertions(+)
> >> >> 
> >> >> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> >> >> new file mode 100644
> >> >> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
> >> >> --- /dev/null
> >> >> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> >> >> @@ -0,0 +1,79 @@
> >> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> >> +%YAML 1.2
> >> >> +---
> >> >> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
> >> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> >> +
> >> >> +title: Sophgo C906L remote processor controller for CV1800B SoC
> >> >> +
> >> >> +maintainers:
> >> >> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> >> >> +
> >> >> +description:
> >> >> +  Document the bindings for the C906L remoteproc component that loads and boots
> >> >> +  firmwares on the CV1800B SoC.
> >> >> +
> >> >> +properties:
> >> >> +  compatible:
> >> >> +    const: sophgo,cv1800b-c906l
> >> >> +
> >> >> +  firmware-name:
> >> >> +    maxItems: 1
> >> >> +
> >> >> +  mbox-names:
> >> >> +    items:
> >> >> +      - const: tx
> >> >> +      - const: rx
> >> >> +
> >> >> +  mboxes:
> >> >> +    description:
> >> >> +      This property is required only if the rpmsg/virtio functionality is used.
> >> >> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
> >> >> +    items:
> >> >> +      - description: mailbox channel to send data to C906L
> >> >> +      - description: mailbox channel to receive data from C906L
> >> >> +
> >> >> +  memory-region:
> >> >> +    description:
> >> >> +      List of phandles to reserved memory regions used by the remote processor.
> >> >> +      The first region is required and provides the firmware region for the
> >> >> +      remote processor. The following regions (vdev buffer, vrings) are optional
> >> >> +      and are only required if rpmsg/virtio functionality is used.
> >> >> +    minItems: 1
> >> >> +    items:
> >> >> +      - description: firmware region
> >> >> +      - description: vdev buffer
> >> >> +      - description: vring0
> >> >> +      - description: vring1
> >> >> +    additionalItems: true
> >> >> +
> >> > 
> >> > Why not allocating these region dynamicly? I do not think firware is
> >> > always avaible before staring. Allowing dynamic firmware give us max
> >> > flexiblity.
> >> 
> >> I'm afraid it's not easy to do this.
> >> 
> >> For firmware region, the RTOS firmware usually needs a physical address
> >> to link to, and I have researched and tested two RTOS (RT-Thread and
> >> Zephyr) on the C906L, both of them do not support position-independent
> >> execution or runtime relocation. Therefore, a reserved memory region is
> >> needed to provide a fixed physical address for the RTOS firmware.
> > 
> > I think it is simple and possible to add PIE support for these RTOS. As
> > the memory of CV18XX is limited, I do not want to see some reserved
> > regions. This may hurt users who do not need this.
> 
> Thank you for sharing your concern about the limited memory.
> 
> However, I think I have to wait until some RTOS supports PIE before I
> can continue to advance this patch series. At least I haven't found any
> guide on compiling RTOS firmware with PIE support for the two RTOSs
> (RT-Thread and Zephyr) I'm currently testing on the C906L.
> 
> Besides, I have searched the existing remoteproc drivers in the kernel,
> and haven't found any driver using dynamic memory allocation for the
> firmware region. It may take some time to implement this feature if we
> really need it on CV18XX SoCs.
> 
> > 
> >> (In fact, there is already a reserved memory region for the C906L in
> >> cv1800b-milkv-duo.dts)
> > 
> > This is just preserved for vendor zsbl and I have a plan to remove it.
> > Always let linux take care of all memory. It is good to support all
> > firmware implementation for CV18XX.
> 
> Got it.
> 
> > 
> > I think it is always good to use remoteproc like this:
> > https://www.kernel.org/doc/html/latest/staging/remoteproc.html
> > 
> >> 
> >> For virtio-related regions, the RTOS firmware also needs to know the
> >> shared memory regions for communications at compile time.
> >> 
> > 
> > I think you should investigate this and check if there is something you
> > missed. I haven't see any reserved region in remoteproc binding mentions
> > virtio.
> 

> Currently, in Zephyr, the only boards with OpenAMP sample support are
> the i.MX and STM32MP series [1]. Both of them define reserved memory
> regions for virtio and vrings in their respective Linux kernel device
> trees [2][3]. These are the only available reference targets I have at
> the moment.
> 
> Furthermore, searching for the keyword "vring" in the remoteproc
> bindings yields many results, which I believe mostly pertain to reserved
> memory regions for rpmsg/virtio.
> 
> $grep "vring" -r Documentation/devicetree/bindings/remoteproc | wc -l
> 24
> 

#grep -rl vring | wc -l
9

In fact, it seems not many boards add vring as memory region,
But for simplifity, it is OK for me to leave the vring as an
fixed region. Or just not support virtio at all... I see the
document of OpenAMP says it support no-virtio mode.

> So, at present, all my references use reserved memory for firmware
> regions (unless there is specific memory for the processor in hardware)
> and for virtio-related regions. Do you think there is anything I might
> have missed, or should some new feature be implemented?
> 
> [1] https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/subsys/ipc/openamp_rsc_table/boards
> [2] https://github.com/torvalds/linux/blob/v6.16/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi#L33-L49
> [3] https://github.com/torvalds/linux/blob/v6.16/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts#L68-L97
> 

Great, I think it is convincing. Thanks.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
