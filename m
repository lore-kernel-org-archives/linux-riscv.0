Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A860C4706C
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jan 2024 17:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6LkHceS2Urk+VcFej9NPqU+3TV1X0ydcNTEg+JZSAk=; b=fzcuV7wX6HKJ5x
	7H2S/FG9llVSaF/O/NfVCKazFFMfD5fejT14VFGYI3nydacb2Bc8EoSTHpxfkSz+ZvnJ4IQDbef8H
	h+DMivQSU40DDS2lVWaL2y3ipVbUG29i6qV4W63MKAzLATfkk8RiUnh5+fEskVaoEVrFoO0UqEezA
	JnBPVFIKSjjTcmD4dVpqnixo1ctPbFQ/qHkHywmOjFv3rI2zBSX36ErtUBMy8qzw0m7ggFGNZkEUg
	d05ATVqmzjU6If9IRmchloDOO+hMg81cbrkltR5YIEUQyVlZMUONubWLaQlgrl3A2poBYZ1pl8DYC
	KJH9xEhipBlT6Sl0AJjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOhs1-005SWj-15;
	Sat, 13 Jan 2024 17:32:33 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOhrz-005SWX-22
	for linux-riscv@bombadil.infradead.org;
	Sat, 13 Jan 2024 17:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9n72WKKKGYhqMdswP9Jj7VEaJwHs3IyzRS4xEll9rYI=; b=WjEYYCAw3qxmaO4t7+gueXxISt
	4es+EosncHh62DW41RHNpXa8q3l4i2FT+OOqUeftQ+BC3AD1jZHqiB9oBm6BtTq57Ak7S1vy8jknN
	iV1GwMzCKGBn/mqp+2JRA61dp23smrxw7fYXYy8HPFmiKV602LCSwL+kY0OLeKiBzNkTtTpuDgymJ
	iWUO0sKHaiFQZ+dmJSK4F4S12v7EuHar9/N184C5NxL29xPsXwGuHiY7SYdEJQifK1JkDEsFq9823
	UnuUEKx51q+fY43shb+ppzPJMygQUeC29JqriP1BkkJhMEH6rbMrMN0/T/nrjfpdmdVo2v/sn80ir
	rqcbJC9Q==;
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOhpj-00BvBR-1i
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jan 2024 17:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1705166999; bh=9n72WKKKGYhqMdswP9Jj7VEaJwHs3IyzRS4xEll9rYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bxNEiju7nvWR9Qk87tm3ETTK/lZzB+bkbS5zuNwyb6n1/h8UW4l1gnjwIQI59L8LW
	 4ntUS4tk+WQpeSN8vQHUO840Lm84oYsAyFaJ0VySn1a6Jgug5XfzY2MI8E/2uIgpd9
	 mqYIu8sU/poXoVkDKDlTVsFrH6DH7F9atuk3Ngs8=
Received: from cyy-pc.lan ([218.70.255.58])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id 6B9BD474; Sun, 14 Jan 2024 01:26:57 +0800
X-QQ-mid: xmsmtpt1705166817tpw8s6zxo
Message-ID: <tencent_F9568C6D8872E30EDFAF20ADF686A31D6E06@qq.com>
X-QQ-XMAILINFO: MpYZqmNm/7vMFQChzuZcNMPEZCicAYxwA3bgPt5oBo3Izruh5SDSD1/vjfZIJe
	 7IBevBAJJvXhgU9B+SMnjtsigosK99wXz45XosSRmglerB4jvY07z2ypp/fWsmUwQLZ3rc4lgw08
	 0I7c4e9ssoe0Ldzh7aDfnOwg3ItEwflH/BF3rnY12bJD7xRo/M9ZSFqZABHgOKsvejN9E8BhUm2D
	 boo2oTfkaKEQcLeunqTCbSyoFYN07nmPJtRl8ODOOCFEIFDrcTWZHY0wX7tuAYx6PuS1SJSjXYS2
	 bOEVhUBovGWI01NTW0yrPLyhFe33CdafAdJAf1SrjfgmRNyBqHdsDLZz7UlH9vHjFxvMrmU3dy5N
	 45B3OLgeNOTV6WEfUAL3IRazwMFr8aKB9LH+gkUjByXzXtwcrFHxXmMsjpssUiAlF1duH66p4Avr
	 84W1XexcvjfBXHBgXn5BFW2+ogGmclzTetljdN04BAku6PGLStHt7Vs8LRhxh82ARYq6o+Md+kgL
	 NJxin6UVnpDBzYjg39bVX6PvJK3U699wPbe+uQtu79mMUgZ8WzO3iGxiOmirlrq0y8rVSXD7t5iM
	 GYsxJ8FGK+3+d6K/ILCMvSeHJKdwbCtWTtAdunvZubJwOzaynOeC1geHeMxH34ZZztsMnz79vLpe
	 YGChZ7mLTbp5fUDptY+VCdcdL4Fy7KWDgIBg7MTpy9RLjNazovEqG5960r71+VO+2pza3/A/dviG
	 n0++0sT/QAFpxAF7w8YGMItABROQoWSr+xES2srhGGf311gs4BzoOgOKZhvP5I3hexb4JG++/Bt2
	 OrIfwjVtIS7Tr5jYRQvXT+uKYpMsexCp3J8Xip53EB0io7BHq+H8zipn5FRMnuzONGJrAQAd9WC+
	 I81SztmB19m/xMFkY6qEQ5yrj6ENCd3r8gON2zNjMQDmvw7Tdjfni3yzimGkBOehL2PYtcjs/KFk
	 RJDRSTS7yAifSWQWUnc3KxIF9qzMRd
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: charlie@rivosinc.com
Cc: alexghiti@rivosinc.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	jrtc27@jrtc27.com,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	mick@ics.forth.gr,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v10 0/4] RISC-V: mm: Make SV48 the default address space
Date: Sun, 14 Jan 2024 01:26:57 +0800
X-OQ-MSGID: <20240113172657.997104-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20230809232218.849726-1-charlie@rivosinc.com>
References: <20230809232218.849726-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_173013_087447_1689DF59 
X-CRM114-Status: GOOD (  11.23  )
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

Hi, Charlie

Although this patchset has been merged I still have some questions about
this patchset. Because it breaks regular mmap if address >= 38 bits on
sv48 / sv57 capable systems like qemu. For example, If a userspace program
wants to mmap an anonymous page to addr=(1<<45) on an sv48 capable system,
it will fail and kernel will mmaped to another sv39 address since it does
not meet the requirement to use sv48 as you wrote:

>	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
>		mmap_end = VA_USER_SV48;			\
>	else							\
>		mmap_end = VA_USER_SV39;			\

Then, How can a userspace program create a mmap with a hint if the address
>= (1<<38) after your patch without MAP_FIXED? The only way to do this is
to pass a hint >= (1<<47) on mmap syscall then kernel will return a random
address in sv48 address space but the hint address gets lost. I think this
violate the principle of mmap syscall as kernel should take the hint and
attempt to create the mapping there.

I don't think patching in this way is right. However, if we only revert
this patch, some programs relying on mmap to return address with effective
bits <= 48 will still be an issue and it might expand to other ISAs if
they implement larger virtual address space like RISC-V sv57. A better way
to solve this might be adding a MAP_48BIT flag to mmap like MAP_32BIT has
been introduced for decades.

Thanks,
Yangyu Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
