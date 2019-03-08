Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B00DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AEA92085A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kF2XOWkP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AEA92085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RY7JerdkHqsLxe8rNkvYtyVQBtBVkLraDbl/erZvH0s=; b=kF2
	XOWkPTnj1pEdiUGjkv9gm4PSLYAMgkPBtVWe37A7AlIvhW5hpnE5Uxda6ADSoY5G44kD4RKd9L6WW
	90Q9yoxQ8gCNvD82dsmU4gCziwIWetnkgUpKG+6FHXbwUOrc6EP1yBdEellFlhwCzJahPV+4hp07E
	XFlwh2qn+D5/X/Q1ieViDNjla9qcYhHbVux9XvUPvLUGsd7Wf2DgBNDUD6rg34nDDdJCg8O8LomAS
	+9gC2UfNf773ZylYk4S8Xx1Am3nCkKA7atEhA6nhIXLGrcSinn8ENEWdTtUVCtRErAmZuZy+FRKfS
	ulK9lniGYzAivvNBtkwstX/g3Vg9FvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2Es7-0005Ui-TM; Fri, 08 Mar 2019 12:45:07 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Es4-0004Y1-5P
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 12:45:05 +0000
Received: from orion.localdomain ([95.117.97.241]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N6bPS-1h0eOv3BrK-0183ts; Fri, 08 Mar 2019 13:44:55 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: Debian build polishing
Date: Fri,  8 Mar 2019 13:44:19 +0100
Message-Id: <1552049064-32044-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:jdbW23/4ghILwIplAy6XJQc6Z8fdTfXkxdh6S1EwuIyw7WIrHTh
 OInxqbLJSC745PYd4K5lPNtBWGgQV/fgVlNcI0VRyHhczyauxA0IZg44O2/Y2HcBsFaUgJL
 AuRLczXLsW8pRpc3avB+CiJaIzS4Kj9k2sU+c00hw0ET3z+aDnKCHsDqKRGElB3Jsex8n5l
 ZWmunmPJI2iEbUvpS/1Vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rFLE0CIvP0s=:Z1cGy8778McGRyBXeAPAea
 r5a74Jts7tbIeG/9oTF25b2MdD17b4b47BokYkWnozLp7U61n3bHC9E5A+tI2bn6iR8fwo61L
 gm0UnCFoJW5C5cz/9uURAwqBOaQb0lh8cGiN/eeRsj20kj/UNKvbVJmjcH2wlNVpjEzcChLJC
 cQLZBJP1FeH2+CT9fVFhJxV4Pvre6p9n0vR1pIBEV/en+4qBn7Qdi+TFyagua+ct/ifMEHhg6
 93IVgzm73AioZ2r/iwJPoaOp9wGgggT3XYPr7hePMzKoknJkSA9zMMKOIlZN3VAtXZXaHo1fe
 lzMHwp5vDKk+7qRMs2SV18AtQARzB2/oBzvHJisR5xPd89YnR8ik99EK2ONSceLvsV9pFE/Mb
 7ez82dkzzBG82S6viplefqBuPnXyXGYkpkKD5u+OoZizCzyTPON/8Wj2zLKC32zr+N5Azy9F/
 6BiNtXnxnIazAbVVtYFieP/n1perYLBAnjJjACQbewUp3OtngP3C6ofL8UrDxW2gijo4yNzCQ
 ozv+i/aUofWFdKR7xaI5cxwGRpXf8hXpSv6vtXZFlmx9HQdcXyiPv1xSrUp3+4EWktDamzq+x
 M21etRDS4rYs4JEb+UCj9Q2Oo/EZONca94yz7OAufukfnF72ELJ1MtrLMwtkG/RV6h7DJuXsJ
 /MW6xBlQ6p8LTxNAbE85MAQScg1Kuoe2iyQXv78pPoOKZSgV7jaaTZdM82Id1KMCTqUeC86GT
 M7VCfL+k1eWNzLtZHy8qDFF92tvN9lemuC8EOg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_044504_515067_C5BBBD54 
X-CRM114-Status: UNSURE (   9.26  )
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
Cc: michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
 yamada.masahiro@socionext.com, apw@canonical.com, joe@perches.com,
 linux-riscv@lists.infradead.org, info@metux.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi folks,


here're some patches for polishing up the Debian packaging stuff,
so it can be directly used w/ usual Debian machinery like
pbuilder, git-buildpackage, dck-buildpackage, etc.

These expect debian/rules to exist in the unpacked/patched tree
and drive the whole build. Currently 'make deb-pkg' does it in
the opposite direction - it creates debian/rules and fills in
some data, that's derived from .config etc.

My goal is building the kernel package in exactly the same way as
any other Debian package - so there must be a debian/rules as the
primary entry point. To do that, w/ minimal change and w/o breaking
the existing machinery, I'm going in several steps:

#1: add Makefile rules for retrieving missing makefile-internal
    variables kernel config system .config (eg. kernel arch).

    this could be used for other build systems, too.
    just call: `make kernelarch` or `make kernellocalversion`

#2: add an env variable for changing the name of the rules file
    generated by mkdebian. When coming from an existing rules
    file, we can prevent this from being overwritten.

#3: add a generic debian/rules file, that calls mkdebian to
    create the remaining debian control files (w/ rules redirected
    into nirvana)

The existing `make deb-pkg` is bypassed and remains ontouched.

One point still puzzling me: once the debian/rules is applied and
somebody calls `make deb-pkg`, he'll end up w/ unclean tree, as
now a git-tracked file is changed.

Perhaps I just change deb-pkg to call debian/rules then, but I'd
like to hear your oppinions about this, before.


What do you think about that ?


--mtx



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
