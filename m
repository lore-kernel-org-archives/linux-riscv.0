Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBA4C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 05:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/YMCZwBt6VQLHXJrShRPcvHZDud7FoIlRvF7kswJW4=; b=e4GZ32IZFpqD0E
	Z+lPIA30zcSNif+IghRAq613BVMFltSpuxfJclNZEuMcjnRNE40DB+eIW8s6F8hYKqv4sTCap5wlm
	lVYCFC5LMij72qUZv5s0/OFxm8qqL2ILePWsXydVcQaszNFJKyyVOKrFzHxRUznxwfDw7tPgWpKSQ
	eKjeddZdvVChG+FgfXQQ5ShGtUg2VqcjjqaYi5wv1sSLXBP5kL3/SyvqlPxbKh90NvhY4zgfsdxWh
	kMM6G55fIBregV1xxPWbmjiEdkLwFmWPCa2oMu3rFuvof6EsstJrVGpQqT93c1vi2urO5d51VTrSt
	Jk69fmfJ1Wg+ibHl7ARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrCQM-00F4u3-Hs; Sun, 28 Nov 2021 05:08:26 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrCQ9-00F4sw-IM; Sun, 28 Nov 2021 05:08:14 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1x6D5pcGz4f;
 Sun, 28 Nov 2021 05:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638075413; bh=Ir3YT3zeL32xImHXMHm+HUkV1uXH+xu9Pk/FdYqejaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qfJt/SEuYDHvacc6G0xjNLwg1Fq717EReqm4qKjJKbJ29nVz4pRzLhvuTEs+OdzmQ
 YBtV69D9aVFvnRVlMgScH974MXYPVrPlxykIPQGi6nNOPfU8kRQpmThuzgG3a1CYgY
 78OZwIEmZp1nYVyJFPH7JKcWetX0Tq4RrwhOe1BNAr0LCbznthHDe87CltKf4hscrH
 sWADjOEt9FmXj+haWSNMnvon1BnukXnjVIZdfR+TS1YetB95pCqlXSq9QBZTNBbDdH
 rZ7A1g9OqzSsLIRp6DvBumXPrVPGV6Vae36X2F9VPlEfprs7mm6t+Np5204AGclKvP
 Nz6Jqvfks862Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 05:56:51 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Message-ID: <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211128035704.270739-8-yury.norov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_210813_793985_DCF8AE35 
X-CRM114-Status: GOOD (  10.01  )
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 27, 2021 at 07:57:02PM -0800, Yury Norov wrote:
> Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> with one of new functions where appropriate. This allows num_*_cpus_*()
> to return earlier depending on the condition.
[...]
> @@ -3193,7 +3193,7 @@ int __init pcpu_page_first_chunk(size_t reserved_si=
ze,
>  =

>  	/* allocate pages */
>  	j =3D 0;
> -	for (unit =3D 0; unit < num_possible_cpus(); unit++) {
> +	for (unit =3D 0; num_possible_cpus_gt(unit); unit++) {

This looks dubious. The old version I could hope the compiler would call
num_possible_cpus() only once if it's marked const or pure, but the
alternative is going to count the bits every time making this a guaranteed
O(n^2) even though the bitmap doesn't change.

Best Regards
Micha=B3=A0Miros=B3aw

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
