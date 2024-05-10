Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7546C41513
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JqoLivopous5A0ttwP+NJUr1zfRV1yQ5ZnYnuGn0Y8k=; b=DspWocDEGPiFsdd4/1brZMKj5t
	KO6OGtMSz8Oz2CvJG86v72RfRYu/CWbRECSr+D/OHiWImIwkiVUDqwA1KF3a5FEceexUpqcP5eV7M
	+EYQkWG5NGA3rQX2trQU8eO1jcEl+MtCiAP+60ESCypYjBJT1wgbzyVYaEbgPBLAVesQj9oFKevUJ
	SuPF2uUpAYEpiT3H9G+MmkdbIc+8Ox7M+qBdDukrTU2vxesoVOWWMGtKDsMPfQbvh0MlYGpPwFyDn
	Oy786vs8ISb+ImHL+WuTieg/8K3dwbXfJs28T65uOu+ixQPOqDWJONxz4v9/ZqZ+Tg22Cm6k2zEIy
	xgdUgxFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MA2-00000004a1I-42lO;
	Fri, 10 May 2024 09:03:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5M9p-00000004Zwe-1Mvw
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 09:03:25 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A00BF41200
	for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1715331783;
	bh=EZg3bZExhlWVK50gpSicBrX5JPsAAk8r1XrLNevR8+8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=TX5+xMsvsbxEUoSMimMTBo2mmwWV4mRa3e3pO4AQoCFbI4w10pgRpp9Mx98CpRH1s
	 h+FRO8THwSY8QnEi6s/YKbGXHsk5wuJsgCYRXC3nv+oIlwSxY3Ft6OCQWpulmdc4Ok
	 YmHgP0n40zhWOnJAjdhRZVQC2Pz8VNmWMEZNNyOlwK+g9RlJZHZvXDi/vzU6WSmn7E
	 1r6trSYkcRZyfNlGFcCqBQKDFm60IzF5XWJTZVKDfDK7hbBOplc65fgEdblxHxfbR6
	 9AslhanLZHyWo1O6ERoUrrNQwX1rOph/9RYoOTEs2Coa9EoQxFhTF96a44LY+OiIJm
	 wQKEwuU2QqOAg==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-43b08a9d373so18349461cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 02:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715331780; x=1715936580;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZg3bZExhlWVK50gpSicBrX5JPsAAk8r1XrLNevR8+8=;
        b=wIpPDOEwFAFF6SIL8ETNUhwJ99mTeWHk6Mdr62uuxy2Zojwr7LeCJTBuK0xyU9IfgM
         cttMcSiXARIy9m7zqtecv/7FdhvzVubLZtaMrhDtw1InJKpTK3rIYZ9rz7pzUEzlO/hP
         3FltNEBxD6R7Bqp76CR4gWiR8ak9OeFz0cbNgzhxDTIE3UPz1L92U8ZGH3wAmETkVvnN
         yBovS0bd+zSEUa2Dpym1L7uE+g9yBDr/2vvbkaDNuGuRavfHZ9a9kpkaqusgzHIBK/aB
         UYTrWbwSC1YCWU5xzfGdnwE3V6hbzq+PfHYdGizZRRvYdbA/opvU+9uqxIc3VnHG46Mw
         Zeiw==
X-Forwarded-Encrypted: i=1; AJvYcCX6O4VjWuEwGueAhzq0TrfvdZC/1dWfuc1z++DckDDl5kSO+35WX7Z5gBwa1peQLiyu/etgfDrJWg7gj+GFDPWybcSJw2eJjj5XUb8k26iC
X-Gm-Message-State: AOJu0YyMJiKDGKlt66lHsgbgRk6wUtaVSoGrC4LduYwYgNtS9kOzbAt1
	9bZNi1isIzL1cBOVJ2XPTPriIagB0Opyou4wuhV91ud03VPp/kDVQZgIUp7SoaxNJHLOacItO2J
	4x71KTqt89dTM1AtwL9Ne1r79Wo4646IaEzMSGX3tfHE4pRfS9Wd2pWpQWcr1t7l+XWx7CfdpZm
	eEC3D158RnYZwJbooz/S8lx4lWO54l3rD6dEYCY4QtXQz/NRto8MHdGiVe
X-Received: by 2002:ac8:570a:0:b0:43a:fc66:35d8 with SMTP id d75a77b69052e-43dfdb06fccmr22804931cf.7.1715331779843;
        Fri, 10 May 2024 02:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm3BolVFsu22mYiTmhPkAgiTCxY6SWjICQtL4EpS7KCkeY9VWrwi7XisKP2lAOKpom9apfc0uDgJLCEOJTYis=
X-Received: by 2002:ac8:570a:0:b0:43a:fc66:35d8 with SMTP id
 d75a77b69052e-43dfdb06fccmr22804731cf.7.1715331779539; Fri, 10 May 2024
 02:02:59 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 May 2024 04:02:59 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <87wmo2nmee.fsf@linux-m68k.org>
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com> <87wmo2nmee.fsf@linux-m68k.org>
Mime-Version: 1.0
Date: Fri, 10 May 2024 04:02:58 -0500
Message-ID: <CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100 boards
To: Andreas Schwab <schwab@linux-m68k.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_020314_232898_A1A30582 
X-CRM114-Status: UNSURE (   9.35  )
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

Andreas Schwab wrote:
> On Mai 08 2024, Emil Renner Berthing wrote:
>
> > This series enables the in-kernel Bluetooth driver to work with the
> > Broadcom Wifi/Bluetooth module on the BeagleV Starlight and StarFive
> > VisionFive V1 boards.
>
> That does not work for me:
>
> [  +0.369276] Bluetooth: hci0: command 0x1001 tx timeout
> [  +0.025545] Bluetooth: hci0: BCM: Reading local version info failed (-110)

Hi Andreas,

You don't include any information useful for debugging this, but if it get's
far enough to load the firmware could you at least make sure you run the
version below, so that's at least the same.

https://github.com/esmil/linux/blob/visionfive/firmware/brcm/BCM43430A1.hcd

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
