Return-Path: <SRS0=UkPV=2H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E85C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2019 18:12:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B570D2067C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2019 18:12:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oS1/vBiT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lIwMoEHI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B570D2067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FFxMC3PYXGLTX635RhtuJS+/bJjn8oTymLmuYxn8qjc=; b=oS1/vBiTTg3ApwpbWdthfY+nj
	0bTpPE3fqCaTKsiCO5J1OOy50Ed2VCa2VpiFGr2hZCxX9FVeiGOvUV3cbtIb8S8gQ23zyMgRg2sqE
	Lqbpx/R0+8U8Q36kHWHi0PpXVAkx/MJYcJW/g8rm3sjNjLrz+NH73hQWhjeFUYnLnJpMa4E8PAta0
	V8E6D/wsCsJ315InOjnlz9MVz+VYPK7C6goZQWQf+uDdj+V5JbChctmW3hhNTsp3Ff+7Ee46KNG8u
	vkWtd3v/u9z8fZztRTTjQUSv2L0Uy4/CXUNcSwWKtxSiLVLECWFg9XZHl5gnEQNIFTrVTR3GHMTka
	GbtyUSXew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihHKW-0007es-8l; Tue, 17 Dec 2019 18:12:20 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihHKT-0007eM-H5
 for linux-riscv@lists.infradead.org; Tue, 17 Dec 2019 18:12:18 +0000
Received: by mail-pf1-x444.google.com with SMTP id w62so979427pfw.8
 for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2019 10:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=FFxMC3PYXGLTX635RhtuJS+/bJjn8oTymLmuYxn8qjc=;
 b=lIwMoEHIURqj2c2oIXs3h6vLo1bB19fiM+/LWh/Ba8a5/ocnT5c6lM89BWXFRD7e/M
 W6tM0xd7Jz9HMEC0XYTE3MLnzwU/gQiWHp0+LNM3b/38vtZ5k9D7Ckcj55KH2AFBDOh+
 WgO8YBZibHEI3z3G7lDtiXGJIZw9fFohqiAK14KURzoB32WD22JrwFF2tHVE78d9rScn
 w3E5gmac8vlJJB813zDzR0Eq51CKHXw40UDI9MVKVBZtAww+7vGEv37JB8aK75jSf+5G
 v5QSPUJ9G8Pr2j1pINf88SZUeusG/IDhblxpwBFzm9rtUvccpDOFuShLfGpTczyublrx
 3c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=FFxMC3PYXGLTX635RhtuJS+/bJjn8oTymLmuYxn8qjc=;
 b=pbViveItWiWlRn0xmwvBt2UcXCvcNvq66TIsSc+GBh8B+bd51yzDAp9sPNfSXwXng0
 QOlcVkIzxuNkjpRpMERq4v3uuROfxWyAuQptRqwdnVxSFmp8syQW+RCFmsVfvGoHzC7w
 OWOEgv63+ocSl3KoEogapaVzemJrAkcneMjiGtK/bG7vICGZJaEEcWl7yT1zFhJ9TC6T
 nbKeeCJRTEdB76NX+YmGkRT3MJiLuu7u2BejyWWEgKrs4gJZo8CNblLPGJg82bSTYKwj
 hAnyCNYrDd5xrkrd29JPBf2vuhI7tm21GQvgugPMShnnUYfR8pQnTQj74jBjEENVFJFD
 UH8w==
X-Gm-Message-State: APjAAAV3oG9BEvLGn+X035UMsp8/utBeafk+aGT1+ZgLQhKMajCjH05+
 y865q/mmPcE3RC0gJWG/BQcW7PtQgBI=
X-Google-Smtp-Source: APXvYqw0pxPp7YVWQUDwbs5/jLU5FPTUD1AADWdSzAChaZemaugPTJUJH45Lwnaich3UyCYnLrBRRg==
X-Received: by 2002:a62:342:: with SMTP id 63mr23917143pfd.19.1576606336874;
 Tue, 17 Dec 2019 10:12:16 -0800 (PST)
Received: from localhost ([12.203.200.203])
 by smtp.gmail.com with ESMTPSA id x11sm27488290pfn.53.2019.12.17.10.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 10:12:16 -0800 (PST)
Date: Tue, 17 Dec 2019 10:12:15 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] riscv: Fix use of undefined config option
 CONFIG_CONFIG_MMU
In-Reply-To: <mvmzhfr5hkr.fsf_-_@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1912171012020.64438@viisi.sifive.com>
References: <mvm8snccqsk.fsf@suse.de> <mvm4kxz6xow.fsf@suse.de>
 <mvmzhfr5hkr.fsf_-_@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_101217_666994_AB5A88E9 
X-CRM114-Status: UNSURE (   6.92  )
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
Cc: Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 17 Dec 2019, Andreas Schwab wrote:

> In Kconfig files, config options are written without the CONFIG_ prefix.
> 
> Fixes: 6bd33e1ece52 ("riscv: add nommu support")
> Signed-off-by: Andreas Schwab <schwab@suse.de>

Thanks Andreas, queued for v5.5-rc.

- Paul

