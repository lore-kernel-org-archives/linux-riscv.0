Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C259606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AksCuXeU;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=so8kePXX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ki8GfxStOPP81+mX2GRT9LNiSnv6X9rtkYFQRPp4ZDA=; b=AksCuXeUvCACE04Xz3+I1+XuoX
	MAcPDQnwqT8w4/gR/GsAfk/5rUhBl2IzJfpOnm7J75Bldefombwzqt6hwyu3I9/8SXh5bgnf0vCQl
	ql0l3xhu/Xa1C4Yw0VXUNxKdPARWOaX+F3eBy2NvdqpW6+aRt7HEzW+pkTlvJ3SDVNdDiV5LdPXKg
	1+Z3pKSQuK44+xTmpZe50yaEMX58vcGKW9ADP1gGDTy/kQoiy2v12qVvpEWLJVN8Yrlv/S+rxDgg2
	HE+2W5pee4y4UJant2nCVtMzvnTAN445xPtAMHSxrv5p0hMEv+GLLMqTchJxKm0J9pYpV/P0/tEWU
	Z9PuDZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcSE-00000008TXa-1Ryh;
	Wed, 18 Nov 2026 09:59:50 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcS8-00000008TQ1-1kSa
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 09:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794995962;
	bh=gE+8GEkhiQjCVNt58Aswex/BStQyLxbPhNALcBXdKZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=so8kePXXHRypKZVceMcjV/jbHYViLPMhOi8gOs8BP86Dvle/bVthdnNPQYDQvWCgJ
	 yVCwbiag3L9tLWVH3QBiL2dEfUL124spgbA7QWl0DJpa517ZbsaDpDHOJyGk8r8V4d
	 dMOCVHUchYnzRtk3IF3mrtJ99MQabf32zqclAi8s=
X-QQ-mid: esmtpgz13t1794995955t2c2fa096
X-QQ-Originating-IP: kXND7tW+yULMcxeWAiHy4oMknukShfEgdiMgPHresxI=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 17:59:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5513837278433707905
EX-QQ-RecipientCnt: 20
Message-ID: <361218E417AE4AE5+e47a92b4-850d-4a36-9e4b-6f5f62c8b379@linux.spacemit.com>
Date: Wed, 18 Nov 2026 17:59:12 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-7-52c3829cca69@linux.spacemit.com>
 <18756bf6-3eef-4de8-a091-c5218458fd99@kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <18756bf6-3eef-4de8-a091-c5218458fd99@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NcfXIs+Ms1qH7EEllHGrSeSohN7d2J/lmg6HBn1lBNC5NV7ipzSmg3GQ
	y0Gsm0/8d/cddtTuzcQzDeXwy6pAc5wBVP0xMX4gsRaI3twHCCKu96QeudpRjGfQXOTFQlb
	tQIeObuo8zWsNB5OJq49Wu4At06FsGUCLdKHaepuSwjDiez6GNBrTL6KdupU4WcgBGizYIc
	8pp8DhKTc6llXfr/LZTxf0y0CxM1+v+ARQyKaZJqd+NsDJgoewjAgeEylj/Z3sMw0jb81Ez
	YW1/Db8heU5HW7MzWhr7a+aea9Pr4Bqx6P7d5NJowTDPv011zN84Lw/HVrGrF7mOh925WZp
	nuCjUA1RKpNSsVyvyhsBsHunp142JJ5QcnxZo64m3e30SNoWAFun1zW5wUdZgqUJ+Fg37QT
	Yu2IjOTiryeXYmyJN536MALpzW8eS6EwB7Vnfqbcu/Ssjhtcc6TcuRh0c7VYob9oZyyTfKT
	9K2kvDTR7gZ/8CKU3xLw+OqZGuVihuKSgEQcUzjKEUmzNcP/bCHOKNnOabrb7XmV8uuEk6D
	9vwfluEtPc7grLOxuyBAY0YmWDcme8mW9XZQzYxz8DijuVV5fWJct5XIwjmruFYu7qISFSP
	zj/V5dGdqHsiz50PHKHyKW3UsrsjElvZ8xr4D2oZnO1t4tc53nxTQJl5gP/FekVDLqn6uTc
	J6EaXUKrRD8om+pWeRkW8L55JcE6OvU93isRBMDHuEezBiS2UpGDUAO0ahZOTIYqk408wjS
	h81AHht1sOlB+dGKH3AyR6tezvlANIamR9pEdXEoNIPkYzSoI33Tk5yO3gPMuzmAoQ2IvKp
	O0N5Vz8PT8EwCbCuCYKk5sghnKZjc20TDfYJ0kM77lRECdke3z0rfZIFWluVYz1OZWFUByo
	Lut+tQz/i7chQxEh2iPRC+eaS2Y4fOgvLRFnkTJtIS1zgQ4NXuSytO0AOGhQvcjzWQ19FHA
	xmctMS2bozsmRoO0A1D1pEFJnhtyUF5ibfIatgN3bRZjQBTg7lwQrIOLgiNQNgb6PDsn38J
	TFbyNbhvaPAxQ+UPeUXo/tg3olhGsKCK7uuhEBJ/NLtaiHEU+ah3eG9eHFdgE=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_015945_335541_E4211F13 
X-CRM114-Status: GOOD (  10.31  )
X-Spam-Score: 0.2 (/)
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
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/2026 4:18 PM, Krzysztof Kozlowski wrote:
> On 17/11/2026 13:38, Junzhong Pan wrote:
>> On BananaPi F3, usb2_0 is connected to a Type-C connector at device
>> mode by default. This port have no VBUS supply capability, thus host
>> mode only works with self-powered device or hub. User could switch the
>> role in sysfs.
>>
>> And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
>> support cellular modules.
>>
>> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> Reviewed-by: Yixun Lan <dlan@kernel.org>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> 
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
> 

Thanks for pointing this out! I'll split them in the next revision.

> 
> Best regards,
> Krzysztof
> 

Best regards,
Junzhong Pan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
