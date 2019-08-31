Return-Path: <SRS0=nlXr=W3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7F4C3A59B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2019 02:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C290A2343B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2019 02:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XxuijHbH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BmtM9QT7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C290A2343B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7GoOh2IO3DcMnQZ3+VRu/0ntsX72jgZMWWQlZSRY6g=; b=XxuijHbHMHgDh7
	1NYZtD8VP4V8gnb1hsj8uI6QBYLqZs3Dwa+4BCUFOugqi2465wFBigAKVs+1Tm1qylj87ooBIUneu
	05sTeRv9TbTCjDzfMMHC3tTpp/1wSwc9v81YZ/YQA/njI3rTGHZtWF/Pv3TFMZORqY9p7A4efCX1e
	lTP8uiaFjV9Q1FmvRn6rAKXmNI0zrRVYdP1WQ/jxnTr0TMry1kHTEWktDNW14UCtvnt5/N0Vg1BGG
	+nMlhuLULZuHOK7lBrr/1RrRh93RNCSOKbp6isycmgFGOUna1fkjTsyI7FdZPuUzJT03Mq4ZCcpx8
	SBu6oELA//ZD/fd2BkXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3skl-00047Z-PD; Sat, 31 Aug 2019 02:04:35 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3ski-00047G-IX
 for linux-riscv@lists.infradead.org; Sat, 31 Aug 2019 02:04:33 +0000
Received: by mail-pl1-x644.google.com with SMTP id az1so3168538plb.6
 for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2019 19:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zKp+R2++ZW7vYFmoNUR8A5wlNJqeNnULOZAUz1UqSlk=;
 b=BmtM9QT7x3OHnPhXRJ7wL/Pd4ecqOVF5NirfoHQHlQx/Elav8lNEhefX/wm8nIGJRi
 fV4EdJuRGzap2GHd+vD/ARdNuPXtQSUKYi/rMRjD8I4RwNXKBIitbpt/2IA5ZRV+Ko9K
 8iPQIPuFR4JxrYR9/L2cwkJ9bQSVdpLVG9qkf1tPfnMQWaEzLufOIu1hRoTNRD9S+2ZS
 uvu3TBGPAbSZx5reXnBSRICqXr5+WNGAhxCBAU0H4RT4l3En9iKHcZ50UFDqS5hwW96v
 WqIz5qrFt+cgvprBrRiwSnd3/WdH6T8JspMhJK4h/zEsT+dpEJywhukT0F+Y5l2We/00
 beXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zKp+R2++ZW7vYFmoNUR8A5wlNJqeNnULOZAUz1UqSlk=;
 b=lYwZkRwGXNuIhBXPP7XDO+nosClvFRbp5iBJ9uxfoGQ5zXFZeaWJvAZZXDHA5Nr6Lm
 CHrT4OiKXcmHCt/RdWk9c5u7FiO7MV26+Oxjtjp46eRfb7pDtwfRYo7urmdp97XMeZc7
 QJlUJucvpkstGSNIdE8TNjBf5Lnn74y+8BZX5jZ0jOaXCiBVsGlKsWnf7OQuT9coGDfO
 5lj/lku6rvjiMf5wjdej17urxgDpwXj9eF9vdBQuz9wW9DrgKqcstZ22G+r+B6WVPy2H
 6xdg6eKKOiDMEEjZq3Iof+yzvkXp7Na1kJwYJ7PCdl1mZD44PyXUiVcghGU6ZtZG/pxK
 Z3tg==
X-Gm-Message-State: APjAAAVw60NiErnXCkIewzlGD5xMjS8HwP/DaQIKQrTDE08zIU2dxq/B
 JEl3bpBCNlRRmV6Iu+nazM7+rg==
X-Google-Smtp-Source: APXvYqyomcceqFTqZJE7UZzkXFxj6XuIpOYDoJCJqoosAJW7N7akdJMUvYpMH+vTEGWMH6pjESCUgQ==
X-Received: by 2002:a17:902:fa5:: with SMTP id
 34mr19000900plz.285.1567217071865; 
 Fri, 30 Aug 2019 19:04:31 -0700 (PDT)
Received: from localhost ([216.9.110.7])
 by smtp.gmail.com with ESMTPSA id y13sm11526177pfb.48.2019.08.30.19.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 19:04:30 -0700 (PDT)
Date: Fri, 30 Aug 2019 19:04:29 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Charles Papon <charles.papon.90@gmail.com>
Subject: Re: [PATCH] riscv: kbuild: drop CONFIG_RISCV_ISA_C
In-Reply-To: <CAMabmM+YX3L-J1GCvDaC9H66YMArfs6PuKCsE_dNMBtApOxZig@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1908301859230.16731@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1908061929230.19468@viisi.sifive.com>
 <CAEUhbmVTM2OUnX-gnBZw5oqU+1MwdYkErrOnA3NGJKh5gxULng@mail.gmail.com>
 <CAMabmMJ3beMcs38Boe11qcsQvqY+9u=2OqA0vCSKdL=n-cK9GQ@mail.gmail.com>
 <20190812150348.GH26897@infradead.org>
 <CAMabmM+YX3L-J1GCvDaC9H66YMArfs6PuKCsE_dNMBtApOxZig@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_190432_647323_F62D3082 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Bin Meng <bmeng.cn@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Charles,

On Tue, 13 Aug 2019, Charles Papon wrote:

> > Because it it the unix platform baseline as stated in the patch.
> I know that, but i'm looking for arguments why RVC could't be kept as
> an option, especialy it is only an optimisation option without
> behavioral/code changes.
> 
> That baseline make sense for heavy linux distributions, where you
> expect everybody to compile with a baseline set of ISA extentions, to
> make binary exchanges easier.
> But for smaller systems, i do not see advantages having RVC forced.

OK - I agree with you.

Still, I think it would be good if we made this option depend on other 
more general kernel configuration parameters for smaller systems.  Will 
think about this further.

Thanks for commenting on this, and am looking forward to adding a VexRiscv 
system to our kernel tests -


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
