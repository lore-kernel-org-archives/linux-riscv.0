Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBC1E7716D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 12:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vx7o+5U6ua0JxpgJgTAf4LkyonYTfUkxq1Ly1gq9JEM=; b=4Sxy4stvC2OaSZ
	qofsqek0Mkkj2va91M/+uxP2lHFYANRqpvzxAdnNQ9sPBQxbArkG28iNFV9xkaTIIzIgiVXOmxNKM
	bd6B120a9IS3IxKNk4KkpemZ1S/xPpciT/rrtfnFiJhzI1PC2hq/LJyR1NRcw5CTHzmf/IYWK4ryI
	NOYmYN3myAI1lX5Am+ZwiUeYxIJaa67u9nB8ymp42zxSpcX8vki9wW37rGZ1Fft9Nr7tlTHUbw8oP
	icfYj4Ppnnc5BHX4u5FPs8kzFi1neUIqWFSbEYy3hr3c9Roi0HuWLr9CG4pcoX036eYqhnuHZmpQn
	qAnQKh7xwMLizjgHUoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAxC-0000000FwdJ-0s3t;
	Thu, 05 Dec 2024 12:27:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAvd-0000000FwEz-33U6
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 12:25:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-385e3621518so698008f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 04:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733401556; x=1734006356; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mQZqp4IFUTYgczPMKBs3aU2VcYTyt6nLnQ+NhQNlXVo=;
        b=YCZ3SMj2f+JAV6BfBYtvsVgbwxsfJckV92XNDyxl1+0Bym+7nuJFT1984pkWM9sSjn
         w6Ksfa1IiZoO4Hv9379Fq/lgO5NHA5Bi0SFsVXHjbZYBUZSQz3rKbct1PbJejwWkO4br
         P4s75e/d9a5bWHbjIXPTsXp2GdWPwxGLeycbWh8HcFOS6QNJCDsahKwgPeOL4Zd6DqsR
         BPzS/IC5mb2mcIA92k+hvh4w+B0jy3uDIMoSdAXiiMr3tSepMXyh6SLZtHwyGjpQyKdl
         Rg00naqx7gpEDksJZgWbvWY6xSKokriK1y1y0a/FDymDE7L8Hf7eWE7wFVqN06+Lh3np
         FniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733401556; x=1734006356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQZqp4IFUTYgczPMKBs3aU2VcYTyt6nLnQ+NhQNlXVo=;
        b=HzF0w3y+v5kkTMHMrd4ruQKXSMd54/hjDYXICX8yMSzJWjq9GF0Bu4No4HIeYh6Rg5
         hLPUb6SU45X6eJBAlPq3GDQOLGI6IcJYgoZSj7i0DSnYkVVBMM1RAgUOCEzss2Wgx4MO
         tUWsPZxtW0AN22sfzjGF7heuSkdWikaiIQNvZCRu0DAifBGAgQL0hcJkXbcv/dG1z7AE
         ZG3o/zbGpW/5iiKQTqDgLF7y/2WDdZGdTCvhR/IUGGEIaCMThG3zEFmKzkMIEosEq3P3
         jszPXmQZxy2fMGxZuRzJdIePtGjDoJxKXqeao/Mp7ir3wAyqVY6cn6oFZ/ie1nR9pPdI
         kpIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+o19qur0XrMv8GIPg/IJR4tmCLkGVbB2AGfirUeO3HRbb4ZqkrPbOA8Jx7YgvEEm/T5dV0zjfCpcK/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRG2wwvgN3r8dyEBYRODG3gXbJaY7pu/sDULOsLaNPk0P8UCYh
	3m5ewqYGHHtnASuMoI/YFe26dmkdx2wVhd8sym+Re28SWuPNS/iX4neVTCs8MFM=
X-Gm-Gg: ASbGncuCTuJ47+izQM2a9onCPjom794uQwJZ0rN4y8fRTjvLq5OosCtSUwkpLVg6EGK
	MCKwWOrBafbRyTDVEhmz11GG836+ct8UjO9hcTCAuPWLeMU/iVIB5/dZap3v64MQde2ESr+YiM5
	FIFIDZvs4eiCtQSvnV6lySipJYUNstBepegzllwjE9+p2HaShvkt5K8923OhgbOzyPPqyRpMK85
	HfEwLE34PRpEc7P2e53qbAPhAgAo9a99wVyqT6cR3ly116QtMEbaclqfgcXzFvB2xGe38fFDsfD
	0RkVrU5drfjJPJVlsBlbXNPR3xLWNsqb+zU=
X-Google-Smtp-Source: AGHT+IFgQ9iwN0Qu0vgSQZlMRT0k8B5zzY1On7I2CUzL6GWVsYOhBeCvU1TBPvS2cUARk11eBLePLQ==
X-Received: by 2002:a05:6000:2805:b0:382:5aae:87ac with SMTP id ffacd0b85a97d-385fd421c84mr5534768f8f.32.1733401556000;
        Thu, 05 Dec 2024 04:25:56 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf403asm1883695f8f.1.2024.12.05.04.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:25:55 -0800 (PST)
Date: Thu, 5 Dec 2024 13:25:54 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v2] riscv: selftests: Fix warnings pointer masking test
Message-ID: <20241205-09606b57e757527a56425fa7@orel>
References: <20241204-fix_warnings_pointer_masking_tests-v2-1-1bf0c5095f58@rivosinc.com>
 <20241205-45c00adab2636bf26ce05f70@orel>
 <14125726-bb00-4de4-87f6-6655b0ffae58@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14125726-bb00-4de4-87f6-6655b0ffae58@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_042557_766235_5EBB8C1B 
X-CRM114-Status: UNSURE (   8.32  )
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

On Thu, Dec 05, 2024 at 12:15:16PM +0100, Alexandre Ghiti wrote:
...
> Your mails often end up in my junk folder, am I the only one? Any idea what
> could be wrong?
>

I'm constantly pulling legitimate mails out of Spam, usually ones from
@google.com, which I heard was because spam filters, including gmail's
spam filters, assume those are made up addresses... Frequently I pull out
Samuel's messages, at least when he posts to the opensbi list. Ventana
uses gmail, so I've tried adding anybody who goes to spam, and shouldn't,
to my gmail contacts, but that doesn't help...

Anyway, I don't know why my messages go to your Spam folder either. Do
you see anything weird in their formatting or headers? Maybe try adding
me to some contact list which your spam filters hopefully use when
deciding what's spam.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
