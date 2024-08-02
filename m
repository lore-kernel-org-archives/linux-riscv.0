Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34DDC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 08:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2cdGCR9WHCBrNUcckV1dlggjKOmXJ4B6FgQDpw+mTU=; b=nf9dxLH5TZkG+N
	m7UaPI/wKUJBJz2ppkD/Ldeev3PJ+x9OhkTS/UmIpPKWkNLMZRUfZl8yZzOA59FViTlpEMTl1v74E
	sN5pWsaXzpACzfvqZ75MzAbOt5DX9OPJ8BXvLYiefPNbTd9N2Tvk+SXH4CI6i9fZumJPzuDy70+Br
	jQdW5nJehE88YERXY31wV1ZWQvEt/A+VLFVA7yEDqidzI++oEjtPOmBsVX2FhT/b9vNw8C5aUf+mx
	zvkAaDdLZZQEz1ErfvUjzsv0q7+QcL9S4pzu1NHVdsO9Tbo/cSkclB76nfHwtxlqXO7DVfCL4a9pK
	3scB4CUbD4EOXnXMOrNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnQn-000000084bd-3PUx;
	Fri, 02 Aug 2024 08:14:33 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnQk-000000084aX-2Bol
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 08:14:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FA65E0004;
	Fri,  2 Aug 2024 08:14:21 +0000 (UTC)
Message-ID: <4b890910-ed3b-47e1-a895-48ae3d47e958@ghiti.fr>
Date: Fri, 2 Aug 2024 10:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] dt-bindings: riscv: Add Ziccrse ISA extension
 description
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-13-alexghiti@rivosinc.com>
 <20240801-unlighted-senator-cc60d021fe28@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240801-unlighted-senator-cc60d021fe28@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_011430_741886_3199BE34 
X-CRM114-Status: GOOD (  17.21  )
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

Hi Cono

On 01/08/2024 16:44, Conor Dooley wrote:
> On Wed, Jul 31, 2024 at 09:24:04AM +0200, Alexandre Ghiti wrote:
>> Add description for the Ziccrse ISA extension which was introduced in
>> the riscv profiles specification v0.9.2.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> Reviewed-by: Guo Ren <guoren@kernel.org>
>> ---
>>   Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> index a63578b95c4a..22824dd30175 100644
>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> @@ -289,6 +289,12 @@ properties:
>>               in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
>>               riscv-isa-manual.
>>   
>> +        - const: ziccrse
>> +          description:
>> +            The standard Ziccrse extension which provides forward progress
>> +            guarantee on LR/SC sequences, as introduced in the riscv profiles
>> +            specification v0.9.2.
> Do we have a commit hash for this? Also v0.9.2? The profiles spec is a
> crock and the version depends on the specific profile - for example
> there's new tags as of last week with 0.5 in them... The original profiles
> are ratified, so if this definition is in there, please cite that
> instead of a "random" version.


That's not a "random" version, please refer to the existing tag v0.9.2 
where this was first introduced 
(https://github.com/riscv/riscv-profiles/releases/tag/v0.9.2).

But I'll change that to the profiles specification v1.0.

Thanks,

Alex


>
> Cheers,
> Conor.
>
>> +
>>           - const: zk
>>             description:
>>               The standard Zk Standard Scalar cryptography extension as ratified
>> -- 
>> 2.39.2
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
