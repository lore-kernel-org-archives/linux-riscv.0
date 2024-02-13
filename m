Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232DFC48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gFHgCDP/VrBnuDL3WJysnUXGI8Nbe5wygoS3lxsUY8=; b=YuSWXqdezTqjIb
	EsAInUy/GP36bKfDWc8eFlweYXqbl7Qo5jOCDUayN6c81DSQIUHAsjDT+DbRtVR+46J2Q+9MJRJnC
	06ycHnI7q1B90/EjUHJ2RhQ2KQZLI02Osg+EqIz+mIalygd6kntiR9DE/QwNyxbg9uFnHzfxksOZs
	WCk6kZcrd6s2hlJ22J9YZ0dHXbhHvxqZ4Eb7KtxG9zTxol0HyxThjk/AEj9E8uvS+KJuDv77kr+dT
	u3gnTxnjZGAtcTQ/vAwUoWGiVEuAWwIKXlixkvsHEJga3tl12DErz6jBOcDQnk6k0fLXA0Y8Bp+a1
	S4sF32yJeJDPAdhIGT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwoE-0000000AB17-26x7;
	Tue, 13 Feb 2024 17:43:06 +0000
Received: from fout6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwoB-0000000AB0V-3rLg
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 17:43:05 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 51E6113800D0;
	Tue, 13 Feb 2024 12:42:58 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 13 Feb 2024 12:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707846178; x=1707932578; bh=85jyEdoLBZ
	fXHvD7lJWU0c6Qkt7S0BbhM44jabeka5g=; b=1DT8SawhP734exUuEaxNd4Iztw
	l7tRdcYL7oei/3tnIKapYPZeB3PgXr2h3Q2ogAEZqLeUwaBrhVA1cf969+DLzHLW
	XMFloDe5c5Q7xRHOKVDCVKLrOytoNQ7pSfkyl7zcmimiUVL/QSml5XgOF483BPcZ
	FHjMl3EcmQTMvbNOcQ6pa4soBVhUD+8FUqpnZwu1Rs+O+MWtxE08zrL9aQOMvc0S
	hBFZSI40SXPJBZUz/sITA6awNXw6tczr95RVXzL/2l+XSq2sYsXdPkGnJ0wrKuSR
	cZ5oeVNS9cU3dJKWLQnGXCwvKAm8ozVlGPaSzjmkM6dtT2+z2F75wWn0p0Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707846178; x=1707932578; bh=85jyEdoLBZfXHvD7lJWU0c6Qkt7S
	0BbhM44jabeka5g=; b=f5dtiXPx8oJUvW3VDum6lAzKvVcspaykwVyntLxzRzoM
	9/xdPSWKYbvWsXeI6pWPmCPze/1fF90NwxYby5u8Y9fqcUliQTqB/aLpf6SN4jxL
	oehyx6Ly+pdpZCIALTHejc2h+JevxA++ucei2g72nReKLmntQbedmlDMHvcmMqKz
	b8Cw81HRw3Giya3m4M/jvpeRvhOI+im/5bvzCX12N9+lC4EjCLk0jslYRwycfxIB
	VDeHtV4gt8UDnA9GwcvyPjHjqztbx4SEZc+BQ6R7GKS9nwywLSxA9UNhIguYejFd
	blUjL/OiEqTCvIBlL2JM/UUVkl5YVOCefjykMgOz3g==
