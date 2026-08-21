Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E91C5DF94
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=KMJOzgjM9INUtpnz4GfNJW0aFcqb8WFDVidhunBYk9k=; b=hmv4xwK9HTO8Hc
	/2XrzMP41mGn54MBhdK9nq2LCcEguHqOxGpVOE+gDRMSNujW5lV826Rl0cB/8DYqgpvgmEv04t7fL
	FXk1v1jusc4UdrPW7ppW2mL7cM7XZynqIL3bltfMo4Pp9HAPXgqKh3zYHR1OrggP6Ht/LjZUL1jA0
	EZtzZLOwEg7fZAPJEmGNMUUY6o64vsY6IxeU+B4VwZ+VchOLHU5Xhe4p2/rstvadDum1pCBrhwOjK
	djmoYBNGM5I+DC7s1zP8gOAgpeeba5eUa5UmF+GVlA0mUQfsH+cZmaqYCKBxh0KddJOaY060A9JO2
	i+qahnP/VjrvrHU1VRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxReD-0000000DjtD-2AqK;
	Fri, 21 Aug 2026 15:59:13 +0000
Received: from mail-oi2-x0b.google.com ([2607:f8b0:4864:32::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxReC-0000000Djru-0ci4
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 15:59:13 +0000
Received: by mail-oi2-x0b.google.com with SMTP id 5614622812f47-4af7b6a2349so494247b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 08:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787327950; x=1787932750; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/a0pcGfQ/DN5G5vgeGh7d5qeMSleQ+VJHVJXKyA8bJE=;
        b=pC2mbwlFJSdIbalS5S27Rap/ev6tUxmfKxKbZTyHBS5OfRNhq/X/1BryPIpOBQgXKS
         fjks3G/yqpnhXRFyR8vxuDih8xhd4b4jGSK07zIhdlLukYFHaEno04to717SfqOT+JIY
         cwuZwlmvbh4AI0nqsee4yD5vZu9B8vuNLkaZd5Rs0O+8i6HSzPNsCO8rLCkiKgf3zNjW
         R8GHXS6tRICw+VObAIKhn/VGL+GYYhkbAMC7MqEH8A2QAY1iQGYhGtyav6yYaBAsI3rM
         9jgGRoSxSdnQ1CW9dcw6DUWFO1ehsXukZs5Wmq20Hs4Y7Qjbcg6r7fwccpW1Ps/E/dVg
         p0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787327950; x=1787932750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/a0pcGfQ/DN5G5vgeGh7d5qeMSleQ+VJHVJXKyA8bJE=;
        b=W2me9KpvciecMMij+JLWyJiWSRirbO91J+RrlprjOS+RRnW6y661y+DWz9sq825HtI
         QW1WtiU50CRDFVK5zzxoDO9ctkcmymaBenRH47Vzbtqbc4aoXLjNi4tKdgdg82ZoI3bo
         g9suJL9DEolpjdhY2OnMaAeo0MLPFHUai9QeEHTXfWW4r6wYHiDj8lxYcmAhz5U/Jpqz
         jW6YcSktnJ5mPMbMHMSydL1tRB3K+HuuOUHNR/zMXz6RVttnIpGuHWLWgsoSAuFKPuJO
         tY5o+nsu3g+4hYm1l/D4z5t84FzNeF29ftx7sh5u+5aoYow+BkEzeDF2jAdff5rFJ/oV
         h0qw==
X-Forwarded-Encrypted: i=1; AHgh+RqbtquiLOG5wcxBd7SDcc0zX2Slai8416IkKQdajJ1LowFGB6aDKPbi+WJvXn6lyXi2jJ/LBvseBgbtcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxO6fqseorijA5ouvLI2DHYe70FoRJUvLbrkBroE91lV9ZG+PvW
	PqMz2CAxTMinza15syB3DP+MHPAwghQV9a/h+clRD5lPE51ijl7Equ8X
X-Gm-Gg: AR+sD12GDZSrwh/LVGxetlcvps5CB+PZvN8qbur+hLzlz4eZn6NlOh7SCpvgGbsGAKr
	NlD8vzHgSTqvvlzXIZco/PWPd8yZFAAPZadaGKj+89E3zBbJC9Wa+9aZowBUVBE8k8JYJ2LVZHi
	DQLAWvSwuEihzdDf4us/GlRM3cTq/3rTud/0hcfp4IryPVtnzX+fozlJ0+wjF6u7H1pb/ag3xU/
	IiMp+uLhOWnlXXSq8K9B+Mfr8bMxwBf1022ob+EpB0KqX3ttaZbgNiMAB3qzg5jsJuoEAvPhuBS
	ApfaOIOIuyClsCCdkYRMBUXS5/sQL3COvuj5q6MyaVSBdPcdK4NQiSXRXgXy443D0LKVl67qdtM
	fCjTZbNAOIhgmn64sUvYGFXy1L7Nxzrgca10LtqH4s3cFkCJBC6DIEkLsP7Af5hOps8Enr/8KTs
	ePSSwv3AbRBRtt+ju/GDKMZbvpprUqwASUBuezPgYjPL3XAY61D0xDOpcVzQULqYjH5Ou2HsIab
	MZhQg==
X-Received: by 2002:a05:6808:1527:b0:4a4:933:b20f with SMTP id 5614622812f47-4b2ef14d4eemr6740578b6e.7.1787327950508;
        Fri, 21 Aug 2026 08:59:10 -0700 (PDT)
Received: from ubuntu24 ([120.239.197.32])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d8945dsm5119763b6e.16.2026.08.21.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:59:09 -0700 (PDT)
Date: Fri, 21 Aug 2026 23:58:57 +0800
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] tee: add MbedTEE driver
Message-ID: <aoh1wdtxXF5PkPPw@ubuntu24>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGgiveU2TjkA1YnPxBy2e9qtCorSumuno04aEir-u74yKvXBsw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_085912_189115_BB61B77C 
X-CRM114-Status: GOOD (  11.55  )
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


Hi Jens,

On 20/08/2026 10:10, Jens Wiklander wrote:
> I took a quick look at the mbedtee project, and it appears to be a
> one-person hobby project. Sounds like fun, but I wonder how meaningful
> it is to upstream a kernel driver if you're the only user.

Fair point. I wasn't fully aware that an active user base was a strict
requirement for upstreaming a new driver, but that completely makes
sense from a maintenance perspective.

I'll hold off on pushing this driver for now until mbedtee gains more
actual users. For what it's worth, the integration side is fully in
place with tested QEMU/FastModel support and a working Buildroot
overlay, so it's very easy for anyone interested to try it out.

Thanks for your time and the prompt review!

Cheers,
Xing

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
