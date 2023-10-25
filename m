Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE845C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lS2L06xOAu8Vq8pbCNz4ixudYIv/sQRKZ8Mr3wG1y80=; b=AxEZM3i3IsQiKP
	FVWc5FyVGg50fotaHTPVvdpTRhl1tYKEOJXVrcQ49lOT21XQFnyuWUB0WTM1PkXDhAAEv6X3ABcuC
	fVPY5UtpvQmGJeH3Q2vlAK8rZf2yFEZ4veHQsT4ZxtzcbuR4aGKcU61tv+4unsDWnWPj/60r/4qbV
	Zgu0qsNpLkMRNtbacHW7i/EB639wRrsGYfruzgQB/r69ROf0pWKI49t/rqaRrl61AVx1EB2A/S6ND
	uflVtQjE7o1p2Oqq7zQcjXGD9tTh+xxo4Oq4cSE1pGfwYCt2pa6oDsauz9MZKXsXYKlYj+dA7xeWI
	ygOkcezrvn/e9Oa/Exgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkGL-00D1na-0i;
	Wed, 25 Oct 2023 20:13:57 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkGI-00D1mt-1v
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:13:55 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6bd0e1b1890so112711b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698264832; x=1698869632; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9eul69pshen1s/x7/gzxYAUPoCheVot1DPXycaxP8A=;
        b=mzHu5+jksO+/lHSvcMvSZJOtEhNlQZ1uV2raoeoLzo0OVWQoE0XLmx0eDL3+zIJ0fg
         MPnIEteWsK+6pjyCDYVfoRU24+zAeGr+HtJKES9Giuj8VWsTiwIzvVgkS6m0r/Vox3DY
         5qwJYOjK+ZSIHrjjhuCN7/VjtR5ZfcyXsl8wLHQaWMRmNMTxeS9x85PnoTrao7rRqwOV
         aquMzBdUQvlyQHpGeVBuEmbTKhHDWZAOCU1V5XyxFFEGXXYpHb+KkdhyiEe7bgtkXTPu
         C6eU2/vZakDlHdMz1sl6wxwYZwfD6H+Jcax2nUFSSQZhTvuJxIxhn8RT9reMkg2wbhLB
         VDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698264832; x=1698869632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9eul69pshen1s/x7/gzxYAUPoCheVot1DPXycaxP8A=;
        b=c6I4kPFHPoIMB6b0+yA5OCG1o9FlAEK1R4rViHxmVP/M27lm6ZTuT51oDnAvCPeynP
         h6A2H77eV5tkw2lgNO/9fWEZVf/M24DP2Z+w9oOH89nUZdOdfwQP+/td43an/nzOGsrZ
         mp9XZO2n4jVJeJn4avXL8ZMv6f+2elADRh2FSd4rqE+Qra7gYNOb1BlhaY7XBNiDjnr+
         iHCsIqX7On4NoRmq1d/73ctJAani16VsTUk/C7kM0jYDcVtEqXiugkuiXdlZYSlAJCsM
         akSx85cjvgHWf6lzW/U5HQ8TM3F1yQNe0lzZDjfgNch5Aewrgp/G5DnrTKbttHe537kx
         YFVA==
X-Gm-Message-State: AOJu0YxlQIRcqYE41lPIEbeYdgPI8wd1o4gUQM8HjmnIUHPtlbHJPKJ4
	P1r/gdCaR4ZpMFtMuRCgO4g=
X-Google-Smtp-Source: AGHT+IG4DpjJTdvsHL9M32cnRu++G3ljis347I/hA1ABt7FieYScOoT525YJ+D/T8HluBh2CrKefQQ==
X-Received: by 2002:a05:6a20:4323:b0:15e:986:d92b with SMTP id h35-20020a056a20432300b0015e0986d92bmr7457083pzk.16.1698264832120;
        Wed, 25 Oct 2023 13:13:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bz20-20020a056a02061400b005703a63836esm7926147pgb.57.2023.10.25.13.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 13:13:51 -0700 (PDT)
Date: Wed, 25 Oct 2023 13:13:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Add Hal as one of the maintainers of
 SFCTEMP HWMON DRIVER
Message-ID: <c37f7810-12ea-4abc-bc2d-c68edfa6dadf@roeck-us.net>
References: <20230928075249.109459-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928075249.109459-1-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_131354_637408_5EBC9829 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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

On Thu, Sep 28, 2023 at 03:52:49PM +0800, Hal Feng wrote:
> As he is the submitter of this driver, add his mail so he can
> maintain the driver and easily reply in the mailing list.
> 
> Acked-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Applied.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
