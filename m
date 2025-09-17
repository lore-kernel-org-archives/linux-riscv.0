Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C7DCAC599
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EV37afAaHMDiAwOOfwsel2VDmWyMnNkPL74zMt+Pzng=; b=0n8kOeDXGemge9nPwYjcI0DD5z
	PQe/Q4VtmrShewkOAaUeC4enOEpiuVza89PKUA+qoVBdyRcThVlCMTuWNjR9hlhOR57tQeVthxFB1
	ATo5vPsT4L4ODPTPmjfLuah8lHGolXqYN2rkXcAantEIVW5ZqWDFSRC9U3yhCjClZHJCrkTE5iVcI
	SWPKiF88k/fNNPZwdSsCxLuZ7nNDJjAqexDlk+bLqHnqJp/CfAUqVGh82s1BRqkujRoJlwoIwZApW
	sOXx0Wh+h1hYZPJmMybh60PPfYB1auMjz6xcSF4iitGSOp4MxYv/2B3G/CX+dq2X9F35f/sNB6aXj
	wuWUswNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytWg-0000000CPxE-2sI2;
	Wed, 17 Sep 2025 14:52:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytWd-0000000CPtg-0ABO
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 14:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758120770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gDs3CUgjimStalCZ6Y06kSWDcmRW5MkZeDVBa3itpks=;
	b=S6Dkz3LXgmThNV1KGKLbxrk8dDCTr/qYg30mv9vyF3qAZhCYeqcQExUSqaFyszHisV5rAN
	76gOws2XJXaTQG3daBAMlMzHJfO3NXGCCMp+S4b5f+VS8U3pJO1SBhNM8S0kj2IkQqJjNl
	CGci2eNzc5W8i3OO1Izzu28xKjcC468=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-ky3ZbLlUPmetnKsGVx_aVQ-1; Wed, 17 Sep 2025 10:52:48 -0400
X-MC-Unique: ky3ZbLlUPmetnKsGVx_aVQ-1
X-Mimecast-MFC-AGG-ID: ky3ZbLlUPmetnKsGVx_aVQ_1758120767
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3eb8e43d556so443541f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 07:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758120767; x=1758725567;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDs3CUgjimStalCZ6Y06kSWDcmRW5MkZeDVBa3itpks=;
        b=ijXs1JOuzdkY3v6hlEqxE7v1s3cp9UJnOIPGNgEbKwQOSAGaB97FnHKiBbk4aSc5za
         2Jce9u6ZlOsIqT0LtquaGbvuer8/m4kyzgNwzkjTwEvLLIq0XBtMEfUCCmz2ZQiCttt0
         1kOPgGjNZ4zUXTNQUsyfOdmDVU8bHOny6UuZyUkLp/zQjKew2phqi2F7a2cxjqCLsrVf
         FnJqAWZg9ix1VhfhMT/jdvSB/MPHSZUxpgh38QUCXO39mVyHGfYMETz8W76iJJPVE3Hx
         iPuKYu6UAhrkGMlDiAVf0I03jtEbIPQntHg8UBZNUuEVA5pQ4TEJ4NYXEFjCejJPaEsu
         MM1g==
X-Forwarded-Encrypted: i=1; AJvYcCWRJ1tmI0hIwVpBNywPIypBIFPa2CTsUT6Na53l5t/mXGsVei1o49j1/aQr+acEPlYlpGm+KjHd0shCZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YybsOGgLIVYs0D6qDpDJiH5yhm/e+N/nKK2lhXljeDn268XMNq+
	28/DVEBPu0cmxk0VXJeEMnjVTUgzAtnLTBXqa9GK+VU34qMn3Pq9dmpfcPNGKp+kL7t0WPtypb8
	l6EtPeIsh5xdTYs3KawNZeJVLjnQxpnQSXR6tWCwRp3/cNOlouoSdXuL5IN22P/nBZ/0vtw==