X-ME-Sender: <xms:IqrLZWs1Tlzmx8JAkpukbu9SnBpm1wYLJ8MamB_MzQ_9WYqT_E3cfw>
    <xme:IqrLZbf85OHlFTQkqq2txNH6s_ZhJteP0btHR5dEGZFoVKbhM_fIrG-hXEUh7p7k7
    GL_vZQBP6jOCGlQFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgddutdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfufht
    vghfrghnucfqkdftvggrrhdfuceoshhorhgvrghrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepjeeuheegtdeuteeghfehjeejiefghfeifeejheduvdeugedt
    hfehvefggefgkedtnecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhorhgvrghrsehf
    rghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:IqrLZRxcoIv3FDqvRGrb_EmcIcYZs8hw83EMEZNehUXfnDv4YDKz4w>
    <xmx:IqrLZRPMu_zW81eXT-y-EzxebeF31n-Rv_wHQlMilGteCZ-V_g8Pvg>
    <xmx:IqrLZW-6Fi33AWaN5WV-i1iimn3PzkwP-lT6QevwnF_M1Jt5_TeJnQ>
    <xmx:IqrLZdnwgLsoF7XZMqKgPr1k0iQvlB-yO7fECnRvHkxKAEK293b1hA>
Feedback-ID: i84414492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 12D551700093; Tue, 13 Feb 2024 12:42:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <31024f04-e3e0-4bf9-beca-ebcd4f6fe51b@app.fastmail.com>
In-Reply-To: <20240213-limping-ether-adbdc205ebc6@spud>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-3-samuel.holland@sifive.com>
 <20240213-limping-ether-adbdc205ebc6@spud>
Date: Tue, 13 Feb 2024 12:42:37 -0500
From: "Stefan O'Rear" <sorear@fastmail.com>
To: "Conor Dooley" <conor@kernel.org>,
 "Samuel Holland" <samuel.holland@sifive.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Andrew Jones" <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes v2 2/4] dt-bindings: riscv: Add ratified privileged ISA
 versions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_094304_344745_94139962 
X-CRM114-Status: GOOD (  15.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 13, 2024, at 12:03 PM, Conor Dooley wrote:
> On Mon, Feb 12, 2024 at 07:37:33PM -0800, Samuel Holland wrote:
>> The baseline for the RISC-V privileged ISA is version 1.10. Using
>> features from newer versions of the privileged ISA requires the
>> supported version to be reported by platform firmware, either in the ISA
>> string (where the binding already accepts version numbers) or in the
>> riscv,isa-extensions property. So far two newer versions are ratified.
>> 
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>> 
>> Changes in v2:
>>  - New patch for v2
>> 
>>  .../devicetree/bindings/riscv/extensions.yaml | 20 +++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> index 63d81dc895e5..7faf22df01af 100644
>> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> @@ -121,6 +121,16 @@ properties:
>>              version of the privileged ISA specification.
>>  
>>          # multi-letter extensions, sorted alphanumerically
>
>> +        - const: sm1p11
>
> Why are we beholden to this "1p11" format of RVI's? We have free choice
> of characters here, what's stopping us using "machine-v1.11", for
> example?
>
> Thanks,
> Conor.

I'd prefer to use names that are at least somewhat recognizable, e.g. in
the profiles spec, rather than making up something from whole cloth.

-s

>
>> +          description:
>> +            The standard Machine ISA v1.11, as ratified in the 20190608
>> +            version of the privileged ISA specification.
>> +
>> +        - const: sm1p12
>> +          description:
>> +            The standard Machine ISA v1.12, as ratified in the 20211203
>> +            version of the privileged ISA specification.
>> +
>>          - const: smaia
>>            description: |
>>              The standard Smaia supervisor-level extension for the advanced
>> @@ -134,6 +144,16 @@ properties:
>>              added by other RISC-V extensions in H/S/VS/U/VU modes and as
>>              ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
>>  
>> +        - const: ss1p11
>> +          description:
>> +            The standard Supervisor ISA v1.11, as ratified in the 20190608
>> +            version of the privileged ISA specification.
>> +
>> +        - const: ss1p12
>> +          description:
>> +            The standard Supervisor ISA v1.12, as ratified in the 20211203
>> +            version of the privileged ISA specification.
>> +
>>          - const: ssaia
>>            description: |
>>              The standard Ssaia supervisor-level extension for the advanced
>> -- 
>> 2.43.0
>> 
>> 
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Attachments:
> * signature.asc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
