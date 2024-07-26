Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DFBC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 03:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6arGmr6qnuUsNIzze0hR52OeDXmS+nkYpD4sCkQmBO0=; b=IxeGHPlNL1d+cO
	Kpd1uo4rQQ0WoDPtIYDVKAw9CMjceFxdWITqC+4/cSeh3DJ6EgKHs2iUTxTQoKl9RvF5ET14GX/D3
	esMf9HBL9qX1MNXJrbuYLx22SMjb3utDUIIOtYMUrUTtTi0QIK/5tRWVOVjw0+GPse4/tzL3zLmMj
	nzL0u3A60F1POCsw5SmNLrj6O75ZzcUNPvQwfgcRrUuDsRCqPVUgaX2tPG9CrG9lcfIWWdCe/KSB6
	hlM0+DqfT3hpjQvqUfUM/sxXezTfBnka+qBVLScVewESXtH0UenmJJ6dp3aqDyKDuFmZxM1JoqcRb
	vEhSZp3mNeXaMFLO3VzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXC0P-00000002oPJ-0KVc;
	Fri, 26 Jul 2024 03:52:33 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXC0L-00000002oOg-3QOO
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 03:52:31 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70eae5896bcso475299b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jul 2024 20:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1721965948; x=1722570748; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMMjoSAK7IYa048PDOKabvStWi4pCjyCqdhBNgqeLE8=;
        b=UHzv3Ze2g5QpmOMqs+9uTLKpP39Ozm2pCnlyDnDHSKRMCkoFwK8On1iBX586siyaWB
         hapqYabeXfdlfPF4cIQg+XtMj5BccoKRi0uvf5cMqCynfrkFIzGPd1v0OxaS0xt7vPBw
         WjTMx2n3sDIG5y92/HQMZ8Eiy5MtS95qGhwarQsJkSLao0EnB9Z/N8I3C5deRls5FCus
         K7iG8mv/7FR3+50Dc7noCTrKvQHZvJV+wqgc2w//TmVFKGbS3m0ota7XNXp4QwrpaFBR
         edLAa8phDGgyRKUgJXqBUXjebafLBDYgOo/KXf2R8e1hQQO18mB2GbHa5PHHrL2chWmb
         u3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721965948; x=1722570748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMMjoSAK7IYa048PDOKabvStWi4pCjyCqdhBNgqeLE8=;
        b=sH3L8FZalY0od4kADZAL964cnT16loyU3Hj/T79nQSQED/t3gOHH7m1+Fraq8nRGcs
         TFA3pDk711tw1t9li5Qi/Ua1LotqkZqy/JHd831u6HSVFu9wZPZo2AdqF7wpR1HKed8x
         bRDQ/U2dwSLzW1v0owLyUtJw6N1hBa+BHH1INnJNksyu1kLojRZM8cWm/PLSmhWZtllJ
         m8nAAXrmhZGSpvwAOWg1Fn4yNWEymE35Z0c2XkNF/9SxAV1MzbjCGI1x/XtFKLdcHTe1
         cMo99ROlcw5yniycprU9dOeEchaRXqqQ4bjCYzJIE2jcPciR1E21VIisrXncfFlGMyk2
         LzkA==
X-Forwarded-Encrypted: i=1; AJvYcCXXgTwZxuSd/lAWTerwe+dKCYl2SIQOZTYSSpql/XeHu/wO0fUmyAgCstyWD7efjLWd7K1KOXU4hoFZKUrjvSkJS3xzz3Nvf0XDZviOpBkn
X-Gm-Message-State: AOJu0YyRM6nKVisraF/jvKr0GB5LxIr58E1iRExkYc7e6caUCeslB/3D
	8tuRU8cXlvgUY6xWUIaMvhmEEUJqjhXP9qXYjRPxuyC5ISrY6fFhp6xqEv+saM0=
X-Google-Smtp-Source: AGHT+IE1UrodZkcO9IjOZvKHUjR+vdMhcCL5thros1OpINm+KvmZgxt8vZDmV2QGFum74/oMFOgFLA==
X-Received: by 2002:a05:6a00:4fcb:b0:70d:191b:5537 with SMTP id d2e1a72fcca58-70eaa89b96fmr6197079b3a.4.1721965948227;
        Thu, 25 Jul 2024 20:52:28 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:f62e:7a83:ff8d:7ad6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8122e8sm1831703b3a.139.2024.07.25.20.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 20:52:27 -0700 (PDT)
Date: Thu, 25 Jul 2024 20:52:25 -0700
From: Drew Fustini <drew@pdp7.com>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/1] Add basic SPI support on TH1520
Message-ID: <ZqMdeTrV5GE0TVUV@x1>
References: <20240705093503.215787-1-kanakshilledar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240705093503.215787-1-kanakshilledar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_205230_095861_4752C6DF 
X-CRM114-Status: GOOD (  11.70  )
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

On Fri, Jul 05, 2024 at 03:04:58PM +0530, Kanak Shilledar wrote:
> Implemented basic SPI support for TH1520 SoC. There are two SPIs reserved
> on the LicheePi4A, one on the SPI Flash pads that are blanked out on the
> back, and one on the pins. I implemented the one connected to the pad.
> 
> It is using a fixed clock of 396MHz. The address and clock frequency was
> referenced from the TH1520 System Reference Manual [1].
> 
> [...]

Applied to thead-dt-for-next, thanks!

[1/1] riscv: dts: thead: add basic spi node
      commit: 0f351f8c4f4ee87b729cc366917e67e3eee2d3db

Best regards,
-- 
Drew Fustini <drew@pdp7.com>

Link: https://github.com/pdp7/linux/commit/0f351f8c4f4ee87b729cc366917e67e3eee2d3db

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
