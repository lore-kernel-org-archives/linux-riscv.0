Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2055C02199
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Feb 2025 01:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0+YqBpqgxt8bC9SB1b3HVq+nyiIX3rW4hZ6W2uUFNM=; b=D0W55CrlLluR9u
	trvhkhbhuz27TiRILwDvqekAhMfYFUEhrW7YV1Qe5X6JiPaYwYgD93sYIgTcA6KOgeAieG5XhJfeK
	3Gc5Fqt8fTrMQGzrNxSwazMfm0JTnXB9vzsPO9IrPAN8dwsyAOuXM/ryNowntnWam4TiPt+ZvNE/F
	4/JEYnsoR1MPzbb6qutux4H3g4EhL9l7hO3Qi7W/TWNIemyeWFasJu9fCmToNTbV6Mac5uOrYAZ52
	9mIz7IbLgSRtOL9pvl5f6P16R3psG9d9Ohp9iWRcmNREjSgY/6ZlHhZ9rkLCVbYmtLvrXq+rglGvb
	x+k6KWcarvSPoqpsqXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgZYi-0000000BniH-0j7f;
	Sat, 08 Feb 2025 01:23:00 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgZYe-0000000Bnhe-3oNt
	for linux-riscv@lists.infradead.org;
	Sat, 08 Feb 2025 01:22:58 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f3e2b4eceso45725835ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 17:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738977775; x=1739582575; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O1zawSqtTaDgxfnRCxchlXO+mOBQc184IOTdX+I2CcE=;
        b=UQQsYoRBSrircssLTnEZUvxzThWYsd7uWqS8188yymEJrxpFDdoV2vSxZp73zc0aSM
         kTE3yaL/yWo43RRE3tVzTaOLPcBX1wlHKxrsf8Gib3msYFetjmb7wj/DXTgjokeEPLIl
         DO4DfvkxfPusW/Co+DaHBqMx6Dv2/yYIt7qfHqYOzPaz0aKPlcWucxN5XRVaWGCdv2aD
         mriWW2Xd4hvPiU9ls+9brKv02cf4cGjd+hRR36YaCn5qxrsG1CaapvLBtNryotyBxtKs
         ahflqtUDmWyMO0Qxco+HmIm3COG6oWJ5O8CJ6DhoOn7LCbpocrjjgblE2a/JcypdC2K1
         p+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738977775; x=1739582575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1zawSqtTaDgxfnRCxchlXO+mOBQc184IOTdX+I2CcE=;
        b=eLX+fI5iAkB4W1tHe8hnOolAV7dG0RcmkPEpB5TK9om8HHPjtO+05TXFSpouAL3/I/
         XsHMYoY9pox32Xig4O7MaOG30TzP6JuE+SdLw2ZA+SsPxQlHhKuOAsDLrT9HkLFQgdd7
         zs8VMvYiw2i9Cr26NXRhYzo0hC2B3v85SXV5uuFWRlppmTTMKsV+tullD716tGXCIUcS
         UsetgQyalRS1ywSesDL4kq7B6r2yCT74OC93Dn/PWJ41B7qJUB9ZrSAbsGGxNoKvX0C+
         avQFS6ZYFTI6Cw1Q+58Gwo0gBMp2ZQwLgOah0D188pfhUSi4gJKWvWUAODrjtgplkZo7
         HU6g==
X-Gm-Message-State: AOJu0YygNcWxl7T5lm7dYlCY94K54urFB/QKs4JYp8U3Sh8iTGcepOAn
	4naAklZjZR+EdLRIyrGSQQEgVrymzCo+mLH+e/BICqlkcAl6ApZjA6eqjgDHECc=
X-Gm-Gg: ASbGnctTjJkPAPU8OQJqtjRrKxk/qAi1PQ9aT78UQR5SoUvlnZgCAUMVQoDc7s45XSk
	GJMuY3RHXqbuHotwoTW3mn2UTP+IJ1S3jdIyFCH8dToPz78qw2ijMM/rWcRE7c0lWCgrNZORQPo
	S20jFcDvlJDMUHfLac6KP/aAy1AuCjdxbApmCA8AWEyqhO/q+oFGoOVkwGIWclH/s56BcSTTIpY
	NJYsHPt1nKdCTzClE160quGvODuDOsph+Qu0B5dasRbX3uxu2jp6v3bGmPyKIbh9ORndN5DOdJo
	A5EStQ==
X-Google-Smtp-Source: AGHT+IF9rISnfOnpR3xvYPo6t1RPT4dW9BdSGa2sPl+vTJMnbdXop1lg+6VdmAE/oTZXzpREQyh4XA==
X-Received: by 2002:a05:6300:668b:b0:1e1:9f57:eaaf with SMTP id adf61e73a8af0-1ee03a242e4mr10303690637.6.1738977775668;
        Fri, 07 Feb 2025 17:22:55 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af7a221sm3736753a12.75.2025.02.07.17.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 17:22:54 -0800 (PST)
Date: Fri, 7 Feb 2025 17:22:52 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6ax7B45OsGerjfA@ghost>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207161939.46139-18-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_172257_206787_34118D0A 
X-CRM114-Status: GOOD (  10.45  )
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

On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> Probing unaligned accesses on boot is time consuming. Provide a
> function which will be used to look up the access type in a table
> by id registers. Vendors which provide table entries can then skip
> the probing.

The access checker in my experience is only time consuming on slow
hardware. Hardware that supports fast unaligned accesses isn't really
impacted by this? Avoiding a list of hardware that has slow/fast
unaligned accesses in the kernel was the main reason for dynamically
checking. We did introduce the config option to compile the kernel with
assumed slow/fast accesses, which of course has the downside of
recompiling the kernel and I assume that you already considered that.

Instead of having a table in the kernel, something that would be more
platform agnostic would be to have an extension that signals this
information. That seems like it would accomplish the same goal and
leverage the existing infrastructure in the kernel, albeit with the need
to make a new extension.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
