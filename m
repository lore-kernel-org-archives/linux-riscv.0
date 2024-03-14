Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E2DC54E5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 22:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLCcUH32vyvAVSoQ5Q1s4mpg/wNxLBKv2CIQ21s/a7c=; b=Y5ewfhVLAUtiYw
	ZoBHjKexXqJAm29QCoNgAENxglHSg6oqm/MdxgkyreBUKMHVSvmquWXa1F9O4j9QyBLLltVdlWOyB
	hl2z2wemEOa8y8mxWlytDkaZ8Zh/XxmQ6GL3GsJ+Qies9m29TNJNpnfCkRTIV72ykz3h88y1ozRHB
	fD7hHP+VDw76ZJpJ/ompESOR9vVtCrUefPK8PX03Ewg9KCXfbehibFAeIFvUCU3fBVLbA8HYj2Iar
	cRIIL4/ha4ab8QwcIWC1XCQqH9kklRY9leC49NIYZuJP7ADVvmlSA/Etafp+pZbiD8kezZyFa3gVg
	g6+ilJ0SUqoQP9mIv1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rktBn-0000000Fn6M-3JgE;
	Thu, 14 Mar 2024 22:04:39 +0000
Received: from fout6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rktBj-0000000Fn2F-1GrD
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 22:04:38 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id C369F1380119;
	Thu, 14 Mar 2024 18:04:31 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 14 Mar 2024 18:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1710453871; x=1710540271; bh=A4p2hd7jMc
	j4Gm0VpgLh5RKejwffjME4HzBpylISjj8=; b=F9moXMt1xOZmqD78NLVt1Ti42U
	tR0gImRirP5A2LpMYsIYcsBJNTvMsGktJJhj71CweUHCovRm1bs1Yy5m4WuWs0Wm
	MkuFzQA0GPtX9P3Acl3IqXxgROC4U8KZwecYNkOiG6P7I4YKTseGsaDgBJHvnrXo
	ubBuz5kCeJkrFy0+LO7LmMHHVnU9/CoCPAdrnGqz/9z1dndLw77aVNTv1wUd9Tkq
	1Av4wq/R0rgDmpZ4PLm1cKhdk/+AXOktRdmDqYfA6A/kd28IpgJb7a+koh1z76Dr
	kdeA6bXHRMgd5q/IHZ7FHFuneP18JGX/8EKPrS2OzMT4m2T/pULpxzc7zIBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710453871; x=1710540271; bh=A4p2hd7jMcj4Gm0VpgLh5RKejwff
	jME4HzBpylISjj8=; b=WpOKLZzwuyb3V6e0TezRwDubtIMAUFfXV/9Xzrn5EDQU
	Qi4M3yRcYVGiGkcYsCic1xk3fUQyEgwsWMzYTR+PDjDd3gBF1a4ufj2WylGXuj8v
	J9Lb4f8NgnZWRQ8TR/n1lEEX6xR9kcMT06gmDTjIC1ANKRgSPuH1jjzBhqk2Tqfa
	yW4qndjWSQ06SImbp0f74KfQIKMA0WtPDFocMOiazBf5BfheSQSopMdUNNiZkaBt
	Sp+vQd/ayInomXptiMxGpsrIsYheNYYgK8aNEMX4tCmv/42Dt5CYY9bSX8JuhwmP
	ei2Jw4ZoiUtgK85okZYAFXo/wFRJ8nLZXXPC9qqSvA==
X-ME-Sender: <xms:bnTzZVh1W9skl-pAj05fYdSqubG3W_e2OhBlEE-yBxcjk_f6xvdALw>
    <xme:bnTzZaAidFb1iVsaNQIjqPdjwN47fE6TJmCsxXNTxQC3xH3RP21B3_HrB2KVXQ68z
    S75vJZtvjrmueh3XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeejgdduheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufht
    vghfrghnucfqkdftvggrrhdfuceoshhorhgvrghrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepjeeuheegtdeuteeghfehjeejiefghfeifeejheduvdeugedt
    hfehvefggefgkedtnecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhorhgvrghrsehf
    rghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:bnTzZVHWbsnINC62FaBqHeFRbpiNjijbPiLDy_RCF9IvPCjaCNfDcQ>
    <xmx:bnTzZaRyTW4euK8vuAAC2VctHABLHEiLWddjKUTgzjIyYW6vyaQDAw>
    <xmx:bnTzZSzsbK_V-yeTw8Nju72QIdS-ZhysYPrMNdenw5HWm4HvLWZZpQ>
    <xmx:bnTzZQ6zBu8LOjJpkOsCgaPdd6YO0r2AbGEpOm4oBVxHzl9502AEoQ>
    <xmx:b3TzZdr5d0W92w6ZhSi_KYzX4bUFNwtq3g5pzZYnt0s5M6gg-1BGBA>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3271D1700093; Thu, 14 Mar 2024 18:04:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-287-gcf6d0d8ecf-fm-20240312.001-gcf6d0d8e
MIME-Version: 1.0
Message-Id: <55ad1b8c-01dc-41e8-a083-c64aa45c15ab@app.fastmail.com>
In-Reply-To: <20240314142542.19957-6-andy.chiu@sifive.com>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
 <20240314142542.19957-6-andy.chiu@sifive.com>
Date: Thu, 14 Mar 2024 18:04:09 -0400
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Andy Chiu" <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: greentime.hu@sifive.com, "Conor Dooley" <conor.dooley@microchip.com>,
 guoren@linux.alibaba.com,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>
Subject: Re: [v2, 5/7] dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA extension
 description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_150435_700541_2DD69EF4 
X-CRM114-Status: GOOD (  12.92  )
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

On Thu, Mar 14, 2024, at 10:25 AM, Andy Chiu wrote:
> Add description for Zve32x Zve32f Zve64x Zve64f Zve64d ISA extensions.
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v2:
>  - new patch since v2
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml 
> b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 63d81dc895e5..6ae50d1227d1 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -381,6 +381,36 @@ properties:
>              instructions, as ratified in commit 56ed795 ("Update
>              riscv-crypto-spec-vector.adoc") of riscv-crypto.
> 
> +        - const: zve32f
> +          description:
> +            The standard Zve32f extension for embedded processors, as ratified
> +            in commit 6f702a2 ("Vector extensions are now ratified") of
> +            riscv-v-spec.
> +
> +        - const: zve32x
> +          description:
> +            The standard Zve32f extension for embedded processors, as ratified

Wrong extension name (all except Zve32f).

-s

> +            in commit 6f702a2 ("Vector extensions are now ratified") of
> +            riscv-v-spec.
> +
> +        - const: zve64x
> +          description:
> +            The standard Zve32f extension for embedded processors, as ratified
> +            in commit 6f702a2 ("Vector extensions are now ratified") of
> +            riscv-v-spec.
> +
> +        - const: zve64f
> +          description:
> +            The standard Zve32f extension for embedded processors, as ratified
> +            in commit 6f702a2 ("Vector extensions are now ratified") of
> +            riscv-v-spec.
> +
> +        - const: zve64d
> +          description:
> +            The standard Zve32f extension for embedded processors, as ratified
> +            in commit 6f702a2 ("Vector extensions are now ratified") of
> +            riscv-v-spec.
> +
>          - const: zvfh
>            description:
>              The standard Zvfh extension for vectored half-precision
> -- 
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
