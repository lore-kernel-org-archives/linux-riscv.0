Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E96C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 03:22:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9060C61974
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 03:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9060C61974
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S5Mr+b50zNxZ9JZ4sbqy1wppdv/n0JkKSSlSkYYxp6k=; b=PTd2Dxldw4TPrD+snYL2drLoz
	R+Qf8r22Wyxv7FxLkCOFO9ornso/mKlYFZOirEiRPhM0s+RTk39klUUkAJWG4H8sirlaiOdFMPAk6
	bfKIVvZeD69MJ9kh3/BXPG00EYmLKU5XvNxJeamtrmY+siSx8TTI/YPLiok2op8+YEAYsK79UKqYO
	nXGXKZodqdOZwoM82StgXjqr14nMKJUxPVYXZjGLM8Vifn8gDBrp0InuWCEQY+vE1HgrLGeKIr4oA
	lef2dfwC7uNiZdG6pzfDSK6PpHQj5z83+Vyyb5X4dS6V6Yls3tQG02Yr+9M/LcE73hpM5Pw+GwFjx
	meJSSSohw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPGZE-000XvQ-8G; Thu, 25 Mar 2021 03:21:52 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPGZ9-000Xv4-Hw
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 03:21:49 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so660048oto.2
 for <linux-riscv@lists.infradead.org>; Wed, 24 Mar 2021 20:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0LhekbqtuOQcfnVYM+NJjvLu7V0qQ67rxH10e15NhwU=;
 b=D8FXZDPcOdvkffEjYsCLmwlu5glW+BEuFYiGaC3gUvLryjkAsjHRZ69IYCpmBI5hBi
 gUbZMtTcuAnjZv8QY77mUAMEIFD4wLCmNsZ7rPXFnTZYBBPrihXWcmF1D4b/ef7ER1y1
 xUsixWI+MxDbixZ9JRO3I0ZEs5ArqAt9ujLF63lHEQv2CnPqxXo7mUJc+90RS+LBVyMi
 ed5UJH4OhHFA9HwORZ+/ymKbz/gj6kI/PNN6qfBTgQAuiOlkjtAm5AMdAyi4VvQ8mHHM
 z7cTI2cjp2Q0SHbrANCk1w7F09KhRe6QXMapAm3kMzQvJahwemJWTEVHfT0AK5AjNnFA
 y/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0LhekbqtuOQcfnVYM+NJjvLu7V0qQ67rxH10e15NhwU=;
 b=rFT7cDXvEjy0qCcLkS875Efm1fu7SCaOAzzWJq8ENGWvfq3w0MKi3mgzd3cvfyZGeu
 qPypiH2CjxzAZZqwc0FjyEAdnmNHvlCziet5HFLbzXZFDkeM93OxAb3Hr0+WhZ9nl/8Y
 gj56viUY4XanhyngZP5UyX3phjUwdMc3f6wr7MVKKR14EJD1JpqU6RA+mmwWELMPIWfT
 /4WAqdp8OPhrLgtDKcptIu313ow7WuWprw9O4hyQkibNvaocQx5cN+6l++mDmFYkS8H3
 Pmq/DB7qQX8CyqAz3yXyFSTJ3tx0nO2Os8lfsAznEue2IZgo6A/ym2nP+Gd7ARADwjom
 eitg==
X-Gm-Message-State: AOAM530hVRhwU3/0IzEFv8oGmCE9brHvQFTdwIMi+XcBdZ8oDCVplAjy
 yOSxz1olqRYRSpfEe/t18KtjPKXl748emY/lRK267A==
X-Google-Smtp-Source: ABdhPJxTgql0rnGsMW0v8subIn7KHnS5/dyuNMyqc1AF0dE5WKZizvZf4u+nCF+96sl4XogDLPJEp2g3p79JZoDdKc4=
X-Received: by 2002:a9d:6249:: with SMTP id i9mr5760502otk.166.1616642505612; 
 Wed, 24 Mar 2021 20:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
In-Reply-To: <871rc4on36.fsf@igel.home>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 25 Mar 2021 11:21:35 +0800
Message-ID: <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pragnesh Patel <pragnesh.patel@openfive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_032147_739073_F2242703 
X-CRM114-Status: UNSURE (   8.86  )
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

On Wed, Mar 24, 2021 at 6:36 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> Were you able to reproduce the problem?
>

Hi Andreas,

Sorry, I'm not available past few days, I'm just coming back, I would
take a look at this again. Could you also let me know which bootloader
you used (FSBL or U-boot-SPL)? Thanks.

> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
