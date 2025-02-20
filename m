Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F46BC021B1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 18:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qK9EfPCwU1pdnlB3mwREtFCcXJUreGMp2J2OJwN1K2E=; b=5GrmxnrO/99PDH4wngw+2WBgQ2
	yiugPxt+qsZUpzNT0nYhkzj8ejjXx9uwlYH5ZNZg4S4TC64t3VcX72sb4MNs4WXyqydenDM0S3kVT
	roAPytFJ2ad5K2mSGU/UN8z5cCiTV1LVPhuI/kkxX7yU2q3Nn4IXrPR1xmY/xiD3LZN41UFpB3xRc
	KagFyWv5VWtLp1WTvZUwM1isTf3NGxNs3xrPrBAPDxOxi9BWRWzlNghV0W7DlRcCbN4CuehoHJTdM
	pvqHXEidc4Bm6ucrDAPddY8GZyHlLbXpwSQzU4Ha1ypuVX+IM0XKmKZwzPNjjgenPetPDVdXUdGb4
	hBm7qn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBEi-00000002Lw5-07Xo;
	Thu, 20 Feb 2025 18:25:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBCS-00000002LRt-0X1t
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 18:23:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-220d601886fso19834925ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 10:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740075783; x=1740680583; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+brjcpA6Li4VmWmcewwernBTel3ZbNNKAOCMO9aNPss=;
        b=TeSSV7/rrDn/nJ1fsDIbHQi5Lo3voNQw2ECg/6fXJTPJHF6tt8x/hqv3woS56l90nI
         F5hssS+7oLSkNReIfBNCQ/Uh6L1/g5Ubgc3U/RSepCxtbPu68HQ2nh65+dScVtyKNeok
         HY8XVmvAHGu9xF9cMBSnl1v+msisNqrwlAt9bHeHMRqQ7fZDHTfwLfjjdKtGT7n4Toz7
         rvTOfR3F1ptjzBm/VF+00SD1ONWehXySXrIie3xbtEqz3TUIM6UNAaKuhpG5EWdNCP0R
         rtM4aYDziRnMUezs70uJsYb6lsdaEDgLS5n7HCB1IVEHbDtjRx7GVJRGkcPvqNZ7VvTK
         CEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075783; x=1740680583;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+brjcpA6Li4VmWmcewwernBTel3ZbNNKAOCMO9aNPss=;
        b=g3OqFaoNQyQgKCzfjuJ9nrIauUjYDoZU7t2/Fvn7a/heH/H3hEpr0hx33XzmZt9+EF
         /3EALnvYO8jVxmQjlj43P3dPUpoOY6ik7ZBXAHhS1Gf0kd7AgctgcSGPsXXCZ5rS6FrW
         +4NeuE+9qAxBUnYaBgShNHSgFtLQTMYYeBezQLt/o3Jp1sQgyQEYB5bC9WTSt6o00nsw
         hU0gYLADeEwGgb8CdaWKbKoDVhdRVuXUcwUEcJQSROkNqbek4HVpo4LtGDB0UmJvtI8t
         TlkF+/oLNZBr24nXww7tU3fPOE4Gh561eI7w0ZZrqdIP2pF7JzsfU6e5GkX/6zP9Kw5z
         28rA==
X-Forwarded-Encrypted: i=1; AJvYcCXTi3bhC889hyUMVYU20yjbeOwppve28rebdAyg6qsrsO9l7pOytnr8aEvvfeBQiDRHMftccFj6I87ngw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE3SILjgQOq+Jz8a71FeRLkZWmnQJg11EPnloip1k9gAosBrxR
	+GnYuy3keGHJmoXlW8wP82lixX2+0P/xmTSRkQr0QksCW+I8VHKdusSrk6O4Jmo=
X-Gm-Gg: ASbGncuhf7uRl7d0lLWqW6w8dJC4RkIeVTxhXHhCUUaKpruh67m5yQcqZ3yqmCi7fVH
	9VZ0YP7SjORvZ5nY0VxFhr1nwIMoHON2iRXoSf5TPrylZ+Vg6FJXDlOkjToZt+f+28YOYx8sQii
	jskKTSVl4bHrXWPdlEwxuxn6M2p644NOBIJXG4RKk6CnSEjGIYX1MQJJjsbj8UiHGfC7aFcZeBS
	DFmUqvoQZF80FvnlFAL+wePUFS4BL8bWiVu2I6fgdo2vZ8mA6PZ0EjCm4wc68fZoTPsk1F0oDvG
	aRC15NNvWePN9yxBKfHDC5cXAg==
