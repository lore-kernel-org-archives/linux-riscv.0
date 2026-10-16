Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7DBCCF2C3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 21:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eoDdGE2hQcd37o7R2j9HZ6X5sX0SY3VMMfqpkYnPOnU=; b=QtmbipcLbwSv7M
	Bs3seCoO99fw9hgMSN6EHxaDkWPFAYr7ep013/Lh2Li2Tmq9y/FtC3SQfY5u8NXvMG0U+WmoQDA43
	Ehl2Z6i8Ywpfs74zBwVzZYj3u7zqwZsMJTXqMaqlzlabxUtp8ciGEKyo2J/Jqzwrw0xr/FwP3jNOa
	D0GWCrMaudutI9lSYr7AN+dcjVm+cCoCRcw2JiSLkLaMMVYqXTB2SxKuCXp+bBwFFDO3RndaZFvUZ
	aygMLWEz9T2k+uC7p6zp1gcP1C+dZRsjdqNE2XJvlxF04AI/6U2RhlbtOIAWZ5bF3CtmpLFJRzH5B
	LhPfzCvcLQRWiINejtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpB5-000000043hZ-3FS6;
	Fri, 16 Oct 2026 21:09:23 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpB2-000000043gi-02H7
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 21:09:21 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6790844c9b0so324855d50.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792184959; x=1792789759; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3kcaABY1wxvfGcJvUlVBxGbnL2EPcgOQ7tPDx9WCKSU=;
        b=HksApDXgThs1dyBUPEsQTQuzkov4zGYFS84dKut1NfAOyonJSHAwVIQMj3pPabhcb1
         AJwsa3NRwdEfRyejcvH5ihHLMEUkqAbHjNNZygY5In4CSCzakm4pZWy/dtVAmV9ghhLb
         lzutDTmKl2kFE5+4DBXUuv8USUmb0xsr27N2O0I+wOKuo7O/ddTGAjEyBzmU3ZoVrZg/
         beYbhqeSAWt+1zjVpKVlOOf1+0loIxA4SshVKsAOxUte/kzEpFOmcEdznvfpYkBoZK5j
         OOnHdhNVX8ySnNcSihQuhEVZ+voj32wHcW3arOA2M49sfS8BEQHqghrlKuPEoxfpp47a
         DxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184959; x=1792789759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3kcaABY1wxvfGcJvUlVBxGbnL2EPcgOQ7tPDx9WCKSU=;
        b=f8W5pQLL15J3bku9tBpD8LgMoXw5xoMD0YF/wIFwpIQZPzB4s74Ei/rWE9nDUZIL7S
         Lj9v8cus6P3durATHruq6Bag2x3s9W0Ws6Sp7mUw94fpdxWPkurvj1H+h8mJI4WMNSEV
         h1OE5LvJzUctrzTAiLN4bdrdS6NJnsOEr2uKLQ9WJC6f/g6F88gG7IJQe2STe6NXSsU4
         ftGW4Zv5ajz+V3JQje0Lv/66J5zB9f/jUdfnOqmseUdNl7eQIRi3hwsrLIhBOyEVEmga
         2cwsr1FsS7hOPZ5q7iQ4fXL06gopAmOO8zfD/VQJP4Edug44d6vkPZnN7wbg6TsViRlP
         M6vA==
X-Gm-Message-State: AFq9FYJnG8yjeG7eBpaJHoL8B3e+4qO9L0EgQvWDnK1SfWOkqTPzxjrU
	TYz1yxm0HQSpTLncWF/9kJWDqkDnjImVzVtNyZy6hq4FC1/xlPRmT6v4d3b8t8vxaksMr3Xv9mr
	Zr8eNXDI=
X-Gm-Gg: AYBFou2U15We/ZWCIyRGqSJTLkjrMFS47/j6I5y5xShRE5AVlLF7Wa5I0mKxigCUO94
	aD8SCWQYQEM4JurGSL0Y9xErdU7gEzMbUYeH4f1EaXmZUBNI7JOOSFOjT7MKlEsobeo2XGIaEOR
	+C88QqWIFY7qWKV4MyBamBn1nnnGCPowPma8lVlUDqDp9MH/9FhkHbNyObOvwLxvBGKBqxvCcom
	qepp9fFXh/Jpi76k4WCQE6QSpoHmYF821XQU5Lya0fasQx9NaxIF0vqmtFeAxXC7Y6WfUO8dK4V
	+usKcTwwHcta553NZ+hVaUN2zF+j0xZGlEF8ankI7UoAQRd4nT28yT+6vKcRYGF1Dz6y5jlEyfi
	cYcxG6yJvAG+QIH3DtG7Vf4LfVoXCZmGGLkcymc46bbZEMM+QZ4kUNr52PmDeY9sjE1r2lVyI0H
	c/phe5a51nOSTGze182XyQ1sLjmepM6wg/65/oRBDA9K7VP8GA+uDqchCuxY2b98kjkgpfz7j4g
	sJoLiUogLUv0RDBjnGU
X-Received: by 2002:a05:690e:191a:b0:679:ba28:1272 with SMTP id 956f58d0204a3-679ca7b9b4cmr284821d50.41.1792184958919;
        Fri, 16 Oct 2026 14:09:18 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1e11207sm1547350d50.8.2026.10.16.14.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:09:18 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:09:17 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 3/6] riscv: hwprobe: Report Zicfilp and Zicfiss only when
 available
Message-ID: <atKSfUS8rRW3mHyw@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_140920_050544_78ABECFB 
X-CRM114-Status: GOOD (  10.51  )
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

On Tue, Oct 06, 2026 at 09:53:00AM +0200, Radim Krcm=E1r wrote:
> User-mode use of Zicfilp and Zicfiss requires senvcfg.LPE and
> senvcfg.SSE, respectively, which we set only when is_user_lpad_enabled()
> and is_user_shstk_enabled() (CONFIG_RISCV_USER_CFI, the extension on all
> harts, and not disabled by riscv_nousercfi).  hwprobe reports the
> extensions from the per-hart ISA bitmaps alone, so it can advertise
> extensions that are always disabled in user-mode.
> =

> Report correct environment to user-mode.
> =

> The changes to arch/riscv/include/asm/usercfi.h avoid
> IS_ENABLED(CONFIG_RISCV_USER_CFI) guards in the conditions.
> =

> Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in=
 hwprobe")
> Signed-off-by: Radim Krcm=E1r <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
