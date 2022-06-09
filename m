Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8681C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 04:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-Reply-To:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sI5sZR42in1pK8/Ufdk2r4WSCIffqklMJAZit9d7Pn0=; b=WMzNUqbXZA/w2e63aYXG4gt/Mm
	hKJcjpcJckF49nGlyQepwLO6Qp19vbeNFUdOKf1phyR6NUOaBAINjiS7Pp8nbIPiP81dv8kBv701O
	Na9awHSVkjMeJ4cEYbMbZlJfX/uFQSfgPlB+EkvhdG1EzvlUSqSmRt6qAAaTcPdvCb0zsF07niSPY
	7Fhqs4h8C5zG026kjssRRr9agu3zSgRBmeuBBL9qYPF8YoZ3pOCJAfHaDCVNA183T6du0sK/w2S6I
	zduy+MSCgDS8vLlRjBb2KUeR2hmybcxKGnhZlWvhpunBIW6jlLiXMlCo9DW0b5FcY6bfUXmr1I5z6
	vS7nDsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz9Qh-00G6Fh-Hl; Thu, 09 Jun 2022 04:05:55 +0000
Received: from gproxy1-pub.mail.unifiedlayer.com ([69.89.25.95])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz9Qd-00G5zV-P5
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 04:05:53 +0000
Received: from cmgw14.mail.unifiedlayer.com (unknown [10.0.90.129])
	by progateway3.mail.pro1.eigbox.com (Postfix) with ESMTP id 909001004816C
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jun 2022 04:05:36 +0000 (UTC)
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTP
	id z9QNnnWWOVu7Hz9QOnslLp; Thu, 09 Jun 2022 04:05:36 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=c4hu/Txl c=1 sm=1 tr=0 ts=62a17190
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=JPEYwPQDsx4A:10:nop_rcvd_month_year
 a=-Ou01B_BuAIA:10:endurance_base64_authed_username_1 a=HaFmDPmJAAAA:8
 a=dShPbfN-9lO91TPQ_oYA:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=nmWuMzfKamIsx3l42hEX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:In-Reply-To:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7oizPfCnCXpicOi1usfiu5FQzBJH1HzcGmli5C//IHw=; b=fm7Mb8fB8AB3YDHvxBl8kVN9B9
	EaTH4l4MRp8+3OWu1iD9AuxKbTMuXtV/Grudf4+OXZK0XFIl+PNJyazCVSYzUlQdn4ZjYCG76s2qI
	JozYlEs+lTrBeMhVMDGN67ctKQR3keHjg7fonAdL3uDPe4xqiwJuJDKTwUlrEaYtZmtZ0OKZ+sHGe
	mQWIwBJ6I5DooQzUnXFvk4BrBvBei0tk0k9qtJv8to1I4ekjiUMGrd1rVwRD7zpLT4LRXmYGII16+
	CkWw2AGSOhkGfuV4dehQPMgwCtZfOMZ6YZVjTi1/v98c6A4FeixNO8PQurQv1JtXz8gWUJxwFcK4+
	/gbwwcpA==;
Received: from c-73-162-232-9.hsd1.ca.comcast.net ([73.162.232.9]:54594 helo=[10.0.1.48])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <re@w6rz.net>)
	id 1nz9QN-003KxI-H5;
	Wed, 08 Jun 2022 22:05:35 -0600
Subject: Re: [PATCH] riscv: don't warn for sifive erratas in modules
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu, hch@lst.de
References: <20220608120849.1695191-1-heiko@sntech.de>
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20220608120849.1695191-1-heiko@sntech.de>
Message-ID: <21e02dbd-75b0-e5c6-29d8-fc853c72aa01@w6rz.net>
Date: Wed, 8 Jun 2022 21:05:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.232.9
X-Source-L: No
X-Exim-ID: 1nz9QN-003KxI-H5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-232-9.hsd1.ca.comcast.net ([10.0.1.48]) [73.162.232.9]:54594
X-Source-Auth: re@w6rz.net
X-Email-Count: 4
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_210551_937873_C14B97D6 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/8/22 5:08 AM, Heiko Stuebner wrote:
> The SiFive errata code contains code checking applicable erratas
> vs. actually applied erratas to suggest missing erratas to the
> user when their Kconfig options are not enabled.
>
> In the main kernel image one can be quite sure that all available
> erratas appear at least once, so that check will succeed.
> On the other hand modules can very well not use any errata-relevant
> code, so the newly added module-alternative support may also patch
> the module code, but not touch SiFive-specific erratas at all.
>
> So to restore the original behaviour don't warn when patching
> modules. This will keep the warning if necessary for the main kernel
> image but prevent spurious warnings for modules.
>
> Of course having such a vendor-specific warning may not be needed at
> all, as CONFIG_ERRATA_SIFIVE is selected by CONFIG_SOC_SIFIVE and the
> individual erratas are default-y so disabling them requires
> deliberate action anyway. But for now just restore the old behaviour.
>
> Fixes: a8e910168bba ("riscv: implement module alternatives")
> Reported-by: Ron Economos <re@w6rz.net>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   arch/riscv/errata/sifive/errata.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> index 672f02b21ce0..1031038423e7 100644
> --- a/arch/riscv/errata/sifive/errata.c
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -111,6 +111,7 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
>   			cpu_apply_errata |= tmp;
>   		}
>   	}
> -	if (cpu_apply_errata != cpu_req_errata)
> +	if (stage != RISCV_ALTERNATIVES_MODULE &&
> +	    cpu_apply_errata != cpu_req_errata)
>   		warn_miss_errata(cpu_req_errata - cpu_apply_errata);
>   }

Tested on HiFive Unmatched. Works good and the spurious warning is 
suppressed.

Tested-by: Ron Economos <re@w6rz.net>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
