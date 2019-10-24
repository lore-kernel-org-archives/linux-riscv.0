Return-Path: <SRS0=OP9P=YR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A234CA9EAF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 23:59:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C6C821D71
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 23:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UUO9aU5Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BsAUU74u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C6C821D71
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6yFoPHtIDq5RHvEvW7IsNC/cTT8PQlKVapAIwX6s7s=; b=UUO9aU5Y3x4G3F
	KxEHSmO5ApOvPvx2EIeWLQlK3GOwGGdIj+c187an33Wyb3Fj9tKrc+WebcOyj4XLyGGQVnCaZW1kh
	nX+5YX9csGZuFH/iSkNhlu+i3jJIuAHwI21HHIv6ROl7ty1FZHdq2UPW3NJSB7Z98Mjzfj2D398wk
	QE2WabCr4mvxoNKvesQo9944P90EDKUd+7gWRUM6xd7FJPzSQd8Yzg1iiIAZLkdkCb5wp7jAu79/X
	NEKZsP4OFHoTTOCAQdLA2jJgdWDoCObZ2cdOMSXDFkmKljV0LY2ZqO0eafD2uRmNWp6CDfKYw2yhw
	JVlp5JXqPy0lZCYmPPzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNn0Z-00083j-Ay; Thu, 24 Oct 2019 23:59:11 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNn0W-000839-Tz
 for linux-riscv@lists.infradead.org; Thu, 24 Oct 2019 23:59:10 +0000
Received: by mail-il1-x141.google.com with SMTP id z10so242064ilo.8
 for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2019 16:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=nrYq+Fut0kmQhvcRn7pxSXUfim+ixb8xYZ7zEoN8gXo=;
 b=BsAUU74uS8B0k+6fZmvognM6tez13o3m6eEh19qshytOcDMGPC6/x5LGe/utbx+1Nm
 Gl1SGTWaU8I6VXpWeZ96RVdo7Frjt9AcOHaxwXXe7MH3vVU1iFa/l7vyawBgOEZVPXxt
 CueHWNYxJECkUK4BvK6ePH4zszEQ5pLR2MCh5x2zHXdWwdLD+6LxuAyu4qVRPSLopghr
 DyOME0SHIzrw5NVMiUWTiCA+Jlc0cRHJ2Ssf5JeQcGMjRTX2DBunouQ9WY5kRqmbAu+2
 ieryA2hktUS1oEOY23HDFq8SVOrlikVEKeY6qw/rRZ/K/x1KjS8crEvmviI3tXGCwjs+
 YXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=nrYq+Fut0kmQhvcRn7pxSXUfim+ixb8xYZ7zEoN8gXo=;
 b=kaM82xEXa0wZiH6KBaur1N4tPQRBpkVxqs/u9XPLRNqt4kyJPoKcRS6GNe8ZYoQvjU
 BrNdRZn2n0BdU3UerRFO5PIKqghMybdp2ghGlrMuhKbB07bLjQSSNko/kb0601T6o2uG
 gLXgW1P6fE7DwsqLa/AWpcVmuRcxPOtGA4W4RJXpmMXKMIj3y4KhECIIpDVW7YGvbRnW
 +wbuy/noRd/ZOjSpbdjgjZk/WhtEF+kvuY1ZUt+YW96iS6ucpE0Nsexg9+UAHPOmyREL
 h9m9756jVKw73P39Xf0wbwsvBlXDJbB2E+QmyA2DdlJaEYtB0hLSTDDgjeuBMoAUUecj
 sMUw==
X-Gm-Message-State: APjAAAW5xpkTJY1MM5cm/iEyna7WdbdSRSRp/Ej8+DWl+Qe/CwJjZySM
 /I4icT7FlwdTC1/RmuQnzkJdyf6B6oQ=
X-Google-Smtp-Source: APXvYqxSqNsy/Qwmu3LlHURutjKdJmHQxsFx2ie7La+PrF/qzATogjgyh4MjolOQL4abtFIhbi4ZfQ==
X-Received: by 2002:a92:ce83:: with SMTP id r3mr959589ilo.176.1571961543943;
 Thu, 24 Oct 2019 16:59:03 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id t68sm88604ilb.66.2019.10.24.16.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 16:59:03 -0700 (PDT)
Date: Thu, 24 Oct 2019 16:59:01 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 1/8] riscv: add prototypes for assembly language
 functions from entry.S
In-Reply-To: <20191018154923.GA23279@infradead.org>
Message-ID: <alpine.DEB.2.21.9999.1910231812080.6074@viisi.sifive.com>
References: <20191018080841.26712-1-paul.walmsley@sifive.com>
 <20191018080841.26712-2-paul.walmsley@sifive.com>
 <20191018154923.GA23279@infradead.org>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_165909_029288_0F1F2D10 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 18 Oct 2019, Christoph Hellwig wrote:

> On Fri, Oct 18, 2019 at 01:08:34AM -0700, Paul Walmsley wrote:
> > Add prototypes for assembly language functions defined in entry.S,
> > and include these prototypes into C source files that call those
> > functions.
> > 
> > This patch resolves the following warnings from sparse:
> > 
> > arch/riscv/kernel/signal.c:32:53: warning: incorrect type in initializer (different address spaces)
> 
> I don't see how adding prototypes will fix an address space warning.

You're right - that was a cut-and-paste error on my part.

[ ... ]
> All these are not defined in entry.S, but called from entry.S.

Indeed.  After reviewing this patch closely, I've just dropped it, and 
used __visible for just about everything.  All that is reflected in the v4 
series.

Thanks for the review.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
