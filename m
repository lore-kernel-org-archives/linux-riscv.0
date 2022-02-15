Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36904C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 19:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Tu2a+dF81101LSmAxm4IpVModa+OrqUDy/dKNhEkFg=; b=mTQFB1DHereXKb
	8iNT8aX53UZdGmL4hM/W4aSgyUHXRlnhYHel3wwQdNOvQR5pBsrKxN3Jpwy+ycbDnrf7bP6GUzKYN
	JkrbrL1rFP+Zi8H8LiHTSKFs0zjBSDO3CjviypLDwvaPWN/hSyjJcN+3dhhRF9WWJ9Oelvq+cOiwf
	uFCIHzlvqQ9CGvwYGw6ri+Z3/kKOj9lyvAmIe2qn30BT390fpxWDN9LINNdcTBiwMFQC+H5jiTlr1
	Hrjoupr6rimWxu3Xanl8AQIIMv5Ev/xKIJi+BDAdB/JIIoMWKFk0/f52HmTk/TFWBtsQAXJWiilBH
	1vzQNESd28FbZVgv1z7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK39t-004DqU-1I; Tue, 15 Feb 2022 19:06:41 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK39p-004Dow-Ix
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 19:06:39 +0000
Received: by mail-ed1-x533.google.com with SMTP id q17so1055892edd.4
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 11:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/8fT1jITxEXv0d74qphSlqMJEk9MBPu5sIjQr+d/9sY=;
 b=nbMe6xa5ccdyHBW084IyHQVw+vIend9kQk4jZiIUpqWbg4Z1GFOZL3XOsH2DuNGfyZ
 nTtqDUK1j+p/Mj0NRyMkw5T1iYrVqxBIZw6Rmecw6Ek+pVeqv/TAwxTWDtwGhBhcBo7B
 SN5z6ZjXUABt1Y62HuKgrztqJ6z5+ye4SseRS5hCVBIzC11yv7e8LDoOwUaDjxZ6qjoI
 h34UsJO+pTd3L6Umr57Fhod5h8PNC9I6nWEaxd7hdDW7ALaRwH5qrdvoXg9SYyzOx94M
 6aeYp9paBfAXKO3udrUsO901FIFyoeurnJ540+y8devQcIsf8w/qCo1FgwSWRXWf5WN6
 E5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8fT1jITxEXv0d74qphSlqMJEk9MBPu5sIjQr+d/9sY=;
 b=xxLy5Um/lJCvJCHTnKYnOr1OkH/2K33lYtplINhGH3IczxHdbi18yJdx9afvZ1cEUh
 ZVcJJswyDjoJYTJX1P0itWr15qkG8BvZDWd2HW3KkuHEq63ni7xLn98TgbIoFxwzbZK6
 +J0zO3dE7UI2PetyrOH3de9BJSAxW5TGnpDJ4/Dl7DIfycAt0zkBXF2h5Te4BLLGZrwP
 l/Cuf5Ex33y307b1kKRgqsxphdihWCdX/eWK9Yu4ank8cAJraf+vIFO27CcRT4Co9ihV
 y+w0NHbZ3vK9+8fCzWfMJzX7R2Zj1fig9nGcLjwqI/JonsUK0zXHlQC0Vv2hYIbPENrU
 RJLw==
X-Gm-Message-State: AOAM532vCw/l/WJBmFeQ0RdfIfoFwZSgkDHXFGrRqbo4D/rrNziKKwU0
 rig0vXOaJD3NOtqpsETyqXMa4f7sp/N39M5ta+RPpw==
X-Google-Smtp-Source: ABdhPJwKWz49YOsJeeLn8Vu0A0KsVGCRfI6v+wh6/MKMWtUHy7PFRmz++HfRpep96WwWklWpix4D1JxPINlJTY+aI6A=
X-Received: by 2002:a05:6402:1601:: with SMTP id
 f1mr365734edv.165.1644951996023; 
 Tue, 15 Feb 2022 11:06:36 -0800 (PST)
MIME-Version: 1.0
References: <20220215090211.911366-1-atishp@rivosinc.com>
 <YgvNSeUekqEVS1yE@xhacker>
