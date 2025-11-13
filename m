Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9E6CD98D2
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 19:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCsdpbfvJHGah0maLsNuTr5Zj0B3JCR6zOa33bPcAxU=; b=yGcxK3/+eIJcrl
	31LRsh8s7CoS2j4N0XizIoB4u3hPBGyOHhJACTynsRZlaYoKy2FkDsk6FszO0/yNV+t51/YhCx+9b
	Nrg4R3C/rBIyRs/Etk17Y7zYpmLRPddbEA47rVhvEW6uJHyRo4upP3KQE4FVX9F+Hz7DwS0gcBKim
	PGzr6Pjt/h4Fp5K1xSZN6Y1DZWmlRQwbILuztsT9CkA2BKd+DE+7+LMqp3xAa6ZF205Dn8pM03CXg
	qfR2BjACFl8Tt4OPiOtn048WVDRGTSa1g+ilBoPkbS9FuWy8VgX8TwKYak+1YXBDt68Blo8legvYE
	CrzD1OOxZnAx27H+ak/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcp2-0000000AzLY-0ARN;
	Thu, 13 Nov 2025 19:17:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcp0-0000000AzLP-3kVd
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 19:17:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23C31600C4;
	Thu, 13 Nov 2025 19:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDD1C4CEF5;
	Thu, 13 Nov 2025 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763061449;
	bh=kt1jO8UvsULEtaDs/E7EX9tnRAFarugVzSN9GuwH6ro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dvIhnU76/pW+vCvvgnPNOO2XoQTRK5+zJKW4w6KCqjeswisCxWkZpIiklY0SGPySS
	 dc4BL0IQw9fjzF4yEHDnzZhbHolCVFhMkJCDkfroC1oOYtZ1AEzdpJNIltye3ymCvr
	 EoRUENxrYwJSfHaAGwqCFp4xZkLO5vyi37LLaJudOdlSK/ZjLC+8F3TSas9cOVBxw/
	 b33BvjEkKZPiNKw/m8PlodjOhuvFQf0UXpUiKy2dufHvnPJCEUu7MAIUM+q8ZL3qRP
	 ySj9jf4v/bQJ/v3kabWXXf5WDP40v48ydCR215Lvnu4LAirAtUi8mxv+N29aZK0vi3
	 AC64p6ZBMkUBw==
Message-ID: <273b638e-8251-4faf-929a-87432a48abdc@kernel.org>
Date: Thu, 13 Nov 2025 20:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] checkpatch: Warn on page table access without
 accessors
To: Samuel Holland <samuel.holland@sifive.com>, Joe Perches
 <joe@perches.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-8-samuel.holland@sifive.com>
 <1dfa1e3566cafbe43a1d4753defef9c82ddb3b64.camel@perches.com>
 <a6e7a571-91d2-4e66-bc86-ba30f624294b@sifive.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <a6e7a571-91d2-4e66-bc86-ba30f624294b@sifive.com>
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

On 13.11.25 03:36, Samuel Holland wrote:
> On 2025-11-12 8:21 PM, Joe Perches wrote:
>> On Wed, 2025-11-12 at 17:45 -0800, Samuel Holland wrote:
>>> Architectures may have special rules for accessing the hardware page
>>> tables (for example, atomicity/ordering requirements), so the generic MM
>>> code provides the pXXp_get() and set_pXX() hooks for architectures to
>>> implement. These accessor functions are often omitted where a raw
>>> pointer dereference is believed to be safe (i.e. race-free). However,
>>> RISC-V needs to use these hooks to rewrite the page table values at
>>> read/write time on some platforms. A raw pointer dereference will no
>>> longer produce the correct value on those platforms, so the generic code
>>> must always use the accessor functions.
>> []
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> []
>>> @@ -7721,6 +7721,13 @@ sub process {
>>>   				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\n$stat\n");
>>>   			}
>>>   		}
>>> +
>>> +# check for raw dereferences of hardware page table pointers
>>> +		if ($realfile !~ m@^arch/@ &&
>>> +		    $line =~ /(?<!pte_t |p[mu4g]d_t |izeof\()\*\(?(vmf(\.|->))?(pte|p[mu4g]d)p?\b/) {
>>> +			WARN("PAGE_TABLE_ACCESSORS",
>>> +			     "Use $3p_get()/set_$3() instead of dereferencing page table pointers\n" . $herecurr);
>>> +		}
>>>   	}
>>
>> Seems like a lot of matches
>>
>> $ git grep -P '(?<!pte_t |p[mu4g]d_t |izeof\()\*\(?(vmf(\.|->))?(pte|p[mu4g]d)p?\b' | \
>>    grep -v '^arch/' | wc -l
>> 766

That is indeed concerning.

I recall that we discussed an alternative approach with Ryan in the 
past: I don't remember all the details, but essentially it was about 
using separate types, such that dereferencing would not get you the type 
the other functions would be expecting. Such that the compiler will bark 
when you try to dereference.


-- 
Cheers

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
