Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04A7C43461
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 18:15:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E175220796
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 18:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p74QIKSd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E175220796
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wo2yWfbKGRWsypKyLEqr4IIx3bdBNT4kT5nsQtDXhVg=; b=p74QIKSdDn+cjTNpUYQeLPwrE
	EVfiLJfv/DloT12APtan2zSZGec3xMcIAukYoxeL7BJhewojMDsd0b1Dr8i4rvWZjnM7/Fzft8Yrk
	3e+I3C4D06WsHpTcYRNVM5NDbTJq4gQeYEYfAv35Y89opBKB8Xqza4Q6zfycMXjtkbLUKOJdbmkyF
	BSQIJlwtmwylnPca+OAqFWwtG2EQFAsN9MEPj5b9yRAxlecojhMfipMzN+oj4mNWGeDBizFy21Q0L
	Zs/8oVZThB68FQTSyxlhTnJQpqqeis+EKssZAsZOhYHLXAesWvi65iKsmp133UkWTg9+TVZUMrYZc
	sDdbNBEiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEGFG-0000S0-V2; Fri, 04 Sep 2020 18:15:30 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEGFE-0000RK-33
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 18:15:29 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MqbDs-1krlyj1r3g-00mfe4 for <linux-riscv@lists.infradead.org>; Fri, 04
 Sep 2020 20:15:21 +0200
Received: by mail-qt1-f172.google.com with SMTP id t20so5327283qtr.8
 for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2020 11:15:21 -0700 (PDT)
X-Gm-Message-State: AOAM532ee1bTNPBxvIqDi98PN87cBZM+6a/JRV3CS2GqC4OA1o6zyaLk
 r398NCvbHZxOcMP8KOEMjtqAXifA6yO1MHPEdFI=
X-Google-Smtp-Source: ABdhPJwucPkGj3LAptlXE2DwEcjRJWWLLErfX9qgvukoJGkc4WlGdVJ6sLBUa+bp1zSZuzZUqHdfNwF7k0QysP9l5QE=
X-Received: by 2002:ac8:46d7:: with SMTP id h23mr9627667qto.18.1599243320351; 
 Fri, 04 Sep 2020 11:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200904165216.1799796-1-hch@lst.de>
In-Reply-To: <20200904165216.1799796-1-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Sep 2020 20:15:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3t8a0gD2HsoPsMi7whtNb7BdzPN6-oo6ABnqkbQJoBfA@mail.gmail.com>
Message-ID: <CAK8P3a3t8a0gD2HsoPsMi7whtNb7BdzPN6-oo6ABnqkbQJoBfA@mail.gmail.com>
Subject: Re: remove set_fs for riscv
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:9IsBIJgKTp7hoNSjRfWMNgUlMeX7c/dSvdi/YlI85XwdOvWK3o8
 LZ60oZ2UVL9+Ie1F/sMWL0hwR8zztWSLvXe8YMbtDnBn5xAVO57nnsHorBoNmAAaiSKz6zq
 9gzW6EoK4iorXLXFXFKwufxHQvTZgHRHw09/sL+OQhTGDXa+ta6278haZw3N92CnWKjEUls
 AYjoMBKRFidNM/0dft3fA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AjIktyxroqA=:z7dWbQc7tfI9Mi+JHyWswR
 Muyz9Zw6bhWFEogLS2mSqebUlalW0OTVhSMMbK2i0UOqyvnf56qyTX7NFM24UkLj9/7CTaeyF
 9d4rp3PNHgfi6VwlpK5xTk4GXm7U+d5CVVsANQkWGL0wywqtCKa44z70ZfJdiLLiPW1YmmSs5
 86i71F7+QEP8/2Yeejhnjhm6QXktaD7V41fpDAPB/1nIImrCbRbbiV9wuyIvsCtrIQNv5Ng7Z
 /tMvp0TCL4thJt+Jfvurd4SFq8LZlBOqjMx2SH6RvCcxnj9nq4g09Y8E7UGT4knZCqyXbJc4a
 YawQrvJsRmN8cSQedkhIhDYtTNg9qhBDeghMpg4SVSCTZD5Fh4RAViGwHoHGcNIimONwrFFX0
 3NPzDTfLyLZ24PY2rJV5iDKlY8VjP4OeF4wySqQ7oK2Pf9RGm/4//3+x+q/hzr8IHgD0pMGFp
 x9MFrA2liGRd5+NtFoVqhBy6kNQZMro0d4Bd1AOTkiYyFAMJhAl5MVLweXJJFx+7uf7WV56N7
 CdTU76hM7+3XG9dWjx7kI3LBdXtBQqlxcgkmRe67SUQYtFNjXmiM0dujB99FLQiRyhVmt8oQI
 BsO8jO1tRG/eLLWug9o76YgMHGZNXjCHEbKdYk6ArH6+Y3ztqHpMmZdKo3kwJs1fbuf21+525
 2hKrHvM3n+Z8QpayD1DNVFiTr9LKCbflKdveL7pg8joL7lyy3OGZeN+mWJzCP0r91QFp67wKv
 B1H3b29epcHIAZsjPvD9sUxXq9uu+I98JKolta4mnDluAIKgXjuStAS0PEW5QaqbtSSq4tZ3Q
 QafVhwkpKqvZUcNiC7pBewkKC0H1WYI0kmiFeO2V9y2aVoDTbdVtxicJ3k203qkl76u2t8zLS
 /KI4RH9Jo27FjYl3h2oLUWqbCPuVGLucfs4cyy6ym3S7dFNjzFbw9yoHvcwmbDV+4Bbn0ExJr
 +jYJEjKsqgFUN07GEwAJ/12SaAtLyg+c7xV5wnWUhfLJSbHT1Swgw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_141528_389601_A1208289 
X-CRM114-Status: GOOD (  14.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 4, 2020 at 6:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> this series converts riscv to the new set_fs less world and is on top of this
> branch:
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/log/?h=base.set_fs
>
> The first four patches are general improvements and enablement for all nommu
> ports, and might make sense to merge through the above base branch.

For asm-generic:

Acked-by: Arnd Bergmann <arnd@arndb.de>

Is there a bigger plan for the rest? I can probably have a look at the Arm
OABI code if nobody else working on that yet.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