In-Reply-To: <YgvNSeUekqEVS1yE@xhacker>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 15 Feb 2022 11:06:24 -0800
Message-ID: <CAHBxVyF65jC_wvxcD6bueqpCY8-Kbahu1yxsSoBmO1s15dGkSQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Provide a fraemework for RISC-V ISA extensions
To: Jisheng Zhang <jszhang@kernel.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_110637_701624_75D6EF62 
X-CRM114-Status: GOOD (  31.77  )
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

On Tue, Feb 15, 2022 at 8:04 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Tue, Feb 15, 2022 at 01:02:05AM -0800, Atish Patra wrote:
> > This series implements a generic framework to parse multi-letter ISA
> > extensions. This series is based on Tsukasa's v3 isa extension improvement
> > series[1]. I have fixed few bugs and improved comments from that series
> > (PATCH1-3). I have not used PATCH 4 from that series as we are not using
> > ISA extension versioning as of now. We can add that later if required.
> >
> > PATCH 4 allows the probing of multi-letter extensions via a macro.
> > It continues to use the common isa extensions between all the harts.
> > Thus hetergenous hart systems will only see the common ISA extensions.
> >
> > PATCH 6 improves the /proc/cpuinfo interface for the available ISA extensions
> > via /proc/cpuinfo.
> >
> > Here is the example output of /proc/cpuinfo:
> > (with debug patches in Qemu and Linux kernel)
> >
> > / # cat /proc/cpuinfo
> > processor     : 0
> > hart          : 0
> > isa           : rv64imafdcsu
> > isa-ext               : sstc,sscofpmf
> > mmu           : sv48
> >
> > processor     : 1
> > hart          : 1
> > isa           : rv64imafdcsu
> > isa-ext               : sstc,sscofpmf
> > mmu           : sv48
> >
> > processor     : 2
> > hart          : 2
> > isa           : rv64imafdcsu
> > isa-ext               : sstc,sscofpmf
> > mmu           : sv48
> >
> > processor     : 3
> > hart          : 3
> > isa           : rv64imafdcsu
> > isa-ext               : sstc,sscofpmf
> > mmu           : sv48
> >
> > Anybody adding support for any new multi-letter extensions should add an
> > entry to the riscv_isa_ext_id and the isa extension array.
> > E.g. The patch[2] adds the support for various ISA extensions.
>
> Hi Atish,
>
> Thanks for this series. I'm thinking cpu features VS ISA extenstions.
> I'm converting the sv48 to static key:
> https://lore.kernel.org/linux-riscv/20220125165036.987-1-jszhang@kernel.org/
>
> Previously, I thought the SV48 as a cpu feature, and there will be
> more and more cpu features, so I implemented an unified static key
> mechanism for CPU features. But after reading this series, I think
> I may need to rebase(even reimplement) the above patch to your series.
> But I'm a bit confused by CPU features VS ISA extenstions now:
>
> 1. Is cpu feature  == ISA extension?
>
> 2. Is SV48 considered as ISA extension?
> If yes, now SV48 or not is determined during runtime, but current ISA
> extensions seem parsed from DT. So how to support those ISA extensions
> which can be determined during runtime?
>
> Could you please share your thought?
>

Here are my two cents:

I think the cpu feature is a superset of the ISA extension.
cpu feature != ISA extension.

While all ISA extensions are cpu features, all CPU features may not be
an ISA extension.
e.g. sv48 is not a ISA extension but F/D are (used to set the
cpu_hwcap_fpu static key)

Moreover, not all cpu feature/ISA extension requires a static key.
e.g SSTC extension will require a static key because the check has to
happen in the hot path.
However, sscofpmf extension don't need a static key as the check
happens only one time during boot.

We should keep these two separate but a common static framework would
be very useful.

Here is the flow that I have in my mind.
1. All ISA extensions will be parsed through riscv,isa DT property
2. Any supported/enabled extension will be set in riscv_isa bitmap
3. Any extension requiring a static key will invoke the cpus_set_cap.

cpus_set_cap will be invoked from a different code path that uses a
static key for a specific ISA
extension or a CPU feature.

The only problem I see here is that we have to set a bit in both
cpu_hwcaps & riscv_isa bitmap.
We also have to define the value of that bit for any extension
requiring a static key twice as well.

I think that should be okay. But I would like to hear what everybody
else thinks as well.

> Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
