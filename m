Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B0CC77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZK7aNLfY23EVwPnEIrzEwgSUI+yPbfDLlqhnrCWXRk=; b=beki7Wz208qkQ7
	JlDV+Mn8D+HeVYBqzXojphSBikJ2Nezy4PY5WK7SHRR67jcxjNFwjOWP654lSySK/luG7Ldc1UT5a
	/0/FnOwMJ17gnLkIrLtE3XI1PdSNyR/jWsAqHg4xKPBtflcdhBfs2wysjprWYInzL9iQRwueJEih8
	Lm6E5K0nuvlG1S0F/+2vaUgilujuBPspSNAZqwLzGRXQORSjcr0XHVLAE+L9cgyqpkFG+N99NTvtv
	J7EFCX4nQSinb/mX+88HOzpDTzcV3XXAH9fb6J9eEqvmn/EMQnx1A+KfnikdWriNbrBXgaXV9qkR7
	HqqPNuusF26JKE5/BMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pry3p-0061LW-1L;
	Thu, 27 Apr 2023 09:37:09 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pry3l-0061Jq-1n
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 09:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682588207; bh=7GwSg/VETfevsc3piSQWo4R9qz03aZ3BJS+mJ+1KmqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Sa/KceNIgw3JFyuNYbDyW1jp60+irtCPXROiqGrgYbbAv6FEavKnrPW6MMHYXxX2x
	 dkg5ZhSS+hakNecHrJkSY1oJ7M1fKrUsVdEyInzUq/AKzrcfzJMx0RzkCKGAbZ+pCj
	 vdBqgZvRhMHCzkollhG3D/aIA7oFjpUBscqa00Oc=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 91BAA2AE; Thu, 27 Apr 2023 17:36:27 +0800
X-QQ-mid: xmsmtpt1682588187tigkwr02y
Message-ID: <tencent_D9A598A810BDC656BE2BC15A6D0FC76C5C07@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjDF03k4K0vSOU3wg7BGGYLofnVha6/an8Aa/x9/8DpfwPP21hQr
	 2Kny59+lA3mDsczPLeIBmCS1gSizPT0UoVZUzDYgt63Tn9iP0nq6vFt3A6H40oVkGYkFIKDCwlad
	 B8PI96uF2vElvY9aOzRZUj0BOgrOUy+bcz/lrr3gAh351iBSf2NaKo6VPqYxHsTfOrbz8ritH0/0
	 5mqEkAc8xQTkPGcDvr2RIggy9v+denE9SjJeMoiJzFxpEqdlupvjlLPPu9jSU4HUves4m476ricW
	 kjhJGy6geNVa+POtdQlYToO/BI8PEqUOyl5Y2r0QIMIoXuvgFgIc3pA80Wl6GmEDAdvig/guuWI+
	 RDqybH5517LDK4TJPbVwa/woWWbG4tRVfjgKK7zUG8F9mB0BFHaoXxGQk4ExCs5u0AuSA9P8V+YI
	 oxUJUeTGCV41EUDBCxJQw2wyQ/inldOUNeQDkqkr/jiK1chwIhBdbCUlsscWShnXD1NTgyfHWpaC
	 u9a7dDJ9HCgKX48JYTCzlHrEZ2LSJEocV6JRojlZGFuLtmYNvBprK0XI5m2WgHWGjpvxpeb9kHdl
	 27s6fXY6I7BCEeJv59f8gt4w3EEVXUVBmYvoGY2d7/PLjC2DK5p4ZYQn1ZZMjYXItRjVjadY0Xc5
	 My+9I8QsV9cRkZ8GoGFj5mterx2ZKy/XuoBsWAA3FKqtswj6QdCDySTPDA7+pBDXIFL/zD7lIqvz
	 TPnH8nTvBU/2UzFz0G3bb4TZ8z6tAjQWC/s1l+HRMHlMoQmIOssoBZJNZPWPtUOMWOd8MvnhIuex
	 PMlHW+HRlMvmwEB6D4RX3x2wzGjwvMgjz8JE/8qAQCcG7GohTKYjA5e7Y1jOdV2ZXCnuovRIb43O
	 7F7toposXsS4F1U+8gikXkY6hlKMp4d/beQbVmsP9n50uVjsRyK02716efJ6gQ//JaKVtiZsMpU/
	 etznZH4ZiPQPUvN6A0b0Fcb96FHJ0Z9IIcXMklGgzuENsDUq34Mw==
From: Yangyu Chen <cyy@cyyself.name>
To: conor.dooley@microchip.com
Cc: ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	cyy@cyyself.name,
	i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	soha@lohu.info,
	twd2.me@gmail.com
Subject: Re: [PATCH 1/2] riscv: allow case-insensitive ISA string parsing
Date: Thu, 27 Apr 2023 17:36:25 +0800
X-OQ-MSGID: <20230427093625.155634-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427-unveiling-kiwi-631e966f77cc@wendy>
References: <20230427-unveiling-kiwi-631e966f77cc@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_023705_912183_13212FD7 
X-CRM114-Status: GOOD (  15.40  )
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

Hi, Conor

I have a different opinion about whether the isa string length should be
checked.

On Thu, 27 Apr 2023 10:04:34 +0100, Conor Dooley wrote:
> Preventing the input of absolute rubbish is dt-validate's job & if the dtb
> itself has been corrupted somehow I suspect that we have bigger problems
> than checking for "rv" will solve.

> > also do a strlen(isa) >= 4 check first, though. of_property_read_string()
> > will succeed even when the string is "".

> I don't think that checking that there are at least 4 characters isn't
> even sufficient. Either we should confirm that this is a valid riscv,isa
> to run on (so rv##ima w/ ## matching the kernel) or not bother at all.

What will happen if we have a bootloader in the future which allows
overriding isa string in the DT or ACPI table, the memory corruption could
happen if we didn't check it first.

Although the kernel will not boot in this case, anything about the user
input string should be parse carefuly that you never know what the future
code will be but leave a checker here will remind someone who will change
the parse in the future to check the length carefully.

So I agree with drew, we should do check strlen before check the first
two characters.

On Thu, 27 Apr 2023 10:04:34 +0100, Conor Dooley wrote:
> It's a different issue though, and I'd be inclined to revisit it in the
> future when the ACPI stuff is in, along with perhaps the cleanup parts
> of Heiko's series too.

Agreed.

Thanks,
Yangyu Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
