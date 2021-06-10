Return-Path: <SRS0=8YMt=LE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D488C47094
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jun 2021 17:11:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7517613C9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jun 2021 17:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7517613C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dl7lITv8HHD8GgV3dctmFz+OmjY5wnY0Z/POxaOsZY=; b=gjd/oqR2GvTkzW
	1uv+lgtERPZsYIKLZyNaVX1/DJwnbKM83GEqgNQVAsYIMKY0Lp43Qj0yCCjWfhAlo7JYPn5lJcZxc
	vbun///b20njl5/aHN2k587HHAZXJQDuamUXmFu+7lONxqEPyAH/I4KilPg11ewPAnt3YVwvCTKo9
	3W4FUDs/3oybM1RGlI7jcu2u9z0WkLGHcaqCiifLtZiNEHuLlk9nPjZnfkPkzaBAG5203ULmzrY7D
	bxgNMDahFo8obU5T2JrzFjaMh25hl7qSJD5wBzBc9jTiV+EZG2MyKkcAE+3GSA6L16Hlp2NlYXyir
	RGmdxHkcsfwAUPTgGMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrODN-001tuC-RW; Thu, 10 Jun 2021 17:11:33 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrODK-001ttH-Op
 for linux-riscv@lists.infradead.org; Thu, 10 Jun 2021 17:11:32 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 w23-20020a9d5a970000b02903d0ef989477so371370oth.9
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jun 2021 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UEldWJV1cPWL8Nx8+B0VxRHw0WvFlQxd1i6CoueNSPg=;
 b=IRdg245kSIcipiUDAQsfeK8J7xCVSoOfZfPJ4r14rCu8g+/JY3t7WSjzmZpNfatzGA
 tdKtwOJKK7vj2sdT2/oC3mcL6UUy9itw++Knge0r2zC3GOdEwXz4tNJRExYZdxAmjxz7
 lYxBEsCby173q+VLTjhlgdy4pkqZ83fUBtrkwMGTPQGYizuQsYHUjRulz1WD1li99zaZ
 Cpw5NWZtPzRSAEiP4SSlWgE0/PRiOjHDFBEQtLCrIqCIVUgukQdXFkh15HYEUOfIqQo8
 nAlza83rQ5+c5oxa2W0soy2OALvCh3UobmoYd9YUiJ4zKpijb3qye6DaUV0fN51y7f74
 i3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=UEldWJV1cPWL8Nx8+B0VxRHw0WvFlQxd1i6CoueNSPg=;
 b=BvXHC75ykrCrGeDNK8II1TRK9TAJ7WkJmEcEGbR7VHxGKatHy7eBHYLfoxyKGxbNcP
 pqBDD+ZlLmBGuDkDJaJvMwKGpcEnc6bVTx97RQ54Pfi9J4WAYsjymsTSBjSdSO/1lv2p
 HPtr9mg5wEGaf9ky/4SeQZYZDmkitYWPphYro5EqSIm/bVknf3nt7fxj02xn3+hwoOei
 S5hdcfQ1HTNSQlsz/0hQrNtRoy4Vx4LtV/PP8/VRgedlo7129CBE2NclU+we2Iz9/6fs
 qd0wh5vJAHOa0F4MG9PkNrAVn4gLWId8y/vCXyUx08MwtzecP7Hab3nM1ncW4OBJq7zC
 GOBA==
X-Gm-Message-State: AOAM531DDmxJ2wASwrPfCwACoOgSsyM7MQF1PInx07AqPmcr9spBlR4D
 C1MQJG1Y+c4UcRG0bW2xfAI=
X-Google-Smtp-Source: ABdhPJxEihMj+amx9LkloPuUl4Htc/kRCs+S/cbsGvuN5hAZAo13Hhp/u6shvqBvrF3NMlAL7NQETQ==
X-Received: by 2002:a05:6830:2684:: with SMTP id
 l4mr3378035otu.294.1623345027254; 
 Thu, 10 Jun 2021 10:10:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id t18sm706988otl.80.2021.06.10.10.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 10:10:26 -0700 (PDT)
Date: Thu, 10 Jun 2021 10:10:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Alex Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 1/3] riscv: Move kernel mapping outside of linear
 mapping
Message-ID: <20210610171025.GA3861769@roeck-us.net>
References: <mhng-90fff6bd-5a70-4927-98c1-a515a7448e71@palmerdabbelt-glaptop>
 <76353fc0-f734-db47-0d0c-f0f379763aa0@ghiti.fr>
 <a58c4616-572f-4a0b-2ce9-fd00735843be@ghiti.fr>
 <7b647da1-b3aa-287f-7ca8-3b44c5661cb8@ghiti.fr>
 <87fsxphdx0.fsf@igel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fsxphdx0.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_101130_834059_FF7A8F9D 
X-CRM114-Status: UNSURE (   9.43  )
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

On Thu, Jun 10, 2021 at 06:39:39PM +0200, Andreas Schwab wrote:
> On Apr 18 2021, Alex Ghiti wrote:
> 
> > To sum up, there are 3 patches that fix this series:
> >
> > https://patchwork.kernel.org/project/linux-riscv/patch/20210415110426.2238-1-alex@ghiti.fr/
> >
> > https://patchwork.kernel.org/project/linux-riscv/patch/20210417172159.32085-1-alex@ghiti.fr/
> >
> > https://patchwork.kernel.org/project/linux-riscv/patch/20210418112856.15078-1-alex@ghiti.fr/
> 
> Has this been fixed yet?  Booting is still broken here.
> 

In -next ? riscv32 doesn't even build for me there, and riscv64 images
generate warnings and/or don't boot (but that doesn't seem to be riscv
related, at least at first glance).

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
