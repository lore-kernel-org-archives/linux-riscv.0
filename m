Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B93EC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 05:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXxz7peFw9YwC+wuOXwu4dJdL6zBf2meeK+IozBDuJs=; b=sD2JViQIBUEa5S
	smYSw82ZdwX6ALP8Ghv6WvS6Zws3wBQrcF/f/Qx+yE+Dhin1pS2EDDFnZ/CJRQ02p6kDTeYgLwym+
	aA4DQ4BQ4bJ8cmud2nbMBVthmIUilLjOiQ95bEyF3KoLzA5SpbHbmu3OeXXCgQafyK+KvU/P+Oolw
	lGUCQOdsjh2hTCGqYS2k6pos2HV+MK5/pq9T1LeuHcqnJYUWPGTqU6fTAjiXaesxRJADGISVbMFxr
	7PVTBz0u2IeQcrCBK/MgwKdgxXaDpwYdcdLrKZUx2btqWikkH6DyzEzWL7FDRONbFt/EZ/3V87PMk
	otWlLptAnAKDD9N67TLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDJcJ-000Qnp-Qs; Fri, 28 Jan 2022 05:16:11 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDJcH-000QnM-MY
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 05:16:11 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 133so4306517pgb.0
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 21:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Xy7V1RKBgPy7ej3aLewZ5fgpZQ6691qdKaJczzqlNHk=;
 b=dvy7Hfy2AHdOXqtC7FdYxoxNBYCQzybLnMezlpbU7QfAVQ94QYX7yYbzPaX4ZM99aa
 JGTaixtkYrNUgotaWxqqyRofLShMxqEjk4rlkyGfzntMnDprBkc5c76+8oDm835SA6Gs
 rL+x0Bkz+dD/OLxKax+lWYebU1P+JkSxNJTT8vrlLwJtOVbzIN5v7OWTnPJBttegPugO
 FV6mPeqs51H88DF5LBRHkc2a+Fhhu0ldsNGOwPi/kk1LWGwO2Nf0sNZXyMYfNU2b735I
 djNR59SP7DmpBilvPJAAqvWfmbCixzOOPSuPHhOiCzHB9ATSCnef3wMrY/NG6KdMbat9
 pdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xy7V1RKBgPy7ej3aLewZ5fgpZQ6691qdKaJczzqlNHk=;
 b=mdTIemnNihpJOzzaLP1ioHLDCGkL4VDTp7QF9nqydgOcFizCbnYudr3bSLPPzHP6Df
 56/rKHxZerHK6jb5G1qOcpVKGHr2seSYulgGf9tMVrmT5CfzifApbmdhCiOmKfOjqNOf
 AZQW/UkvSGZAwg/ZpVp5YR+2tVWJpAFnehh9hao9ITCLB7yF288uVBFf2vBuU4totuI5
 dKf6wDS5tUN/srPLs8C7rQ8/UXamWNyTkuzwnqdyPxhhgCH/obLTlIKni7gcehsjodfa
 D0M7cDJGBqvpbNCPQAx0Q2XgLSo0Vi48pmuj+drbxozsxnx1EqsY0hBa3otJ4CW2vquV
 js8g==
X-Gm-Message-State: AOAM532ME5csptH5FqUUQ8ckH1tZJjVPgiVxQMRgazDz6gCEJudXZMKU
 5sv3MXTz3pB5FN3g/JyEk8EkiQ==
X-Google-Smtp-Source: ABdhPJwcDyOeN54f5ywguadGTIVI8TcNaRt3WmrVCPE7jF6+vI+RUWxhwFLhAJHDtO7JUAZ3sRrvBA==
X-Received: by 2002:a63:f650:: with SMTP id u16mr5337290pgj.2.1643346968484;
 Thu, 27 Jan 2022 21:16:08 -0800 (PST)
Received: from sunil-ThinkPad-T490 ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id b22sm7617198pfl.121.2022.01.27.21.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 21:16:08 -0800 (PST)
Date: Fri, 28 Jan 2022 10:46:00 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [RFC PATCH 1/1] riscv/efi_stub: Add support for
 RISCV_EFI_BOOT_PROTOCOL
Message-ID: <20220128051600.GB5018@sunil-ThinkPad-T490>
References: <20220126110615.33371-1-sunilvl@ventanamicro.com>
 <20220126110615.33371-2-sunilvl@ventanamicro.com>
 <667AE324-A8D2-41ED-B9DF-62750F3C2574@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <667AE324-A8D2-41ED-B9DF-62750F3C2574@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_211609_776301_0590AE61 
X-CRM114-Status: GOOD (  26.76  )
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

On Thu, Jan 27, 2022 at 08:47:35AM +0100, Heinrich Schuchardt wrote:
> Am 26. Januar 2022 12:06:15 MEZ schrieb Sunil V L <sunilvl@ventanamicro.com>:
> >This patch adds the support for getting the boot hart ID in
> >Linux EFI stub using RISCV_EFI_BOOT_PROTOCOL.
> 
> It would be helpful to add a link to the spec in the commit message and maybe a comment that this protocol is needed for the ACPI use case.

Sure. Will add.

