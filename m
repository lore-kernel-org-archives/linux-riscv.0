Return-Path: <SRS0=AGdw=U6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F95BC06510
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 21:15:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6820921479
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 21:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X2Dn3pUb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fnCLpA3P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6820921479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qwka+ymlInjlWnYJ58XZJYC2zND0AZSeEkgzzHY9zQ=; b=X2Dn3pUbvgScNj
	/UU6SscYqLY23fRici4fC/xZdNdcks6B3cw5mvKXZIF8uO6SCF50qx91f/UEXxqjYUwVJxB19KeRV
	p99Fox6g/ULJSsa/TnwsOUVzd7q+uZhm+3fJgqn+SlGKUFE2PIBFLdUCTuuF6n6Pm9rbEuZB657LS
	fLz/Mm72N4DQ6gJBIY+68YYM/6336RJNDV5PUoY+86xF1bp/alpzO8sSv1h9DzTku8dYzP2B4CqKy
	JeQPYDr33xzIQt9ln5YxmaxHXDn4/7t8ogOfcfnVxk7AgP/hBP/RysAdagQkuTy1aIwIfD7otHrGq
	VzD/rDK9Cr/ZdUaDoyAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hi3eX-00061F-7B; Mon, 01 Jul 2019 21:15:57 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hi3eU-00060b-96
 for linux-riscv@lists.infradead.org; Mon, 01 Jul 2019 21:15:55 +0000
Received: by mail-io1-xd42.google.com with SMTP id r185so32123398iod.6
 for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2019 14:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=a5ZhSFhZxBdLju3tQkiTCWkSZRpiCbvjfP/tPOAL/Uk=;
 b=fnCLpA3PG2kMCVNRsV6ZrFzmWBf/K1XrjTfF4DFj/YjSu0P7yFq7p5Bsw02q15l3b2
 R3yN4d+nVuuGDO890+ttIDI17Z7soQWZZZNzZys9acpTJwCPADRZzRKNEPsFHDX2yGzp
 7DNtbWErvgh1YS+jP4YFCik0PcunOIXXPzQ/QGTeg0Ac58Z/UpfX8wkdJJ4d3oLjY8c4
 DSFVr6g1uzfCYnyL/0qqIwalVnIaOyLRRXrhQwl/z/O0WDFUFmrq25B8r9W1x1O3iNzN
 CBCJuVCh4pvN5Jtmkk25cmLISrDGEfR/1rJ++eq8jqmSIDBg0H8VUF7vsG9HjBNTh3wv
 PpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=a5ZhSFhZxBdLju3tQkiTCWkSZRpiCbvjfP/tPOAL/Uk=;
 b=qPpz+vb7J/1C6Y1uGvVCc/F0LUZaEIQcpeSdaLYMUbB5yAcNs7bMbbgmvxREoGkpdG
 mF+l5mAnj4SeKY3xO/dF8Px85U3slmPP+fADYiIrv9gQxxuHl/GyFpSp5yaBnLh7KKFe
 NCVhV7XoeUXS1IGfZhNrm+XAP6niI4VgxlhpGQkSbdYUa2aVx/0LzUxTtIilWLvYh87E
 whCzX5DA5SvwWbx+VZ7P32w74x/E5IwveuWysxYPQ8LjgV9Y2Y24/yNPTEBHQric1avi
 rsbaAtjC9ki/yd6zG2lx4WrFaFFQYImA5jn14xEHsSWawp8gCtF7Qz0zdNOHUyY+jV7m
 iJ2Q==
X-Gm-Message-State: APjAAAU5LzytqhKnPKWtHpoYB6KHJ9q9c8IJHQ9w0OXWfqWCCEDKCfbC
 EuuJxLMpuUPihOV5WJbMeHJYyg==
X-Google-Smtp-Source: APXvYqz8x5IrAI3IeFq7foAQQ9qaB+xTt2PrEVlsjnRtBcKxbInsLarWM+ycJMklAn5HJMHqFxXU2w==
X-Received: by 2002:a02:554a:: with SMTP id e71mr30796296jab.144.1562015751321; 
 Mon, 01 Jul 2019 14:15:51 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 m25sm14605769ion.35.2019.07.01.14.15.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 14:15:50 -0700 (PDT)
Date: Mon, 1 Jul 2019 14:15:50 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2] riscv: ccache: Remove unused variable
In-Reply-To: <1561977630-32309-1-git-send-email-yash.shah@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1907011415280.3867@viisi.sifive.com>
References: <1561977630-32309-1-git-send-email-yash.shah@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_141554_329525_F476C156 
X-CRM114-Status: UNSURE (   7.59  )
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
Cc: sachin.ghadi@sifive.com, linux-riscv@lists.infradead.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 1 Jul 2019, Yash Shah wrote:

> Reading the count register clears the interrupt signal. Currently, the
> count registers are read into 'regval' variable but the variable is
> never used. Therefore remove it. V2 of this patch add comments to
> justify the readl calls without checking the return value.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Thanks, will try to queue this for v5.2-rc - otherwise, v5.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
