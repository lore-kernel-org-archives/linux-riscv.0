Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_SBL,
	URIBL_SBL_A autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656ACC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 08:49:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F3B2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 08:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L4cULtJq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gmek5rh3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F3B2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whG4PwWQ0gNS06NR5EijUqwLWjxl/UYe8LF25S06PKI=; b=L4cULtJqLbw4qV
	mORvChHeqV+FzEqoyurjbgAiAayA4uzXsgCXc/pbBKGO7AfF8ZSI33JEWpcOxo2LtAfdTRfLGqejn
	P6kA/JmJ2g0SwhdKsfqfcSNAYBJ8UGUS5EpB6sVJlKSnE7zaEt/+nrX483k7fPwS63HZH+U4VIcYY
	7DcYsAs8FZ1RSm5Ae0x69XB5JlEX8GfewarDBVzmEAUHSYSTq5KCYnR6BRL23m/vQ/ecTQ7d9QK3N
	hAffsgl3wZF/mYtlc0CBREPL84U6nShF2yDfkMkaKbMkupKD4MAxZv2hJ/+ilrlV+gK5ro0h/lvaQ
	XOvkkSWdsrPITsBQ/zOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHmBT-0005AG-Ij; Wed, 31 Oct 2018 08:49:03 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHmBQ-000591-Qd
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 08:49:02 +0000
Received: by mail-oi1-x243.google.com with SMTP id e3-v6so12930870oiy.6
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E38TYy/cdUwEN1z2VmhmbZ6MYoFHLlpu/aw0NuhFiAE=;
 b=Gmek5rh30YVoC7Sy05Te0inedXqCYrAQOEAt+kYS8oBjxSJlW/0AvfpSUqE+vr/xyC
 gzIfHmPWND+2BsDPLqW2L6OwMSI2+8NZrv6DmsGq+K7rfLJpLLbS5gBCLPaq+qo8JfOD
 IPcK0ZD4+e5/qCG5eFBdZLcPv0KbbcwdjlxxHisOQoiE/KzQvmrwgidMLkZOW2fOAs2k
 fg81vI7KPNAMw20GDg9OCoxZiirFFdZ/SgYTcDfci4EAd3CW8C2FU9qBviZslINLuf3C
 E+BA4Zz09nby3gYMI8JARdm/BiWNoBQ36yAJ+xfAvGXWoGhvfVckrEkDvZsOMYVwId+n
 LbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E38TYy/cdUwEN1z2VmhmbZ6MYoFHLlpu/aw0NuhFiAE=;
 b=PEmAOyE9ZCuAEf9vxq/8K8znpd5pk2Xs0DSk3nhlTvON88N577GHy1peVFJvU0heLB
 mwFc+Sb03Qdh+cY0687s/3j/Khc3CZGhl9o4cDnWjaAy6EsZXCSiWK4WKtQlz4ZWNlan
 Q1GL7wqitGQ6yWhB6BQL759nqWy270btNSfyt1gjlCe6GJ3jVz9uTLk9FB2cTZrLioU6
 E2M55IuKTC/tUbgGeOHQMAs5h+4d8PbfO28GObhWsLV5RLGMxx2Mp6lgXeJsDbUTrHOl
 TrZdYkdPlUiOs5ed4i2AL8MgcJbXqzcnZz9Jou7Uyf58A/rfQ5Gzgm82UDA0tCaE9a68
 wMbA==
X-Gm-Message-State: AGRZ1gL4ByZ5dizwLyEgJStPbza1nE6JgUFR1q+YeLjNx1CZOdIF+uuL
 qSHs4N49P24Pc6LsRJNEuOkIp9TrD33KJ91lK7o=
X-Google-Smtp-Source: AJdET5cldKuh/ybgK8WH+I3UWbbluAL/xihZE76OF/HtjnvZTa0XdFrxw2OPYeT2YrYW+u9bmcqfEuHc5XEK4IL29gw=
X-Received: by 2002:aca:7242:: with SMTP id
 p63-v6mr1166264oic.169.1540975729508; 
 Wed, 31 Oct 2018 01:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
 <CAEn-LTopspBXzoLZEFWQGxxC7uNJ9RZHiHyYmJPpWR4zKnj5zw@mail.gmail.com>
 <CAGw6cBtMu7qs2in-=eX1J6bpPK-L-8cSa5pocQ6CA=en-ju3EA@mail.gmail.com>
In-Reply-To: <CAGw6cBtMu7qs2in-=eX1J6bpPK-L-8cSa5pocQ6CA=en-ju3EA@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Wed, 31 Oct 2018 09:48:38 +0100
Message-ID:
 <CAEn-LTpfFWO864brKCj_FyaBFQuy8wvxs5OdP7rAOziJLDKc4Q@mail.gmail.com>
Subject: Re: virtio-gpu without ARCH_HAS_SG_CHAIN
To: Michael Forney <mforney@mforney.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_014900_890242_E59496B0 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031084838.I1TwfiftM4xaH2bNCyEJfj9aQECP_KxlxdiATDwAWkk@z>

On Tue, Oct 30, 2018 at 6:25 PM Michael Forney <mforney@mforney.org> wrote:
>
> On 2018-10-29, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> > On Mon, Oct 29, 2018 at 8:47 PM Michael Forney <mforney@mforney.org> wrote:
> >>
> >> - Should riscv support ARCH_HAS_SG_CHAIN?
> >
> > Non-expert here, but it looks like ARCH_HAS_SG_CHAIN
> > support is generic, and a number of well known architectures
> > support it.
> >
> > So it's basically two line patch someone needs to send and
> > at least make a test by building the kernel. I can do that if you want.
>
> If that's all there is to it, then yeah, that would be appreciated. Thanks!
>
> Though, I assume there's *some* architecture-specific consideration
> that needs to be done, since it has to be selected on each
> architecture that supports it.

Done it yesterday morning. Compile-tested and I am running
the kernel w/o any issues.

Btw, if you get virtio-gpu support in TinyEMU it would be interesting
to see how that works with Fedora. I have some instructions about
that here:

https://fedoraproject.org/wiki/Architectures/RISC-V/Installing#Boot_under_TinyEMU_.28RISCVEMU.29

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
