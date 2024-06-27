Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C082EC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvneMvyWiIhKV5fZDgYaungN0oUe1ZkcdPNmhSdQ9Ck=; b=0fE0rsNjuM47NA
	SoFeE8EXOLaQ39JYVORKS6R8OhyCT8gONcBQykfRm7ynN8ip41ri2Yp9/vDdzv3On9w2Z9P83y0Id
	iixdZuAsQu+DZrRpTnN4E0eVdyqhxfEiKI8Soy3qj/O9ZBq1n15R6dwH5G77uadIvg6aAlfPekKhJ
	v7rYxPLBc8kdtIgqPtpzVEdKWCg9oBettXS7Ys8oYFwTyA3kAsQCMMFoX0NPM1DBvNIFc6jwPExoS
	V6aaL064ZxAdsogwIMnU9RQQ1eG4LQGn3dg/5NE4HbV86fOgKDLdKtZC96dYoCPHTI2vhHgImaSE1
	VBiTHef/Oqk54QJKOv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMquM-0000000AqDv-2NmG;
	Thu, 27 Jun 2024 15:19:34 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMquH-0000000AqD5-3kbF
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:19:33 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a727d9dd367so368476266b.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719501568; x=1720106368; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01JArmtEkWVzaNdRWksyS14M/NQjqvFDPF5Dykw99yM=;
        b=bLL+OgSTxzNKgAw31Z5uTRA0mRdk25b06TYnQLb8eJ2GXkx8+7uZMgbO+0Io7lHBF6
         41twYmHm4o+9pD0SmJvkd4s4t5RFVeTwoazyJ0f1WxbyQjz1f700kUnrtJz8riDHKKsy
         kw0hPcVeH+LhElhAuadcmG1FtXPBo1oHJCv+WaxLpGAarQkURQXpcL1zfMaEp4KcnuCT
         xwXr62/Rs7ncIqSjGmHs55d+Tn3vdefdXgVlTZDPqt3mNF23vrevpBYijqA9dd7lvyto
         cJhwuFCnepMShBEy+rGh2/GF4vUZUH+xH1mhd5B8ZGxX7GUfkTWKsfqA0QiMS007pXlA
         pXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501568; x=1720106368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01JArmtEkWVzaNdRWksyS14M/NQjqvFDPF5Dykw99yM=;
        b=nFviebpGt0IZ1hDEKYFLlGrDbwQ7lPgNS3s2GsxwH1aWuVHkLOXZiMTrZeFxQ7znAM
         n8E8BUTyLB70H2u3h+jocykUYUSV/U1WqsFHNVu9c5j4ki7vSi36tcYzcEdiCjE0PnEJ
         DwXfQ3ZA+p+AQYNXqdzmIUPjA8cS0g6VIx8fWHWywOc7x2P7beCbe94qqZ6mvBa4xyLp
         BesZt1HULgthX1nxSYThiX1vjmLKUTAiQ9xgI1GdG/HpTIPd/0Y3ISFa2p0F+DMFCydc
         Kd+/NtNVMuiqt1t0O26mwwa6cMn6zum5jTbhEgTx1XhLBpnoicX8dT5RsbB0OQwdxF/4
         SkSg==
X-Forwarded-Encrypted: i=1; AJvYcCUhfdjKPQmGSSa28BhtW4dfMIc6dwrh4Oz93mgAzAibTSbuDnO0aIoTH24ve7W1kpLsovEm7BxTJRTkLFOZoaf4428WkCqUCfXtCQOhDljh
X-Gm-Message-State: AOJu0YyiEBPu20ob9UUFbNg/qBMDRWWHZ4tfxZsjAjRj7RQrv4pupUQi
	ILUlVi7JwSHZXSJN8u8UxI9FV4nuExQrK/nfgL+8ZJndS8inkqmM
X-Google-Smtp-Source: AGHT+IEAOJUUs4P5drce/yyI9yJaU8OuENn0jnZdouzCEJ6K8miFIV+B/HogjWpoIlxwTsUQCgDECA==
X-Received: by 2002:a17:907:d043:b0:a72:7bf4:694c with SMTP id a640c23a62f3a-a727bf469d6mr670678066b.16.1719501567509;
        Thu, 27 Jun 2024 08:19:27 -0700 (PDT)
Received: from andrea ([217.201.220.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7c88cdsm68292766b.195.2024.06.27.08.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:19:27 -0700 (PDT)
Date: Thu, 27 Jun 2024 17:19:20 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 10/10] riscv: Add qspinlock support based on Zabha
 extension
Message-ID: <Zn2C+NXNZ/sj0wI6@andrea>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-11-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626130347.520750-11-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_081929_960449_40EB7754 
X-CRM114-Status: UNSURE (   9.22  )
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

> This is largely based on Guo's work and Leonardo reviews at [1].

Guo, could/should this have your Co-developed-by:/Signed-off-by:?

(disclaimer: I haven't looked at the last three patches of this submission
with due calm and probably won't before ~mid-July...)


> Link: https://lore.kernel.org/linux-riscv/20231225125847.2778638-1-guoren@kernel.org/ [1]

There seems to be a distinct lack of experimental results, compared to the
previous/cited submission (and numbers are good to have!!  ;-)). Maybe Guo
/others can provide some? to confirm this is going in the right direction.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
