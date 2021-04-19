Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44276C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 11:46:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53CF61166
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 11:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53CF61166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J7/x3SIS9tlb/assT7H0OKkDIf8c8gGteCc5QJVyTzM=; b=OYKY+VRHzQ1O1UHG0OhqqMNdb
	X1+CNd0W0Ey12Ejxy0lsAKDnGeeYbEEl1qkc92rC+5VO54FD4l00xxcYWtyMu8mcpjQSQI/My6b3I
	3W+S6CTn2KzmhI0oxnN7BiWtKLA4DxPRyZYU2fyjY8ViF5ULb7k3dOL35NyNCiRGx9+ANEOV3GkWA
	BbdIcAYt6ZbNJDltezzpecIxLt8+YAwnFoMnThgqhjANO+sfRWcK9WiiEtwo9iLEFOuR4i0L9ktQl
	UlBC2aJ25hjMtyr4ef1CMRtZa0jYvFl6/1TknNw1r/JbVXGnOVJOmOGfwEs42AX0RsGomxMOCPxG+
	3QyCbnr6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYSLv-009o2X-EE; Mon, 19 Apr 2021 11:46:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSLt-009o27-7n
 for linux-riscv@desiato.infradead.org; Mon, 19 Apr 2021 11:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ewH82IJ5uehnNj6iaJBql5yz2oeZXGgI9E9Y6R7X5og=; b=0mgo80kr4oc/OfObvELKCE07ZB
 UnHFxfvaXKedeaEgBVdEEtagQ3vi7sLfHcniSETOcA49Hkkc6VzCVzw+0+29t/A1Yj51ppzB0CgOC
 ofcdIdyrhKx/PGfZH6uu/awmWeV5hPCk88sAJkZSmoGDoj1ethlGhcc0m2VhvFpKuewK7975Leb1v
 WlZqWBi3tSq6Sb+CCB7Bjnqq9nx0cYIiiHGK8bFsDTp1TtrEQtmFdPK9KeHnG6mEJO5QgwVPzCs0y
 fIPAp3cFLnXXpHbbQrRVyc5pUeKOEjwzqSWxcM+zKa8kQPbKsnG9AcoczM08BNVaqkJgjw6rk20qX
 dGc1WCkA==;
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSLm-00BJrz-DV
 for linux-riscv@lists.infradead.org; Mon, 19 Apr 2021 11:46:04 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MMFdY-1lGEi70XW2-00JLcU for <linux-riscv@lists.infradead.org>; Mon, 19
 Apr 2021 13:45:53 +0200
Received: by mail-wr1-f46.google.com with SMTP id e7so24710719wrs.11
 for <linux-riscv@lists.infradead.org>; Mon, 19 Apr 2021 04:45:52 -0700 (PDT)
X-Gm-Message-State: AOAM530vwGVD7+Wb+IWNAve5KCrFCQ8P2pD+54LlyKbF91gJOEy8S4GR
 aiiQ9Fu0XteU5IXT62uw2LjAIeiw4mtpl67Syxw=
X-Google-Smtp-Source: ABdhPJwEqpvEXhMjLLqp97csmcwNcY1rK/VijtLf0UEkkA3KI3NlkzigrzsU6Qsva0ZTIp6OfFYbsu+GilDGIMNVtJQ=
X-Received: by 2002:adf:db4f:: with SMTP id f15mr14108786wrj.99.1618832752710; 
 Mon, 19 Apr 2021 04:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <1618634729-88821-1-git-send-email-guoren@kernel.org>
 <1618634729-88821-2-git-send-email-guoren@kernel.org>
In-Reply-To: <1618634729-88821-2-git-send-email-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Apr 2021 13:45:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ygwS7jTXqYXCfppEEonCASqG_5GM9O_AtE9YgdgNqVQ@mail.gmail.com>
Message-ID: <CAK8P3a1ygwS7jTXqYXCfppEEonCASqG_5GM9O_AtE9YgdgNqVQ@mail.gmail.com>
Subject: Re: [PATCH v2 (RESEND) 2/2] riscv: atomic: Using ARCH_ATOMIC in
 asm/atomic.h
To: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-Provags-ID: V03:K1:eJrhy71BHDiT523ImJlfNecXR8FG5ghoNeuAFbf5ha2UkuBQ7Gk
 7pTNvQvT1WjdnNgq3dwAbSUvQ4n4JW+RqfLtI1zAWAVN1dmq4rqnS0vDlB6pk2x2VXuiAys
 NaRRrjq94GBOWZ6VIpcC7rnWF4IByTk7yGWncZl6k/uHG7UFrhoFiOIhSs/gQY6EJ3fjz5J
 u4Ghg+Uq9eF0MSfOCKptw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mqQOrmq3yCM=:gCk3ToYQuLnAt530h5VeZO
 8OAsm4eKXjtlnKjDNqhQiIDK15GHMPMTixJoBpYIgXi7sLolB3k+K66+5gGqbNBxt0pBouFAj
 TjZP2M6fw+N09/MJ6QGBxFYfdwdO9swXWNsLXgaFdNMVemtNTn+V3wnprkfIHvSNeUdPNoca9
 IVoH32YaD6nX5znN+lHHpPAK2rjUqY6ONdmIS1luJbacMzQj382joz7D0TUBvuQ06uwAFACcQ
 W9RMxqxfhwdEYtN1fuoofVo2WTeR9PJYxA1oTE8FrGX+sT2QjlThfgcwyeWPWmmQnsYeMocxi
 JU7H82Q5leuZc2Flflm4zOgulN/HgXW8CHzncAzpkJl09T9pBzOmN545aiqAHzspM+LuVzirY
 sjgKcJAJ06BqBYC/hX14VcXolo5ANFADaRfpnNXthyOdNRnSkaR83iAeCGEobHYazPeN1fJzm
 4c9SiXfCrO0IJksvm39LWUcWryoR2mstwCMFqwdW8xuHCJ8lc8bGlZihq0/vH9uMP9mk4AYeL
 UPRhsDVqAEce4LcFhnuUpoSeUn2prWVKAukll3vGy6nwR6BiCeWB4u9p8QPmaB10vNAH/cvzC
 B+qq9QxbVmfRD+IWb8k4gpCgMCCTVw905VYk86EtxyiZL7tLNlM5XFJy7/TtAad9gG1KGE2/T
 39Lg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_044558_767106_D85FBD3E 
X-CRM114-Status: GOOD (  13.86  )
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

On Sat, Apr 17, 2021 at 6:45 AM <guoren@kernel.org> wrote:
> +#define arch_atomic_read(v)                    __READ_ONCE((v)->counter)
> +#define arch_atomic_set(v, i)                  __WRITE_ONCE(((v)->counter), (i))

> +#define ATOMIC64_INIT                          ATOMIC_INIT
> +#define arch_atomic64_read                     arch_atomic_read
> +#define arch_atomic64_set                      arch_atomic_set
>  #endif

I think it's a bit confusing to define arch_atomic64_read() etc in terms
of arch_atomic_read(), given that they operate on different types.

IMHO the clearest would be to define both in terms of the open-coded
version you have for the 32-bit atomics.

Also, given that all three architectures (x86, arm64, riscv) use the same
definitions for the six macros above, maybe those can just get moved
into a common file with a possible override?

x86 uses an inline function here instead of the macro. This would also
be my preference, but it may add complexity to avoid circular header
dependencies.

The rest of this patch looks good to me.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
