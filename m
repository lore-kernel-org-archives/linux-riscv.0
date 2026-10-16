Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70E2CCF2C3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 21:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+TUvv6OPoaqD+wJZVTstTQ9FRQFoD8tJCeolXW9yGuo=; b=ma0ffCyDc84izp
	XBV6EfxoWTN3UxtyBp0EA6sLedf1BP59MnE2hF7okIwfbptZ/6bpo+/eMl0bOhSVE5xDZtuza7EJc
	CKKKTGo42OJO+O2xUTBgrlvsUmCEnp4sD/GrplgZ9Unmha1UgGBuBoAsDoaWDMASAx/Ql2+7R6pE7
	bqpEI/cPfwwUzXqvm364sI/N6Z5ynSZQpT13RYGSMOKF3H1REd3+r/9B6r18+1hKsPSuPgdZQIE3B
	PODKzsNoWlN1bTp2Y16Wp2eLXCvhrH9PbO3goEH18jtwy++ro6dSKuW2Ah+0fPsgHq+U0KM7EARHC
	za3+dMV7ZniLwHT4iHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHptS-000000048Ky-2iYY;
	Fri, 16 Oct 2026 21:55:14 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHptQ-000000048KL-1iaN
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 21:55:13 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6756a01fa01so492029d50.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 14:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792187711; x=1792792511; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRdKsMnoUYDjl4OXqzoURv6V5579I0uPGZbnGd93awc=;
        b=HsGC2KB+OwbPRW5iHJJSPMvZqZfNaOCjTkjCYwPESio74ZXgtDA2orQ08lkyXjgrck
         Sx6d9MRG5vPps/PmOoWbM+bPtzV1NVKqAW4ZFNuGRQJNnU2ivwn/cf38OiNvwCzQ4mJr
         ZE8acFIq8VkupSZe2iZIC4HMer5HRsHsVJ2dJAQwohMy0CFgMsQWCDQZGCNNEv7tceKP
         SWBpVQlPGO57C/hz4Hg1VnE6RCWkZ3OWVh2AAzlNm/J2fQCA0MZXpI/dku4VqvfmQtMc
         N3/X5BddjNJjAnaN6XCGJsvk/eyR+uWw0zsV9NXfypp3hTho64rrqqeRj7tyjXwEibME
         inew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792187711; x=1792792511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kRdKsMnoUYDjl4OXqzoURv6V5579I0uPGZbnGd93awc=;
        b=xKSbEITO9xpjNKvD8/FN6d6MClHzFu/bBSfUQhSHSd24sz6vGHV46CDZPziN3O28ea
         v4GBBTSD/GxTRWvr1KxZgF7CaYnW1dctkrUXQhjazvqfWUN5aYEDpIMPNuMCA9g6dkNV
         NVP46obZ/6Ts16+XrFVe7SdJCfzG4TSnHuv3innzNWzcC2RFzPvYRE4wYMXRtQDoVMh2
         23Lsc1uPRoL0xWAPQSy3Me4dpC5uUyoh1YFM4Z72Suy1Vbh9kaqbsnKPkyS86bGlSmad
         KgSVlfkry6xEvHIgLXD9deYNRjjTNLt3fCKJpqLlifTY9cbkguXjnOcaDdmt6T/ZTOmq
         BVjA==
X-Gm-Message-State: AFq9FYJXoz8f+qh7Jv4brYwonabXZZmL2tg4heu8xUdDbP8IiZ3kC9ft
	amwaTAjG5mJXHXbidcO/QXs1MmN11A6eieneczOcJTKZBfTfA8c0ZeYLqm60yhe9bpU=
X-Gm-Gg: AYBFou2PeegslqbLxc8kGP34NOvHgxKaZSv7MxVwXJRRlI2mljmrNxUSuA+XUGjiBsL
	S7z1mNWYcZ9zs1DiuqjE90NFUSNsZzSbOs7Nmi4bnnU8M5ejKRsuqDh22aU922HlpiQSXI8UVnX
	j5rlfkoJ3Vjgf6ez65r9Nn7ozJlr7Z30PhL3nXxV4pmckFhIdLP6pFeBsCn7fNF9IjtAI2quCrd
	r1x93ffPars1d7thCB/xkUX9GX7asR3qj8sE3DZoPHVoGlmtoT4+ap9LpS7a09SkCi8AVMlR5yo
	Wp8WPvYdVbQSiyoxHbPJxfbfvXmkVhuOcQvQHES2QWfwPpK11tw3arwNq4xVD6QVF8GRXlcdSf/
	64xQtIBhJ+2IZp0x6+++x5W6LTBGiwNzTz5YVrSD5VPKfz/nhUJFywkZK3b9RlaAC0ig6hpJOdl
	/sHW+k4RpMrgqE1EEq8e4Nbg3GwuZCC+ae+qt2/89XfRbwjeCZMf1YViFeg02Uvj19L2tsDPyT3
	yRvirj/3UHkAw/+uQ4W
X-Received: by 2002:a05:690e:bc6:b0:679:980d:9968 with SMTP id 956f58d0204a3-679ca7f7235mr217435d50.60.1792187711142;
        Fri, 16 Oct 2026 14:55:11 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1f29ddfsm1626136d50.23.2026.10.16.14.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:55:10 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:55:09 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 6/6] riscv: hwprobe: Report SiFive vector extensions only
 when available
Message-ID: <atKdPZFu0j86WtTS@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-7-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006075303.205216-7-radim.krcmar@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_145512_451576_3F7BD373 
X-CRM114-Status: UNSURE (   8.42  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 06, 2026 at 09:53:03AM +0200, Radim Krcm=E1r wrote:
> User-mode use of the SiFive vector extensions requires non-Off
> sstatus.VS, which we set only when has_vector() (CONFIG_RISCV_ISA_V and
> Zve32x on all harts).  Xsfvfnrclipxfqf and Xsfvfwmaccqqq also execute
> floating-point instructions, which additionally require non-Off
> sstatus.FS and hence has_fpu().  hwprobe reports the extensions from the
> per-hart vendor ISA bitmaps alone, so it can advertise extensions that
> are always disabled in user-mode.
> =

> Report correct environment to user-mode.
> =

> Fixes: 1a6274f03534 ("riscv: hwprobe: Add SiFive vendor extension support=
 and probe for xsfqmaccdod and xsfqmaccqoq")
> Fixes: 1d91224394c9 ("riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor e=
xtension")
> Fixes: d9669e33c8fa ("riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor ext=
ension")
> Signed-off-by: Radim Krcm=E1r <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
