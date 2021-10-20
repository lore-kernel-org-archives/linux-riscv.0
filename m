Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA62C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 15:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8590D61391
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 15:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8590D61391
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MMBWZwM+gnkwIHs4md2HQDnYyfdSgRX5TZ/t1n5FpZo=; b=DYY
	fZy73vsaE87pjzmnUoSl1DGaC/XP2ktZsPV4gGKJAH4G4X8Msyg1B+JfrKsXU9TgRisiWjRaIAAeJ
	P9vGWioqNp7uxmMNsonVAnklDyBAHB2hH6X7vcdLUNxsZqLiZ1GiDHPFBdF+voPToM3tNtisbCtw7
	04x8xnNizyElFu3tsCebUv3O6m/poUMKKDlXarKKisnQclbNFl+Y6n+CD0ZVGvonsB4OzDzAHAmqz
	2EFo5idrbbR7SOOXzfEzdqaLc/P7kftYPe+fClFX/c1oDlEYGB8s21qAYtdmm2nDPD0t+LqjS5Bsi
	JGcnNHeSPSbqUhQQQ9kbkPLAPBf2/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDbg-0054Kj-BV; Wed, 20 Oct 2021 15:34:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCta-004pdq-Me
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 14:48:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 u8-20020a05600c440800b0030d90076dabso5283071wmn.1
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=GMfVD5PP5/AWM+y2C480wK2cHFkuYwnxEterOgHOaYU=;
 b=dgR36kgkR58e2ezo7KFUpodUX8HRQsI5GEs2db5akahWaOHvpdz57Vabc0OA1lEkW0
 8axjE+2FSNJHgpKjVo4qvW6ge912gP7fix4WZ8QJQCxdb2HMHbg6SedQnkMfr8lvbtuh
 l9MQV25OnLHYdULR9EyyiGNIK6GfqSMZDiNZw92xbcCLUftri8E4Bj7nowoDetRmHzEj
 nOtZv5gMrVyUkyMiGeFWa62AcL5UMegzdThxOOz1Bdq41bJgwcUAJNXbm6jxobRdh/Im
 gTAmN4owzna4TZoeGpKpU8ULWvE4VL6X3JtmR140XOpN0+wnPbJjPDLityxgfp44WmUp
 Sfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GMfVD5PP5/AWM+y2C480wK2cHFkuYwnxEterOgHOaYU=;
 b=Q8HiAESCi6EXV2vAi2v9CkVgW7o4BNBQ5qGt48eTb1HnyRN4I00Lz/hxVaiX2VoRNl
 97ZdxYFLFpmBnIvIgOK/daSxTh8XyhNzH31XBs73A/8HhGw188ugoyD/UBz7ztscaXfs
 dPaumOIhw+ibIS8NVtXoePw2TaJVaXfNgQTavW2Xwq46IvStbsNS0DiIy90vna9RuKI2
 ksH/+TKrnaVe0Ua52/70wFH3IxRz8OuPx4tzNKFQPSwX5LnifMWgER5VkECT3l5g17jN
 yvMcerE8RLN6IrhFP4zxkbB3WsCkKB2vyk6X5vl3purBNReHYLi88XzMSDM+/nMBUI+r
 kLLQ==
X-Gm-Message-State: AOAM532od6kACO4WH7vLweHJGARVjbohIh9smg9QzwW1Eyz2JLu2f/el
 /1kCpulRndh9vpKGNvGM07lyassRrnczef4TcNMVAc9N9zHE6w==
X-Google-Smtp-Source: ABdhPJwzgjyJ+PICNX2eocy2kFrVJRc7FD6euzHV2H0U/o3BuNWe7GG3dcD1iT7XQtlMC3TT3R46/aRXhvJyFv0WJjw=
X-Received: by 2002:a5d:630b:: with SMTP id i11mr180201wru.65.1634741324697;
 Wed, 20 Oct 2021 07:48:44 -0700 (PDT)
MIME-Version: 1.0
From: Venkatakrishnan Sutharsan <venkatakrishnan.sutharsan@gmail.com>
Date: Wed, 20 Oct 2021 20:18:33 +0530
Message-ID: <CAGycE2soFowR+06imxXnCDjtxsLBSa1rdmJo+Md-ZkTORJb8Ug@mail.gmail.com>
Subject: Re: Query on clock speed change in FPGA
To: linux-riscv@lists.infradead.org
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_074846_835009_8D88D169 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 20 Oct 2021 08:30:38 -0700
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

Hi,

I am right now working with RISCV based processor on FPGA where I
bootup linux on it. I am currently looking into the method of
increasing the clock speed on my FPGA. I have been looking into the
method of increasing the clock speed. Apart from increasing in the
FPGA file the DTS file needs to be updated for the Linux to know the
clock speed for its administration. I have looked into the
/arch/riscv/kernel/setup.c and /arch/riscv/kernel/cpu.c code and found
no attempts to read the clock frequency there. I have also checked
OpenRISC and found that they have functions that read the
clock-frequency and use that to calculate the loops_per_jiffy to
calibrate delay. Also, I am not able to see any details related to
speed when I do "cat /proc/cpuinfo". I assume that this issue is a
consequence of the previous where the clock-frequency is not fetched
from DT file. Is there any thing I am missing in this process of
increasing the CPU Clock Frequency in RISCV based processor with
Linux.

Thanks.

Regards,

Venkatakrishnan Sutharsan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
