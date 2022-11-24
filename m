Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0A8C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3U3jsBF0gE5z6q33SG9N3yI29eH+vYpz+z50CKwCRo=; b=RqP+8gCd0JUYDz
	xSa97XMQKsAEqnxAEqy0YzyspdmEFk99BZPFKurIREO4ooiMB+cxe3eJwg1el+gqbIZBG3BRzMQfN
	8xkdG92ypfSIiwGB+21Q5EdEN0oOxTsA+zOXj8/d43dSoyFHcF8Whc0e9EVZMIpr1nvgoAHpv3ydU
	H3ZQiIraMz6CuwkDF/JXMENkd/Be4LuWc9I4mzi8Mo1Y1fztnOoqYiJpbNnlqNU56XSqAi+oHsq4B
	MQHpSGwk/imH99WmvreOKuCq6aBuhe18FqHi4UtYxfxROgV7dFvlwFAdkWu9g2wWZpxA4CmNax1cU
	DLGLIMVrwdY/2nLPl0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyG7E-00AVXf-FT; Thu, 24 Nov 2022 17:34:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyG7B-00AVUd-QC
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 17:34:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id b12so3429425wrn.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 09:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4XcU9QM1ckQIRe8QVhZPdinZjsfGER7s7lyyPku7DYQ=;
        b=R1b3oSBO1JQM5LWUbXVCjlamk8u5bPM5JN3ayETkQT+gate4ffVmiBGlW84XSnwPk/
         b0XbSiqw+PMQe3qXaMcBSFpSViggoHXm0b6BP+faSQXldVowV3WTZYjG2sCyfuSx3Ist
         QZ6NwCs090UekQs7cZy5A9064ozKwMTb2EHafIvYWnXT+mSemqxEX/EqKvgYlXV+ELp/
         kUodW+WY43ZZh1x48XR40d3KZHDW0KgRQ1nKrd5/tJzYA/BiGN9JtD7007zaCPZOYVpJ
         yMPPSTuqCMdelktj1zwIboW5EHbi2b6Im+FpTsFU3o7VJuIqZMTwyTgfHb7bG/AIqBfs
         vH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XcU9QM1ckQIRe8QVhZPdinZjsfGER7s7lyyPku7DYQ=;
        b=z89FPiaK6NtxUipDU4hGKydxc/zkb1wJsJzgl6D349uuNp6iSqK78sfVK5FAFuVXZs
         QcMl+K7X9mF/EIx/JIXjlbtP9rN13W7I0FWc0baY93GpQ+0sQ+5BYRyzdG5UJLUdrP7A
         rXrQOcQS25OOzsgkzaXVWsur3H8YgedlVmWtbpIwtcuPmH6WdJ10HqK2ykPhQaxemuZu
         PNBmQK6mE4Jk5jLvrtmGdAh2qtq8yPsLU3McTQwn0Im8psHloCAV1u5mBmE8gmc80dGT
         pIV8qT6ZQn/YF+VOZesbkOEuedzRomG1cpwD5zKxuadsmqpM7MtHLelpjLo3LL8poOG4
         xTjA==
X-Gm-Message-State: ANoB5pnxvyvRTX7wflbL995bKMqau8mFRL7+50FkERXj3dHSODhIdizW
	h6E4FHgh5ko+uiu/ULGqxJpppQ==
X-Google-Smtp-Source: AA0mqf59SeeMbBnb9HJBK2F4/46LuJC45dS0pyoVhoePMQNWhplXAcRq5kUENsm8AZLBjko11x/Www==
X-Received: by 2002:adf:fd01:0:b0:235:83aa:a6ed with SMTP id e1-20020adffd01000000b0023583aaa6edmr19825861wrr.543.1669311257016;
        Thu, 24 Nov 2022 09:34:17 -0800 (PST)
Received: from vermeer ([145.224.92.100])
        by smtp.gmail.com with ESMTPSA id j2-20020a5d6e42000000b0024194bba380sm1869088wrz.22.2022.11.24.09.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:34:16 -0800 (PST)
Date: Thu, 24 Nov 2022 18:34:11 +0100
From: Samuel Ortiz <sameo@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
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
Message-ID: <Y3+rE6j/CzTpINi+@vermeer>
References: <YqYz+xDsXr/tNaNu@Sun>
 <YqY0i22SdbHjB/MX@Sun>
 <Y385rS/5zDaDJ3Os@vermeer>
 <Y39AXYPFzSiBngwI@wendy>
 <Y39Lwp4rQc3Qkl0i@vermeer>
 <Y39blUaC/jHiOYCk@wendy>
 <Y3+mBAV8oxphjHcJ@vermeer>
 <c9ae9644-5cd0-29c2-a25c-bb497dfcb1c8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9ae9644-5cd0-29c2-a25c-bb497dfcb1c8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_093421_868449_F22C1A48 
X-CRM114-Status: GOOD (  23.41  )
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

On Thu, Nov 24, 2022 at 05:20:37PM +0000, Conor Dooley wrote:
> On 24/11/2022 17:12, Samuel Ortiz wrote:
> > [You don't often get email from sameo@rivosinc.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Thu, Nov 24, 2022 at 11:55:01AM +0000, Conor Dooley wrote:
> >> On Thu, Nov 24, 2022 at 11:47:30AM +0100, Samuel Ortiz wrote:
> >>
> >>> Patch #1 is definitely needed regardless of which interface we pick for
> >>> exposing the ISA strings to userspace.
> >>
> >> I took another look at #1, and I feel more confused about what
> >> constitutes canonical order than I did before! If you know better than
> >> I, and you probably do since you're interested in these 6 month old
> >> patches, some insight would be appreciated!
> > 
> > Assuming we don't go with hwcap, I dont think the order of the
> > riscv_isa_ext_id enum matters that much?
> 
> The chief put it in canonical order so that's good enough for me!
> 
> > 
> > iiuc we're building the cpuinfo string from the riscv_isa_ext_data
> > array, and I think the current code is incorrect:
> > 
> > static struct riscv_isa_ext_data isa_ext_arr[] = {
> >     __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> >     __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> >     __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> >     __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >     __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >     __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >     __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> > };
> > 
> > zicbom and zihintpause should come before supervisor level extensions.
> > I'm going to send a patch for that.
> 
> idk, Palmer explicitly re-ordered this:
> https://lore.kernel.org/linux-riscv/20220920204518.10988-1-palmer@rivosinc.com/
> 
> By my reading of the isa manual, what Palmer did is correct as
> those are not "Additional Standard Extensions". /shrug

Hmm, by their name (Z[a-b]+) they are Additional Standard Extensions.
What am I missing?

Cheers,
Samuel.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
