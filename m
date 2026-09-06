Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D68C79F9F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9V6k4RumLW35+J7jgjX21zkCdAzwCUJEw6Y5bO1JZ0=; b=q0b/UTk+2C3eyA
	4DPPzdFxL2XUJ+PUn5N7W5d+nHa0Z2aT9VKf2kJWQSKc31PcobDDz11l/ynbCxiq7P6uCi+1Wn3Z7
	YFvVJn4ru5rkikuatCB7EL/3B4P0Rur4jSGHJPu6r/2rNQNU86CihhVeEQCwN/6xvXquOEt6EQ0Xt
	WRWfjaPTy9BttrRNEsDrH9qF6djjWjraS/sjmD2yv3nkNnlmWS2Ur+JXDA3Hp826sHYelHrtXGqZJ
	kypgzB89lJLwFCCOrcwrCWwIWF/vsR20xHxTxoKU5gn4Ox+q1p5tR6BkRaYUqRS6GkNpELHMin4s7
	/g4yK7cR1Veq9sDuAPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3DlK-0000000558X-1Ysg;
	Sun, 06 Sep 2026 14:22:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3DlJ-0000000558O-1PtA
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 14:22:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C239B60142;
	Sun,  6 Sep 2026 14:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8ECD1F00A3A;
	Sun,  6 Sep 2026 14:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788704544;
	bh=+iuN3pHM7H7qaeZ7YQCVLQF26/aiYKUGjIlZGSFrPeY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mZblscgqbwUkobSCBQptaHGtuReGM+jExs45B99PBXQoXDaGzn771F7+2rKb3Iq79
	 fVuBrYKLUItbDAceDIVYCP2rSzRC97TnWRaaGpsDM+c2dX3Q3pnsmSF/TFknm7BsUg
	 bWjn6hjOm7BoEAYhPZ2cpjQh3lfugiVRdfVPY5DNsvMx6K9ALszieAF3pawIh/cLSY
	 N9h11JVeEoytR+1Jy2X8WRXH/2yeidn96dlu45DXKxWJMP9X/MtA579qJmG4a3UYkR
	 AP6F21Z+8AGFxC9Atjmwr/7ZZWfAVrFUvDHWBAr3iwLAuHf+b8axppN+3oXBH5YkkT
	 6GxTUzp2mooIg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Feng Jiang
 <jiangfeng@kylinos.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard
 Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre
 Ghiti <alex@ghiti.fr>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v5 0/3] Add bpf stack arguments support for RV64
