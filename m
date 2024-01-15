Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67290C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 15:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wP2ckQD3CHAXWD681JoxDKDgYFLHeu7z+FnwZ7AKtxc=; b=oBXfaGGR/pCBDK
	poy5iHQSchcZgKdDJYzRorQe1PVrLyS5RH0fSWo/7Qu5GYaj07VhZ4KnlsvPUx401zWiGs4L71a8n
	NVOBPXZL+vrA86dYRUZbgndTjHZ6z95xLQJHIU0ztBkGi6VsI4b9LJZH7m+ZpzhiUrD2ATcR/qKDw
	fWmzRQs4eYLQKJGlFnDMnxjwWhxK7K4DrR/yQ3lyY12TSw2PU865D/78VdJTvOKQ0j6nfnFAyYIbL
	9ggd/FegatnlRwU1aSQqa3nLd587VVTLVdPoqFy4nVkLBIhz/dNO3im1sY/JZxsydYrAUbq2s+qAC
	T1uSwlQM7H0y+5cUP6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPK1-009V5w-09;
	Mon, 15 Jan 2024 15:56:21 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPJy-009V41-2B
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 15:56:19 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a2c375d2430so553793366b.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 07:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705334177; x=1705938977; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GzIcEuaHWXnCzr/2sL8Vcv3dHdribnGFmFr1eaLd75A=;
        b=Mcq3+6tmQrH94wI4wmUD6RZSs6QZ2LIV5VwprTJFfa6bsvNFAAjleQp10DnyPzgegi
         yUSh0b+XstLFuJlsR37+KfOWRyxcGWP9UbudGWivbyxgsXcLfgQ7qGQXpgbFFRDHVvIg
         DWbwd8zYmJqsN4cLEyXIv3q6oV31QQ/6+z9BtDxPhNkdNLx0YOXWyVj9AUAO1gicVgJ5
         oDHAUydWdrTnBntSW6cw1mxfcPwhd/pQabP93eqLzwtwve9BQiAFpPsMoIe8RaxKShIO
         6fZNHobP8VwmYJiewq+u8n4lRM9RNcJOca8eAQR8ny8EEhDRp7AoYjv0M0vFYBsUyQX3
         vChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334177; x=1705938977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzIcEuaHWXnCzr/2sL8Vcv3dHdribnGFmFr1eaLd75A=;
        b=NsZZZLCygujX3Jg9hYz82sRx7mFH1+t3iguoo3wOFROf+13RJDvmNGtNWF4f+5DaZo
         cIPd3K8bUIi7xigjhosizRWiJBbFPDqC/OkQa1bUw0QDS+uU3gJIOC6yjfNaDvfCkMJv
         RSTvM+32/5v86y2/xNx1ngRv5cvxk/5SbF/5ikmDV+EXF2y6JjZo1bVeNUZPwh5MTdLL
         urw4JxMHmgh29tpDX80f73G3lCm4hWHNVGZkJas5QrRxJ3zR2YnKIMiukymW6MVGcZxd
         gbnL5zd/7+p00xwEhmMvJgAcs/jFZjW+UbKGQUjHbcDMEapWKqNLmJLvZGKC7n3ETLY7
         heZw==
X-Gm-Message-State: AOJu0Yzj2N9krKgnOgBt7Hd9aXZVruOrHGfIQp6Os8yZIkEqfhzP3GQb
	qmaaj8c2yjRyNzMSOuKt09P7iCzr3D7N/w==
X-Google-Smtp-Source: AGHT+IHy/Uamyk2YtYJ79+3ZC9ozJlXkNxEjS2ryGtVNOpdPIVCRT4L3/ylgzhP5km9hLu/sXJEJzg==
X-Received: by 2002:a17:906:c10c:b0:a26:cee8:3713 with SMTP id do12-20020a170906c10c00b00a26cee83713mr3113155ejc.55.1705334177541;
        Mon, 15 Jan 2024 07:56:17 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906c20e00b00a298e2f6b3csm5384397ejz.213.2024.01.15.07.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 07:56:17 -0800 (PST)
Date: Mon, 15 Jan 2024 16:56:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 11/15] KVM: riscv: selftests: Add Zihintntl extension to
 get-reg-list test
Message-ID: <20240115-6c4b2f1b0c692b6b8e609ab4@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-12-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-12-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_075618_716595_45C032E7 
X-CRM114-Status: UNSURE (   9.79  )
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

On Tue, Nov 28, 2023 at 08:23:53PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Zihintntl extension for Guest/VM so let us
> add this extension to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
