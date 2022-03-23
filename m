Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA639C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rpgv6SAjURSNEL13Dz48rqLPzWd+RHiZpHxQ4dyt9Cc=; b=pMItpxNU/HFOOE
	CU2edQLGzPvyOl3sFBVbW23X62zojwwy17Rqy07N3ZeNxA1bIn/yIIbwmIMg5ni2lvSvmSraFX6vH
	FmXEnAXBaDs/1RZm+vRiPXtEngPF1jbOG/P08jPi4mWSBSnQlTyz2ml0rybK+TdNbZ2xRfIn2Eh2H
	ifz/YDRgLIx/IpTruhOSNNVPkVcIRcUaWD+reOiF/ekSU+YrCKK64LcZnPH1qs6+ywh0HxVU1JBeE
	jpvOlbihMzndNOyrsk94n6Lvd7ODLth9fIO2uIZUfATTQh7QfdDZIUYTp6y7bF3EfefAhQ5zJtFsf
	K3Kk8tdOxur59Kv6KNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX3q6-00EFAR-Cq; Wed, 23 Mar 2022 16:28:02 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX3q2-00EF9S-KW
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 16:28:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so6889281pjb.4
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 09:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+GkM0EsIpmPEs+2fEuWOpfnSs20UxwWfYqecrAXhXLY=;
 b=QF3UUYiCGO0ViS4CuMlDVBr4REmIM+Fg/874L9K8EsFLMZEcwyY66S3OiF/Sn8CmlN
 w510dTQHFNL79JLWdyeXLg8qwMWPV12BBrShW3e+KTsIvOcs7iMKTFMgTCnXuhFctgsS
 tKyyhZVL0h9ZmrSWpJWI0iaKhHoBy6Lm3tz6Sm2YaOSb8VWG4jZA3qjllYGm8Xbd27/7
 dBKb36Brw6auML+vARie2pdIEzTRmZGcvkaX6150GSjin1Qh8gbhhGmrpIUKwRCFsaJ1
 GvVRKp2/SejAxChhSj+W7RAmlSX+Mhrz3KFmuqOL5H6+dX8pNuZb/XH+oM6wM3wzWg0c
 9CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+GkM0EsIpmPEs+2fEuWOpfnSs20UxwWfYqecrAXhXLY=;
 b=Ve36ba5yiJN8XizIqk+UX7K+GJ0kl87x4mKdUX9XYCbX0uz+JIIPe2vCDMz9R6Gj8a
 Q+W0TK0UqGfYZ9DYHuL7D3Vl74se2EIwA/MLl2+UdbEdtu8n6OcZuPRElc03RbRKEL+k
 mPGx4UhFAD4HxVqa+P4qsEHUKh92Xhfv1TglhjkxiTzHWMOcoRw2Kh6fCh0TgGgR1sPn
 1oh/e2DftHcrVNCw4IuQ1xBOLm3s/lRKwplatkJlpap3+DbYr6PE4Fgy8gDYFUjDcmK9
 l/CZWgUDlernzdQyPU+zrLUBOwNXh8NADTPQwRbzKLFwwnifXziu20chVbE6KkRjWPWp
 sJKA==
X-Gm-Message-State: AOAM530hWlSFDlS6eWMaixrrNAWHg/Vu6qzEWGbrgZI8vmlnDHH/KJ/P
 E7Z30DzDG8ZbjsvK0uEdeAwFBA==
X-Google-Smtp-Source: ABdhPJxdyw30bh2pKE+3hwkGOES/bE/U5B9N1OxqWylkElPtex6mxLZrmYAnSavkrnoUSGgDJYnPog==
X-Received: by 2002:a17:902:d48d:b0:153:a517:6ff2 with SMTP id
 c13-20020a170902d48d00b00153a5176ff2mr756437plg.141.1648052878061; 
 Wed, 23 Mar 2022 09:27:58 -0700 (PDT)
Received: from sunil-laptop ([49.206.7.17]) by smtp.gmail.com with ESMTPSA id
 r1-20020a63b101000000b00380989bcb1bsm289959pgf.5.2022.03.23.09.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 09:27:57 -0700 (PDT)
Date: Wed, 23 Mar 2022 21:57:48 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ardb@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, heinrich.schuchardt@canonical.com,
 Atish Patra <atishp@rivosinc.com>, apatel@ventanamicro.com,
 abner.chang@hpe.com, jrtc27@jrtc27.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH V2 0/1] RISCV_EFI_BOOT_PROTOCOL support in linux
Message-ID: <20220323162748.GA55066@sunil-laptop>
References: <20220303145944.307321-1-sunilvl@ventanamicro.com>
 <mhng-5eb23850-e2a9-43d3-8093-2f588c71de00@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-5eb23850-e2a9-43d3-8093-2f588c71de00@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_092758_694676_370823F6 
X-CRM114-Status: GOOD (  25.81  )
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

On Tue, Mar 22, 2022 at 06:32:22PM -0700, Palmer Dabbelt wrote:
> On Thu, 03 Mar 2022 06:59:43 PST (-0800), sunilvl@ventanamicro.com wrote:
> > This patch adds support for getting the boot hart ID using new
> > RISCV_EFI_BOOT_PROTOCOL in linux efi stub. While there is an existing
> > solution of passing the boot hart ID through Device Tree, it doesn't work
> > for ACPI. Hence an EFI protocol protocol is recommended which works for
> > both DT and ACPI based platforms.
> > 
> > The latest draft spec of this new protocol is available at
> > https://github.com/riscv-non-isa/riscv-uefi/releases/download/1.0-rc2/RISCV_UEFI_PROTOCOL-spec.pdf
> 
> This looks fine to me, but we need the spec folk to commit to this being a
> stable interface before we can start using it.  Historically that's been
> "frozen" for RISC-V specs, but I'm not sure how that all fits together in
> EFI land as IIUC we also have to follow the UEFI forum's process.  Last I
> checked you guys understood that better than I did, so

Thank you Palmer. The specification is in frozen state now. 
http://lists.infradead.org/pipermail/linux-riscv/2022-March/013431.html.

Thanks
Sunil
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # pending spec freeze
> 
> I had a minor comment about the error message, as well.
> 
> Thanks!
> 
> > This linux ptach can be found in:
> > riscv_boot_protocol_rfc_v2 branch at
> > https://github.com/vlsunil/linux.git
> > 
> > This is tested in qemu with u-boot 2022.04.rc3.
> > 
> > Changes since V1:
> >   - Rebased to get the "Fix get_boot_hartid_from_fdt() return value"
> >     patch
> >   - Removed mixed_mode member
> >   - Separated return value and status.
> > 
> > Sunil V L (1):
> >   riscv/efi_stub: Add support for RISCV_EFI_BOOT_PROTOCOL
> > 
> >  drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
> >  drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
> >  include/linux/efi.h                       |  1 +
> >  3 files changed, 32 insertions(+), 5 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
