Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23574606A32C
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 12:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jNdX4Ar5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Edkrk0u9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=UhlJivufoYUxAAvIEeDCbzHH4r20PSI80DFFaIVeUd8=; b=jNdX4Ar5mti/K/Lu8cCsvyyjCp
	7OXKISp68e92BltqSqZtcPoGoDkQZ0uGcxdcbioP0GtSRPFJc8i4As8msD3rt361y53KKrojCxBTM
	BcWoj4hQVKwnnnHf9J3s8jgOYQxIjU6I/7olpayjiK2J0r84aJKCyDZmHhVCY7SCnnKR3BPKuKBif
	3kv3GjIXS4kdsbd0qRtY/BZYlf5oRkK7krRpy4adkTKOQg0Idk3LGCsyzdSGxzMkhZ6PkZ6MXtmVm
	qo6pIoswQ35w+Q7WSt+kp092HsC5c+MaspOIRlWgnPIpc8nyfFYyrccdAZnsV+Qhwc8P6nrXLvhd0
	iPnzfxYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkRE-0000000HCQg-30uF;
	Sat, 21 Nov 2026 12:43:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkQZ-0000000HC54-2MHk
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 12:42:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5317341210;
	Sat, 21 Nov 2026 12:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467F51F000C4;
	Sat, 21 Nov 2026 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264967;
	bh=RuNf+pePjIWf7fpgOl6kHLwN5HRwrqk6Ttj5H6K8/Jo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=Edkrk0u9ZBtn+sfvtyuaB/62cjo0kHZXc7JqL1+Jp4ysmhyM/WQWc+zX5yq5ntE+k
	 PL91l3Ay41tESI8Ugjuvp2aENCO0yodQ5+tfIZLAi13ySYtAfEaVGuxx1E57xfWmis
	 rEjsgGfnti4RQFMyOPd3QkzDs7JG5bd3LCiGn1+JSoIMwFGbjkMTaJam9jZPEqhKs9
	 OQyjCnUOo+vaApoK20oxvbEZpoqIssyd7YG2tavubLveNtDjejhWiRSqVmCOp1ucF2
	 q3YhaEZbxEysEJktsEXJmYai7zYBPzNQdPoOqVpcfVvZGgxERveq0jA9pmSyw/uW2I
	 ilbvM8oWL2z4A==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8364D198003A;
	Sat, 21 Nov 2026 07:42:44 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Sat, 21 Nov 2026 07:42:44 -0500
X-ME-Sender: <xms:wJEBa-ZtDfskQiFzaQkxwVZMjq6DINcp4B6Qz1M2SaA5wwiI4_tiUw>
    <xme:wJEBa8NCC5VQmS8G261kZ6ip0-tk_XJZFGroObPFb8iocwZNqWdOahCNPdXDHSQlM
    HyN0W4dPkuG1m2gUPabxWiFTmCzFbJDkMhklxB0rrNmH-Y-fdyedhr5>
X-ME-Proxy-Cause: dmFkZTE9e/DNRSP39ywX8YGfN8UoAyYP0CkDVl1avqiAO6xwU1q4JAb9xbXdWO/PpICXkX
    zSe7F6+aKSXIivBTl4vZebp345mjcvLiZD9TrcN4QHwBOm4LthXKqGLtvIk6OB86Itx5kS
    d/UV1jGeDDUTrmqovg7yftxuaJvfmdlHv1cqtQRmHAiOgfntYjw8a9G5ML3j1HE+rNqrVv
    sJFYZ4GZgtsNvuRQjxcJtW6yVD0Woj3jL7EuAHCN2PhP3rLmluqpBpD3npZIKTrh/eJwu+
    Lw3q/JjeWsgRzz3r5esxoF6oGSF9wTLqWumVmdUFgjUGa9Tpovw5aSjfTMwfCS592JTuoV
    OcXXV3oeikv72LVep537lddmHM1Iut790jkACgOjIl+lEFO4p3xtlcZddXdPlBYFtphFDP
    jV32RIJDx4tRZ2V5R/L0EsrklNVJbzl7ijr/T3nZVrJa82J4FoSmDH/wqpWF6Q/DzLC7UO
    0GqxSPyYwOx8njcf0bDlwbbQQrKhDvHIkwvEcARRI/kQBu4gR7VcNwPUgpi5Vo+mq2sbbX
    JsQXlL0ca+cqLynAiw8kIttg+OZmMDY42RhkY/ihzW1I+bJk+G9+JyYVViCb3eNHh6SNs7
    Nga9lB9eHPZJC2iV/xvblxvv98by0fJIDxf0P1vn//Dnp0e2VImQzs8lz2wA
