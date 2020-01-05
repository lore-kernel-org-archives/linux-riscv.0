Return-Path: <SRS0=cU8Q=22=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AA0C00523
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Jan 2020 08:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 760202085B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Jan 2020 08:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PypWFJzi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 760202085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7gKlsHI6XdpwzHZfq94WxoSBokfyyZVY8RkchjYRflk=; b=PypWFJzi9AzyT+kyKTlJhJWAw
	57f16jY4d1VrQ7uU+QAu09Qb/g7qbQh8nlIdBPRJ6WOCsOIj+nM+2z9GOVhI03UtSIxtsIvBQ8u9D
	8x9SeIS/GAx/O5snl7gGGrKnzxqTfJEaNHtODxEsYnPOA0oMA0efIDb/oKM5Dx8Bl9meF6VTWuLM7
	7nBPptpm21jbxozp3jhzfrdSJG9HSqRyJ8QU+evrqB8lsrBJpwKXqSd3fGFtO48MDHsPouqeVSRlY
	IqEqBUvw+YMel9sbI1nQObHqiGL7mA+vEKmg8hLBYg2jjwXpnTGaJycT/RQ4j3cN9ONVaOTIqwMv8
	PHwktOExQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io1Rj-0004HN-O7; Sun, 05 Jan 2020 08:39:39 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io1Rf-0004GW-4J
 for linux-riscv@lists.infradead.org; Sun, 05 Jan 2020 08:39:37 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47rBrt2jPnz1qql3;
 Sun,  5 Jan 2020 09:39:26 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47rBrt1Dkgz1qrjv;
 Sun,  5 Jan 2020 09:39:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id oMzHkyaTNvkK; Sun,  5 Jan 2020 09:39:24 +0100 (CET)
X-Auth-Info: +JI14q7M2PNLVqZ/I6XWB6XjdmLUJ9plZ0uoorJ1IXaHYIJ3OSz+LF8MHwk9ZBXv
Received: from hase.home (ppp-46-244-163-176.dynamic.mnet-online.de
 [46.244.163.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  5 Jan 2020 09:39:24 +0100 (CET)
Received: by hase.home (Postfix, from userid 1000)
 id AF7D810377F; Sun,  5 Jan 2020 09:39:23 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: guoren@kernel.org
Subject: Re: [PATCH 2/2] riscv: Add vector ISA support
References: <20200105025215.2522-1-guoren@kernel.org>
 <20200105025215.2522-2-guoren@kernel.org>
X-Yow: Yow!  I'm out of work...I could go into shock absorbers...or SCUBA
 GEAR!!
Date: Sun, 05 Jan 2020 09:39:23 +0100
In-Reply-To: <20200105025215.2522-2-guoren@kernel.org> (guoren@kernel.org's
 message of "Sun, 5 Jan 2020 10:52:15 +0800")
Message-ID: <87o8viwb44.fsf@hase.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_003935_323379_B0778095 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 Guo Ren <ren_guo@c-sky.com>, arnd@arndb.de, atish.patra@wdc.com,
 Anup.Patel@wdc.com, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 vincent.chen@sifive.com, palmer@dabbelt.com, zong.li@sifive.com,
 paul.walmsley@sifive.com, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org, bmeng.cn@gmail.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Jan 05 2020, guoren@kernel.org wrote:

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d8efbaa78d67..3d336f869ffe 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -286,6 +286,15 @@ config FPU
>  
>  	  If you don't know what to do here, say Y.
>  
> +config VECTOR
> +	bool "VECTOR support"
> +	default n

default n is the default.  Did you mean default y?

> +	help
> +	  Say N here if you want to disable all vecotr related procedure

s/vecotr/vector/

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

