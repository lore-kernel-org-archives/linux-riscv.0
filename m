Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95488C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0izu3jgq6umgFu71mUMpe6V6nzh6FGOyDuGEFsJvu5U=; b=RNP1SBuM/r6u+R
	AWgkYV1OuPdiYsA80OUpMm/gkziyFdCHYOXzjPMSsaRgFfdJ8oYITCuqiYyny4VzNalci9YtNbAyD
	+OPNnQWalRDvHxLfhTdp8aG9re8ZoJ3nE/XdLHyDFuZCzt5IEsiPaO1QjAmOaSdygnl6oKsnegjF1
	MnCBn1tM+cl+x0WKyO2hsALUNmgt8f981dPI3o6Xg4Qof5aGWuhEjS6K9NtaNRAT3sDOEA5+SoOxV
	3Sh1/jJND1nOBooP8WmVPE/nE54BLSF9hZrVSvJ0/qrjGTO5oPt3/y9SGZ7DvFqEVDzX7jCFK0QzQ
	h8VmWDPJpmibIkH3QewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP1c-009QSf-17;
	Mon, 15 Jan 2024 15:37:20 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPP1Z-009QR0-23
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:37:18 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a2cad931c50so333696166b.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705333036; x=1705937836; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NtVFGxo6W2R65fH9PJDIGxutILrI7qYWvuUFM+KEdWM=;
        b=n38n0/31+CZWFWczUP07DpzU98pveZMvIm06ju1yxf7zPVMA/hUg0ij24y/YqDRWlx
         MRZMSTzn7JN/tfzTEjqgAipVAfBKDjzqD7YaOzFP0mu5rQJsdEofxvugpHg5TyCjjgr9
         9Hlhu3CJSLwOKgomzTzkYXRKhztAas2GoUiYxP8r/4qwLh8GAByYe91dqnTklhY5PRda
         1Hfb85FeqxaMz2kPhl3vXV0qGQkUxjscdy30WEcHbud3a5FWRvgYDFPpfgzSbgfZUDOz
         RM16cotL0Uk0uI0OsZftYklrbx9gqcTJi+1L3EhbVTiP0Xl9gvPEaehs32mWG+PACC9p
         rTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705333036; x=1705937836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtVFGxo6W2R65fH9PJDIGxutILrI7qYWvuUFM+KEdWM=;
        b=pxmM6X62b1lb3uierRfvbOX7rC9xXi7zJcTw+5FQ3S+5UEbgN9eMQgUjZigYd9uDcE
         Ji3FKLRAqPM39gvhh0AHPbjQCh21aMQLF9QlSyyhtBETxm11fTyogEWW/6Vpk7yWTgkH
         IcQSumMeGvConpCs/BE5Yaz2f43LZXSL4WQ0j5ue1VAdbxuN9XASP9NGht52yxgdKVFV
         7cbA1ZKImrbHZs/HrW6l5Vrcf2laodacgO2gKnzD1NG/UMQug6EvC74lIS57avGSeuwA
         Kweel4gAhtpVjJ9KyfVCdIuIZtDL7sL5DSg/NVtj9ek2uXe5RlXcNC9Gehu2jnL6tncE
         tVTQ==
X-Gm-Message-State: AOJu0YwO/J/DRUuavSBTxeN9NjKuJPTl8tqNEGnB14Fbv6id/0ITGUpF
	Dgnw++ParHMydXhMRghoLsPFI/1bm4B7Sw==
X-Google-Smtp-Source: AGHT+IEI08RzPRo2T/KkNS6TnGCQRQYJsQKdpADX1cVkaNpJvEz5jdj0uYe02wZKAjUq+lUaF8fA8w==
X-Received: by 2002:a17:906:6d18:b0:a2e:3a19:f20e with SMTP id m24-20020a1709066d1800b00a2e3a19f20emr179739ejr.64.1705333035883;
        Mon, 15 Jan 2024 07:37:15 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id vh2-20020a170907d38200b00a2d60b5a502sm1496635ejc.224.2024.01.15.07.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:37:15 -0800 (PST)
Date: Mon, 15 Jan 2024 16:37:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 05/15] KVM: riscv: selftests: Add scaler crypto
 extensions to get-reg-list test
Message-ID: <20240115-c690768430c76a2e595a7c86@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_073717_675643_968833A1 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 28, 2023 at 08:23:47PM +0530, Anup Patel wrote:
> The KVM RISC-V allows scaler crypto extensions for Guest/VM so let us
> add these extensions to get-reg-list test. This includes extensions
> Zbkb, Zbkc, Zbkx, Zknd, Zkne, Zknh, Zkr, Zksed, Zksh, and Zkt.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
