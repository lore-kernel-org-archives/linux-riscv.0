Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC185C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJDZqTHUH67+V6XSOu5kOJx/YEA2g8bKk61vfj4Wncg=; b=QwNARr3qx1TTRD
	UzYN8eXZYV+5ouhKM7lAIo1pn5qq4fSq/LihRhDuVxkouxw99v1tMmptE0WoTpQDdfA0Q8p93unD1
	AtvN0I7Epk0Hb6oVm4XKueWLVrsEwDN5FUNkVFkEfB5XXA+FZnwYMFzBe/NRoIARg1cLCeolKYsyi
	wKgMN5qIJQ7zcZjOIMUmkx4bSzbkDx+G5scHyhsISYx+EGCHXUNSLwRRpBg56VmBwW/Pf+o28uz4K
	w5PQo8m+Sdeg19C7xbWsDtTHlHSaJs8C1cx9etelpnKAWemwRXKiSt5BQWbETZgbvf5cXoN2sBsDd
	mKxZuOA7WU/rzyMnarlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SzK-00101v-0I;
	Tue, 06 Jun 2023 09:28:26 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SzH-001011-1B
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 09:28:24 +0000
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 77eae969-044c-11ee-b972-005056bdfda7;
	Tue, 06 Jun 2023 12:28:18 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Tue, 6 Jun 2023 12:28:17 +0300
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: andy.shevchenko@gmail.com, oe-kbuild-all@lists.linux.dev,
	linus.walleij@linaro.org, brgl@bgdev.pl, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: ath79: Add missing check for platform_get_irq
Message-ID: <ZH78McKA5nKU1Wg8@surfacebook>
References: <20230606031841.38665-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606031841.38665-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_022823_588695_A59E8396 
X-CRM114-Status: UNSURE (   8.85  )
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

Tue, Jun 06, 2023 at 11:18:41AM +0800, Jiasheng Jiang kirjoitti:

Is this v4?

> Add the missing check for platform_get_irq() and return error
> if it fails.
> The returned error code will be dealed with in
> module_platform_driver(ath79_gpio_driver) and the driver will not
> be registered.

No, this functional change and has not to be for the fixes unless _this_ is the
regression you are fixing. Did the driver work before at some point as after
this change?

Otherwise you have to _justify_ that this functional change won't break
existing setups (with broked IRQ in Device Tree, for example).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
