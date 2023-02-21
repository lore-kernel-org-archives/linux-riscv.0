Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45034C636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 07:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=JvwQ+h+navDNvJ1bRawKficcD2suY4JdtRfHIL7QDeU=; b=keq
	VhmyJDtG9P9PMiRmkYLPz/hxAkxEb4h8qzMG3/5xPRzvA1gN47eumiLzqStO5Q3KkSGoCtNb1TTLC
	DFWElMqzYhSVfWxd2NmrEMhKCyShTXdB4oZ3Z1BFJoCy5EWCrg5O81BO/2j+ELaCZFXHRoDQTmumI
	64dDHe/4lMALfiroMH57n9A31bM3W77ImWg3vJuQeyjZcWMyy6d4w+u7cvYIGSttpm5liwEVilLm/
	luw3U2tyl/JPSIv5rs0RGivzXxriwZTySBJxjDqUSdn0zV4xEergduMQY83SozEuz45puUOaJz3eL
	BpyrG6V0a/u9HVNYl0OIXbrtl751Vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMft-006o3G-PS; Tue, 21 Feb 2023 07:02:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMfr-006o2Q-E7
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 07:02:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5BA3EB80E69;
	Tue, 21 Feb 2023 07:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FED7C433D2;
	Tue, 21 Feb 2023 07:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676962966;
	bh=KHMXE/LYnRNjuYWIFxQpGNwDw4WhCf5BXnM9jJyFYKc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:From;
	b=Yhirujjn3Gs86md/vNl+4XmkPPjo94SNOAaKFnOQXjQX0yv6l93XMl4Rob/1p9Mz1
	 BildrxHwu/yefVQiDMIl7NerNxFloHYRyqcm2B4R4tbghBYAkiMhmCNPjpT1Od05VX
	 amluMYPMkNK+MpZbAwYf/8YLhEMvqDTzgSe3GeTjwLDOTUyttUSxZ7IKckID//bHdy
	 law45gIPLx1cUA8MzcuejYCUYm9QgN6v3pwGQeyhnP2oWDTUQKixA934HlVQ9vrnV2
	 eAmVeCjUaOlME832YphdHzsDFaUFjXu0u2WRsFWYtK5D31ISj2b1xYR7ciu0peUqlW
	 v7vDwyZ5fr6JQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v2] riscv, bpf: Add kfunc support for RV64
In-Reply-To: <80e69e73-b873-6717-fe45-a854dbdd5476@huaweicloud.com>
Date: Tue, 21 Feb 2023 08:02:43 +0100
Message-ID: <87h6vffqlo.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_230251_649148_EBED018D 
X-CRM114-Status: GOOD (  10.87  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IE9uIDIwMjMvMi8y
MCAyMjozNCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
Y2xvdWQuY29tPiB3cml0ZXM6Cj4+IAo+Pj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
LmNvbT4KPj4+Cj4+PiBBcyBhbm90aGVyIGltcG9ydGFudCBtaXNzaW5nIHBpZWNlIG9mIFJWNjQg
SklULCBrZnVuYyBhbGxvdyBicGYgcHJvZ3JhbXMKPj4+IGNhbGwga2VybmVsIGZ1bmN0aW9ucy4g
Rm9yIG5vdywgUlY2NCBpcyBzdWZmaWNpZW50IHRvIGVuYWJsZSBpdC4KPj4gCj4+IFRoYW5rcyBM
ZWh1aSEKPj4gCj4+IE1heWJlIHdlIGNhbiByZXdvcmQvbWFzc2FnZSB0aGUgY29tbWl0IG1lc3Nh
Z2UgYSBiaXQ/IFdoYXQgZG8geW91IHRoaW5rCj4+IGFib3V0IHNvbWV0aGluZyBsaWtlOgo+PiAK
Pj4gIk5vdyB0aGF0IHRoZSBCUEYgdHJhbXBvbGluZSBpcyBzdXBwb3J0ZWQgYnkgUklTQy1WLCBp
dCBpcyBwb3NzaWJsZSB0bwo+PiB1c2UgQlBGIHByb2dyYW1zIHdpdGgga2Z1bmMgY2FsbHMuCj4+
IAo+Cj4ga2Z1bmMgYW5kIGJwZiB0cmFtcG9saW5lIGFyZSBmdW5jdGlvbmFsbHkgaW5kZXBlbmRl
bnQuIGtmdW5jIFsxXSwgbGlrZSAKPiBicGYgaGVscGVyIGZ1bmN0aW9ucywgYWxsb3dzIGJwZiBw
cm9ncmFtcyB0byBjYWxsIGV4cG9ydGVkIGtlcm5lbCAKPiBmdW5jdGlvbnMsIHdoaWxlIGJwZiB0
cmFtcG9saW5lIHByb3ZpZGVzIGEgbW9yZSBlZmZpY2llbnQgd2F5IHRoYW4gCj4ga3Byb2JlIHRv
IGFjdCBhcyBhIG1lZGlhdG9yIGJldHdlZW4ga2VybmVsIGZ1bmN0aW9ucyBhbmQgYnBmIHByb2dy
YW1zLCAKPiBhbmQgYmV0d2VlbiBicGYgcHJvZ3JhbXMuCj4KPiBJbiBmYWN0LCBpdCB3YXMgYWxy
ZWFkeSBzdXBwb3J0ZWQgYmVmb3JlIHRoZSBicGYgdHJhbXBvbGluZSAKPiBpbXBsZW1lbnRhdGlv
biwgSSBqdXN0IHR1cm5lZCBpdCBvbi4KCkdvb2QgcG9pbnQuIEkgZ3Vlc3MgbXkgKGluY29ycmVj
dCkga2Z1bmMgbWVudGFsIG1vZGVsIHdhcyB0aGF0CnN0cnVjdF9vcHMgYW5kIGtmdW5jIHdlcmUg
dGlnaHRseSBjb3VwbGVkLiAoVGhlbiBhZ2Fpbiwgdy9vIHN0cnVjdF9vcHMKd29ya2luZyBrZnVu
YyBpcyBhIGJpdCBoYWxmLXdvcmtpbmcgaW4gbXkgdmlldy4pCgpGYWlyIGVub3VnaC4gSSdtIHN0
aWxsIGEgYml0IGNvbmZ1c2VkIGFib3V0IHRoZSBjb21taXQgbWVzc2FnZSwgYnV0CmhhcHB5IHdp
dGggdGhlIHBhdGNoLgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
