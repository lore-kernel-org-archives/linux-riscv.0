Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74665EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpVuCcE/1l2ixMjUskj3GyOwOGfcjeyCqzK+/ycE/hE=; b=42V+l2kLwXBhDT
	YoxTl+60Ho3UXPrgsGk/Ap/maeMZ2sqlIYrea2ewrnKXv6VFY6LzC2/68/czRceXASOQAlI+Uq/Tm
	ZmGdLqG6jJVuIpNwLt7k0CrduHjmU4RUStypuOKFqNaPdQufGLQj1QO65UwxnCH2NqzfzKvtV74yw
	6ftxHTgKg/7d62ce76dgMb78jaqW0bLLLcUXRPOG1paeAHzgHUq4T9Dupuol1Fp1to4/xauzsOIUW
	l1qqN0l6fTpqUvZ7iCgAXXQQEUR0l6M1SFX1/kKkB4Iv224zaO62nIWouhd4RvJQZTCHsLWoiFEWS
	+D//MUXlNKwO0jotlCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJAN-003OEt-0H;
	Mon, 17 Jul 2023 08:01:11 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJAI-003ODe-2K
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 08:01:09 +0000
Received: from [134.238.80.3] (helo=[10.224.195.170])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qLJA0-00AssG-Sg; Mon, 17 Jul 2023 09:00:48 +0100
Message-ID: <96641e09-c676-2702-149c-885002f45a64@codethink.co.uk>
Date: Mon, 17 Jul 2023 09:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] Add support for Allwinner D1 CAN controllers
To: Jookia <contact@jookia.org>, linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 linux-riscv@lists.infradead.org, Fabien Poussin <fabien.poussin@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>
References: <20230715112523.2533742-1-contact@jookia.org>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230715112523.2533742-1-contact@jookia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_010106_759150_10D3F150 
X-CRM114-Status: UNSURE (   7.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 15/07/2023 12:25, Jookia wrote:
> From: John Watts <contact@jookia.org>

It would be better if you sent your sending email to be the same
as the from, I think you'd technically need a signed-off-by from
"Jookia" as well.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
