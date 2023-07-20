Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0822CC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 06:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AssU5Nnvmjl99enT1cpSztoDl9PKGkfjEyQO/Qi4zTA=; b=IuwErG4tfBOq6Z
	Jvzd3SLvDzQ+TSAFZaUHSSEBWSQSOsFi7802jD2DLP5e2WoffKMpblSiWD05GLbH4kSgCMOTrT+VP
	L8x0x4nN2QyEVj5K4MVwGeKv3/f4Fq0D1aVhi8XD7HZy+HWdV40IUmYKcAmcuf6DyaGC4gBA7bUjH
	/vBCNx8+b5jPV4R+RzKHAFdbnNvLc1wsCHFSYaQCql9Xa+MJSrE6sHSjJ1TEVRfzMkfsxpFJT5MOg
	86e0wZnBty0jiAtTZd7MoAfWJBARpzCZGP2PwnF4fa12gktPJOwan/lxK8Pfl0JLodgTcmr2T8Z+w
	cwto0qmCaecNfomOgtYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNIK-009xi0-1b;
	Thu, 20 Jul 2023 06:37:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNIH-009xhH-33
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 06:37:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B598F60DEC;
	Thu, 20 Jul 2023 06:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975B2C433C7;
	Thu, 20 Jul 2023 06:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689835064;
	bh=WAO1d9bOJCbUb/DNvoZTMUNW6vHRM+6002B/Y46guJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X3Cn2wYARSyhjih+emk8w/BnmlMuyyVrIDOF9A6AxsvEKgshgmN1XMcf+CvvOoi5H
	 qyYCeb4WHQie6th3DBjwLHOyRT+flCEm8HqqJd+PN7zrSWzZ8U1JJ/YGX5hpkSayyj
	 pooaN9Qe5ONjIrPu320OyBESzMrjnw2jLFHmlcFVMY/NYwm3zJY1hF1AjPk74bN8i5
	 7ZCSWXNtpdp2PE9bGesQqp5aYsBmyBqxNznAaRkZuNBCd1wj3ZF27btVT5w3UPfNje
	 MUQ0m1q4svlr7Gy9W1exWmidYdVCKshEWZ01HYjMvRXez9PdYF8m4F44rXmp2IXz/L
	 0ttDKeyBtJXkg==
Message-ID: <b3b3b21b-37e8-bd6f-6e4c-7ad9bd47446d@kernel.org>
Date: Thu, 20 Jul 2023 08:37:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/11] RISC-V: arch/riscv/config: enable RISC-V IOMMU
 support
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
 linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
 iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <961d125558137f7cb960de65e5f71da5d299d3bc.1689792825.git.tjeznach@rivosinc.com>
 <20230719-marbled-drivable-804aacbafee2@spud>
 <CAH2o1u4107Eve67gxEg1rtCLFyaABFsmfop1-ko=GT5wzeajiQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CAH2o1u4107Eve67gxEg1rtCLFyaABFsmfop1-ko=GT5wzeajiQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_233746_049113_CBC7336E 
X-CRM114-Status: GOOD (  11.19  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTkvMDcvMjAyMyAyMzowNywgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MTksIDIwMjMgYXQgMToyMuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4+Cj4+IE9uIFdlZCwgSnVsIDE5LCAyMDIzIGF0IDEyOjMzOjQ2UE0gLTA3MDAsIFRvbWFz
eiBKZXpuYWNoIHdyb3RlOgo+Pgo+PiAkc3ViamVjdDogUklTQy1WOiBhcmNoL3Jpc2N2L2NvbmZp
ZzogZW5hYmxlIFJJU0MtViBJT01NVSBzdXBwb3J0Cj4+Cj4+IFBsZWFzZSBsb29rIGF0IGFueSBv
dGhlciBjb21taXRzIHRvIHRoZSBmaWxlcyB5b3UgYXJlIHRvdWNoaW5nCj4+IGFuZCB1c2UgYSBz
dWJqZWN0IGxpbmUgdGhhdCBlbXVsYXRlcyB0aGVtLiBJbiB0aGlzIGNhc2UsIHRyeQo+PiBnaXQg
bG9nIC0tb25lbGluZSAtLW5vLW1lcmdlcyAtLSBhcmNoL3Jpc2N2L2NvbmZpZ3MvCj4+IFNhbWUg
Z29lcyBmb3IgdGhlIG9kZCBwYXR0ZXJuIGluIHlvdXIgZHJpdmVyIHBhdGNoZXMuCj4+Cj4+IEFs
c28sIHRoZSBwYXRjaCBtYXkgYmUgdHJpdmlhbCwgYnV0IHlvdSBzdGlsbCBuZWVkIHRvIHNpZ24g
b2ZmIG9uIGl0Cj4+IGFuZCBwcm92aWRlIGEgY29tbWl0IG1lc3NhZ2UuCj4+Cj4gCj4gYWNrLiBh
ZGRlZCB0by1kbyB0aGUgbGlzdCBmb3IgdjIuCgpQbGVhc2UgcnVuIGNoZWNrcGF0Y2ggYmVmb3Jl
IHNlbmRpbmcuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
