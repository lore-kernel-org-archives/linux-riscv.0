Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337ABC3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=73QhMaLvmZh4JcPJWn9zi0Mmo9LVmE01lFg8NdEkO6k=; b=PVLDzzSlmMucBA
	ew9JWPj3EScUNJVw0ZWjpQL2+heZ3wrgshF8NJoA5vUESTL1t+m+ohpUU4jV7ouGGzVkcZ+ER5/6D
	fhhNK02Jscn94BwLmRKBuUdvqpViqVuv+UvBmmfc2K/kbQ+shAaMlz8vIVAi+JVptQyVPvTP7kLmE
	WkFnT3MGP/a6RSFaD1ZeLjvZzxj1uYKTm5tFE5eYMoOIOh00XMmZ/ZPi+JUbXz6VrXNzNnjpkQkJU
	ggMyElW5d1And7TjYICL2bcW1Teh8dQYDWTJ2BsNM19tAQ4SDEtw+QpQWs4Ot5StO4rjbrAQH9gzM
	kG62iYS4jOeKDiOJ+XHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLfVE-00GEdo-2n;
	Fri, 05 Jan 2024 08:24:28 +0000
Received: from montpellier.cortus.com ([185.101.208.106] helo=mail.cortus.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLfVB-00GEcO-2Q
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 08:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cortus.com; s=default;
	h=Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:Message-ID; bh=LHFwo2KKiejok+THHru/5DDuelpGOmcDfUJJh3HtpJM=;
	b=n+IG8K6vUcVVaBZCj/8x7wLU1WXOEQaj55qoMF/FnrooayhjiY44ODg/My29tRbRU5sKhIm7fWBBatF1PhvVgBBDiO9ZpvqwpsmqoiD5e9yIHlTPDVM0qUvQHVMO1byamR/DsLfflPjYeFwMqQychtZV4GzowfxhmFsJkejgsU8=;
Received: from [10.33.67.153]
	by mail.cortus.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2)
	(envelope-from <theo.zanibellato@cortus.com>)
	id 1rLfV4-0005SE-0f
	for linux-riscv@lists.infradead.org; Fri, 05 Jan 2024 09:24:22 +0100
Message-ID: <6924f053-580c-b2c3-4680-e613491d3377@cortus.com>
Date: Fri, 5 Jan 2024 09:27:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: linux-riscv@lists.infradead.org
Content-Language: en-US
From: Theo Z <theo.zanibellato@cortus.com>
Subject: Page Table A&D bits scheme
X-SA-Exim-Connect-IP: 10.33.67.153
X-SA-Exim-Mail-From: theo.zanibellato@cortus.com
X-SA-Exim-Scanned: No (on mail.cortus.com); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_002425_940034_19E32ADC 
X-CRM114-Status: UNSURE (   5.92  )
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

According to Privileged: 4.3.1 (p81)

"Two schemes to manage the A and D bits are permitted:"

* When a virtual page is accessed and the A bit is clear, or is written 
and the D bit is clear, a
page-fault exception is raised.

* When a virtual page is accessed and the A bit is clear, or is written 
and the D bit is clear, the
implementation sets the corresponding bit(s) in the PTE

Which implementation does Linux is expected to work best with?

(Unix kernel xv6 works with 2nd scheme only)

Best regards,

Theo Z


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
