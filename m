Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41269C31E58
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 11:34:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 173CF2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 11:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uIk/AIU6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YaXNNhpE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 173CF2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZjI8uqyk6av/IgMGN3fL+0gOHuT+D0BSVICZ/zsoFA=; b=uIk/AIU64n/SMy
	mDSeCjFN2MOVJs4xfi2mzVw4XQXAWH6xkjMVjXh8CwMpCfmgVLTxh3F5hV3q/iDKHm2eavMIR+aQu
	W/7tbWiEmBHXQ+DXzUP4sT4mM7njB57Ax46I5tHS7NcsLnv+eOVH53RRH4ms5s9NCY4X6x45yRKkX
	ylvWSN8/rdNITKxkhRNRsYGyQpoLSYGQtFoZxmx4q6mJDKGTgDp7qtXm5YSG+othWXBCpz5uoXpLm
	o9Bz6adRLuwHAByAmBWaW4feAo156rsNHVwSkv2sfV2iDQNa5CB9i/q/EiNg1ngQ7twbXYbBbIlay
	bGEyXeIiXJYgqVRZmdXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcpuD-00062h-NX; Mon, 17 Jun 2019 11:34:33 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcpuB-000623-Jl
 for linux-riscv@lists.infradead.org; Mon, 17 Jun 2019 11:34:32 +0000
Received: by mail-ed1-x541.google.com with SMTP id s49so15729162edb.1
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 04:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=9vPSLa5+XLyQJw19zpdaml7fRJQhxguAtOgI7YT73oo=;
 b=YaXNNhpEEHuGAVVYKiFjcIjtnlRn+SX4KK6cHn4Pg7lywkMBTaTfMWwp9ZftE10ZTr
 nuJ/UU47huRRPPSztqkz4DT7OKeZiKaT3eRLIl1roljXdiZqjxVtFlg3kLPfsMBLX4Un
 7ceatCqEab2IpD+LDjdjSxFc3CPR7yAI7ByqoRuTM6zTdeKEHebGRoQcAkX8h/0DLvtx
 mU1LmYOU6smRlrahMdW/qJObnQsEC/dU3qrlVLLrj1wviK4LfngoI/syjUqsbWjuk/se
 mN/ZqzvXU79WwIu8OvQHKDBC0nfBXRps1lnFQdEllgWHSwdSXd1mJ+KOqrNNWMbWO75W
 khiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=9vPSLa5+XLyQJw19zpdaml7fRJQhxguAtOgI7YT73oo=;
 b=TIVN7AmAnqeMmuWR3jHeRDvngLNaEpB20cEAbzcE/dTFusnYxDUw3JDrssqnhBsXlb
 MbDKal6MHlyiM9NOvsYsOfnDhcy2hJYraWq1iw471oBm3a5PKj4i4TDRDnBjiMwnFZOO
 xyhiylGcofuhPSNsehw51HltZEzYg830Gfbw4mx9vJp6v1n+lVBtTWRtD8FASIA82Eu0
 W15RXiUuSl2IIionfpSDx2UNiN0VGg0WBc1HqPF+9wEfAmKCKf0KEDK7XAwgXQOfzFQs
 eFOqlRmbPTH5rHGVA7fOVptGY7UOmanPrPBNiu0jogZbDnaCLRMEBU40Q8axuDzddID5
 W/qw==
X-Gm-Message-State: APjAAAWmu6u84Nq3CJ0hLSovHqFFidOth9bkiYSZodfczxe0b/5ZpgIB
 xBa/pN+bnLdbp/GOyReKga+I3g==
X-Google-Smtp-Source: APXvYqw1q+5ssz4QySIjZc498AMwl614ceV96qiEMFWPDNSLJ7oh7ctcvwS8zNJc5j4OHthaIvZI/Q==
X-Received: by 2002:a50:d0d6:: with SMTP id g22mr46189168edf.250.1560771269879; 
 Mon, 17 Jun 2019 04:34:29 -0700 (PDT)
Received: from localhost ([81.92.102.43])
 by smtp.gmail.com with ESMTPSA id s5sm3434216edh.3.2019.06.17.04.34.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 04:34:29 -0700 (PDT)
Date: Mon, 17 Jun 2019 04:34:28 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
In-Reply-To: <mvmh88o5xi5.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1906170419010.19994@viisi.sifive.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
 <mvmtvco62k9.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
 <mvmpnnc5y49.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170305020.19994@viisi.sifive.com>
 <mvmh88o5xi5.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_043431_677096_03A9D07E 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 netdev@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, ynezz@true.cz,
 linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 17 Jun 2019, Andreas Schwab wrote:

> On Jun 17 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
> 
> > On Mon, 17 Jun 2019, Andreas Schwab wrote:
> >
> >> On Jun 17 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >> 
> >> > Looks to me that it shouldn't have an impact unless the DT string is 
> >> > present, and even then, the impact might simply be that the MACB driver 
> >> > may not work?
> >> 
> >> If the macb driver doesn't work you have an unusable system, of course.
> >
> > Why?
> 
> Because a system is useless without network.

From an upstream Linux point of view, Yash's patches should be an 
improvement over the current mainline kernel situation, since there's 
currently no upstream support for the (SiFive-specific) TX clock switch 
register.  With the right DT data, and a bootloader that handles the PHY 
reset, I think networking should work after his patches are upstream -- 
although I myself haven't tried this yet.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
