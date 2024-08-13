Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FC2C52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 19:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+YOgmDLKA47sRESofXN+ZFiTZcSJujkp8GgqQBChRQ=; b=w8qdP5fLfOFOTc
	hdVhgZGZj6jMYY2OPYZSCfbNzmZEw6FxVWh58o5FLUFGa9x/ho2mA3LuU4ciJkeYcd0pz186vjkUn
	iqJg+7yYNmDcQJejLVbzotzE5su5F47RzjyOAS6NWNZnzl/2UGVRqBfe3gxGS3n8qdL8VSiGf3RrR
	Kk/dzFkDP/mEjykkrtPlBWgb5bVe+Dv7qvwIvRp5K5rsqPHVhBEV8SzlE5n6HcyC6y22WvO90IMSZ
	tfsygCpDgYJv9iZyX/lmgkNNH2td13aGJSjzBL6DXYMXttkCyjQuACKS2N8qOxCu/RSUB+jooM7Kl
	++uiKqTwSpBBFZwQLEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdwzn-00000004jUo-3WWG;
	Tue, 13 Aug 2024 19:15:51 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdwzi-00000004jRm-08Sx
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 19:15:50 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-70eb0ae23e4so4394848b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723576545; x=1724181345; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=upO19SozBGW3wqb+VTuxXAbPoh43oKi0VkEemu0qAIE=;
        b=wAdU1x04KS40vjKR0oYPgpJS+De5BxIGQd8x1+K05EW0qnJ6x1t5/Uk70JgL3e8yud
         GzyqMfAVa5Bvd5xdrLYZvN5H5ByAzFClgkQu+PpA0uJGRnuz5AQNGsbkvljAQI+4ZvO7
         E7+76kIbP3/FRujKVRxmYAyZvb0i/csIgG+VXI0G2LdEylOYuDtn0ebv0NuVkB7SYf8D
         aZFKX++bE7qwh3yy10H8Wn8F4LBKNpLBHzUJTTT7RmC5z+IdveyARZ6VjzJfGH3Vd1md
         M6ZXyIep3Z2hOnLyHTQ7DfL2CIAbrTAxoTykWZO9gxGekSAhMY/9jbbuYwkl7xJZvV3B
         chNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723576545; x=1724181345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upO19SozBGW3wqb+VTuxXAbPoh43oKi0VkEemu0qAIE=;
        b=FDwwjm+SWa5gO7Sueh93OVnu1/aCDI7ENaDjFCiE02CdjyjILMR/maT61lRCah0eFV
         H4SbdSd162N8gidmyagJfsOJsQl8jfo6bnJeCmA5/OXxl9nckvnHvb2UVo6HMm7yXS+d
         wDu8RFjI/YJtxtMC5aI7dPKwXqD+AguxpQ25ui8uyMcKj7guGvb6UKVgc3Fbv/xoNgC2
         vIXXjZnswU7IzdvjU18iwPCWfp6M2p8Wod7tyVvJCYU/WPrTfOKWsYvuRSA/Vk89HX6Q
         KKkOM+e6eivI/PcY+rKVdjcQNmnZkcTyoZzwhExR0x2F5a94s9wbyZ0vmQ8S+7pcOJqu
         E+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVSnNv5Oo0z37vponiHYIcfkdtxZQVY89eDrjSVcV3hpjB1G5rFdFUohFudnkER14S++hDJ5re2ACVzwpmfyDEDxx65s7ClPJLe/YzEGKIw
X-Gm-Message-State: AOJu0Yykt8haY3pt6k5Sz4bQbgTCRBeSHy8I/miC17opYM+tik/m/WZB
	hCqPCTYA7y/ac5gyEYSgjIkEoRPtQ68L/Ty6EaQLZ0JITBI2QX8pDmBMdcaM12k=
X-Google-Smtp-Source: AGHT+IHkE8ev8c9ixTOpOS8k+f7v59VeVKfF+Zqcm+gC19sVxa1p6KC0GWQGsDmZo9DB9KuLB8MPgg==
X-Received: by 2002:a05:6a00:2383:b0:70e:9408:fc34 with SMTP id d2e1a72fcca58-712671037a2mr688748b3a.7.1723576544561;
        Tue, 13 Aug 2024 12:15:44 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5873864sm6051385b3a.35.2024.08.13.12.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 12:15:44 -0700 (PDT)
