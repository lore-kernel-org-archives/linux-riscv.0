Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500C2CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 06:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMBGbLIV+rFa6hpSR8V+F14RX37HrGaQB+6gPLKz6Rc=; b=C8MYXIGqO6Rbmt
	AnVosWwGI/+kkKdvYHDfKMyx4U83da6/LFVsxM0189Hi27MSDZN84e4Lm5JOsUaX79SfyK1Xvqkka
	P1mNO4AnPjiWK46XcT0ujpbgTeU6i+mUzMByOeLm21FEIDkjf8TERc/uu6ZNCWhACGjRzZsO6m8mS
	DhWydW9+gjPIptpvk9S2hhBt09nMfLoI+m6WRiX/fOsYKcyIZXj8VKitt8cmPa3zKoVmzsmNeXUSs
	YZ8tyPZMPupwUd/nc+/dFGhabbqeQPTWIDsVY9R3wrCneATaHIgPOE2F25QhlapBFGK3lqidmONRM
	5hoKlgoZD5Jwl7gasqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ZuD-00000008wS6-1mNs;
	Mon, 22 Sep 2025 06:20:09 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zu9-00000008wQs-0fit
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 06:20:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60CB1443C6;
	Mon, 22 Sep 2025 06:19:57 +0000 (UTC)
Message-ID: <bfffde06-5d4c-4e2c-adfe-e48590bf2f3d@ghiti.fr>
Date: Mon, 22 Sep 2025 08:19:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Use an atomic xchg in pudp_huge_get_and_clear()
To: Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250814-dev-alex-thp_pud_xchg-v1-1-b4704dfae206@rivosinc.com>
 <c8afb3b4-e5d5-628b-6bce-0b1b3137a667@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <c8afb3b4-e5d5-628b-6bce-0b1b3137a667@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehjeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephffhuddtveegleeggeefledtudfhudelvdetudfhgeffffeigffgkeethfejudejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehpjhifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepl
 hhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_232005_346258_7BC5EC14 
X-CRM114-Status: GOOD (  11.26  )
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

On 9/20/25 03:39, Paul Walmsley wrote:
> Hi Alex,
>
> On Thu, 14 Aug 2025, Alexandre Ghiti wrote:
>
>> Make sure we return the right pud value and not a value that could
>> have been overwritten in between by a different core.
>>
>> Fixes: c3cc2a4a3a23 ("riscv: Add support for PUD THP")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>> Note that this will conflict with
>> https://lore.kernel.org/linux-riscv/20250625063753.77511-1-ajd@linux.ibm.com/
>> if applied after 6.17.
> Two quick questions on this one:
>
> - I see that you're using atomic_long_xchg() here and in some similar
> functions in pgtable.h, rather than xchg().  Was curious about the
> rationale for that?


Both functions amount to the same, I just used the same function as for 
existing similar functions.


>
> - x86 avoids the xchg() for !CONFIG_SMP.  Should we do the same?


Sounds like micro optimization to me, but up to you.


>
> thanks,
>
> - Paul
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
