Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEFCC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 02:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRqyzUWbLBuxQ16E3vT9W7GLPfvraA3oOfXq7tAfWuk=; b=tF1V2Y2OczDVIW
	C7+Xd6bHCJrZYodxVJy2qYI9KGGfq8l+L2z5oLOsuhdQOeDBj11B6aIVni/e7dwlKx9RxFaEkNHFI
	h4/W71G89VkLgvwoj1BcjnpCm04tsz1ZwqBjoTOc/pUdWUpY4zk77Gd8xMQcMvOQVQGq/1KytLGmi
	rWA6Y9VDvshJnvMOYOis44ipdh2OtIk30RycOBvvAGI6vPQPTPD2S3IZ3ubyibA8bFehW6HO2VaL/
	gqpinHuHno4iazj3fBkWJRaQazKLtShP2L0Xo8m9DoGRJ51jcizcd9V6O+Kn81YfaFa1fan1GDlpw
	KtP3660wOpzznWTLUbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy1i3-003ioI-NF; Thu, 24 Nov 2022 02:11:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy1i0-003imn-O1
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 02:11:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 270C3B8255B
	for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F2EC43145
	for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669255881;
	bh=aWddWUx0AZ/iMRswl/0aJwc4jU1YZ8q4N7G5Olz8gEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S4xD2m5JrTTjrTdGB6OufjM9XBq7qn/3lBTvfG3yofNOlwL8lnYzlFvbqJ2Hj2Nvl
	 XEOHQLniFly5xkxC2gEHiIdgyEuk3C747UaRB9vPlFD73ompgIssfUQ+/Q6SbreRVK
	 eolI6M4JPbk9A/pNO6anI+Ecm8GpaJzPD1c+FLojThH+YVzICFhkVWiSsJiLxboNfh
	 kIO43vwKFgQQBVEIHikQxb2zjGXMM7xWHxSP5FsEAYM6YjqVLfj0KYVsCwHMORK9Jn
	 PFeLqFVcOSK+WDCP8iMMM0gb9RLGznyp/JvUQTRUZh6g6lMuRpOo2UbSxvwcHRJHQ2
	 pFIcshfXjrGrg==
Received: by mail-ej1-f52.google.com with SMTP id ud5so1165225ejc.4
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 18:11:21 -0800 (PST)
X-Gm-Message-State: ANoB5pmkofXfFVg/b0570+N9VV9G3OCqu0JYbFCT34paUdbgX1hpdES7
	2ASKBp23EwOmXxfhDeBjY3XYWC1eezeV/2NIekU=
X-Google-Smtp-Source: AA0mqf5HyUyBtc97QMSmbkfZYL/PjOOZssuhtU70mcua2SSk0jy0TtUGzulL3B4h0bIny8vcZtw/J1eS7m19LkKkuUw=
X-Received: by 2002:a17:906:6a8e:b0:78d:a136:7332 with SMTP id
 p14-20020a1709066a8e00b0078da1367332mr25742071ejr.355.1669255880060; Wed, 23
 Nov 2022 18:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20221123153950.2911981-1-guoren@kernel.org> <20221123153950.2911981-4-guoren@kernel.org>
 <Y35783GmAtJ+JuGW@spud>
In-Reply-To: <Y35783GmAtJ+JuGW@spud>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 24 Nov 2022 10:11:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ1mpa3a9s4T-Q52Z6tugp0jMN4utdrT77ibXv3b52bQw@mail.gmail.com>
Message-ID: <CAJF2gTQ1mpa3a9s4T-Q52Z6tugp0jMN4utdrT77ibXv3b52bQw@mail.gmail.com>
Subject: Re: [PATCH V3 3/5] riscv: ftrace: Reduce the detour code size to half
To: Conor Dooley <conor@kernel.org>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org, 
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	suagrfillet@gmail.com, andy.chiu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_181124_960363_0F335795 
X-CRM114-Status: GOOD (  15.17  )
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

On Thu, Nov 24, 2022 at 4:00 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Nov 23, 2022 at 10:39:48AM -0500, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Use a temporary register to reduce the size of detour code from
> > 16 bytes to 8 bytes. The previous implementation is from
> > afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of
> > MCOUNT").
> >
> > Before the patch:
> > <func_prolog>:
> >  0: REG_S  ra, -SZREG(sp)
> >  4: auipc  ra, ?
> >  8: jalr   ?(ra)
> > 12: REG_L  ra, -SZREG(sp)
> >  (func_boddy)
> >
> > After the patch:
> > <func_prolog>:
> >  0: auipc  t0, ?
> >  4: jalr   t0, ?(t0)
> >  (func_boddy)
> >
> > Link: https://lore.kernel.org/linux-riscv/20221122075440.1165172-1-suagrfillet@gmail.com/
> > Co-developed-by: Song Shuai <suagrfillet@gmail.com>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
>
> FYI missing a sign-off from Song Shuai. They were happy with you folding
> their patch in during the discussion linked above - so I suppose that is
> an accidental omission?
My fault, I missed that.

>
> Thanks,
> Conor.
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