Date: Tue, 13 Aug 2024 12:15:41 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: "Wu, Fei" <fei2.wu@intel.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, guoren@kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: Re: riscv syscall performance regression
Message-ID: <Zruw3dUAYb3zcxaV@ghost>
References: <738d3b74-1e10-4eb5-8c0d-1db33feb740a@intel.com>
 <28cf8a77-e9af-45e4-b178-fd7a478f9b4c@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28cf8a77-e9af-45e4-b178-fd7a478f9b4c@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_121546_470475_5E3F2438 
X-CRM114-Status: GOOD (  35.25  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 13, 2024 at 02:51:09PM +0200, Alexandre Ghiti wrote:
> Hi Fei,
> =

> On 23/02/2024 06:28, Wu, Fei wrote:
> > Hi All,
> > =

> > I am doing some performance regression testing on a sophgo machine, the
> > unixbench syscall benchmark drops 14% from 6.1 to 6.6. This change
> > should be due to commit f0bddf50 riscv: entry: Convert to generic entry.
> > I know it's a tradeoff, just checking if it's been discussed already and
> > any improvement can be done.
> > =

> > The unixbench benchmark I used is:
> > 	$ ./syscall 10 getpid
> > =

> > The dynamic instruction count per syscall is increased from ~200 to
> > ~250, this should be the key factor so I switch to test it on system
> > QEMU to avoid porting different versions on sophgo, and use plugin
> > libinsn.so to count the instructions. There are a few background noises
> > during test but the impact should be limited. This is dyninst count per
> > syscall I got:
> > =

> > * commit d0db02c6 (right before the change): ~200
> > * commit f0bddf50 (the change): ~250
> > * commit ffd2cb6b (latest upstream): ~250
> > =

> > Any comment?
> > =

> > Thanks,
> > Fei.
> > =

> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> =

> =

> So I finally took some time to look into this. Indeed the conversion to t=
he
> generic entry introduced the overhead you observe.
> =

> The numbers I get are similar:
> =

> * commit d0db02c6 (right before the change): 185
> =

> *=A0 6.11-rc3: 245
> =

> I dived a bit deeper and noticed that we could regain ~40 instructions by
> inlining syscall_exit_to_user_mode() and do_trap_ecall_u():
> =

> - we used to intercept the syscall trap but now it's dealt with in the
> exception vector, not sure if we can inline do_trap_ecall_u()
> - I quickly tried to inline syscall_exit_to_user_mode() but it pulls quit=
e a
> few functions and I failed to do so.
> =

> Note that a recent effort already inlined most of the common entry functi=
ons
> already
> https://lore.kernel.org/all/20231218074520.1998026-1-svens@linux.ibm.com/
> =

> The remaining instructions are caused by:
> =

> * the vector extension handling. It won't improve the above numbers becau=
se
> the test does not use the vector extension, but we could improve
> __riscv_v_vstate_discard() as mentioned in commit 9657e9b7d253 ("riscv:
> Discard vector state on syscalls")
> * the random kernel stack offset
> =

> I'll add some performance regressions in my CI in the near future :)
> =

> Thanks,
> =

> Alex

I have written patches to do this inlining but haven't sent it out yet.
I don't know a good way of showing performance improvement so I have
been hesistant to send it. It is generic so showing the improvement on
x86 is probably the best. I have also written some patches for cleaning
up some of the other syscall handling but again haven't been able to
show performance numbers. I was going to use a thead board but was
unable to get it to boot on an up-to-date kernel as I posted about here
[1]. The patches here [2] should also show improvements.

I can try to get some numbers and send out the patches.

Link: https://lore.kernel.org/linux-arm-kernel/ZoydV7vad5JWIcZb@ghost/
[1]
Link:
https://patchwork.kernel.org/project/linux-riscv/cover/20240720171232.1753-=
1-jszhang@kernel.org/
[2]

- Charlie

> =

> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
