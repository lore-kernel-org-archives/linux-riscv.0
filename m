Return-Path: <SRS0=5cCT=UZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACAEC48BD6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2019 17:18:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA4B8208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2019 17:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b+cTJkHY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FZHywVjb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA4B8208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlia2+30ZUTUUQrhYEhAfccBy7uZ9Q4/AqXHd5nKbq4=; b=b+cTJkHYG8Bi6O
	WTka6q3v0NJJA7QkZNpFecltN7OCLty9iBPKc4aR+qhIlQ+wbuC3yMLrBvE6M827RXzlhaA4axzXe
	au9uZokyp+POzZnJL4hsyRuQT/5M3U7m8Qx/2U4mv2zvTWI8e/pLeDJkvlzSB8e0U66TsoeNXAUw4
	x4D388+2syXlFXXNGaJte2kH27r9/v8/AhFL8CefkImfs/yvmhiKMxzMcbTE4I0FBJUAT3yOiK2ym
	OJmDbAmem66F+zszcHHmRUKGa2Jlj3RjF14IOVaIf/3sBLWPY//szolI42I9R4RLJLNrQ88yA2Fsz
	Vtd1uHJ3/tnUaT7YfDTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgBYQ-0008AR-8z; Wed, 26 Jun 2019 17:17:54 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgBYO-00089s-48
 for linux-riscv@lists.infradead.org; Wed, 26 Jun 2019 17:17:53 +0000
Received: by mail-io1-xd42.google.com with SMTP id k20so6703229ios.10
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2019 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=6L/Rw1TmtSu0irnChl8uYiHYCio6vXXAED92CPJLKoU=;
 b=FZHywVjbVkeWrIkCV+xiXPo3fjaeped6kHtWHfztZ/OTj6D0QHpt0akM7A1W/XAF6K
 QM1dXoJA0p0GrIcZ5hNdyVc4aWqOaSo5O+weWxH9vnW0NvsakQ+cEWqURqDz3HeHFHAI
 bNje/gOroYdYEiFob6sTqILL+HDz06zmNGPAMKjuXUdvfg3+Ix+pSOD4xb5wETHDb9K/
 dOZk6Wz69K5S5xOFy+ftQSirhh0vVl7XBK8/I3qJZTyoUJB3t1QXjCbwWj9EGvhmxPFX
 1wuLNnudTsohOf8XmJfjf6WlVBRbIjAq7KYzb9qQSV35i7Wic//4KstBKh9q2f90P1Wv
 2xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=6L/Rw1TmtSu0irnChl8uYiHYCio6vXXAED92CPJLKoU=;
 b=rLbUmJfwX63OrdC9DKlcs8ef5DwmK3QdRAnWHi+MgrdWWPRFwMuButtdK5Lqbyq4jl
 8KIM0p7z2OXSnirFeS8DpjSLKAq90FKlon1Si2ZXZ2AiHsMblYCTgJauTHsJkc/goDQV
 Ee6dqYn+GssfU28DxUZ+RjHO9BzZRYMd0ggxsqa7vfx0fKn7c35c/JPAJ/HaMoxXmJOa
 B1mYZ9opb5LIre3QFe75jNLrXqpBp2Ezzx7B6ELJr8vn+1vokncKAFmMN/T4WE/6/+J1
 ArPc0nUlFNYho5inW2FolSTZkFDYC5SCl61/CHkz6q1eKvzm3QAKwYtwEXz+ecGNaOAJ
 LwIg==
X-Gm-Message-State: APjAAAVvebD6JLMimCA9A156yPaV+pIzje3grYU1ZhaOkgJnJ2niI6TZ
 EvN93q9kXXsdw4hJG62od3p9HA==
X-Google-Smtp-Source: APXvYqw1vJWe2EkICIcrPY4XcXwQ8Nmkol8uEoRBcjOnwhP9llx5nWzO1x2a5UkvwKVxMcAeTwAN2Q==
X-Received: by 2002:a05:6638:40c:: with SMTP id
 q12mr6302456jap.17.1561569471364; 
 Wed, 26 Jun 2019 10:17:51 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 c17sm17421210ioo.82.2019.06.26.10.17.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 10:17:50 -0700 (PDT)
Date: Wed, 26 Jun 2019 10:17:50 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: shihpo.hung@sifive.com
Subject: Re: [PATCH] riscv: mm: Fix code comment
In-Reply-To: <1560850755-3532-1-git-send-email-shihpo.hung@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1906261017240.29311@viisi.sifive.com>
References: <1560850755-3532-1-git-send-email-shihpo.hung@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_101752_194481_449068D0 
X-CRM114-Status: UNSURE (   5.58  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 18 Jun 2019, shihpo.hung@sifive.com wrote:

> From: ShihPo Hung <shihpo.hung@sifive.com>
> 
> Fix the comment since vmalloc_fault doesn't reach
> flush_tlb_fix_spurious_fault.
> 
> Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: linux-riscv@lists.infradead.org

Thanks, queued for v5.2-rc with Palmer's Reviewed-by:.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
