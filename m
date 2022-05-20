Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F5DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 04:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aya/U7z6pS6jxWBTG/KgXRRawXbsIj95oF2G3lewpDk=; b=at0NSP5VU//oFd
	RLX8EZMtPXje2x+g6GxkHXHN5BYwyhydZdbP49WgL07RENKtjHPGtq+gIpamdoSRFSiiTTpZePe+K
	OVYimpLG4Cv/bD+aLoAbWr2JXGKblSEO8FmhrgVd5e6/JFza2T0vautWuTP1IXxtIh2bXjRkDhf/L
	XmKbskr5cdRbkQwEadVxFKJoXJiVP2y8IReKEqAGSA+e5cuwXih2jebKgx3aUiWbT+kkpEV0qn2+Y
	90EZVH68szjBDJNi0pcDbRwiA4sq6k2AEV4uhh6cprXiqLFQVewU1rInwZN+q+GgBtR5j6Ua48HEd
	LTXiKicxLzc4/K4OVSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nruUL-00ATyL-Lx; Fri, 20 May 2022 04:43:45 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nruUJ-00ATwg-6R
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 04:43:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id gg20so7035756pjb.1
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 21:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+tw51RCYcGj1foniXotGyrQteUlHw6mmELp0RHwCfbM=;
 b=QGegZ0Aye9ox2p2Qn/4S0srcNwplKH5EmehYsQWLax4ZKn/TePnw6ptFMtriZ5MGTt
 cRCrO2y0aujrYXFY6/zWO5ViduZDoc9QcN6HKspYEvsTai5SD7qyKUltZKxbY/qoGBkl
 DOB+ZVPpBmD2evL7YAMOj9wq+d0x5ytZGIFJseNer5UESLx0t4HzpeJLA37EBLMVWSob
 4JSCQnrW/Km/0NpPOSrwWGMci8ytdcrPSeeOhU2GZQM018GtctGGc/TJ0vkZ/xKIqw81
 cKrxe6dVofe4/SGdwTuxuLWBT8rRMcL22Ql5eZSSn1YllodXIhQDoGTaqfRTiBP4DiIh
 hMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+tw51RCYcGj1foniXotGyrQteUlHw6mmELp0RHwCfbM=;
 b=O4/t1V7pFoMsGJ5VW4JUvZuHq5IwaECNH3JenbHKeuJRG5Cql+qLp7T2SBmIPI1EZe
 U34gmURjXYvHJXCXFiZGYnelOeJsfW76n0NdMG2WWCbYXrc6wykqAl32xPRF2ZZxeAS6
 0PDBbxSZ7CBspNHr/8nug7mOLGx1VH09ssI0VgMRyCPBgp14scIoAmftmIkEVKlUC5Ae
 zLo3yWqa0iZ9BNt3CnA593zkpx+ZgdhnI6PzBXMQypPDkmtzGHRKB/NyobByFGyR0ZTp
 ZwRONJNb78W8zsvtvljtjCg9myCHXqB3GFmilgVMsf//Z5n7vGs8n1oyIVhZuS4cUX3e
 lCjg==
X-Gm-Message-State: AOAM532oVnYJZf/Y5ew2SMvFdEbha1ClQDO1gzNRgFYSZjOl26ij398e
 llJhTsDWBzm3sHg7j991ME9hmQ==
X-Google-Smtp-Source: ABdhPJzoOXpK/+v9gIuGmqCLtuPcdAPIyNdQCAfB3sonYpZrLmhj1w0h9srj29FMKj1LZM5iQzxKZw==
X-Received: by 2002:a17:902:d2c3:b0:161:ab47:8afe with SMTP id
 n3-20020a170902d2c300b00161ab478afemr7676365plc.8.1653021821057; 
 Thu, 19 May 2022 21:43:41 -0700 (PDT)
Received: from sunil-laptop ([49.206.9.238]) by smtp.gmail.com with ESMTPSA id
 r5-20020a63e505000000b003c63ae859d3sm4412015pgh.83.2022.05.19.21.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 21:43:40 -0700 (PDT)
Date: Fri, 20 May 2022 10:13:32 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Abner Chang <abner.chang@hpe.com>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH V4 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
Message-ID: <20220520044332.GA4509@sunil-laptop>
References: <20220518095646.47548-1-sunilvl@ventanamicro.com>
 <20220518095646.47548-2-sunilvl@ventanamicro.com>
 <CAMj1kXF2N+0zRCNg0Aq9Y8Y35FUaQ1V+swzY__y86sayKW7PPA@mail.gmail.com>
 <04ed20b1-e312-dfc2-c314-02750c076681@canonical.com>
 <CAMj1kXEX0DWprb7cv_js1=M1J1hSXLBa=cOOjVo3tTVyGT0siQ@mail.gmail.com>
 <CAOnJCULUoedeARe0J=aduAVD35uHMe0MN9Pc_LDkavWZ-VtOkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCULUoedeARe0J=aduAVD35uHMe0MN9Pc_LDkavWZ-VtOkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_214343_282786_33FDDE17 
