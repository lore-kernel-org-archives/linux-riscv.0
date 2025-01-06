Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0200DE77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1iprRtbw8Aka9bpumiSZA33FE98kzomaAsv/25zkp4=; b=JDvp5WC562m0X1
	xeO+Y7Ctmuh02420R3ZK+QKjXHLXK5+7AigU31UlO4RVbroH459avkNiT0r+tqLEm5c3jtnvTKxnT
	Vg8txyi4jeYYUC/y/9qvOEeqp8+Uwlb17lP9yU3XFDx0Sf8L5xbYCMAWhGyBTEqSsSjtutdyQAS6C
	6A6xd4PqJClQKrTVkxVJ3lw3PIEdJvdRvf1PPRidzTBDOzlnumpuMb7nvwtk4V4bb8byccS/zK4T/
	xRPWj68TBPHdFAOXyzEBXJ3kq1w4jw7r9pVKwLCReDkV1/SKogjTaYFbZhyNG3TJyxih/cfI5Gkdy
	tcs5Qll3hqkcnzN/m1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnJt-00000001Qgb-42t7;
	Mon, 06 Jan 2025 13:39:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnIk-00000001QJ3-33WX
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 13:37:53 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21644aca3a0so23076115ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 05:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736170670; x=1736775470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
        b=J2yEbYLh3x+MWH2BoyOolq7FkMjNKX2NNjKR70KK+uYu835ibBlxWLU6pQ7dJyNX5J
         XVx4WqZXPBXYIHOMoLJ88c85fDyXSEhm3nM598hOwawOUhUnzEXnwnTHE2jfZ74EXvYP
         v6T4DIURq33d1tfanDdGhaJWxZJDVDEMy7t3IET7vM9eI6usCDCi5H+wgMxWA3AzW27f
         cL8s8vFLmq7lFmS4G3ih4hUVZn2bd5xN4Nymauv4wWMlGEFMMXlc97IVXeJlrozELsja
         y31zp5E72zA9ivfTMlQnVkE1oUMXpE1slPXLAdG+Kw7vjYElB8fol00/u+Zuzn46ZPTN
         yHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170670; x=1736775470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45XLTheYrSs123jVGiTYWA09gh8PmFWTSz2LniJsnL8=;
        b=Wo9xNhRm89TUiuxFsZNGxFd2qyD3P8fXmrg02dOa8fzw9hY5MdGDw6PGCnhMYN/4XG
         QAR4C/zS1Ze+to55Xu4hCOJfJFSB2QXplTQmCgt4tLb5+CnPjrYKYIYVV6gsJ0xfC9ha
         wqTnNEizAqPf6XCN5WA/jQQiWfZKwFNFkdbhwWIzHi0NPJMJ95XUMiAXpX0/h0Ndqchv
         R6Yw8WAOZgDbAu/g1JzXjhMwtPndImt/Fd45MhFaZy09rM4LJkSuInNa5XcQtIIkZYWc
         OUv7W/hYBnK90udkji4Mr6NLF0rB18kJ68FQOsefAYc87T65/HVvU+gr5FBAXATXo37m
         AUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxcna18ITRrQC34NZVWknQeV4wRCUmxOWP0hr9+2dU2efh+6Oy2Ztht2mPH1j27IINQYNIDeMK0Kr+Zg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0QJBUiuA4LikaZ2FJk/mqqNIudiJ1hRlXb+fMBkWBv2HYy7Ym
	1Q280jRbg1DcoOTgLeJd2xD8zykM3fEnvWR28LY/PStKb4s004tZIn8ymCVFz9M=
X-Gm-Gg: ASbGncvF2WcRryZbWGvNf6nXcrEtEcnSrpsz0N6+IzbcLJCEZA3htmqt5iLz+T17snH
	93hcAOIN/wIsYuHVzKSpSJPbEgLg+QjNYbqc0cM28DBNoTsHeSp20iLrSboztCisg/X36UQz/d4
	AkljDRe4c3lJ716BAT04NfQf011BmhHDm/ryU0WkKVnmbffdQ020DFV6tftg+8Sim0CyQhpNEGy
	fgm1cZatFR2z8qWm094XNaq9YPe1fT/tCLL9E8RwLrPMvaReVFjER6aTLgg4vYn3Ya6t51INfCy
	IL1JtxXFQXAnJY8k3Fef6hQ84jgW4PCjTCdP+Lgqc42UrT4x2tIi
X-Google-Smtp-Source: AGHT+IFnWXSZW4FIIFkfBRxwzvmAw3s/HsdTqMia2pBdvLu70V6jfgNFfu5B3ABCLJ+ulhyhNt7Jxw==
X-Received: by 2002:a17:902:c406:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-219e6ebb716mr865705425ad.26.1736170668665;
        Mon, 06 Jan 2025 05:37:48 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm290583325ad.187.2025.01.06.05.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:37:48 -0800 (PST)
Message-ID: <760c9610-a11b-4bc2-852e-340adb27f666@bytedance.com>
Date: Mon, 6 Jan 2025 21:37:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/15] s390: pgtable: add statistics for PUD and P4D
 level page table
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <35be22a2b1666df729a9fc108c2da5cce266e4be.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxVkg3i7zXI92e@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <a3a2bd64-9952-4c66-8626-f2436ce07d1d@bytedance.com>
 <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vb+0MktvDNysQD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_053750_805082_24F2C31B 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2025/1/6 21:34, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 07:05:16PM +0800, Qi Zheng wrote:
>>> I understand that you want to sort p.._free_tlb() routines, but please
>>
>> Yes, I thought it was a minor change, so I just did it.
>>
>>> do not move the code around or make a separate follow-up patch.
>>
>> Well, if you have a strong opinion about this, I can send an updated
>> patch.
> 
> If you ever send v5, then please update this patch.

OK, will do.

> 
>> Thanks!
> 
> Thank you!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
