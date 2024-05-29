Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98712C27C43
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kv5Uc9wO0qbuzVAgs0h32XblXfMRIraWpvALHlXBKvs=; b=02k0Yp9/0jO+SP
	iVmuQydlmn8Ly6FoljaDU5x+tTbc2drw6z+6dWD9VhtfwDCJcxdBzCdqZoLw/lgEOu8Wa1DYexFjP
	7CZFW8Q6kXOkHLbtptDFzZnSewSsU44plcqnSYSl2RQ+guBDE8iInl8NNttbCxAHQltJi0D9cTtGr
	0kj7TrwM1FhCCGGNr5G4EuBuYwRGFTkg2qEu1Gnf8KJqXkd2awfQiUR1ECX0mD7RuqQQFkifOKhOl
	oGa1CGDKd96MBQzyzvCACaCd6jotpvYLBaxYHmminoRjxOe6f9/WvbgPOTmHmbZWftQ3pQ7p20dUa
	BaY96Avy1gdkrcJuckYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFoR-00000003eyU-3Lmm;
	Wed, 29 May 2024 09:41:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFoO-00000003ewC-0v2B
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 09:41:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 71A6DCE16A5;
	Wed, 29 May 2024 09:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E69BC2BD10;
	Wed, 29 May 2024 09:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716975692;
	bh=uir9LFW50J4kp4Duy6Ppyxb5DdxOsTxyGiQdBZqAzR8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NghQR9GcPFym7Ye0xUvNEdcm2BliFOBrPccsChz71UUsd5/+PmDIrPK1jexIdphWz
	 k3eqy8NYXh82zI6F6JX7saXnx+mABFVAyxRfD1R+cCtP2wsOufnfA/HCitcrFF3zPC
	 4AkVP4mMFiD13IsEhcfJLGRawnKfDh27Ym1WgSPudsJuSXmseDhAbphoyMqncllW9q
	 YhqXJSRGVoCBtS3sZFBBP+T8wrlZ9H6LNypRj1pp7gnyT56ur5gynRW9ESXPklSri/
	 9l9E0a9L58NS1AwI53DoaOBc4icUAk3Z2tnP+4JO+cEEdQyevffKOj7AbpND/geAnA
	 WudziyTLhiUAw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Xiao Wang <xiao.w.wang@intel.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, luke.r.nels@gmail.com,
 xi.wang@gmail.com, daniel@iogearbox.net
Cc: ast@kernel.org, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, haicheng.li@intel.com, Xiao Wang
 <xiao.w.wang@intel.com>
Subject: Re: [PATCH bpf-next v4 2/2] riscv, bpf: Introduce shift add helper
 with Zba optimization
In-Reply-To: <20240524075543.4050464-3-xiao.w.wang@intel.com>
References: <20240524075543.4050464-1-xiao.w.wang@intel.com>
 <20240524075543.4050464-3-xiao.w.wang@intel.com>
Date: Wed, 29 May 2024 11:41:28 +0200
Message-ID: <87ikyx2bw7.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_024136_454461_9A44C61F 
X-CRM114-Status: UNSURE (   4.07  )
X-CRM114-Notice: Please train this message.
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

WGlhbywKClhpYW8gV2FuZyA8eGlhby53LndhbmdAaW50ZWwuY29tPiB3cml0ZXM6Cgo+IFpiYSBl
eHRlbnNpb24gaXMgdmVyeSB1c2VmdWwgZm9yIGdlbmVyYXRpbmcgYWRkcmVzc2VzIHRoYXQgaW5k
ZXggaW50byBhcnJheQo+IG9mIGJhc2ljIGRhdGEgdHlwZXMuIFRoaXMgcGF0Y2ggaW50cm9kdWNl
cyBzaDJhZGQgYW5kIHNoM2FkZCBoZWxwZXJzIGZvcgo+IFJWMzIgYW5kIFJWNjQgcmVzcGVjdGl2
ZWx5LCB0byBhY2NlbGVyYXRlIGFkZHJlc3NpbmcgZm9yIGFycmF5IG9mIHVuc2lnbmVkCj4gbG9u
ZyBkYXRhLgoKVGhpcyBwYXRjaGVkIHNsaXBwZWQhIEFwb2xvZ2llcyBmb3IgdGhlIHNsb3cgcmVw
bHkuCgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
