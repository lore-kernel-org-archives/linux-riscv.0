Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD25D7495A
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 03:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0gVhGVU5nnm4DQBayfJi2BtV60/J1Bzma6mX91Te3Y=; b=uRK0Cz5zNSVRu6
	1MpJMIWfzQLHDQVOn1DCsQI5UNi7VUPLWde7+BHeCYlWOAHp28Dq7ipJUQ7bcYtO9oeOcyWkXMExL
	V/RFlOggJQ5bYjn4++Nofu7HaCS5A/I2yfHt8L2aHN9HBuvN7muLDO5uUAt/cW6WRUlB5Vm4I2bdy
	f716Gke1LDpw0lksQiNaDLXRMbbF3M1nZN2w3nNMP27ylFRDYm8RxOQTakMEYF1OyFA0B7RmwpXHm
	EfZsgDaSFC+0Z8WQeMMnL+rN9o4Np8mciNwTaR+VMub+KBjc6AadGpL8F3yWZpm4jtuV6al1goWTj
	okj69cHUtY4WM96GbHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zl0-0000000Gd19-1B07;
	Wed, 30 Oct 2024 03:52:30 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zkw-0000000Gd0n-3xqP
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 03:52:29 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e2e88cb0bbso4766475a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 20:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730260346; x=1730865146; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LbwvVTwOy+SO0yRgFOz9kS/o1vQ7kE8X5/o9C5j2WJ4=;
        b=fH4biBmq+ESlWiCwcwuC1R5Ngq0V4Kr4QYfqxKJKE4domW8u+Tr4HckBLWoww6kbrt
         9kqxGz9uwzOJkyb1DZo6V9JoSqPpch9Nwsc6AhdQaYw1J+d7PfVEKjuz39tuFUSMr3Wk
         tOYn87QpRpUn6HImSbts5JdCWKAckEtBg24d1/uQ0fB8zBVcyMkJ5IMj9mUHvGyS3+Ih
         46mFeS2EirOu1CAkt4oKvBcMP9OKtmaLzjhkIm/5n+mxB4rA/MCMV/kpKL4zK6XjhCiM
         YlHsFzZNNJa1x0xBztUJipSbME/G+TkKyoc0NEW4ShoVVY1vPl24XuVY0pq/gP4Gj5nW
         5Wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730260346; x=1730865146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbwvVTwOy+SO0yRgFOz9kS/o1vQ7kE8X5/o9C5j2WJ4=;
        b=FtYInVW15kLZkwRX2JpRSoVaBDetJgynGpnh9WPe06BGvjIFqAtynk4sR1gHNVCOZP
         K2aZ5Orp9p0ZGlwqxBI+z2gBojDYBegtvqrRgA2lBWX8G2i9Jf4ZdVj7Xkj6nbNZWMOM
         ExsNWdLuUvG96nTMhNSJuQbh6BpKwM0YP4BFtzHAMuR8LuH2t/SATeDfhqq43NFwGdFh
         tZM+UE5SauCU/mMHktjBAHTl3A2dBA9eMQceGoYBMM0kt5z2qI1iRaiJnB8kuQ9RZu1c
         Up/LUjGE18Yn+FftVksW7fGa+wakDU05vSgma1CpoJ+1CTibhTcx6XxArA+w72Qng2PX
         V0ww==
X-Forwarded-Encrypted: i=1; AJvYcCXC48I/nCXoq9zgZHxhoZ7hNEB0JkL2Sr63B9SIaODPmWTgUvcMAVeLx3nxbo5eqdmEKsJywF6KrSPFeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzifO8X2OK/j9h3AujD2JXZjMgGjfkebrrqLosDH7IEoD62/5SB
	MqekDOt9i/ty5teGwOGa1dJhu5S79I0uwgTzZfedUhCXsC3+c/66
X-Google-Smtp-Source: AGHT+IHyC/i13QPcOKD2CFv23b+jdVC2FHNMqnX9p8U1AHLFjS2zjB6luXhurheF98UBB3QUMm+kZQ==
X-Received: by 2002:a17:90a:b111:b0:2e2:d16e:8769 with SMTP id 98e67ed59e1d1-2e8f106926emr15758945a91.15.1730260346047;
        Tue, 29 Oct 2024 20:52:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fbe07cesm525438a91.43.2024.10.29.20.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 20:52:25 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:50:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: fix pinctrl base-address
Message-ID: <ihmors43w3ttfun7c4fj75ahh2hnhafdxhlmocbxfwttigj3fq@wxud2d2srisn>
References: <20241028-fix-address-v1-1-dcbe21e59ccf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028-fix-address-v1-1-dcbe21e59ccf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_205228_224196_88A8D279 
X-CRM114-Status: UNSURE (   8.03  )
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

On Mon, Oct 28, 2024 at 11:43:24AM +0100, Thomas Bonnefille wrote:
> Fix the base-address of the pinctrl controller to match its register
> address.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Fixes: 93b61555f509 ("riscv: dts: sophgo: Add initial SG2002 SoC device tree")


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
