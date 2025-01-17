Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22596C02185
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 20:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOZXdo2kScuj6AvHrpybY77uBcU6CNzY4oCCsyKpJO0=; b=DCepWnTlZ1UPnM
	/VUiqJ1QIrLSCkHih6qYeadNf2FnfjGA1ewBZ+gXATN4MXx7C7zozUNrsAyp5tqVpDEfN+zfHjO3V
	AXG2b7qzLbfohI7JvoXsjat09kdo3uOBESsaDNKM4w5TTvKhvLH7iYSLG/dh2kgC9tJ1LBlXC8U/T
	zsbSoiVUh32ayluye4s0db1IxuOFlE+c5VpOiNZ58HSnaME42PKs3eqFGvsHHOHimITJePxa80+cf
	5JI++GJYonwi5NGc5W+/cI6JShi0UtKnZptcEvxjRDmi1kkMzgOT8h3rS0weOS0GpVIiVoIXKYkf9
	4XK1q7k3N1Jk84GVkJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYswJ-00000001Jfb-2gpP;
	Fri, 17 Jan 2025 20:27:35 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYswG-00000001Jem-3gJx
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 20:27:34 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f42992f608so3723885a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 12:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737145652; x=1737750452; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DdOnnwk51w/6VQjBPS/zsGhjrGvx6EdJ5oRCJOEalfg=;
        b=bplEIL3G8KWKUpFBQBE1yDh5YIPr4r+tUQeG/MrxQ9YZ2TI5WvANPEG7DatkMTMRP8
         urGC/XjqlbxzvfplDjp3oyuVRnVH3NRNyZkQ2c5LxHeKcYjY7ivy6WYhvr+EhHL+WW38
         SLUknA6n59pKvSKCiBkCECawZnt37hN4K0T3d40GNgaDjTUMi/egfrB65O/mMesNAJvD
         HlXFwxY2IcEjPRxJX/63YgfNUCdMvVDgb4YQOaSddiQXSCE4Ld8p1KoUePPzmzpjqInM
         qCUXBvdbKYSGeWB4YM+2Ha2R8wOZotgCBVKb7WHEXCe+HoxKq5Ir1AKMDCYwEAtsgjO7
         42Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737145652; x=1737750452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdOnnwk51w/6VQjBPS/zsGhjrGvx6EdJ5oRCJOEalfg=;
        b=EkIpGgNoBvu+iLBCjd6bP5A9bb7RexeY2cUit0ChVs5dYJtTuNQ8S+WyHS4A7/6NOU
         gs+x7oCYJgzNrItaa8J3QooGHF/THQIBHGHmw2d5AWixH18YL8L0Gbhvvdvbgj/tMFsH
         QSTKYap8wf0lnVt8pE99ea27AV7YRaX2GCc1DUb/7wbSZyPK8Ww4abLK398PhEmScXLD
         5B6Wb54B9y2XpQF6FR8SbEoNDQydxmFE0shq6ydnkr/BWYuJmYKat3aDnPFiFYRCJBVE
         ICCsToMgpQe0NR/mVayRFeToYxUb8DIZMWh0u3+Ud9wzpVWcJg+w5gf08Q5SRSf4pTI7
         xzHA==
X-Forwarded-Encrypted: i=1; AJvYcCVBnGwR1d0Ru4IDqbtQ6lIOK/jCZcdqTeBhnZyQ6now5SNl5Y13/jIF1FmTES8f+mjhS1wFoxUJB3cyUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUoANbD9kXBF/RaaAHsdubHNzT24oAnMLbRGH1olihrSmo0Ipd
	Dc/BbfB9Ck1Q4n8KuX8tVv9UV44XIhVlFSm/NFan+xVWEZQJqwCifU07b52tsJI=
X-Gm-Gg: ASbGncuUK1O7lDDULvmHMLeD33VWYWb7T6skItqWK/JzvreipW5PkZx+/EXvcDNw+ad
	ykRCSfkMIoVjQmcguD+VuZKsnWRPXus0q/blndgffGG4qUCv7A9SiCtBaiWeYVUJdxqddfUw05X
	zf4t6/Dris33xUe1Z9uqEPLgLKUH+eFfTTLr/kCr5BHeFYCb/7KgAtTWB+ibHWwCxLcnEI+XhTt
	VipnoOBRPtxAIvwmaCX5VCzcdIt7uYzS9CG1BPg5RjJeiTG1DbE
X-Google-Smtp-Source: AGHT+IFhia1INnSLX4W6mQqdaD+FKsBXmhcLTC7DyeNQNwDNSMqUOTPBnH0OdAxUP1kZk28+kSi85g==
X-Received: by 2002:a17:90b:4d01:b0:2ee:94d1:7a9d with SMTP id 98e67ed59e1d1-2f782d73246mr4898671a91.32.1737145651159;
        Fri, 17 Jan 2025 12:27:31 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:d0ea:9b9e:5556:aa82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c2c2e71sm5714885a91.35.2025.01.17.12.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:27:30 -0800 (PST)
Date: Fri, 17 Jan 2025 12:27:28 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: guoren@kernel.org
Cc: conor@kernel.org, alexghiti@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com,
	leobras@redhat.com, corbet@lwn.net, peterlin@andestech.com,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 1/2] riscv: Move vendor errata definitions into
 vendorid_list.h
Message-ID: <Z4q9MDsywT5MrlEa@ghost>
References: <20241214143039.4139398-1-guoren@kernel.org>
 <20241214143039.4139398-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241214143039.4139398-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_122733_123443_E8A50818 
X-CRM114-Status: UNSURE (   6.22  )
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

On Sat, Dec 14, 2024 at 09:30:38AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Move vendor errata definitions into vendorid_list and make it re-useable
> for other header files.

Why can't errata_list.h be included wherever the errata definitions are
needed?

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
