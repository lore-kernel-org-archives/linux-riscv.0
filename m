Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E0FEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 20:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9XNtwo52CaRohROpBzMUkv33wgaEAoV7DUc6VKqzcg=; b=0OKBmsGoPqwxWj
	b7JOz/IAXYOCb5DYsUk47bOOM2yYj8M26SSXiUTj37gfdq4CBz90Bx24Ym8xHpLmzMMi+Zowsru+6
	rO/a5m2XBPWeBwsKgjLE1jyKm9SgHijuF4PSeyj8Z78VgTdXabIhTbB5HirqTX4loyhcaHADSlvak
	7A2c46R4gj0BUDnHEZAOfaJxB6n3Jyp0p2p+3X2/QJ0uqfeIZ47jXaVbESty7+0vPqa2Zm63pL7kL
	7bG9pYjLnWauMuHBFtw0/wKk4E1lS6TVc1PuHuDsSfaElT5r7UqLDMyDkSlq9MbcITxc3ByKJ5FWQ
	UqHWqCjm1B7DWKHN8uOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH9Sk-00H4FH-1r;
	Wed, 05 Jul 2023 20:50:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH9Sg-00H4EP-1x
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 20:50:56 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-666eb03457cso75385b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 13:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688590253; x=1691182253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ATlsphHrvoXPAVcgiiWqGZL+5stGcmqJb7QaGx/TZTY=;
        b=1gi2QGerArOZcqyu8Kq4cOvg8zuziVGn35t26P9TQDCgI7LVvQLzLR3SrXe22/KhrP
         EWezBRP2oL8ktfFwpeG6WuO8igLI6lzBPblZInvrfFpCSRobEpSTk/d4Xq9GBPodT+na
         OlomtymSR32nWGj6shvUrMDfzZYE0meRpSdSqnIuO0y1stYLvYXMTie9SmmuSDf9D3mv
         9wRXi4e8TLS/O6UsyvZxO2WXY0zMb1PNSWyDCYNITe4fmiUf+JNTkBouSyHbVz2fsJ8u
         uPMCZVC8CkWRJ1YMiYIWuiUS7snbABrDkY3drTcOV27FokdQQ2hn6KQObjTeAROmHgAB
         SEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688590253; x=1691182253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATlsphHrvoXPAVcgiiWqGZL+5stGcmqJb7QaGx/TZTY=;
        b=AfyC1HhXej+XybvpPvmrYEyr/SGsdPK6+Cql599SzwOea+Y20Eam+uTE0Uy5oL+9EP
         64QL0KRMS4LzbF5dE+0LqL1zTWpvHikTrX4iBHXx2of3hpUiFFElX3Gxx9NSi4wawkhx
         7FpgTZUhd8vg3M54ARxn3CNmJoTTWvjNWx5BIlJVnZumUUYyf9erJ1/ES9HdwshvmKyR
         3EtYw+gLYiq3H6+UzgsjQDRQA7Y9yrwkAMD0H4Y62lFkaJVwlGSLSwyCyfd+Wyg/Y97+
         3XExR/ClzIjHY/TsvvaPJyVGLzUJce0SGlilkSpcfouommHFdxAzlkCpoan/veOnguCW
         zl3A==
X-Gm-Message-State: ABy/qLYlGPKr9U+QPAjWE0S7QNDFBcRGUtPzObzkwbl1GXy8JbffqJ2b
	CefI1hwVyoDjgo//HzAQIHKuXA==
X-Google-Smtp-Source: APBJJlF93hFsbARecEfbdb3KDh0+O1N9izJjSFDbX+WwN+rT8t09OpkxZrl422GOlOmeM8zpscifTw==
X-Received: by 2002:a05:6a00:15c6:b0:679:bc89:e45 with SMTP id o6-20020a056a0015c600b00679bc890e45mr18660pfu.6.1688590253188;
        Wed, 05 Jul 2023 13:50:53 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00682b3d14005sm1752015pff.87.2023.07.05.13.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 13:50:52 -0700 (PDT)
Date: Wed, 5 Jul 2023 13:50:50 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com
Subject: Re: [RESEND PATCH v3 0/2] RISC-V: mm: Make SV48 the default address
 space
Message-ID: <ZKXXquCXkSdFD837@ghost>
References: <20230705190002.384799-1-charlie@rivosinc.com>
 <20230705-gloater-relation-29a6080ec87d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705-gloater-relation-29a6080ec87d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_135054_867791_B6AE0971 
X-CRM114-Status: GOOD (  21.84  )
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

On Wed, Jul 05, 2023 at 09:00:18PM +0100, Conor Dooley wrote:
> Hey Charlie,
> 
> On Wed, Jul 05, 2023 at 11:59:40AM -0700, Charlie Jenkins wrote:
> > Make sv48 the default address space for mmap as some applications
> > currently depend on this assumption. Also enable users to select
> > desired address space using a non-zero hint address to mmap. Previous
> > kernel changes caused Java and other applications to be broken on sv57
> > which this patch fixes.
> > 
> > Documentation is also added to the RISC-V virtual memory section to explain
> > these changes.
> 
> I can't find a changelog in any of these patches, nor an explanation for
> why this is v3 (or a RESEND). All I can find on the list is a v1. Could
> you explain and provide a changelog please?
> 
> Cheers,
> Conor.

I made a series of mistakes due to an incorrect email configuration. I
knew something was wrong but I didn't know what after I sent out v2. v2
bumped the default address space from sv39 to sv48. The purpose of v3
was to remove an erroneous .gitignore I had included in v2 and also
modify a testcase that was supposed to check the default was sv48 but it
was still checking for sv39. After sending out v3 I realized what was
wrong with my configuration, so I decided to mark it as a resend because
I believe some people did recieve the previous emails.

This is the only patch that made it through to everybody, and includes a
default address space of sv48 instead of sv39. I have tested that
OpenJDK 19 works on sv39, sv48, and sv57 in QEMU on this patch.
OpenJDK 19 failed to work on kernel v6.4 on sv57 but worked on sv39 and
sv48. Applications like Java and Go failing on sv57 were the motivation
of this patch. Setting a default of sv48 will allow applications that
don't explicitly support sv57 to work on sv57 hardware but still allow
applications to take advantage of sv57 by specifying a hint address to
mmap that is greater than or equal to 1<<56.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
