Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3762AC02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 23:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNXILTvShg+Qg64knU3nFbeB9tsky+yUslWTm+NC0Mc=; b=OY+8bt3QuCuRT7
	JW42IEa5agKgEqvy54wa4xKLy8CXaydYA3Ene6Enk3w8EPqMnLKJTinSl9HN8sQdivHHLO5C/HSKB
	N5AoY6CezIK9D84FQLDI5FJF2UKbbwfOWbmVnvxXyeiKV8P2lDUtQTMlEpu9DaVu85iDaiiyK8qAb
	+hi6xqkyg5qPahS2qQeM8AXhivIaDZrUMtqWz7EMQF62b+v6KENsJIFAD4Um7VIj0gWJebBrk3CYP
	X9dNZB6K6vs1hWQkn4d0pX1JlmQy6Xk7uyZ/IF4FLaxuc/Evql4Q8lp/Kn/lPzSWFLncWXWJ8UDC6
	fUfwM5P/U9HclMxjZMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvi2-00000001X15-14nx;
	Fri, 17 Jan 2025 23:25:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvhz-00000001Wzo-10PC
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 23:25:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-215770613dbso36645305ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 15:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737156298; x=1737761098; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxsNgcMxesDh3QcaDVxAgFxJltijv+5tYVPijMLVSjk=;
        b=cKbndufoDohIXo67Qmf1nuYFFHMbGMG6GF+yobK5UIdANCaa0urMD031AH8UqhpNeP
         2E1qNTx0asrgQGFmF35RqgsMiMt0dnb7fxmYZNlHkBWK5OhLqT+XeiO3YmCHGunv6jn/
         0rS2hNxbllBR5tCU8mjQTu33LdRPhAbavDoxN6gIiRlZzDVXE9i8OdRdssyOmR9peiZi
         wTcu36QQ82tibjHHK/aSbPW3aTKKDXXj+vjpAuocQ0HNgo0Xc+h7iJuYB6vaofOje3Vx
         3epLLCj+aiwMtrIV7wqr7dWPdn2+MRPEZOyJf8Vu8Ph8oPcOD9Vdv+u/JetKkF+DA45T
         vESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737156298; x=1737761098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxsNgcMxesDh3QcaDVxAgFxJltijv+5tYVPijMLVSjk=;
        b=bwY5ADi+Q4236/LZhZWaVTDw0ZX2Ae0Hmq138bvxpQGft9ipMmqS0WzSyLlkPEsC4G
         R2ZUZPfiD4hT7ssmM81vUHT3a18FPY35ecf3bCAzTL/By4hYb2E++UlhrPhlY3M8WVM1
         HcAVxUst66SuhEFwCV9Ju46zqJtsgXy48mS9Z4p2njUvndu7bCN2paba7oaUQjWtqsVl
         tZbQr5HnkeoLs0G8tySyECC8kXQXApeE5JwNLMEeJg4RXdfNSVa9P2eLu4xIiBHaTFix
         325e/4RfLaWwLof6ct0XqraJRX51C1L8RK/6n1qRSSQMfH5O+FXtBWBxmD281QDhcp9I
         R1WA==
X-Forwarded-Encrypted: i=1; AJvYcCU0ACJdlX0jfhktNt1tXZpPrB3K6TIDyF8W3ZB9xbWXIWxwe1DVgVbhFbeesxvDdVAR22ugoH7pJmQJig==@lists.infradead.org
X-Gm-Message-State: AOJu0YywRFdS/QPxPHxVHIww79cy9jE95mD6j2cwbZXVovLncmoHMSKT
	dyL2QIaRZE51P6gVbdHvEzmdTh0umTJPJIsMr++UmLw9MPKFfB7P2ohC9+RuBt8=
X-Gm-Gg: ASbGncsrArEfErwOg4SbVcmOEXFHWBdLNwtAkdkLjg3H844pz5oqLXqjwFMJVtidYcF
	MfminHgXC16y9v9nornbJ+ytgCgLBblIwDHQgwqb4UmWnEC+QxKIgzq4EXgpe3pltPeeVFWKAMb
	+z3R8YApt3ImE7DKhvU+exIZ3rx8udbKULqm2UIsUQ5FZEh8qDbb1R+wtW/9hQaiXI5j70tmyRq
	vuXDrkC+w9E8E265GcDXYPwEG1HYEP2eHJM1lPFUTuWSHNhqgobgT311+fs/F87EA==
X-Google-Smtp-Source: AGHT+IErvZN9mOlQYsXowWjE6t45soM1YqJtYsT65fUHxKopmzBIZgjHql715YRIJ64BOoR+/XyZZw==
X-Received: by 2002:a17:902:ebcd:b0:212:6187:6a76 with SMTP id d9443c01a7336-21c354016c5mr79347345ad.14.1737156298429;
        Fri, 17 Jan 2025 15:24:58 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:d0ea:9b9e:5556:aa82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d403c61sm20968205ad.207.2025.01.17.15.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 15:24:57 -0800 (PST)
Date: Fri, 17 Jan 2025 15:24:55 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 4/4] riscv: uaccess: use 'asm goto output' for get_user
Message-ID: <Z4rmxzDTH8gju-ng@ghost>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-5-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241118230112.2872978-5-cyrilbur@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_152459_280136_D39D3D78 
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

On Mon, Nov 18, 2024 at 11:01:12PM +0000, Cyril Bur wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> 'asm goto output' generates noticeably better code since we don't need
> to test the error etc, the exception just jumps to the error handling
> directly.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
