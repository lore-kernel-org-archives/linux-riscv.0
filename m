Return-Path: <SRS0=E7Bo=ZP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9308C432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Nov 2019 02:54:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA4920714
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Nov 2019 02:54:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qeiAhHI3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OEVUvHct"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AA4920714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMOFIIEu+kUveie8SUXG1MuVANSgZB4naymiRtQh3wY=; b=qeiAhHI3Kny4Fx
	yWFKBGfYLli1jJHflOkj5ejfeYvEnExmjIi+fkNi7GB3zlspnYps0YGv82WDbj0ogXhE28SMtZT6p
	WiK3X5I9dmjOc/2ADfJ2rwkpnB+LaB0FuiBNfArMzXuTZIbg6n2A/k9MihsTbRD4kSpdxkqaJ7e7R
	Imjjysp+f8zl9Fd4I1lCpObAncEaJAEBwpp8Vi/w1ftQkg2jeqYFeXist+HikpxZ1mzhxO27Er2X+
	M98dxV7n7sogeytUzsoceFGzDkEc+uoBaViJqLyHCQk6c8lKYzJsc8WzHV3lw+geSOz0Xywrzc/K5
	MqOzG1dN9eCg6vXEIPXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYLZB-0001jo-Jg; Sat, 23 Nov 2019 02:54:33 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYLZ8-0001jU-WB
 for linux-riscv@lists.infradead.org; Sat, 23 Nov 2019 02:54:32 +0000
Received: by mail-il1-x144.google.com with SMTP id q15so9051703ils.8
 for <linux-riscv@lists.infradead.org>; Fri, 22 Nov 2019 18:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=MC3L3+g4fE2SdGIULrCY9R6WE7khneKCXnJPq/KxUlA=;
 b=OEVUvHctm96oZYkLh8AQ27k4G5vrhpBaWHWF+5bZqFtSHED9KWOBdQFIu1qH4rS05d
 5SHmCtE7+IrSy8tUpHyOLsRmS0jPFmDpl3B/d/C/WlNPyIs7woMy+LaDchiqBJQe462C
 0V74fLDiKWGF+jmID3rqVCB/osqNhqEkBUGgCvAPGAD16E9KKJgDddhO1l8hl5pfi7bl
 LFwcvfY4SFRhS/DyZSJNOd35wkeJHQXJ9o4yyDINGMTBwif28UypY07J/Vq9gQeAPO4P
 +RBI2Zho7FXyNCnUg9T6aRBsi/ALhmt0PdyDC20RhCB9rIVW+jfFOipnM7gwdBrPjyyI
 aOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=MC3L3+g4fE2SdGIULrCY9R6WE7khneKCXnJPq/KxUlA=;
 b=oWlZ5SnMm4GitU2Rj1wqHUTHWq69j/4x5WkI598SuMMvDgvjJULxi9+W6dxf5EDgeA
 Un42DAQ4r2H3LeIhEEctkh6PQTwXmJLGHmrB8+OmcpP1wX5W8bOIuWJ81KQnbgCoKCuU
 4mVMq7cL2E764OlWQ1n/AunNkDiD5CXX+GJRxXdMyqz3PcqPFiyfxSmxjU9q/DpeV3ea
 K/7Fhl60aGPQRdjMXW7pRCULjhlTCHHp03RAQ842Z4pdxj8w97MXWoq+H+WwYAazvywI
 1BqU/uDYzUYTyZ6erU2n4wRSIL14DWwgJHk60j5eTaz7I/MqpXScgpSgujVuoBKMs0K0
 J/PA==
X-Gm-Message-State: APjAAAVBiwE9Ym2tYWg4rv7rXs/et/wCR9ngQtsvT0PkothNro43hrlI
 G/D+tqFPdszWyaSbSSFT/oJcww==
X-Google-Smtp-Source: APXvYqy3HVaSl20zc1qqbqMRrnhYCX7IWgu8LVF1nBLwGAVHoyxX5ZpUhuQQBFFD6IU9TZmK6AzqpA==
X-Received: by 2002:a02:1d04:: with SMTP id 4mr17858910jaj.48.1574477670042;
 Fri, 22 Nov 2019 18:54:30 -0800 (PST)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id 25sm2763492ioe.6.2019.11.22.18.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 18:54:29 -0800 (PST)
Date: Fri, 22 Nov 2019 18:54:28 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] riscv: Fix Kconfig indentation
In-Reply-To: <1574306457-6251-1-git-send-email-krzk@kernel.org>
Message-ID: <alpine.DEB.2.21.9999.1911221853330.14532@viisi.sifive.com>
References: <1574306457-6251-1-git-send-email-krzk@kernel.org>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_185431_064717_92809338 
X-CRM114-Status: UNSURE (   5.33  )
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
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 21 Nov 2019, Krzysztof Kozlowski wrote:

> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks, queued with Palmer's Reviewed-by: (which I believe would apply 
equally to this version)


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
