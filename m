Return-Path: <SRS0=AFlu=PR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEAFC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 02:41:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE8B720883
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 02:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PBabOCoA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bYLzNMv3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE8B720883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruglsDm9e2MOkyEWD5YBYzb1LHH0EpRgKHmANmGVt+0=; b=PBabOCoAP7nxw8
	90Re1VeEfFeHz7m76nTxih/c+8cltYGnYxRLjfo30JsPP2FGRh+r1PFROiDyjLXmsDH1+TpiwMY3q
	HZDyZhs9ShwOI5SfnRkbg6yWaA5svL8xYKD/AWrJipMJyXT9p9T7FjVN6BcbO43+7bIyb5Im0RXfZ
	lRWJR4XlcBG/e9nuMYiToCGza1O/Pv77bdQPKChfVGWQRqlBjywmBTTLWoLgGbcE99y7D8R6uFZbv
	Ho9df99sLcM8eAP8xqsGaIwYboA3PxnVhLdnOzzeCahMkBFOl+leHkFlaZ2gD3hWQTa7fTgXOD2K4
	wX6/z5cMzEMmAh5oKLfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gh3nm-0000yb-9y; Wed, 09 Jan 2019 02:41:06 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gh3nj-0000y5-0C
 for linux-riscv@lists.infradead.org; Wed, 09 Jan 2019 02:41:04 +0000
Received: by mail-pg1-x542.google.com with SMTP id y4so2599863pgc.12
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 18:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=IehggVTjyz+ih32/hFbnAEYf+mepEQf03ljGWe/aIpo=;
 b=bYLzNMv3l2GF+cfCUMO90MzvKAUPjfRehFWvD+ds2aJJsfQc+fieMR26/IQwjzFSHB
 uMkGtrs7KnPIDODU8cc9RVCXnNtOFvQqZ7hpnI3JGQG7JgGotl+Gl8jYrKxSxQo5j+JU
 2gehuCAR5uGXUlpI2amAYtoO/17plAXz7JlCg19wH9RIiJA2Joj0Wa11iKOIlh8v4jjm
 zn8e0swrEuiU4YnlHBYfX/VroctdPUxjDJ9g2s3xtZBMbDCmfga0ayUdVxTHMuWDUKQm
 mkKdFsmOlqLm8yXQKOQqmSJoU5zMQ66UV6583ETNlysUOTjQrukw8dbIo6mbae8nSAxq
 xcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=IehggVTjyz+ih32/hFbnAEYf+mepEQf03ljGWe/aIpo=;
 b=hsvXJf2jkFog1CEO4RcAJ2ttT1k9PGnt++TeY6U+8F+wiv0HMkGCSYoxtYEl7H5KRU
 QOxkO6VcbFk3EJF7wTV5lyGFU09KnfdSIANKkJfu9IliO42e0APwixqRQ7WlY2Q0NnDb
 xx7ffL0G9zTv6DRmNztWxEuEyVzbWL6z8S9/lcM0ZwqXcrqom7wPUFqg0zmIilxnU7NH
 pjgZN3zUv22Gh7yWwn/XiUItvRl4jItv2kyMwCCyuUE5FpLRDg4VYLumTD8DnjyDfUQr
 1aeaZP8OaQyN8Pab49coSU6UXi8Op6TrqzY3QA42jao0z9OBKe+sTZsKhe2M9t3Sh3vL
 WRZQ==
X-Gm-Message-State: AJcUukcY4ELxvZvTQft+yUZvMG2BpxzwijFCKvmnPNNa6eH3Qp+vE93F
 9g5VbbcCGcCpF/0fxqVhAY0iQxkhjGM=
X-Google-Smtp-Source: ALg8bN5Vbsb8/oBeftsbq9GEma0kyGv6gIXOlpIltkU/Ceu33V1suXx/udcWTLhKRi1vl9nFyRAtlg==
X-Received: by 2002:a62:8949:: with SMTP id v70mr4115375pfd.85.1547001661779; 
 Tue, 08 Jan 2019 18:41:01 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id b202sm138201921pfb.88.2019.01.08.18.41.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Jan 2019 18:41:01 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Tue, 8 Jan 2019 18:41:00 -0800 (PST)
To: G SatishKumar <gsatish.ldd@gmail.com>
Subject: Re: [PATCH] RISCV:Kernel: Cleanup RISCV Kernel header files
In-Reply-To: <1546434608-11183-1-git-send-email-gsatish.ldd@gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1901081839030.11080@viisi.sifive.com>
References: <1546434608-11183-1-git-send-email-gsatish.ldd@gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_184103_075341_EE9D851B 
X-CRM114-Status: UNSURE (   7.45  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 2 Jan 2019, G SatishKumar wrote:

> 	This patch cleanup unnecessary haeder files
> 	from RISCV kernel files
> 
> Signed-off-by: G SatishKumar <gsatish.ldd@gmail.com>

When applied on top of upstream commit 7b5585136713, the build 
fails with errors similar to the following:

arch/riscv/kernel/cpu.c: In function 'riscv_of_processor_hartid':
arch/riscv/kernel/cpu.c:27:7: error: implicit declaration of function 
'of_device_is_compatible'; did you mean 'file_ns_capable'? 
[-Werror=implicit-function-declaration]
  if (!of_device_is_compatible(node, "riscv")) {
       ^~~~~~~~~~~~~~~~~~~~~~~
       file_ns_capable
arch/riscv/kernel/cpu.c:32:6: error: implicit declaration of function 
'of_property_read_u32' [-Werror=implicit-function-declaration]
  if (of_property_read_u32(node, "reg", &hart)) {
      ^~~~~~~~~~~~~~~~~~~~

etc.

- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
