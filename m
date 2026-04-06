Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B613DF46C53
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRPZULw5zjuO1XDE+lGHXN3yoXFdqCkZ+iXSyrxlqNc=; b=ihmyw9/3ILSv0z
	vj6U+kzTHZS3Ol+l5YJ9jy21Ria1t2dGV/L7P35kMCbILlBPUeQ33IzkwZqOSL/q6A7nmqpiDtoUs
	FNqMfZFXcLECFhYtt6SUsv3lE+N6q00iSq3VYPP1Xv6nUnUPa/UQY6OHBRqpYqexfBCH4wjGM06BY
	ubWzrUP7RvAOUirI9qAs0S082tuHItk1HvGC6djdpe/I1vHhWuqfcxJE7dDAGm4yaPU2jXJFEj9SN
	T45PG1OniKkZhoDe7eYeM7h5Wg4KiEAzXE1uitHwuu3RwxRsfZOu7krE5+5+2OOYFYIb4M4lTWZwo
	4el6VGQOaKxNjNrDuzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9m5h-00000005Hm1-18tr;
	Mon, 06 Apr 2026 15:42:17 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9m5f-00000005Hkc-36RN
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 15:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=5X/ZUgziwtiHD9yGGaPm4Aku2aaC3iKgPb/oyM7rlB0=; b=MuXkrcffBpTDobdj/dKUkCnWyg
	xHJcj44lfEzuGhbV8TYnA+hF3NEDE2hM9Wl86AaIzt9ZA5FC0HOCjyAlk1P3HlIS+oRxccNAOSYSw
	AlNIVz3KsFhg9TE1zNroPWMyuKv04GgIEzv01sXXVYcaO+7m49T6bS9nSMJx3jACLpn8aXzXPSZgi
	tPAMv1VWQMndcg9Ka6qQ4jD/5WX8EhIIobakoGxZuYJK0iFLblVycEF6OSTU2brMuKIfPzS2NP2TP
	N+4w9NMM4v8mnyu92olLWSQRXdvA65K+LzISpZNE6f+NhaJCNw3PYIATkoPMbiTNX6QleyXKnE2lC
	6w9WKKjg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w9m5V-0000000Cvlv-3JRa;
	Mon, 06 Apr 2026 17:42:05 +0200
Date: Mon, 6 Apr 2026 17:42:05 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Vincent Legoll <legoll@online.fr>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [RESEND][PATCH v5] mfd: simple-mfd-i2c: add a reboot cell for
 the SpacemiT P1 chip
Message-ID: <adPUTRAlzGBs2wQG@aurel32.net>
Mail-Followup-To: Vincent Legoll <legoll@online.fr>,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
References: <20260401165437.1048786-3-aurelien@aurel32.net>
 <b7e182f9-8bd8-40e6-acaa-dc6e556f2a53@online.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b7e182f9-8bd8-40e6-acaa-dc6e556f2a53@online.fr>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_084215_788782_1BDE7CF2 
X-CRM114-Status: GOOD (  12.77  )
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

Hi Vincent,

On 2026-04-06 11:46, Vincent Legoll wrote:
> Hello Aurelien,
> 
> I tested this on top of next-20260403 + the USB3 patch series v8 from Han
> Gao:
> 
> $ git log --oneline | head -7
> 05054ef4ae1d mfd: simple-mfd-i2c: add a reboot cell for the SpacemiT P1 chip
> 5f56e5402644 riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
> 5b0a2f3f8fa6 riscv: dts: spacemit: Define the P1 PMIC regulators for
> OrangePi RV2
> a05128fa7d3e riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
> 2febe6e6ee6e Add linux-next specific files for 20260403
> 8ff4869c6f24 Merge branch 'for-next' of
> https://github.com/hisilicon/linux-hisi.git
> e7d27cf6777b Merge branch 'next' of
> https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git
> 
> Without your patch the board hang on reset. With the patch applied, it
> reboots but there's a WARNING, see the attached dmesg.
> 
> Tell me if there's a new iteration to test, and/or if you want me testing it
> in a different way.

Yes, as written in the original mail, this patchset depends on PIO 
support in the spacemit I2C driver:
https://lore.kernel.org/lkml/20260207-b4-k3-i2c-pio-v7-2-626942d94d91@linux.spacemit.com/

Without it, you might get this warning message and reboot is not 100% 
reliable. I still believe it's better than no reboot support at all.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
