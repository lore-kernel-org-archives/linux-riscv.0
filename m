Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD74CA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvPpf0p/UutUfDwHTYMIHdVNn7xWrBpyBKhoRoue2+U=; b=WJR4FgCqEuYFiJ
	tLN4zf5JYHElZadCHdld/BJks7ptHEd2zacCb7eO2M3/NpKKMYt3DFaXEqvm2B0ouWBbt0C1DI8i1
	Lmp/IiQMimLTnRa1G5h0hD0Bk2h2k0EJ5ybf7jwRrtnxZ4lfHncWG4v5ynKsulyrAydILMi2doVgJ
	/ExJyqXj2JACYV+fMmOhyi+c6KF7s3QM+R4CLZSYQlvf9eBOBQ6blnXV8QxvZM3XOZdro6FW8wblP
	0ymvkkFCZ6zK4sEhp0MOUqreyfFxGcV174pDGCUiya+Q7Vn0zkPctSh4fARqb9VN+RvEuznncscwR
	496rloyV6QpbCyn7lPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6xa-00000005vYK-3Dbj;
	Fri, 09 Oct 2026 09:32:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6xZ-00000005vXu-35F0
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 09:32:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D501960052;
	Fri,  9 Oct 2026 09:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D25F1F000FF;
	Fri,  9 Oct 2026 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791538332;
	bh=ENBRNg6BexirER+Jc3kf6eKiCZvAltZIqY6YqCZtb5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jH6ZxjVdMPwpZg2LrocpBm5BCxRQ9f1tq/koBd4LaSF0U6NRDnw9NfORdwhQp/i4C
	 /2fix8o1OwdIzj9G2RtMnLREs8/gKDwJVL8OSpBkUE3ot1i8gffY0jTLV71P0lkvKC
	 Y11Dvtf7ScABY3CUliSw1xaFJ95GuRr/tfXIYh3+XhAD+U4+6OTMd1e2x33QBkngOb
	 ziEYcQTmjWskGoCgBSGi5QGHTBEBxdvvUgoznKLvcj1dkNKbAZy0gfRcKrxQjkYJ+q
	 7uKm7yY9b4VbdlirJ0oIavdU7g1xJqcKGrK9rioBbz12IhwNvHckUQwaU8uU1TWtW5
	 flJOcErGmY/pQ==
Message-ID: <8d0fd503-4f4f-4cd1-9ae8-08ecd478b8cb@kernel.org>
Date: Fri, 9 Oct 2026 11:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RISCV: canaan: Deprecated (oficially) the K210
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20261009-ee797bb64a30cf907f583aca@squawk>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20261009-ee797bb64a30cf907f583aca@squawk>
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

On 2026/10/09 11:29, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Two years ago, at LPC, the only known user of the k210, Damien, gave his
> okay to delete the platform from the kernel but this never actually took
> place. Deprecate the platform now, marking it as broken so that users
> will have to explicitly re-enable it on updating their kernels.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Sad... But yeah, this platform never was really super useful in itself, beside
the code cleanups it generated.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
