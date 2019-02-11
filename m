Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D97C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 09:34:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E1972146F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 09:34:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BdHtnyCj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E1972146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLZLyM7XZMaXRwbZ587hPM4nj9PNW2EFA5EnOQ6OeTQ=; b=BdHtnyCjaw8OOy
	c28R8d+7PC+T3UqSATqKWiwVF0wZLA2Ry/51HEJmpz5S+2zOWtxZtCM5ytBAYawtDEHaJ8q4W4CJr
	PzE/iJV5F17q1+/sqW5l2nf6qiiIzu7z33mdgtCIyc9HY62quBCxNjIG7uWJXeMnWjGrq9csKi7sU
	0YP0BhKDFYpQHIf0K8BPc4pvyS99k9gCKLn437ctXjpwiY+3R/23MoOZivfY+msIv0+Kbgy/ii1Fy
	HdiQ3EiVZG903NtvPtM9HUWR9Wwq1G9ny9hltPdYxIHPK3Zsmddsxl6c8USLsBoVCNbhMXfsMqXmM
	HXKoKgPVUf1vyQzwu8Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt7yi-0006NL-U5; Mon, 11 Feb 2019 09:34:16 +0000
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt7yg-0006Ms-RO
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 09:34:16 +0000
Received: by mail-lf1-f66.google.com with SMTP id q12so7213782lfm.0
 for <linux-riscv@lists.infradead.org>; Mon, 11 Feb 2019 01:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GGNbmJkMGxB/e9Dld/rXMbHkhkq/LorbsCdQM1ESt5I=;
 b=tJV1K/NpXGb8x08lrYSdlXdjfN0YGC7STUZt5BXEXFrRSDcFQgYBO/2Lx2Nn0GtvCx
 IDHL5de6XkZMdIe8cDUGbiiyMMqdPHdmDLWdfOWJp+/5mXvAJI9NlDjLTPS2MeGEskSS
 BUiu9wtYHFPxAJcb13GzbSdkOi0AAW/JUHO3VPPDOW5jXbTpahm4NM4LNBMHIkTz6qnt
 QmZu1MMEz4a+iyD7r5E7j/qlkKd75iabZ/rGIb2nRgVY8kRbDNzguvmqK10qgcIELjK8
 YtlXt41mmFrN2zuL4R4GKRyk33fRxSM6IdCT/2nVFRZnDoR5j/P13jE9hor6P2ywycW4
 S8hw==
X-Gm-Message-State: AHQUAuaub8gt8EC4Vd+WHP+t4/Mxobj0Ju4cTUXl/CJRPJPfKz68I0+C
 hDhGQU/quoQ6IBAUjQFV3b8=
X-Google-Smtp-Source: AHgI3IbWHH0e/x0SW1ck3rdLRePKz5UxREybCPzc+dJkw35iOIJP1/4VEliMA3Yjtr9WwJiFelK4hA==
X-Received: by 2002:ac2:5335:: with SMTP id f21mr16233314lfh.85.1549877652755; 
 Mon, 11 Feb 2019 01:34:12 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id u21-v6sm2025960lju.46.2019.02.11.01.34.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Feb 2019 01:34:11 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1gt7yY-0005Bn-F7; Mon, 11 Feb 2019 10:34:06 +0100
Date: Mon, 11 Feb 2019 10:34:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 0/5] riscv: minor fixes and cleanups
Message-ID: <20190211093406.GW4686@localhost>
References: <20190118140308.9599-1-johan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190118140308.9599-1-johan@kernel.org>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_013414_883152_BCFB6A91 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 18, 2019 at 03:03:03PM +0100, Johan Hovold wrote:
> This series fix up some minor issues found through inspection.
> 
> Note that the fourth patch changes which cpu (hart) devicetree nodes
> are enabled by following the Linux convention of considering nodes
> without a status property as enabled.
> 
> These patches are against the riscv-next (and fixes) branch with Andreas
> node-reference fix applied:
> 
> 	https://lore.kernel.org/lkml/mvm8szwwo1o.fsf@suse.de/
> 
> and have been tested using QEMU.

> Johan Hovold (5):
>   riscv: add missing newlines to printk messages
>   riscv: use pr_info and friends
>   riscv: fix riscv_of_processor_hartid() comment
>   riscv: treat cpu devicetree nodes without status as enabled
>   riscv: use for_each_of_cpu_node iterator

Are these still in your queue, Palmer?

Note that the node-reference dependency mentioned above is now in
Linus's tree.

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
