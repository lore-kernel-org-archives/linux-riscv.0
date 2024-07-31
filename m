Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7FEC3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBUPt0g5DY0xNaaE5qsnTmIoF5lJjVDQ6l+ZL8JOU9Y=; b=eIlVMIJmwUZQrt
	WQblji9J/aF3WAjTcmJ4aqRvp6ME5iPKWx7dqLinN0/IgLUSOKoDgzLoh2dnbjIHKjP8zpFq43ZgH
	UOsDlhw6M2Uxr2+89sYyfgq4KuPAnnKSV5DPVGtsvyYqaa1SMGSJ++rPUYpS2FyxS37SObgFkEbVJ
	LX3l8qSGDwb+3nOualbX29pYn+RWSG0rhUGpc01gI4pNtn3wjy7W4VG4OGONemaDa4G0WEV0BFQVE
	7yoJWDiXwnmdUO7mKHLwT+3OQt8fp8KV7Gm49kePZDXRL6aK3pk5Nd/HYA0hbPiD2IHtEQ0Aww3/U
	N5Z6hkYv+vlspIITOWlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ6gJ-00000000k5B-1b4U;
	Wed, 31 Jul 2024 10:35:43 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ6eh-00000000jmN-3Mkr
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 10:35:41 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5a2a90243c9so6755535a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 03:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722422041; x=1723026841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oIFp8Khg+4GQ8fLs2YKk+HJiIw5dPfegAQ5FPEevMKg=;
        b=VWMioLwjj6+M0qMQVDgY+VM8AAwwlWToAf0gHzzNRZ6ruaj06F/WAQkmX1VqNra0b+
         ambaX28dQxlFW22FHV6IEn8Z15GY38xyBvCbSHQ5irDdkQPLQaFOg+Tuu5vU5BGGG53m
         GJSX96lP5zGMMLMGcso9hw9Q/i5GN3JFg37QC6Xfg+bCeoW6pF02kJ+OT9pUYpVMthJY
         Qe1ZzM8e1piXaUs/Ga+kWYGVO6tUUbRqR1M/xP3/ZFISFcOremkvtc3LEs+9RTip1Cqd
         hxwvgB1oerv3T7Cdv8u49I37YDI7XO+5B+IT35gk4oBTnZ+JrWKmAoCOMZbG9YXnuUeE
         xOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722422041; x=1723026841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIFp8Khg+4GQ8fLs2YKk+HJiIw5dPfegAQ5FPEevMKg=;
        b=JIwRO0Y5kMLonCeaxihtbH4RrIFLbyC0bhkU69ovgwm7lyk6z+ytzzyqoTwe/CwpG3
         92LRm0iavYXbHuu1aEYCa1tqBRsnaDRW17Ai2RDKcUI5CR6l6cxgGosV3FXkyl2zsrMU
         V3m/7wW0nkjEkSpVc61E3mNW8JqX+sAZWiqYOa4hQ796qO8V89bzot88VNfY0ey3dkf2
         9DMrcc+51Mc4IS8TyANERX8Eb9QPoeUjpWifFkOQhVKTbSVX8pcev9wCHln3tz7gIq7M
         ewFFVjQIXEyPU5zq7cjv5ORbhaO2umGXQWnlTlTLGsO7XFgSPy525ApOoQmvVRhYQ8cG
         3s9g==
X-Forwarded-Encrypted: i=1; AJvYcCVbLZtFaTRzgA3Hxweei0h5kQ/vtOt96/YJ2dJu7y9kq1+eBUTtUYe6lbGhN5cvz7ntRooURRFuq5pcXta1BtL7CVHFJtySrvvpjgzVkrWi
X-Gm-Message-State: AOJu0YymE+fLcRF9Rc459paCVAAHpeSb/1R3B5AzicnHS8jH3yPLS8ic
	G5CX/UHqpX6a/h80/YOR9r8ClnvtvNm6DrYtexJ4ovIVJmNWeH6L
X-Google-Smtp-Source: AGHT+IEpqCSb1HZgZrXNMIPoeWCsJDQXhX0oT/7sHA7gK0E/DdB+OsIPbj442pW7/EMYL6tZ0sMreg==
X-Received: by 2002:a17:906:c10f:b0:a72:aeff:dfed with SMTP id a640c23a62f3a-a7d400dd249mr1048974566b.53.1722422040620;
        Wed, 31 Jul 2024 03:34:00 -0700 (PDT)
Received: from andrea ([151.76.3.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad9046fsm760828166b.147.2024.07.31.03.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 03:33:59 -0700 (PDT)
Date: Wed, 31 Jul 2024 12:33:54 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	Andrea Parri <andrea@rivosinc.com>
Subject: Re: [PATCH v4 06/13] riscv: Improve zacas fully-ordered cmpxchg()
Message-ID: <ZqoTEk2zMohhog1Z@andrea>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-7-alexghiti@rivosinc.com>
 <20240731-260cce60e1a6cd06670d1b24@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731-260cce60e1a6cd06670d1b24@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_033403_864596_3D23EF5F 
X-CRM114-Status: UNSURE (   8.33  )
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

> >   amocas.X.aqrl   a5,a4,(s1)
> 
> We won't get release semantics if the exchange fails. Does that matter?

Conditional (atomic) RMW operations are unordered/relaxed on failure, so
we should be okay here; cf. e.g. Documentation/atomic_t.txt.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