X-CRM114-Status: GOOD (  42.65  )
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

On Thu, May 19, 2022 at 11:07:28AM -0700, Atish Patra wrote:
> On Thu, May 19, 2022 at 1:14 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 19 May 2022 at 08:17, Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> > >
> > >
> > >
> > > On 5/18/22 23:03, Ard Biesheuvel wrote:
> > > > On Wed, 18 May 2022 at 11:57, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > >>
> > > >> This patch adds the support for getting the boot hart ID in
> > > >> Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL. This protocol
> > > >> is preferred method over existing DT based solution since it
> > > >> works irrespective of DT or ACPI.
> > > >>
> > > >> The specification of the protocol is hosted at:
> > > >> https://github.com/riscv-non-isa/riscv-uefi
> > > >>
> > > >> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > >> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> > > >> ---
> > > >>   drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
> > > >>   drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
> > > >>   include/linux/efi.h                       |  1 +
> > > >>   3 files changed, 32 insertions(+), 5 deletions(-)
> > > >>
> > > >> diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> > > >> index edb77b0621ea..aced62a0907e 100644
> > > >> --- a/drivers/firmware/efi/libstub/efistub.h
> > > >> +++ b/drivers/firmware/efi/libstub/efistub.h
> > > >> @@ -720,6 +720,13 @@ union efi_tcg2_protocol {
> > > >>          } mixed_mode;
> > > >>   };
> > > >>
> > > >> +struct riscv_efi_boot_protocol {
> > > >> +       u64 revision;
> > > >> +
> > > >> +       efi_status_t (__efiapi * get_boot_hartid)(struct riscv_efi_boot_protocol *this,
> > > >> +                                                 size_t *boot_hartid);
> > > >
> > > > size_t is not a EFI type, and your spec uses UINTN here, which is
> > > > equivalent to 'unsigned long'. However, jump_kernel_func() takes a
> > > > unsigned int for the hartid. Please clean this up.
> > >
> > > unsigned long and size_t have the same number of bits. This seems to be
> > > a question of taste where we should follow the maintainer.
> > >
> >
> > We use unsigned long wherever the UEFI spec uses UINTN. This is not a
> > matter of taste, really.
> >
> > > jump_kernel_func() assuming boot hart ID to be an unsigned int is not in
> > > line with the RISC-V ISA which allows to use all xlen bits.
> > >
> > > >
> > > >
> > > >> +};
> > > >> +
> > > >>   typedef union efi_load_file_protocol efi_load_file_protocol_t;
> > > >>   typedef union efi_load_file_protocol efi_load_file2_protocol_t;
> > > >>
> > > >> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> > > >> index 9c460843442f..012504f6f9a4 100644
> > > >> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> > > >> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> > > >> @@ -23,7 +23,7 @@
> > > >>
> > > >>   typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
> > > >>
> > > >> -static u32 hartid;
> > > >> +static size_t hartid;
> > > >>
> > > >
> > > > and here
> > > >
> > > >>   static int get_boot_hartid_from_fdt(void)
> > > >>   {
> > > >> @@ -47,14 +47,33 @@ static int get_boot_hartid_from_fdt(void)
> > > >>          return 0;
> > > >>   }
> > > >>
> > > >> +static efi_status_t get_boot_hartid_from_efi(void)
> > > >> +{
> > > >> +       efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
> > > >> +       efi_status_t status;
> > > >> +       struct riscv_efi_boot_protocol *boot_protocol;
> > > >> +
> > > >> +       status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
> > > >> +                            (void **)&boot_protocol);
> > > >> +       if (status == EFI_SUCCESS) {
> > > >> +               status = efi_call_proto(boot_protocol,
> > > >> +                                       get_boot_hartid, &hartid);
> > >
> > > A lot of the kernel code seems to be unfit to handle hart IDs exceeding
> > > INT_MAX (e.g. sbi_cpu_is_stopped()). Until this is fixed we have to
> > > treat hartid > INT_MAX as an error.
> > >
> >
> > This is an issue in the core kernel code, not in the EFI stub. As you
> > pointed out, the ISA implies UINTN / unsigned long here, and if the
> > startup code cannot deal with that, it can be fixed separately.
> 
> It was kept as unsigned int because hartid > INT_MAX is very unlikely to happen.
> But I agree that we should just follow the spec(allowing XLEN bits for
> hartid) and
> change "unsigned int" to "unsigned long" wherever hartid is concerned.
> 
> As the hartid is changed to unsigned long, get_boot_hartid_from_fdt
> should be fixed as well.
> Currently, it is using fdt32_to_cpu.

I am working on a separate patch series to modify these instances. Will send
soon for your feedback.

Thanks
Sunil
> 
> 
> 
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
