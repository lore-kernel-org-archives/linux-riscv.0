Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC70C7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ljd4WBMH6MpAfkT9s2a5Rxp57DDwyUIW4TsabYnzz2w=; b=QXe/fF87HMDccD
	rkjbFUXMe7Rr72rFZszIkcktjiOC5FZXsCUsx9PVB8zXzbV0xeHybUL0tPhxtlDgTbjgDeH6l9GIw
	iAf4uCHaV1ITTd/rZSCpA1s/+ozPoMZNgBNnP/gbuGRpS39IVi9fkzgQqhn14dZlHjC/CctlQrb2A
	tVYI0VxwambQgSRiGnjv3cY0PFdVJE6km9qVO4+6z5obCPFioCMHRgoS8N0I/cKvWLPCl0q1SLljC
	eDsMHmhsWfuEXonYsy5bxEa1ivXDVym/BTvaMKu8sEA7osF/vqQrcU0CLoppvpzZZBYLOJEoUdTZq
	4FTfPsrWvKDyoxPPPnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREa6-00000005Dlu-2wBd;
	Mon, 16 Jun 2025 18:29:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCUs-00000004yfs-43oM
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 16:15:48 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2363616a1a6so36174785ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 09:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750090546; x=1750695346; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0uTrBAG2kfrUAaLMnOEIfmT4aWIhMhsYQt4NXevwF/c=;
        b=S3L/b8Y16KmvnI3JfhwxjAWsq1sOQda/VSJRU+gmjd61hI2FCadSPAnwbdJufflefh
         vRfcWmXn89oCz3fuhgZgVitI4Bk0M0W3ZAJRtVzcfJ27Qkl9e5p6v2n/EtKSJnIuAU/a
         1Fgvca9T/dIX5CgXMiA7ZGRHnCbCSY+HueN0HEWG5bMjqVSHlq5MR9yY9/UZ6bfRkBKs
         GA3UTv+wwwUL0Ixq/4Z/JNVNQHkcM89EYntCJUY9oOe7Xc7SSEaxXrp4hQ0NMOAy/lTq
         DWe3mirXOmxEq2a4uGHXynV8IwFkBWHJGbWrosB+Mg0uAmLA24FppDeUvlvOhmiEiQKx
         zPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090546; x=1750695346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uTrBAG2kfrUAaLMnOEIfmT4aWIhMhsYQt4NXevwF/c=;
        b=SbPpQd4HbX89qBLOkEcOnjRCCFJ1iaIqPGZzVz4fHZazlvB25p1LOSSxQu8gOqwmlj
         Y9oDhycs0f36iXN0iEGrBQWhZNMRdZEJDDTGkrM3OaKhwBpIpZsnpLygnSJ74yAzIaJY
         AfAOjoRlGWxek4eZTUcXh2TRbsl2/y/BDzzUshFUlvEu+hcVsdlpkmjbuCV8aMtMfE/D
         IwjtKZqHyQvS4Nr8G5kHmO5rufr9sMScW1pUgL35VtIq8FAkmxt96dQSfVifdcOBkIEU
         ev/U60MNQzuSJZbilTZ2AB5fFIz6o/fAuDOPsWPs7OFGmCp+xl3nFIQb/2nZzotASkW5
         Z0gA==
X-Forwarded-Encrypted: i=1; AJvYcCV2RYjnnteB4dEzto+HSt6WqDJfEkqBjL/+P01BVMrupJoaZwzRHutAYsXpA/JGx2/ysDTSd9YzR9DUqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVByvwL1O7i1r+h2J84Dy6x1+uXzGO2IqidOCb6PcjXYrodA5R
	+k2N1jybA2NkPtHK7yPMDSzr54c5UYKPpFlRnh9j95WJgcdzce9V0hEE
X-Gm-Gg: ASbGncv9ICZYqAGHIL9a7pZY9g+RQ1+FY8ExnUVHD9HVI3+moMJ5nkYTZVh9I0ZsvZ2
	lINRfEU7SG+oVt6frvp8gZC0S+WBWGJDP8yH2Ifh2v2CFEJyekVFAwAK2S10GiKhMZQXhvbSDpt
	vPI8xIlh1A2d+FeFWekx8WTa0t0hkPxeKb+6oSoPaXDKnpjFd3ARcs+L13dTyJtOqVKR/EGbzs8
	oSnHwYWbOqnHCsjtPPy2e1IfsuEPgFs7EgyfjN6182S1ArogfmS3O7M0JJkqc3L4B1fRHVRFMMt
	+ZiEI1YO+ca33kPnOfTTGguxzjEgv2DJcLvqRv+9Y5QZGYqeUvodNmnJh748Aaj5QqRDvJBy8zH
	CLgJNmXswKTdwEAT0UkOmk+B2wwZ8UkJCA+E=
X-Google-Smtp-Source: AGHT+IE3tA7AOwwFFvjHA9hJdPQ7s1oXsnxKqkEoFfrcTl0NZisx9y/jSj/aqeB4j77TJbzdQQgPFQ==
X-Received: by 2002:a17:902:fc8f:b0:235:6e7:8df2 with SMTP id d9443c01a7336-2366b14e74cmr163962135ad.41.1750090545628;
        Mon, 16 Jun 2025 09:15:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78565sm63031435ad.124.2025.06.16.09.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:15:45 -0700 (PDT)
Message-ID: <b278e83a-473f-46ee-b353-3f8c14d03aaf@roeck-us.net>
Date: Mon, 16 Jun 2025 09:15:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
To: Chiang Brian <chiang.brian@inventec.com>, Jean Delvare
 <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250610102556.236300-1-chiang.brian@inventec.com>
 <20250610102556.236300-3-chiang.brian@inventec.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250610102556.236300-3-chiang.brian@inventec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_091547_011530_B9DA00A3 
X-CRM114-Status: GOOD (  11.01  )
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

On 6/10/25 03:25, Chiang Brian wrote:
...
> @@ -263,6 +282,10 @@ static int tps53679_probe(struct i2c_client *client)
>   		info->identify = tps53681_identify;
>   		info->read_word_data = tps53681_read_word_data;
>   		break;
> +	case tps53685:
> +	    info->pages = TPS53679_PAGE_NUM;
> +	    info->identify = tps53685_identify;
> +		break;

0-day rightfully complains about the bad alignment above.

If you want this patch to be applied for the next kernel release,
I would suggest to copy the hardware monitoring list on the first patch
of the series. Without it, I get

WARNING: DT compatible string "ti,tps53685" appears un-documented -- check ./Documentation/devicetree/bindings/
#296: FILE: drivers/hwmon/pmbus/tps53679.c:316:
+	{.compatible = "ti,tps53685", .data = (void *)tps53685},

Since I am not copied on the first patch of the series, that patch has to be applied
through a different maintainer tree, and I have to wait until that is the case.
Not that I understand the logic behind it, but I mentioned that before, so I assume
this is on purpose.

Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
