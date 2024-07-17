Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A54BC3DA60
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u26+lKniS7NHzJJ1utodzzVJ7IE4RXHy9IpHAx7zGIc=; b=yBs2G1bDTs5aQK
	g/evbCbQJAPmOEcUeCxf7IstUfjXz5NGdknTLWZrWj4mbJn9KHsv+QcfdbH/eDkIHxI4iNoh2kRvd
	w8f6VXnZNLN1He3GLoIezNOcZiv887CWSesZFWhRKbXcddsH5GBJZhAhMAUor/SjICWvIBEz3b190
	5Bp532ACrw51aPN5i6gIvA1ExMTInP3/BEG7PfIn9OKgOHyaXvS+RWhwB7qp5hYrjoACtovcDDLjA
	hGQbV9DtgEwmigKLYSre/MCggN9z6/Mb1nzsUAJYldBzzEWD9haUk9rjS29g+a15THQr82edJE8qU
	Zrg5x4ugKj8gHej8V2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7ei-0000000ENAf-1qQ0;
	Wed, 17 Jul 2024 16:37:28 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7eQ-0000000EN4k-40pr
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 16:37:12 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5a156557026so111389a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 09:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721234228; x=1721839028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z89Kh3KCBz8pTCaoWQSn1UAiDUeeBm1FlToMf75uMRM=;
        b=i9iKKTp8SspQrzvvlYWlcbdnxBpRbt4Xj/C3RioNAiAn94lf+/EC9kpE0OGsycVQ/f
         TAJKVvJJ71q+Z9CJQqnB+u+fo7HL5trH97W+mRrPhKUXFqv923IBwFrmBsb+mhHbGS1o
         qBwxxqLq6w3+DLTie9b6/OmyfSfow1elCOCDGwDHRjRI6dMHpP+ovQEHtNfvUZGdOUZC
         CcU/DgjjROTFZL7m8lgEXxQu7wVE0KszG5ZVS+ogveyCxyTlXyjng/IhcfSKN9IPHBnO
         zthWNefVenFquX8O+8/HKRD02IMv5Qt+5xNRgq6UFvBwisFLSzlK6fRpvIgJ9kFhXlzs
         nScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721234228; x=1721839028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z89Kh3KCBz8pTCaoWQSn1UAiDUeeBm1FlToMf75uMRM=;
        b=QIYjP1eC5Tj+BxGDcMkN95lAykZpL68EQx/p9zNwBz2u7jFlrWf2R662csfiyuoi43
         oGUn5NrJOiFaysrd/bdvHCrQZc+DIBZ87zlaygBgG+b2o5gLZ87aDyT5dnXmI7zdTFic
         OfJdYh/WXxq7NyoSuIwrju78nKIKSKCcIGwwp2+Mc7XjyQeqAeqvDLMkXZ7bCZuLQw4B
         3F81l544EzhfX4kIhSJQLubeKrZbwu7NitwZ26qYHVqvvii8SmhSFoJvl9SYlLV8QPsX
         i+6dYuKFA6bq2lLJYSSEcWuFv6Vljqwp7sNgOjdbaAgSL6qRhJF0TY7KZ3utxm7ceZ+L
         ZKQA==
X-Forwarded-Encrypted: i=1; AJvYcCUODZpfiPXFJMMwSAcDRoY+sc8rhavj1c85Iyez6zV/G63WPW5KlYZnnC2vxdMYzHjvyNQcU1do4Rc8lCIDOWV6ydHrkSSW4EjFBSrS9Qh6
X-Gm-Message-State: AOJu0YxRcK4Jh1m59Mzefbek5w01WtNcwHDFXGnMBAA20VJAXL5nFXyB
	Uf4Swyi+OqMidtudRU0yAylsXnkmjrHRJY9vOZpSKxaH2axfvA1WU3m7LPZHZKU=
X-Google-Smtp-Source: AGHT+IELctoSCj2hRw5kTT4hjGzJpy2wpaiIk26gJLVJFRhtyk68IEVDqRl9amp3GFoglbhVDzl/8Q==
X-Received: by 2002:a05:6402:40c4:b0:5a1:c43:82c6 with SMTP id 4fb4d7f45d1cf-5a10c4386d6mr862718a12.5.1721234228195;
        Wed, 17 Jul 2024 09:37:08 -0700 (PDT)
Received: from andrea ([84.242.162.60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b2504b711sm7185658a12.35.2024.07.17.09.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 09:37:07 -0700 (PDT)
Date: Wed, 17 Jul 2024 18:37:01 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 00/11] Zacas/Zabha support and qspinlocks
Message-ID: <ZpfzLVEiEvuetl8+@andrea>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_093711_005733_2C968BEC 
X-CRM114-Status: UNSURE (   6.36  )
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

>   riscv: Implement cmpxchg32/64() using Zacas
>   dt-bindings: riscv: Add Zabha ISA extension description
>   riscv: Implement cmpxchg8/16() using Zabha
>   riscv: Improve zacas fully-ordered cmpxchg()
>   riscv: Implement arch_cmpxchg128() using Zacas
>   riscv: Implement xchg8/16() using Zabha

These look good to me.  Thanks!

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
