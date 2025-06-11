Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA228C678DC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 14:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPn7O3ZsU5H1qMKSirWKzEDiG64h/Vx13O1nsgHLGeU=; b=c9zogIfq6fSij6
	NEE49IlIWGj4OQOK/V1tN6ditnNJOw5DJFbowDKprigmQ5CzbUkALMW7czAt13ZIPgPRH+3tyKkhO
	l0pCnC4iLSzMHbMrQkS/3E8TJqafE72cmmbnlYCPeWKPUOQTiIw9+l5iAJHN3A5ItgYGjJJCy+odL
	qpGXvmwa4TGfATfhIzSRrpu6dBRaBYefITe6SFlTSrxihQG4u7hMPNnu3okTKZYi1lLJQWUx8P4AJ
	R5MJBwSDDO4P4D2wvbTW99RIXSZYC+aG49Fwq6nffuObo1xTEgor6y1eBN0+UJ731B7THfwlXabGD
	N2Nd0qqaJdi15kd2ETAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMn0-0000000AD2o-0X8s;
	Wed, 11 Jun 2025 14:50:54 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIXA-00000009b3F-0O0M
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 10:18:17 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6fafdd322d3so70778616d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749637095; x=1750241895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0H9DqqVIooICLmp4vYW/Nyz3xv6CeQHhJZyVDnOWFA0=;
        b=Oh8s5TT7K4dKMu0OaoGVTAjQqtJiE3zhm3y0Z8RUgvQM6W7DV/t/KE2SVtSlxZzbFc
         sps2YPxzefW0Qjq/xpqjpZhB2H7kZ1H7yOMbsYpW5LiDZXMVxiSozqmlD1BYTimpSMmt
         Va5NrQyjF87kImqyVlUoY/JqlekcJkotsQCLUwxu+crfQ88P6LCILdjSnElfXYN8Ez6A
         nU1O112jfjLg/K/7kL4Y8dg/99OWdcD1pBRygpwwghGt8w0H/Lhqy4bt3egicgQsTHJ4
         Ubp/lF7VJb3ER9pZbekYG6iy2fqQl/cQfsGa85mbmig8bo+r+1exPyFaxs/b3DKQY85k
         gfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749637095; x=1750241895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0H9DqqVIooICLmp4vYW/Nyz3xv6CeQHhJZyVDnOWFA0=;
        b=M6W6uTN8Z+R25nxTpDts6Ro3MgRj+my+sO/AV8y1JXVbbnO/ajYvzGrrBhlcfgVAVN
         ZnU2qD+MDqYzGDCy2f6f+rkj/59RZ2BmoLwBcBy6nLVZYjW4MiLJyxDyxzBPbzsIXVp7
         daDz8EJgeO4QzhjgAHba1lKnlmhRKILEaRY7+kJ2gIMKpBKYP0F8w2ISUAbu9F7bH3XR
         Urh+wZ96jlH4QQQcpASAP+MYwL8+pUUpPn/8vR0OkgVDoGiaAKQMoh5NF4hkb475AzOO
         qd5L1NKq1vw4TjoG8vz3u7tbW3Z9QXoOvagtfW0hRSiSMsz9WPo3+sEaJ4hN/3smJ95I
         R8mg==
X-Forwarded-Encrypted: i=1; AJvYcCWmuXOhMHmiOopKFYJd3d56UMC8xbiWXqEf16oUJaMVm6OPwMyTK5+SkvVoTHtuIclvcOqB1qp/xbVK2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3yeZ3wnd+nQwPGcDOHQOIvYLjTIHVFBM4f9sAeSCEY12r+Eq+
	IrmeJ3gozCZBcnlkafc3V3njefB/yZL25MCo8yeNT1aUD4aoqTJqpeOe
X-Gm-Gg: ASbGnctdA3c+8/lJxGbHnCxA3QdTOxzm7qMLF710nyqjVpJ1FERBmiMEaEpqYq7mese
	xrJyN9vxkz9cYQTK64/HGXEKJl8TJkr1gsTdNUIpdbJw+pWUDvPwui/pPtimGs2+rVFtpL0cD7i
	MVkuo4fQwmqWNsn8udgng53NvoYZRNPWi0unw90MQqdSvikl7AZSUwMcQFY9uxs7oQVGjhjRqSi
	EltuYS12XwLZXMunsjIHFIeNfnkyLDAFlIXY/oNY4VPqGKhy0egpB1HvSqwWdthq3/HapsoUDOR
	+j5WBFWjHFhAYYHfZxhGAwaalyFSUMUyBTTTsA==
X-Google-Smtp-Source: AGHT+IFwTEmZcybq7Mt7k025PPfiskyqYi6E6YXzghaXiz9yzSTgjcINKWLcnTMMqF7Kz/++OLzTxQ==
X-Received: by 2002:a05:6214:627:b0:6fa:fe02:8229 with SMTP id 6a1803df08f44-6fb2c38701dmr36593406d6.30.1749637094989;
        Wed, 11 Jun 2025 03:18:14 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09aba071sm80423106d6.24.2025.06.11.03.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 03:18:14 -0700 (PDT)
Date: Wed, 11 Jun 2025 18:17:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Richard Cochran <richardcochran@gmail.com>, Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 11/11] riscv: dts: sophgo: add pwm controller for SG2044
Message-ID: <evxmh4zqt5muhbyv2bridgyxw57z3ek7sxn2jp3ma2pyfgxuuv@nn6htxhn2p67>
References: <20250608232836.784737-1-inochiama@gmail.com>
 <20250608232836.784737-12-inochiama@gmail.com>
 <PN0P287MB2258F2BB409F70955D6EE248FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN0P287MB2258F2BB409F70955D6EE248FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_031816_127671_162290A4 
X-CRM114-Status: UNSURE (   7.42  )
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

On Wed, Jun 11, 2025 at 05:53:54PM +0800, Chen Wang wrote:
> "sophgo,sg2044-pwm" should have not been in 6.16, submit this after that?
> 

It is merged for 6.17. So I think it is OK to go.

Regard,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
