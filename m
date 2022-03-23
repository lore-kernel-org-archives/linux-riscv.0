Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FFEC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 01:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=8QNW/eNLctc8Z7QTADd+FeBXFrKGCECnQ75aBguwdV0=; b=dmo5gg2zaYd0VSySz1EosiVqHa
	LjMW2eT4HvUb1RApslviWgnyz3gcwY8LJtM2M6QDpraqM5sBbHrlsFrlHT0jdaYlblKGHBnAQ15sA
	HRDwA4RDqxACOhARqVocNvtHv4gA5yAqUfbogmGbGcb1mPmSDtfQ6VK01VTGxXjyKC80aBBmUInWo
	4SknvFJFaqgJg9DK8aobB3AAlvEI9dh9+V9e6uJDSsM/aBdSD5u5ZOoRkOjcAHU+LHauY33u8NFOx
	cMNIxDL3wB9A2l2T1QMsiL0lOHl6Dscm4SialJSqiP+umKxyKUT2GWSPmAXcgCcGaTPs1wFrWIIdq
	3BdKqHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWprP-00CZiq-Cx; Wed, 23 Mar 2022 01:32:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWprL-00CZhQ-Q3
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 01:32:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id n15so203527plh.2
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 18:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1tdwMzgNU3+9ty6xkH9fMGGweeCwRgg1Dr+d/9eH3Qc=;
 b=Gb0kqmLT129jUYWppYcf+O0ptJfQ1chsmf0FWqDF33rRzHXnu9VU00lf82mCBhvMOT
 xEjT2gr2VnGPjBV+knw3swrECBoiOXP+IaNN3IZCyRh3fJbtolZLh24hhLZODv+yUM2N
 GFIiTiqXmm3LkBcYok5oDYtJXWYgk85zciH63XgxqfYUs5VWqb539wKbEnisMMJ9+fHX
 0fpcq6O1OMroRA0Ug9+nYbNeuaQKWOsm5Ke7a379DYXWXP67n6eeVB/IwCE/MNv+nWaK
 XUQCZ/XpQoF/T20F+m22W61xy9jzoFz/4ky/GkBcnOn9Lcp1py6ktikn1QFU79g7Rza4
 I0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1tdwMzgNU3+9ty6xkH9fMGGweeCwRgg1Dr+d/9eH3Qc=;
 b=3lY42eqZS2kv9wECWlJcjzhXGTylpVd9lu63vdXtv9FLr55D8lv7xzGmfVLqsDf6aC
 4FkwLW/8UgCz0VkzMZQZxUaPemGMGlUJPEuMwwNAc/yAugALb3/262gW5iV2qPx2Bi2Y
 eX3tPcIbAm1jxmouYFwCb3qCyp/Ygp08eAwIwwAM46I6fIKCza6KKJYYFfVL6O5olXGA
 N/gxdHHPZP0yyLRJqDWTc3pxMwe35cNjy2YV598YYlOq6l2yy4X3mYfyrxk2OZwHeryU
 aoXV+udmyKsL9Y8lr2wYTeIOgSdS9PCTKMHD1gBU9uhDwuAyppzdkG1vr3P1Jg1c+cSo
 QPKQ==
X-Gm-Message-State: AOAM53261FMzCfn0YWRXpWy6f/TIJ2+WsWohI0IG4/7GV7mxi7TEsoVM
 8ymdaN8VPIMaUgCMrpYgzYE/Fw==
X-Google-Smtp-Source: ABdhPJwy3tsZpMmtKAa8Z+PP3YAuWnFssj1dAbdwrL7GGL/i9W4P1ajH89rZtTfBAzTSrLgBPMJwkg==
X-Received: by 2002:a17:903:32c9:b0:154:3a2d:fa89 with SMTP id
 i9-20020a17090332c900b001543a2dfa89mr17771357plr.3.1647999142958; 
 Tue, 22 Mar 2022 18:32:22 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm24433562pfu.120.2022.03.22.18.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 18:32:22 -0700 (PDT)
Date: Tue, 22 Mar 2022 18:32:22 -0700 (PDT)
X-Google-Original-Date: Tue, 22 Mar 2022 18:32:18 PDT (-0700)
Subject: Re: [RFC PATCH V2 0/1] RISCV_EFI_BOOT_PROTOCOL support in linux
In-Reply-To: <20220303145944.307321-1-sunilvl@ventanamicro.com>
CC: ardb@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 heinrich.schuchardt@canonical.com, Atish Patra <atishp@rivosinc.com>,
 apatel@ventanamicro.com, 
 abner.chang@hpe.com, jrtc27@jrtc27.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, sunilvl@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunilvl@ventanamicro.com
Message-ID: <mhng-5eb23850-e2a9-43d3-8093-2f588c71de00@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_183223_870521_2B6A22B4 
X-CRM114-Status: GOOD (  22.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 03 Mar 2022 06:59:43 PST (-0800), sunilvl@ventanamicro.com wrote:
> This patch adds support for getting the boot hart ID using new
> RISCV_EFI_BOOT_PROTOCOL in linux efi stub. While there is an existing
> solution of passing the boot hart ID through Device Tree, it doesn't work
> for ACPI. Hence an EFI protocol protocol is recommended which works for
> both DT and ACPI based platforms.
>
> The latest draft spec of this new protocol is available at
> https://github.com/riscv-non-isa/riscv-uefi/releases/download/1.0-rc2/RISCV_UEFI_PROTOCOL-spec.pdf

This looks fine to me, but we need the spec folk to commit to this being 
a stable interface before we can start using it.  Historically that's 
been "frozen" for RISC-V specs, but I'm not sure how that all fits 
together in EFI land as IIUC we also have to follow the UEFI forum's 
process.  Last I checked you guys understood that better than I did, so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # pending spec freeze

I had a minor comment about the error message, as well.

Thanks!

> This linux ptach can be found in:
> riscv_boot_protocol_rfc_v2 branch at
> https://github.com/vlsunil/linux.git
>
> This is tested in qemu with u-boot 2022.04.rc3.
>
> Changes since V1:
>   - Rebased to get the "Fix get_boot_hartid_from_fdt() return value"
>     patch
>   - Removed mixed_mode member
>   - Separated return value and status.
>
> Sunil V L (1):
>   riscv/efi_stub: Add support for RISCV_EFI_BOOT_PROTOCOL
>
>  drivers/firmware/efi/libstub/efistub.h    |  7 ++++++
>  drivers/firmware/efi/libstub/riscv-stub.c | 29 +++++++++++++++++++----
>  include/linux/efi.h                       |  1 +
>  3 files changed, 32 insertions(+), 5 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