X-ME-Proxy: <xmx:xJEBawZT-KsmJZzuUSa4Uls47l6wsD-ci_BoSZ8jlZQATSPlTA8QYQ>
    <xmx:xJEBa6r1kDXzUi7QTo6cAoEOem3srPLfrattqzVlNKoAHexfPEQZJQ>
    <xmx:xJEBa9xJhgpCROoCvfEgXfgfFrtmU2GSpQ2U0d49dLNbWRUuCUW-Zg>
    <xmx:xJEBayLyKn1Qzc1vCBGkv0JyamZh9rl3O9Ev_HOOuNk6vN1DQ_UqaA>
    <xmx:xJEBa_7sd8dXEJRNAg92aZYpU2HoUJd-Va-8yw61X00ejPrsRHaXKaZB>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B33E7F8008E; Sat, 21 Nov 2026 07:42:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Afc6hXNcC8eV
Date: Sat, 21 Nov 2026 13:42:20 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: gaohan@iscas.ac.cn, "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Atish Patra" <atish.patra@linux.dev>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>,
 "Jerome Brunet" <jbrunet+clk@baylibre.com>,
 "Chen Wang" <chen.wang@linux.dev>, "Inochi Amaoto" <inochiama@gmail.com>
Cc: "Han Gao" <rabenda.cn@gmail.com>, linux-efi@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, sophgo@lists.linux.dev
Message-Id: <bb39f961-0589-4a3e-b649-888cf5edd3a1@app.fastmail.com>
In-Reply-To: <20261121-b4-sg2042-efi-rtc-v1-1-19898b8ad497@iscas.ac.cn>
References: <20261121-b4-sg2042-efi-rtc-v1-0-19898b8ad497@iscas.ac.cn>
 <20261121-b4-sg2042-efi-rtc-v1-1-19898b8ad497@iscas.ac.cn>
Subject: Re: [PATCH 1/2] riscv: efi: Map runtime MMIO with device attributes
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Sat, 21 Nov 2026, at 11:38, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> EFI_MEMORY_MAPPED_IO regions are mapped with PAGE_KERNEL, so device
> registers end up mapped as normal memory.
>
> On Milk-V Pioneer, GetTime() reads the clock controller registers and
> faults:
>
>   Oops - load access fault [#1]
>   Workqueue: efi_runtime efi_call_rts
>   status: 0000000200000120 badaddr: 0000007030012000 cause: 0000000000000005
>
> Use PAGE_KERNEL_IO for these regions.
>
> Fixes: b91540d52a08 ("RISC-V: Add EFI runtime services")
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/kernel/efi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

I can take this as a fix via the EFI tree if you like.


> diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
> index 2d3cc57b4535..11e85d0ebc91 100644
> --- a/arch/riscv/kernel/efi.c
> +++ b/arch/riscv/kernel/efi.c
> @@ -22,7 +22,7 @@ static __init pgprot_t 
> efimem_to_pgprot_map(efi_memory_desc_t *md)
>  	u32 type = md->type;
> 
>  	if (type == EFI_MEMORY_MAPPED_IO)
> -		return PAGE_KERNEL;
> +		return PAGE_KERNEL_IO;
> 
>  	/* R-- */
>  	if ((attr & (EFI_MEMORY_XP | EFI_MEMORY_RO)) ==
>
> -- 
> 2.55.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
