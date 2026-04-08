Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DB0FB518C
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1oQOPzhKhaTUXI0NMxKzzuBI3JS84pY1FCo5wz9qyk=; b=IQ4F+m44TExMoV
	Gvd+XFLKzyL1NK59v42OzmEl3yNxFlKesDeOdMOLT6X4iLgs2Z2v4QtFMVrZ9HvxcdqX+xz02Qj/3
	40qIt/LUy0Xzd3gwwscrhfWRHn0zwFm9u9PwOMP5yqYOnkcczaF+2ERplWaOjwbMYG2tD9ihPuhZW
	bQ9QQr1l8p6dy3ygKj6WGSUkzsRQr78JL6+LABPWfB0PQVSWxRsSkw26r57KbZgqg4tIiIXDWMrvt
	fVhujDNnFmTHOm1WzrZWNhvNc7lvkfMKAuWxZX1z2GwPNzxrNPilehDAkqf5Qm38PpD/X4J8P7OP+
	imh3s8OChFkN8ZdZnmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAP9U-00000008bId-3EjV;
	Wed, 08 Apr 2026 09:24:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAP9R-00000008bIE-2R5j
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 09:24:46 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso3899168a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Apr 2026 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775640284; x=1776245084; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HGv1dXjup+3rq4irDVbSLxpx15FcV/deE0cr/bXJZ2A=;
        b=gqcuX1v+XXI+xqT81V6s9i9nCTW9qlri557gaQT2zC26hhmxsWJ5G2yH0Y90Uy5PV4
         aeMGlCUNR7MiSfTR27fFHZuLBT4t2jFggdkIRIbhurv47tx+yd+UsueUau45ing7iH4/
         MBHwnfuopwEWuH/dIBFB+KXWwdA2gPTo3Mz7++4x9o8Dss+W+8v/xBLAjN+usIyD+oge
         pBMXkq/4AlHB9yCRkP++1YwRN3MsU0YQSgqSmYtnTrIEIl0vYbuxstKKffp6CRGyfTXr
         5qxwnhrCkD0BJ0xH+qt9gY0ul3Os1us4UzSubrrwYQckayC3GBSRSpDmu5cGr5LQjHTd
         RDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640284; x=1776245084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGv1dXjup+3rq4irDVbSLxpx15FcV/deE0cr/bXJZ2A=;
        b=I0/CoGCfNRkKknd88O8/dEoodJsHrYJGuKxzTU6CoNXtn4Fs2C5c8RIhtu+gh2Llmn
         /17QrMiON2ZhD6FYyi6vj7CP/nBd0ZMpCksHiuprKmm0Z7R0M+u/c4+1ZAj4Bcus8dTJ
         b35fuWNUKPRoqtu0L2l0MrVW+BRqs5DCZVZVq7+Sgn3fh+GtY0SyIyO5Ts7r3NSTbItx
         ZubfqAgYDMlK5w/CPErgHoT+mJeQagEzG2pmaJKMY7LAXOz1BfUb5mBZZTFkLqXDHvmZ
         J0HkcHXp+CmYiVu9JG8o38XGAyc5Pm5XIoPZXXEfrWUAgicHX15RyjUCGO+R0ZN1oa32
         BJmg==
X-Forwarded-Encrypted: i=1; AJvYcCX7smE93L0vCEvk5/EY5eUjnrSgF5mAhRvqE8K2Bx816V6bjEEbNZoJj8vsS++9pXmDQaoAUjgijzzocw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0xO43wdcYK7aN9rVw1K/+Ylqw5+Q1CE2sRLDKjruDgaLhXC9J
	t7rephcD8Orus3vjPB4KeI5cFkP01cShhG7Tj7rO90IyhPK11rDIOmON
X-Gm-Gg: AeBDiesAU5HLs7Vt6Uf9yMlysIVg2CpgqaLVrx1ucSszPfLp2XSFUDZHJenvhgG1fPz
	zwAS9rKu6ABHTeiPj2eREvuq1WHu8xVsi5/gW+lbbNolI1pGjMN5QuwjD3k0tObBD78pRItXoZO
	HLhXf35U8DbvX26rTUVPaSUBz18Cr5avJQB767l1YOTGqG3FayhT/q5bXX4TxnZpwnwFXl8kqQa
	aSXybZJBX+wB6uKr0r0V3E+3Jx475HjDhlB37qKLLwujRtq2FBdMrT6eiCu6mFR+vuyhOqOtbSq
	q48P//PMYFCmB/P74kDsXvx1F0+NjAAINmw6P/vSNHkSMMnZc3Ful+Z0Uabd5izXR1netZd8Q6x
	VpvJKCgRWhcYUJN6Bf56RK2qqlDtICjXEWZss0s5x8p1LwecqM2Pll03pdDW5NmZCCzQMO95LFa
	f1OCL++E32yl3w0VafxAkggG0=
X-Received: by 2002:a17:90a:c10f:b0:359:f6f8:57b8 with SMTP id 98e67ed59e1d1-35de67d8a5amr19185815a91.1.1775640284172;
        Wed, 08 Apr 2026 02:24:44 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f52c8sm18754408a91.5.2026.04.08.02.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:24:43 -0700 (PDT)
Date: Wed, 8 Apr 2026 17:24:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Guodong Xu <guodong@riscstar.com>, Guo Ren <guoren@kernel.org>, 
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit
 address
Message-ID: <adYdiH4Mj5l_Sd_Y@inochi.infowork>
References: <20260406232655.144043-1-inochiama@gmail.com>
 <20260406232655.144043-3-inochiama@gmail.com>
 <20260407-shine-distrust-0546884c2535@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260407-shine-distrust-0546884c2535@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_022445_622269_3D1D257C 
X-CRM114-Status: GOOD (  13.93  )
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

On Tue, Apr 07, 2026 at 05:31:11PM +0100, Conor Dooley wrote:
> On Tue, Apr 07, 2026 at 07:26:55AM +0800, Inochi Amaoto wrote:
> > Previous the CPU unit address cpu of sg2042 use decimal, it is
> > not following the general convention for unit addresses of the
> > OF. Convent the unit address to hex to resolve this problem.
> > 
> > The introduces a small ABI break for the CPU id, but it should
> > affect nothing since there is no direct full-path reference to
> > these CPU nodes.
> 
> I don't think node names are abi anyway.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Hi, Conor,

I do not fully understand this. I agree with that there is no one
use the device node path directly for node reference (especially
for the CPU node), and they prefer to the phandle. But I think it
is a thing that should be persistent, right? May I miss something?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
