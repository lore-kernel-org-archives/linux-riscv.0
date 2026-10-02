Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5741DCA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 18:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8FZBlALegRFrOuUOnXaMC1eOK3M2JGQuVmGLSbE42qE=; b=dDsvU4617My1Y2
	/5e/YEzz13+HiOH3CsYHyYg6sSaZbhnX+rUt9YACJqLDEBfh0B/jLurMuP3Z+rFXhmBv0heePTRYc
	Qv6kqSJ3St3M2ziWhnbfIiLfhou2DjU1Td0eIRYCYyOYZrFd3gU+dHhDI2obVOOc3WSScpwY3/35/
	wwrx7t2fIhFQZfiD7X36SKmQjJvxTrGYhCw7Q/NMGAuqsJeZ8hScAvFijCQ/993mzVarECWZpd1ZG
	Ig8+PeAoLKenUsZFDL/mo3kT+8SvueoJVgoJ8Z3ZPcDF4C0Im0F2TRT2QwXLhKqDy0+YCzy8QA7Ul
	qh5xYOxV1XxkZXI3HMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiMW-0000000CIzN-2w8v;
	Fri, 02 Oct 2026 18:52:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiMU-0000000CIyT-2lAb
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 18:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZbusdJQDLU9CqEcp+iezpSfVMrYKCe1NKRzE9U8ZfQ=;
	b=KpwvNA6yyHps7fBy23Jiy6/hPp/Nzm3EqGCQYLs6FY/iUkxwaRokU50jEp5EmLK7kVu6TO
	3MgGuRovlVpDX7/V+QMNsfYQn6JHFJZFDKF8qIboU2x6yyrkY1Wm01rmN7V2qZcckiM0Qs
	2HVwjkWml7cSg0/IjClbNvSwioib3SY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-A__7zdtqM0eugyMmSer-vA-1; Fri, 02 Oct 2026 14:52:00 -0400
X-MC-Unique: A__7zdtqM0eugyMmSer-vA-1
X-Mimecast-MFC-AGG-ID: A__7zdtqM0eugyMmSer-vA_1790967120
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso368938685a.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 11:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967120; x=1791571920;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ZbusdJQDLU9CqEcp+iezpSfVMrYKCe1NKRzE9U8ZfQ=;
        b=d5wvqcx+837p2ZhekyMkFiC0vkzcMCBim1dZ/hOBRVFf3Nmv282XSm1n9ydx122i1P
         oWVSYo80QFNAYAeIbwLK8TFPm6+Ja1GkvAZa2kkjUExHfrpey1go4Ra0yxV84mNhLQac
         9WIyyelbUsmwkHUcf+6lyNQ11rEDIU+xX+pwu+F+28CRdjEL7rOtbuJzROux301KXGs/
         k1JA2MVCwUK1cW5+3wwdgypwbHKqmUqIP+3FAx2+0ToDRWIIirSyFv/iBG5ojMp3TgRx
         eqMzmUd9poMc6fA9LfhaNriw7WJqipuMJznFv4G/YDR8xbkW/ftlAQ0pjGszICx9pDfO
         hNrw==
X-Forwarded-Encrypted: i=1; AKwUvBy46HefETMySgxg/7w7Bh8hwXOJeJQIDcRe7LBh25XI/nlJnWgDPcVUVPWc6qVR10nMe9AFki1AHcMb0w==@lists.infradead.org
X-Gm-Message-State: AFuF++mH6xPreZgADC4kwOpTuCbdZgpKzw2fC96iguaSwP4Aw6D+lDeZ
	Nayx/D2Vmy25KffAafenWEqXpADPrvdvIi/6eP55rVhTE81cLy1p0T8gRLw4MuWhBqi2TiYHNan
	s6iVDBk4F4K3Q4s7cabAWwxq8gugUM4XfbFxwHAmwvKfJCBOd/UIBbAAwgZozXrwJhiJlQ+6xIJ
	FzXA==
