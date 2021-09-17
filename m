Return-Path: <SRS0=snBs=OH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613C1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 07:33:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C5560F48
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 07:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31C5560F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhCvsS6WhZLCjssDoi8tw3fuvgcORplsKDgzoIbT580=; b=PJUUafb+6bGHUB
	tcH3Gf4LxJQXKL/e0YTpitlbBZvRB/fVh6FxagF6SEhpUaas1JxnZm29qSIBnd/dNXZ9GQoNhOFH1
	z6TARSLDmTwzspV0fbeAvHWlyR8giolZhuaStFUs/GbGWIXH0p+nF1NWo/JIJvW7QdhH4eU5Kd3mi
	yOhf1b8yQgzbu6KShAVr/wvOUj4Jh7BTx6x2TPfgz/bnRmUJ5yTigXOq/55w5QMIW5g7LtQD8d0JQ
	5dH+B/ntnVJNW5uF20k+nkUWUEbRvsWoPj1tyxFUvoD+jBLwvFMyCcR1l/Kz/1W9/kDvXIJG4sPFb
	Jyl2j1/2FsehCpV+4RnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR8NL-00DRMX-KA; Fri, 17 Sep 2021 07:33:35 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR8NI-00DRKr-NC
 for linux-riscv@lists.infradead.org; Fri, 17 Sep 2021 07:33:34 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MRSdf-1mD3TI1mNB-00NOyp for <linux-riscv@lists.infradead.org>; Fri, 17
 Sep 2021 09:33:29 +0200
Received: by mail-wr1-f51.google.com with SMTP id g16so13587057wrb.3
 for <linux-riscv@lists.infradead.org>; Fri, 17 Sep 2021 00:33:29 -0700 (PDT)
X-Gm-Message-State: AOAM532u9dYc2Go7ZwED3SP7LtBufPJfuulxn+Y547Imvb5rz6zeJ9Qz
 u9sT1Cob9CtRZUX4TGo7xC1+fSFyGddHhijlLK4=
X-Google-Smtp-Source: ABdhPJyPtoZ/mG7bWsWHsydawMEYKJ4E3ECfqsk8lnBKNgqIVX5W2m+pElPlgj2gMjbI3079PSZ95Swtj4MIyk84lH8=
X-Received: by 2002:adf:c10b:: with SMTP id r11mr10471636wre.336.1631864008841; 
 Fri, 17 Sep 2021 00:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
 <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Sep 2021 09:33:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2kAvrKvCUOhVouHUmY661OZHVAm9sefgXuZpLHMQg7Ow@mail.gmail.com>
Message-ID: <CAK8P3a2kAvrKvCUOhVouHUmY661OZHVAm9sefgXuZpLHMQg7Ow@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 linux-perf-users@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair23@gmail.com>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Darren Hart <dvhart@infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <alistair.francis@wdc.com>
X-Provags-ID: V03:K1:37STevigE6TzdSRJ+tDTTucfEPfwdeBGgLwvLnI2NsqfWOxeAuH
 pC6BgVSCI9U5ndG8XIA9l93ujEiLSIKTmcbiwwy3e14qdxP8DtBPlPJ9kM1kUFaTguLrBNv
 WMLFdcm2qeo6mRS8ai6KPh15Df2fi/j7QWtCcDaj+47mBsJ80KhtE/40cQIZ2ZdQpq0pq5Z
 EF/88k0a3GEEB+VSNENkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uyA2rZ8amVU=:hdSAoVQpHhLQ2W6EERROhl
 uSYs0SYmTig07zqoUU/4JqUrgq1S/BUrtWzRpoY+NyWcYSUfHbM0lYrDs22dMuGnueEhE3M7B
 AfzTfqhO+ylBjXhkVs8CkxAAxjXP/S9xaWjM946Nhzr/B1qClfFAIhFTITDTBcM1zKBh/fTcw
 PLZci3zwB/A460RiCUNknpapRan9GX2iOoUWFJa/OmIXfmPNHviT9YfRc3gPMa1RZqHYa+wxt
 hROMas8Tns6ecxiYGFFPX/fpjOd3R3TaoC6FMpCzd05xCEke8KYgPqRZyuMoMM2YFaqgxJhWe
 ap338Oa9YdUfRouF5u8zEFlN++UswDEXrfCnG1TLdJs0M8UW+CWzvWQeQo09QLr4tvILi5LH9
 gKTyYbOynQksW0KRTA6dm3h2jhteNMZvXyOL+qjis51ix5B7CuvX9N7cXrTY0/M7aE2pK8A2W
 CN7nbLAblvNKBNjWspb7yQ2aU/kLBH7ooJes6+Ee7n/kvAThYwpHT5bWVn6O4REhTtDCqr+De
 Fq0aY6ZoHWynaKPb0hGISOZw81EsYx4QHEPGEY8w+Gjdqexsi9UE0qD/UJFY9+IFysOp8O04f
 ZaoORSpeNgw5g8TbYuUxSAo9xrBS4coC2v9qFBLFuArOp4Ns8X5GHLILy0rxplsI71BM4rjul
 jqNOr/QKVpMWa0grPxV/Rdn/EQXdgEzBxCj1M/e/yzbmuHltheIoxSMPDT6hs7kxIKEUnXEeS
 59KAf9m8ovvF+k6U6vPmSW7F8FzM/Rw7Wpx+HrHSTSEB36s5GveUVlrTziQjX1HA8fa3sXupl
 y7wMyK5jxv+h4vgqk9oP7CLdykRKDqBI7LBhetuNUrNUaXrf0RI0Ms7gq/maPTC7SwPcRB4Ap
 vJZBH8I2c/k+s7EMwFCg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_003333_108704_D26386C7 
X-CRM114-Status: GOOD (  12.09  )
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

On Fri, Sep 17, 2021 at 8:10 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
> time_t and as such don't have the SYS_futex syscall. This patch will
> allow us to use the SYS_futex_time64 syscall on those platforms.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks for the follow-up!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
