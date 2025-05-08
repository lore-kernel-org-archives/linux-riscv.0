Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0E0C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GWYwJZw7QbjmtNKvIc1E9kVBai8/rfDJoJTDkCCdgjk=; b=ZBZ73DreDHPeaa49vRkS4ecJG/
	RvjxOEBjpyc8KGA935YT/VLluzE5h6N7JFHZnoKjIbJtYpJ/4Jgih/4u+C4ane0t0krTK4IALMgvk
	14oVwxesBgzJktpP1OZ259ePAq/VtstNvzIloukAqkRSCCeFPIBNC4lbHzKeOW9+s84l2VYvixd8z
	xkO8PzEsuIHMRXtoDauteL0aYWSInXdCneLNA57TBvDPXyGEMt7dqNuBpLJ8hOqhcHx+tC3MVOkla
	sE/X898nXG+R2ip6NAl3vrnRwEFpdDlHHdWGDtzVIawloqvQtNyBi48X5FgT+mZPrKqYbBhEgxVBb
	WOXAhlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD56Y-00000001QoR-3a0p;
	Thu, 08 May 2025 17:32:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD56W-00000001Qo1-0WAj
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 17:32:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22e033a3a07so15443495ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 10:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746725535; x=1747330335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPMbNxc43AcR45VhaO0+Mz0+fFeHkW9XaM5DPtDrlDo=;
        b=Nur5lDlDE9YPkeVVxfBYbMuRkhnMcAhz/y5yOZ/mZgC3OUWoTwwIwlVU0+O8pgFXg2
         vhSl05GSUIcJI1OkxHe79VPx18mQlBExp4onVxSY5ymevVezj9G7lxd2z8jioX+0mOME
         4kytC0qZrJv628msghJYJR60ljHHP3xwvVK+/S6JsFt2JhIY3Phq5dEaYHKgyYBGkJ2t
         E0n09b7AyV+hr7FTxwWXpm2vrofaZ5eBXnk4RcSkKaaeUQ64uPHsm6hg1chPOFxxlURG
         3sk52ten4AsZXp03YxW1prNRo7M7A05OjcS3ckbTs0DkuAnXWRdXyivYN/DKktSaKXBB
         zicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746725535; x=1747330335;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPMbNxc43AcR45VhaO0+Mz0+fFeHkW9XaM5DPtDrlDo=;
        b=dxfvc8O1ZkclC2hKRI/hSIKw4maUYYukD+wzBAhZnOMA0cdsdd0TZ2mxYtGfBe25wr
         queq4ZBu1M+ROOmq7ID7+Hrfn9gQ6rsIc2BkoyBDZkbrfEhh0ZTsuXqxttPMlJbxh1A0
         RuEFARrlYLUiIUhrl7B/PNT5+NwW87atDNk5CRu+FdPFqr1jsHEnea/wMW/mi39ViQ4q
         y4aH0NuvJWni1MNHpZHbAy0I31xz6IkBz3clTX4nVF50AsbBreuljmInes+KtKgkI5+F
         eRZxLZMwiatk7bYmD73k0lH3fn66dpyJIM2LENbpTzNgAaE7kiwkuWzCYZ4lJKYRxUB7
         n9Og==
X-Forwarded-Encrypted: i=1; AJvYcCU1KOZTuRLW6YiiqbtNvd2KkcEX/+mp2oOMG4R4km2I2YHnl5Pimj38bsR7A0/pb14ONCIrM2JqhRl/Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOn6rzbQOcJOHVHrZTYxvuRyFb51Y+IEE2czgTneG3Ra/d1UUr
	0JNDC/xAR+alujRURFRRMTcm6vP9O80k/CfZmBQHnVKcftcICqMLGqHOZoTuAO4=
X-Gm-Gg: ASbGncvKTdI6/OYgOpMAFC45wlyr3MLSSevcu185aU5UVsbGBk0clrBr7QtJxB+6952
	uvvWxb1wCVpu97tniZyvIGeYKD5xoFEEhn7kYfp75Z74rw4UlaXeUO4baXA0oWz6sIR9bWb1a3U
	8MVqIN0oQCsdm0Q/TywXbBdtBkcezint2N7TFZkmOMP7iSxyrU+tLg5p585UWweXL/9DuaozIcc
	DkGBPHy6gk61+87rOajCUs2RezdZSsbqoPzSzFRo6mbRUAhQXMrT6OewH4c66NxOaWa3iL+4Bi5
	voVe5LdixvIfjuum1CxdTSvr6e9ViE2rzA==
