Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68206C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Dec 2022 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unY5FO2rYa+23syEvmyaKIaYO5GI7kWTxiNrSX4e4+o=; b=bCd8P5QIDxOBll
	hRKLDXYOdJPSEqVyCN36mBhw9HT+ls3lLIlDP/CKmiuJyzdLMZIn2E3rnJ565sryi3T/lcokbD7kv
	hPbTmVFGNaYsIeavG+oA3I9+SoDqmQMUKE33CgW8q/q57CbOnmmIWWINIfslUSWiymGChYPyE4+aL
	K3F0cjlbdGtMdFJKVWTQCmYnfAvKKB4fEBFP5W1AmcQiWRhlKJBwIdtlXmcl4uQ9sxkoKNqSA3y5o
	HdQaIpYvgc+MQw3HrRm06aiiWjVu/9oAdKArTIJEK11xvcq+WqTs3CekPtb3PJIa3UHjtoiVqOh4f
	xwcoC1W6DAP6C8A4/dlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4QKU-002jn2-VM; Sun, 11 Dec 2022 17:41:35 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4QKS-002jje-Mx
	for linux-riscv@lists.infradead.org; Sun, 11 Dec 2022 17:41:33 +0000
Received: by mail-ej1-x62a.google.com with SMTP id b2so22685629eja.7
        for <linux-riscv@lists.infradead.org>; Sun, 11 Dec 2022 09:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLliExE/rvA8JO6QvIv+I5uF5n8y/OvmfOsPSOonoZU=;
        b=OMKMsxljlS1L5B2NvXeMwm5Zj6axBL0yqz0F5og/jyNll6+0uRdautWdMrbgAQ6auG
         Y1kIZhElYTz+v45n3+bjVg1f2IbZjJITlhYiMNaR7Kx07WD53D37BI+n/gZ0azVcmkCR
         wB5DKlo4Cdh7ewPVh3RZOjRH79qkdiNu5qGh911fO50veTwj/TM5K/c43fLs2brnwMrT
         hzVxwIA8OV49sJ/ND2IULQnvdrBZMOX91KJMjRcMW21BLpShc/vDI4q1dHYS8nZmRo4v
         4aR27dAWK5ncAtBgFDsKf2TB84D/kFOuXtywF2bvHsO7yllom2Q4CxuKvw76cSzQpLuw
         cL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLliExE/rvA8JO6QvIv+I5uF5n8y/OvmfOsPSOonoZU=;
        b=BX0p7L1UMsQAOKNlLn57lxkz2wFi1YpVl3qjF8Zyw2FbUnImxMNMfoaBkdavxDfGn4
         1ByzTgVcA07E15hNAXn7grFxF9Psplk9CRAypIgR5NvsIU0sFmJPZnZTpjyhtH2OA9qu
         1sNZRHWV0u+ZCxfXbO0zbc4IP/Uyy39Z0VWHyu8nRSBdkQIwlmmuYdHYF4JwFhs4UL+m
         9qzgTQd7gMat+L6WfJ08Ux2dS3wE5KIA/D71wWEcy2EEOWWe6Qan+Z0CsocDUBoUFXFH
         oxDiTk4Svoz7lTXYady7mCI5z1sZwxKRrp2d7FnQLz0hOX9L3VxYjHX4E0N1GXN2jI9Q
         5klg==
X-Gm-Message-State: ANoB5pkY+w6Mno42ZKF/VvqQOPzVfk3SGtODdafisCrtlzSj1poneTZX
	4jBLGltFFvLzdkz6I7F/K9Xk57Dt6ardxUEQIcdAq7lt0W1aMw==
X-Google-Smtp-Source: AA0mqf5A754xDlMDZN8F0OnC+VPmaF/S3Ndn0xvXb2py41LFp/8DN4dV7AmDjpr6/ppAv8ZhpstCUzwxRtMd7r9lhew=
X-Received: by 2002:a17:906:5dcd:b0:7bf:707a:7247 with SMTP id
 p13-20020a1709065dcd00b007bf707a7247mr40543107ejv.196.1670780487248; Sun, 11
 Dec 2022 09:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-11-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-11-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 11 Dec 2022 17:41:01 +0000
Message-ID: <CA+V-a8tGbcJvdxidz4YXdBNQ30w95puOKJBU0WtW_PxsPESaeQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] RISC-V: add rd reg parsing to insn.h header
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_094132_765402_439054FD 
X-CRM114-Status: UNSURE (   7.97  )
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

On Wed, Dec 7, 2022 at 6:09 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> Add a macro to allow parsing of the rd register from an instruction.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
