Return-Path: <SRS0=jpEU=45=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03944C10DCE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 18:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE360206F1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 18:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bs3JHEmY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="No2CoXKW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE360206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GC1hJ0DiMLggaOOzuLUWT5Y1sQSCC8CLXzsGF7PTNaw=; b=bs3JHEmYKbdEsw9PetIOiGX7x
	gGtd42EY4AYKEevrWEIYagUnM4P46PuPscazWSBLxkhKyvL/ZCI/6qhNxuJNd4tk18S7n+HFSmhYl
	HZdZLsZVGe1fvHXKXPkTPoouteeFx8v0+dLG4lYphyKrvZaGnU4WvVrec5R2OkcA1ilVsvN7OJ+rl
	6h7sL64jOxOBKjQZfrw2rDI4sX0NhMtGENvnjeYOlITSOS6mN0RzDGGRP8gOUEwDRajnE9jSnOFTv
	QsZlgsD08F93m7YcfIMQcTsFHh1HSVQ0P+7KjLYIekPPvhhECEz27NBOIt83vtXhPOa23H0pJZ1d6
	1Gohb6lww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCSaQ-0008PB-84; Thu, 12 Mar 2020 18:29:38 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCSaN-0008O9-1J
 for linux-riscv@lists.infradead.org; Thu, 12 Mar 2020 18:29:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id f7so7496003wml.4
 for <linux-riscv@lists.infradead.org>; Thu, 12 Mar 2020 11:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GC1hJ0DiMLggaOOzuLUWT5Y1sQSCC8CLXzsGF7PTNaw=;
 b=No2CoXKWyyXJfBP/s7eCianbaDn0WKBYKtzHZlqcHx0lNrk3oWIHtXs/OsWWL9/cuR
 qqi/shI2ZQduoOWyVcj2InfUiWoKCwpsMmBJ7/Q1Suh00vZTYgGJ8o7+U8N4U8Plo7hE
 zrZZgISXLg71kvufW0TLpkokJLfdtQVijN1GRj37Nf+Za+1BHBXUBLtkGAaguPZ9cU1g
 4rEXbYWHPyW/0oGDxq7JZCIjveZWrZP2R/O+P7E9o5lrEw+blnqHKsnZ11Sr5zhUXKrz
 5CD5TqsTUW1XNptSyybr5yiCoASs17zgxBdHxJQ1qhRQr2rJaM422GqEgxkiMwEq9RZU
 s9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GC1hJ0DiMLggaOOzuLUWT5Y1sQSCC8CLXzsGF7PTNaw=;
 b=nx7yZias2LLtdKpZ3y1Ga591bsLSyGsFz1z/E5ceI2NTvN+8alxSXJwhrhLHY9U+k6
 NbtYMxQYA5sx6A6WJ1LnHYST+6+gmN6VU3B6VHX4l51Vf5+WAizjQ43PcX/UAO+ugsRs
 +HVRcl9HlUd48A9sgQ3o1P96F02JAedZ/e3Zkw9twmHw0zPQf/5jKJw6rULMOOQJpgAG
 AjgOZphwOJaZ4fzjdfq13oE+ptfWnqFKVpIQEtd/AbPekL8H4o8JSTbeun6yGSftj8uE
 DluGnxcwFVuH/6nqRMenh8uQx93sMKmUvGSUjVBZpqsUhfFSODPWR369PLHZOVC2Oviv
 cIsA==
X-Gm-Message-State: ANhLgQ3lbPX+bNX6XBNzqh0O/+HD8LBimheozN2Xi3eYnpS8RQgbawWW
 UOundMtoI38X5yJLrRA8Fa208SJavVqqx0ZtBiOW
X-Google-Smtp-Source: ADFU+vtpwFvavhqnJ9voxET/cqJzGc+A4siwYSqn0Tn0/lc/1pu0NurLqX61T0lZ0BbJZHUNAknvpzPXP+5hAutOzAI=
X-Received: by 2002:a7b:c391:: with SMTP id s17mr4858935wmj.55.1584037773015; 
 Thu, 12 Mar 2020 11:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200312051107.1454880-1-damien.lemoal@wdc.com>
 <20200312051107.1454880-10-damien.lemoal@wdc.com>
 <47a2207d-6c16-b007-4c35-7c1a0649ecc0@gmail.com>
 <CAOnJCUJjLB2fwW+ZAKc9nixUeJJm7pg8KxuOkqF5pvY1c0nRsw@mail.gmail.com>
 <3e2ae3be-6269-acbd-6283-16c50cd119af@gmail.com>
In-Reply-To: <3e2ae3be-6269-acbd-6283-16c50cd119af@gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 12 Mar 2020 11:29:21 -0700
Message-ID: <CAOnJCUK15kiMohMoqfPUNE43Yq+BTW=kY4AHYjyKkdr9Htg-ug@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] riscv: Do not initialize PMP on Kendryte SoC
To: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_112935_079378_2E64751B 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Damien Le Moal <Damien.LeMoal@wdc.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 12, 2020 at 11:14 AM Sean Anderson <seanga2@gmail.com> wrote:
>
>
> > I don't think supporting old specs in Linux is a good idea. As per the
> > patch guideline
> > for RISC-V Linux, patches for only "frozen" or "ratified"
> > specifications are allowed.
> >
>
> Well this CPU follows the v1.9 spec. It's real hardware, if it is to be
> be supported, then the 1.9 spec needs to be as well.
>

As RISC-V is an open ISA and it's continuously evolving, there will be
some hardware
that will implement old specifications or non-backward compatible features.
I fear the number of hardware with such features/implementations will
grow in the future.
If Linux is going to support all of them, it may be a maintenance nightmare.

> --Sean



-- 
Regards,
Atish

