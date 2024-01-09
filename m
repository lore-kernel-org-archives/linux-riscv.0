Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E64FC4707B
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lu42FYNUvau/it+NpHU1tnjBy0UblOSIz85JYSe7oqQ=; b=H0RSlb2wqSQXkD
	8Tp5YaERNM9uJqMjazwJZllIBQS6f5rViPrP4eX6cBQ4/A/sd+NAIR55oJlPjSkbwFjyMTaX8kr4E
	wWLIon61Rj/o/0gJubBHePtoIO0jAmubiZTYdDq4Q+Ltfcr5/Rlf7g0nvjLLHktCwCznMTrfPZUGs
	AJXpSJ/kj03B3F5rrTzz/RNmEBq33mDQBZ9kIvuYmNDSS1IyS5NRI3b4jHHQfDvvmBqohLNWiuMtW
	ahpojuWoR+wr+gquJ1JRucAZTsrFfZTSW+knJxkJfn07/RgIhgU6aTGowydIY/Te8+pXGbbdreegH
	zB8sw0fURBMfc6it97KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNFbI-008x8D-22;
	Tue, 09 Jan 2024 17:09:16 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNFbF-008x73-0w;
	Tue, 09 Jan 2024 17:09:14 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6d9cdd0a5e6so1577026b3a.3;
        Tue, 09 Jan 2024 09:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704820150; x=1705424950; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I/UzxeeSAED7iM7HDuJTONIJ2KKw54eiBxBJsUAF1c=;
        b=Xet0uEBHRibjY0+1HC7FnQWeMh28EH/w7KhL9sOH+caP9FubV4sPdTI6vwbC/24KTh
         3Pj18m9qOYD5fmZ+gSfQqw5otylzYet2ByVf5OUj7Msfeo4U+9jXDhHYTRk0k1dW/Lik
         0WHBzlFqjw8xCF3LtJCPbMVTbTShW7jAH5OXONwsdfbK8TzdGp54oZ6I1FPW74THlQoP
         xUPI0vr4f2gwQeJ9OdoQiQWt9q36RVsDISlJvykVeAvdF6jx2prNjKkf1r1zM54tYXws
         CogJbVNk+HepNnDNC9cOwLwij9TgvHfnGVzseJ0v93TuZIPEUIdEkgaO4eOZoHciIGqK
         6jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704820150; x=1705424950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I/UzxeeSAED7iM7HDuJTONIJ2KKw54eiBxBJsUAF1c=;
        b=iiLulu98IzPpfKdN4lhxzHsPGQzZ7+WLbje7NKmvYvQMrsOXlZShVS0gzjZblSA6mC
         NTicmUhZMj50CHWOPhIEZt1o9IyOYfptNLKnDqhz5t6l6dQRj2H5kn2M37FC1G/RUWqj
         bpxIXQhrdwjuzVakVs6HEWqwbJm9IR+o2TFbrAtPBo+XNSX+Imq3lUvrj7wM+QKppNCM
         4n2BteBuSxNQkiMQtgmVDzLnnGMY21jd12vqQx96EbzYgcoo1gtdU+hmmTuPtxDG0Yrn
         AOUTuNlEeLoFwpj483eyihbEa8SRDFDQ/Xh7J+27Fhf5HswfkEx0LpcsKLsvcTdJDD6P
         P0OQ==
X-Gm-Message-State: AOJu0YyM3e5hLuOPn5avhasc700kvaDyhIhkIxJvWcEpZ9j2h5f8sQTV
	bnLXl1R+0FLo3mXtt/ICEvU=
X-Google-Smtp-Source: AGHT+IGbHBY87b9+cLnBphbm2WrEUcTqTZw78s+6rmXGcCu4D5i3IsBr6slXU6F3gt+g15APEjnJqQ==
X-Received: by 2002:a05:6a20:a104:b0:19a:13f0:d739 with SMTP id q4-20020a056a20a10400b0019a13f0d739mr166549pzk.38.1704820150114;
        Tue, 09 Jan 2024 09:09:10 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id p30-20020a056a0026de00b006d99c6c0f1fsm1904760pfw.100.2024.01.09.09.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 09:09:09 -0800 (PST)
Message-ID: <9e1bb616-35b9-492c-be9a-011943b59d0c@gmail.com>
Date: Tue, 9 Jan 2024 09:09:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm: ptdump: Rename CONFIG_DEBUG_WX to
 CONFIG_ARM_DEBUG_WX
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-hardening@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-mm@kvack.org, steven.price@arm.com,
 Phong Tran <tranmanphong@gmail.com>, mark.rutland@arm.com,
 Greg KH <greg@kroah.com>
References: <cover.1704800524.git.christophe.leroy@csgroup.eu>
 <d651269a681150f9bdca8103434fb3f4b509f784.1704800524.git.christophe.leroy@csgroup.eu>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <d651269a681150f9bdca8103434fb3f4b509f784.1704800524.git.christophe.leroy@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_090913_329674_FF0F2A1D 
X-CRM114-Status: UNSURE (   9.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/9/24 04:14, Christophe Leroy wrote:
> CONFIG_DEBUG_WX is a core option defined in mm/Kconfig.debug
> 
> To avoid any future conflict, rename ARM version
> into CONFIG_ARM_DEBUG_WX.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Looks fine, you might also want to 
s/CONFIG_DEBUG_WX/CONFIG_ARM_DEBUG_WX/ in 
arch/arm/configs/aspeed_g{4,5}_defconfig so there are no surprises when 
people pull in those changes.
-- 
Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
