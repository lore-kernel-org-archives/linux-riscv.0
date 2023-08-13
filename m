Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC53EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Aug 2023 20:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqPAoqs/wC3kureBJkq666upCVMDMDqAWoquzgWLl3M=; b=RMrzukdRX8gI0d
	wZuqfgk9gh9KOh4eJaomNCpvcsUSz1b0oiuLRdP3gw3p8oJ2lC9j9bjud1dKUvE/gRu+1PLJ2zNTu
	3XDvs8JT97HeThuRoIKsobGIyqipPKpaPjVLEWY3hMRKjta8KLCkMXNQnQAcFhz+Fwmni6U6q5IW4
	Gbci749sdiLM94TL4lZarw7tVJmrb2uXfyNXk9e0LcuPSB6tpMq7hCQECLHN76/p5VZCxV+AqXdhb
	wzAE3HJCofCPoy38/HS9bBOAIwUsotKldidsRjRmSiqEnetb/AidzsSjm5jf2sv6143XvML2PWrgy
	p8UKe8N3dcvpCLN6ZNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVHgw-00Fg32-1o;
	Sun, 13 Aug 2023 20:28:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVHgt-00Fg2R-2c
	for linux-riscv@lists.infradead.org;
	Sun, 13 Aug 2023 20:28:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24E146009F;
	Sun, 13 Aug 2023 20:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C93C433C7;
	Sun, 13 Aug 2023 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691958477;
	bh=UI+HJGlY4c8tNlNy8au0tYd05GI/E0b/TVdswYXHTtY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bVZ/63W9BGAGVk8mfvcdwe7q5sdVcixQXWd1gi4tiwzma7ug21CEoXTooBIjPw2kw
	 hgzPwfG5yKT+vQiJ0b4LkTN6pQMxVXng/VUJD/SvwwtXQ8joDM8m7WzZy/Zn/hUTi0
	 E6ciW5tl2Eu/Qk2EEC4mHmmzBPM+XKXIw5Txha2RFmW9Rao2oK84jCjleRQRTA1oi9
	 zpBjEKmbMmxMU7xpjT3sHr+jumZLc1As9EYOt3bXzZ+wBm43XA6Wtwv3J+zGm0p+rN
	 Q3dTY6c9ig6OkAKsrmaOhrn6qLm07AomDbUtxul8zm24616SgXrgRg2v8CKaKJR1EL
	 Lj+xCwggjTK/A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, pulehui@huawei.com,
 conor.dooley@microchip.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 kpsingh@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: Re: [PATCH bpf-next 0/2] bpf, riscv: use BPF prog pack allocator in
 BPF JIT
