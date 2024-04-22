Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E3FC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 06:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5AE+PHB/jQ/8UtsvwwzsZx8D5aJyhrF67k/NiNfwig=; b=UrmBf2HfYWYS5r
	2Q0jwiidAQbYmjT7t9qER3F6D2PT/iOPuhOK5pLRlhFnNhWTk+rH6Ze5QsyCC61frKB8sd9SrARJK
	JbiUjbyLSj01eoWPIqfS1wL1PJM+6zQv3/Un3tDCqcWcN+TJos1T+YmYCDfSn5qRdWpP4xzL996v+
	dtkZGUUCbz88N+qYbRY1/V1HHliW0MLsGpNKrYqHf+j2mpDR2Jtpl3W1oPA0U7rYqxasrXFqGAlmi
	LUBtGa2ZCah8m3puk1heEr6Zae6AXKXmb22VyaZsNUK3qEF/MCiS8Nn5nk/gw9oTXHZIySCTAg8Uu
	vyuput5iBeecegCdL3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryn5D-0000000CEit-3zRl;
	Mon, 22 Apr 2024 06:23:19 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryn59-0000000CEhw-3mdK
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 06:23:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13E8240008;
	Mon, 22 Apr 2024 06:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713766990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qTFhysNt/3zWhuk9APN+XkSCHeCT2braUpoM8bTINGY=;
	b=kYEG9A3N5oVABsryFafN7bFTT6Dtj6GkdtikX8DKyrAXSNEdsxaHLrFdOz2EmKkIHZCfmA
	Q0CFA0/o4uaJSlA9qBfop3gCCHF1bhPjIA60S0J5F+QbiZWtyU8+xxWjR3M6EKWELtzyON
	bW0pz8Q8lZfpIw6g5omvxiA56R8JoSKj162nZMwLLvolDA1UI3N02sYDHjH7//uPu+FLJU
	LaCo0lzVZnj1/3HvDbGy82nhJvaPTnY3vYH6dD9cMoh7V1Zc+u1wOmA55gGVV20HbFh+Hi
	E3DHdNuTHRZCYIcJL4nICNYV+MoK78TEz+B9ztz6O3bgIwxXvTWPl7gPIT+j9g==
Message-ID: <505a8cea-5b0e-4ecf-b566-e68b37b2d4ed@bootlin.com>
Date: Mon, 22 Apr 2024 08:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: riscv: add Milk-V Duo S board
 compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chao Wei <chao.wei@sophgo.com>
References: <20240421055710.143617-1-michael.opdenacker@bootlin.com>
 <20240421055710.143617-2-michael.opdenacker@bootlin.com>
 <c30cc11a-209a-4919-a382-7588daff0d71@linaro.org>
 <b1f59075-f2b0-4f2c-aea3-bc596ac45f1c@bootlin.com>
 <71f2e031-41b0-4a47-9bdd-e8fb6334da5d@linaro.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <71f2e031-41b0-4a47-9bdd-e8fb6334da5d@linaro.org>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_232316_406876_CFF8302C 
X-CRM114-Status: GOOD (  10.79  )
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


On 4/22/24 at 06:24, Krzysztof Kozlowski wrote:
> On 21/04/2024 20:55, Michael Opdenacker wrote:
>> Hi Krzysztof
>>
>> On 4/21/24 at 16:12, Krzysztof Kozlowski wrote:
>>> On 21/04/2024 07:57, michael.opdenacker@bootlin.com wrote:
>>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>>
>>>> Document the compatible strings for the Milk-V Duo S board[1] which uses
>>>> the SOPHGO SG2000 SoC, compatible with the CV1812H SoC[2].
>>>>
>>>> Link: https://milkv.io/duo-s [1]
>>>> Link: https://en.sophgo.com/product/introduce/cv181xH.html [2]
>>>>
>>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>> ---
>>> Where is the changelog? It's v6!
>> Oops, it was in my cover letter
>> (https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/T/#t),
>> which you didn't get because of get-maintainer.pl. As the recipients are
>> patch dependent, am I supposed to describe the changes in all patches
>> and not only in the cover letter?
> If you do not send the changelog to everyone, then yes, please describe
> respective changes in each patch.

Ok, will do, thanks!

>
> It's your choice, but if you decide not to send cover letter to some
> folks, then *it does not exist* for such folks.

Well, actually, I shouldn't have let get-maintainer.pl decide for me. Is 
there a way to send the cover-letter to the union of people who will 
receive the individual patches?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
