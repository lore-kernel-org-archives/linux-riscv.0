Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF1FCFA753
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 09:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwijFTfa+CKWP88+ZHDwL8Amuz13Kf3jccqACi1BPWA=; b=j4AY04GcDKzEQn
	KZ4qm17/2A+z7ENPDkCxcqJGPEr3vzu9ZPIz8yto1PyVTCqk9RFNRzwcgaX+9q6xMLtclGe8qjH0P
	MSFy4DrYJWN5RhhvjK4vV+iQHGBLd7ahGaTJ1q/mR56HP0kGC+EdtF0jQd8ycE30Z5ky0L/iEkDPz
	faDf+eVb6XuPXYCwxMwmSJ6DiRrVTFVVRbWdyn9N/IjjuLjKQWgVFUfDd1Do75ETP/c2ZCDaAvxYJ
	IeqXksbtqRq+rzf//z2Kp9tdqqVFMDLaY2BNclM4bE1xhEDIxC+NAPWvTY1K+xpLQt+i3mqxRD/IQ
	GMlzhWkV20kIEfs/xINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMN1d-0000000877U-2OTQ;
	Fri, 21 Nov 2025 09:01:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMN1c-00000008778-3OXl
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 09:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2E7A60225;
	Fri, 21 Nov 2025 09:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006B8C4CEF1;
	Fri, 21 Nov 2025 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763715711;
	bh=BAlIVa/oy39TVToOmx2+pumF4QJ8TMQ+gMvOrQ50rm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Odt6l8004Gy13rV97eKLhGuEg7Ybbputx02ogH9vFfbE1mf/Qy7KGUm/LQMg66d3X
	 f0z6ioDVLTY7y7eyJ9jAJQ5n7wsSjICHTrUIAqpaKHumxBJvBxcWvm+wxEuJ71pnAF
	 vjoLJ7txHg+pZrF6scoE6DKxsn3+8giAyfmw/SJhR73ni9RN7KqLrddyTDH6RXvxJD
	 b/hV5jCm8vy35nsx+v7J40tJHfkoKQOi2QzkPEt6NuRuCvE0QiSZ1/C/PHfi7pVjtv
	 39xjlJ4vGTs20tPWCrismoAkydWHT4DGih+MizVAXmZAZJb/t8jvn32P4/4aysXvPI
	 whBrBZLBZY0ww==
Date: Fri, 21 Nov 2025 10:01:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: cp0613@linux.alibaba.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, guoren@kernel.org, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: riscv: Add XuanTie C930 CPU
 compatible
Message-ID: <20251121-hasty-scarlet-axolotl-c93efb@kuoka>
References: <20251121063439.2545-1-cp0613@linux.alibaba.com>
 <20251121063439.2545-3-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121063439.2545-3-cp0613@linux.alibaba.com>
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

On Fri, Nov 21, 2025 at 02:34:37PM +0800, cp0613@linux.alibaba.com wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> Update Documentation for supporting XuanTie C930.

You just copied here commit subject and diff. Write something useful
instead.

> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 153d0dac57fb..581a95eba932 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -65,6 +65,7 @@ properties:
>                - thead,c908
>                - thead,c910
>                - thead,c920
> +              - xuantie,c930

So that is thead...

>            - const: riscv
>        - items:
>            - enum:
> -- 
> 2.50.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
