Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A5BCD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 18:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbLEp+9tTO3o/cfsakWehUHo8gaAKXkUVmEMrAFb1ow=; b=lxKjhkzTHwjq6W
	RVNj4QErAaO7H9x5fCz0Y9pB4Ii7wNowVmbaHvKfTZANdz63LcsiBaQ2coav/QMV0zTS3XqLn+Vh+
	g/hc4Ne78Di27SLpKD7hNUEDNPHCQGAQChukK/X1OdggW8mRs8O1t6OsHw8zSzyLhNlZz1qojzI7c
	Uk96cvf/Q8SyT6r+qeX5xLUuWkHRpvhRc4rFFJ/7wZ9PKAldsOpGSFpk7/RvM1us/qgAujVhRWJzJ
	ckoZ9NvLL1HumhiXesV2gIXOat41Fz+3kKacv1PCfSCc0KE1Xq7ZasDM7iKO/ofTsZEv9qIGKtzT0
	lXcvEkDhL4M/H7mJamkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKOT-0000000H9Xf-0HTo;
	Tue, 05 May 2026 18:21:17 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKOQ-0000000H9XE-2sFA
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 18:21:16 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-62dd2fa4a16so1947701137.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778005273; x=1778610073; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PAwVM1Z+cNq31xz020hTCHt7IsL4VWpTOpbAV7HgmM=;
        b=T1Vq4gd+HSYuZwhYR26Gv8FfOL0+SHXHBJMVKgQN8rMg/ImnfwkettC7WZCqlWdYAq
         cFYcN78hMp+crRDGzYFtt6wAmJItCr0XTPuVZnVq76nNqsenN9xyqrIqDxpeBgIy0uSE
         BNGskRcJebP5Wt06V1RYOcrAnE7j1ihJ7hN13CeGH/AchovbJaz+/hMgkngTIUiNMFoU
         RJ/HugHbhTOz9N22neZ9vKZJfqE6kExi3G+l8qiMWVXxzXNshRuC85d7ELidFO69mATA
         VpEEmRf0p7nytTPbvXlp23D9lXcJscdkuRYdZdA63O9uRSYqBTPE8A4E4MLxQJYXJiHA
         cZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005273; x=1778610073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PAwVM1Z+cNq31xz020hTCHt7IsL4VWpTOpbAV7HgmM=;
        b=PjKHRFJAWFUKsVO6g5Zmi0ArVvyLvsq+V1Nvwq89Rb44CNWJY2dUZX/WIw6x0t71xO
         /n3fGQa7TAWcu0et6efKbEag1XaZXxrO7HRcToq9JXERmQjTcHj+49QrT4UplbN3LjcC
         SJUunMz4e0PrWUV6yZdNX8yvS6MqZyBOzKND3xYq93gzg+gWFjw8vuPdosZxwfyHLanu
         im3aMeZ9CxdY2igV/1YFRuvQQKSUU/K0WVnai2TElrQhMUxHTt4ioUtB731SHydC/cmn
         +UM+i94JoRVwFrULobpU8OvUj2KTMRGEYrQiLuhxM1ZIsnyL0q0laZZsU8WlLkMwyLEs
         zsHg==
X-Forwarded-Encrypted: i=1; AFNElJ/tzAmKj/rg2/kDJD5otbp1KBIhzwlZftueh5acj2V8ZfRWf3H4zUgrai54ugMJldMklM6XOI905iNKvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWwen/DDK2AscYzaOcBhsB7XEGX1zPDRPc8oYBtoaZkpnvOJ01
	EQZX8P0WlVdlL96B7E0PSYdUQUNuleSDnJVB+mkme7aPmQzgWIpgBC5XaER/ukpOYy4=
X-Gm-Gg: AeBDietIswECfpqmZDp/C+XiI+r06oKdAAC3z4p69P6IyPHJdqF/+WPXgWeBYuZ6ZUa
	UYjjkwlFjd65m3cbAUe+YY1R9b+xm+GwgKgU9vDtg0ymS1jsdmFtcIzMaZrPXCX6vwlYHYFQHN8
	2gznOLDcBNGDcUt/GvlpFwQjHCOmhRxhL9lz+5LqDOm2U6PhzlVxGEUq/s4AX1ox9mKXumL9AkB
	C+WhhjhViCe0Hpiz9DUwDWiVwA9GQesthL34kp63/UUyA/hCW5OL8JkacEdWtB57nUyuwifcCaD
	VvJRSw+LtcB+VpmNBgWjWwZ1SfjI2H9WiN0h534yNpoMk2eOT5KBGzmKGc+VjW/VtG//ybVhL13
	kv1zGIW8QYvJ9LlapkOREE44C2YHtMOEG0L3PN+WKP0xUzeRzGrdqADuKTnhX7zbsGyQExvk+Q4
	C3BetGpY3ZkRizYq/iCCYwhLuarafXODwrmCxv/40sLjrICyg5hoc6PXjxa48eniJVVojlev3eU
	j5NUswjvzMH
X-Received: by 2002:a05:6102:5a96:b0:611:3bcb:aee5 with SMTP id ada2fe7eead31-630f4e3dab7mr792844137.0.1778005273387;
        Tue, 05 May 2026 11:21:13 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c0e7f27sm185778316d6.32.2026.05.05.11.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:21:12 -0700 (PDT)
Message-ID: <9f655145-2c97-4de0-b964-1e23ab95de1c@riscstar.com>
Date: Tue, 5 May 2026 13:21:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spacemit: avoid 32-bit integer overflow warning
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260505175744.900750-1-arnd@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260505175744.900750-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112114_987539_2A4A2300 
X-CRM114-Status: GOOD (  18.79  )
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

On 5/5/26 12:57 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Calculating the bit rate in nanoseconds does not fit into a 32-bit 'int'
> type, as gcc-16 points out:
> 
> drivers/spi/spi-spacemit-k1.c: In function 'k1_spi_set_speed':
> drivers/spi/spi-spacemit-k1.c:393:38: error: integer overflow in expression of type 'long int' results in '-589934592' [-Werror=overflow]
>    393 |         nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
> 
> Cast the value to a 64-bit constant to force the longer type for the
> calculation.
> 
> Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd.  I diagnosed that when I first saw the warning and my
fix was identical to yours.  I believe Mark already merged the
fix.

					-Alex

> ----
> There is probably a way to rework the algorithm to avoid both the 64-bit
> multiplication and the following division, but I kept this as a minimal
> change.
> ---
>   drivers/spi/spi-spacemit-k1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
> index 99db429db0b2..215fe66d27b4 100644
> --- a/drivers/spi/spi-spacemit-k1.c
> +++ b/drivers/spi/spi-spacemit-k1.c
> @@ -390,7 +390,7 @@ static int k1_spi_set_speed(struct k1_spi_driver_data *drv_data,
>   	 *   ticks_per_word = BITS_PER_BYTE * drv_data->bytes;
>   	 * We do the divide last for better accuracy.
>   	 */
> -	nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
> +	nsec_per_word = (u64)NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
>   	nsec_per_word = DIV_ROUND_UP_ULL(nsec_per_word, drv_data->rate);
>   
>   	/*


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
