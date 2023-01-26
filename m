Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914EAC54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXr/MTtXVpsKmIXrlLie0OhQaYoizB47sWx10VsyqUc=; b=nZyC+Tjt+0zNL3
	sgH+5gaxkZ6N7oFEZCtjwPQH2Nel+AJbx9O6XhEuW/Kx8BnM+d5lLic6lCZdBPB16yiNTJhycyF07
	OkVCUKoXRPtGLL2fLs8TLFyVUmDrxddV3rm/YJua+FpV9alb7SNSznW6BBow6TdOvqfTNJGhPNgjE
	68719RgCpCOcvUTDcrTz+IXugaP75CzxekslkmaW2UynHrUWWH6z/qydq75BN5fKZ/nQgC3h990nF
	4bUfZgnR9sO57kY0z4PfTVs3BHPIpbEiigBd5B60I6gSLOg/9pUwH1vzxXo3uOTSXOpm4Pf1nuPlg
	5/WndPi6Aqj6MVIyvULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4pw-00Bg8j-8T; Thu, 26 Jan 2023 16:10:52 +0000
Received: from smtpout30.security-mail.net ([85.31.212.35] helo=fx305.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4pl-00Bg1z-HZ
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 16:10:45 +0000
Received: from localhost (fx305.security-mail.net [127.0.0.1])
	by fx305.security-mail.net (Postfix) with ESMTP id 257F930FDE8
	for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 17:10:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674749438;
	bh=18h0PvVkWw5cOD2tUF5rJDodhNIHFoyGd3swtBhEV9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=5vw5axJyF9LieKbQoJGxZArRGN69LCOIdRjMzwH3t6+nxH+vLwTkOG09Vp3KdRfMv
	 ouyIKTDSpHaCKiX0Kt8ISHUYWNsi3G+unW7AOZpjPagkpGGmVRVmDayrctlEFac0i9
	 DqUoX1gQPAUU+EvHyIEXLgEGNiJnWX0QmlIZT5uI=
Received: from fx305 (fx305.security-mail.net [127.0.0.1]) by
 fx305.security-mail.net (Postfix) with ESMTP id A9D2330F977; Thu, 26 Jan
 2023 17:10:36 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx305.security-mail.net (Postfix) with ESMTPS id 6F4FF30F6F9; Thu, 26 Jan
 2023 17:10:35 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 2AA7527E0431; Thu, 26 Jan 2023
 17:10:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id F335127E0461; Thu, 26 Jan 2023 17:10:34 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 ckvuBGSN-_53; Thu, 26 Jan 2023 17:10:34 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 8E3C527E0374; Thu, 26 Jan 2023
 17:10:34 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <3ac4.63d2a5fb.6cc14.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu F335127E0461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674749435;
 bh=9giavlvQOACZW0fqif+Jno6XkcerIxtPM3AoszI6iXA=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=gjg/x2TlOcjiKN3NypFbIHFe/byI2jjV8o3VpLfw+6A29RvT0tO7rhyOLP4RSQBmB
 x4Tx+6M47/jYTq+5ZLA2uCIUhHGzwDXxt8eUceRV5P9eFpkBGwoYQYAzaEc236wUu9
 1kIkSP3K+m+aYLf/4oc9MR/KzKUTElR11/fHsdhg=
Date: Thu, 26 Jan 2023 17:10:33 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon
 <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng
 <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Oleg Nesterov
 <oleg@redhat.com>, Ingo Molnar <mingo@redhat.com>, Waiman Long
 <longman@redhat.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>, Christian
 Brauner <brauner@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Clement Leger
 <clement@clement-leger.fr>, Vincent Chardon
 <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
 <dkm@kataplop.net>, Julian Vetter <jvetter@kalray.eu>, Samuel Jones
 <sjones@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis
 <tcostis@kalray.eu>, Marius Gligor <mgligor@kalray.eu>, Jonathan Borne
 <jborne@kalray.eu>, Julien Villette <jvillette@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet
 <jhascoet@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, Guillaume
 Missonnier <gmissonnier@kalray.eu>, Alex Michon <amichon@kalray.eu>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>, Shaokun Zhang
 <zhangshaokun@hisilicon.com>, John Garry <john.garry@huawei.com>, Guangbin
 Huang <huangguangbin2@huawei.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>, Benjamin Mugnier
 <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/31] Documentation: Add binding for
 kalray,kv3-1-core-intc
Message-ID: <20230126161032.GH5952@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-3-ysionneau@kalray.eu>
 <d4d998ee-1532-c896-df25-195ec9c72e3f@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4d998ee-1532-c896-df25-195ec9c72e3f@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_081041_800870_44EFCACD 
X-CRM114-Status: GOOD (  30.90  )
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

Hi Krzysztof,

On Sun, Jan 22, 2023 at 12:44:46PM +0100, Krzysztof Kozlowski wrote:
> On 20/01/2023 15:09, Yann Sionneau wrote:
> > From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).
This will be fixed, sorry for the inconvenience.

> 
> > 
> > Add documentation for `kalray,kv3-1-core-intc` binding.
> > 
> > Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> > Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> > Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> > ---
> > 
> > Notes:
> >     V1 -> V2: new patch
> > 
> >  .../kalray,kv3-1-core-intc.yaml               | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-core-intc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-core-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-core-intc.yaml
> > new file mode 100644
> > index 000000000000..1e3d0593173a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/kalray,kv3-1-core-intc.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/kalray,kv3-1-core-intc#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Kalray kv3-1 Core Interrupt Controller
> > +
> > +description: |
> > +  The Kalray Core Interrupt Controller is tightly integrated in each kv3 core
> > +  present in the Coolidge SoC.
> > +
> > +  It provides the following features:
> > +  - 32 independent interrupt sources
> > +  - 2-bit configurable priority level
> > +  - 2-bit configurable ownership level
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: kalray,kv3-1-core-intc
> 
> Blank line between each of these,
Ack

> > +  "#interrupt-cells":
> > +    const: 1
> > +    description:
> > +      The IRQ number.
> > +  reg:
> > +    maxItems: 0
> 
> ??? No way... What's this?
This (per CPU) interrupt controller is not memory mapped at all, it is
controlled and configured through system registers.

I do not have found existing .yaml bindings for such devices, only the
file snps,archs-intc.txt has something similar.

I do not know what is the best way to represent such devices in the
device-tree.  Any suggestions are welcome.

> 
> > +  "kalray,intc-nr-irqs":
> 
> Drop quotes.
> 
> > +    description: Number of irqs handled by the controller.
> 
> Why this is variable per board? Why do you need it ?
This property is not even used in our device-tree, this will be removed
from the documentation and from the driver as well.

> > +
> > +required:
> > +  - compatible
> > +  - "#interrupt-cells"
> > +  - interrupt-controller
> 
> missing additionalProperties: false
> 
> This binding looks poor, like you started from something odd. Please
> don't. Take the newest reviewed binding or better example-schema and use
> it to build yours. This would solve several trivial mistakes and style
> issues.
I am starting over from the example-schema.

> > +
> > +examples:
> > +  - |
> > +    intc: interrupt-controller {
> 
> What's the IO address space?
As said above, this is not a memory mapped device, but is accessed
through system registers.

Thanks,
-- Jules





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
