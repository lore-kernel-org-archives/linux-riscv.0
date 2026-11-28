Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC666606A323
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0JobT3/N;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=mh3ywakH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HN64lA+ECig9okQp8PYjZtl8BmHZ6X3AeB8ewui+DUw=; b=0JobT3/NxmvdHC8Vmg8Lh5qVzL
	ozU2I9mcRO5BMjXK3Q0V/7s+4xYqGFgM73osfdjESbMxPHoU7VLHjh5cpkA8Ch8o8Wu1ERiDgUvAC
	ILO0VRWZw2pILDV4bvHunguzjJvpasm374TYueUAidRwC1JAQLud60CgXk8mKypcOf2srEsv4E/MP
	whUzeWpuTdcSoEy4MNNnEMjs1rsNQVnBBcPgt8q6I5SkGok0PY+22NwKSNpMxrB+F7iGEOZDey4Uv
	9HUEy0ETszHrhEiyWMR9C9aHDk9YYcglMNGUhd5E9TWziP+wF44mEWDZNg8lCNq0/0boQo20vFFDw
	S8rWWHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF0f-00000000cBc-3Vs5;
	Sat, 28 Nov 2026 09:46:21 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF0O-00000000c6B-08kA
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 09:46:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795859137; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MXA6S8xwgPT1pT0HqddVqnOOSk5JyP0352e6/MSGVG+1MAtzOKD5KsuJ91Fx3oibidgBPFwEwz0Drfwe6Sgp4vZd+2hm+fVTUq18q3kBYVpdps5IKl0kF5LZQJp1EWbg7MxZMqAfbYi4NR4vykcYZG5URXylFqnuLS07QFCtBmM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795859137; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N1Pv9e90sqGPpxpDoeaBna5JxW1ylKtr6jEfKiV54yw=; 
	b=f5CElqCZ9I0CwSQf4paMuvYkNnHqd2zCAych16WDHYz0zSVNlKNqqYUzJfJcNBjE4cObdNREN67ku2hTut7OBjgis5H7PGC5bhNdkVfeFNF+PIVMySEokbDJf7JdYQ+TDZZV4GfJXYj4MzR3xr0xJdMocd6dmC8bPi1ls/TzKDA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=mh3ywakHBA5q8LPU08XHX+FUnPhJIBuxeVEOVI/NtpJpkJBM4WxEo8MNK9GPm3FlLTb77B6QFnRSgoh3UWq3NhabU6cJyLz6BbnO/3ZlYtGTqMGJt7uzHNv86yUrMZopxw57Cismm6Y+oKa3uvQEqtR7Fl2RfeOtjYnCvhgrx4U=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=N1Pv9e90sqGPpxpDoeaBna5JxW1ylKtr6jEfKiV54yw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795859134420900.6792305425204;
	Sat, 28 Nov 2026 01:45:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Sat, 28 Nov 2026 17:45:15 +0800
Message-Id: <DN6QXCF5LYQM.1F5IA58ETMXVM@pigmoral.tech>
Cc: "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Inochi Amaoto" <inochiama@outlook.com>, "Radu Rendec"
 <radu@rendec.net>, "Paul Walmsley" <pjw@kernel.org>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Anup
 Patel" <anup@brainfault.org>, "Guodong Xu" <docular.xu@gmail.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, "Conor
 Dooley" <conor.dooley@microchip.com>, "Bo Gan" <ganboing@gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: k3: Replace incorrect
 CLINT node with ACLINT nodes
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech>
 <yf2dawzefycxhhs7zkua3v3hoirals3wtr6rheh4li33eq7r4i@yb7cem4r6x3z>
