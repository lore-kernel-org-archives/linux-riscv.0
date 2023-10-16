Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B3ECDB482
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 18:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nf5Cz5OmwdZhicXhxqvtenAv3vXYMrN/atPO+GVcEak=; b=gP+VPetLRiaerG
	GmskPl90834EcS+CjRPiK03wc0zj82NFSUSAeDGAgvKHsxLSdA2asi2E6mqmpqlNau90HlIzUm2KZ
	175nSn44wdDJBgwq8zx5gUzncK8nRlskdw3hae9r3BO4PHv2uGzVCxfzFQspd4cW9cGLAz06mzEY7
	e2anM9IsJZ7aGKif+uxG+mL+Y87CQN0x81b8nzWZ2w026FMEaLvHFkJKGTh0OPlnGDcz4Zdmcy0pb
	/xW0jvtNZ+hL1tmcYnkJKmIsbYWj63NEKt1aGsuPeegKcD5sA0DTlruXUh4skIzI+off7j0R2vPZS
	Q8xGwBMPp0837b6FYqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsS5E-00AImQ-0c;
	Mon, 16 Oct 2023 18:12:52 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsS5B-00AIjn-1A
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 18:12:51 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4S8QFF6Mk6z1r1s0;
	Mon, 16 Oct 2023 20:12:33 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4S8QFF4hgYz1qqlS;
	Mon, 16 Oct 2023 20:12:33 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id nOUV3jjqwywP; Mon, 16 Oct 2023 20:12:32 +0200 (CEST)
X-Auth-Info: de1F22Tx1RaWX4XjxP2PcfNuAuKKz9mapevqvNXhi42KR85gJB1zx+tHFwze0kZO
Received: from igel.home (aftr-62-216-205-237.dynamic.mnet-online.de [62.216.205.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 16 Oct 2023 20:12:32 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 591EA2C1370; Mon, 16 Oct 2023 20:12:32 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  Eric Biederman <ebiederm@xmission.com>,
  Kees Cook <keescook@chromium.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3 1/2] riscv: Add remaining module relocations
In-Reply-To: <20231016-module_relocations-v3-1-a667fd6071e9@rivosinc.com>
	(Charlie Jenkins's message of "Mon, 16 Oct 2023 10:36:09 -0700")
References: <20231016-module_relocations-v3-0-a667fd6071e9@rivosinc.com>
	<20231016-module_relocations-v3-1-a667fd6071e9@rivosinc.com>
X-Yow: I'm ZIPPY the PINHEAD and I'm totally committed to the festive mode.
Date: Mon, 16 Oct 2023 20:12:32 +0200
Message-ID: <87h6mqo2r3.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_111249_570073_12CF7442 
X-CRM114-Status: UNSURE (   8.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Okt 16 2023, Charlie Jenkins wrote:

> @@ -81,7 +82,7 @@ typedef union __riscv_fp_state elf_fpregset_t;
>  #define R_RISCV_ALIGN		43
>  #define R_RISCV_RVC_BRANCH	44
>  #define R_RISCV_RVC_JUMP	45
> -#define R_RISCV_LUI		46
> +#define R_RISCV_RVC_LUI		46

The latest ELF psABI defines 46 as reserved.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
