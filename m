Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3497C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 00:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDdSo53S3PDzr/YTTpAbPrbhSsqh3Jag3fekELUZr6o=; b=Xx3zbmHHfTYy/I
	H90U7aqaZ3SEMa0QyudcsFGMtIyOGqm7/+2Dt3I8zoZW8zYXZk6rE8Th7uDHNQjCJ2xJBgECsFHbg
	wmZtY4ubrFt2OxISmdDr/egkhBSrvimcIgyl1CYlZWOPjXk/9xRTwfA/D8ykhMXkig4/iVn3lZTfy
	89zIlqGYvkDKfyCW5S1KWhyJOg+S8C6smL2MboL5zLjuay+w8NV1Sb0OH7SUVUJzBVDzP9wHROpFq
	aPLkflrpuZKG2fgvhP8qiOA/ZOwO7/XQaxRQW9ALxzIHjv1bkav9e9DnCK3+VZfyzNT6PygHzh2nf
	Tdj2k9iYteVZC9kYZIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRKtT-00000008wbx-3Iqm;
	Wed, 10 Jul 2024 00:09:11 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRKtP-00000008wag-3zgY
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 00:09:09 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a77e6dd7f72so416572866b.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 17:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720570146; x=1721174946; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3JRQ7EweQhSMEsvvdkrywMrGBjn1vj/+wD1zYMRcrw=;
        b=UFYPuYUl8OK2BaBEI9P1CUINhK7FZKmMNK+/Sr1mn8Mvj0hsHk55Tvvap/1GvVqhaU
         vmqu5Qeu9sZdqQ0vXyJgHRy+K+GeZaBqvVlvv6B0MM9ecM6kWR+P2yX4rTlvXs5ru9Ao
         /m7Zy3hkHJUJ4KvR0A4V0tGGBr7H0q6LGZM9XieDAARgOiqN5sFRtCnp1N7tvYQcYeZg
         Hc373VioiQGDs4qrwFbxA3B2hbBO2cZMgoJTGQ1MZ4K06zauIuxfhO5YcfWw+WuAdD0G
         Zrz+unuKQMuQkXcjhm8FadPeo/QC4+SrqnkqzeG1L0yshfgCW2cSCDvOtpxtAYnccLoe
         Ac9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720570146; x=1721174946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3JRQ7EweQhSMEsvvdkrywMrGBjn1vj/+wD1zYMRcrw=;
        b=WftRL6znq++HGzIeqkwj+Q/2UYIeYOP/Uvq+OblVtxosJ+B/67Da6G+aBEzyqlduqy
         rXHjvYQxynn+2kfj8AY7rJWkVadhxRkRCfrnR2vRfUFVN2IfCZGO0Wr9TPi+RIMxGsaV
         7kkVmyrmjITjd3V9a8CHFCesIccpxiAP64VyZltr9DtOBnmMp/+n03HiCF2aksSRT9Ny
         rHCoOa1T0KJuttc2o9c6TMyfRORCb0HFfJEhEBl07bqVgpZnUw+E5sHL+QXHxMeaFe6P
         41+mqRJTg5sYNa+NS1ntwAh7GxnQJlUSQHDDEPvh82aFCxskzv+m8gZvr9Qkaz0H3qO9
         xFgA==
X-Forwarded-Encrypted: i=1; AJvYcCUlZ+Ga+S//71zosCrBHRHQ6jeqzzPZc5XjLbK83KQkdsDxfK+fvmaejlzPsp64gTF+e728w/NI/j8Qt/FdBkjKS3zWBqSXS+yCmGlXvlI5
X-Gm-Message-State: AOJu0YxkUMp7x5W+M2W6E28++FcX+Ee+vl7baNqyq+tOXPzQGurpQzdh
	eytQEy+l9ksuSYM+Nhmx7KZ8m+B4D/2eqDcFC0wNc7iU540ONdlC
X-Google-Smtp-Source: AGHT+IH7x5bIVF36rjoHSlDcBGTLTopoNVM1WIfL/wrBab5SBCqjguHyhpaatL3eld19b/5jP213Bg==
X-Received: by 2002:a17:906:2b57:b0:a77:cca9:b212 with SMTP id a640c23a62f3a-a780b7050dfmr283637466b.45.1720570145545;
        Tue, 09 Jul 2024 17:09:05 -0700 (PDT)
Received: from andrea ([84.242.162.60])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc88csm114316666b.6.2024.07.09.17.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 17:09:05 -0700 (PDT)
Date: Wed, 10 Jul 2024 02:09:02 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
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
	linux-arch@vger.kernel.org, Andrea Parri <andrea@rivosinc.com>
Subject: Re: [PATCH v2 07/10] riscv: Improve amoswap.X use in xchg()
Message-ID: <Zo3RHtQBvz27HiTK@andrea>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-8-alexghiti@rivosinc.com>
 <Zn1wDAXjBdJu48Oi@andrea>
 <c6c305a7-37d0-4834-ac65-1ac5d32014d1@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6c305a7-37d0-4834-ac65-1ac5d32014d1@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_170908_016766_FF12204B 
X-CRM114-Status: UNSURE (   9.82  )
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

> > I actually see no reason for this patch, please see also my remarks
> > /question on patch #4.
> 
> You mean that we can't improve the fully-ordered version here?

Well, I mean, this patch doesn't AFAICT.  You've recently fixed these
LR/SC mappings in 1d84afaf0252 ("riscv: Fix fully ordered LR/SC
xchg[8|16]() implementations"), and the remaining look just fine to me.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
