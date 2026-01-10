Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11522D277D1
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tq6YfJlGurMgu5VFLW5sOscz9rO6bZyaYJg/85npDL0=; b=FqiYQstzgLkjGR
	8xtGEUpRw4P4nkk5hGlCkPq+UwGZGUXHZeKUsWQ7+6lfYyVe7lAHrCmWwH7ZrP66fvdJzEirXjRNh
	yt+7cif5IIkbjVejeTxqCvcHpnt38hwsGUn4cjcBUQU2ns9mcvzhQJMdM6OP5LG2q2cTNQ+SbhVye
	RMtM4onQhp8DYs7RQUlLGWpet3XNjebn1nGUsWlonDY8IrNDQGM6MvKsC2ZREnZTESNsQLOgK7Msi
	QR8GWpASy2Eybmrg3vSy2i1LXo6zdiCKCRyYXRhj0r+JBhZhN+nnT+LDEmSzuFDRUMzk3MJR3CHZo
	pxuNKWczOM9Pjvfjqk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRNN-00000003FpM-0NXh;
	Sat, 10 Jan 2026 05:19:01 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRNJ-00000003Fp1-3Zja
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:18:59 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a0a33d0585so32276475ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022336; x=1768627136; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwINnpUPFb0M8hbnqw2ipXo4djJBXYPLd1SCBqsQOZA=;
        b=LIom990z0FWolhRKI3DtTer/nwonLRVy/ISeDXupMPERv+2q2As6sDTtVNPeJCvoU6
         vqTyQtEKlsLH5inkUDDUZz8vUVaqgM9L41FyM5IRtw0KCzbQVC1s+phMaqKDnCjSosX9
         Rl1uy4BFZYZIXBCCWJ14euE5+8I84kadRdIjhyqv6zjnQgzHxC5koXOYkBZuznhBWIq+
         8OgSphj8YHzk8/xGQrx8sMa2YZalJYi17SKJ0aaKvu2VFVHzP3yt0w2aHNZDY4ZDebBt
         UDpGrbRSxih4t1ZJd+CeBsIcXTueB4l6OPEMd83tMiEsukdUU+3wLxVdp+eXw8bP5P3R
         3h3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022336; x=1768627136;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwINnpUPFb0M8hbnqw2ipXo4djJBXYPLd1SCBqsQOZA=;
        b=fyOIto6VYq5HNHrL1O8sGZgbtuvC/5vRCS9CWBWh5JSuDtDeQg0+aoYUPW6dhdwFL2
         oBtNcHV2GKojFQrqvKaVgZACNsRJUgXERAq4V6sjuOsTIlVsUlI9/7+MDFbkkyoiFiCJ
         5tUI6HUQK+P25s6z8gsJFbi3pycEnYcKBAEDMObCwQGlaa4ZQsO/9+QBJB9sIL7FdGd+
         gWAmgvwS6NEiFUiKnd0K/0hTmftA3EXRG22FuDSCRol325Y4jIhJo5qeoO7uvzJDDqvF
         ePes8g15jWP6VqS0ZaOONISujCvpYOkvb6aCtpm9PIEeQ56Z5EaC9Qj5Wq68TLuECWFO
         o7MA==
X-Forwarded-Encrypted: i=1; AJvYcCWAk59aF0ABbba7ePWtY48aCW+jnVd2I2ENfHnRHJbGqaA8pOhqjntR72xscm4F1w/5hTmlB9rnMfyAPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDruHo/8RwLpN7iWwGubShenD7yP5nmMwSccTvBBjEQQXbeqVl
	o9SrxSMi3YRvv3BebebQeLDnnqzhKJqp8czzmQTftgZk+bSgSTNMq67wnpuSLUWemMs=
