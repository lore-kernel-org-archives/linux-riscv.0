Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F53C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 00:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C1721473
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 00:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H9/WwbnB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SMcubttW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C1721473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+0/Z4nHnpoknfFAYsTJizMeQml+x7ViFBOl/s375/w=; b=H9/WwbnBH5V227
	O284I440mLYo0K85c9RDH9JgWZuMNvveNf3YDP+obnfr4zctSQwrN/Elbapb6Rb1QiGty0hy3pzrL
	vgctWJYlLZU+5X7KzOU4iZFfoLbIKp19eFECHiP1KZziHiMCa+nHeCvhoZPGU2KLt4SgsyvqdKUAU
	S9gyM89Mt3sr7uZLCPW4/sR7RmjxHsFZu9sysGtOtVGheTzma15GVdSqLn+X89wIsOoW5T+g8jgjV
	+LRTUgq9Ky25HQyFAVgmOgTUYHjFS8uWwi5pUtXHx9dsVt+ct4rZ/cm2uEyEzF8qagGgPx1WAbRWJ
	2Q352+DhutxSHOpayo7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8DM7-0007XW-KO; Mon, 25 Mar 2019 00:20:47 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8DM5-0007Ww-07
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 00:20:46 +0000
Received: by mail-pf1-x444.google.com with SMTP id p10so5099929pff.3
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 17:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=H6F0jfN3QKdeUgxSbFVz+1v5BT05Mk/9KQ2E2ZVK9JI=;
 b=SMcubttWiAlkc1oNV/xyQND4SCMuLtGLKPKNe6m2sUkg5nq0GWZgltZ7zCvvKr683z
 vKTPcX2vA57V2jbzXxIzY7ul2sOE6Le6Jj3hD3qN1bDyiJE3opqgKdQcT/AgC6/VY8eI
 IrhxfRDDdoR2WeeMxj6MVFClBwy0RTMcVv/03phSxBdy/Kt1OjWvrHW3NZgtNwMxgIzS
 wumoV2QeJVilkWL71e8hFjFFPUPzxZ5E02kmWbjHXo1U3xIsY0bnB82j37e43M2vGcu1
 uN9K6jct7+0mhzKVr5xR7zOjJSLoJcwOryHjoIKZMC+xJXDAulHlfHPOh9q44XmUlKSj
 3mOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=H6F0jfN3QKdeUgxSbFVz+1v5BT05Mk/9KQ2E2ZVK9JI=;
 b=rnciQD/jjqV3wEHe6gi2J06qvWUUFswZUUzFiLnkG5g3avqpxuAuTsrwt3fj0Z0rWv
 8cz1vkVqSWq9dtcDRKz+pTVHyiMqmhK6Jhv26wMCmGsjiOfg7++mpjyII8MVz5peZWXf
 3c/saW+RRxWa4l6UGlH2762B1ulCmrQFFEiYXRH54y+7aF5i0Bf10iT8SSwcxL3heD21
 6hvX22CbRYnTzQImdMUCdr8WOaqvsb4rZv5ikeOohnXddRadeCfYETHjIgMOG/t8BFEK
 8Px0I/e0n+Swp2QW2FBq/yaNE5f5zg3V05JgXgVb1Nke6AzP5MrlIJ5dFJCX995m29sT
 swMw==
X-Gm-Message-State: APjAAAVrmAGJwRRxKU9g7hq/MWmhMj1coQYfVqAymmfB0ZWYgYwsqjgB
 Fdy8RAPwEfEP4EOaWMTqGu+21Q==
X-Google-Smtp-Source: APXvYqx886xWJu1IqCMsrRuW9w2rJPpUy/zJ9D9nunANZy1SJaKya7UQwU/Nak78yq2QPTYdTIILDg==
X-Received: by 2002:a17:902:a60c:: with SMTP id
 u12mr21273752plq.301.1553473244191; 
 Sun, 24 Mar 2019 17:20:44 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z21sm20696977pfa.81.2019.03.24.17.20.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 24 Mar 2019 17:20:43 -0700 (PDT)
Date: Sun, 24 Mar 2019 17:20:42 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive EDAC
 driver and subcomponent
In-Reply-To: <1553082728-9232-2-git-send-email-yash.shah@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1903241704210.8028@viisi.sifive.com>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
 <1553082728-9232-2-git-send-email-yash.shah@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_172045_044232_8A9FBDD5 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 robh+dt@kernel.org, bp@alien8.de, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yash,

On Wed, 20 Mar 2019, Yash Shah wrote:

> DT documentation for EDAC driver added.
> DT documentation for subcomponent L2 cache controller also added.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/edac/sifive-edac.txt       | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac.txt
> 
> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac.txt b/Documentation/devicetree/bindings/edac/sifive-edac.txt
> new file mode 100644
> index 0000000..c0e3ac7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/sifive-edac.txt
> @@ -0,0 +1,40 @@
> +SiFive ECC Manager
> +This driver uses the EDAC framework to implement the SiFive ECC Manager.
> +
> +Required Properties:
> +- compatible : Should be "sifive,ecc-manager"

As you've probably seen, this is being discussed in a separate thread with 
Borislav, but it would be ideal if we could avoid adding DT nodes for 
non-existent hardware.  Let's see what the outcome of that other thread 
will be.

> +L2 Cache ECC
> +Required Properties:
> +- compatible: Should be "sifive,<chip>-ccache" and "sifive,ccache<version>".

We should only use chip-specific compatible strings for this IP block, 
like "sifive,fu540-c000-ccache".  Let's not use "sifive,ccache*" here for 
now.

> +  Supported compatible strings are:
> +  "sifive,fu540-c000-ccache" for the SiFive cache controller v0 as integrated
> +  onto the SiFive FU540 chip, and "sifive,ccache0" for the SiFive
> +  cache controller v0 IP block with no chip integration tweaks.

Same comment here.

> +  Please refer to sifive-blocks-ip-versioning.txt for details
> +- interrupt-parent: Must be core interrupt controller
> +- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals
> +- reg: Physical base address and size of L2 cache controller registers map
> +  A second range can indicate L2 Loosely Integrated Memory
> +
> +Example:
> +
> +eccmgr: eccmgr {
> +	compatible = "sifive,ecc-manager";

See above

> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	ranges;
> +
> +	l2-ecc@2010000 {
> +		compatible = "sifive,fu540-c000-ccache", "sifive,ccache0";

And as above

> +		interrupt-parent = <&plic0>;
> +		interrupts = <1 2 3>;
> +		reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000 0x0 0x2000000>;
> +	};
> +};

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
