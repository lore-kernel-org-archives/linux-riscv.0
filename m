Return-Path: <SRS0=kt+C=4Y=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B38C10DCE
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2020 01:11:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B28206CC
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2020 01:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UOPDKOb9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="EGv7Xx0m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9B28206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:
	Message-Id:Content-Transfer-Encoding:Date:In-Reply-To:From:Subject:
	Mime-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EgkVlU+1chmZAdNkyF5q9aYrIAuysLZZez5WmPdEesQ=; b=UOPDKOb9TvndFsHhmETfXpOI6
	r2MS8vdf1u6c9LCFtXSA1XOFkC5XMVryr/9BhoqNG8zAfVz93aEEYjki4OBK56eqPVkkz++d5Qs3W
	VKv6tmbSYCY6+DaOW9Ur6/mZ3ZbsbMx/kuDACkqc6t551xhl0R2RgTumcIm87C38FpYPomSixs3ta
	wqHw9oRUwR6NBQluZqCMUfVLjN+aqrRJSPYREaWh1/1Y8MAuO6tZocOIxjITxTeLrYXjQ2vGQnGfT
	anp0ra6/nvdVlWI5dk0xyejMB1YZdDDP4bvq9YTPlUnKNzYsDBYpQBgpRWYCcXLUhYghREwJHgwKc
	Z1Yv6CzDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jANzY-0001Ii-6f; Sat, 07 Mar 2020 01:11:00 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jANzU-0001H3-Sd
 for linux-riscv@lists.infradead.org; Sat, 07 Mar 2020 01:10:58 +0000
Received: by mail-qv1-xf42.google.com with SMTP id p3so1872429qvq.0
 for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2020 17:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=EgkVlU+1chmZAdNkyF5q9aYrIAuysLZZez5WmPdEesQ=;
 b=EGv7Xx0mZhZufvegZpMUc+XHUkn93SE5ZYbqMRcl5l03s/x6c5RGn1Ma2qadFUAf7S
 mDQMjSqV0IMWb0LKZbXtHgPTizxmZGQTJdUUxxDOzRNaQofngetBXfwNZBmrbUir4STy
 e3xaR5vaUH0X/eG5wGlkW6iyRZ9+AVrlHBQUd8rTQK2YW8J6Zd2RLf0s/Z6jQ5Xya9vu
 aeJUNlgp7kS5lPRKKgCNzhDAIzhO4wqNELMKCmK5Pf7jkprIcuqhfAVWcp5Z+XuxcskU
 0FpMxIT78jjgIVAOm8sfqI2jqD5aX8zFE6cx/mP42YiyM5KNoK8iovEJATfquaQSZhHz
 6eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=EgkVlU+1chmZAdNkyF5q9aYrIAuysLZZez5WmPdEesQ=;
 b=eykqKfufNvX5UK2xkeXnYAWmpuWO0bzv9W1hBJqv79pLiZkZ89EoSTsGuEHJ0KJJs0
 nFplNBCyi0fkq8or7SELMnDZc+zPmyZEkf5catYcSs+7QjiCCAIASr4NJE9AlYgcSZtk
 6DCXhwHWUBYMDFwJjMLpIkM3Kp4kIPZINGh/1hWL/Jn8IRhLUHWoTZ6Z8KxYqF+jJMju
 qD5Ji6yXO3qPmgFFfhWVNQEbmwZwIS8BDsc/jmPD87De6V8yxtLQPdoSWePsYB0eXmmF
 VzUvD9D1lNGiyfFwuf22I/RudYYTpYN5gH9ZZtCF6jCXJ57EdZngufdQJnNQl6Nrx/3y
 3bzw==
X-Gm-Message-State: ANhLgQ2SLmJ4Iw35RtcyaJvfW25uYTSjXgUMvTfN5ANqQ/4EXeEro1wy
 km2pGuY5BzSJdV9z3dUs1kY2/w==
X-Google-Smtp-Source: ADFU+vsw52nux5Uc1WpPZ0fNtyFcwSVbVBgSYAhgVo8M+FINwP2UYIzF3QTk5i6KnfgTnuq5ecGdaA==
X-Received: by 2002:a0c:e401:: with SMTP id o1mr5556949qvl.19.1583543455511;
 Fri, 06 Mar 2020 17:10:55 -0800 (PST)
Received: from qians-mbp.fios-router.home
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id d35sm17605260qtc.21.2020.03.06.17.10.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 17:10:54 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH V15] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
In-Reply-To: <a45834bc-e6f2-ac21-de9e-1aff67d12797@arm.com>
Date: Fri, 6 Mar 2020 20:10:52 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <C65A91AB-3F70-4120-893D-2751601C0F25@lca.pw>
References: <61250cdc-f80b-2e50-5168-2ec67ec6f1e6@arm.com>
 <CEEAD95E-D468-4C58-A65B-7E8AED91168A@lca.pw>
 <a45834bc-e6f2-ac21-de9e-1aff67d12797@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_171056_928454_93A98971 
X-CRM114-Status: GOOD (  14.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



> On Mar 6, 2020, at 7:56 PM, Anshuman Khandual =
<anshuman.khandual@arm.com> wrote:
>=20
>=20
>=20
> On 03/07/2020 06:04 AM, Qian Cai wrote:
>>=20
>>=20
>>> On Mar 6, 2020, at 7:03 PM, Anshuman Khandual =
<Anshuman.Khandual@arm.com> wrote:
>>>=20
>>> Hmm, set_pte_at() function is not preferred here for these tests. =
The idea
>>> is to avoid or atleast minimize TLB/cache flushes triggered from =
these sort
>>> of 'static' tests. set_pte_at() is platform provided and could/might =
trigger
>>> these flushes or some other platform specific synchronization stuff. =
Just
>>=20
>> Why is that important for this debugging option?
>=20
> Primarily reason is to avoid TLB/cache flush instructions on the =
system
> during these tests that only involve transforming different page table
> level entries through helpers. Unless really necessary, why should it
> emit any TLB/cache flush instructions ?
>=20
>>=20
>>> wondering is there specific reason with respect to the soft lock up =
problem
>>> making it necessary to use set_pte_at() rather than a simple =
WRITE_ONCE() ?
>>=20
>> Looks at the s390 version of set_pte_at(), it has this comment,
>> vmaddr);
>>=20
>> /*
>> * Certain architectures need to do special things when PTEs
>> * within a page table are directly modified.  Thus, the following
>> * hook is made available.
>> */
>>=20
>> I can only guess that powerpc  could be the same here.
>=20
> This comment is present in multiple platforms while defining =
set_pte_at().
> Is not 'barrier()' here alone good enough ? Else what exactly =
set_pte_at()

No, barrier() is not enough.

> does as compared to WRITE_ONCE() that avoids the soft lock up, just =
trying
> to understand.

I surely can spend hours to figure which exact things in set_pte_at() is =
necessary for
pte_clear() not to stuck, and then propose a solution and possible need =
to retest on
multiple arches. I am not sure if that is a good use of my time just to =
saving
a few TLB/cache flush on a debug kernel?=