In-Reply-To: <20230720154941.1504-1-puranjay12@gmail.com>
References: <20230720154941.1504-1-puranjay12@gmail.com>
Date: Sun, 13 Aug 2023 22:27:54 +0200
Message-ID: <87ttt21yd1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_132759_939646_8154C4E7 
X-CRM114-Status: GOOD (  15.62  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEJQRiBwcm9n
cmFtcyBjdXJyZW50bHkgY29uc3VtZSBhIHBhZ2UgZWFjaCBvbiBSSVNDVi4gRm9yIHN5c3RlbXMg
d2l0aCBtYW55IEJQRgo+IHByb2dyYW1zLCB0aGlzIGFkZHMgc2lnbmlmaWNhbnQgcHJlc3N1cmUg
dG8gaW5zdHJ1Y3Rpb24gVExCLiBIaWdoIGlUTEIgcHJlc3N1cmUKPiB1c3VhbGx5IGNhdXNlcyBz
bG93IGRvd24gZm9yIHRoZSB3aG9sZSBzeXN0ZW0uCj4KPiBTb25nIExpdSBpbnRyb2R1Y2VkIHRo
ZSBCUEYgcHJvZyBwYWNrIGFsbG9jYXRvclsxXSB0byBtaXRpZ2F0ZSB0aGUgYWJvdmUgaXNzdWUu
Cj4gSXQgcGFja3MgbXVsdGlwbGUgQlBGIHByb2dyYW1zIGludG8gYSBzaW5nbGUgaHVnZSBwYWdl
LiBJdCBpcyBjdXJyZW50bHkgb25seQo+IGVuYWJsZWQgZm9yIHRoZSB4ODZfNjQgQlBGIEpJVC4K
Pgo+IEkgZW5hYmxlZCB0aGlzIGFsbG9jYXRvciBvbiB0aGUgQVJNNjQgQlBGIEpJVFsyXS4gSXQg
aXMgYmVpbmcgcmV2aWV3ZWQgbm93Lgo+Cj4gVGhpcyBwYXRjaCBzZXJpZXMgZW5hYmxlcyB0aGUg
QlBGIHByb2cgcGFjayBhbGxvY2F0b3IgZm9yIHRoZSBSSVNDViBCUEYgSklULgo+IFRoaXMgc2Vy
aWVzIG5lZWRzIGEgcGF0Y2hbM10gZnJvbSB0aGUgQVJNNjQgc2VyaWVzIHRvIHdvcmsuCj4KPiA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiBQ
ZXJmb3JtYW5jZSBBbmFseXNpcyBvZiBwcm9nIHBhY2sgYWxsb2NhdG9yIG9uIFJJU0NWNjQKPiA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPgo+
IFRlc3Qgc2V0dXA6Cj4gPT09PT09PT09PT0KPgo+IEhvc3QgbWFjaGluZTogRGViaWFuIEdOVS9M
aW51eCAxMSAoYnVsbHNleWUpCj4gUWVtdSBWZXJzaW9uOiBRRU1VIGVtdWxhdG9yIHZlcnNpb24g
OC4wLjMgKERlYmlhbiAxOjguMC4zK2Rmc2ctMSkKPiB1LWJvb3QtcWVtdSBWZXJzaW9uOiAyMDIz
LjA3K2Rmc2ctMQo+IG9wZW5zYmkgVmVyc2lvbjogMS4zLTEKPgo+IFRvIHRlc3QgdGhlIHBlcmZv
cm1hbmNlIG9mIHRoZSBCUEYgcHJvZyBwYWNrIGFsbG9jYXRvciBvbiBSViwgYSBzdHJlc3Nlcgo+
IHRvb2xbNF0gbGlua2VkIGJlbG93IHdhcyBidWlsdC4gVGhpcyB0b29sIGxvYWRzIDggQlBGIHBy
b2dyYW1zIG9uIHRoZSBzeXN0ZW0gYW5kCj4gdHJpZ2dlcnMgNSBvZiB0aGVtIGluIGFuIGluZmlu
aXRlIGxvb3AgYnkgZG9pbmcgc3lzdGVtIGNhbGxzLgo+Cj4gVGhlIHJ1bm5lciBzY3JpcHQgc3Rh
cnRzIDIwIGluc3RhbmNlcyBvZiB0aGUgYWJvdmUgd2hpY2ggbG9hZHMgOCoyMD0xNjAgQlBGCj4g
cHJvZ3JhbXMgb24gdGhlIHN5c3RlbSwgNSoyMD0xMDAgb2Ygd2hpY2ggYXJlIGJlaW5nIGNvbnN0
YW50bHkgdHJpZ2dlcmVkLgo+IFRoZSBzY3JpcHQgaXMgcGFzc2VkIGEgY29tbWFuZCB3aGljaCB3
b3VsZCBiZSBydW4gaW4gdGhlIGFib3ZlIGVudmlyb25tZW50Lgo+Cj4gVGhlIHNjcmlwdCB3YXMg
cnVuIHdpdGggZm9sbG93aW5nIHBlcmYgY29tbWFuZDoKPiAuL3J1bi5zaCAicGVyZiBzdGF0IC1h
IFwKPiAgICAgICAgIC1lIGlUTEItbG9hZC1taXNzZXMgXAo+ICAgICAgICAgLWUgZFRMQi1sb2Fk
LW1pc3NlcyAgXAo+ICAgICAgICAgLWUgZFRMQi1zdG9yZS1taXNzZXMgXAo+ICAgICAgICAgLWUg
aW5zdHJ1Y3Rpb25zIFwKPiAgICAgICAgIC0tdGltZW91dCA2MDAwMCIKPgo+IFRoZSBvdXRwdXQg
b2YgdGhlIGFib3ZlIGNvbW1hbmQgaXMgZGlzY3Vzc2VkIGJlbG93IGJlZm9yZSBhbmQgYWZ0ZXIg
ZW5hYmxpbmcgdGhlCj4gQlBGIHByb2cgcGFjayBhbGxvY2F0b3IuCj4KPiBUaGUgdGVzdHMgd2Vy
ZSBydW4gb24gcWVtdS1zeXN0ZW0tcmlzY3Y2NCB3aXRoIDggY3B1cywgMTZHIG1lbW9yeS4gVGhl
IHJvb3Rmcwo+IHdhcyBjcmVhdGVkIHVzaW5nIEJqb3JuJ3MgcmlzY3YtY3Jvc3MtYnVpbGRlcls1
XSBkb2NrZXIgY29udGFpbmVyIGxpbmtlZCBiZWxvdy4KCkJhY2sgaW4gdGhlIHNhZGRsZSEgU29y
cnkgZm9yIHRoZSBob3JyaWJseSBsYXRlIHJlcGx5Li4uCgpEaWQgeW91IHJ1biB0aGUgdGVzdF9w
cm9ncyBrc2VsZnRlc3QgdGVzdCwgYW5kIHBhc3NlZCB3L28gcmVncmVzc2lvbnM/IEkKcmFuIGEg
dGVzdCB3aXRob3V0L3dpdGggeW91ciBzZXJpZXMgKHBsdXMgdGhlIHBhdGNoIGZyb20gdGhlIGFy
bTY0CnNlcmllcyB0aGF0IHlvdSBwb2ludGVkIG91dCksIGFuZCBJJ20gZ2V0dGluZyByZWdyZXNz
aW9ucyB3aXRoIHRoaXMKc2VyaWVzOgoKdy9vIFN1bW1hcnk6IDMxOC8zMTE0IFBBU1NFRCwgMjcg
U0tJUFBFRCwgNjAgRkFJTEVECncvICBTdW1tYXJ5OiAyOTkvMzAyNiBQQVNTRUQsIDMzIFNLSVBQ
RUQsIDc5IEZBSUxFRAoKSSdtIGRpZCB0aGUgdGVzdCBvbiBjb21taXQgNGM3NWJmN2U0YTBlICgi
TWVyZ2UgdGFnCidrYnVpbGQtZml4ZXMtdjYuNS0yJyBvZgpnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWFzYWhpcm95L2xpbnV4LWtidWlsZCIpLgoKSSdtIHJl
LXJ1bm5pbmcsIGFuZCBpbnZlc3RpZ2F0aW5nIG5vdy4KCgpCasO2cm4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
