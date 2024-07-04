Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7924C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 17:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ug9tkWwImT+yZUDFmBMpSpS5G5NXvtlt3Aq85aQUF0=; b=Ubd1l7BmJUjoGY
	F/olXIvX1/o52zYs9LohXD17MjkEPiCQd+2DTfVJtZweS1CaR/1sl0HoFCbCFmNVZz3j45b5fJvae
	IH17n2m+zGw3FvTsaNMQkFu9l7RXGjoNBFWNS97528RdFChdoanNqPXcl2oOTGYb8GGcW9r9K4FjB
	Pgki6BxSmtBRtJlxjGQK9ru0OUOQOdVI7DxgD3xE9SHee8cXbP3+vC3cKAARKS+uIpNuvZ+IddFHn
	TnS/1tFIsnP/buDj2c/p8dK14/qLY7y+ju/yvl6oTtSjFqnhVveMnlCnOkKBpGiGtWEQGB6zNms87
	xGxF6FszDaE4pnshfGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQKw-0000000E2Vg-0dYH;
	Thu, 04 Jul 2024 17:33:38 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQKi-0000000E2Q1-0K46
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 17:33:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB89120008;
	Thu,  4 Jul 2024 17:33:18 +0000 (UTC)
Message-ID: <98df164e-62d2-4592-a777-2a8182583c1b@ghiti.fr>
Date: Thu, 4 Jul 2024 19:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] riscv: Add qspinlock support based on Zabha
 extension
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-11-alexghiti@rivosinc.com> <Zn2C+NXNZ/sj0wI6@andrea>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Zn2C+NXNZ/sj0wI6@andrea>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_103324_272434_5442C1F7 
X-CRM114-Status: GOOD (  11.18  )
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


On 27/06/2024 17:19, Andrea Parri wrote:
>> This is largely based on Guo's work and Leonardo reviews at [1].
> Guo, could/should this have your Co-developed-by:/Signed-off-by:?


Indeed, I'll add a SoB from Guo.


>
> (disclaimer: I haven't looked at the last three patches of this submission
> with due calm and probably won't before ~mid-July...)
>
>
>> Link: https://lore.kernel.org/linux-riscv/20231225125847.2778638-1-guoren@kernel.org/ [1]
> There seems to be a distinct lack of experimental results, compared to the
> previous/cited submission (and numbers are good to have!!  ;-)). Maybe Guo
> /others can provide some? to confirm this is going in the right direction.
>
>    Andrea
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
