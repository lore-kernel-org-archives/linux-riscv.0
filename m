Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239A8C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 19:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cvsri6hNxzw+P0idCN84Xx/KuROcBY7W33j4fzxVol0=; b=MaO8k3xHG923Ko
	2qS/eXmqj/aiAofVnV5d8t/CJNn7Cs2ol9JkirJY6o7WmEtVBZ6IpDEAi3ZLSZFkVwntxVuKt8enB
	uVA38dTwEf3jpI04YSaRU4RB7eiPiAPYelI8ZvgS1bRiz056U44Oz3EHVBaxv0zYofqKzGH6rAerJ
	GZG0LRVLZyCNOqNXets4Ce7IrMnZipCkEUEQBuakbTqEGFk9E3qK+pFDhadP4UEtkNaXwd8ZryTvm
	FVHf9qq/5X0TneYqDj7uWZ9VRPR+B7XlkVxc/B6ezTg8P1FW9FLw51MpprALQY8N0v4+UOiFSaCRN
	WZenjpcnw9FhWaVIK0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZbLq-00000006WQq-3OjO;
	Thu, 01 Aug 2024 19:20:38 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZbLo-00000006WQU-1651
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 19:20:38 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-81f860c6015so306804339f.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 12:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722540035; x=1723144835; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0pg6YXhtY4f6UJYgaFLa/yn7KUmiZNNRf9NC4VF7bk=;
        b=C0d4r7VGp3IMHQwAJOvRezx5/iqEFwoGnvDfnWPgE1NO5T6WVXjrbSLa0hNl1KfTK9
         +YhZeTcPzFbEDcirWE1r74VyF6RXdqaKsj4v+uSYnGT3SmQU/VDrxy/SngWSERNCQ4iC
         7jKIZoB18B1JuNP2g2zkHOsa/zez+rs6aR2X9O4UEJpKaK5cWV4lB/mXkzw0EC9UCuTD
         7gpXcPHj7kElY5ftH4qquqUb2/gob98aftRUdPvHVmBq5RJujzSWtk4HPsNqxf3mh9vM
         MxSV3pOAK+gnIa2Ih7O8wkFbiXLmMgQAEBFjPcS8VOzNGHQX6HFF5Ue65jZeyWQD9khb
         /ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722540035; x=1723144835;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0pg6YXhtY4f6UJYgaFLa/yn7KUmiZNNRf9NC4VF7bk=;
        b=p5sWkfhdeuSqzytyhAbyUIhzuahWNrxLD4IRmBEEomzi1SZ0JVKqH7iuRX8JMHOiW4
         SHS1etERcnmr2nH65LAgdQJU7hAkalWcXziunGpHCOuPEaxMZwRUburf7KGzZUiUrMj6
         wuRUzvqaDZzmWF6tS8lN+CDIgJjRdLNMQ31IqAqafiVlCoVAl+0w3IjXgZKY/HzdFGQy
         xUDNwnvY41TXm1GBWWKa4FH6rDGNbPm+ceC5PhryqG7Ka4vJBSW3oIlhxzDMbDAQlC/2
         INxfPRsi/L2FLn8yiUa71pFBVwRVtNYrIGm1LZMoasdRhGEGiDXb/2jHRpKgSUBfMcea
         yAqA==
X-Forwarded-Encrypted: i=1; AJvYcCW28CzZFpnWW+DQSdj3f1isPCsiPMGFej0N3KMa9Vcu5G9HcD+I56RnoaCZiXFv5MEPiE1vvv1kZ+b0UCRz7ofHzsOevsMwtzHhvuv6BgFX
X-Gm-Message-State: AOJu0YztjgAhl+V5fpKWc+yN2YvKTGIXzl1RIBEB3YAv/779nO2jc5+i
	ImgMZAsTDwjdwlWrNz+SSlbZ5ojs1bsW2qzDfSeS1cawALxq/rC2ctcrvPNDIZw=
X-Google-Smtp-Source: AGHT+IHE2eHuMz82l6ajvPT31NaD8GDbZZogtIvNcarXHsXietZcyodp9fy+D6q8Cawbi5d6NuA1Kw==
X-Received: by 2002:a05:6602:1641:b0:81f:cb5d:a5a5 with SMTP id ca18e2360f4ac-81fd4353a70mr208168039f.3.1722540034835;
        Thu, 01 Aug 2024 12:20:34 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-81fd4d82ef9sm12146239f.52.2024.08.01.12.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 12:20:34 -0700 (PDT)
Message-ID: <b5343609-1b05-4825-99a6-57a33187dc90@sifive.com>
Date: Thu, 1 Aug 2024 14:20:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes v2] riscv: Re-introduce global icache flush in
 patch_text_XXX()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240801191404.55181-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240801191404.55181-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_122036_566403_01E302D6 
X-CRM114-Status: UNSURE (   8.18  )
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

On 2024-08-01 2:14 PM, Alexandre Ghiti wrote:
> commit edf2d546bfd6 ("riscv: patch: Flush the icache right after
> patching to avoid illegal insns") mistakenly removed the global icache
> flush in patch_text_nosync() and patch_text_set_nosync() functions, so
> reintroduce them.
> 
> Fixes: edf2d546bfd6 ("riscv: patch: Flush the icache right after patching to avoid illegal insns")
> Reported-by: Samuel Holland <samuel.holland@sifive.com>
> Closes: https://lore.kernel.org/linux-riscv/a28ddc26-d77a-470a-a33f-88144f717e86@sifive.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/patch.c | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks for the update!

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
