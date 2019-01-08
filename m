Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7551AC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 22:19:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44A2B20883
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 22:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ES85k3SE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbmmFUjh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44A2B20883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shoyvjsEyV9T5Glr+LkTd1qzmcgzPUEAfkX0A/bBEJM=; b=ES85k3SEeuM/Lg
	Qm/3jUJh+iPk7pActwtIHyD5oPgKmu9seyu/qC8+g0fsvixUSOI8vsVtFUZwMkrGB6Y1pOhU3HJjO
	oK2KTGW8bOkOFic/4pxGry/hojv2URZ5V2V6iTA5Ubnwe4p+ZTk7Ty2CoXDU/qT6F0IND3DLdbgxn
	iVj65Wcc6CW3PT52L3KWn6GsFCwZZ4IHlscP3pugSBHZqoFQ282TqchnY1+DoDgqCWr1mUwORwDzc
	IfuznBW1Y6dMgaW4qlB72hBqCUgIdWSUlVx9+ZSWaJdMhme2D/9eq3SS+xg/MSo7RcRR8koLtbkHu
	IUvD90qU4Xai7a5SGGjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggzik-0007Te-5M; Tue, 08 Jan 2019 22:19:38 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggzig-0007Sv-Dn
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 22:19:36 +0000
Received: by mail-pf1-x441.google.com with SMTP id i12so2595821pfo.7
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 14:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/O3sY8celNMvtR9WhIqaTjCanK7+dtn6FuJgraOR7Uw=;
 b=fbmmFUjh8COCYh5vjmZyvsTK03G99sIrzefroQ5j2Uu9CO9ADuBlP173v5pOy8mkv9
 ciWJf5mnLE1UPL7SQi4Yiags1nwwvcqUkSlMhsqptXAjFJMx6tZ01b5pPtOdHzspitut
 Vo597QJWW7ki/mitT1ERlnnvD4obEg0SxPk4+rLodY/MZ5FSEekGfjTcZVXqbE+1kSn+
 Cif7+1EG12rKvpIR+fR3PktyXs/SvTFO4h/5kk/jAXtAlDMGofTanPAFiKqfiZNGkVsY
 Bn5TvhtCbKZx5nVhnJGTdkzyaTR5pJyaBdmz/NAkWosY9WfgkLCGIPoPVvLQn59zi3+9
 vnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/O3sY8celNMvtR9WhIqaTjCanK7+dtn6FuJgraOR7Uw=;
 b=hEfGt//UAZ2LRcXF3T6IsvXaVBnGlZjl08sFU2gS0Lar1npCQRvIqYnf0HAWPvttaH
 xI7JMimjL5KJyiiSlFr2jJFa2UzdO6MNWDW4HvZ5UAo08tEYNRzIJXsIOUx+7WjQiP7m
 20bGc9flhb+p2/IYuzZtgLq/Fbb/MF/0OHtzWggsJ6nCzoww4h4yzC14uuBglaVLgAaQ
 pGF0bGqeVwRshrlhuxSJtw5rbHqeUnwKw+ZCnZhxDP1vPQ8dp883yVyRy0BepUrtH8O6
 qy5+rDc+h2biR1zX9kDRkNfICm20thfFAgniV+t2Wb2Vc0oL6ZMMlOFsdE1fNbdYdIrQ
 Asmg==
X-Gm-Message-State: AJcUukfVH1/cemxaDrx3VUMNryMxeGD9disX7uvC4UBjUx40s4YrUPu1
 T+QrVreizPcbvgTM8VtsXhI=
X-Google-Smtp-Source: ALg8bN722fGi+WjBj2KsQHVwIaf0ObT5Q3kuvGLXfLoHV5w7jFnlyoDS9iIt/nAZXcGQ99DTQT1vKg==
X-Received: by 2002:a62:2547:: with SMTP id l68mr3428061pfl.131.1546985973598; 
 Tue, 08 Jan 2019 14:19:33 -0800 (PST)
Received: from localhost (g206.124-44-15.ppp.wakwak.ne.jp. [124.44.15.206])
 by smtp.gmail.com with ESMTPSA id v184sm99160620pfb.182.2019.01.08.14.19.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Jan 2019 14:19:32 -0800 (PST)
Date: Wed, 9 Jan 2019 07:19:30 +0900
From: Stafford Horne <shorne@gmail.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] arch: unexport asm/shmparam.h for all architectures
Message-ID: <20190108221930.GQ3235@lianli.shorne-pla.net>
References: <1546904307-11124-1-git-send-email-yamada.masahiro@socionext.com>
 <20190108111032.GP3235@lianli.shorne-pla.net>
 <CAK7LNAS+grgqHM-ht0CCTmZHp+JRvr=Q+sJOo0URqRgTAYRs0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNAS+grgqHM-ht0CCTmZHp+JRvr=Q+sJOo0URqRgTAYRs0w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_141934_485643_B201BA15 
X-CRM114-Status: GOOD (  16.68  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, openrisc@lists.librecores.org,
 Greentime Hu <green.hu@gmail.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Kuo <rkuo@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 09, 2019 at 12:32:28AM +0900, Masahiro Yamada wrote:
> Hi Stafford,
> 
> 
> 
> On Tue, Jan 8, 2019 at 8:12 PM Stafford Horne <shorne@gmail.com> wrote:
> >
> > What is this patch based on?  I tried to apply it to 5.0-rc1 and am having an
> > issue with applying the arch/openrisc/include/uapi/asm/Kbuild part.
> 
> 
> Based on Linus' latest tree.
> (commit 3bd6e94be)
> 
> v5.0-rc1 is NOT the latest.

OK, understood, in that case:

Acked-by: Stafford Horne <shorne@gmail.com>

(though I see its already being picked up on the -mm tree)

> > It seems shmparam.h is not there. It was removed with the others in your
> > ("d6e4b3e326d8") arch: remove redundant UAPI generic-y defines, commit a few
> > days ago.
> >
> > Note, I can't compile 5.0-rc1 without the first part of this patch.  So please
> > get it merged asap :)
> 
> 
> I notice the breakage of several arches after v5.0-rc1 release,
> so I asked Linus to pick up 3d6e94be.
> 
> I had already noticed
> having shmparam.h in uapi is werid,
> but I decided to fix the build errors first.

Yes, that makes sense.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
