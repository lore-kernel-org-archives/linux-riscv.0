Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF7AC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 19:18:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AA1E20657
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 19:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eG0HmJgK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="KGLqAFYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AA1E20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCAeDwXYm/F3CGbXN7rP8hlo5edxLs+/v+3leUkjMws=; b=eG0HmJgKnsDmof
	2KaOXjLRzfkzYNZcCpm0NDCKCbpT6WcKS1pvMY92iIr0kYD9IAa7odBfmFY0kyhMIT/8uGsdgOrwm
	LRalBmcI32zBibKlyxgKPEVPSFLZHms5Hv9a6vraIvaCpzyKYg3aCfV7PuDca0mveRcUqI3CUHYg7
	zgAeRziqFsQQELNGZfuipqAOBl9JmjNJUD3HWk1FCI+A88JrzaiMMSO7IDOtFiI3pwEgQQhyjBLi6
	HNcXpnWv9FF1ibDnd0VkoB41GlY/fd3g/eOqN3Z9O90SHpDd5jfGNCLF+PtijkZfNwFTouI5LqeAV
	XXRbDKE8+MlSlcgqzSAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHw09-0004Di-PT; Wed, 31 Oct 2018 19:18:01 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHw05-0004Bo-Vw
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 19:17:59 +0000
Received: by mail-lf1-x141.google.com with SMTP id c16so12521286lfj.8
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 12:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RxOx4UxsJG5jgjaXfv1ilaOu021C+CnL1GguyaG3Z1o=;
 b=KGLqAFYUnHUQUzHettpzc4GrhaECEdMZ5CZiw0prPM4muAWosnLCV2NQjSWTp3V39T
 YggBvFms1BB/BetsIKrn0oPbLRyrMPRKhfg07VszQJ/ZRIRYHjvdxXrOQf8x+FH9mNF+
 nRgV50u1gdPR6KjGW5lZYiMXaVv8ct4e/KJHvUpeKYC9rCwsjuSkUKEDwbY8mr5DXcNu
 Rwnl2nukK03aekr79fBZXN3AwVrm9n75IvbOemwcpq5sj+JgXn/gWlpxN5iFse8eDkQr
 yv0kXbyfw77KTGcan344prLu2q440wI80A4moJxvWWhTpBpArqkhvAZqeN/lDvasCnop
 T+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RxOx4UxsJG5jgjaXfv1ilaOu021C+CnL1GguyaG3Z1o=;
 b=cqWt0pG99xfvyGAqwJII+1xh1dGdUObUjqYfLBlljbE3vA9MPqm6FonLbo5A2oNhwa
 A2UKROe2OAD/8C/e+ViwODXKFz7WQEQ/xrNUABcRPoLoOlZPOH7Q+zlEJUu4yAuQRAfe
 29yz6hgQzzHhvknaNAxEbF3VgrC8rXA26LlV3U0DuvNZyiQqFyKMkrBU4CutFRbVc8Pg
 H5Nd1DBnQ1LrSFHVfyTTPQzedI1W9KKxAOKSVRXmCOKxlOzTVLco562wbAozg9l+BPPG
 NsKWJgN+/uFVbA5wV/si17S2MwiL+3hUV4OqnDS0Sk/IjChq2YTXzl6IXfB3LgSAVlm4
 46zg==
X-Gm-Message-State: AGRZ1gKazr18dZfWIpIokaHY83HJdCgpAbxoGhSACM4Gb5iATLZXXx5b
 x4F28pCjj9t6kxaA+6R62+P6f+BZcLv8t/k+icHezw==
X-Google-Smtp-Source: AJdET5dSoe4//31Qm227f2J+EV7MY7SGZDev3MiIl8xvED1E0f3UOxXOZjpMjwY5H/yxgS428SmGkbWLMXRyY5tiIaE=
X-Received: by 2002:a19:4c02:: with SMTP id z2-v6mr2593679lfa.48.1541013464409; 
 Wed, 31 Oct 2018 12:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
In-Reply-To: <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 31 Oct 2018 12:17:32 -0700
Message-ID:
 <CAOesGMjHTRqqUWB9=XQADPxA+EWwcOSBrFsJB7c4m2b9kBAOmQ@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_121758_037276_03448510 
X-CRM114-Status: GOOD (  27.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zong@andestech.com, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, alankao@andestech.com, greentime@andestech.com,
 anup@brainfault.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 vincentc@andestech.com, linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031191732.uL3akoJqLvIDO_3yEwG7RQmeEvgnHmYATj8LMPa1rfg@z>

On Wed, Oct 31, 2018 at 10:27 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 31 Oct 2018 04:16:10 PDT (-0700), anup@brainfault.org wrote:
> > On Wed, Oct 31, 2018 at 4:06 PM Vincent Chen <vincentc@andestech.com> wrote:
> >>
> >>   RISC-V permits each vendor to develop respective extension ISA based
> >> on RISC-V standard ISA. This means that these vendor-specific features
> >> may be compatible to their compiler and CPU. Therefore, each vendor may
> >> be considered a sub-architecture of RISC-V. Currently, vendors do not
> >> have the appropriate examples to add these specific features to the
> >> kernel. In this RFC set, we propose an infrastructure that vendor can
> >> easily hook their specific features into kernel. The first commit is
> >> the main body of this infrastructure. In the second commit, we provide
> >> a solution that allows dma_map_ops() to work without cache coherent
> >> agent support. Cache coherent agent is unsupported for low-end CPUs in
> >> the AndeStar RISC-V series. In order for Linux to run on these CPUs, we
> >> need this solution to overcome the limitation of cache coherent agent
> >> support. Hence, it also can be used as an example for the first commit.
> >>
> >>   I am glad to discuss any ideas, so if you have any idea, please give
> >> me some feedback.
> >>
> >
> > I agree that we need a place for vendor-specific ISA extensions and
> > having vendor-specific directories is also good.
> >
> > What I don't support is the approach of having compile time selection
> > of vendor-specific ISA extension.
> >
> > We should have runtime probing for compatible vendor-specific ISA
> > extension. Also, it should be possible to link multiple vendor-specific
> > SA extensions to same kernel image. This way we can have a single
> > kernel image (along with various vendor-specific ISA extensions) which
> > works on variety of targets/hosts.
> >
> > As an example or runtime probing you can look at how IRQCHIP or
> > CLOCKSOURCE drivers are probed. The vendor-specific ISA extension
> > hooks should called in similar fashion.
>
> Yes, I agree.  My biggest concern here is that we ensure that one kernel can
> boot on implementations from all vendors.  I haven't had a chance to look at
> the patches yet, but it should be possible to:
>
> * Build a kernel that has vendor-specific code from multiple vendors.
> * Detect the implementation an run time and select the correct extra code.
>
> This is essentially the same as my feedback for the performance counter stuff,
> which IIRC is what prompted adding a vendor-specific extensions.
>
> If I was going to do this, I'd split it up such that the vendor-specific
> additions are per-subsystem.  That way we can focus on building a decent
> interface for each subsystem that needs vendor-specific support rather than
> just bundling everything together where the vendor-specific stuff will get all
> tangled together.

For short-term, powerpc's model of a machine descriptor with function
pointers that's either filled in at runtime, or set to the right
pre-defined structure per platform, should cover most of this I think?

Even if you have cases where an indirect branch isn't feasible,
performance-wise, _getting_ the function address from the table and
doing runtime alternatives-style patching still gives one place to
keep it.

I'm not sure if we need a table/struct per subsystem, or if one larger
shared one is sufficient to start. Since this is all in-kernel code
without external interface, I'd suggest starting simple and refactor
later if needed.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
