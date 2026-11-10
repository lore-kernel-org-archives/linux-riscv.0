Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C4606A320
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 21:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W5u/wT5M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=JjnhU+GS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JwRBrKZyHqYqFqdTqbgahnxrLxTBTCZfgWva2iKBWhQ=; b=W5u/wT5MTPv6161S6IWGT7XEzQ
	FlGSBGgpNBNa1GCzUxjCqcX77+zB4X+mn/WtoMihnq0EKw9hqsZI/WYNhgZ8X8IcmoAvzGt1EUpCc
	Gy3b8sEobAceOKkkJq9okTIIozldw6FJ20157AvzwD7qkn/Qso+MYw1D7rONzoU9k8+nSQWoP4Ai9
	BtLKG38hWHTuh9f+Rs04OIr7dZXpNqRuw1P36p03dbyV1sjeLg443wSoA4Mra6QQnOnfxaiKUp4YR
	E64vxObpyUjNBhQb3gC5RUVTgPmFTq5d5O40ADnive14jEfO505bP2qIcBcvmv571NDaWoJgAGQZF
	kbtSqmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtBx-000000052WG-0M8Y;
	Tue, 10 Nov 2026 21:15:45 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtBt-000000052Vv-3Wn0
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 21:15:43 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2494596a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 13:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1794345340; x=1794950140; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPELBkmgWuDcQIUl+1C2gUiqdih6G+ZfnSfUpv7B6os=;
        b=JjnhU+GSiqojRvoIjTLPmcNIDJHAa7JVSY/H9rDn2d9cGVXETfU72vlC+52weDLkcz
         VM3naSA6APnX/G5SCEEb53uD2uEW+9IQbxRC4NtAe+ncXpfd+ERCiLGC6VuI8hWPRRJJ
         j7kW9vAqzgUp8fzYPTSeJr8yFvKTRhBBwSw1hLV9EKjz5MfmEg+w7sa0DXjIfq4K95Bd
         6LfLFec2okfpqYEAej/fSSAtuU2xAAipDrE16oJ35loZnshVLUJac7O5woDoMyXhnlUj
         zAYgxqMrBgTXqlXYqOG62Bo6L3P4DXXU0GZu8EVGJDclSHoj4ZcimsgFiVhOrqOSo/c8
         o9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345340; x=1794950140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPELBkmgWuDcQIUl+1C2gUiqdih6G+ZfnSfUpv7B6os=;
        b=VCit3mJVPVwLNAJBHyrKVmobcKAvzP0C3X6AFGomBu1PisaE13PA1l6ulNi7uYFonf
         4XXJHgP+ULkgiMGKLiDUoghKTttz5ud0fyUIYAVegWhRRZzGnIQQsbP4xEdDUXAP99Xw
         Xp0htro5JuBLtqoaHKWEWCgEaF0rB5dL8HztARnHUnikF37Cg+ZInAlpKL2fhp8xRiwB
         hDKQ392hme7zlZv8KWLG3cvBziayNfcrV9LjwrR/O3ME/qnyvaNpMpGNe6rZ6NXuUd/i
         utKPD17LanuUq9x2ILmMCqkV29ff83jiz17Il+ZcbDz8oW5wmVidZRlJdTUAgaxL1M8N
         Vt5g==
X-Forwarded-Encrypted: i=1; AL+hErEq2baLM9R+k2Czn6QGkhW7m3eVJZGZFtrVGUuoXEaonwIwIzgArEOWlhVtIndtIwqdzBWZn2OXWX/4jA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8fQr/XkhaiSemUrSclpSBHwFnCqWDSoCSlPTqLpBkDfU0dNyXE
	gLu03hdIIvJc4FBke3f+BDzpiFjPFlCGBCaeQKypRasYJ/tjNjAipqG6QtEVBm9odA8=
X-Gm-Gg: AYBFou3eQNVYRryKxxXyVng6RW/538CbVkvChsWJeF3akQ4TKOC2mxq1YVqY5XEDfXx
	O3ZV7/36U5DQ7IW3jzTGOzTlRcMFKAGWUtOM7sNpHPLZmneuO9D3XYSNC0/V+ZQGXDn9K+BKSoZ
	8lbqJ84RiUbZrFKLsBUG1baASqro9HiUAr5L6UxgKGijoPwpZQ6ga1qJtICofHQNHEWg9ZaPFky
	dzH06HXN4Xu4B/mlZBoeOTgNFtdgveRMa/s9A5uTw3ofckJzhQ7e15scARpbbZps+f1cZM0/LAk
	dYijyi+QLaj0XdiXnvrDXxYevhQWBkWP6q6vT6cQCjtkvETc5zPSNBAOZowlgbT7qzEO8plYG4h
	0YqJ+yKrIn0tRtUDHEF2OKdz7jO/7bXj1wilrOE3+d9QgLdievnT2oOufJfj3Kyf4oNjj8uAHty
	8mT+UYvlXRSyMhe/FtR3hOwNmE7Ksf3LU8RQup/UpvmuBEHwBfGxqSyn6KKS/XvowS7b0eX0U2M
	05FinEFiaO9yxouYisHPPaeNGeZPIySMzv5kFMFFn5vLEk84D6mtMCUKwTHOR2rJWo5LjGILSH0
	+E5ElTCN1edQ19ow7fIuXJTkkHtvlw==
X-Received: by 2002:a05:6808:c226:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-56b96ad0741mr201899b6e.18.1794345340222;
        Tue, 10 Nov 2026 13:15:40 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690573604fsm3142441b6e.9.2026.11.10.13.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 13:15:39 -0800 (PST)
Message-ID: <be330e7a-f37d-4347-b815-22bba165defd@riscstar.com>
Date: Tue, 10 Nov 2026 15:15:38 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset in
 atomic context
To: Anand Moon <linux.amoon@gmail.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261110061429.2036-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_131541_916975_D1504868 
X-CRM114-Status: GOOD (  16.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 12:14 AM, Anand Moon wrote:
> The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
> to wait after triggering a bus reset request. However, this function can
> be invoked during atomic I2C transfers (such as power-off or restart
> handlers running in atomic notifier chains), where sleeping is illegal.
> 
> Replace the sleep operation with the driver's internal helper,
> spacemit_i2c_delay(), which conditionally uses udelay() when running in
> an atomic context, avoiding "scheduling while atomic" bugs.
> 
> Assisted-by: LLM
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Alex Elder <elder@riscstar.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/i2c/busses/i2c-k1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index ff32876e24d3..f4b21d7efaaf 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -332,7 +332,7 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>   		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
>   		       i2c->base + SPACEMIT_IRCR);
>   		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
> -		usleep_range(20, 30);
> +		spacemit_i2c_delay(i2c, 20);
>   	}
>   
>   	/* check sda again here */
> 
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9

The use_pio flag is set for atomic transfers, so spacemit_i2c_delay()
will use udelay() regardless of the delay period.

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