X-Gm-Gg: ASbGnctfYh/73iGvVgUR9F52bhJiPTaLMLWoA+qvJCWABVZj75/O/lcB4CEgk1Artk8
	4HsSxNCwWcYjgq7D/CZlDVuxOPylY2mdOazBJmScykpy+gWaA7qu0B0DcFTZClBiBqeJjTqtjpV
	LSfyAWZuNhGK/c+91hV38QWMiPSFPmNpI51guUeYPKR/g4EHzyZL21BqAvDJ4HytBpNi8Eyoy/M
	3xjx2oab/ObDV2rjXXTlpJ/W0McAvvxfrSks5SAINi2ZqU84sZCqvSGcHImjTyeFAHRIlACH5yu
	gFeLk/I+wyf9KT52oap7UC8zXEAk32Gobqc9LeN+NjZsSE4Of1rtmC8eJikSArn3FCYr0QL133p
	VWtHh7Yl3PYkvxniIyJM9WLdZQuzySoeB1Dn0HPoYlyROqC/Ejri6HhRbuOFLnDFf
X-Received: by 2002:a5d:584d:0:b0:3ea:d634:1493 with SMTP id ffacd0b85a97d-3ec9d70e1aemr6331360f8f.3.1758120767150;
        Wed, 17 Sep 2025 07:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCVwA2whdJvJ6k0SNSXVgRVBCXXeS7K5H+4SZxMmaPtCI7Uv2obWcxbuvE8IbcU5jjC+Gugg==
X-Received: by 2002:a5d:584d:0:b0:3ea:d634:1493 with SMTP id ffacd0b85a97d-3ec9d70e1aemr6331269f8f.3.1758120766367;
        Wed, 17 Sep 2025 07:52:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613f3c69d5sm39701795e9.24.2025.09.17.07.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 07:52:45 -0700 (PDT)
Message-ID: <e30627e5-f30f-4494-934c-58e4a427a476@redhat.com>
Date: Wed, 17 Sep 2025 16:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] filemap: Pass address_space mapping to
 ->free_folio()
