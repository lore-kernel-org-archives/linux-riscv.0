Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5EDC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 03:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JoHgZxWFADZtkbvtjiEtiSmB/lJzc/ilybwtgAPGeJ8=; b=4zXJJTcG8mb77B
	GRVBpD1x42qcGTZIYxBDO5P1VesJDFGOqFzoUcuNC+EgbwTWssDAK3vn/gljhA7rohEC9aCswSWSy
	++twRPJ9gTld6PowdMz/jwWl0Kr6MUdyBe06Ukvf6kB0zE+NUApCW01sJ52JisacOL+qOtmPtzIdK
	LlCw9XiSY0+ia29UKJT2kHV47jxB5hQRJ1O8u3CdVPZG9o96UJFs/AG80aN7wrCQlQECetg9JMoL8
	L2bp7pqo6fAHVwWpG5WPeLZVBL3NAT/OtWhLQgA/03+4oD/06Jd2DAYfUR2Xz78HCZ2QlbL8v4bbf
	NDykT+FFNASWsb5XroxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgsH-00Hb2y-0Q;
	Tue, 02 May 2023 03:40:21 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgsG-00Hb2g-04
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 03:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:
	Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=fGOWcjl/uqCwccdmYHPReY1aipEcvrgGi4N1Hy5FkdQ=; b=Pa/fhPkl3LtR9IDTu7SRXsDAQ3
	Kt7FSdKUCBKGSLkUjUuKwuqDy6qGk6bkE+dX3gRDwYEy+xAMH+bozfWQhVpeORODit+9fEM+n9+R1
	SvH/VBt+KG6xuXfdkvyrERj8rNxhjEG46Bg2ck8G4hjSZFso+JbYl+Cj4lqAwKEXOD7OwZ4sIQ6Qu
	hmpyQBuW6ldXkP6bK68a8dsN8q2kQlR3AhzIW/xo3CWfBctti2DaJaNqRBsvfjcE5HcX7lG+OsHum
	WraB6TSjpBZdKSoUDJbiRmLvHiKO/QtB62sg+S73sHArUA1hG7rJyVw/+imgrI8YFNEbF5YECA3hR
	QE1nDkZw==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pteSJ-00F4w8-0R
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 01:05:30 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-51b0f9d7d70so2816228a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 18:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682989519; x=1685581519;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGOWcjl/uqCwccdmYHPReY1aipEcvrgGi4N1Hy5FkdQ=;
        b=0X21iJVwX4o++xGqJyzeqmOE4egyylqqMrFdl8GFUw4URCmhzwiqEXGtv3PgTWbx6X
         Ggs5EcMasuJrUTxl090Q6mEcvzcwjPaKvHOEGU1UPmAYklHiKe9b6BOMdCfGKvc0QVkX
         UaW+R113kPTSKUOO9bJKw9Ywiwh1TJGlAlYQqoRdlnjpxUkuh6IEhR/yDxAba5rN2Giz
         mTFzL1deNZ9X+nox5Tt/cK1uZBgxyRzf30nyQGZy2pWeat0xNQyg08sgn4V81B6+9gSE
         zNxpG3oeYcTq8ncCZZ/jCGskwKijag13s/Jp+Z9/AT35YTvBFbQHapIxjGnTXe/bwwds
         LzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682989519; x=1685581519;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGOWcjl/uqCwccdmYHPReY1aipEcvrgGi4N1Hy5FkdQ=;
        b=ZdQFKQIXjypjFSZsVv/0EvBpkErkkwvhHMqwOvx9Aj9rSr7gtu8aIIw4OFIsv9y62J
         T7mUx1no2tZu1UToduLNVNkfTgWmIwozfvnyrLeedTUY9gDuPMnDTxJVc4OHt6F2vrj5
         Klcqu8mjCXnQV7DugeT0UtMFPIh1rT9CxRntMHZ5f6pU0ZSntBf0HbgOcRewhNDb1y+n
         c/tjUQvYoN++03ezuKCAQ0Jsj/VX5GZyNYFcufvctI+eC96UpyT57S7bzk1+68t3RB4S
         TIujDPMg3vbyLrFScfHktcoesRpc6totoBXNKtIxsu4K/vtoyZKYrVAX4H8h+Db6q+gU
         oqDA==
X-Gm-Message-State: AC+VfDx4NGWQznAQ7bN2EdEb88L+IWA8d/YXo/N5Um5DGppAwMzHtBVG
	iYA6Qy9Vr3MKxZ7APOdKFSrlM2y5GvMONgA/Mxo=
X-Google-Smtp-Source: ACHHUZ6P0dRfMgvCYBi+Gg5gd+4m7NemyXrvpJ08uoBwNqVnpHM8RxdFXHkc2HUkrKkPO1aqrb3O3Q==
X-Received: by 2002:a05:6a20:a121:b0:f6:15f3:ca36 with SMTP id q33-20020a056a20a12100b000f615f3ca36mr21264422pzk.50.1682989519214;
        Mon, 01 May 2023 18:05:19 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a00170400b00640f01e130fsm12118736pfc.124.2023.05.01.18.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 18:05:18 -0700 (PDT)
In-Reply-To: <20230428120932.22735-1-alexghiti@rivosinc.com>
References: <20230428120932.22735-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH -fixes] riscv: Move .rela.dyn to the init sections
Message-Id: <168298679769.11596.14558462295548985911.b4-ty@rivosinc.com>
Date: Mon, 01 May 2023 17:19:57 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_020527_007919_5C5947BD 
X-CRM114-Status: UNSURE (   7.20  )
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


On Fri, 28 Apr 2023 14:09:32 +0200, Alexandre Ghiti wrote:
> The recent introduction of relocatable kernels prepared the move of
> .rela.dyn to the init section, but actually forgot to do so, so do it
> here.
> 
> Before this patch: "Freeing unused kernel image (initmem) memory: 2592K"
> After this patch:  "Freeing unused kernel image (initmem) memory: 6288K"
> 
> [...]

Applied, thanks!

[1/1] riscv: Move .rela.dyn to the init sections
      https://git.kernel.org/palmer/c/4db9e253e701

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