X-Gm-Gg: AYBFou09z+I9B0LJmLZW1Nm3wQTZSYtQ1QfRzkh8HZjTQywqdz3WXWoejeNF2EgKZgW
	JZXHxcIYVVy9IRJrvNyN6HegDVZIByUW1nzOUaRvHQtOxVnRcfTHU3t+Uj5VTYR4nGdl0X1Z145
	gAKMS0YZcvbpMAtFHUxYfIn3hxvRgefhZHtNb3tqsSETPYGDkMAGtDxsSvhqS4IMDzT/1oOHzIf
	awB660nWgc0je1GAwUQSnkxQAgWziBaH/j0Ohe2tXROqpyuyr+p2dfHnJ2EVuaieDgu1QBcFlGb
	5+pVUvnmTg/sNnJ9ZH2XdCjEGo5zHtER9K0YyFYyDp7F0Nyd3ipPNYyR06RMtG0PNo9yzR34OUy
	1OYCctRr164pAkw==
X-Received: by 2002:a05:620a:1707:b0:93c:ab7d:af7 with SMTP id af79cd13be357-93e510eda88mr48339585a.54.1790967119624;
        Fri, 02 Oct 2026 11:51:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:93c:ab7d:af7 with SMTP id af79cd13be357-93e510eda88mr48333485a.54.1790967118935;
        Fri, 02 Oct 2026 11:51:58 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:58 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v5 12/23] clk: starfive: Introduce idiv ops for
 inverted divider clocks
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260930124317.5648-13-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-13-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707366.821688.7143884804671628088.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=DHchWNZ1wELl9N/w6lEvEhX4ovGIqMkBB+Mj5IaftOY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/7W9zLXuyMqzenaif56235iYH37vy6njq2S21Ouo+
 +7y2HUxvaOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJdK5hZOiut5vCynTqZcHe
 S+F3wxhvO356uFlMyslMe9Iri3Oa/ikM/2MWlG1+tWHSu7i1E1iyY9Z/9z/fdPbqy3Oxs2tXT/8
 VOYsRAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: za6n8afS-9fnBXKMrREQqb2alkH_MgjQMZcxIG1_63s_1790967120
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_115202_773843_EEA4CF77 
X-CRM114-Status: GOOD (  14.49  )
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

Hi Changhuang,

> Some StarFive clocks only advertise the divider and invert capabilities
> (via JH71X0_CLK_INVERT, without ENABLE). Add the JH71X0_IDIV() macro
> to declare such clocks, and jh71x0_clk_idiv_ops, which combines the
> divider rate operations with get_phase/set_phase.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index bb7706ede1a6..1f98f1f8f0a5 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -302,6 +302,15 @@ static const struct clk_ops jh71x0_clk_inv_ops = {
>  	.debug_init = jh71x0_clk_debug_init,
>  };
>  
> +static const struct clk_ops jh71x0_clk_idiv_ops = {
> +	.get_phase = jh71x0_clk_get_phase,
> +	.set_phase = jh71x0_clk_set_phase,
> +	.recalc_rate = jh71x0_clk_recalc_rate,
> +	.determine_rate = jh71x0_clk_determine_rate,
> +	.set_rate = jh71x0_clk_set_rate,
> +	.debug_init = jh71x0_clk_debug_init,
> +};
> +
>  const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>  {
>  	if (max & JH71X0_CLK_DIV_MASK) {
> @@ -312,6 +321,9 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>  		}
>  		if (max & JH71X0_CLK_ENABLE)
>  			return &jh71x0_clk_gdiv_ops;
> +		else if (max & JH71X0_CLK_INVERT)
> +			return &jh71x0_clk_idiv_ops;
> +
>  		if (max == JH71X0_CLK_FRAC_MAX)
>  			return &jh71x0_clk_fdiv_ops;

else if so that it's with the block above.

Brian

-- 
Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
