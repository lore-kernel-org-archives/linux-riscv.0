Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858E1C369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lERDQes4ZqOg06hLV6dRYFGm6DxJVMumojNv7FsEazY=; b=o0ZlgiHSQPr1y4
	6/k2voyuQ4yDmhbDPXkSiNrgLVSXVGTBNcYo2hfRert6litl0mypEqZnhLouWAXs4dvj4ntkJN3+E
	VryfZKkgdfmF4q7/aF4W1az/hB7qfW19bPvLQA7x3P5a4Cdnbdw9WE8rKggGWbSR0oul78hDxGJMt
	7YuEt5Ozp2hoik3muyegX6+5VCvlOPGMr47uJz9g6p9qQCtxDX9zcbc2hlpXNDPSO+vqA+4O9P8Rd
	uIeVvtJQ1ZYZMLQTFbsx/rHTm/mDvBadIGEqDVCpMI9EEexUcZEJK8/L6/smBG7ieZkN3PQPE+0mm
	nARPmAcY3qJOFKjY+QOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2m4R-00000009UGN-0EYj;
	Thu, 10 Apr 2025 07:11:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2laZ-00000009OzH-3YNw
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 06:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A0E96112C;
	Thu, 10 Apr 2025 06:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74181C4CEDD;
	Thu, 10 Apr 2025 06:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267238;
	bh=hRdqL+1LC2dQsAas1joXReQ92Tt1faK5vyWCOwb5DZs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cAgMKsqcbBCzRDS9LSQv4BiryjBBDuDFcbfaiirtafO14PbN2nw85d1n/FS4+7dTY
	 Wi86b8nkNiu32D4sKO/fSGOQ59tXWBBgUGOEXdX0f/1HcC0LIs1P/1G1uAEN8ZpLGy
	 kQkI2bQVzIKSavdGlHeiPC4BwMXYKVNOEXLsALUKpeLHaTZ/OxDdXeWF/c2CUub5/q
	 m7lGXL9+TNpT+4I4Qk/TyNNNc6yIgR1FpvqIjH/r0fwJgHCQTqMtd2iopPDtWXoFDp
	 9k2f888VKl55vNgUvCqGnuJ6kEmPH0J+VBykn9G3RPNsqIR45p9o5SvK3wXSuqVbtb
	 t4TUouETH+s1w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Song Shuai
 <songshuaishuai@tinylab.org>, linux-riscv@lists.infradead.org, Nick
 Kossifidis <mick@ics.forth.gr>, linux-kernel@vger.kernel.org,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Subject: Re: [External] [PATCH v3 2/2] riscv: kexec_file: Support loading
 Image binary file
In-Reply-To: <CAEEQ3wmb37Y6gOn0cC53DMJgQopcD4pf38c83AexFv+Pj7Er3w@mail.gmail.com>
References: <20250409193004.643839-1-bjorn@kernel.org>
 <20250409193004.643839-3-bjorn@kernel.org>
 <CAEEQ3wmb37Y6gOn0cC53DMJgQopcD4pf38c83AexFv+Pj7Er3w@mail.gmail.com>
Date: Thu, 10 Apr 2025 08:40:35 +0200
Message-ID: <87jz7s4izg.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

SGV5IFl1bmh1aSEKCnl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cml0ZXM6
Cgo+IEhpIEJqw7ZybiwKPgo+IE9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDM6MzHigK9BTSBCasO2
cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKCi4uLgoKPj4gKyAgICAgICBrYnVm
LmJ1ZmZlciA9IGtlcm5lbDsKPj4gKyAgICAgICBrYnVmLmJ1ZnN6ID0ga2VybmVsX2xlbjsKPj4g
KyAgICAgICBrYnVmLm1lbSA9IEtFWEVDX0JVRl9NRU1fVU5LTk9XTjsKPj4gKyAgICAgICBrYnVm
Lm1lbXN6ID0gbGU2NF90b19jcHUoaC0+aW1hZ2Vfc2l6ZSk7Cj4+ICsgICAgICAga2J1Zi5idWZf
YWxpZ24gPSBsZTY0X3RvX2NwdShoLT50ZXh0X29mZnNldCk7Cj4KPiBJdCBpcyBuZWNlc3Nhcnkg
dG8gZW5zdXJlIHRoYXQgdGhlIGtlcm5lbCBlbnRyeSBpcyBhbGlnbmVkIHRvCj4gUE1EX1NJWkU7
IG90aGVyd2lzZSwgQlVHX09OKCkgaW4gc2V0dXBfdm0oKSB3aWxsIGJlIHRyaWdnZXJlZC4KCklu
ZGVlZCwgYW5kIHRleHRfb2Zmc2V0IGlzIHRoYXQgWzFdLiBGV0lXLCB0aGUgdGV4dF9vZmZzZXQg
bmFtZSBpbiB0aGUKSW1hZ2UgaGFzIGFsd2F5cyB3ZWlyZC9jb25mdXNpbmcgdG8gbWUuCgoKQmrD
tnJuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TI240NwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