In-Reply-To: <yf2dawzefycxhhs7zkua3v3hoirals3wtr6rheh4li33eq7r4i@yb7cem4r6x3z>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014604_479919_BFFAF1F7 
X-CRM114-Status: GOOD (  18.74  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anirudh,

On Fri Nov 27, 2026 at 1:27 PM CST, Anirudh Srinivasan wrote:
> Hi Junhui,
>
> On Fri, Sep 18, 2026 at 12:29:38AM +0800, Junhui Liu wrote:
>> The K3 implements separate ACLINT MSWI, MTIMER and SSWI devices. The
>> existing CLINT node at 0xe081c000 incorrectly describes the SSWI
>> register space in the non-secure window as a legacy CLINT.
>> 
>> The ACLINT register space is mapped at two base addresses: a secure
>> window at 0xf1810000 and a non-secure window at 0xe0810000. The
>> secure window exposes all three components, while the non-secure
>> window only exposes SSWI; the MSWI and MTIMER offsets are reserved
>> there. Moreover, depending on the eFuse configuration, the non-secure
>> window may be entirely inaccessible, whereas the secure window is
>> always available.
>> 
>> Replace the CLINT node with the three ACLINT devices, all using
>> secure-window addresses: MSWI and MTIMER for machine-level firmware
>> such as OpenSBI, and SSWI for supervisor software interrupts.
>> 
>> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  arch/riscv/boot/dts/spacemit/k3.dtsi | 43 +++++++++++++++++++++++++-----------
>>  1 file changed, 30 insertions(+), 13 deletions(-)
>> 
>> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
>> index c3f2dce0969c..74831974435e 100644
>> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
>> @@ -1261,19 +1261,6 @@ saplic: interrupt-controller@e0804000 {
>>  			riscv,num-sources = <512>;
>>  		};
>>  
>> -		clint: timer@e081c000 {
>> -			compatible = "spacemit,k3-clint", "sifive,clint0";
>> -			reg = <0x0 0xe081c000 0x0 0x4000>;
>> -			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
>> -					      <&cpu1_intc 3>, <&cpu1_intc 7>,
>> -					      <&cpu2_intc 3>, <&cpu2_intc 7>,
>> -					      <&cpu3_intc 3>, <&cpu3_intc 7>,
>> -					      <&cpu4_intc 3>, <&cpu4_intc 7>,
>> -					      <&cpu5_intc 3>, <&cpu5_intc 7>,
>> -					      <&cpu6_intc 3>, <&cpu6_intc 7>,
>> -					      <&cpu7_intc 3>, <&cpu7_intc 7>;
>> -		};
>> -
>>  		/* sec_i2c3: 0xf0614000, not available from Linux */
>>  
>>  		mimsic: interrupt-controller@f1000000 {
>> @@ -1305,5 +1292,35 @@ maplic: interrupt-controller@f1800000 {
>>  			riscv,num-sources = <512>;
>>  			status = "reserved";
>>  		};
>> +
>> +		aclint_mswi: interrupt-controller@f1810000 {
>> +			compatible = "spacemit,k3-aclint-mswi";
>> +			reg = <0x0 0xf1810000 0x0 0x4000>;
>> +			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
>> +					      <&cpu2_intc 3>, <&cpu3_intc 3>,
>> +					      <&cpu4_intc 3>, <&cpu5_intc 3>,
>> +					      <&cpu6_intc 3>, <&cpu7_intc 3>;
>> +		};
>> +
>> +		aclint_mtimer: timer@f1814000 {
>> +			compatible = "spacemit,k3-aclint-mtimer";
>
> I think you'll need to also include the "riscv,aclint-mtimer" compatible
> here so that this DT can be used with upstream OpenSBI. OpenSBI doesn't
> include the spacemit specific compatible. OpenSBI boot prints this
> currently.
>
> Platform Timer Device       : --- @ 0Hz
>

Currently, "riscv,aclint-mtimer" is not part of an upstream Linux
binding, so I don't think we should add it to the K3 DTS yet.

Your colleagues at Tenstorrent proposed adding this compatible in v3
of the Atlantis series [1], but it was dropped from v4. The v4
changelog says that the binding will be submitted separately [2].

If the binding is accepted, we can then add the generic compatible
to the K3 DTS. Otherwise, OpenSBI will need to add support for the
K3-specific compatible.

[1] https://lore.kernel.org/linux-riscv/20261109051050.105623-5-joel@jms.id.au/
[2] https://lore.kernel.org/linux-riscv/20261127061432.17306-1-joel@jms.id.au/

Best regards,
Junhui Liu

>> +			reg = <0x0 0xf1814000 0x0 0x8000>;
>> +			reg-names = "mtimecmp";
>> +			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
>> +					      <&cpu2_intc 7>, <&cpu3_intc 7>,
>> +					      <&cpu4_intc 7>, <&cpu5_intc 7>,
>> +					      <&cpu6_intc 7>, <&cpu7_intc 7>;
>> +		};
>
>
> Regards
> Anirudh Srinivasan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