X-Gm-Gg: AY/fxX5fFSCRAuc/Gi47OsyisZ4bhXYX2AJ4qc8999wHtVzSiWUn5QRHwLbqR4uS/sj
	9OTXWsN/Xj7rT0KrABBfqTcPU/0OK4ZcBrFyYV8louG+FixHz5TwpJkxo3FUbR+OjAkv5lh31+u
	jeep6a9IXSlhcjXkdSBRB4+EwfJicVJIekgYvOVWGMABGPSS2IaAcRPJO0YlDFWsZqkmxO/byQf
	EiuVPp5PfWPoMwLRqS1vVNazDmbawBosexqxGpe0twlrvNQNi2znh3BlNzPTjW6AXnF/eA3KDK1
	pR/xjgpcbmq0cmy9itEfMQ0mfztoJvZkiKehbDyha5gEhoFtaqf8OjNM9ZWZy6mQ/wI4VTtB9va
	NGZBu/tYGKRYkn8q3TfXc01c6Ep37ZmwBzTeJVcxQgtPSz0jlnMdzg2mxdBvA4+lJkJI08LG20C
	eyer7UGYL2FEhiuArmC1UTMLHjM1cqZfv4S6wf4QM8i1Ig85hx6R3nEw==
X-Google-Smtp-Source: AGHT+IHgj01KDJwIVi20hSTPJNWxRc9OnOAfkIzPOzB7+X4nvk7f4qSMG8zVfgmzJIM3AOdnYhkWSg==
X-Received: by 2002:a17:902:cf05:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a3ee49015dmr105294885ad.37.1768022336093;
        Fri, 09 Jan 2026 21:18:56 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:18:55 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v4 00/11] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
Date: Sat, 10 Jan 2026 13:18:12 +0800
Message-Id: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABThYWkC/23QwW7CMAwG4FepcsZT4rRVw2nvMe0QHBcsRLslW
 cWEePcZ2KSBOP62vl+yT6ZwFi5m3ZxM5kWKzJOGdtUY2sVpyyBJs0GLnUPXw97DJhYhSBUoha6
 1tndhCEbFR+ZRjte2t3fNOyl1zt/X8sVdps97FgcWok3Y9RQSBXzNUqjUmF9oPphL1YL/OOI9R
 +U+jn70lOw4xCfc//HeOjvcc6+cUwi8acnH5B/4+XZZ5s8vfU+9nWeUM+j+IHXdTHys8FseVJx
 /ADq4RXtYAQAA
X-Change-ID: 20251216-k3-basic-dt-cd9540061989
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_211858_178931_C0E7B780 
X-CRM114-Status: GOOD (  18.60  )
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

This series introduces basic support for the SpacemiT K3 SoC and the
K3 Pico-ITX evaluation board.

This series (starting from v2) also adds descriptions about ISA extensions
mandated by the RVA23 Profile Version 1.0 into riscv/extensions.yaml.
There are extensive discussions about how to handle these new extensions
in v2. In v3 (now v4), here is my best understading of what I think we have
reached consensus on.

At v3, Samuel Holland shared his opinion regarding how "supm" should be
handled [3]. He suggests removing "supm" from devicetrees not targeting
U-mode. I did that in Patch 10/11 of v3 with k3.dtsi. Samuel also notes
that "supm" could make sense as a binding for devicetrees targeting U-mode.
Considering there are other changes suggested in [2] and [3], I would
prefer to start a separate patchset dedicated to "supm".

Among others, major change in v4 is adding m-mode imsic and aplic nodes
into k3.dtsi (Patch 10/11) to better represent the hardware.

Hi, Conor

For the binding riscv/extensions.ymal, here's what changed in v3 (no
change in v4):

 1. Dropped the patch of adding "supm" into extensions.yaml. At the same
    time, I will start another patchset which implements the strategy
    outlined by Conor in Link [2] and by Samuel in Link [3].

 2. Dropped the dependency checks for "sha" on "h", "shcounterenw", and
    6 others. "sha" implies these extensions, and it should be allowed
    to be declared independently. Like "a" implies "zaamo" and "zalrsc".

 3. Enchanced the dependency check of "ziccamoa" on "a". Specifically,
     - added the dependency check of "ziccamoa" on "zaamo" or on "a".
     - added the dependency check of "za64rs" on "zalrsc" or on "a".
     - added the dependency check of "ziccrse" on "zalrsc" or "a".
    The commit message of this patch is updated too, to better explain the
    relationship  between "ziccamoa", "za64rs", "ziccrse" and "a".

 4. Enhanced checking dependency of "b" and "zba", "zbb", "zbs", making the
    dependency check in both directions, as discussed in [4]. Since "b"
    was ratified much later than its component extensions (zba/zbb/zbs),
    existing software and kernels expect these explicit strings. This
    bidirectional check ensures cores declaring "b" remain compatible
    with older software that only recognizes zba/zbb/zbs.

