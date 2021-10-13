Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF6BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 10:46:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F387E61053
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 10:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F387E61053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74bytRojTdEQLRgJ6Y7hbafOdaJehX0B4J7+D48EMvk=; b=eMWo7SDrtvsa83
	vQnClGMH7CsT+wHV+SDcS7pI5ePhrKBpGHCa4OZq7eShlkZtX4N5ILuVxfh9bsRXm2m2B1v5wgjoc
	u+DX2vUAvK4dpylaqBfuqjOfaECSe9aJw/C0h1tun/sBl5kOgAeMXEbgOnDh2Ydie/aJ3YdcFRbB4
	ilDdibdSCP7MAPgHVcU37A/RwpKMlwAo6YLGrrZL13flwGI0si76L1dQptS+/ULGswYAv1/j4msgK
	lOGO089oXVG8nur50BACP+8m6BxB2Px6lv5nOUPVfqnIRHz/URuB+SEgY3fUb62wnQyUKorFoBrpS
	2242PdFPnLb83RLqLRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mabmG-00G5Nl-Pv; Wed, 13 Oct 2021 10:46:28 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maZmT-00FbhO-DJ; Wed, 13 Oct 2021 08:38:35 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQeI4-1mLmUM3jNe-00NgCh; Wed, 13 Oct 2021 10:38:28 +0200
Received: by mail-ed1-f52.google.com with SMTP id i20so6823336edj.10;
 Wed, 13 Oct 2021 01:38:28 -0700 (PDT)
X-Gm-Message-State: AOAM530gsgkJRuyOYNugaxLSWaK1F8GijEXob2cePwpuJo1VFute9fY6
 3KWdv23guSkaybxap2VJd9mAU/MytKDTvcST3yU=
X-Google-Smtp-Source: ABdhPJzERy7qzxbolOT39FrUcwqPdeh2fIURPv4ilmByKiguzqnvn/Xhapdln0hugnZ2cVo72Y7EAER3Sss3B8QKu2E=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr37292890wrb.336.1634114297720; 
 Wed, 13 Oct 2021 01:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211013005532.700190-1-sashal@kernel.org>
 <20211013005532.700190-11-sashal@kernel.org>
 <YWZ1om+pLmV3atTd@kroah.com>
In-Reply-To: <YWZ1om+pLmV3atTd@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Oct 2021 10:38:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2AC9-ogoxi1q+NQyBqMwrFqSZtHvZVdJ9HF+OLB3O62g@mail.gmail.com>
Message-ID: <CAK8P3a2AC9-ogoxi1q+NQyBqMwrFqSZtHvZVdJ9HF+OLB3O62g@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.10 11/11] firmware: include
 drivers/firmware/Kconfig unconditionally
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 3.4.x" <stable@vger.kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, Will Deacon <will@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Russell King <rmk+kernel@armlinux.org.uk>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Mike Rapoport <rppt@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Sergei Trofimovich <slyfox@gentoo.org>, 
 Jens Axboe <axboe@kernel.dk>, ben.widawsky@intel.com, 
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-ia64@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:nDi/1+LzlXbOlAPYcUCCCFBE2D5zk3Er24SieIgRdXRAoMxbOnN
 yYkbLN7cSgpgpHe73DnefMbUJGbFT+BgSR11MuFEwKXBx2gCAxDODmtOuq2Cgk/AxFTCqnA
 8TaYvL4j09Z8DQBglPe0cF8MDPxZ4HOGHVrBU9E3QrcSm0jE3S4E4jSUgRuHL84ME+fC6Fg
 37nd60Vhc7fScjgIYbG4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jMuVZpSl+jg=:zcrxNhUhriV3mt3hV+AEwD
 rZqi4Y9V8snglMBLx8zntI2e9UZ1webnd5wEo4htC2zgG2NskjkCc9MbyshBiAyW49lmk1IND
 mglmnVkmX2ERMgXHbDYZrNCrPtnPjNSZ2xfdN5SK+2inZfrglNAi+bihJG9C8mNbaMipXqB3R
 34zTCQ87QFo2FD4rpjf4Llwlo+kC2MxgFsR9jIB4b//HRnBWZx9QBJZJ5GuLdUErP7beDhFcn
 aWYvLwtqvaLv/yIL4m7a07MZ5NY2KiGKKuDjbPmL1bXb/TINty7NvoKdYzia6FgNg6Ceb+FW1
 WOmlvcRr82gXQlkh9zLFn8uAjvSMYUVkv9KKfIg2L5SEEa3vXGXo30TcBCNSbOfEBk/l/S0fD
 MCikAu3I0smYvCB7yqbXQmZ4Y4BjNqb2FlcmcGawqKWiGuWpTm/hpkOwpTBg7SL4KxIb8HDcn
 EPxENRDcZeAU2aysmy6oQmK9k66cbRp7fpgax/MW93ozcyM+ra4DbQHTQw66js505QGHc354f
 sZ9UXvuFo3F1C1a1AAvMT0Rg+G1fdRHBpGFs7Qyl7SxusQEQEhN0pbPxZuMy+ms127C8qR8q0
 gcuqOGU49aurpTffDw6REAwR5LNUQyjzorG5L86TUgNXVnbfUXCpg5ZGVivmP79Wgo8pByeDO
 uoZVGB9Y6hyuIb2jsAl8s61tGviAuPLMeXEdaIgr6XrUuPty4GexZC8Pr8HjPZf7jWfHkrKMN
 isntKCpNx2ONm4cPsNRHQeABkCWk8jc16rRGoiWAuK0rGiJJxcFDjvmT7+EZ3yCivASBJNjIB
 rkL2x6YomA3MeNHsamXNOeTjdkeGFoRqMNywfcN3kb1EUr6tRlUbBYrb/RKimmCoLktZt5Cze
 KZ0uwU6E5sPIYu6ua1Fw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_013833_758077_7F786EB6 
X-CRM114-Status: GOOD (  17.07  )
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

On Wed, Oct 13, 2021 at 7:58 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Tue, Oct 12, 2021 at 08:55:31PM -0400, Sasha Levin wrote:
>
> This isn't for stable kernels, it should be dropped from all of your
> AUTOSEL queues.

Agreed. The second patch that depends on this does fix a (randconfig)
build issue in stable kernels as well, but that patch is currently broken,
and the two patches combined do feel a little too invasive for addressing
such a minor issue in the stable kernels.

If anyone runs into the QCOM_SCM link failures on stable kernels, I
can come up with a more localized fix.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
