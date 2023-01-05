Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BC1C3DA7D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oo+ljyYQKmSJZS3JgUMT+0jsYnDb9bf1mvMLyd2xHw8=; b=DEQX53TQzuLZEN
	UkE6fQjFg+AR3sMd/4mMJ3DsICyUjlO6MVwBUdmZuy3YUXQHHQTPXErWyx+pX+xV+whwSALCqoWvI
	MH5dSLZvq0dp8c6gOvqh9kbITkWqv6tgPtdu7x+6ZeahRqcKEqKSuUZ6BKgzUkWdypGM0jnPNNHAu
	GEHgf5dIjMCVoBX8UH5noqSSoMz+4jwB2w5DT0JUuXbnoz81Dc+wnViwBCUsJ2WOkAZ47Fx6TcGTh
	7x3b1EPPWv8RlAgDIiaOgGxHH2C8JT5jw2PydlYTaYLQwtUFUmA/Zefe2+ZvesfHsG/fw8sIK6JtI
	M4CQT77KmLbiKbMJjbuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXSh-00Ev1E-5V; Thu, 05 Jan 2023 21:07:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUnJ-00DSac-1c; Thu, 05 Jan 2023 18:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y3EejsfMRPYJ8twdYT45Z3uPua4+S1LNtd+Q+9tbauc=; b=GxNxaGmMNJfgVCzA6PX9QHxeqj
	OwBWc6181VRi5cWhtpgNyi/vJbZhuJmgrbA72nj0gCequI3OTi1O0j8yJlpTtoM3VEAiHYErLyADr
	yx2iTi5vbrc/jYIs2NdmomB3fdIAOXmgX8GHkAm6k9FOjRw/6JhI83NIEI095RL+WXUX7NAUNV19Y
	JCZ2Ihq5KNOsp77tqUp2aaeLp9TWuH1+9+hmpJGzGjOo68HzeFtEr4thUa1tEZpJu6YKWRf1d3jHr
	f7W7NvF0bWlsfv+olgTWzRwkvGk5d/Uzw14IuGIDumioeRAGqbag7Gx/J4x6zP4QSglsp+ypj2dPP
	i4cleDiQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDT83-001U5H-1k;
	Thu, 05 Jan 2023 16:30:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r2so1846245wrv.7;
        Thu, 05 Jan 2023 08:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3EejsfMRPYJ8twdYT45Z3uPua4+S1LNtd+Q+9tbauc=;
        b=M17tidvmkWkYuFrf1Lwzlgp3oUKnmbk9v/FsptibpHce4ZAqpmIKX+7+UW6AAVTjks
         wRgopWPda293hciGNXg+8XT/sDP3ZgOuBT/PW5758mCviTDFDzxNKspr6lwpDvotggrJ
         9M5hg6/2Jgwf/JwvkipKBdIVdeT26Am3kAQSP4W1Q1fAyu8xOsyvWjC0OgLejsjghfI1
         vHOJdXdJE2vAXeo5CK4lPNmHhtGNU/X+DS6RTLNSke5C/CebnaLmUaRuMAhsIe+rSI5S
         pENvk5AB6SJAzxX7T8monl32sXTL+JYWbAVRIBc/DEFTpkqdCVmPl+sNV32PXh8DunrE
         VusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3EejsfMRPYJ8twdYT45Z3uPua4+S1LNtd+Q+9tbauc=;
        b=XXFSyHk1jjiTVvj9mg6AxENfNRLMLKbolWn+03PcQgyPQQ/szCcuz98LKrwwdq1yH/
         dQmjd3K9UdlDtAlWHMsxvUOBza+o5Ec26C7m6oXasUCIKCgrjsytfrAV4m+k26y3kEa2
         h4/ieoGx27V9wTs1PQWK+uzbHE0KhAQEM+Nx0ZMiUZwQqv/aztBbCDmIrTyH50BRBQVK
         j//rfNGBa3vK1Go745tyM1DeAnne9CvPPd234jSwMCySdABgUg6ug4MVVNJr1OELcFtg
         LZPJFVOkC2bIGEh8mRJqXL9NfAUWayONda/tOQEGgWniOBh0LAomZIZDHunM79rFP0km
         G+Cg==
X-Gm-Message-State: AFqh2kqjvC9cUXMlIp8MtZNCOGuf8zq8MzY4BmvW6syeagYnAblkH7Gq
	BMLMgJJf137GHjlDy8UtGik=
X-Google-Smtp-Source: AMrXdXszLZ9BZFqJxfINjbGbG4pDRYZ8kDGOk2JHXjZcf5Xgus/zLO7jwULs6trog6IRkMTs0W2P3w==
X-Received: by 2002:adf:f183:0:b0:255:96ed:950b with SMTP id h3-20020adff183000000b0025596ed950bmr30694484wro.60.1672936212723;
        Thu, 05 Jan 2023 08:30:12 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id w17-20020a5d5451000000b0023662d97130sm37280824wrv.20.2023.01.05.08.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:30:12 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add crypto engine node
Date: Thu, 05 Jan 2023 17:30:10 +0100
Message-ID: <10201998.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20221231220146.646-4-samuel@sholland.org>
References:  <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-4-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_163007_704519_D6800E75 
X-CRM114-Status: UNSURE (   7.05  )
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

Dne sobota, 31. december 2022 ob 23:01:45 CET je Samuel Holland napisal(a):
> D1 contains a crypto engine which is supported by the sun8i-ce driver.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