In-Reply-To: <20260905085857.14143-1-pulehui@huaweicloud.com>
References: <20260905085857.14143-1-pulehui@huaweicloud.com>
Date: Sun, 06 Sep 2026 16:22:21 +0200
Message-ID: <87zexuo3xe.fsf@all.your.base.are.belong.to.us>
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEltcGxlbWVudCBi
cGZfaml0X3N1cHBvcnRzX3N0YWNrX2FyZ3MoKSBvbiBSVjY0IEpJVCB0byBhbGxvdyBicGYKPiBz
dWJwcm9ncyBhbmQga2Z1bmNzIHRvIHBhc3MgYW5kIHJlY2VpdmUgbW9yZSB0aGFuIDUgYXJndW1l
bnRzLgo+Cj4gVGVzdGVkIG9uIHJpc2N2NjQgUUVNVSB3aXRoIExMVk0gbWFpbiBbMV07IEJQRi10
by1CUEYgYW5kIGtmdW5jCj4gc2VsZnRlc3RzIHBhc3MuCj4KPiBbMV0gaHR0cHM6Ly9naXRodWIu
Y29tL2xsdm0vbGx2bS1wcm9qZWN0L3B1bGwvMTg5MDYwCj4KPiAtLS0KPiBDaGFuZ2VzIGluIHY1
Ogo+IC0gQWRkIFJWX0VYVFJBX1NUS19BUkdTIG1hY3JvIHRvIHJlcHJlc2VudCB0aGUgZXhjZWVk
aW5nIHN0YWNrIGFyZ3MKPiAgIHBhc3NlZCBpbiByaXNjdiBhcmcgcmVncy4gKEJQRiBDSSkKPiAt
IE9wdGltaXplIGVtaXRfc3RhY2tfYXJnX3N0KCkgYnkgbWF0ZXJpYWxpemluZyBpbW1lZGlhdGVz
IGRpcmVjdGx5Cj4gICBpbnRvIGRlc3RpbmF0aW9uIHJlZ2lzdGVycy4gKEJQRiBDSSkKPiAtIFVw
ZGF0ZSBzdGFsZSBjb21tZW50cy4gKEJQRiBDSSBhbmQgc2FzaGlrbykKPgo+IENoYW5nZXMgaW4g
djQ6Cj4gLSBSZW1hcCBCUEZfUkVHXzAgYW5kIFJWX1JFR19UQ0MgdG8gYWxpZ24gdGhlIGNhbGxp
bmcgY29udmVudGlvbiBvZgo+ICAgYnBmMmJwZiBhbmQga2Z1bmMgY2FsbHMgd2l0aCB0aGUgcmlz
Y3YgYWJpLgo+IC0gQWRhcHQgdGhlIGJwZiBzdGFjayBhcmd1bWVudHMgaW1wbGVtZW50YXRpb24g
YmFzZWQgb24gY2hhbmdlIDEuCj4KPiBDaGFuZ2VzIGluIHYzOgo+IC0gRHJvcCB0aGUgZXhjZXB0
aW9ucy5jIGd1YXJkIGNoYW5nZTogdGhlIGd1YXJkZWQgcHJvZ3JhbXMgdXNlCj4gICBicGZfdGhy
b3coKSwgdW5zdXBwb3J0ZWQgYnkgdGhlIFJWNjQgSklULCBzbyB0aGUgdGVzdCBpcyBkZW55bGlz
dGVkCj4gICBvbiByaXNjdjY0IGFuZCB0aGUgZ3VhcmQgaGFzIG5vIGVmZmVjdC4gKEJQRiBDSSkK
PiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA4MTMtYnBmLXJp
c2N2LXN0YWNrLWFyZ3MtdjItMC1lZmVhOGY5YjNmZTFAa3lsaW5vcy5jbgo+Cj4gQ2hhbmdlcyBp
biB2MjoKPiAtIFNpZ24tZXh0ZW5kIDMyLWJpdCBrZnVuYyBhcmd1bWVudHMgcGFzc2VkIG9uIHRo
ZSBzdGFjayAoYXJncyA5KyksCj4gICBtYXRjaGluZyB0aGUgcmVnaXN0ZXIgcGF0aCBhbmQgdGhl
IFJJU0MtViBwc0FCSS4gKFNhc2hpa28pCj4gLSBSZXN0cmljdCB0aGUgcmlzY3Ygc2VsZnRlc3Qg
Z3VhcmQgdG8gX19yaXNjdl94bGVuID09IDY0IHNvIHRoZQo+ICAgdGVzdHMgYXJlIG5vdCBlbmFi
bGVkIG9uIFJWMzIuIChTYXNoaWtvKQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI2MDgxMi1icGYtcmlzY3Ytc3RhY2stYXJncy12MS0wLTY3YjI0NjgwNmU1OUBr
eWxpbm9zLmNuCj4KPiBGZW5nIEppYW5nICgyKToKPiAgIHJpc2N2LCBicGY6IEFkZCBCUEYgc3Rh
Y2sgYXJndW1lbnRzIHN1cHBvcnQgZm9yIFJWNjQgSklUCj4gICBzZWxmdGVzdHMvYnBmOiBFbmFi
bGUgc3RhY2sgYXJndW1lbnQgdGVzdHMgZm9yIFJWNjQKPgo+IFB1IExlaHVpICgxKToKPiAgIHJp
c2N2LCBicGY6IFJlbWFwIEJQRl9SRUdfMCBhbmQgUlZfUkVHX1RDQwoKVGhhbmtzIQoKRm9yIHRo
ZSBzZXJpZXM6CgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
