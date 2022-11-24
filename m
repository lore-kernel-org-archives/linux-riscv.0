Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3D2C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZmijGF85Qf3QAtoMO0hKS0h4+aacnFY4GZ+Zn9v0qg=; b=yydCfdGU8uTTpf
	B1N7ah1X+MLT6W/PsmEa0dVzI4L01UWgWZ0zhO5FvfEImNWd2i8eXo8uxruzYMz5rIjzAUZI4fjYt
	A8yEjta4Qbe1hqv3IODYFzFicAR93VwWNOr8yvJm9pWX4VxjhvyVcaCYA7jwMnhhEthHDuLN8ME+8
	UIc/zivAqagSQsLeO6+Ll2wJ6tc0zUfyOdIjz/AAykZ4rRWHWJf9vvEiThU7PuLgnOA40Nki82DXq
	rgYnwr9JgvOtNvtMbKNAFB6fdToSapHfulxPZfok/QakDFaIf4MGg0b/waZBp+D5rTL3W3HR7hsQB
	RWXlzEFuBI/3ScP/doUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyABu-007y0S-Hm; Thu, 24 Nov 2022 11:14:50 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyABq-007xxY-Kc
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 11:14:48 +0000
Received: by mail-ej1-x62e.google.com with SMTP id e27so3371526ejc.12
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 03:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QvdZHlaUeA/kpuIQxOoAXYG4uxIMkVdwq3XVOXD0WSo=;
        b=fEL+Huo3PZo+OmBMXv2J5c0oB97G5+JckioepzGtYr+NQOFGp0GBpGyozzLOwOqHDN
         yeW/xslWFHQiDkOLQ6WpkuC0zKawjyVjK534QazFVc/ePeRY41UQZqssNje5EggfXJpI
         zBBXXtwtvHLKqkojmAxVBShDEOUynvVf2yu417rmcUotM7Bo/CGU4zz6tntTRbv8b4Vw
         8sk7MUIC2tf4C2F8IVlufJkRziC/zk/bJueQW68bK1KlNhskyD4CM7NsAYjrbf1pd7KB
         GxZOJ9NsHrC8mfo8t3kJgjFiP/ahNXgrMTwNjpnq31V/cWlxGz9srgWGjc+q4n/QiXDt
         K5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvdZHlaUeA/kpuIQxOoAXYG4uxIMkVdwq3XVOXD0WSo=;
        b=eINRYrO2N0nFOEHMgCE73J+TpMMewoTk6ItrlydH5WUrNkutngiLCVYNshgRtY7Zec
         fQtXMRTNwIccg8qz2TpdINR24kvchG5JGuWaOse8Yo+vRr5OsIzSlwuHw6F9H6UJ7/l3
         gbtU4vANQu4llVYKGhieMUEr4uxGMulp9c/Sl2hgA3askRIETZF6iudtrF7VYxhdMJq0
         jOgFCgKTznJigskfkpVg0B1gHvA1tVLAh6l51mBSJhBUQ6emD33w0r5AfMFmrk5yt4WM
         gKU16Jjazz0MaOlaB5q/EmiHVXaMYDBHCRbPMBhjZviZ+cJ5l/pDfcWiGSiZf5LTXXCH
         r+aQ==
X-Gm-Message-State: ANoB5pmRRM0+gPG3QQWCz+gDHPIRg5P3FDlgfklStkbIaZz/2hkkTBMd
	kjvN9HmZ2MBhPoVlVslyK8T44g==
X-Google-Smtp-Source: AA0mqf4My+PCFrVMy9/RTm1cNg83OFY3uPJgeZtgX4OdvMlMOBdlIlcgWhQ7PRakvreWdz6sf89YCA==
X-Received: by 2002:a17:906:79c4:b0:778:e3e2:8311 with SMTP id m4-20020a17090679c400b00778e3e28311mr12814855ejo.342.1669288482935;
        Thu, 24 Nov 2022 03:14:42 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id u17-20020a1709061db100b0078128c89439sm321900ejh.6.2022.11.24.03.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 03:14:42 -0800 (PST)
Date: Thu, 24 Nov 2022 12:14:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC 5/9] RISC-V: KVM: Add skeleton support for perf
Message-ID: <20221124111441.oixispy6d7rit7jr@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-6-atishp@rivosinc.com>
 <20221101141329.j4qtvjf6kmqixt2r@kamzik>
 <CAOnJCULMbTp6WhVRWHxzFnUgCJJV01hcyukQxSEih-sYt5TJWg@mail.gmail.com>
 <20221123131104.zglb3osa5tsgkkkb@kamzik>
 <CAOnJCUK0PcSXxt-Qvomy-4UoP5993-bVfPvWn_Rd5=ELC9n1gA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUK0PcSXxt-Qvomy-4UoP5993-bVfPvWn_Rd5=ELC9n1gA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_031446_697793_2A7317AB 
X-CRM114-Status: GOOD (  26.85  )
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

On Thu, Nov 24, 2022 at 01:09:03AM -0800, Atish Patra wrote:
> On Wed, Nov 23, 2022 at 5:11 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Tue, Nov 22, 2022 at 04:46:14PM -0800, Atish Patra wrote:
> > ...
> > > > > +     kvpmu->num_hw_ctrs = num_hw_ctrs;
> > > > > +     kvpmu->num_fw_ctrs = num_fw_ctrs;
> > > >
> > > > Maybe it's coming later, but we need to give KVM userspace control over
> > > > the number of counters to allow it to migrate to a larger set of hosts.
> > > > Also, a previous patch said the virtual width must be the same as the
> > > > host width for the hw counters, so we need userspace to know what that
> > > > is in order to determine to which hosts it can migrate a guest.
> > > >
> > >
> > > Yes. The entire user space access control needs to be sketched out.
> > > We probably need another one reg interface to set/get the number of
> > > counters/width.
> > >
> > > However, Is it a common to migrate a guest between different hosts
> > > with different PMU capabilities ?
> > >
> >
> > Ideally we'd be able to define a virtual CPU+PMU which represents the
> > least common denominator of a set of hosts, allowing VMs which use that
> > VCPU model to migrate among all the hosts. x86 pulls this off pretty well,
> > but arm64 doesn't. In the least, I think a goal should be to enable
> > migration of VMs from hosts with less extensions and less PMU counters to
> > hosts with more, as that would support host upgrades without having to
> > recreate VMs.
> >
> 
> We also have hpmwidth to worry about. I guess the policy details will be
> VMM specific one. We need to think through the parameters that can be
> varied between
> hosts. As you pointed out earlier,
> 
> 1. hpmcounter wdith
> 2. Number of hpmcounters
> 3. PMU related ISA extension - this will be applicable for all the extensions.
> 
> Anything else ?

I can't think of anything at the moment. Hopefully most potential
differences (features and errata) will be in extensions or in
number, i.e. smaller sets of things which can be emulated with
larger sets.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
