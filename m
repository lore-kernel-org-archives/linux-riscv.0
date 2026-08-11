Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4D2C5CFC1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZFl/c9M5lhCLAg7yNI8tmdylfOGOb75MO4KRgUJNoo=; b=3z1cdzX3B5G+XF
	7gz11mB+Dd6iV8FR4hu4B4P4Rgd2+7liH4qW5zkGfWcHs6hJFKFCARO4MzScwCXhmMwlJz0wj/DIi
	LBA/sTAzLvTQXQ7d4UihGGPaLFQhoQQbnNh+dDOf0SHKohp85hUrnh1+OegwqMR4HBj90sqXfo8jS
	KRaL5k1cRVIvD8S6ubc6yS5487HBvt5UPX/ojnrhyTISr3Vc5mOE4BKfAK8OeMbyRFSAR9XOvgPLR
	EThafHCUXesLSsGVV/ZjC3nn/mtqEOkgSiqJFYUPzYahutNcwlkOQd2WViptwaj0L6/L7gp0m2A2Q
	4ZGtCZjmYsG9mV//8iYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiuK-0000000DlDD-0iuI;
	Tue, 11 Aug 2026 09:36:28 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiuG-0000000DlCQ-47Mk
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 09:36:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2388341a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786440984; x=1787045784; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VcbzXbSdyoexmhki4K88F749nCD4aY9ew05QBhC5eME=;
        b=l5h4RGTAxQ4F9HbrqjCO7pMZWb0muHJFqnWw3YyNufZGmCCHPjfqBoykp/vvWaokfb
         8aWIgHTBYjxvKeLoDNCt0VRTAxfQ9XkhH5yXA8UXdGPW8sHkvIm5SrcCfXz81PJob//l
         iE9Fj8up18fBFLZ/zkqhJBhnYVA3Wt7hvd5uAQ3Quax38Ik1EjS5EqZfZXyZ4jKpheYU
         H7v9ohCY3LfjuIJ2nzGTNN+exBzp/kHFCZCPZSleaNvELIKRsdzMcqDhY9p0p9wADMvA
         jHSONQCCwYgT7nKJO0T5UEi9qhtkMT+yqoV7jyBdAuMIUNinvbKAJ7SEw+YV0PKQGlXf
         Br6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440984; x=1787045784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcbzXbSdyoexmhki4K88F749nCD4aY9ew05QBhC5eME=;
        b=fy/Q/3xNE0R3pyvvXCTdhtPr2A4/HV850kAhgZa+obdit+WfDKZgGSuYGlrmHLKFAb
         MJzXf7GII2orhDeubmiBtIHASv71uy+Yud7b2captED3e7Rr/Auu9s1rjOnd1EJ00w0W
         9SGX0luoNvjtAhMupR/HSqOjUf8oNFCKkwHvVtJfIiGUUHSNMFIUxKbzUO7Vhl/X6FzD
         c1ErqKZvabZJ81f03gE9hy6fYdpK0YvVQ0R06BdRkGsCJKyRSgz5OwNjFSfuXsvpHsj6
         25VD5uMpnIgT8fGtF5PFZi5Cn2i9xrN3pE5uKi5FlirBiH1uU3jvd7Xy3qCFNoSpIxCZ
         pgzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPUpBJLry2sEqcniZr421xLPTnRNDN8qpIRtFQM71mH/XPRhqS4tvKZpoKU5VfqWj1Jjd++VwCNxYHOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHUQnlK/3nNh7rEOYYzKIb7r4mFQF7fRgRC4/d8NiptIebGPHr
	0z658lfDUl8fhBb1BJVur/gx+traIXuj4lBci6wKH1IDHVS/XhjKJSa6IvlYKT/v8mGnV+SEbSZ
	2CBoMuhjEmxn1
