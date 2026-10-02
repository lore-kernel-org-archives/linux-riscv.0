Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F03ACA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6Oo3VcGF4y7xS0h6QU0DzqRT7tWvkF9LEzN+hRwC5M=; b=pyilPh/ha9GKYD
	UUgKBw4zw1w19Rai3HJ8CPhdIu926WTx4LjU9WYdDol6EvZQmiEnmRndsyaTOWdOs5qnHpfsaS53F
	eQMMHjD6i7m/L2Zy83wu74BYeS9BumzRh4JxrQXyqx5Zsph+KvWFgMIhEibTHKN2Wj+ysHQtZQimT
	xiLWli0pZOGEOjjzKMgJz5cfBx0/5haOLVd4SVOuhKlcTT26Js2rTQRzrmTF7M07TAuAa1dMOzMCh
	AxztADNCEi3ZKcEHpE1nbhylMZnZxb/hOoBZAk+YN8D0qdilEJE1XvXvskfNSvWHELUiHPdDWokNU
	G7m0MOqtzFWftTiS+NSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfFk-0000000Bvzl-36OT;
	Fri, 02 Oct 2026 15:32:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfFi-0000000Bvz3-1sYz
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 15:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790955169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kM3irjUs3GXfAQv16un+h5EqRZdho/ZwJo9GcwW1/Ao=;
	b=R4wuzT5PEdG9N8qGKSpYCSfipEVortrDSgmXgdhjv1BA2SWJTc5+G9+JdqFwk8rKHQbt4W
	zADmSPKWMuGAlQfKZBXYzJWmxX0OGrVr2mlb8VzYVCwYWTLlvjGlsuboQfFTFuaCWGaQQ/
	wjhCSiW/Fd246CZCojKt1GoZahkcIiA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-9nxyy4r0O2OoeEySi8QyYg-1; Fri, 02 Oct 2026 11:32:45 -0400
X-MC-Unique: 9nxyy4r0O2OoeEySi8QyYg-1
X-Mimecast-MFC-AGG-ID: 9nxyy4r0O2OoeEySi8QyYg_1790955165
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8ae5317eaaeso11681097b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 08:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955165; x=1791559965;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kM3irjUs3GXfAQv16un+h5EqRZdho/ZwJo9GcwW1/Ao=;
        b=CmDjoB5aFcSvVOkNyylh9d+369EhB4K7aHQcoGCJBoZ8IKVv18OjUi0gZnW/L+Wcxn
         YCLT/WTzmEOl2qP4KtvVSTcodQysJcKWMwAfiLU4+rpmYQIQuSjrnLGbeHWCdd3yNsEm
         97/iFb9vWbgUaeDo1BdkGIaTf5bAwxDVqhCIHZINNR4C2m4oQO5GtFloq6PIQCdHodVS
         NnhSCYllVFhe97jn0sIt/iDWo5obEVXLb3YWaxrueVnUFHkiCuVoYfGrf5AcuOhbt6u2
         +dK9Iiw1txoUy/ql2sakYMFXvWDYTaXQw+sFv/kHeY8cT2BySGFCLKN/aci5c5Ogpujj
         ekWA==
X-Forwarded-Encrypted: i=1; AKwUvBwQhyTQMz/35O6Aue+rhtm5h6XtRDdEuqECkSLgYmcP3ex36agau1/0tCKdfKJcvFn8COzWuC5gfIonbw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIlku/09Tb7YO4eNQ6O+w0SHAVC0jt5618277jEwfcG0EcMeRJ8
	YmjV6a7YuKXEYJ6VoyJOi/t0yp0ouhRHoMQSkhqtmtMech5fZsOTVQWVDgXeoxjGBPIcU8H4+xm
	BFoRuhMsV0gmC5EcYb3OGGWoryNM6COa4OASWQltOLK7aRqPuGH1ebEPczbWEomQdjLoonA==
X-Gm-Gg: AYBFou1o9UkvfQtNnWcEx4ZgwWPbhnYFMxk29ihMxktCqGM4CsMHSB1rEbmFw39u0kL
	BZAVUyi8uue0QNZB2D91ie/28dL37Fvv0nszNiWAAVyJM1eR1ePKNC6kumqXtbYuu6ZI0d1maM0
	J7qIOVea5uYSYbZDDZtlkwRLEbBJRqFck3Mb4rOdMHKxIBvNXe5N32tEgBq+q54uR1CHqKP4LQo
	Y7gsLOQMV3DRe3H2gIIu1DvaYzVAVPi6/tABHLPXMJEa/LkM/L98kbMSVOJ9rWpBXIfZqTE5be6
	ZAakO9+opSSm5KdxLfK5h4EIN2BQEoH2G7FgqAdPFWF+ioGDww1LVPwapIxVp/Q1FR0Btc3g6KN
	US0RcK1FQWK3xvMOJF1bvoefW681fgjHsadc=
X-Received: by 2002:a05:690c:c1d7:b0:8ab:41a5:63c with SMTP id 00721157ae682-8ae3b61c99emr8750367b3.108.1790955165163;
        Fri, 02 Oct 2026 08:32:45 -0700 (PDT)
X-Received: by 2002:a05:690c:c1d7:b0:8ab:41a5:63c with SMTP id 00721157ae682-8ae3b61c99emr8749997b3.108.1790955164570;
        Fri, 02 Oct 2026 08:32:44 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b682dfsm22528436d6.19.2026.10.02.08.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:32:42 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:32:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
Cc: Joel Stanley <jms@oss.tenstorrent.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update RISC-V Tenstorrent SoC entry
Message-ID: <ar_OmdW-3kWo55_A@redhat.com>
References: <20260930-b4-maintainers-tenstorrent-v1-1-bd97694822f0@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260930-b4-maintainers-tenstorrent-v1-1-bd97694822f0@kernel.org>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ohGNtsqJI3DehNA5o8-TUq1AhnZ6RETn6CsIRpcRWyo_1790955165
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083250_556893_9DD28F0D 
X-CRM114-Status: UNSURE (   9.07  )
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

On Wed, Sep 30, 2026 at 10:09:36AM -0700, Drew Fustini (Tenstorrent) wrote:
> Add Anirudh Srinivasan as a maintainer. He wrote the Atlantis PRCM
> clock and reset controller drivers and their DT binding.
> 
> Switch my address to kernel.org, which I use for all my upstream
> work, and point T: at the kernel.org tree that the clk and dt pull
> requests are sent from.
> 
> Signed-off-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
