Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96BBC25B07
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XX9UwJl7L/K8piyw3v90g3Cs42wYgZXGdOtF20jljgk=; b=gHBqYyH8gLzBy2
	wfQgxNqSAzQbO92eAGd9JAsuTArSHvCETqlxmY0MNtTMmKveRQXkrQ3Mr4+AOcIxxpuwWOrIqt6UD
	KEKZJCCj13rH1LgSooRsDzsewWeDSRkFMiCewnuhopSVCsQKZkzCg/M/qin4c41TYlANsVeV7Y8pB
	EutAulqEuoIMApWUB9lB1qoDh0c6CJpFWptSX/Lezt0gKp23pumvHmpCioera86pJLQY7e8H9H1dm
	uuPv0R56jGlFCp6WMaTooS+lzqUYnIJ5VfcN4zY3QJc8pni2R999C7nWTCDlBwPcdUHxiUl6t/T/H
	WoKNV/216suhL/1nzEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKr5-00HT6F-GV; Tue, 26 Jul 2022 13:44:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKr2-00HT4h-A8
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 13:44:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id b26so20245106wrc.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oQ8s3zPZY+TFJkH6m+UUXWT+JWabae4Qo2BwG+X/dtA=;
        b=EqK8sgogR79mEUl/YeNrDUb+Y+dW6RBsh5xIg9wH0CgvvZYyLVjTlNRJGmwxL4Qt4s
         oS/ENaOx+3r7jBOIFOAIfdQlx46fKBlSTCLJWU1bDpG4zIJKTORp/+HSufNT/Y/j8VK+
         ZH87Q+MvYZljijN8hSiGm1/CrfjsOK/IUfQf2t0+R4y7abiYDBwxd3tU2ZkaOwfV9uPq
         TrLBsqYaB/L+lwIl9+M5bZhtBbaD9xXN93M5ShyeuaQBlsh/IZsks6QQLQfkmkJIhKYx
         GXjFNpIbZ3kZO1B33eOJDV6XX543AKvZvW43VUR985vMQ5a2lOrgk0si1ciUtMw1IzQo
         Tbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oQ8s3zPZY+TFJkH6m+UUXWT+JWabae4Qo2BwG+X/dtA=;
        b=zqJ38yC9sdsRW1JE8FmzZv1kA0H0gyW0NZpYjFhE0EaO2YHrKchovdpFworlpJ8nYp
         mzLYpB/HIWeAhwGTYYCAyowTKVAFl2Pg01qdpBV0d4hhhuXQoMT83UBxGuQFLvojp1/f
         edwD4KHAFTbNa0uyAAsDcmqIvbmo/tvDYuHxUF9Giw6MyFMtQPc7+dSUkiC1KD4/W5/k
         f/971WA2nXOrtt1weTS8e71GXpvS8A2Y1AfS5Q+xe7rdvL+4+m1SUbE98RKt4S5AwuEi
         RYXVfWaCDRsQLwg2ANf0OOgMzIsrPlevOptLbcIeHRl5nmLDcaIpvFroxcHOve99DFyK
         urrg==
X-Gm-Message-State: AJIora/aVGA+ooTyZergh8EVCwk5Rk4e8Sj8mGZinBMjTZ5Dy2lvvMU2
	YwmSoT1zhXJM5eH0AfzR9/pOFKPnEYmgeU3VOqi6rw==
X-Google-Smtp-Source: AGRyM1sWnAdjWjvz1F29mMNoTK0f/PXmP4buefrfmWkMl0uYgx1rCpW/MGp5I+wz+UW9+gcrqT8oEK0KQ5TKu590ONA=
X-Received: by 2002:adf:ee4b:0:b0:21e:8e1a:8f3c with SMTP id
 w11-20020adfee4b000000b0021e8e1a8f3cmr5314211wro.346.1658843046640; Tue, 26
 Jul 2022 06:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220620115549.1529597-1-apatel@ventanamicro.com>
 <CAAhSdy0mHbxQ3QVP9j1==oTG75Z9_T2bDSif-UGKppG+-hoJng@mail.gmail.com> <659c6aa4-1100-0945-4965-3e106dfd490f@microchip.com>
In-Reply-To: <659c6aa4-1100-0945-4965-3e106dfd490f@microchip.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Jul 2022 19:13:52 +0530
Message-ID: <CAAhSdy0XwTsQ+dgYatqf6BvGmcGwz_bzmdV5fNeF8oY3rK6dDg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
To: Conor.Dooley@microchip.com
Cc: palmer@dabbelt.com, apatel@ventanamicro.com, arnd@arndb.de, 
	paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, 
	heinrich.schuchardt@canonical.com, atishp@atishpatra.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_064408_566371_B2E4DBFB 
X-CRM114-Status: GOOD (  17.39  )
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

On Tue, Jul 26, 2022 at 7:10 PM <Conor.Dooley@microchip.com> wrote:
>
> Hey Anup,
>
> On 26/07/2022 12:57, Anup Patel wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Hi Palmer,
> >
> > On Mon, Jun 20, 2022 at 5:26 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >>
> >> Identifying the underlying RISC-V implementation can be important
> >> for some of the user space applications. For example, the perf tool
> >> uses arch specific CPU implementation id (i.e. CPUID) to select a
> >> JSON file describing custom perf events on a CPU.
> >>
> >> Currently, there is no way to identify RISC-V implementation so we
> >> add mvendorid, marchid, and mimpid to /proc/cpuinfo output.
> >>
> >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >
> > Can this patch be considered for 5.20 ?
>
> iirc I mentioned the consistency of using defined() for
> CONFIG_RISCV_SBI versus IS_ENABLED() elsewhere in arch/riscv/
> but I don't recall a response.

Sorry, I missed your comment. I will address and send v2 soon.

Regards,
Anup

>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
