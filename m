Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B94AF30946
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hznZvB3ZoWawBz8ekKGNt1BZsLVTFwl+KrQ29P9o2VY=; b=tZlSpc125coFVZ
	sIhZ7QScl0zlMsAUjjggCkE7Hd0dsD+DGFY5Jc3pD1QiKXL+IRoT43HRBRYRi0cS49O3v1XPR2FAd
	7O8Ym+0CW/ZAuEfTHuzoljn1VQIQPOraQ/jep8POwErRW+1CFTVLgAVWVKn5EUlvw8oFLn4GZyUJJ
	FMxOMulNTur/vnNgkZGNZVMgUk1L8gSyMJ8a2EyNq80w+t0Vu2J4X9BcAdTvatrymHHAukAZcp30I
	cWPM2aIM2bRTwuxmRe9PW8SizS1Y2dYtQWvJaOPvjszAfPiZCwfJxSGl3c5853fhrfE79+mrHvzbz
	WPGrtlaeU0HD16KXdciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8K5-00000001pyA-0maT;
	Thu, 05 Mar 2026 13:01:01 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8K1-00000001pvB-3hf7
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 13:01:00 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2B67B3FB79
	for <linux-riscv@lists.infradead.org>; Thu,  5 Mar 2026 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1772715654;
	bh=AwP4BhYIWaYYtzi0hBUxp/zG8QUjl+08i0ub1kRdEPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=RLTrDx7xqjdaV245QxFuawUMvLikKo4rnl33i00AiNiN8GbWgnysfhk5dxagxvP+O
	 y+d1kx+vc2jd8ImL+o6zY2x1cepn/eD3ETAwGkHPICTtCAixF7zMcNxRrGMpFbPN7s
	 8X9WCthSQatSA1KFNK4/2zWPZB7KU8t0O87ijUpKp/F0C+X3d3YT83TKZFAd4uPQuG
	 xqV0JKIbbaKX2LRtXYug1EY43js1wwh5oigIHV8EiIfUghET0voO1yRVGjfYRwZnXU
	 SrjwPdMUeByub1UEDAQYjimje1Xv60A/vxTvZrsNEYZG5txtY5+ZYELUKR+83b5wfQ
	 IvS9IPAT5fPl0PTzwxMccwoJvRwbCVvmZRUw0qgxBw67/HSVHEr8Ucc4/0dPNJCZRU
	 jbujNV8BFvhzcWLtooM4Tu27656UXK9sQN1L2BI3K4vPCRQ4w9J2Z0X8my3BtKQN/t
	 d3knof5bsPz2Qk89RZRHMl7yTRT/pY0eFcbehuNiXtJZd7FbCgOFRqq3CPj+F+xKO8
	 dlGWE/WXEWggpwjGG9NQ/nmv+/n3roRx+tU2PFjMvSYmBIzNuaZNI3JgPhoBJLz0/c
	 lbMXWfJN1cj8j+ImpAoekIIChvat+QAlJvVyjhz6JcUd/CthfrFNZ7HArGlHqczTsk
	 Xt5+Ph8sBo1d+3CSz1l0clpQ=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4836cc0b38eso81043535e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 05:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715654; x=1773320454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwP4BhYIWaYYtzi0hBUxp/zG8QUjl+08i0ub1kRdEPI=;
        b=BI4w+HoiCpqEdYEqZHKsLDffTTYIuwxDaW7Om3QdxwuGdH0U1RT16+fb5BW2j6buQG
         ZxNywYFsdjP7SQ9E1Iqz5XfCAXgbDn6qheFQHaJbvqka4ePPZ8wZ1q4ogvYE7pSkbnmB
         bphu4l/bP4Zu6k1+PBSqq/c1/Msgz41d199lypsbTb/QhksqQ+pWcGWGakUUFwyn2d6U
         WU/h8/8LTXfl1Stl30jVvQ3+LeBaT65Gwi0k0Rhg10pFQ0U9nq8J2IeGztoTMpZP92Gx
         WXYZ7ZsrqqUcKyTajiAH03ZIdjY9bHTI9c9MpdKINICt9jgXtjsORI2IHVgZCE6tgbyn
         0WGg==
X-Forwarded-Encrypted: i=1; AJvYcCXk1r7XLUjGIbasCSd7kjGLcyhFWo13uYUt9fCV2r7AckRYi57b8a9FpJzudHXx6/FpJ7JdPkhapQQIGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqGWQT5EanF7LX69TcYEK+Xi7CoHYf8YEE1qIkq1lD2zKEou39
	IqYyTlzCiNIuGiKimZXvZDQqi78N5/Ux4U45gzsMVrmY2VCmyRZCrmVvY6GStLczuAnu4tjXZrh
	XDAHTLlKl0VdEuYhCnr0oub7xXLT7nhNhIsq5gmQyRCN8JtcI8zLKWKfPq5DRgLa9mRlEUCnSfY
	B/wX13a875wQ==
