Return-Path: <SRS0=FXTp=BN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C877AC433DF
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 17:46:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEC0D20775
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 17:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C5rTpZI6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="N5Qj1DvL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEC0D20775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HkEfORG2zbGbER1as0oC5yta8wbzpx8o9z0fRA1Za4Q=; b=C5rTpZI6YXOrY3hURGeRWreSs
	VCV6Fuvxuvl3KFJXFJhpY2I2x2zwAsQwKy4awPy9vNzhiQamsRzG5w/ba29mywsxK1xHTrotzbNd0
	JyxYYISAOcgqXe4lxRTmJy+gDB9eY249hZHmodbTwZaXZlaLUDyQU3HkdTZnyxsJljp4bNauhRgFb
	vlg8qgxZGS9NhYSp8Gnj3R67g1S4QFN6zYY5caBzSLKjaHAzeOdY5hL4QHRrVGn+4cNKTr2TMQotP
	TAjMIU24fUepVvrA8QOukBd+ghEPCCQnZgaROTZt+IDMX2mS1+HR/D9oR5BhY7jNvUUrJySceFB7I
	Aapae3/pQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2eXg-0003ol-6b; Mon, 03 Aug 2020 17:46:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2eXd-0003oN-Kj
 for linux-riscv@lists.infradead.org; Mon, 03 Aug 2020 17:46:30 +0000
Received: by mail-wr1-x442.google.com with SMTP id y3so35009776wrl.4
 for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2020 10:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hWiPVvrtSRv9C+ql01+v8IPdBTpvYSuGz2tUHYXz6hU=;
 b=N5Qj1DvLXd/yR99GqWAwqp8fsEGzXI7CaqGJX8THYUZIEtpcqjfVVGARPjToG10w/Y
 b/+lYGJjdl9d38WP+ln6bfK+C6q0aCoJPbntpJzp4yHrn6QcIb/l2zSxzsdN9AoRF++j
 wwOQ68QWXDXYZuz6dlwmJTo45fD0qfj4tVTiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hWiPVvrtSRv9C+ql01+v8IPdBTpvYSuGz2tUHYXz6hU=;
 b=tQJD73w737bJ41bXUiio3qenG0SxjfZYdDnRcXnHeWGkqzrNL3GiHRo02vRBU5dkBY
 rE03mtm4Gj0gty/rBJ1scXNXObBHzxnJ+YutVG6t46JAKzPATnqqe2zzgD43vUMbMAv2
 XpeA8DqGIsz+38pI3HNOjfycnbjexT8QBoL6bt1fAMntCLA2lL2Ugq6nNs6HZOmvUrAU
 DNVoL7kNFwSX9CcKp1vMxJ9F7Xb1+S8FwINnR5aUeaw35+5ljTaTl3OaCgDVPwnAJw5O
 KCLBnYArm0tBg/mdou3MSTjSCov7ibVqvVQEiLWPDK94Mh++uEuSM18v5YjeXW1M0z+G
 x8xw==
X-Gm-Message-State: AOAM531pA3PbR5BGqfkrX4za0656XiMHa7QEKAJyoj9pegDytNLWFLHG
 /UBgLV8UZxQhDncsbNCYVnjnG5/BNmXJ/W9zzvSd7CU=
X-Google-Smtp-Source: ABdhPJz0MLX3eGsssMLSTESzc0LvLBaAuOVAwfuod4e8rgRW9TH94eM9PCowk71D18wJOurCgkUC502tvTlZSlTr2Q8=
X-Received: by 2002:adf:d84f:: with SMTP id k15mr15287666wrl.176.1596476788258; 
 Mon, 03 Aug 2020 10:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmV=rThbdZnjY_cbkKBeuRYNL0O2QLoJQGFPRc90SZjHoQ@mail.gmail.com>
 <CAEn-LTqnsygh40cqMf4Z41FuZh-tOO2bubNv7vqZUgMbWJT+RA@mail.gmail.com>
 <CAEUhbmW2UHRFJct=Ftizdb5zgib0ZRCwEot=sT0skrhoJtWLJg@mail.gmail.com>
 <CAOnJCUKygJk9E2c_Ye2s+xkAa-Ah2naK-YD=8wFGud+JYXhirA@mail.gmail.com>
 <CAEUhbmVMrtZFg995DdZhmVAL-W6yRW=NShvApm9__JEoC-_hnQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVMrtZFg995DdZhmVAL-W6yRW=NShvApm9__JEoC-_hnQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 3 Aug 2020 10:46:16 -0700
Message-ID: <CAOnJCUL+JFG-kguO6nbY6pC91CoLUPpaFjomDFkODcM=7AwZ-A@mail.gmail.com>
Subject: Re: Patchwork for linux-riscv
To: Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_134629_806418_D39ECBD3 
X-CRM114-Status: GOOD (  22.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 3, 2020 at 12:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Atish,
>
> On Fri, Jul 17, 2020 at 1:36 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Thu, Jul 16, 2020 at 1:49 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Thu, Jul 16, 2020 at 4:33 PM David Abdurachmanov
> > > <david.abdurachmanov@gmail.com> wrote:
> > > >
> > > > On Thu, Jul 16, 2020 at 7:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Patchwork for linux-riscv seems to be stalled.
> > > > > https://patchwork.kernel.org/project/linux-riscv/list/
> > > > >
> > > > > Or am I looking at a wrong place?
> > > >
> > > > Yes, it's stopped updating.
> > > >
> > >
> > > Thanks for the information.
> > >
> > > > There was an issue with the mailing list (and emails were lost) at
> > > > almost the same time.
> > > >
> > >
> > > Ah, I see. OpenSBI mailing list encountered the same problem I remember.
> > >
> >
> > Both OpenSBI & linux-riscv had issues because the hosting server crashed.
> > Unfortunately, there was no backup as well which led to losing all
> > archives in OpenSBI & linux-riscv.
> >
> > > > See: http://lists.infradead.org/pipermail/linux-riscv/
> > > >
> > > > This might have caused an issue with patchwork.
> > >
> > > So could someone re-configure the patchwork to bring it back online
> > > for linux-riscv?
> > >
> >
> > I thought the patchwork server is different from the mailing list
> > server as patchwork did not lose the archives.
> > At least that's how the OpenSBI patchwork is set up.
> >
> > I will check the patchwork admins about this.
> >
>
> The patchwork is still not updating. Could you please take a look?
>

I have raised a ticket with helpdesk@kernel.org 3 weeks back. No response yet.
Does anybody know email address of any admins ?

> Regards,
> Bin



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