X-Google-Smtp-Source: AGHT+IE9VgVPP9dUNk5nU36GZVaBczxNclok26A18Dg0EZaOSiwRtsNDoM6n6nUdbHkW7QysWWdeDA==
X-Received: by 2002:a17:902:dacd:b0:22e:566f:bca7 with SMTP id d9443c01a7336-22fc8b5192fmr2750915ad.17.1746725535067;
        Thu, 08 May 2025 10:32:15 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82c3063sm1796455ad.244.2025.05.08.10.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:32:14 -0700 (PDT)
Date: Thu, 08 May 2025 10:32:14 -0700 (PDT)
X-Google-Original-Date: Thu, 08 May 2025 10:32:12 PDT (-0700)
Subject: Re: [PATCH v4 0/2] Implement endianess swap macros for RISC-V
In-Reply-To: <20250426-riscv-swab-v4-0-64201404a68c@iencinas.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, alex@ghiti.fr, ebiggers@kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
  skhan@linuxfoundation.org, zhihang.shao.iscas@gmail.com, bjorn@kernel.org, linux-arch@vger.kernel.org,
  ignacio@iencinas.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ignacio@iencinas.com, Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-3695679f-b501-42f4-95e0-69457773b787@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_103216_160022_1C591324 
X-CRM114-Status: GOOD (  22.41  )
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

On Sat, 26 Apr 2025 07:56:17 PDT (-0700), ignacio@iencinas.com wrote:
> Motivated by [1]. A couple of things to note:
>
> RISC-V needs a default implementation to fall back on. There is one
> available in include/uapi/linux/swab.h but that header can't be included
> from arch/riscv/include/asm/swab.h. Therefore, the first patch in this
> series moves the default implementation into asm-generic.

This seems fine to me, so 

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

It's asm-generic, though, so I usually try to wait for a review from 
Arnd for those.

> Tested with crc_kunit as pointed out here [2]. I can't provide
> performance numbers as I don't have RISC-V hardware yet.
>
> [1] https://lore.kernel.org/all/20250302220426.GC2079@quark.localdomain/
> [2] https://lore.kernel.org/all/20250216225530.306980-1-ebiggers@kernel.org/
>
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
> Changes in v4:
>
> - Add missing include in the 1st patch, reported by
>   https://lore.kernel.org/all/202504042300.it9RcOSt-lkp@intel.com/
> - Rewrite the ARCH_SWAB macro as suggested by Arnd
> - Define __arch_swab64 for CONFIG_32BIT (Ben)
> - Link to v3: https://lore.kernel.org/r/20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com
>
> Arnd, I know you don't like Patch 1 but I tried your suggestions and
> couldn't make them work. Please let me know if I missed anything [3] [4]
>
> [3] https://lore.kernel.org/linux-riscv/f5464e26-faa0-48f1-8585-9ce52c8c9f5f@iencinas.com/
> [4] https://lore.kernel.org/linux-riscv/b3b59747-0484-4042-bdc4-c067688e3bfe@iencinas.com/
>
> Changes in v3:
>
> PATCH 2:
>   Use if(riscv_has_extension_likely) instead of asm goto (Eric). It
>   looks like both versions generate the same assembly. Perhaps we should
>   do the same change in other places such as arch/riscv/include/asm/bitops.h
> - Link to v2: https://lore.kernel.org/r/20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com
>
> Changes in v2:
> - Introduce first patch factoring out the default implementation into
>   asm-generic
> - Remove blank line to make checkpatch happy
> - Link to v1: https://lore.kernel.org/r/20250310-riscv-swab-v1-1-34652ef1ee96@iencinas.com
>
> ---
> Ignacio Encinas (2):
>       include/uapi/linux/swab.h: move default implementation for swab macros into asm-generic
>       riscv: introduce asm/swab.h
>
>  arch/riscv/include/asm/swab.h   | 62 +++++++++++++++++++++++++++++++++++++++++
>  include/uapi/asm-generic/swab.h | 33 ++++++++++++++++++++++
>  include/uapi/linux/swab.h       | 33 +---------------------
>  3 files changed, 96 insertions(+), 32 deletions(-)
> ---
> base-commit: a7f2e10ecd8f18b83951b0bab47ddaf48f93bf47
> change-id: 20250307-riscv-swab-b81b94a9ac1b
>
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
