Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8B5CCFA00
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEwv2JsiN4hbnpUlEM7sAK/NcQR4tR5MVEdchLkCHq8=; b=UmCLQ+geSo8LT1
	22iZRO3yeLzOlAon92mfWTZAE24MkYQyWgh9ZSM1+M9rQgnxdiEG2gf2f5JivbJh7v2qEM+ca5xFo
	bHe111WkWHk2TfxOxVvpPzxcMVq9gORdJBrBsY66XAtJh7PBdCJTz+vc3BIE0vn7ccI69rujpaa6c
	BN39emik5HF4z90uIqkd4T5xT7Oe7q47+o1Nw29e8NPcJqb4oEzAy+4u198s/5XGV613CGv4MqekF
	GdKGGduEtD5YadOqiY9w15WDVjZ6dUUGIf75723h4VO5VzDULGt3hyynBkefOMGZRLKvkFP1eR7j2
	igNG5Og1C4+U/D0sUn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkUU-00000005eEq-07oe;
	Fri, 31 Oct 2025 08:28:10 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkUP-00000005eE8-1V92
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 08:28:08 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 299C925F65;
	Fri, 31 Oct 2025 09:28:02 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bpGDuZIzpou9; Fri, 31 Oct 2025 09:28:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1761899281; bh=oXSCbUz3maeKFgjhdWEeJ5FVids98Vl53dBlq39zFG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DnjgTqknrUlT5ugGxzUreNCyOhmINJ8PqOdB8p8KvRmaBkcqWJrkN9+CDzBURk/t4
	 Lefo7EpR7acVodgW1fgYj1RcP++0dp99bbh6hqSbyN8+G0P7D74c/9XZ6UU63LQWaS
	 NmDZLlwjQVBdZYbtmYDtuS2Ea/2h1H6YCOruYM0JIjBARh8G9dAQMn0XtW7g5EeEva
	 SoxqL8fIWN1+APR6ysTkO+Mma+R2lWvWkwk4F0vRktMDTl3zh/eogqHNL/0fhXPb89
	 S3QOUoFqn7+65cyBBLffctmftAyg4k4M2rHeeI0w9PZX/wjYrSopRETPHSP6WyYhSr
	 NADUSmLqFi5Ow==
Date: Fri, 31 Oct 2025 08:27:48 +0000
From: Yao Zi <ziyao@disroot.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Qiang Ma <maqianga@uniontech.com>, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] efi/riscv: Remove the useless failure return message
 print
Message-ID: <aQRzBOu5Ml9gJbEN@pie>
References: <20251031024328.735161-1-maqianga@uniontech.com>
 <aQQ3KUap1cB73HOm@pie>
 <CAMj1kXGxP_8FhZgD42iD-7pnnZgjez3mXkTZz69YAc5FPkLBMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGxP_8FhZgD42iD-7pnnZgjez3mXkTZz69YAc5FPkLBMA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_012807_825765_17F6BD9C 
X-CRM114-Status: GOOD (  11.89  )
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

On Fri, Oct 31, 2025 at 07:52:10AM +0100, Ard Biesheuvel wrote:
> On Fri, 31 Oct 2025 at 05:12, Yao Zi <ziyao@disroot.org> wrote:
> >
> > On Fri, Oct 31, 2025 at 10:43:28AM +0800, Qiang Ma wrote:
> > > In the efi_create_mapping() in arch/riscv/kernel/efi.c,
> > > the return value is always 0, and this debug message
> > > is unnecessary. So, remove it.
> >
> > Should we make efi_create_mapping() return void at the same time, if it
> > will never fail?
> >
> 
> No.

Oops, seems a silly question here. Sorry for the noise.

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
