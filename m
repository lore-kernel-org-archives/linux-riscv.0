Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876A5C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2+sX8aLaz46UjbhjfXl1QUqvv2hbAgAtGJB90Pu92c=; b=gZMfVtOgjCZWVC
	Vrbsqayyp6jUmFzQ57QsLkwSaOMvLu9Q7KJ5R3TcgIj9keq87eDKA2CSMD4HTyPadGw3JdsFPJhdg
	ewCKJvjX5URlBNLtKV/8QKgpKR1imbAGL4+tfEc0p97uV+yEtlhfLUNUX5IXy9ZNmTUVDXCf5kfQZ
	lafLr1aLe4sVWYXZQ4kgtXp7NuwClc0rVnM8xqbwEiSESpGx8RQIRYr7WBizFda8y3OBqx3AUfv5A
	1neayFygkH8C1BggOLY/cu3fUYTkT1kq7Bnu7Cky5O+BNQapGQgeDO6O6ipJKT4ATu7P31DAu0n3O
	fYmr91LMF8MDEAwCP7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjam2-00000000aMe-0SUz;
	Mon, 11 Mar 2024 08:12:43 +0000
Received: from wfhigh8-smtp.messagingengine.com ([64.147.123.159])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjalw-00000000aIw-3Fze
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 08:12:40 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 567DD180007B;
	Mon, 11 Mar 2024 04:12:29 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 11 Mar 2024 04:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1710144748; x=1710231148; bh=PMKZPfEwcS
	Q78wLeahkLcYEmHCdBj1QCDuMjYEL03Wk=; b=IoDtJtiLpfktPzsYZrn7C0zJci
	12cXCvFXJzUYlLLfAUz5lCoMRyZ0kPNY0Op6sQKzbjbX7p7Nv9Arm3C5cXZRK3b6
	1mSnvfF8AhhlaOWByffQnLdj5OsvooVFTQoaqOvUz9auut+/9+0j+MkCA/gHqM5Q
	ij8glliCiMoH3hMm9a+VmtlJU/E90DuxgxnjTwl5Ba/XqsBbHju4dTcDyEZt1dug
	B/LU45vyhiaRYVqw7WtBcKhilwRvn9STHfvgKE+smAByVowK/khK12BjWVn3QWez
	y8KkbyPyurMkbZeqVenFAIdq2NOjjq6jmT3/+YUGmSPfW+1aaJ42qrS6MM8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710144748; x=1710231148; bh=PMKZPfEwcSQ78wLeahkLcYEmHCdB
	j1QCDuMjYEL03Wk=; b=oEXzuw6Mpz+GYr70t5J4toc9WNGG5V3OU37/kn8d/Rn1
	6VCEs+Zy5lYYfUBC1JSN4lxOsqfe3sqgHebzKy/uXW8tJhUWStBbrNrxzZhoa4Zq
	RgZRrrm0m2r327re1JOCk12TKue+1k8q6B9uRldy69Sbp0U+tcWHW9U7VQk28t4R
	3j8KyRLnnbsAntrwjozPBYfaWdf8d7Xc/kEJifRjdzgrb2AE7iKz2uScrbMOnUO6
	IysdlQYNqqXEyWl2dOCkLa/pN7Vl7bW3Zhm0ZnX5K/FH7NrT96WhiWkrzVWhS6aA
	Ylk3k/FTO6HTj8XmP8fFU5zv6T/V4rqjW947kDYGAQ==
X-ME-Sender: <xms:7LzuZfrx-jPIABADQf1Joplc0nue08dTcqY7ZU-NKlC5t3BAwwlkYA>
    <xme:7LzuZZq_rb0ncgdL3uHnEjzjVNSz36h0wwpuGuKKzjZtQrqu8KSovwbYn-vgATX8W
    kFL7lAKgzOAUwvG21Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjedtgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:7LzuZcNIdwLr3cbZ0PEc6MPOBdldEu6YtRC-G7esaTRZW076qNTuBQ>
    <xmx:7LzuZS6Z0Kpv1N97285hIyF8ykda1RijaOFGe8aDX3n3ZAHhl4rXBw>
    <xmx:7LzuZe5QHHvHTKIPNfHCmux1T8Ph11BVU7cJyAFE622FKz68ib2oQQ>
    <xmx:7LzuZUlYAwoV1Fmc_H18NQmeVY7yNR5kTGLjxSMKfcS4StHh2022ZzYmx4I>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7F5EFB6008D; Mon, 11 Mar 2024 04:12:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
MIME-Version: 1.0
Message-Id: <1f827492-2a68-4753-aac2-fcbdca51e460@app.fastmail.com>
In-Reply-To: <20240306-waltz-facial-9e4e1b792053@spud>
References: <20240306-waltz-facial-9e4e1b792053@spud>
Date: Mon, 11 Mar 2024 09:12:08 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, soc@kernel.org
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Devicetree fixes for v6.8-final
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_011237_208226_C0F44B74 
X-CRM114-Status: UNSURE (   9.11  )
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

On Wed, Mar 6, 2024, at 19:08, Conor Dooley wrote:
> Hey Arnd,
>
> I know it is pretty late in the day here for fixes, and I would've kept
> the builtin dtb fix as v6.9 material, but Geert reported yesterday that
> boot was broken on the jh7100 platforms due to a fix that I sent in my
> last PR.

Sorry I missed them last week. I added this to the soc/dt branch
for 6.9 now. You might want to ask stable@vger.kernel.org for a
backport after -rc1 is out if they don't automatically pick them
up.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
