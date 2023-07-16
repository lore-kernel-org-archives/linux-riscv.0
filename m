Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88503EB64DA
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8rbOKzrVI5URS6MtvMIDU9kgZly85tlyaDW4F7yG6w=; b=M5LolFBnys72Vy
	J/rrhckv5cIU9H2+nZhezfLRT3MNVXM4rm3LXfHAVNQPTOrte/2Xs22owxeFB7XWJ6z/MXjM9dZPJ
	RXEUj3orpdtaYaBv9s8dGh7OMBdSbynwgPoi1wTcNNJI/VV6XBeOZP/3rKpj0Y1+Fy2mQtNgNivaQ
	VmfgF9Iy5lFz5c4Q+yHYXH9lJNe/tFvZ+GkTlpc+xOmY8M66o+m7NI4bGsQUY+u5JGPvDfN/wMaxv
	SH0EGPzoNChwmCayhyJ6gTLTXAOFSQcX4o06aqHA3CoM127PAdzvhUW6ughm+DHY8hSlN/DLkp6KT
	496S9+LPuq0Zr35Kmhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKwu9-00AL1D-0I;
	Sun, 16 Jul 2023 08:14:57 +0000
Received: from 1.mo581.mail-out.ovh.net ([178.33.45.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKwu4-00AL0F-1v
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 08:14:55 +0000
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.20.237])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 56FFE26210
	for <linux-riscv@lists.infradead.org>; Sun, 16 Jul 2023 08:14:42 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mrj8j (unknown [10.111.208.242])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 99ADF1FD27;
	Sun, 16 Jul 2023 08:14:41 +0000 (UTC)
Received: from courmont.net ([37.59.142.101])
	by ghost-submission-6684bf9d7b-mrj8j with ESMTPSA
	id cq+yIfGms2S5WQAA6+Cy+A
	(envelope-from <remi@remlab.net>); Sun, 16 Jul 2023 08:14:41 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004a0c16907-66a8-4560-aeaa-72d5ba9cf500,
                    9A40DBAC776A0F14B495AFA9937DD4B5A62724A9) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] riscv: stack: Fixup independent irq stack for
 CONFIG_FRAME_POINTER=n
Date: Sun, 16 Jul 2023 11:14:40 +0300
Message-ID: <5540704.q0sY26EuUQ@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230716001506.3506041-2-guoren@kernel.org>
References: <20230716001506.3506041-1-guoren@kernel.org>
 <20230716001506.3506041-2-guoren@kernel.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12029677557349816795
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrgedtgddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkfhojghfggfgtgesthhqredttddtjeenucfhrhhomheptformhhiucffvghnihhsqdevohhurhhmohhnthcuoehrvghmihesrhgvmhhlrggsrdhnvghtqeenucggtffrrghtthgvrhhnpeffgedthfegveefhffhffehvddtvdetgfelveeuueekkeetvefgtdfgffdvhfegveenucffohhmrghinheprhgvmhhlrggsrdhnvghtnecukfhppeduvdejrddtrddtrddupdekjedrledvrdduleegrdekkedpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrvghmihesrhgvmhhlrggsrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_011452_837393_A6D8EFF5 
X-CRM114-Status: GOOD (  11.57  )
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

TGUgc3VubnVudGFpbmEgMTYuIGhlaW7DpGt1dXRhIDIwMjMsIDMuMTUuMDUgRUVTVCBndW9yZW5A
a2VybmVsLm9yZyBhIMOpY3JpdCA6Cj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJh
YmEuY29tPgo+IAo+IFRoZSBpbmRlcGVuZGVudCBpcnEgc3RhY2sgdXNlcyBzMCB0byBzYXZlICYg
cmVzdG9yZSBzcCwgYnV0IHMwIHdvdWxkIGJlCj4gY29ycnVwdGVkIHdoZW4gQ09ORklHX0ZSQU1F
X1BPSU5URVI9bi4gU28gYWRkIHMwIGluIHRoZSBjbG9iYmVyIGxpc3QgdG8KPiBmaXggdGhlIHBy
b2JsZW0uCgpJc24ndCBpdCAqYWx3YXlzKiBjb3JydXB0ZWQ/IFNob3VsZG4ndCB0aGUgY2xvYmJl
ciBiZSBhbHdheXMgdGhlcmU/IEFtIEkgCmd1ZXNzaW5nIHRoYXQgdGhlIGNvbXBpbGVyIHdoaW5l
IHRoYXQgeW91IGNhbid0IG1hcmsgdGhlIGZyYW1lIHBvaW50ZXIgYXMgCmNsb2JiZXJlZD8gSWYg
c28sIGl0IHdvdWxkIGJlIHdvcnRoIG1lbnRpb25pbmcgaW4gdGhlIGNvbW1pdCBsb2csIElNTy4K
Cj4gRml4ZXM6IDE2M2U3NmNjNmVmNCAoInJpc2N2OiBzdGFjazogU3VwcG9ydCBIQVZFX0lSUV9F
WElUX09OX0lSUV9TVEFDSyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBSZXBvcnRl
ZC1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMg
fCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
Cj4gaW5kZXggZjkxMGRmY2NiZjVkLi45MjczNDdhMTk4NDcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBA
QCAtMzcyLDYgKzM3Miw5IEBAIGFzbWxpbmthZ2Ugdm9pZCBub2luc3RyIGRvX2lycShzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPiAKPiAgCQk6IFtzcF0gInIiIChzcCksIFtyZWdzXSAiciIgKHJlZ3Mp
Cj4gIAkJOiAiYTAiLCAiYTEiLCAiYTIiLCAiYTMiLCAiYTQiLCAiYTUiLCAiYTYiLCAiYTciLAo+
IAo+ICAJCSAgInQwIiwgInQxIiwgInQyIiwgInQzIiwgInQ0IiwgInQ1IiwgInQ2IiwKPiArI2lm
bmRlZiBDT05GSUdfRlJBTUVfUE9JTlRFUgo+ICsJCSAgInMwIiwKPiArI2VuZGlmCj4gIAkJICAi
bWVtb3J5Iik7Cj4gIAl9IGVsc2UKPiAgI2VuZGlmCgoKLS0gCuODrOODn+ODu+ODh+ODiy3jgq/j
g7zjg6vjg6Ljg7MKaHR0cDovL3d3dy5yZW1sYWIubmV0LwoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
