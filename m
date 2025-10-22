Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49C2CCD195
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 04:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcH3VtVk20dLBPykjl1pH67ZHy66UhCmkJ9cxA6Q6bw=; b=zshbYnQa6hDtDr
	VgqF0QE8i7NUbNFXYxgEFfxZV4f/9mYX+lodPzhCdIqhvY9iTONgnKs38yxIvcSyCjIByXhQJ/VQw
	aGCcKr5oZbOnrUesm+sJY857HgpSmxNYPq1PGylBkmqYuMra58qBildvwqc7+iPJr4jpD3z+ylsF0
	htEutk+fO1LlDsll6aFkxa36z+0TILpRLVvUkZ737pcICTw57bUsivVTAUUtPP1QCfL7LPFxyRAzs
	bn+pOh6EjdA8LrOsuTHkfKMEOHhmmOT8wbYTEybxViKSk3K1mdoD798j2WC92LHMOECKYoQws5Pah
	onMMfZLMWM692AGsQwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQYQ-00000001RCa-0Ow2;
	Wed, 22 Oct 2025 04:34:30 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQYN-00000001RB1-42x2
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 04:34:29 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b58445361e8so490674a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 21:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107667; x=1761712467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r07oRrpAm0dALdqxQgRoSXIP8i4Uf1rUZOTVIHgHy6w=;
        b=gII1dtojj81xB9W1tTwjhbGp7JF691OiFjaxKgEHGgyQ/E8PbPgnr+AZn2XmfpJRbD
         P+9AZogD74JOfRkyMoadPYU1vIukT/2PiwOXqIySRwKCyCx85IQpAhf0/jpgAkV7d0Sc
         ZP3vHfutCJdUaPUrNh4X8bky8yzlhJmXFhYcSLb0rjfE/TXtKdjcrpTRflakzYS0waYZ
         l+6GrK0iMIYbVHg2YtEAMreY19ReODWW7zDULu6fAzY5jOibdKLiN/jNCdizugtos+E7
         pkC2JoXeE5tZLZdw41a4m7UaYnIRk8CkpcdfPK2Do20tp8zuwKMbKu10cxaDQmo/Ba8M
         g0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107667; x=1761712467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r07oRrpAm0dALdqxQgRoSXIP8i4Uf1rUZOTVIHgHy6w=;
        b=EZaXnrlqPMOKXHpVZECInBQCOLMopOSHZr17CMFnXrLQ72SUSDLWaWHnsNNhKLtYoI
         Ci2wsS2gX41hpH6INkQIGYZG4/uRl0M5QlDll2LBFhqMPsuaf32WI8uuqHQo4jcEVA0f
         ZleCF7JMFyy4F9J0wxKGFgtx/yi6R9OnAHySzJu12c65EsrLFFnruxedR7XynRcbZ8+e
         2uSBUG7Ek3HmbGJ13Z5/DWkP7CIWu0+QTVH2w5j0iuZVHIpH/ZE+ml2Hahx9iWCVQRi3
         YuSw0GLIGrvIDCIbEuz5s/B+GPYN32XH2s4vxRcBmRuL4qm/W092W5V3cl2H8s87HGBS
         4O7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTYmvu1pXW2EnZzioqxMRkeg42pQNPPxDYOkoO1aRiknmrb4coZBSK+9Me9qh4VwIAsZZ0Wthce3OsEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb8zigA8/PTVEIl2s1Nlpzq2DVoaQPlG/cIi6u9YMavccE0uO3
	sIz5r8evg1O9880NvK/lCE1EvtH9HlQDcCQZ+AGqizH04KxNxCQP+ChzUnQZ+TYodJ4=
