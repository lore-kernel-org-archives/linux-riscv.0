Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B88C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gb10ljOW0yJTLA4/FPMJk5QDpkxbGWR/p80FNlAZp2g=; b=asWqBTwkIa0U9S
	2SH10G8si4jlbhy0UxfVCSbp+KdNRWTIAwFL3wVZ4dbOhakpiUK8GyMY1icwDA3LNQhNNdmPq+NKc
	Un24UmdQwZUuoFlwxe9skuZwidam/iJSq6zwl2OoosFqHMx/BaKZkryXm4Q4cHVkZhE73aHmQPUxr
	tIUHlR/u1c1ILFMJ0VNA0y2U++/St1QxVefb9DGVCtD3W6C8NwlhI6TA3g9qeakUJuT/yZrjRksGx
	zDudQnMfYhyTdFmvvikMknqr1A86TMZ0jL7CRGxsFil8duDzTfQhq3lQYoGezLuFa3XfXrjPo7juA
	0V6eio7gRMs5pJGNNhWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jPX-0000000CER5-0ieM;
	Fri, 04 Apr 2025 15:56:51 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jPU-0000000CEPF-29sd
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 15:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1Xn/hH6/7ss6uP5i4wKjZNjVXjJNOK/mVv5dxW21kIE=; b=MerP6PTLL1xnXQ1BsDkbiOnTLj
	UfWowf6P5MrqIueDuE2fsf/9BUYR7dM5myL3b4Re9VetvFakSaj8YDPcP4zThfrVeSdoak3TUHfVI
	dKC6zkKKPqOWIHI0VbV3tYAJ4UWmkmmYa7RHKJ/x39o6ldZoX9P0WkgdPZYqz+psDRz0/UXaNVdxW
	mu0p1FrnjtTOmm2OtdZYARGvV+nq3O9DnIuBsnI2xuRPkvZd96oGnuEdTloTLOuPqGg1TQC0TuWyc
	zdFjwJFNz+I9INy9kmsjADBRZBoRPZeAfhffLnJRjsLlclRgx0QDxRuz/pMDmC4c5daXMD/639p5P
	AZd8VS+Q==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1u0jPL-00BgSX-Ku; Fri, 04 Apr 2025 16:56:40 +0100
Message-ID: <a92dad03-664b-46a6-9761-b788c47ff6f4@codethink.co.uk>
Date: Fri, 4 Apr 2025 16:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Implement endianess swap macros for RISC-V
To: Ignacio Encinas <ignacio@iencinas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-arch@vger.kernel.org
References: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_085648_554857_251C40DA 
X-CRM114-Status: UNSURE (   9.56  )
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

On 03/04/2025 21:34, Ignacio Encinas wrote:
> Motivated by [1]. A couple of things to note:
> 
> RISC-V needs a default implementation to fall back on. There is one
> available in include/uapi/linux/swab.h but that header can't be included
> from arch/riscv/include/asm/swab.h. Therefore, the first patch in this
> series moves the default implementation into asm-generic.
> 
> Tested with crc_kunit as pointed out here [2]. I can't provide
> performance numbers as I don't have RISC-V hardware yet.
> 
> [1] https://lore.kernel.org/all/20250302220426.GC2079@quark.localdomain/
> [2] https://lore.kernel.org/all/20250216225530.306980-1-ebiggers@kernel.org/
> 
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>

I'll try and get these tested with my big-endian riscv qemu and verify
if they work there.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
