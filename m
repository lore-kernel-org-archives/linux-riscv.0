Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBE2C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nGVVcZe2kxF/FhxjzBeF0On8DFjea0NqyoxQCGfFtr0=; b=wA625RuN0NZbhXXx/c3fyHbVuH
	0ZwR3umaAgXCY+5llbk2PAymY08w1WHNbcZi9gG6Ovit+BGYIft+llft6i/kj8fgfCO2riEtJjxAD
	anKE95jycAp7ezjVdy7lcbTIEZFyD8qbtoNDgHvh8MptrDLFlS2dTDclSsVn5DgCVsBKuLYK0063y
	8qFnSBPWegxj8850jtgsY3vTSNEPia/Dmq4OFEhfYpHp90ZJ0sPcmknu4bxeGDyAod6M+6+m6Jo5B
	6x0DPM0gAza/+aBtKY1o0o8+5/kLI1gwbxcO3lsV6GFBlgIPUR4hYz1JUfBpnX0NKxI+W1y4k95m6
	jIvrRTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAYp2-00000009Umr-39IS;
	Fri, 24 May 2024 17:35:16 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAYoz-00000009UmH-3P6P
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 17:35:16 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-68194ee2174so905258a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 10:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1716572111; x=1717176911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/lYKjkuHWJ/tP+SWUmNPxY2vRmvZk0xnVEoyWXDsrM=;
        b=uUFptqfmkUPPi95mFp6t3ZkCq5AfPvjWaInR0tnsCFjOQj4XLTLE4Q5sNQWvo2CTOS
         w9xBDZvqc88LSfSDyCP4uT4lOBwYR2SQ8W3WwLwIcgUNgu/WxAne9rhegjpKWC1q0Lo6
         s4NMbds/Obr4HrEta9j6N764Ug/QJPGdtyRLH4MRQlg9Nun2LAimnPOAbYUyf5WYNlkH
         HTDTpxYUFM14X0yRonboLczXG0u1/X1VJOxISm+9amaRmJaJL8urOCjoWT7IF1Iafry3
         ncBWWRJxs58wATV0ucWC4yHD2C4rjVi+VJND1ToU+xy9i3tXUFncvQvzS2N0Vbc5i9s8
         VlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716572111; x=1717176911;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/lYKjkuHWJ/tP+SWUmNPxY2vRmvZk0xnVEoyWXDsrM=;
        b=MZ9vePmokesXDF5ei9MDqda3D3vpyxClwQsXYXh1orOeZ1R5YKTknLe24y9jJNP1gc
         wCcze+F0h1X+9bG0+IpkCDbwW9cI0T854ndUmlnYblIdo8nAksa48EKcG9ztD3DJUVD3
         zoSNu5TnmWYYSIOXhI4hSvTOHh2TwKMTFi+sj0/GreRJzm+LuAwhi+0aTAXQ5CPrZMzY
         9ZSYTVTCti3QgObWiFLKeOx+pKItgRPY+5APMOFsSmAgOt2qXcX7XFpZMTb6SNtxaIt7
         vGjM5BS/+BkD8xhwLbcvPgrOglkirIs4gXkbYZjfjXXKQobwNJi445McVCsJaYY1muEb
         0qrA==
X-Forwarded-Encrypted: i=1; AJvYcCXHLJ3+VjZeWFrCfIpJHdIacQO7pNnhC7nWG1fPvU0RaktRX+Xof9bx2d1of3qjTxP33LvuUYRSDkSsruVE4KPEtuRadsqvK5R5td+vXest
X-Gm-Message-State: AOJu0YxoAWRu/BoNsT8H+8YVlgMDUVfUddyfklv11RLtjbR7EQJwRbyC
	3bceueZJYtwo0LgY7RD7yKZwkvlTxC6NU+G0cUfFAIrhx/YrH6bTJ0V0Hcn0ZRI=
X-Google-Smtp-Source: AGHT+IHIs13/ijYk/c01n1Igl2g2Bp1b8sXlKJdcpDFmF1ecg8B5NT9tVh3ERgJlBBvoqmPuaM3uhw==
X-Received: by 2002:a17:902:efd6:b0:1f2:f107:5a71 with SMTP id d9443c01a7336-1f4494f2cc2mr25001835ad.44.1716572110954;
        Fri, 24 May 2024 10:35:10 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c75782esm16429155ad.31.2024.05.24.10.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 10:35:10 -0700 (PDT)
Date: Fri, 24 May 2024 10:35:10 -0700 (PDT)
X-Google-Original-Date: Fri, 24 May 2024 10:35:08 PDT (-0700)
Subject: Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments to function 'riscv_ipi_set_virq_range'
In-Reply-To: <875xv3dt71.ffs@tglx>
CC: linux@roeck-us.net, Conor Dooley <conor@kernel.org>, naresh.kamboju@linaro.org,
  linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
  linux-riscv@lists.infradead.org, apatel@ventanamicro.com, anders.roxell@linaro.org, dan.carpenter@linaro.org,
  Arnd Bergmann <arnd@arndb.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tglx@linutronix.de
Message-ID: <mhng-44d7a1c7-c15a-4077-ac94-23985f686474@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_103513_876458_89E9DCAD 
X-CRM114-Status: GOOD (  11.00  )
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

On Fri, 24 May 2024 10:18:42 PDT (-0700), tglx@linutronix.de wrote:
> On Fri, May 24 2024 at 08:10, Guenter Roeck wrote:
>> On Wed, May 15, 2024 at 10:05:59AM -0700, Palmer Dabbelt wrote:
>>> as a conflict resolution, which IIUC should happen when Linus merges my next
>>> PR.  So I'll try and remember to call that out.
>>>
>>
>> Unfortunately it looks like the conflict resolution did not happen,
>> and mainline builds are now affected.
>
> Fix is queued and goes to Linus tomorrow.

Sorry I misesd this.  The PR I sent Linus this morning contains my fix 
from earlier this week: 
https://lore.kernel.org/linux-riscv/171647463438.13050.6219786365640043025.git-patchwork-notify@kernel.org/T/#t 
.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
