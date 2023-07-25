Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C40C001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnU0yOc5fvvrcs6KpGy7HqieNZ5a83jaEavmC0d/4QI=; b=qc4+YRZfXeMeIy
	1yOn1alSpOllUsZwj0c0O3v5hGaPIGrav3Ku64r3Aj5BrreCTRwpF2iKS9g69CCXS/oXJoIxMl6e6
	S86dQeMALSfwgafDjMrvndv1Wilu8oj3hQhLksrwuLEkp/YyD4EKaT9cfq1pDJIgTECGxxJP2aK3z
	ayKBzRG0msNSMosph7+rQ+GA/QbWuRk2GLxklUi6YaiNrzEA8wNYp7Kemalmnxfvi2EjyyTz/6tVD
	x3959j2Pp56JGrn4G6ibNSJp+4hU9cx9ope4u+RCevXrwjUvqfC5y5nYk1iV80TC01DMiZ7lyhcMN
	6NC/kocW6TtAOM0rGpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOF4z-0074Xy-0q;
	Tue, 25 Jul 2023 10:15:45 +0000
Received: from bee.tesarici.cz ([77.93.223.253])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOF4v-0074Vq-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 10:15:43 +0000
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 6E99616E7EB;
	Tue, 25 Jul 2023 12:15:39 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1690280139; bh=VkSwamAp/4PDPv7DdYCrtZQ5vmXGPZLbqsG5fwWzuZo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p6x10Yht8ow48zlrALbeY2e4IicnzbpwZLWp9qIt+gAjalRXgUE2EMKYQe93s+Wty
	 OLQJ4s9WLrmhjHqzKlJ7BdXR8lmGJakv1WIWZnAdt1QImnmnur6uRrtJgOsCEG5Ixv
	 67kEzE64ng+hilOryKzXuKOYKRIbGyu1DL460HDayizReh1NBVmXoLBjniDiVU4q06
	 viKPt1HvhkjWx5A4k4rrkHEHVZ/ZdSlqSr+uxtHIAugwjbfRiDl1/50VIcpf2q5O7D
	 O214xNUZNaHf2zYwx9C0Z+UUERZLxpGkZmMy5l/nFQSJ1qxuK2oPOpB976q6Jvhg1p
	 05ofrg+vXWnXA==
Date: Tue, 25 Jul 2023 12:15:38 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Petr Tesarik <petrtesarik@huaweicloud.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Li Huafei <lihuafei1@huawei.com>, Liao Chang
 <liaochang1@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, Alyssa
 Ross <hi@alyssa.is>, Nick Desaulniers <ndesaulniers@google.com>, Ricardo
 Ribalda <ribalda@chromium.org>, Kees Cook <keescook@chromium.org>, Heiko
 Stuebner <heiko@sntech.de>, Li Zhengyu <lizhengyu3@huawei.com>,
 linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
 linux-kernel@vger.kernel.org (open list), Roberto Sassu
 <roberto.sassu@huaweicloud.com>, Torsten Duwe <duwe@lst.de>, Torsten Duwe
 <duwe@suse.de>
Subject: Re: [PATCH v1 1/3] riscv/kexec: handle R_RISCV_CALL_PLT relocation
 type
Message-ID: <20230725121538.2bb4b64f@meshulam.tesarici.cz>
In-Reply-To: <652f652d571458522a615040f68a885f10b45ca7.1690274483.git.petr.tesarik.ext@huawei.com>
References: <cover.1690274483.git.petr.tesarik.ext@huawei.com>
	<652f652d571458522a615040f68a885f10b45ca7.1690274483.git.petr.tesarik.ext@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_031541_930543_A30FA6A2 
X-CRM114-Status: GOOD (  16.26  )
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

+Cc Torsten (somehow missed from the original Cc list).

Petr T

On Tue, 25 Jul 2023 10:44:25 +0200
Petr Tesarik <petrtesarik@huaweicloud.com> wrote:

> From: Torsten Duwe <duwe@suse.de>
> 
> R_RISCV_CALL has been deprecated and replaced by R_RISCV_CALL_PLT. See Enum
> 18-19 in Table 3. Relocation types here:
> 
> https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-elf.adoc
> 
> It was deprecated in ("Deprecated R_RISCV_CALL, prefer R_RISCV_CALL_PLT"):
> 
> https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a0dced85018d7a0ec17023c9389cbd70b1dbc1b0
> 
> Recent tools (at least GNU binutils-2.40) already use R_RISCV_CALL_PLT.
> Kernels built with such binutils fail kexec_load_file(2) with:
> 
>  kexec_image: Unknown rela relocation: 19
>  kexec_image: Error loading purgatory ret=-8
> 
> The binary code at the call site remains the same, so tell
> arch_kexec_apply_relocations_add() to handle _PLT alike.
> 
> Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
> Signed-off-by: Torsten Duwe <duwe@suse.de>
> Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
> Cc: Li Zhengyu <lizhengyu3@huawei.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/riscv/kernel/elf_kexec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> index 5372b708fae2..38390d3bdcac 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -425,6 +425,7 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
>  		 * sym, instead of searching the whole relsec.
>  		 */
>  		case R_RISCV_PCREL_HI20:
> +		case R_RISCV_CALL_PLT:
>  		case R_RISCV_CALL:
>  			*(u64 *)loc = CLEAN_IMM(UITYPE, *(u64 *)loc) |
>  				 ENCODE_UJTYPE_IMM(val - addr);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