X-Google-Smtp-Source: AGHT+IE9M+E7TrIj5xPmzAisbrDh7wCmSL9KAsAbD2jI7mD1njYkys7UD3bLih4YqYoexzYiUnH7Ow==
X-Received: by 2002:a05:6a00:4185:b0:734:9cc:a6e4 with SMTP id d2e1a72fcca58-73409cca8dfmr10560814b3a.21.1740075782993;
        Thu, 20 Feb 2025 10:23:02 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7328acf354esm6281724b3a.3.2025.02.20.10.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 10:23:02 -0800 (PST)
Date: Thu, 20 Feb 2025 10:23:00 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Subject: Re: [PATCH V5 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
Message-ID: <Z7dzBH7SNN7SP3+5@debug.ba.rivosinc.com>
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
 <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn>
 <87frl0snf6.fsf@all.your.base.are.belong.to.us>
 <CAAfSe-tRFEXiXJ=tHVnXy4Kb6O7-E2Sr_xybLYxma=ypMhqz9w@mail.gmail.com>
 <Z6rLlkphtv99+bH3@debug.ba.rivosinc.com>
 <CAAfSe-sf+4QY9eif_XaRGXEUn1JyPn_Jj+k2MOq9mfDR2Bd6yg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAfSe-sf+4QY9eif_XaRGXEUn1JyPn_Jj+k2MOq9mfDR2Bd6yg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_102304_447567_CB7DB23D 
X-CRM114-Status: GOOD (  19.65  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sorry for the late response.

On Tue, Feb 11, 2025 at 04:05:02PM +0800, Chunyan Zhang wrote:
>On Tue, 11 Feb 2025 at 12:01, Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> On Tue, Feb 11, 2025 at 09:20:22AM +0800, Chunyan Zhang wrote:
>> >On Thu, 30 Jan 2025 at 16:42, Bj=F6rn T=F6pel <bjorn@kernel.org> wrote:
>> >>
>> >> Chunyan Zhang <zhangchunyan@iscas.ac.cn> writes:
>> >>
>> >> > The PTE bit(9) on RISC-V is reserved for software, it is used by de=
vmap
>> >> > now which has to be disabled if we want to use bit(9) for other fea=
tures,
>> >> > since there's no more free PTE bit on RISC-V now.
>> >> >
>> >> > So to make ARCH_HAS_PTE_DEVMAP selectable, this patch uses it as
>> >> > the build condition of devmap definitions.
>> >>
>> >> Heads-up: It seems like Alistair's series [1] that removes the devmap
>> >> PTE bit will most likely land in 6.15.
>> >
>> >Yes, I've been keeping an eye on Alistair's series, intended to update
>> >this patchset after Alistair's patch that removes the devmap PTE bit
>> >got merged.
>>
>> Please keep in mind that even after claiming back devmap PTE SW bit, a c=
ompile
>> time decision to select between uffd-wp and soft-dirty is not desirable.
>
>Yes, I agree. I've read your aother email. I also hope we can have
>more RSW bits to use. So should we add uffd-wp and soft-dirty support
>on RISC-V until we have two RSW bits for these two functions? Is an
>undesirable solution better than no solution for now?

Problem is that this undesirable solution doesn't solve anything for *most*=
 users.
Kernel can't deviate from providing functionality (which is actually arch-a=
gnostic) to
user mode depending on the architecture.

>I can optimize the code when we have more free RSW bits, that's not hard.


We got 3 use cases,

- pfnmap/pte_special
- uffd-wp
- softdirty

4th one for devmap, I hope we don't need to do it. Should get it back.
https://lore.kernel.org/lkml/cover.95ff0627bc727f2bae44bea4c00ad7a83fbbcfac=
.1739941374.git-series.apopple@nvidia.com/#r
It looks like any work there would be wasted time.

There is a (fast track) proposal out there to get 2 more RSW bits.
https://lists.riscv.org/g/tech-privileged/message/2268

I hope it gets ratified soon. We will have proper solution to this problem =
then.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
