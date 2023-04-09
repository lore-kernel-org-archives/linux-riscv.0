Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21BDC77B61
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Apr 2023 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFNIJYUcj1nFNFjyS/U0x/7n7U0G44vzTBWW7gEulz0=; b=nCPLaOsQKBdAro
	0Hc3UjsGCbMedln8qMSiZ6FTOr8e9IfjWzJXKguVyS0p5fFT5iMFcDus2Mq5pRLzH7CItbZMg6jUK
	im41ByPR1TfS0i0XO2gp94svxg2B3/ahjHMUbxXbugYpAFsBMbg0lIsBaZirQgEarpo1KeZNhvEb/
	saU/QexsLRZj243CkIMl2jvplYTwBJk9qESev/yceOkw/TY2h4Rdy5VCH+ea+KD8+vNt5L/CoDXYO
	ECcjuHhIGq3F/kfYk61QNd3Iovj02YSgrYik5YTpYs4mPQ2CgnRhFcEUryFKWcGPHjbeG8DW4qtfZ
	3nrpEjRH9Q3eSHxEjmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plQss-00DLUn-0S;
	Sun, 09 Apr 2023 08:58:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plQsp-00DLU2-2O
	for linux-riscv@lists.infradead.org;
	Sun, 09 Apr 2023 08:58:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 054AB60B38;
	Sun,  9 Apr 2023 08:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D88C433EF;
	Sun,  9 Apr 2023 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681030726;
	bh=ZBQa6HSvHmlOsAAI9bKj5LL7zo5aODnHk6E1IvSRNP8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=K0psEaAlENTLBDgQSrdsQr1gG0H6zeYuLmcSeimr+6nsHBZe+CVwKbnn/xw9RUzYI
	 YBe20g2aysR7jNr7GHyNpFjPW8F790RovaiMfUMXNkpvaLG7GU3behFGsUzgW3XFRC
	 28yV0WWfBnTjkAM+crF3WkQwjmkfNQpwwnb3+vtbenDIEfq/eL5qy6TaaqiK4qgykc
	 0/Qcm1ZontBvazim7p6UQKJKabt+2F+7ro7JxRyOY2sFJ11ReERoZ7qqNpyJ4xDPha
	 cHZK6M1kP90XxDoLPSCvJ+BUVR9xs3Wn0wPnYfN1beensl/9gu//hUSb3lB0cixcd3
	 lFsbzS/8iYPcA==
Date: Sun, 09 Apr 2023 09:58:42 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org, Christoph Hellwig <hch@infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_0/4=5D_Convert_SiFive_drive?= =?US-ASCII?Q?rs_from_SOC=5FFOO_dependencies_to_ARCH=5FFOO?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZDEAD5aWhvMxAj8F@infradead.org>
References: <20230406-undertake-stowing-50f45b90413a@spud> <ZDEAD5aWhvMxAj8F@infradead.org>
Message-ID: <834F56B9-E394-4F7C-97D8-BAA97F03362E@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_015847_843798_3C1B092C 
X-CRM114-Status: GOOD (  10.73  )
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



On 8 April 2023 06:47:59 IST, Christoph Hellwig <hch@infradead.org> wrote:
>On Thu, Apr 06, 2023 at 09:57:46PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>> 
>> RISC-V's SOC_FOO symbols for micro-archs are going away, and being
>> replaced with the more common ARCH_FOO pattern that is used by other
>> archs (and by vendors with a history outside of RISC-V).
>
>And this is still the wrong way around.  This ARCH_ madness must not
>spread.  NAK.

As I said when you complained last, we asked the arm lads and there was no interest there in doing things differently & that's just one architecture.
Nor was there in adding a SOC_ symbol from some of the people who do more than one ISA.

You're welcome to send reverts for my first round of conversions and patches converting all the ARCH_ stuff RISC-V has to SOC_.
I'll happily ack a complete conversion to SOC_.
I don't care if it is arch or soc, I just want things to be used consistently.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
