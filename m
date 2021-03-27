Return-Path: <SRS0=+x6g=IZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AADC433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 21:25:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9ED861945
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 21:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9ED861945
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A7tc3vkcISQF+i8srT357blOrtiHTovKU/hk+7RyJXE=; b=DIEbNZIPf07vMIBQWyLqmYyzD
	3+M3J/6brru4cX60PM0bJ9VpMlmbpOEqyOPt0krQJ75hAHp1jzULI9z2FUWp8fZ2fgMOqWq/1RJIw
	uoUAToABs0WbxPZmscivl6sTzMgUQNYxwo1k/j89knT2nigjoAf5ZqZQ2QM8HTotGicYPeAlG/bqo
	E9rvIJ4FyT6PU8Z1fwGs0Bbe5C5l0ePlOnpKrzaKQqqEA5sMVU49RSpIKN4uORtxRzMAtAvHgZAUc
	mJCq7eRiHtWxvZVW4xiL+37U9mdOCFF4AoSM5PIZFl/phcO4ueEpXWxWILtwIAvE0+iyBfS+QKuSJ
	p4ogFLogA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQGR9-005Xun-8r; Sat, 27 Mar 2021 21:25:39 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQGR1-005Xtz-5C
 for linux-riscv@lists.infradead.org; Sat, 27 Mar 2021 21:25:33 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MDQmW-1lXNiY3TWA-00AUZ1 for <linux-riscv@lists.infradead.org>; Sat, 27
 Mar 2021 22:25:29 +0100
Received: by mail-ot1-f44.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so8647241otn.1
 for <linux-riscv@lists.infradead.org>; Sat, 27 Mar 2021 14:25:28 -0700 (PDT)
X-Gm-Message-State: AOAM533VfHd0rLDbxOBCZAD7PO/U2/wj/pE1XhmUl/H2KxH5W4CKPXxy
 3DK/pW3K/kF2WUWYa92DCmqjZ5WjVPXsVy61A4g=
X-Google-Smtp-Source: ABdhPJy4CJI13L5GI975TAxtN4pti2VMXOxlXdOQo1NAx9KR+JA78towyxq+aLKG36YpX7GoRqVGNCLpoFxBUatRMqE=
X-Received: by 2002:a9d:316:: with SMTP id 22mr17117443otv.210.1616880327372; 
 Sat, 27 Mar 2021 14:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-3-git-send-email-guoren@kernel.org>
In-Reply-To: <1616868399-82848-3-git-send-email-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 27 Mar 2021 22:25:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0FG3cpqBNUP7kXj3713cMUqV1WcEh-vcRnGKM00WXqxw@mail.gmail.com>
Message-ID: <CAK8P3a0FG3cpqBNUP7kXj3713cMUqV1WcEh-vcRnGKM00WXqxw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] riscv: cmpxchg.h: Merge macros
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Peter Zijlstra <peterz@infradead.org>, Michael Clark <michaeljclark@mac.com>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-Provags-ID: V03:K1:2AnngicvtUh0FWP57mcVxBwWO2tg4y4JkegPAR4ht2CCa0GG+Ng
 voRsEx7r0yBDggKvE7OUl9O4qEhkyh7JdNt2VVxntCyftALP2v/ktXejZDFPORztIo2pC1m
 yRbuPwcfxdjx2pCxHvHE/j0QQH4Qg98Xw5ijs6Hkk4puPTzMRZ6ZItQBbvhhqVGVQn9LVHR
 2GbUR63nDrEGcH583VR+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cSUq6VAGxj8=:vwu4Jt3oxR/6/48D8BsKZd
 y8R0XXDhGT12fk/lZfj5P5BZYRl3LV1jg347TalyeQtSiDuaICPCU/CzhIb6RtVZPKbl/kDzG
 bGtaFpGIM5fwpthAXWL+g9X14mn1JxpI4YQP+KVPv4Fh96IytipLFvpe9FuSHL0tLSLdryRY5
 PsQT09Q97KGDWbbmcADER2Sz1SkYeTzsUulk6eAJ443tgaMwWwj3cCFoNLAHpK07dpceF/Bpc
 xjChm1c5SrCUhtczv2+h0GFbDxxrHmDsTm+JJ/wleaI1FqvsaJfccSxRc/r5c+paluZ0bQWPk
 CU2E1izlPi2scQkjlSgSfwofcXLbBxjj6Fl5YGqD8RNrncE9oTvbTIlvyD/l5T7WuzpeNKC0B
 1T2HOR6VVFx3KAxdaZcj/sWZrLA5k2uyu9Pl1JBlKz3lLX4eGCqOL7VIg6y8mDB9UHkFH6Qy4
 TADzGNmZzSm5Ip3S//7ElpMv4YtKghskjrAhY49BCwxT6nhDNstp/jRJuNyGeuuz6ebQHMy7S
 J4CKTQQcscOOkzkrKLg+50sO7V2aSsv70wgfTCRdsKGtGiEkxAGkvWVr/90cSE+ar2uiyo3f5
 jVDQZinfvKK78hUGNztnf1L17DzISlTFvi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_212531_334273_322E0420 
X-CRM114-Status: UNSURE (   8.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 27, 2021 at 7:06 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> To reduce assembly codes, let's merge duplicate codes into one
> (xchg_acquire, xchg_release, cmpxchg_release).
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>

This is a nice cleanup, but I wonder if you can go even further by using
the definitions from atomic-arch-fallback.h like arm64 and x86 do.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