X-Gm-Gg: AR+sD1209d5CxL9aPrOidxWk7MJEOP6Gf6g++R3j4lHVKjLDqex6/a4hjherb+zqnE1
	Lp3XHV6N2otGTeueBbzMdCCIaN0Be+wTh5CEUZbQFXeQM993k04ixbo7lSKeprwPIsDbPatHYfi
	urK9tX3bfz/5sh4+e7gJmNzxrf2CZWQoyRHXQiRtDxGK3Iq1FKUddRTN1tGIoTcYdUsovgP5dao
	mtjRDEID3uT9pSCs7P3uZj8sV2PiCgT7ohHtVHyuf27ufOUWnXrv34J8HORM/HCEvqBA5l0i4cx
	y63CKhBNQ/+ZnXYWeFERDJQiEZ0+4q8I3k9RRI5FGHrLAxm8gZUY95Y1PyBwSY6SP1Ue+SXNvUA
	ES3dDgFXrWIoERh7iYR8sZBH57CeHdfEk62LUpzIJzLtn3u21RjJW3xJGE5sdx4Qn6zEbpB8B6/
	YztBD6eiypldaP1q2VT1Ze8St88q/lhxsU9wcPMtZXdh20XK34pmQfn9wKjQxb
X-Received: by 2002:a17:90b:2689:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-392ec4e4a34mr2095732a91.7.1786440984022;
        Tue, 11 Aug 2026 02:36:24 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d5190ce9sm3040036a91.1.2026.08.11.02.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:36:23 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:36:13 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: pjw@kernel.org, zhangchunyan@iscas.ac.cn, conor+dt@kernel.org,
	greentime.hu@sifive.com, robin.randhawa@sifive.com,
	dfustini@oss.tenstorrent.com, raymond.mao@riscstar.com,
	dave.patel@riscstar.com, pincheng.plct@isrc.iscas.ac.cn,
	linux-kernel@vger.kernel.org, darshan.prajapati@einfochips.com,
	linux-riscv@lists.infradead.org, junhui.liu@pigmoral.tech,
	akpm@linux-foundation.org, dlan@kernel.org, jim.shu@sifive.com,
	devicetree@vger.kernel.org, luxu.kernel@bytedance.com,
	krzk+dt@kernel.org, zong.li@sifive.com, anup@brainfault.org,
	michal.simek@amd.com, scott@riscstar.com, alex@ghiti.fr,
	samuel.holland@sifive.com, aou@eecs.berkeley.edu,
	pawandeep.oza@oss.qualcomm.com, palmer@dabbelt.com,
	nick.hu@sifive.com
Subject: Re: [PATCH v2 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <anrtDcL+iAKDuAO/@plin-1878>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-4-peter.lin@sifive.com>
 <178534841831.3259884.2854898669055783798.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178534841831.3259884.2854898669055783798.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_023625_022572_1ED37DB3 
X-CRM114-Status: GOOD (  13.85  )
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

Hi Rob,

On Wed, Jul 29, 2026 at 01:07:00PM -0500, Rob Herring (Arm) wrote:
> 
> On Thu, 30 Jul 2026 00:39:08 +0800, Yu-Chien Peter Lin wrote:
> > Add YAML binding schema for the SiFive wgChecker, a programmable
> > access controller integrated in the interconnect fabric of RISC-V
> > Worlds-capable SoCs.
> > 
> > wgChecker enforces World ID (WID) based access control on downstream
> > bus transactions. Each checker slot encodes a 2-bit permission field
> > per WID (read/write), enabling fine-grained memory partitioning and
> > device isolation between execution contexts. Violations are reported
> > via bus errors, interrupts, or both, selectable and lockable per slot.
> > 
> > The binding registers wgChecker as an access-controllers provider.
> > Consumers (i.e. its protected device) reference it via the standard
> > access-controllers phandle to declare their access requirements.
> > 
> > Also document the sifive,trustedwid property for the /cpus node,
> > identifying the privileged WID authorized to configure all checkers
> > on the platform.
> > 
> > Link: https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
> > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > Reviewed-by: Zong Li <zong.li@sifive.com>
> > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
> >  .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
> >  2 files changed, 365 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sifive/sifive,wgchecker2.example.dtb: uart@1c1000 (ns16550a): $nodename:0: 'uart@1c1000' does not match '^serial(@.*)?$'
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
> Documentation/devicetree/bindings/sifive/sifive,wgchecker2.example.dtb: uart@1c1000 (ns16550a): Unevaluated properties are not allowed ('access-controllers', 'reg-names' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml

Will fix.

Thanks,
Peter Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
