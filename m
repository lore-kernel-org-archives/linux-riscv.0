Return-Path: <SRS0=qfeT=V3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F18EC0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 13:35:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6577C2064A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 13:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pguoYJ9g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="XSdmFwgu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6577C2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TptR0ERI/0gDFVz8mKoUYPenNctYbvg/qMbHR0Xnv8o=; b=pguoYJ9gb8x+Hj
	bmqOC4zO1ZBtdri7hhVsfxKKIEqGmNg1NFskMEQa6i5AvYN+TUMxQagCkHdKtx3B4uNDToXAhVfHK
	6ZjHuGioFdHcx/gfSe28NF40aAh35iTeJWGRmrEzYhEATNZGKb7MCNthKhuq5E0K/WhDoMpD1Gbnx
	RhfvDNAMEAyai3n/jClAlC6P+XzAnHKU/avBpJWBE4guw6jJE5KDPMjQmWG1eF5Oj7bNXySGl5HVC
	EVfsXImWywC+jwLOd8KelpmIeSu7DzIr18alpmj5MmuORYKIL/axQHskq2CC3p1kxqJilCApaz9pM
	ogjzCvqq5slo8xLHvSiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsSIH-0000Xy-IT; Tue, 30 Jul 2019 13:35:57 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsSIE-0000XQ-Gm
 for linux-riscv@lists.infradead.org; Tue, 30 Jul 2019 13:35:56 +0000
Received: by mail-wm1-x342.google.com with SMTP id 207so57206145wma.1
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2019 06:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NG5L1QTdBmlmtrEe2guVH/gymGPjaWoNXWl+si7exOk=;
 b=XSdmFwgubGe6ca2jGD5P1QJGT8CMbYWIzlLpz6Eoj+crQJqBbRxtfRD03xHciSbZGR
 HgUyaRoMJGBJUl9AwrhDY+LY7BICoqGRLUutuIVrFlpmCSbb/YaPHn24DdtSWT8nSQNJ
 HNbIoQ24ijM0pkBajjUiUloMmrG1qV2j02BgwU/pfsCZOMg8nrkLHj5PugJjNWUI08i6
 46IURZmK0iph3Xtai5f296l4eygKizR6AshPA/dYIsTcknbdn5XbSr701seqEAcIstYg
 ECXNyvnLr3qFLKD8U3sno1GkJ0fpfMp6BHMaI5Cx9/og+JT02Rb8tm2Ntr6rNFYwen4k
 M4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NG5L1QTdBmlmtrEe2guVH/gymGPjaWoNXWl+si7exOk=;
 b=NmVfgP+IGs9WLBQ2iHyyjUjLrbqLRDyogcPViOZ+50TKsdeMsP/e7ogMUQUP552JrB
 APed81+LpPPFHZxpn/Ppr7Yb7AOlUq6Z37LNR2k6hhRff5hLnlgdDsBaJAVCKUcowJxU
 H46l8tzFRGBYzZv9xWlolWUN5GzUfHVIeudfZ/TdA603pu3XM3OTKwkIRRs2J4LxK/p8
 YzWqC48VTTVpVeRN6TD3OpvheUulFdVv9SSFlNOStS/KrvG/VEgz9N7XEX1G+/2PLyfs
 e97ijGa9NQGPv9x3Yn6llkfOPv/auDie5gvaWrPmvu4NtZS3G9Jl+l+Jeqra9gy8SXid
 1rqQ==
X-Gm-Message-State: APjAAAV9lIC/EZCbNHvcivZSrNKmsiXrghunVxYneziO4RpeRld6dvPM
 eR4JD1V3eYmJnysCc/S54oHoMdFMd9XOQBnkMV8=
X-Google-Smtp-Source: APXvYqxccJmasmD750CGSJBvzrIk3e3w01M+2BaH0U+cbtfDEGerCX82OKGoBEM5uz4uOjwIh9jycbWjkeugcNuIUi8=
X-Received: by 2002:a1c:9d53:: with SMTP id
 g80mr100562254wme.103.1564493752815; 
 Tue, 30 Jul 2019 06:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190729115544.17895-1-anup.patel@wdc.com>
 <20190729115544.17895-6-anup.patel@wdc.com>
 <9f9d09e5-49bc-f8e3-cfe1-bd5221e3b683@redhat.com>
 <CAAhSdy3JZVEEnPnssALaxvCsyznF=rt=7-d5J_OgQEJv6cPhxQ@mail.gmail.com>
 <66c4e468-7a69-31e7-778b-228908f0e737@redhat.com>
 <CAAhSdy3b-o6y1fsYi1iQcCN=9ZuC98TLCqjHCYAzOCx+N+_89w@mail.gmail.com>
 <828f01a9-2f11-34b6-7753-dc8fa7aa0d18@redhat.com>
In-Reply-To: <828f01a9-2f11-34b6-7753-dc8fa7aa0d18@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Jul 2019 19:05:40 +0530
Message-ID: <CAAhSdy19_dEL7e_sEFYi-hXvhVerm_cr3BdZ-TRw0aTTL-O9ZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 05/16] RISC-V: KVM: Implement VCPU interrupts and
 requests handling
To: Paolo Bonzini <pbonzini@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_063554_606750_E8F39293 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Radim K <rkrcmar@redhat.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 30, 2019 at 6:48 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 30/07/19 14:45, Anup Patel wrote:
> > Here's some text from RISC-V spec regarding SIP CSR:
> > "software interrupt-pending (SSIP) bit in the sip register. A pending
> > supervisor-level software interrupt can be cleared by writing 0 to the SSIP bit
> > in sip. Supervisor-level software interrupts are disabled when the SSIE bit in
> > the sie register is clear."
> >
> > Without RISC-V hypervisor extension, the SIP is essentially a restricted
> > view of MIP CSR. Also as-per above, S-mode SW can only write 0 to SSIP
> > bit in SIP CSR whereas it can only be set by M-mode SW or some HW
> > mechanism (such as S-mode CLINT).
>
> But that's not what the spec says.  It just says (just before the
> sentence you quoted):
>
>    A supervisor-level software interrupt is triggered on the current
>    hart by writing 1 to its supervisor software interrupt-pending (SSIP)
>    bit in the sip register.

Unfortunately, this statement does not state who is allowed to write 1
in SIP.SSIP bit.

I quoted MIP CSR documentation to highlight the fact that only M-mode
SW can set SSIP bit.

In fact, I had same understanding as you have regarding SSIP bit
until we had MSIP issue in OpenSBI.
(https://github.com/riscv/opensbi/issues/128)

>
> and it's not written anywhere that S-mode SW cannot write 1.  In fact
> that text is even under sip, not under mip, so IMO there's no doubt that
> S-mode SW _can_ write 1, and the hypervisor must operate accordingly.

Without hypervisor support, SIP CSR is nothing but a restricted view of
MIP CSR thats why MIP CSR documentation applies here.

I think this discussion deserves a Github issue on RISC-V ISA manual.

If my interpretation is incorrect then it would be really strange that
HART in S-mode SW can inject IPI to itself by writing 1 to SIP.SSIP bit.

>
> In fact I'm sure that if Windows were ever ported to RISC-V, it would be
> very happy to use that feature.  On x86, Intel even accelerated it
> specifically for Microsoft. :)

That would be indeed very strange usage.  :)

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
