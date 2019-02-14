Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24484C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 18:00:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E70462080A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 18:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LvT+y13s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="KyNB7+OG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E70462080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBciQmWaC1HOjsR08u3d7vl2qM5c+QYvK1JZ45TH9vw=; b=LvT+y13scy6fTs
	JFYAlJZDNWjM1bJAwJkcfxp83SUvhKU5MQfNWyXwz1RlpIhtaPuSRLmmAnu9oTp2i5+oVqN7ZBTQ7
	3hETiGdlYvyGVU18Y7h3fbRsVyMbGgZh5alWmK++glgtjzWJZL+yaPmIO2+y/2tIb1UfeWOKCu72P
	toz0Bjx5n+neEqBIiF4YCgKYqgvOv3zai9HROduehjV1M2bsoxQ1foSJWbzHJp3eLPYnmR750fgBt
	EsgK9QqRpfg3CA04OcMEQhi4DT9350Yx1ITp5S6ZA/mtQmPPSQbl4fMTWkJlfxP1T6nEK6+KniLQ7
	GPeom8itsddiurD0ygiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guLIm-0001ww-7T; Thu, 14 Feb 2019 18:00:00 +0000
Received: from a9-46.smtp-out.amazonses.com ([54.240.9.46])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guLI0-00013X-Uu
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 17:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1550167149;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=eBf2c5u+rFMWbJXqlzWgo7tdnCY2i7jL5vluukLr+Gc=;
 b=KyNB7+OGNJVlLqLzr4dHHh/FQx/4gPm8T9umBwZSV2Z7vZjdTsKyy2ifGuwyEckt
 Vq9ylGERSB/aRgH/IM6X9sk0LOFC+8S3kcYDW98gbwslIfundqeAWdsUqrqEXD2Y7aD
 UvQf0PFQSvNcreG5K7CXPZ7pZVP1gRl2vBBCV+fM=
Date: Thu, 14 Feb 2019 17:59:09 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v5 PATCH 5/8] RISC-V: Compare cpuid with NR_CPUS before mapping.
In-Reply-To: <1550089092-28783-6-git-send-email-atish.patra@wdc.com>
Message-ID: <01000168ed298ba3-fea3ca2b-436b-4ce6-a0df-cebe727bf55c-000000@email.amazonses.com>
References: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
 <1550089092-28783-6-git-send-email-atish.patra@wdc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-SES-Outgoing: 2019.02.14-54.240.9.46
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_095913_508556_DC2D7E71 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Feb 2019, Atish Patra wrote:

> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -66,6 +66,11 @@ void __init setup_smp(void)
>  			found_boot_cpu = 1;
>  			continue;
>  		}
> +		if (cpuid >= NR_CPUS) {

Use nr_cpu_ids instead? Its initialized to NR_CPUS but can be restricted
if we can determine on boot how many processor we truly have.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