> 
> >
> >Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> >---
> > drivers/firmware/efi/libstub/efistub.h    | 15 ++++++++++++
> > drivers/firmware/efi/libstub/riscv-stub.c | 28 ++++++++++++++++++++---
> > include/linux/efi.h                       |  1 +
> > 3 files changed, 41 insertions(+), 3 deletions(-)
> >
> >diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
> >index edb77b0621ea..0428f8816942 100644
> >--- a/drivers/firmware/efi/libstub/efistub.h
> >+++ b/drivers/firmware/efi/libstub/efistub.h
> >@@ -720,6 +720,21 @@ union efi_tcg2_protocol {
> > 	} mixed_mode;
> > };
> > 
> >+typedef union riscv_efi_boot_protocol riscv_efi_boot_protocol_t;
> >+
> >+union riscv_efi_boot_protocol {
> >+	struct {
> >+		u64 revision;
> >+		efi_status_t (__efiapi *get_boot_hartid)(
> >+							 riscv_efi_boot_protocol_t *,
> >+							 size_t *);
> 
> I prefer to have parameter names for readability

Sure. Will add.

> 
> According to the platform specification mhartid is MXLEN wide. UINTN (size_t) is SXLEN wide. 
> 
> Does this have any implications on how we define the protocol?

I don't think so. EFI and kernel will be at same privilige level. So, it
is not really an issue for this protocol. 

But when MXLEN > SXLEN (ex: 64 vs 32), then implementation need to
ensure hartid value is 32 bit only so that when it is passed from M-mode
firmware to S-mode, it gets correct value. But again this is not an
issue from this EFI protocol perspective.

> 
> >+	};
> >+	struct {
> >+		u32 revision;
> >+		u32 get_boot_hartid;>+	} mixed_mode;
> >+};
> >+
> > typedef union efi_load_file_protocol efi_load_file_protocol_t;
> > typedef union efi_load_file_protocol efi_load_file2_protocol_t;
> > 
> >diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> >index 380e4e251399..c7add4eb5453 100644
> >--- a/drivers/firmware/efi/libstub/riscv-stub.c
> >+++ b/drivers/firmware/efi/libstub/riscv-stub.c
> >@@ -46,12 +46,34 @@ static u32 get_boot_hartid_from_fdt(void)
> > 	return fdt32_to_cpu(*prop);
> > }
> > 
> >+static u32 get_boot_hartid_from_efi(void)
> >+{
> 
> The returned value must be UINTN /size_t like the protocol. This width must be carried to the legacy entry point of Linux.
> 
> >+	efi_guid_t boot_protocol_guid = RISCV_EFI_BOOT_PROTOCOL_GUID;
> >+	efi_status_t status;
> >+	riscv_efi_boot_protocol_t *boot_protocol;
> >+	size_t boot_hart_id;
> >+
> >+	status = efi_bs_call(locate_protocol, &boot_protocol_guid, NULL,
> >+			     (void **)&boot_protocol);
> >+	if (status == EFI_SUCCESS) {
> >+		status = efi_call_proto(boot_protocol,
> >+					get_boot_hartid, &boot_hart_id);
> >+		if (status == EFI_SUCCESS) {
> >+			return (u32)boot_hart_id;
> >+		}
> >+	}
> >+	return U32_MAX;
> 
> U32_MAX is a legal value for the hart id.

Yeah. This is an existing issue in get_boot_hartid_from_fdt() for which
I have sent a fix patch. Once that gets accepted, I will fix
get_boot_hartid_from_efi() and send RFC V2 patch.

> 
> >+}
> >+
> > efi_status_t check_platform_features(void)
> > {
> >-	hartid = get_boot_hartid_from_fdt();
> >+	hartid = get_boot_hartid_from_efi();
> > 	if (hartid == U32_MAX) {
> >-		efi_err("/chosen/boot-hartid missing or invalid!\n");
> >-		return EFI_UNSUPPORTED;
> >+		hartid = get_boot_hartid_from_fdt();
> >+		if (hartid == U32_MAX) {
> 
> U32_MAX is a legal value for the hart id. Please, separate status and value.

Will fix it.

Thank you very much for the feedback.
Sunil

> 
> Best regards
> 
> Heinrich
> 
> >+			efi_err("/chosen/boot-hartid missing or invalid!\n");
> >+			return EFI_UNSUPPORTED;
> >+		}
> > 	}
> > 	return EFI_SUCCESS;
> > }
> >diff --git a/include/linux/efi.h b/include/linux/efi.h
> >index ccd4d3f91c98..9822c730207c 100644
> >--- a/include/linux/efi.h
> >+++ b/include/linux/efi.h
> >@@ -380,6 +380,7 @@ void efi_native_runtime_setup(void);
> > #define EFI_CONSOLE_OUT_DEVICE_GUID		EFI_GUID(0xd3b36f2c, 0xd551, 0x11d4,  0x9a, 0x46, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d)
> > #define APPLE_PROPERTIES_PROTOCOL_GUID		EFI_GUID(0x91bd12fe, 0xf6c3, 0x44fb,  0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0)
> > #define EFI_TCG2_PROTOCOL_GUID			EFI_GUID(0x607f766c, 0x7455, 0x42be,  0x93, 0x0b, 0xe4, 0xd7, 0x6d, 0xb2, 0x72, 0x0f)
> >+#define RISCV_EFI_BOOT_PROTOCOL_GUID		EFI_GUID(0xccd15fec, 0x6f73, 0x4eec,  0x83, 0x95, 0x3e, 0x69, 0xe4, 0xb9, 0x40, 0xbf)
> > #define EFI_LOAD_FILE_PROTOCOL_GUID		EFI_GUID(0x56ec3091, 0x954c, 0x11d2,  0x8e, 0x3f, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b)
> > #define EFI_LOAD_FILE2_PROTOCOL_GUID		EFI_GUID(0x4006c0c1, 0xfcb3, 0x403e,  0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0xe0, 0x6d)
> > #define EFI_RT_PROPERTIES_TABLE_GUID		EFI_GUID(0xeb66918a, 0x7eef, 0x402a,  0x84, 0x2e, 0x93, 0x1d, 0x21, 0xc3, 0x8a, 0xe9)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
