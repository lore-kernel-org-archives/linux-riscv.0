Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37127CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 05:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgZ4R7EDnPkiT8UcTdJHDSSd+Q+7/YnIIOeCZe9lxNM=; b=oq8VYascNrDenM
	imgoN+NQxNcPkaoN4ccAN9KjdKdQnd8Bmxtz0fPYzHY8YBJW9ErLr7ZMBbm7xCKDgnusmSie7jlc/
	/mQS6WBviF0DbfU2zN1cuFY29jL9m3ugWAbrfADabCvTbad6H8JvyznCUkbJ8uZwHMb89+c4OzTVO
	hBHodnB6NT926wztpW9lwD6LiN+mY2XkMEbiHCG+jjdsOBqxzKA8gH2Fm1s6ZjsXc9t76eGQfSVrZ
	q3VDons114S0Uw9tWbGmjBGZtEDca57J74HQc4md82zx6KjQsBWc9pCQMjs2arhnT+jgDRRXiDhR7
	l2zEbzyyNQnPuthOXvsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6jXj-00000005EHO-2dc6;
	Thu, 09 Oct 2025 05:50:23 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6jXg-00000005EH1-43Di
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 05:50:22 +0000
Received: from [192.168.0.108] (unknown [114.241.81.247])
	by APP-03 (Coremail) with SMTP id rQCowACn73kTTedoBU42DQ--.27093S2;
	Thu, 09 Oct 2025 13:50:11 +0800 (CST)
Message-ID: <87d603ce-578d-46a7-87b1-54befccc6fad@iscas.ac.cn>
Date: Thu, 9 Oct 2025 13:50:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6.y 0/2] riscv: mm: Backport of mmap hint address fixes
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Meng Zhuo <mengzhuo@iscas.ac.cn>, Yangyu Chen <cyy@cyyself.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
References: <20251008-riscv-mmap-addr-space-6-6-v1-0-9f47574a520f@iscas.ac.cn>
 <2025100812-raven-goes-4fd8@gregkh>
 <187fe5a3-99b9-49b6-be49-3d4f6f1fb16b@iscas.ac.cn>
 <2025100920-riverbank-congress-c7ee@gregkh>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <2025100920-riverbank-congress-c7ee@gregkh>
X-CM-TRANSID: rQCowACn73kTTedoBU42DQ--.27093S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4kXw45GFW8tF1fCF1kAFb_yoW8CFy7pF
	W2qr1jyw42yryIyw1q9rsYgFZ5Ww4ktay5JFZ5CFWvvrn8Zr92grn2gFWq9Fyjvr1kW34Y
	qay5WryrZaykZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_225021_404090_323AA39C 
X-CRM114-Status: GOOD (  12.20  )
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


On 10/9/25 13:00, Greg KH wrote:
> On Thu, Oct 09, 2025 at 12:19:46PM +0800, Vivian Wang wrote:
>> [...]
> Ok, that makes a bit more sense, but again, why is this just showing up
> now?  What changed to cause this to be noticed at and needed to be fixed
> at this moment in time and not before?

As of why this came quite late in the lifetime of the 6.6.y branch, I
believe it's a combination of two factors.

Firstly, actual Sv48-capable RISC-V hardware came fairly late. Milk-V
Megrez (with Eswin EIC7700X), on which the Go TSAN thing ran, was
shipped only early this year. The DC ROMA II laptop (EIC7702X) and
Framework mainboard with the same SoC has not even shipped yet, or maybe
only shipped to developers - I'm not so certain. Most other RISC-V
machines only have Sv39.

Secondly, there is interest among some Chinese software vendors to ship
Linux distros based on a 6.6.y LTS kernel. The "RISC-V Common Kernel"
(RVCK) project [1], with support from openEuler and various HW vendors,
maintains backports on top of a 6.6.y kernel. "RockOS" [2] is a distro
maintained by PLCT Lab, ISCAS, for EIC770{0,2}X-based boards, and it has
a 6.6.y kernel branch. Both have cherry-picked the mmap patches for now.

We operate with the understanding that the official stable kernel will
not be accepting new major features and drivers, but fixes do belong in
stable, and at least from the perspective of PLCT Lab we generally try
to send patches instead of hoarding them. Hence, the earlier backport
request and this backport series.

I hope this explanation is acceptable.

Thanks,
Vivian "dramforever" Wang

PS: This 6.6 kernel thing isn't just a RISC-V thing, by the way. KylinOS
V11 has shipped in August with a 6.6 kernel. Deepin and UOS will be
shipping with 6.6, with UOS "25" shipping maybe late this year or early
2026.

[1]: https://github.com/RVCK-Project/rvck
[2]: https://docs.rockos.dev/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
