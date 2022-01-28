Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181F8C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 06:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmNpgh0L702IQ45ctdgb+G1Gy1EWjdRoMo+WaXOH/vY=; b=I/0aQIVklU6Cba
	gAKXOaSas+nIXw4RciGdrC3hQT4qzgqwCLZPPzI3ashPjgrG3txbBM9lOkHEtM4Tv2QFR9eOe/Cv0
	qcua7o5UwRNPTYdMQ03ZbfQBeWljrkZE6FrYygdx20AD41iP3kONpH+6S0JWcFOsyBqtkC5nNoWtU
	TzJI+xwct0NhKsLGvSSV/ercei/Ah8h4PMSdirORLL2+wkeHQ5Wc4Qi9ur+/qUep1JNY/8INtYDoH
	TOn+7hVUkI0EJ+pAPH3ZidFMZIYAupL9Mihh66kQA/fEQsFOsLKFIOKkcdkZ5bEdxkBM02N858pHK
	sZXEwS7UKH8EWF9Q4Vow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDKZp-000Xz5-Rz; Fri, 28 Jan 2022 06:17:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDKZn-000Xxg-6B
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 06:17:40 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9BDB33F1E9
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 06:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643350649;
 bh=0t1V4zvmNPJT9wYj/Pd8jJat58ip8FOEKuqF28wuRD4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ZdRus7QXPg/hqA9G2jvpSG/r/zc6jMY5EGxTTQOBJloYK+B9F0xYEUB53amld8ozu
 gLFE7WqZqWLkpRwXqq7QFM5GIc/Tl5HrglZ+UZ7FTwVm/F8wsn84pfVgnPZR6q+s9k
 7CB+M95rKFndO37/H8U4E0Zr1YlS9yms7nONaZKTmgUVDaHQ4IHGw5/0aGw73nZkDY
 WEJH51NAS+q0WgbBa9QMlVITWzB9HTXFzXfPNgvOhDx7XjORgGWU067KUNLXwrOQhh
 +7Rfh8m1Q/7YVevZ00nej/oeDGbbAyR09jP++VkcShoH4k+wLgEpavzGnBGyOxgt52
 QyZg9dEhT2vYg==
Received: by mail-wm1-f69.google.com with SMTP id
 d184-20020a1c1dc1000000b00350769d4bcfso1154963wmd.4
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 22:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0t1V4zvmNPJT9wYj/Pd8jJat58ip8FOEKuqF28wuRD4=;
 b=FFgyomCPcyylDD0zQ+zi9bZhXMcOSsIeEd/8G/nxpjPy3rcIaLuoCWRBW/VAgvBYVf
 SVH2/wyiBj91Zdxr8E4oI6MhulhdXaMFPpabUT728ex0mGbpeHyqheL1iPJv3CbZQuMD
 I3h8mqSxDeEQ67QOFW8xYCMcsjMTlaVWZveS7XhD1zW4RDBbWEJsoQmHINFK0YR/bTLr
 Okg+zPMrSY2pz3mDhm+eJ3f1J1awaCib6uPmp/BDJp90kS0CKfTa+KfIuRyZLF8QlVgx
 +iJMC+qgrOZJnLbiru2jq0g9oYpsCM02asIrUZN2cChp4htMUeWSPSei8ctkTNBgcM+B
 XHdQ==
X-Gm-Message-State: AOAM530wuz+IKnF9gDSO5QY1z6e79FK5hFIvSaeuS1Ak0rLUV4NSuQkD
 e8QabEmvnUbmh4oeC4kLq+iC74h0ZzfMtozx/xVtkBu37r6n6lKXLyZZjIYZuWA1tNRl1qIUVdo
 Hz6J0nGxkAkbCuFzS+5M8OlpOnRCySCDa+aGC5iJ5swioEA==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr5875242wrr.220.1643350649333; 
 Thu, 27 Jan 2022 22:17:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnfGoUTSgGUq+FTJ1O5uTS7OjWZEbG246bwyKtGG3BSFUg0GOMLfkbUl4tx/4Z1J+yMAiWqg==
X-Received: by 2002:adf:fb05:: with SMTP id c5mr5875223wrr.220.1643350649139; 
 Thu, 27 Jan 2022 22:17:29 -0800 (PST)
Received: from [192.168.123.94] (ip-088-152-144-107.um26.pools.vodafone-ip.de.
 [88.152.144.107])
 by smtp.gmail.com with ESMTPSA id m6sm1158698wmq.6.2022.01.27.22.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 22:17:28 -0800 (PST)
Message-ID: <6cd57022-6fe3-d065-dbe3-e9487894a94c@canonical.com>
Date: Fri, 28 Jan 2022 07:17:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return
 value
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
 stable@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ard Biesheuvel <ardb@kernel.org>
References: <20220128045004.4843-1-sunilvl@ventanamicro.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220128045004.4843-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_221739_409250_C98155CC 
X-CRM114-Status: UNSURE (   9.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/28/22 05:50, Sunil V L wrote:
> The get_boot_hartid_from_fdt() function currently returns U32_MAX
> for failure case which is not correct because U32_MAX is a valid
> hartid value. This patch fixes the issue by returning error code.
> 
> Fixes: d7071743db31 ("RISC-V: Add EFI stub support.")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
