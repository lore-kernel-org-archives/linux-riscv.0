Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB195C83F34
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 07:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7C5FQ7OtdFKJEo7ADfbG96SGSeOKsHo0MDuYr+WLZg=; b=C+YermUg+5/VwT
	/T4ybbkCas8adBQrq3Yr91EBEUUVcD6oq1uboeXL92EPybdDKXamwzjsBipepTBLQZVmsA4LQhqmO
	G27F5nNS9XpMrsllBh9kxRH/z8DzU1is1RD83z3k1wUlsCUiyCjONJSSxQadnYLrnQDXOJv1+Comy
	LGlt9tkHzjW5MxQ9mjao61QskRhhLIxqCEhG4Q0657BB9mOGYFptWcnFy6/tDbSp0oygFjjT6x/8F
	/9kM/xlY0vAXqtBkTFyXcBv7E9m0euFKC5vk6puEDEMbMMBMNNuc7hAFS3lvg9tnlNJisDVcOnpSq
	BA++qwxx3bFGpIBDKWYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7TN-00000001f5K-1un5;
	Tue, 22 Jul 2025 07:31:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7RM-00000001eTd-2KPG
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 07:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DEDB4A55C4F;
	Tue, 22 Jul 2025 07:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30227C4CEEB;
	Tue, 22 Jul 2025 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753169371;
	bh=nKkrBEXDkFhE4Q140RSFJyannMs8qaWSKG1ptZYZT5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BIe0vLl83wXR3uvsWpa/HiW3iqXMyxFVsJuhJ69sdIASJYxdoSj45sASRJtdL7DyO
	 4tNXqZLXuOCCrb+ftu/Yw+N+spt1BRFYkWBwRkGvE1fV7d7zXTiGTviuBqVYpwK2E8
	 LUsCd2u6vLOJD2SSg94xdFWkmVyhDVsXgamMv49bUirwRs4rUvKXWG/a5P+X6qXX/+
	 laYPxlo33Zog2sH8b6rX2/JGpPCqziAeifg5Q42RXzI0Hul0GmQ/4y90v28vAUtix6
	 QYl0PYwrrWaONSWqqgMQdC5n7jfl1o306yJ6Y4A+n5VXU1csZNCRvcnrkeflhXfGgc
	 iUQuJJVIUPjPQ==
Date: Tue, 22 Jul 2025 09:29:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 07/10] riscv: Add Anlogic SoC famly Kconfig support
Message-ID: <20250722-berserk-octopus-of-destiny-f4475e@kuoka>
References: <20250721-dr1v90-basic-dt-v1-0-5740c5199c47@pigmoral.tech>
 <20250721-dr1v90-basic-dt-v1-7-5740c5199c47@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250721-dr1v90-basic-dt-v1-7-5740c5199c47@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_002932_655737_4DE43F5F 
X-CRM114-Status: GOOD (  14.22  )
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

On Mon, Jul 21, 2025 at 11:46:13PM +0800, Junhui Liu wrote:
> The first SoC in the Anlogic series is DR1V90, which contains a RISC-V
> core from Nuclei.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/Kconfig.socs | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index a9c3d2f6debca1469f4a912b3414711eb709baab..de163cdddcda1c08e7c9e98716eaf043d4c4555a 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -1,5 +1,10 @@
>  menu "SoC selection"
>  
> +config ARCH_ANLOGIC
> +	bool "Anlogic SoCs"
> +	help
> +		This enables support for Anlogic SoC platform hardware.

Wrong indentation. See everything else in this file or just read coding
style.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