X-Gm-Gg: ASbGncs2vAjQEhv3DEdSQnCUHJnY/mLq3/Z4dvyEYYTA05Z56mSfqgNvMGTNRD8lacc
	7D3MQsvknLDIhFRogzLH81fuf9kint/bjyjt7QL2j8wExH3+67SuheC+nKQfPubFNWOwyUtiEet
	inIUWFFnjTYJAmlP2kAHil8eJCMG68E74X+vAdJASE7xa4c1qNk351ehe9SRrcNQG8YkTA2rT2c
	WOpjFZLhW6mzP1B/0VaLEriixAq93FIkaPdFhh52YuqwOowo08ujA3p//K454v+LDrvTPxXM3om
	6mIdG9OXvpOG2dCSp+pI/fj5vnR9RduQAfXIpklorTSz4UnuoRPM//8nhQ84R3LXiZRLiY+ht3q
	Q0KZP7Ybc3jNj8+jTsCfNH69BxtvSE/5PMUnOCYZKBfvDhdCRg/DFwGN/89g39pb+rg8r6sYaFi
	nTqbt0c4jnv7il
X-Google-Smtp-Source: AGHT+IEXbwpYqOJzdRZX+yeVCW+HRgEFHEhSfhpnfqLc9E63Y9hId0Tl9GklX8WzGZZ/QxYr9McgUg==
X-Received: by 2002:a17:903:17cb:b0:292:9ac7:2608 with SMTP id d9443c01a7336-2935e02e491mr1133385ad.8.1761107667134;
        Tue, 21 Oct 2025 21:34:27 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:26 -0700 (PDT)
Message-ID: <06af60b7-7ef7-451c-babd-e612a356013c@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] spi: fsl-qspi: allot 1KB per chip
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-6-elder@riscstar.com>
 <aPaLibm+oVKSDbL9@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPaLibm+oVKSDbL9@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_213428_020303_8178E396 
X-CRM114-Status: GOOD (  18.40  )
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

On 10/20/25 2:20 PM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 11:51:48AM -0500, Alex Elder wrote:
>> In fsl_qspi_default_setup(), four registers define the size
>> of blocks of data to written to each of four chips that
>> comprise SPI NOR flash storage.  They are currently defined
>> to be the same as the AHB buffer size (which is always 1KB).
>>
>> The SpacemiT QSPI has an AHB buffer size of 512 bytes, but
>> requires these four sizes to be multiples of 1024 bytes.
> 
> I think it'd better to add field at fsl_qspi_devtype_data, like
> sfa_size.

OK.

> sz = q->devtype_data->sfa_size ? q->devtype_data->sfa_size : q->devtype_data->ahb_buf_size.

Why not just set sfa_size always then?

Anyway my biggest concern on this was what to call it.  What
does "sfa" stand for?

I'll do it the way you suggest for v2.

Thanks.

					-Alex


> 
> qspi_writel(q, addr_offset + 1 * sz, base + QUADSPI_SFA1AD);
> ...
> 
> Frank
>>
>> Rather than add a new quirk to support this scenario, just
>> define the four sizes to be 1KB rather than being dependent
>> on the AHB buffer size.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/spi-fsl-qspi.c | 17 +++++++----------
>>   1 file changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 703a7df394c00..9ecb756b33dba 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -795,17 +795,14 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
>>   	 * In HW there can be a maximum of four chips on two buses with
>>   	 * two chip selects on each bus. We use four chip selects in SW
>>   	 * to differentiate between the four chips.
>> -	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
>> -	 * SFB2AD accordingly.
>> +	 *
>> +	 * We use 1K for each chip and set SFA1AD, SFA2AD, SFB1AD, SFB2AD
>> +	 * accordingly.
>>   	 */
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
>> -		    base + QUADSPI_SFA1AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
>> -		    base + QUADSPI_SFA2AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
>> -		    base + QUADSPI_SFB1AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
>> -		    base + QUADSPI_SFB2AD);
>> +	qspi_writel(q, addr_offset + 1 * SZ_1K, base + QUADSPI_SFA1AD);
>> +	qspi_writel(q, addr_offset + 2 * SZ_1K, base + QUADSPI_SFA2AD);
>> +	qspi_writel(q, addr_offset + 3 * SZ_1K, base + QUADSPI_SFB1AD);
>> +	qspi_writel(q, addr_offset + 4 * SZ_1K, base + QUADSPI_SFB2AD);
>>
>>   	q->selected = -1;
>>
>> --
>> 2.48.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
