Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFF4C433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:20:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31CFD64F6A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 08:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31CFD64F6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=btHrYZLno2jBMmPJc+EBadkn3imgXntX4MOcLfAAhV4=; b=Rfmet136W+h2udHI+2TfOUyNW
	H3+AFiZBbKGs5lpwp4WLwP0DYP3mpzzxCjhNhlx2adcdgIvf3uvchHablPM8l0UoCCuXNIlbNADL5
	TrwBf+Y8rJaVHacwNZANk+P72zuEFdFQsyP09CThFSdPD+tN2eacNUIPR63yKVIwxQepNxJ9gF+jK
	92cEYRayWwI0Kwf/mE8JBZxqZPyr8e4t5qJszODIS6lrE1GufyeO/78or2GZ0ONmQJj8P0ZSnidbr
	vWXMjci3Ne9gXc73zzVi1n55vzucANxp5w4O5Gx0kNX6NP+fPsRK/SDBWdH+rXG5NRDJblCIOkC7R
	adWo5K6Xg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNAMr-006sMK-Ha; Fri, 19 Mar 2021 08:20:25 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNAMn-006sLs-Pk
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 08:20:23 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so7766051otr.4
 for <linux-riscv@lists.infradead.org>; Fri, 19 Mar 2021 01:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K+XmUzuuF5UUkq0/fWT+bp+a3y84PMfii9z5k2/AsMQ=;
 b=HI99Vkz2H61CHC62uwSpju6mRKoYJTVnBttZZmzk4fZPmgg51AQDYFr5YfPKWXZ1cd
 9SYnGnVKPJBDVUtZyxB6QxxDR3cjrpsfz5Fc9SWNVJsSS9oeamHuqzAkaIzB7az+oLLP
 wiOghMMO1xkn3x3a0CRjveSPmjtmaGbIT+2mSf5SnVN7T7JoTog1lxo5iZSmFccTCcxr
 yqIHmcpCPXeTGqqgt+qc0092O+OkAlxD+oreaR93FKH7u6LgEM0339J2copTybxXf+IR
 6A53xAkEUsOG38qtztsU6yF2i89c6U8OGMkU4FlZHcXMizOsC2DNcNfKCdfkHQuz3HYN
 OBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K+XmUzuuF5UUkq0/fWT+bp+a3y84PMfii9z5k2/AsMQ=;
 b=rfzr+Bw0Xmoc2CVQLk+rGx2Ys+pIxLNNJE9vPnde++qndJrC2pyOBfK44ZULjz08AZ
 pTgCmux/ASuXVu1jb2vWaAl6Bkrj9B6PxvMPLqqyKN2gHQGNV3de8WEPcp2GlPffb8Iy
 E5ZKuPjLY/X1qyPSQc/fLOBJjGL7TH5Htn/p/LYbDQQfDumBjKsT9V1ByDgBPL0jwmqm
 TvYFE6y1r9EPStEJcFubeL0Prt4HPF9QA0in7Go0QkSdguWNsqf5IV80eyz3jbMyz+Kg
 qh8wZd0YqFvHCiR9iyd+6T+uJ49DhKqa9OP6S785udYE1ZXZZ16FKcJJ7mUHf+dMLeUu
 TgMw==
X-Gm-Message-State: AOAM531GDeHGFtvvlBoSy/cYBk6y2YapgMWtwYFvYzD7ar4Gf30WSWWj
 7AHrY5f4Rub5EwsM9S2ewB9yxlYEGyqT0S9tdNe1ow==
X-Google-Smtp-Source: ABdhPJzHEmcxr7p0F8RTp2/xkLrbEofBVwtdlcTZdeZkLT6okQ8KKnmDtTYXOdyd/5uiHu7QPjpfJmyYZ894FTfbhAQ=
X-Received: by 2002:a9d:6ad6:: with SMTP id m22mr166502otq.160.1616142019973; 
 Fri, 19 Mar 2021 01:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
In-Reply-To: <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 19 Mar 2021 16:20:08 +0800
Message-ID: <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pragnesh Patel <pragnesh.patel@openfive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_082022_087965_EF8943EE 
X-CRM114-Status: GOOD (  16.08  )
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

On Thu, Mar 18, 2021 at 10:07 AM Zong Li <zong.li@sifive.com> wrote:
>
> On Wed, Mar 17, 2021 at 3:45 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
> >
> > On Dez 09 2020, Zong Li wrote:
> >
> > > Add a driver for the SiFive FU740 PRCI IP block, which handles more
> > > clocks than FU540. These patches also refactor the original
> > > implementation by spliting the dependent-code of fu540 and fu740
> > > respectively.
> >
> > That breaks ethernet on the fu540.
> >
>
> I would check that, thanks for the report.
>

Hi Andreas,

Could you please point me out how to test the ethernet from your side?
I had tried to quick test by using iperf and wget, the ethernet seems
to work fine to me.

Thanks.

> > Andreas.
> >
> > --
> > Andreas Schwab, schwab@linux-m68k.org
> > GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> > "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
