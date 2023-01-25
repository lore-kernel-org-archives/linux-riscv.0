Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A2DC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 18:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcrFRUeudHzu0DmHvkcsabKluu1HFytR6K4F6k/7YCg=; b=xyAffiYhxHk8NN
	GV+i2cX6msAXJGeGIzjkqrmnHOQKFvcQpeUzsYkM805vt0iZupX31aLrOFOb9a5f0vALndllzP+VX
	0XyA5/DJBzojzIFiuvZE3wRJoG3t1L+QfqyG1y//oXVAjfpvGrqeP1wAeAEwhf7nMf3bhTd6bV9aL
	yOxdIE8HVVDybX+dUvivved14R7bTkL3aDRVs2ExDt87XHrdZl55f6kXUp6VK8wpEl0G7bPF+4/Em
	SGvFB2RRKxhIBzs8CzXKQl/YDpc7YsGljQZm/EEVAnhmB9R92nH53S7KIHfrzgbZaJ/GW3UcLkJpX
	h1oPM46qWSRKXR9NhOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKkVa-008LAU-8L; Wed, 25 Jan 2023 18:28:30 +0000
Received: from smtpout30.security-mail.net ([85.31.212.34] helo=fx304.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKkVX-008L8t-LP
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 18:28:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by fx304.security-mail.net (Postfix) with ESMTP id 6DC129D037
	for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 19:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674671303;
	bh=VkZlMx/sz061Cm6YfPqH8mfzLS3IhHFJZRhlNITSu+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PgYGGINfgdlge6AJuhvcxeUH6V0qclH7r/w0zv6MkFIIQyoW7OeQf49pR+PV9NV8p
	 fmlbHY2+Czp6L7ta7EUF/GbRH7PuBhBb899yvjM+2Df0hJO4Fc0FQaeYABlP0TUwps
	 UDIcw6zHlNZBkl1Vkr8vv3SWe5LXy8V23EIzkm1M=
Received: from fx304 (localhost [127.0.0.1]) by fx304.security-mail.net
 (Postfix) with ESMTP id 12CB19CF5C; Wed, 25 Jan 2023 19:28:23 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx304.security-mail.net (Postfix) with ESMTPS id 596B69CF02; Wed, 25 Jan
 2023 19:28:22 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 13D2327E0491; Wed, 25 Jan 2023
 19:28:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id D166C27E0492; Wed, 25 Jan 2023 19:28:21 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 bp9IA0bk3B4o; Wed, 25 Jan 2023 19:28:21 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 4BBCB27E0461; Wed, 25 Jan 2023
 19:28:21 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <b8a6.63d174c6.58665.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu D166C27E0492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674671302;
 bh=VkZlMx/sz061Cm6YfPqH8mfzLS3IhHFJZRhlNITSu+c=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ieciS27BYzu2wBYUzqSGuXnuSzfRVUENtVPrrg66c1Z+Hj4Vn47wSgecKptHxbXVs
 18IDqNZqmf01P4UDhWYxjqH8cAsYG2Ugb0NiByorz9T42VSlyYpOaNFYFBpWB/2W5/
 t8GcNBzxo738aSURlcbP5g03wZZzKeZwUMBsK7kM=
Date: Wed, 25 Jan 2023 19:28:20 +0100
From: Jules Maselbas <jmaselbas@kalray.eu>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon
 <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng
 <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Oleg Nesterov
 <oleg@redhat.com>, Ingo Molnar <mingo@redhat.com>, Waiman Long
 <longman@redhat.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>, Christian
 Brauner <brauner@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>, Clement Leger
 <clement@clement-leger.fr>, Vincent Chardon
 <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
 <dkm@kataplop.net>, Julian Vetter <jvetter@kalray.eu>, Samuel Jones
 <sjones@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis
 <tcostis@kalray.eu>, Marius Gligor <mgligor@kalray.eu>, Jonathan Borne
 <jborne@kalray.eu>, Julien Villette <jvillette@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet
 <jhascoet@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, Guillaume
 Missonnier <gmissonnier@kalray.eu>, Alex Michon <amichon@kalray.eu>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>, Shaokun Zhang
 <zhangshaokun@hisilicon.com>, John Garry <john.garry@huawei.com>, Guangbin
 Huang <huangguangbin2@huawei.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>, Benjamin Mugnier
 <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/31] Documentation: kvx: Add basic
 documentation
Message-ID: <20230125182820.GD5952@tellis.lin.mbt.kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-2-ysionneau@kalray.eu> <Y8z7v53A/UDKFd7j@debian.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8z7v53A/UDKFd7j@debian.me>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_102827_874825_1E2D0BD0 
X-CRM114-Status: GOOD (  10.05  )
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

Hi Bagas,

Thanks for taking your time and effort to improve the documentation.
We not only need to clean the documention syntax and wording but also
its content. I am tempted to apply all your proposed changes first and
then work on improving and correcting the documentation.

However I am not very sure on how to integrate your changes and give
proper contribution attributions. Any insights on this would be greatly
appreciated.

Thanks
-- Jules






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
