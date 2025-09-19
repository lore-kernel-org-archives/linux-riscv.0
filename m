Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24282CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKX+QpH4l+r0Qo7HP6e231MBWun6TUKk3Mn6dGK1McU=; b=uqO3s8xJay5aQm
	Arv1qItqS5pxG2Gzfag8lh4VG7aEMaH0R3Rz9wd3lPV6TKqGbaMClMljI73Xg/A3ye26WzTPWL2Xu
	ZhhANri9Hwgm2E7KVx2oRy0MdPk63yCx3a5AreMN3paQWisa3vVCRLR4ybmSMNf8pNmKuh3vqvzhp
	XYnZkVDgJhsOEid85r7IjAVO9UxdecCfIFIAknDGA22TmJjERNrTy+UhFS/e+8Bv00OhUjJs+DOqW
	0CwAHS2gVg16vjKzXbfrTAVoP4GBG5kA5wiMHxJ1+mcelmfN5BD+WRvkrJ2mqJJcEC1peST4quqTC
	i+I05qDdMfZS5qanz7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYoQ-00000002eHU-26JA;
	Fri, 19 Sep 2025 10:57:58 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYoO-00000002eH5-0XF2
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 10:57:57 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-ea473582bcaso3432374276.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758279475; x=1758884275; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PDlYVh7GTbh+tgCNXodsPOOiwVHg3s+VohI00r8zodg=;
        b=lrAITfPL5pvRtQTvKUWhQB10qA2goQZCMjef7gEqpm5auEj8HqL6yzXdFH3SPOQYq2
         V2bVBtAnzghdGtBQVyTIhNJ78PeM19Ny0ybN3dKxTd/WLMva6iQK9DDH2VNo2Y344Nxe
         GyNcsknrabfyxXNQxjx01b40fj/cS1S6TQEXRLntUjfWWFDxNf1pTdMvqR1usCt+708R
         ZiAsscsi6sg8hP/jT8pvKtShBC7qoczrvaeopn9YU51cllLEEw/PYAJTP24o5AQb+j2D
         TQ3m5mQUIui9kve8pMP2+U0PSMdEhNPQR7GrzyBjnjiYcTQUY1CJDBSm3xcsLdCXPpnv
         3b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758279475; x=1758884275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDlYVh7GTbh+tgCNXodsPOOiwVHg3s+VohI00r8zodg=;
        b=CKli3251vjy0aRRSOOWzXT39YtpVIaCR9ON2wPsV0HUlh4MlYBhGJMjhwRuZkT+tYb
         Z6opqlvpMuG1uxuSFPZgJuTYBY/FWxRKb3T7R5VcenL7JQGszJ9LtR8cswpKxf0gFiQl
         EPDw/9Pm88u2Br+uk+irWBC+i7/Bl5tjEtVaBXVmpZIixrQLf4uR4K1PNUA83NClmrM8
         8dPUaWpifEeLdOw0Mi5IBk4/E9lpbKuMoTrqapgTmMk/HbPjbI36ReCahEnE94yWle/v
         KgvBp9Rsry8MJ+gUmgSFyDWtRJklRnNGk6r6SaparPEp5iZmMHUpcpsOKOJ5ytd4v2+o
         qQnA==
X-Forwarded-Encrypted: i=1; AJvYcCWGOSGZgpFPD5LhTRU9VlFxQ0VJ7l0QhciMYGgrbqZco8nc5Irb+Z1uju/deu7r+o67da7tQmUEr9/7nA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhDMdUYn8rvDscDuiPvMryi2rjQA6GwH2dlQf42y4lIdfwAfpU
	d0rPmOjWCzQ+sI3ej+xsRqoLjSZaUoQJqqrE9e20kenMJd9NfXB5XRxFr34iB7Vu4kHr90tinP3
	5phGGoqKOFgVRJAwNUkKRI1hRakVGIwWR8/+7z9MrQg==
X-Gm-Gg: ASbGncuSszwrNMipIfS5bIpmiyoS4j8R5UxMleTH3ZEzf3CWlbjS3yF4IxaoYq1Ugc4
	9kfKWtQevGoJSryUdh8gsuNVHdhqz72JA3bAZL/VskWzOYfJcZz7zrlJjg9AHcOfFEMbILGSqu5
	K6wleUk/WWhlJGVUsmesjd6AkmBQW9rjeNwGcHdYdUmpC30Z0Ge2vckmVMvz+8RFpxQdQY0vNlA
	tN/laB7
X-Google-Smtp-Source: AGHT+IErTnWgZxsd2J1EC6Faj4gYfD5qobVd3VLWos0tsTxFU2Dylts0CyodcC1JPhxZlPN7R/LgecNfJDI31clkpQc=
X-Received: by 2002:a53:cf0b:0:b0:5fb:cf0:9151 with SMTP id
 956f58d0204a3-63477703065mr1941255d50.11.1758279474618; Fri, 19 Sep 2025
 03:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250918173323.340738-1-uwu@icenowy.me>
In-Reply-To: <20250918173323.340738-1-uwu@icenowy.me>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 19 Sep 2025 12:57:18 +0200
X-Gm-Features: AS18NWDfr4pqweeSDolF_LptT5gjyy5EtVR79t2lNhAD5snr7qdfOv4ibHayFqg
Message-ID: <CAPDyKFrGyDiPZk7BZYAon+xG7S83SPvp59TNMjyXWX7Okhp=Jg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Poweroff/reboot support for TH1520 via AON
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_035756_174948_A654DC79 
X-CRM114-Status: GOOD (  13.15  )
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

On Thu, 18 Sept 2025 at 19:33, Icenowy Zheng <uwu@icenowy.me> wrote:
>
> This patchset tries to add support for poweroff/reboot on T-Head TH1520
> SoC by calling the AON firmware.
>
> The first patch creates an auxiliary driver for this, and the second
> patch makes the driver currently matching thead,th1520-aon create an
> auxiliary device.
>
> Icenowy Zheng (2):
>   driver: reset: th1520-aon: add driver for poweroff/reboot via AON FW
>   pmdomain: thead: create auxiliary device for rebooting
>
>  MAINTAINERS                                |  1 +
>  drivers/pmdomain/thead/th1520-pm-domains.c | 14 ++++
>  drivers/power/reset/Kconfig                |  7 ++
>  drivers/power/reset/Makefile               |  1 +
>  drivers/power/reset/th1520-aon-reboot.c    | 98 ++++++++++++++++++++++
>  5 files changed, 121 insertions(+)
>  create mode 100644 drivers/power/reset/th1520-aon-reboot.c
>

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
