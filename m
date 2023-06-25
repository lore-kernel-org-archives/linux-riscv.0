Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19832EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCLT3klmQe8uYCZzOybFbbHm6318CDKTdzrjMFMqe40=; b=FM5ZkB3CjNF2U7
	5Of1+IWlPG0U+Dld3HEwT/H9qOuHImTHk+GokI3wDZWfqMEXuDpUTiqc1VJ+VlSxj4VHpfxry2yO3
	jVzS3az4CtoIgOvBiCtkq4XoVEsjA5ZsB1onXhX1i5y1vBhJl9tjDrJ2t/+fFKqlQpPNYm2+MRDHR
	tqDBToqlye2dKO9LIYYcTCLIueNcus3/0W7CUCVUI3YmPT+namROSJ6V2GB0yK+5xRAA8IPHXuEXk
	TDU2shxZVHQ8saYTViDbB1rLnZUN1DoARwmwPkFRMS2UQoHcuRcp4jh4I4UIwUxWayQcHbiVMWcma
	yKz0snNlMP5ceDio+Mow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWW2-008fKb-12;
	Sun, 25 Jun 2023 20:39:22 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWVz-008fK7-26
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 20:39:20 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 989DD6E3;
	Sun, 25 Jun 2023 20:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 989DD6E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1687725550; bh=91KDkRnMDMkm4N0w41LCfJDj2m5VI4NpTsLsFSLzOpg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=G+4t+1Ntam7xjexenOC304wsk0nBhdNKPM0FeXhBrDv/yRwEI1Mp9lS86YIt0z1Zy
	 AbBsfQKBdSlKUQWt+QVIivwX8KwTX2PYkspYW9F7wsOjB3coYYOwPaAFF3O046QSIe
	 59bwzZJu5r1jGmSP7mLCh2lhutjDphoywRQU9WJNjSLjnuBMRqrnBa7SxzvnZr5Z1x
	 g+jtbAh92YsnxBzX17F+x/zs6nvBVOZdNAa/80vFSfguUuS+o5kEdpHrH8rfsTGkUg
	 LMf2QWKxHzk0GzQuEilotmTQlsXVGovUM/NPfPEhkWmER7yqvLttu8nA6HSQNMw/HL
	 EWt7XHcNPIbmg==
From: Jonathan Corbet <corbet@lwn.net>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 2/3] Documentation: riscv: Add early boot document
In-Reply-To: <CAHVXubhk2xf59XbNiRYKdr4J1yadpeX0KMgW1cFMR4GRN97MYA@mail.gmail.com>
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
 <20230623095547.51881-2-alexghiti@rivosinc.com>
 <87o7l6mgxg.fsf@meer.lwn.net>
 <CAHVXubhk2xf59XbNiRYKdr4J1yadpeX0KMgW1cFMR4GRN97MYA@mail.gmail.com>
Date: Sun, 25 Jun 2023 14:39:09 -0600
Message-ID: <877crrl1jm.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_133919_697577_89402ED0 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org, =?utf-8?B?Qmo=?= =?utf-8?B?w7ZybiBUw7ZwZWw=?= <bjorn@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Song Shuai <songshuaishuai@tinylab.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Alexandre Ghiti <alexghiti@rivosinc.com> writes:

>> Please don't use :c:func:.  If you just write setup_vm(), all the right
>> magic will happen.
>
> The magic indeed happens with virt_to_phys()/phys_to_virt(), but not
> with setup_vm(): is there something we should do when declaring those
> functions?

If the function in question has no kerneldoc comment, there will be
nothing to make the magic link to.  In other words, if you want it to
link to the documentation, the documentation needs to actually exist :)

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
