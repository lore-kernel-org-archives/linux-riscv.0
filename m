Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5216ED232CA
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 01:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYFmQXgOOqvPKVlY7tOtMZ2buLABHk5NGGzTLYB7lYc=; b=qV8ewLgIIf4jrY
	BVPrIbB7Nmny2jmO8VdBV9YZgTE3wIrA0kPgX21ZFAoZxCXUJaj0SEMrtjJKs2DkCAfl4B7Te070h
	1THUj5yMhOYSEgPfg8T3bniZtbnj6gGgTRFbXYWY4wPmwKJyt1w1bPa9EwLb1x5pcK90Jk4Dv+/ZG
	KpJKKGEGG0VCIGp+xut7MnsQJVvDZ8uUggtvapNf5z0ORqnVBxoP4tgIuIzHX3A8gkYVcKmXq5+Q5
	WwxltnnDJNUf0K7doemxqQkFBn9UQRThjrlIskiWUuGHUieO+YQ5wpVQ4qf7+DX0UIo1lVTJuDL50
	WBdQpSsS1Qw5+B+DUjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1My-000000014t6-3wWH;
	Fri, 09 Jan 2026 01:32:52 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1Mv-000000014rr-2ss0
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 01:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767922294;
	bh=Lte9il4oOh/PBkig0SIYcOonMssQ6T0eES7c3nlrvpU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=geu7eSRGrVM4u4d3iLhYrFRdNHQCZ6k8MACmhV+Bj1G5lN5sjZ34R2rDTxwx0zvQX
	 ++l1M0sszmXKP266LTEAxwmtzJ2P/Yr4RdF2thPnfowWM3MIH7wp1k5JOOk6T4sxa0
	 qWZ9RlY7dCE8Sh5HHQpxyu+Ch0+P7V+qt4QbFFzM=
X-QQ-mid: zesmtpgz9t1767922286t53ae930d
X-QQ-Originating-IP: +461X0RnN79QDiEa+Js9FDVz3gMxkKWrRbCGmI76R8Y=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Jan 2026 09:31:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10842519875104114801
EX-QQ-RecipientCnt: 15
Date: Fri, 9 Jan 2026 09:31:24 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
Message-ID: <0AA43966D8DE9163+aWBabCQG8v4XzD2h@kernel.org>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
 <20260108073722-GYA3634@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108073722-GYA3634@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mfqd7mLTdXCeBpi0VWs9wf9ecRPf3xaLpaxCoH50uLbuI2OtKIpbhGmh
	ti0+J7kS53KflWmUciLJDYaHaidTaOoNlm/WwUpMQ8/wfd0H7At/6O6KrhQEJpGJc9hzIIw
	NHQmLke1bzG00pj/dI4ljvPta2qoglfAGMSH+VR1cflP2nipNRSlSm5uYqqDiKEciaq895Y
	U8oRW3VZRN43XawHT8DJzx6ZgV5VB/q9mVQwsh1vqJ3HH0CIVEJHOAP9mqo9nMCXFb1kTX3
	aA72FUofmb1jGU9+mEyKz63+sFZ+FXIr36LjnlE9iTvLwszuklve4JQ3gisYeS5U+bMzTHe
	gZrdYV+0lACymQHdv6A5QilO8Wi8JHbNjCsXV30h3QoTrhU82sAUTztnwk6QfY4iFU4Uwhv
	OTCDLVvso3VHU2ohJwnvMjC4Q8wWjPsIkU0AHVAa84V2XG0bWO+Sn6shNwXaKs1TfcvBfNc
	PWOyuk5K64s1lXBwIn2OQVt8iUuUEmsd4w9XDm+lpYDRC2ZaLGGvHQAEahHBgsGKpIHCfTp
	JV0N5rmph8AXC7pQgLoLqnq8R6RBG7/WKofRkvMwfzTw06Gny7d6eDRwOoO6VgDhAvBB3mf
	ZDFKOXnJwexTg+/ZzfVAq3/X2387hW0fV8lnENGt9yGbpNn0KPgf0wYhLOMQE5V7WASjXkU
	9V2qSZLMsSO1RIFnteeFCRKX4JIF78DUDYXd7zF7Y/rTtPHBDUxCnyRQ2nGocjQf2b0yoZ6
	U56y9ulVo9tyqy+B2i7u1tvNNZ11ouZ3EqiGWzLIHbwyRQMOGuiBbyqS0CLH8qqupERrKDV
	MCgYKo1gOdNHwYatZza6T1hI4kVpplQdpWbtwzkZExkBLRLp0/UQNVJEcn/VrVSbSfJvhrp
	UYJ+d1n5LXOZvxmVCHqyMjkmx+e8M9kYsbKsbrfUjueFRooCl08ogbKWRWB1+ra5SEar91a
	wkIsrXM4n5lWgQli1Zl6exJDPKdii3CBJ3iaA9b+3zDkntq/JgEh6IWALVH/oYfX2iG01OV
	gkIClh7v0/ayZwluEbNcnLCtSk1PaElVumOYj8Xs9d6A1x0bSDKAnN6BONAnn8TL1XgQ5dP
	znhfFhlTt7YWpge0jGQJ5c=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_173250_421848_97B477A4 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 08, 2026 at 03:37:22PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
>   if there is one more iteration, I'd suggest to adjust the patch titile, 
> to make it slightly more specific
> 
>   riscv: dts: spacemit: pinctrl: update register and IO power
Thanks for you pointing it out.
I'll use it if there is one more interation.

But I just want to confirm, if there are no further iterations,
you will be making the title change before applying it to your tree, right?

                              - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