X-Gm-Gg: ATEYQzy151oabRvmWF3KztD5/nkwtRTtouGGZIXMOlD5f5umgA/hXjn3P0bjDM6q6ep
	MCFo/Fg+uorWquTInmQW8Oa75j6XkMX0Gze1z+OSyf7j5tdnYdY/PJzVvDeAFuoyxIlsXTXUjbi
	LmPyYaQFtkCUZw48qPttY3eRLztEILoQc/iltPhxVfSxt+NAb8TOkmdjSnBXqDYTT8nmzuHoNUQ
	KvnhUNsPkGh+ZTZ1mF62ARr1BhUF1NjcU6c+3SXWBRXka9JV2v+FsgZyNkHES+5MS0tlczAfKIo
	e6URwxr1dXiigu5/RXH97tsJ6qb7/HF2Ne82pqC0P56ADlpvGd1i6igO11oDaOgukTXUQXib+TR
	BSsvoalwrilybSbAsc9gu0+I7Wy357FWlf5LaxTKkpCEhkdl2XayVbyh+fCV6jNbpdwSvoVCnPh
	CefXYJpCAeJ/8f6CnJgNYOjBO5irXZn1/H2IauvUK+flXhSfP0DWI=
X-Received: by 2002:a05:600c:64ce:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-485198608e9mr100891325e9.10.1772715653176;
        Thu, 05 Mar 2026 05:00:53 -0800 (PST)
X-Received: by 2002:a05:600c:64ce:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-485198608e9mr100890655e9.10.1772715652709;
        Thu, 05 Mar 2026 05:00:52 -0800 (PST)
Received: from [192.168.103.129] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm19363148f8f.19.2026.03.05.05.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 05:00:52 -0800 (PST)
Message-ID: <f4ba06cb-a0d8-423c-b1bc-0257625eea00@canonical.com>
Date: Thu, 5 Mar 2026 14:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: acpi: update FADT revision check to 6.6
To: "rom.wang" <r4o5m6e8o@163.com>
Cc: linux-kernel@vger.kernel.org, Yufeng Wang <wangyufeng@kylinos.cn>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Conor Dooley <conor.dooley@microchip.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sean Chang <seanwascoding@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-riscv@lists.infradead.org
References: <20260305091433.83983-1-r4o5m6e8o@163.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20260305091433.83983-1-r4o5m6e8o@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_050058_309957_624854C4 
X-CRM114-Status: GOOD (  22.29  )
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

On 3/5/26 10:14, rom.wang wrote:
> From: Yufeng Wang <wangyufeng@kylinos.cn>
> 
> ACPI 6.6 is required for RISC-V as it introduces RISC-V specific
> tables such as RHCT (RISC-V Hart Capabilities Table) and
> RIMT (RISC-V I/O Mapping Table).
> 
> Update the FADT revision check from 6.5 to 6.6 and remove
> the TODO comment since ACPI 6.6 has been officially released.

If I understand the change correctly:

After the patch QEMU v10.0.0 will stop to boot Linux via ACPI.
QEMU v10.1.0 will be supported as it indicates revision 6.6.
See function build_fadt_rev6() in qemu/hw/riscv/virt-acpi-build.c.

For Ubuntu this is not an issue as it is on QEMU 10.1 on recent releases 
(https://launchpad.net/ubuntu/+source/qemu).
Fedora 43 also has QEMU 10.1 
(https://packages.fedoraproject.org/pkgs/qemu/qemu/).
Suse Tumbleweed has 10.2.1 (https://software.opensuse.org/package/qemu).

Stable Debian Trixie using 10.0 will be impacted 
(https://packages.debian.org/trixie/qemu-system-misc). Debian Testing 
has 10.2.

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> 
> Signed-off-by: Yufeng Wang <wangyufeng@kylinos.cn>
> ---
>   arch/riscv/kernel/acpi.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 71698ee11621..ff681db9f4f1 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -85,12 +85,12 @@ static int __init acpi_fadt_sanity_check(void)
>   	 * The revision in the table header is the FADT's Major revision. The
>   	 * FADT also has a minor revision, which is stored in the FADT itself.
>   	 *
> -	 * TODO: Currently, we check for 6.5 as the minimum version to check
> -	 * for HW_REDUCED flag. However, once RISC-V updates are released in
> -	 * the ACPI spec, we need to update this check for exact minor revision
> +	 * ACPI 6.6 is required for RISC-V as it introduces RISC-V specific
> +	 * tables such as RHCT (RISC-V Hart Capabilities Table) and RIMT
> +	 * (RISC-V I/O Mapping Table).
>   	 */
> -	if (table->revision < 6 || (table->revision == 6 && fadt->minor_revision < 5))
> -		pr_err(FW_BUG "Unsupported FADT revision %d.%d, should be 6.5+\n",
> +	if (table->revision < 6 || (table->revision == 6 && fadt->minor_revision < 6))
> +		pr_err(FW_BUG "Unsupported FADT revision %d.%d, should be 6.6+\n",
>   		       table->revision, fadt->minor_revision);
>   
>   	if (!(fadt->flags & ACPI_FADT_HW_REDUCED)) {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
