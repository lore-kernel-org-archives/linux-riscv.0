Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AC9FF60E2
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3eDeOmHLEby13fSJmD3vpqormh9r6JA3MmFLMDHvymg=; b=l82Khr1jZKIFAX
	skPTebeO9YVgD7jZH4cyMlMakMBPYo3Ph7ErTtrGevrgCyZarVe1m+FYuckr5T8/F4n/D2jxpw+cC
	J/3aQwgit3ZyBd9SVvMAO8q5htUuehIeO45YkcFV0QrajD0BlIgiA7tYS8VJOMlnAAWLoYFuuyHec
	G1InPsM/GZl/Ab8xh9oexaTUByUVFiEtdERsV4ntMstQKyuY/f+lEInoSyXXsoHAlrrqA8TngGONx
	nqG7qzg2KulX0nNA2xVvlYl3UCoG78B5qzdx6j65swkdk0GSReV9K0kjWSHSoVYIBaiJMkOfCQ0kL
	FvDj8Nc2tHzlsBZ3kO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UVL-0000000CbS5-2i5S;
	Tue, 31 Mar 2026 08:31:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UVI-0000000CbRR-2ylN
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 08:31:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 280B34406A;
	Tue, 31 Mar 2026 08:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7133AC19423;
	Tue, 31 Mar 2026 08:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774945876;
	bh=vKwb0AFSi9KABRTysc3sQJ1mDtXKCNCnZ7RsDe1H17s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2B15g5HX06tkNIlEqP0yuBNdmOpC9kW6q8Ai7sbwOk3BY+sveOJZeeWhJG6grnIl
	 1OFE3zWoobF0AXKPzI1b3vIOhFE8XwQnzV92JOl9E/cuccdvCFdCEKBUzCzo2EUqp7
	 GLYikNWMxnswrqMzGwi5jn2trwfPa2kZJ5KVAUYMkauFwaBRvhFv10JyrppWZGAXfu
	 KUVWcUKdbV7yAGexLydwBSXkCEwnx98Dh5buMtXVtXl2rdyec9wviXK2MjJZzf8Q6/
	 ntR9M7jMA0eXCl+vfqITFGECNyu9/S6PBU5T/mnQKHlQ3es2F/jIujAbiSyophaXpO
	 nOgOUGNAnzTQA==
Date: Tue, 31 Mar 2026 10:31:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hui Min Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	magnus.damm@gmail.com, ben717@andestech.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jonathan.cameron@huawei.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	tim609@andestech.com, alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 2/7] cache: andes_llcache: refactor initialization and
 cache operations
Message-ID: <20260331-pragmatic-observant-toucan-d89d74@quoll>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-3-minachou@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260330102724.1012470-3-minachou@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_013116_788152_9488EC75 
X-CRM114-Status: GOOD (  10.93  )
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

On Mon, Mar 30, 2026 at 06:27:19PM +0800, Hui Min Mina Chou wrote:
>  	return 0;
> @@ -186,16 +181,18 @@ static const struct of_device_id andes_cache_ids[] = {
>  static int __init andes_cache_init(void)
>  {
>  	struct resource res;
> -	int ret;
> +	int ret = 0;
>  
>  	struct device_node *np __free(device_node) =
>  		of_find_matching_node(NULL, andes_cache_ids);
> -	if (!of_device_is_available(np))
> -		return -ENODEV;
> +	if (!of_device_is_available(np)) {
> +		ret = -ENODEV;
> +		goto err_ret;
> +	}

You just made antipattern. Conor mentioned briefly that he does not see
commit as doing right, but let's clarify: this is absolutely wrong.

It is explicitly discouraged by cleanup.h, but even without that remarks
one simple 'return' in one line is converted to three lines with goto
and you call it "simpler"?

No way this is simpler. You made code worse.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
