Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14EFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 17:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VE6QaFlb27+EFKeTHVur704V24OvgYozDbAMuZqKPg=; b=MHGEl0nwFz7dLX
	oo7tDxFwY1/Mfy8dxPVXnn38+10mkeUrCb1GvS1utkAwpIjKltqYI09F5V6vfFJtUIXJhuuhUkJJn
	sOy4i8amKDlHaSf1e5uE/VavMEmhkFGhDJzFWY6Mrp50lkwe6rUmkkI3U+EuyLctO8hybVbXA9YgU
	HU6BIY4XdRxR+jokR2p1/NAOduBzfdpx5ozwExn2ikoKSQf7v7I3Au0ILOijxSJO59gx7iXbs2Cp9
	2I7TP0CNHcLs2Z7GQ1FcqshhsUCjGG8vlV2TU15AbBfz9fXJgQAqFvuaIpZspajWv3ZDk6fwCvjVO
	Zu/h/be/piqqFudfhm/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFmK-00ALrK-CQ; Thu, 24 Nov 2022 17:12:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFmF-00ALnr-SN
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 17:12:46 +0000
Received: by mail-wr1-x432.google.com with SMTP id x17so3329039wrn.6
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 09:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/WsFYZRX1AeNR+4gh8Ss2sIErXOewqR12PDDkr/27w=;
        b=vacYD0NQanWjuA3GOSjTYVZDBMGvfmF6Vd904OJHK9xcny70dfoX+cUOp7d6mejteg
         YO9NR4cjc28uDp/GqopCEMys2azE+iluRicx11RgU4nLC/RuWcAOK/yZIrJYHYkFXgSk
         7+Ig+KgaSF0c9G+v77P1qUvuk74Qwmq3CfMOXlVVOp8pXXnpnsZnM2cjDyyNiVC/aeug
         yE4ZycTnCAJ1QWBWeyI63GW1BggJOXMNZG0/vb3Yn9SbI4kcj3ffT4B1rwJNWUpmmInP
         d8E3XF9mS3Pn7qPQn+TadLMYt6w+QjQCx1Zr+S41tOU0RohrnaPpNllIqrshfs6gTZrC
         1lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/WsFYZRX1AeNR+4gh8Ss2sIErXOewqR12PDDkr/27w=;
        b=tUakhdzx9fXN34Bca8NeYMTLZ98dKI+p9/wjNTUl4Cfhh/LEnIlLUpxqdOq2106M4m
         BwCtrWZN/OVRywsxDJop4OOxBsuFgVtUgF0KyTpmd+kM45dpWza6ow669oSGG1orVv3/
         A+VFMZKup9bsUrpwVI4K+ow/x+NBZulyDwuFPZL2q5Q8zG5nVHrxvUZGeEuMJTJa1hOT
         QgF6QvJQqZOMFKIHpQz+OGcQtdZjsU+pZ8qExgiHgMw7NZsw2voqdcohlWrmgMg2uFhB
         u70MQyEP5opVxX/wt0GkfEh8VHHH34xQ1RfEk3KjVc2oScVuOQ2ot3QNu/T2hnwT6bdy
         ggwA==
X-Gm-Message-State: ANoB5plfLH7HMjgz59HFHi5dwgdjxfNW7bs0RVInKAhJllk9VB+wG2Uc
	Ae3RIsAk1Dzg0oxHbbN7/4YfaA==
X-Google-Smtp-Source: AA0mqf4EkcQPK/TpqP3c+qIXAMQp7K3u644h34Pd4fKfm/kHZIk0PLwVnfI5L6Hmb2D87tZnsQYcxQ==
X-Received: by 2002:a05:6000:156e:b0:241:cbe9:78a9 with SMTP id 14-20020a056000156e00b00241cbe978a9mr14665805wrz.529.1669309960015;
        Thu, 24 Nov 2022 09:12:40 -0800 (PST)
Received: from vermeer ([145.224.92.100])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d4849000000b00228692033dcsm1750909wrs.91.2022.11.24.09.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:12:39 -0800 (PST)
Date: Thu, 24 Nov 2022 18:12:36 +0100
From: Samuel Ortiz <sameo@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: "Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	linux-man@vger.kernel.org, Jiatai He <jiatai2021@iscas.ac.cn>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/3] RISC-V: uapi: add HWCAP for Bitmanip/Scalar Crypto
Message-ID: <Y3+mBAV8oxphjHcJ@vermeer>
References: <YqYz+xDsXr/tNaNu@Sun>
 <YqY0i22SdbHjB/MX@Sun>
 <Y385rS/5zDaDJ3Os@vermeer>
 <Y39AXYPFzSiBngwI@wendy>
 <Y39Lwp4rQc3Qkl0i@vermeer>
 <Y39blUaC/jHiOYCk@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y39blUaC/jHiOYCk@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_091244_139449_B33F1727 
X-CRM114-Status: GOOD (  15.20  )
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

On Thu, Nov 24, 2022 at 11:55:01AM +0000, Conor Dooley wrote:
> On Thu, Nov 24, 2022 at 11:47:30AM +0100, Samuel Ortiz wrote:
> 
> > Patch #1 is definitely needed regardless of which interface we pick for
> > exposing the ISA strings to userspace.
> 
> I took another look at #1, and I feel more confused about what
> constitutes canonical order than I did before! If you know better than
> I, and you probably do since you're interested in these 6 month old
> patches, some insight would be appreciated!

Assuming we don't go with hwcap, I dont think the order of the
riscv_isa_ext_id enum matters that much?

iiuc we're building the cpuinfo string from the riscv_isa_ext_data
array, and I think the current code is incorrect:

static struct riscv_isa_ext_data isa_ext_arr[] = {
    __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
    __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
    __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
    __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
    __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
    __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
    __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
};

zicbom and zihintpause should come before supervisor level extensions.
I'm going to send a patch for that.

And the Zb/Zk ones should come after the Zi ones, and before the
supervisor level ones (The I category comes before the B or the K one).
So we should check that when patch #1 is rebased.

Cheers,
Samuel.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
