Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C10CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=miqoIpCWNzD757r/o6XIpr2yEgOVE0xg9K6ice/RND8=; b=4A1YJ06Jx8IrHW
	+/VL0HjTsG2WpNsrXfv5n0lDrmhPrgqwEFdchD8lW/3pjSB7q+g80QrDKdR239Z5a33Pk3MAE0v4/
	7xn9yijMSMywxnaj3d6WP8CVx84XkoNRV3oYcICtr7HoKw7pgXsWUAojiYebD1VxG13jX3N1hYvSY
	IfIocBHnYV7fRXYYRLzze5de6tyDWgw7Dbmoqjr3Ev9000+asazTjYN1tXJjI0icAb4cRI5Fj4W13
	IDYm4EgraUguQYrc1lFCbwNg6V89RzJZJvXgFOM5ku9fp1ILm2w0Fkvs4V1mz9HWyVMaUNp5dz7B6
	WWYcuC5y9Fse7kGz7RrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9Wn-00000004Qdm-1ZD3;
	Mon, 15 Sep 2025 13:45:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9Wk-00000004Qbu-1F6L
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 13:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757943952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qd22CcRHxTz6S9weuM1x7AkdMNNHqOghUEX9jI8G2J4=;
	b=RVHD+qEjAVqrQDHYn0PKoFGnhEF6Gf5CqDFFVXEM04LVnLEBTUSKyWMpNkg3mnTv1Zx7v8
	Lq858wVGGyyrQgwXBlSZJ0Aiem/xlAGFY18atX5n6VvD6vwthxMO4w2Qwe6hn56IMYh+g4
	t1QVEbmWwzrFzWjvhceNNIfG7U9sQnc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-1-HWo0SgPZCIpsNrd0eGHA-1; Mon, 15 Sep 2025 09:45:50 -0400
X-MC-Unique: 1-HWo0SgPZCIpsNrd0eGHA-1
X-Mimecast-MFC-AGG-ID: 1-HWo0SgPZCIpsNrd0eGHA_1757943949
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3e4a8e6df10so2661661f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 06:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757943949; x=1758548749;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qd22CcRHxTz6S9weuM1x7AkdMNNHqOghUEX9jI8G2J4=;
        b=pGxXmQn+n0UcacHgcdHFMINWIxRD3GonaqexPKqMA+k7WeyxZSTsVAyO9fAOL3fmXF
         gvwPWVPGlABEcivxbPA2zXm88UXiYEEzn5ZyTj0kij2Bnhnv/bO6IbxcKJCs6Jd3UWDH
         94jKix5ytxS1UY/dAqcAk3y/XVqa5MZkIuX4cD1hVlHyMbQCOlupmXkux+aRb8yHG06n
         7TFLgus/OPzDw67gKcu8bnDHI9mL4Efh5h9bb465ij6+aC5gts+xXB0OOAhqBOMeOp26
         72FWLY5TrQH1XnTS0+kvdfGN6v7rRHQHkIBT+JBqDg4feDG9GC1NgYFMnoC9WU3TdZu5
         XZzA==
X-Forwarded-Encrypted: i=1; AJvYcCVcbUcaFMPHhgyTcV364iDQy+bIxQqMDRme62K+act3R6tGRQUkBnFpZSI70wecMgYfhSDzKhLgisqCgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGer22hLfww6IptXg3qj4Q6DEBWAKlnra190irzqVDpxjWdOmt
	4MjLgp5cvw8sm4NCNOX/If7mYtzGHzFSBjd9QKZvtc8rPtrsjXWlk7aQQW1fXjBcsbe/lyiJ5hn
	q5HYZF4LxFQfAVJAnHQcrbNPVEDoioxFU+70LWKM8g4zEFCqvwtGIJ/DuR0jHt530LxU+Ig==
X-Gm-Gg: ASbGncsQcyIhm5UkuW81cv3dQ5Q9Fjey/Jt4sgq7gGs2jaeln/DPUFt5KBWqdJxTFXY
	GscJr/0vdClvdT4PJj7w2dzK6s8BDH/3QvlahMNyQ3Dsj6h9Ejfj9H1EDn4qD8tmbCt6zJ3ot4q
	GH9QKBW0SnsjgW59u2lAafAv+HGWKuz/EhnKIKpTWYkT02ya3Chq3P4lDcqWW5jBveLkoWV1DNG
	riFaZiQ5d6etrfj3umqBqFjW3zOX0C3/OTF7nlYeQGuAcXJbOpkL4y118ZWaHV7dTGHi3E6Bjui
	hOzANWqc8RRxuyyA0NfO44DgV+lBZ5SbBYOckgs8og/IF/BmLRGqN80tR7PhgZ/YzWcVZ4dZeK8
	AhoclBxqJaqd9iSjGgsTYrwIDhRrYkHFrGnL7vRHJcCcBs2lPz9oZYMClCgC2XOtOkl8=
X-Received: by 2002:a05:6000:438a:b0:3eb:5ff:cb2e with SMTP id ffacd0b85a97d-3eb05ffcfdbmr1834606f8f.29.1757943948979;
        Mon, 15 Sep 2025 06:45:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFLyX6UvLCuUUA80n4GoWHIr/EyUeUL4oLh9hf7GfvHPwfVKVtA1c+Ma7f+eiXJQjtzYNjOg==
X-Received: by 2002:a05:6000:438a:b0:3eb:5ff:cb2e with SMTP id ffacd0b85a97d-3eb05ffcfdbmr1834581f8f.29.1757943948471;
        Mon, 15 Sep 2025 06:45:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd? (p200300d82f18f900e0ae65d58bf88cfd.dip0.t-ipconnect.de. [2003:d8:2f18:f900:e0ae:65d5:8bf8:8cfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9a066366fsm7321173f8f.44.2025.09.15.06.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 06:45:47 -0700 (PDT)
Message-ID: <2b13e434-192a-451c-a09b-69eb92392a3e@redhat.com>
Date: Mon, 15 Sep 2025 15:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 0/5] riscv: mm: Add soft-dirty and uffd-wp support
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <20250915101343.1449546-1-zhangchunyan@iscas.ac.cn>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250915101343.1449546-1-zhangchunyan@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1JfvfL8jsRDfLGPc2cnaB8F5YerMtjZg7Gq83jQr2_c_1757943949
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_064554_760930_2E721983 
X-CRM114-Status: GOOD (  12.69  )
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

On 15.09.25 12:13, Chunyan Zhang wrote:
> This patchset adds support for Svrsw60t59b [1] extension which is ratified now,
> also add soft dirty and userfaultfd write protect tracking for RISC-V.
> 
> The patches 1 and 2 add macros to allow architectures to define their own checks
> if the soft-dirty / uffd_wp PTE bits are available, in other words for RISC-V,
> the Svrsw60t59b extension is supported on which device the kernel is running.
> 
> This patchset has been tested with kselftest mm suite in which soft-dirty,
> madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
> and no regressions are observed in any of the other tests.
> 
> This patchset applies on top of v6.17-rc6.

What are the plans for this series? It fails to apply on top of 
mm-unstable / mm-new, so likely merge conflicts when merging through 
another tree.

Likely best to base this on mm-new and route it through the MM tree?


-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
