Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B467CC678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/Wtr1OJq8OPbEv7uDg/JsVgrPEIiVyp4P8QKDxGyWQ=; b=f24nZAy/p64rxT
	QchqgXBYR0NoXm/uN0h+g6mJZU8M/Xj0wYSVVqYFbJUIutRISoZzFlO4jdWAgrrd73dApbvud5cew
	hGrANV4vctdG02tZV4atyl4J2vqIkvOioq2/nCExVSLQf5k6WBYHppHJuCVmKpnwEp5rT8Ufuta0z
	nagOSrKPnGAnlW3UGVJDqSGfmnWsrK/5TslnBcqBoh1n1nCAM3xWvImBCT3LY5C3I6Z9g30ULtc6S
	qxaBUx36YrF3ByQFqD5fUCEgL9hpdoJjHvO/W36nODLwE8xAO96cDFDGOQX7ixvEvIOLD/t5KUmeM
	RoZGpvXPJxAWCDOdAZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0Tm-005KuJ-1W; Fri, 03 Mar 2023 08:09:26 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0Tf-005KsV-G5
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 08:09:24 +0000
Received: by mail-ed1-x530.google.com with SMTP id s11so6994347edy.8
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 00:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D4WTQThSIoEF32Ub6V9v7GmyYwnBKD53cEBEBaSt0zA=;
        b=aLyqdRMRrcIS85q9Lkp1ABFAZjgqHcOjlxjeGn78DOMaYXW4uRTyPL7zSxRKp2jFcN
         ietx/isVIl1uXoAV0vcUi2WKOsjrrTd6NmctLBo6TIpfkQHMisuJJOOAWzqL+anMxcIv
         iK9cFveXfloQbDQ6LmaoyCmn8LYC4OJzwxm6cnc/g2pSJaNYHGmsAadKQbqTA6oo8oLO
         bsBaM9w91pp0a6weRqls7td2/w0Wgmz1DxlQByIaxe3h2YEEDEFQCkvb5KmHi2UpFcgr
         Yf8gqW6PhPafK1CsT5o0AytD+su6h+kiK5vBzsL2eXwjlUeNU7sD7u8pFyVpPBwObTk2
         xiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4WTQThSIoEF32Ub6V9v7GmyYwnBKD53cEBEBaSt0zA=;
        b=BZQnMG9hcjLtlzzFwOeJEamo5cBNU/NRH9HpJHHBISHX2qqjvcFo6JizUlpr/zbHjF
         PkE1ZH+Ni290bvxZi7S8is4OWcteM+VTd6V6KUV2F4ktJqp4cuqkZwPoMBmv1CxOYTtR
         UHAKnc0ZZKpOuF2HCa68Ee5MnXpfB9nfCgq0UsPwpluoQc0U05r6Ut8PM6Lm+wv2dslc
         dALW78rGYKtUrvYXU/ZknPa75vVuQ8nEWJoLjgGxkRY2EDECwUQPH9MMTr+urJhTdQTa
         +gaj0jU0b4aR6KdLij0gJtkiqtV6r/3o3UqBVGxjmUt320wUX2bUE9BAF0rqKMQD4EvT
         AVXw==
X-Gm-Message-State: AO0yUKXLutgrEQTUJEfrvrSBfhf84znzBlss1PCBb/PnBslE5j4V8lxL
	v9bJ2vkqJMOvO0zMYh6Ej0Ia/g==
X-Google-Smtp-Source: AK7set/BTmesy88YX7WAMMNmgTPuqjNLvzlzo5tDl9IBAMPW4ZDcel3r6DO6t1dq4qeXaUAuHvqecQ==
X-Received: by 2002:a05:6402:1253:b0:4ad:738a:a5db with SMTP id l19-20020a056402125300b004ad738aa5dbmr1216384edw.0.1677830957038;
        Fri, 03 Mar 2023 00:09:17 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m27-20020a170906599b00b008dea022f5e6sm679897ejs.24.2023.03.03.00.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 00:09:16 -0800 (PST)
Date: Fri, 3 Mar 2023 09:09:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v4 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <20230303080910.hfipcsrgyvppa6ex@orel>
References: <20230227075942.rgl4hqnwttwvoroe@orel>
 <178ca008701147828d2e62402ff4f78a@EXMBX066.cuchost.com>
 <20230227114435.eow57ax5zhysz3kv@orel>
 <a6c319dd867f4f1d97e9d950b9e7c636@EXMBX066.cuchost.com>
 <20230228050457.zfbflfawctaccepv@orel>
 <803ac603023c4eeda4a0b8e414cce6f1@EXMBX066.cuchost.com>
 <20230228071845.k6s6bcnesdsnw3jl@orel>
 <abd16b950ca744b081fc9f545977b8fa@EXMBX066.cuchost.com>
 <20230228073725.m5t6rkcbgbi3g26z@orel>
 <94325d78a0b74d8289b77ec743840941@EXMBX066.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94325d78a0b74d8289b77ec743840941@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_000919_577600_F259D224 
X-CRM114-Status: GOOD (  20.39  )
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

On Fri, Mar 03, 2023 at 01:53:19AM +0000, JeeHeng Sia wrote:
> Hi Andrew,
> 
> 
> > -----Original Message-----
> > From: Andrew Jones <ajones@ventanamicro.com>
...
> > I'm not sure why you don't just write a paragraph or two here in this
> > email thread explaining what "the answer" is. Anyway, feel free to
> > invite me to a call if you think it'd be easier to hash out that way.
> Thank you very much to free up time to join the call. It was very nice to talk to you over the conference call and I did learn a lot from you.
> Below is the summary of the experiment that benefit everyone:
> To avoid inspecting a huge log, the experiment was carried out on the Qemu with 512MB of memory (128000 pages). 
> During hibernation, there are 22770 pages (out of 128000 pages) were identified need to be stored to the disk. Those pages consists of the kernel text code, rodata, page table, stack/heap/kmalloc/vmalloc memory, user space app, rootfs.....etc. The number of pages need to be stored to the disk are depends on the "workload" on the system.
> When resume, only 21651 pages were assigned to the restore_pblist. The rest of the pages consists of meta_data pages and forbidden pages which were handled by the "resume kernel". Arch code will handle the pages assigned to the restore_pblist.
> From the experiment, we also know that the game that is activated before hibernation is still "alive" after resume from hibernation and can continue to play without problem.
>

Thank you, Jee Heng. Indeed it looks like the majority of the pages that
are selected for the suspend image end up on the PBE list. While we don't
have definitive "this page must be on the PBE list" type of result, I
agree that we shouldn't need to worry about the PBE list ever being empty.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
