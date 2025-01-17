Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F33FC02185
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 23:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNAW5yEnk3pEnUKduhkGKx1x63a1iD25V6ClBMvnQr8=; b=m17grREC3Occoc
	6bSP5PLI8EGt2i4HXhSxjslKFbUd23wOqCB7GYuNfaKv0sX6HRvLmBH8aS8Z2xSBvSzFHrHA/y29w
	R+6EURMjHb5AX+G7OEbsCkT3sARWxHXonSQt4M1Ih0wbByjSCLVRijql7jV1JfbcAer2rdwe9Cmzy
	sukRtGJu7W1KfjsziysGUPcjDJ6GA7/uUR2z7FwIYg1xSbNi8VFWC/IU9CLZvUHXQ4tTp72IasT45
	QKW9JZRruOG4BVTD2yUNMhlyKqCpFpBajbqtt29ENRvMmq0O3OPJnAhrWH1pPwucOnPiacBxQlQQr
	ctgCTc7Mp7HkLwJX/AVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvgr-00000001Wl4-0Ca0;
	Fri, 17 Jan 2025 23:23:49 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvgo-00000001Wkj-2lM8
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 23:23:47 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso3782460a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 15:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737156226; x=1737761026; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2g7uPS7l369Xp/WzwXqZsADqltx6Sgke2pqtS9ZK76I=;
        b=phMhFtjPNEGCjjMngCFuauo8HPrVxAYpLnh79oORP8LSYWbSerPc2ajrQ5M5k5I1vN
         8gRIYpsCD464uZIQEIoVOUTF54Lcf3VNogapP/aJtY2tve7r0uYdcIngP1+dHV8irucq
         Ao3x613QyEmCxpkOGqBg4Spk+aQCEi+7k7x/MMrldTs2ulfABaE8Ks1wAsUNxbbpDbIw
         w1Yca9iLeBFzdB2n2xua12/ag+xS2skT2vRRmlPYvziRI6Ydryq4OaUMn7zJ0zP+jx47
         PvafeTavjMB+KUskcaeTwTam8JhEbTZIQ1JHtBWs8y06xHLRFyEVgS0LgugpqKRGKyKd
         HnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737156226; x=1737761026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2g7uPS7l369Xp/WzwXqZsADqltx6Sgke2pqtS9ZK76I=;
        b=D1PpVhuW6ChiiSfqMNfmvlLfX9MC4+M4yVeMbGZOZW/XOJOPaiz9bInQz1nKVJenPG
         pJOmfetHTiSsC83PN88iSNQ/nCb2BprHl82BrWI4EKBGnWVb1Vs39AENNVKEt2bL4Uy+
         UrOPw9+OB0b6rLEhFHL9i0LTZkc4RwKL2YE/1B8NfzCfgJpNvX04wwkLYFmc6R5zLLtH
         BefM+8iAfnEJ+hTKcauXW/RGAxpn99JWPPjyY30zr0+/TpY/6UfOlvMip0qE8uMwAsKC
         F2Jbd1U2TI/VPOXIOXh3wHJ2pi6dAKDknnXuWojvWQqgWCErd+34VUF/mDt/DZlX4fmt
         P+uw==
X-Forwarded-Encrypted: i=1; AJvYcCXX5VWs6+SIy+SNHMaoHvAii6opmx9DaQGGh8KJLu+nqu2TWo/OMMAj6zs6xHQ4NE70mufYFxCfZZc/uQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyC+C4EYAGwL4osiikb8liopZceRqucNI5f2zDZ/NFHN8e8rB53
	hEF0stCHZK4rkmjZJrx2Kqepuu8BYDrtkNwMdUF0MnRyowSC97oVnNwzS6w2qZw=
X-Gm-Gg: ASbGnctwm3CYNjpB4KYJ37fS3nlCjyCa0fqXFnjZZSWb4K86IyxtaFz8lcRtYRsXmRL
	FLXrOrmBzutUjcDTYmGRKEb8vcY5i6wyHXKdva21EOKFnxmtq2quFwPH9etL2v7Ia+/qZYdiEf6
	9Lmz/+t8SLp9qEMY1fThW81KDyM+fMgw56C+8D6LiKNKkmS86PYQ6ZLuYxAYNkIuwTVV3amO3VZ
	eo0rzJhCDOgYJ/mQtEKU2iZVIgiRoAtY3gtCyUTjNjyN+0VUJc2Sp6aIw70qovCxA==
X-Google-Smtp-Source: AGHT+IEOq8mrjqUuZCufSFpk3amjPIq0Jj582Q/6h/I0ya6KwF3n+BqcqOQSSTesaySgbMeJp5DhdQ==
X-Received: by 2002:a17:90b:514c:b0:2ee:b666:d14a with SMTP id 98e67ed59e1d1-2f782cb50b1mr7460014a91.17.1737156225826;
        Fri, 17 Jan 2025 15:23:45 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:d0ea:9b9e:5556:aa82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f776151585sm2952121a91.14.2025.01.17.15.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 15:23:45 -0800 (PST)
Date: Fri, 17 Jan 2025 15:23:43 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Message-ID: <Z4rmf0e9zzp6-uBp@ghost>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-3-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241118230112.2872978-3-cyrilbur@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_152346_701799_AF5A664E 
X-CRM114-Status: UNSURE (   9.57  )
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

On Mon, Nov 18, 2024 at 11:01:10PM +0000, Cyril Bur wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> I believe the output constraints "=m" is not necessary, because
> the instruction itself is "write", we don't need the compiler
> to "write" for us. So tell compiler we read from memory instead
> of writing.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