To: Hugh Dickins <hughd@google.com>, "Roy, Patrick" <roypat@amazon.co.uk>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
 <20250912091708.17502-2-roypat@amazon.co.uk>
 <7c2677e1-daf7-3b49-0a04-1efdf451379a@google.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <7c2677e1-daf7-3b49-0a04-1efdf451379a@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dDiFzFtpk3pRSsDGkJBSLh16hKMkipbAL4Xgj3AzfvI_1758120767
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_075251_234650_C12DF080 
X-CRM114-Status: GOOD (  22.82  )
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
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "surenb@google.com" <surenb@google.com>, "brauner@kernel.org" <brauner@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "trondmy@kernel.org" <trondmy@kernel.org>, "martin@omnibond.com" <martin@omnibond.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "song@kernel.org" <song@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "shuah@kernel.org" <shuah@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "andrii@kernel.org" <andrii@kernel.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Thomson, Jack" <jackabt@amazon.co.uk>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "pfalcato@suse.de" <pfalcato@suse.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "haoluo@google.com" <haoluo@google.com>, "seanjc@google.com" <seanjc@google.com>, "anna@kernel.org" <anna@kernel.org>, "ast@kernel.org" <ast@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "corbet@lwn.net" <corbet@lwn.net>, "willy@infradead.org" <willy@infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "mhocko@suse.com" <mhocko@suse.com>, "jack@suse.cz" <jack@suse.cz>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "yuanchu@google.com" <yuanchu@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "mingo@redhat.com" <mingo@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "jannh@google.com" <jannh@google.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "weixugc@google.com" <weixugc@google.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 16.09.25 08:23, Hugh Dickins wrote:
> On Fri, 12 Sep 2025, Roy, Patrick wrote:
> 
>> From: Elliot Berman <quic_eberman@quicinc.com>
>>
>> When guest_memfd removes memory from the host kernel's direct map,
>> direct map entries must be restored before the memory is freed again. To
>> do so, ->free_folio() needs to know whether a gmem folio was direct map
>> removed in the first place though. While possible to keep track of this
>> information on each individual folio (e.g. via page flags), direct map
>> removal is an all-or-nothing property of the entire guest_memfd, so it
>> is less error prone to just check the flag stored in the gmem inode's
>> private data.  However, by the time ->free_folio() is called,
>> folio->mapping might be cleared. To still allow access to the address
>> space from which the folio was just removed, pass it in as an additional
>> argument to ->free_folio, as the mapping is well-known to all callers.
>>
>> Link: https://lore.kernel.org/all/15f665b4-2d33-41ca-ac50-fafe24ade32f@redhat.com/
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>> [patrick: rewrite shortlog for new usecase]
>> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
>> ---
>>   Documentation/filesystems/locking.rst |  2 +-
>>   fs/nfs/dir.c                          | 11 ++++++-----
>>   fs/orangefs/inode.c                   |  3 ++-
>>   include/linux/fs.h                    |  2 +-
>>   mm/filemap.c                          |  9 +++++----
>>   mm/secretmem.c                        |  3 ++-
>>   mm/vmscan.c                           |  4 ++--
>>   virt/kvm/guest_memfd.c                |  3 ++-
>>   8 files changed, 21 insertions(+), 16 deletions(-)
>>
>> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
>> index aa287ccdac2f..74c97287ec40 100644
>> --- a/Documentation/filesystems/locking.rst
>> +++ b/Documentation/filesystems/locking.rst
>> @@ -262,7 +262,7 @@ prototypes::
>>   	sector_t (*bmap)(struct address_space *, sector_t);
>>   	void (*invalidate_folio) (struct folio *, size_t start, size_t len);
>>   	bool (*release_folio)(struct folio *, gfp_t);
>> -	void (*free_folio)(struct folio *);
>> +	void (*free_folio)(struct address_space *, struct folio *);
>>   	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>>   	int (*migrate_folio)(struct address_space *, struct folio *dst,
>>   			struct folio *src, enum migrate_mode);
> 
> Beware, that is against the intent of free_folio().
> 
> Since its 2.6.37 origin in 6072d13c4293 ("Call the filesystem back
> whenever a page is removed from the page cache"), freepage() or
> free_folio() has intentionally NOT taken a struct address_space *mapping,
> because that structure may already be freed by the time free_folio() is
> called, if the last folio holding it has now been freed.

Thanks for noticing that Hugh, very good point!

> 
> Maybe something has changed since then, or maybe it happens to be safe
> just in the context in which you want to use it; but it is against the
> principle of free_folio().  (Maybe an rcu_read_lock() could be added
> in __remove_mapping() to make it safe nowadays? maybe not welcome.)

Let me dig into the callers:


1) filemap_free_folio()

filemap_free_folio() looks up the callback through 
mapping->a_ops->free_folio. Nothing happens in-between that lookup and 
the callback so we should be good.


2) replace_page_cache_folio()

replace_page_cache_folio() similarly looks up the callback through
mapping->a_ops->free_folio. We do some operations afterwards, but 
essentially store the new folio in the page cache and remove the old one.

The only caller is fuse_try_move_folio(), and IIUC both folios are 
locked, preventing concurrent truncation and the mapping going away.


3) __remove_mapping()

__remove_mapping() also looks up the callback through 
mapping->a_ops->free_folio.

Before we call free_folio() we remove the folio from the pagecache 
(__filemap_remove_folio) to then drop locks and call free_folio().

We're only holding the folio lock at that point.

So yes I agree, truncate_inode_pages_final() could be racing with
__remove_mapping().c That's probably exactly what the docs describe 
regarding reclaim.


rcu_read_lock() should indeed work, or some other mechanism that keeps 
truncate_inode_pages_final() from succeeding in this racy situation.

Alternatively I guess we would have to use another callback.

-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
