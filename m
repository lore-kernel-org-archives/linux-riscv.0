Return-Path: <SRS0=0jWI=WJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8154EC32750
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 15:00:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529F9205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 15:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TDVKAI6o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dzbIYMoR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529F9205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txj3eeSuQHsDkqBAy2mg2zEsh7kc2O+H+dzvLIVQA/c=; b=TDVKAI6oDa9IOu
	CnI7MRcX9Hwid7FLgUcH/W+6c6c9XxaMBK+j72YcCixZJI5HQZCcS6dkePhQ9SWjvq+YMQJO5hyUl
	WBhv7u023+MhkTDhP9axDWzOggI+05wTyh2ivsZFGyCh7MgSmUUmsq95fp43cIuJsA3bQRz2SuYef
	T1pRqOQvjN+58MUCYR+21Wq9WpU+Zky420TXPEy4V92H2555LFkXtnI8nBmWgDA/HR+X8XNzTdH5Y
	40MTtAoV9uZfODhWf2fK8QLfp2U2wHKfkMIR46+tj8GzC/119IZvwW/h0Cb7FVBVRiQI2Ej+wWwMs
	Esf3UabmR4RUFdtYkmRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxYHm-0000CC-9Z; Tue, 13 Aug 2019 15:00:30 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxYHN-0007Mt-7D
 for linux-riscv@lists.infradead.org; Tue, 13 Aug 2019 15:00:06 +0000
Received: by mail-ot1-x341.google.com with SMTP id g17so22638314otl.2
 for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2019 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=OBSBHOWBi0TEv/V0/1s9tAyHS9rLQ+x44wNZD/HrkLA=;
 b=dzbIYMoRiy9vx9rKEBuPcH/mGrArbJfiwJ7ot057oEwafi1mYopo5TS45ZGfU2Tmwe
 SLBPqgIMOrEkCecn0w57P/yGOR/d0N23xNAgHwxYLkMRv5H+NhgbobUFp2ICtHe5BRH5
 GbIm4qBk6hMIm+NPgLSYJgtDYxGY7QDf7AIpMTT6sktBJYnpLjG3FK3zI1obJ75IUzvc
 CwZwYPupTtwIOGSkKBn71MZLcIk+Gw1yi1TZVHVhBvmHg6zL06/3TKtlmSTECtHfpSl+
 SYIopnbJP7tqKWRjn6KfBfDEEk9A3lazC9zFZFqtAQ4BKm6TdFY1hy6XJ1fekCbmULHI
 RG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=OBSBHOWBi0TEv/V0/1s9tAyHS9rLQ+x44wNZD/HrkLA=;
 b=GT9y03gfhCdWjZinCRkWoYJJiyuyvzir3tSSzW6LDUM7C68wRomuMCTKy6xIaIHCeA
 7/ABjF5B7mCLFLHlZ6E0eNRyxoEli3o+JU+Af0HAYXdMDU99Td3e2y+cZK5quYHrGgQA
 xbJ0ixUxovQCHQL8Qo/BfYcYPl4TThoT+OpSQChykaQTm2khRS3l0UnuFdKG0Kv07G5j
 Aaws7r0vHn45FjbO9dLGKnHgaiU09e+Oa4hhte1dXZ+CPcdBdOXF2sRjhgOm5KnrThRm
 cjB3MqSUxbWAv3m15VlnckUQDa90oUh6DyX+u4k/VWXt7zOMCkFfTF6FgTseBlY8/ICh
 fe3Q==
X-Gm-Message-State: APjAAAXCFqjfRunpi5pOfzmD3ryGJTeWvtwGUDc1z9mEvoJ9jfKws1k+
 V+KupMVGxMLDGybyidsgRNaC/4CXiuI=
X-Google-Smtp-Source: APXvYqzyvc5FubiG3PND2CV+AkpmsPRzV4pLljW3e2iTjvTSUTJIOAqABu4MArwAhjoI85WgQ/29gQ==
X-Received: by 2002:a05:6602:2193:: with SMTP id
 b19mr35481897iob.113.1565708402482; 
 Tue, 13 Aug 2019 08:00:02 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 j5sm81309698iom.69.2019.08.13.08.00.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 08:00:01 -0700 (PDT)
Date: Tue, 13 Aug 2019 08:00:00 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] riscv: dts: sifive: Add missing "clock-frequency" to
 cpu0/cpu1 nodes
In-Reply-To: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1908130758550.27195@viisi.sifive.com>
References: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_080005_335049_5AA94A65 
X-CRM114-Status: UNSURE (   7.61  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 6 Aug 2019, Bin Meng wrote:

> Add the missing "clock-frequency" property to the cpu0/cpu1 nodes
> for consistency with other cpu nodes.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Is this being driven by a schema validator warning?  If not, and this 
property isn't required, it seems better just to drop it.  It seems 
useless?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
