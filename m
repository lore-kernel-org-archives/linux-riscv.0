Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030A6CA0FED
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=So+uxVhlIAxn6Ym4aMHiK7Zs4Fht1bEVB/r2/GxeO8A=; b=x423shwVdhDMiM
	qgfvsTAxMBSjsih8Tvf+y6lu3ZLYxulIl3C9yBxAEi/lVCBQcDKST6U/F/TLlN3zRRM03eBW9tXs8
	ub/Yzghll3AXQUyBVD4VkbTVL7QEBp/Oa4yrh+fhdESrKDr5gThxif++iOG8bpzntsASMuqoDN6RD
	o2H5ioXWbCPiwB7nX6DAzMjcsNlBrK7sNkUJMSVV3uP3z+366fQkI8JnOm6WRCabuauvk+HydPFeK
	Vd/AvwsaiMlpIcXax6WaQE+RwcVzXGrKidrTB1HL+lWxz5I9hB36MHOuZvqh5qJq6tk4y+LFbiVT2
	RPtLJv0x1uiorl4A/Ldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqobH-0000000Avy2-36fu;
	Tue, 26 Aug 2025 08:00:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoNG-0000000AtaU-3N2j
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 07:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756194345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k/OuiSc8DvwL4ze5IiMvnOja29ttjPgB686MqiOHyN4=;
	b=OseGvsdgEBqUKlyO54oihSxRfd7t1AsnSumyvOfWLs/DC/RzEHLt5Bn5IzWTPk3ajNiLEM
	P4o+dygdErZk2lsL4VmDRZDJN7vR1gKRmuMik+CTE/YAOs0jL1g4IGlDYZXBJuzskBRoEj
	inRk+F5tRw9G5JB/AZRjzKrirM2n4Ew=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-G1ymScglOKiDUoxYhrTzyA-1; Tue, 26 Aug 2025 03:45:44 -0400
X-MC-Unique: G1ymScglOKiDUoxYhrTzyA-1
X-Mimecast-MFC-AGG-ID: G1ymScglOKiDUoxYhrTzyA_1756194343
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3c380aa19c1so3263230f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 00:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756194343; x=1756799143;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/OuiSc8DvwL4ze5IiMvnOja29ttjPgB686MqiOHyN4=;
        b=PTaBt7cgL6RIEXHmfbCBWzINniyX/V8jBMQulTPGMKH5prgMVVQ5KPQt4iniTMn2tT
         4ic6d6Cpyom94bI4ptEz2NmMzpXub2zp4oAKzDr5LAq3fJ3JnCBZ1jZ7Knm6vg05ljQk
         UHq1Tpdhyd0PaGY0+7CLpaagLmoMxvJ6WaDeQnd+UNbNq4i5U0a13dN8Up0Vol4qs+ts
         EEl5MCnC+8/dHovJehNCpJrV9PzRb5dcqM45lxghCyDb0kXIofURDTTnJR8nbIuinjHV
         QUazfBOaxCrnl0SzgdVSrlln9gJKVGu2ziSgoqklFItwv9OVaR9VYyzLZXI1MMtKWRCo
         L54Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwSc3J44LEcc0l84W6B2aicwmGjRuiOcpezvoDKyCmp8lR07aIklXZeuNKEyxOpTOCO0j9b7c9+rqHvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAVZS/UJhe2Vh3FN2o/kDkxIAOAPXUIjCrDV6EwcI3sPk2+ljR
	oQV9DD389IwlEH0K4YeJKfIWd2kXsOI6gqkghCVLx4v0Z6SLqwA42B83D6kFEa5M1QRvjNYBN7u
	95tyOIGCYDvGMT2QQo7KrNz4CR6/2HNe7d0IWcF81P1EEtZdypm8XQ5fl2s76cNnuWHdvIA==
X-Gm-Gg: ASbGncvMtMFZxQudTfIe89GaLBG3th6G9cwraq1uRTaimiKS0K2hnf1YNGRHfo4gzAx
	MnCExKGq0Nz5nojzd6b/bljWvce1wYPhe9JLwodEUQD+DhX3I8vplVFwsLjOxsUp7h/CZb5hg1y
	qNb+DH4+oY4BNZcSnhieK//jjwzYkVAOLQCjSVZoMmvSNeEIFBWxNVCilIIjHzujaAzTZ4cYZzD
	jUwv76hVtJDQtaINQDfUzGpnmOgZf5zVUr+XdhifkZuIC4MlkYnRW2qRkaujbou8K2JqoWFnxZa
	/4ICr67DKyCfcKfaQ9IoEEjQLzzhLyoiJghvhm9+o1GDhf5CxN6KOWEUsIcildTFitPcykMstQ=
	=
X-Received: by 2002:a05:6000:40dc:b0:3c9:38ca:2c1e with SMTP id ffacd0b85a97d-3c938ca3186mr6269524f8f.63.1756194342711;
        Tue, 26 Aug 2025 00:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUH1J19kuTuf3s2CHLvi8u0X2SupxylUeCeMPuY/SxI9i/ktTCtrSz18UCsho7ir9h8yIYxw==
X-Received: by 2002:a05:6000:40dc:b0:3c9:38ca:2c1e with SMTP id ffacd0b85a97d-3c938ca3186mr6269476f8f.63.1756194342238;
        Tue, 26 Aug 2025 00:45:42 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753503esm137958415e9.1.2025.08.26.00.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 00:45:41 -0700 (PDT)
Message-ID: <5c983e27-9220-4ef1-b5ac-0be95b37d8d8@redhat.com>
Date: Tue, 26 Aug 2025 09:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] selftests/mm: Add -Wunused family of flags
To: John Hubbard <jhubbard@nvidia.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>,
 Leon Romanovsky <leon@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, kevin.brodsky@arm.com
Cc: kernel@collabora.com
References: <20250822082145.4145617-1-usama.anjum@collabora.com>
 <20250822082145.4145617-5-usama.anjum@collabora.com>
 <4a9e0017-53a6-48dd-8e3c-774a859a28dc@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <4a9e0017-53a6-48dd-8e3c-774a859a28dc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: su10Ne5Rl6ORTIx37PiUALFL3hrEub9Vld8a26GfOoQ_1756194343
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_004546_990155_7DA0355B 
X-CRM114-Status: GOOD (  12.53  )
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

On 25.08.25 20:21, John Hubbard wrote:
> On 8/22/25 1:21 AM, Muhammad Usama Anjum wrote:
> ...
>> diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
>> index 9bc4591c7b169..4fa03679e9b07 100644
>> --- a/tools/testing/selftests/mm/compaction_test.c
>> +++ b/tools/testing/selftests/mm/compaction_test.c
>> @@ -203,7 +203,7 @@ int set_zero_hugepages(unsigned long *initial_nr_hugepages)
>>   	return ret;
>>   }
>>   
>> -int main(int argc, char **argv)
>> +int main(void)
> 
> Hi Muhammad,
> 
> This is not helpful nor desirable, in selftest code.
> 
> In fact, I think this particular patch is actually a solid
> illustration of why you probably should just abandon the -Wunused
> flag in kselftests.
> 
> Skimming through the other patches doesn't change my initial
> impression, either. This is adding churn and admin overhead,
> but for test code there is basically no benefit here. Certainly
> not enough to be worth it.

Fully agreed.

-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
