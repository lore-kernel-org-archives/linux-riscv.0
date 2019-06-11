Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CADBC4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 13:54:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70C39212F5
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 13:54:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="un3IU5H3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Bhoj3rcW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70C39212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJSkqB0OWyekq9jEc8+8s1w5xYqfG5vNXbmZV09GNn0=; b=un3IU5H3DEWK8s
	1MmsbLQ3nHfJ08qdvycrB7xEeurqWg09D403FAO3h8NiF9Sxkdr/+omGc0oOyXE96IGgu4qxpVFGO
	4i7iiRXKgqVF01oxTXPXjyTNvMpy0Tqc5wLPFypQQ/2Vubz/5IDmrNLRH/K8nUgKkDxDba/ccBhCp
	I5rbuGvW/3nfzKzZg2KfFkHQlDTS7S/K0ICi4y5uvshK9UaY/QpUIyk26Qa4gO1V7465Y5J9nprAT
	LPoZMbTUS5RBQAFnKAQGgWmd6iEtFst6SVkZ1Q8DvfdQLdwJgM99uo/ntlfDpYaQLjB8eVjjTcHPn
	lL8FRfrOsVSJ8pJT4mtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hahEG-0003dh-Og; Tue, 11 Jun 2019 13:54:24 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hahEE-0003dO-DT
 for linux-riscv@lists.infradead.org; Tue, 11 Jun 2019 13:54:23 +0000
Received: by mail-ed1-x542.google.com with SMTP id c26so20264451edt.1
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2019 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=OwF5NeeRbER1hXIDxCw8LYzjbLkOqAD6lkS2m+++4K8=;
 b=Bhoj3rcWetlFG0+auMFsa9MqnZhD4vDQpm+ka/S/h9k1lfu7dF04PLl+N6vCY7f6xq
 ZQJRP2BoA/YIwSKquiRCNNqPgPNP1UJPefRdyM3Fq1fcMXPP5PC5MJQ0aEk3hCbPLqNA
 lbNbUUoCKPKl0uPt4rL6w+0+UiGGSCyuryDFlep/lST0PX5FQzL++UJSJihuwa3ETqmD
 /qjOfUsIdqdMm0Uo/HN30F0l08te2885fWCKQq3hDzfT5vGTFQcND8wRiYyaVCWHCPoR
 MlIiTS7P+9/4MNn6O2o5f0IWC+hlWABVZmGbOBpukOpS3Hhk9zBL+5B+ncO9xf/faxx0
 SfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=OwF5NeeRbER1hXIDxCw8LYzjbLkOqAD6lkS2m+++4K8=;
 b=ffXRIxD98Y/6V7DJ7m/34Y4TDqd9dWKcI3ncOAPj/fEmu0c0qAgX6SaFKoGWU5ad1e
 3PXwMxU/gTRUfe+w9AGl/mGF5uKyHBFiQ2H2pXHjIQWCvd8sIfavTfVBlLd0cOpoxxdt
 QqQUrLOqulGeHebAS0FGr/j9iytKSlT5RN4EdeLzI8W8q+7gMxQkvdGvmvqLfLdp9HUy
 VsToOENbUVgph1oTeg3yXWkfZQvV1aEKMQpZq5uzt8XYjCW4BQNziqBHNpzIDwu1G9SL
 HS+bx88BmA9f7jzdJrcELs8IzSjHasTcNWAMxHrExFA/Nr/btZ7yoWXo7uAscxpHcV92
 BjRg==
X-Gm-Message-State: APjAAAWiHeE6sk9/wqtES+2Eg0O0ZKq8eGJiMod38cPlNxZyZFrkFrDY
 ZUg877wtTm6wGjsykc7GHHxwnw==
X-Google-Smtp-Source: APXvYqzch13cw99ei2RCJ5FQmcD+gc25kVoOGOhwHdmPcbNV7vMBuyWtb90FoMcMij5SvlgsYTFNFQ==
X-Received: by 2002:a50:9832:: with SMTP id g47mr1631146edb.282.1560261261045; 
 Tue, 11 Jun 2019 06:54:21 -0700 (PDT)
Received: from localhost (mpp-cp1-natpool-1-010.ethz.ch. [82.130.71.10])
 by smtp.gmail.com with ESMTPSA id f26sm3672467edm.11.2019.06.11.06.54.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 06:54:20 -0700 (PDT)
Date: Tue, 11 Jun 2019 06:54:19 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] riscv: export pm_power_off again
In-Reply-To: <mvm36kgpg9z.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1906110653370.16050@viisi.sifive.com>
References: <mvm36kgpg9z.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_065422_457660_A3207467 
X-CRM114-Status: UNSURE (   6.01  )
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
Cc: Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 11 Jun 2019, Andreas Schwab wrote:

> Commit bf0102a0fdd9 ("riscv: call pm_power_off from machine_halt /
> machine_power_off") removed the export of pm_power_off, but it is used by
> several modules:
> 
>     ERROR: "pm_power_off" [drivers/mfd/rk808.ko] undefined!
>     ERROR: "pm_power_off" [drivers/mfd/max8907.ko] undefined!
>     ERROR: "pm_power_off" [drivers/mfd/axp20x.ko] undefined!
>     ERROR: "pm_power_off" [drivers/char/ipmi/ipmi_poweroff.ko] undefined!
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>

Thanks, queued for v5.2-rc, along with a "Fixes:" line.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