Thank you for your review.

Because the K3 uart compatible string patch (Patch 5 in v2) has been
applied in tty.git, the entire series now rebased on top of linux-next,
tag: next-20260109.

The SpacemiT K3 is an SoC featuring 8 SpacemiT X100 RISC-V cores.
The X100 is a 4-issue, out-of-order core compliant with the RVA23
profile, targeting high-performance scenarios. [1]

The K3 Pico-ITX is an evaluation board built around the K3 SoC.

From an RVA23 profile compliance perspective, the X100 supports all
mandatory extensions required by RVA23U64 and RVA23S64.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://lore.kernel.org/lkml/20260101-legume-engraved-0fae8282cfbe@spud/ [2]
Link: https://lore.kernel.org/all/4ebbe14b-2579-4ba6-808d-d50c24641d04@sifive.com/ [3]
Link: https://lore.kernel.org/all/20251230-imprison-sleet-6b5a1e26d34b@spud/#r [4]

Changes in v4:
- Patch 5:
   Adjust maintainers list in alphabetic order.
   Declare spacemit,k3-pico-itx as an enum, which could save future
    code change when adding new boards.
- Patch 10:
   Fix missing blank space after comma in simsic compatible.
   Add m-mode imsic and aplic nodes, per suggestion received from Samuel
    Holland.
   Adjust node properties order in nodes simsic, saplic, mimsic, maplic to
    follow the DTS coding style.

- Link to v3: https://lore.kernel.org/r/20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com

Other Changes in v3 include:
- Patch 1:
   Acked-by: Krzysztof Kozlowski
- Patch 4:
   Acked-by: Krzysztof Kozlowski
- Dropped Patch 5 "dt-bindings: serial: 8250: add SpacemiT K3 UART compatible"
   as it has been applied to tty-next.

- Link to v2: https://lore.kernel.org/r/20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com

Changes in v2:
- Patch 1:
   Fixed alphanumeric sorting order of compatible strings (swapped x100 and
     x60) as per Krzysztof's feedback.
   Update commit message with more information about X100 featurs per
     Yixun's feedback.
- Patch 4:
   Fixed the order to keep things alphabetically.
- Patch 6:
   Use "one blank space" between name and email address.
- Patch 7 ~ 11:
   New patches. Add description of RVA23 mandatory extensions into riscv
    binding YAML file.
- Patch 12 (Patch 7 in v1):
   Removed aliases node.
   Updated 'riscv,isa-extensions' with new extension strings available
- Patch 13 (Patch 8 in v1):
   Updated the memory address to the hardware truth.
   Added aliases node in board dts.
- Patch 1,2,3,5: Add Reviewed-by and Acked-by collected.

Link to v1: https://lore.kernel.org/r/20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (11):
      dt-bindings: riscv: add SpacemiT X100 CPU compatible
      dt-bindings: timer: add SpacemiT K3 CLINT
      dt-bindings: interrupt-controller: add SpacemiT K3 APLIC
      dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
      dt-bindings: riscv: spacemit: add K3 and Pico-ITX board bindings
      dt-bindings: riscv: Add B ISA extension description
      dt-bindings: riscv: Add descriptions for Za64rs, Ziccamoa, Ziccif, and Zicclsm
      dt-bindings: riscv: Add Ssccptr, Sscounterenw, Sstvala, Sstvecd, Ssu64xl
      dt-bindings: riscv: Add Sha and its comprised extensions
      riscv: dts: spacemit: add initial device tree of SpacemiT K3 SoC
      riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board device tree

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../interrupt-controller/riscv,imsics.yaml         |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/extensions.yaml      | 169 ++++++
 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  38 ++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 590 +++++++++++++++++++++
 9 files changed, 807 insertions(+)
---
base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
change-id: 20251216-k3-basic-dt-cd9540061989

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
