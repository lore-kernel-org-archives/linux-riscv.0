Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E237D374A2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJPHlI2rVuXE3Q5IiedoJ1pjIP457W04ZW/gGXXQ8X4=; b=K5/ig+caNoKnXo
	H9fTtjsIWAZ8ZBRBs08BEz9AbjhoaxcCAAds6z8WfUtVa/5t1RJLkOoE+EVMREljSf7/K9Zs9r8Vt
	rEhv2KUJUiscpa6oqZ+b5kyV4R+MobqEZFLr9bhE538RmYGexukfcPZXbh/faHFZjkcWQ+eWUhCj+
	bCBiaphXf+DzMWqrbRwm9aqOL4JZAvthGTGN5IJTZtsrYHDOvWFTheyWqYfz+q/pWTK8fopFdeUDN
	qgD+/6LFlF7hZ6Lq7cDT3rTPF60e5de7G1PIsQBOmvpOF+qS6MRgSdKoBb0xuDilmXaG+gfQV5Bao
	buKQqeOaLuRy6XjuOOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S9f-0000000FEgB-3mX6;
	Thu, 17 Oct 2024 15:11:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1S9c-0000000FEfb-16a5
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 15:11:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31DFFA44113;
	Thu, 17 Oct 2024 15:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5E5C4CEC3;
	Thu, 17 Oct 2024 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729177866;
	bh=SnKuZN95QP+kG5D0ecNm9ncfwWOj/8URnLFsyyX28Wo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rcECLRmHOHRc/9rUjRK95q5DTfCxfRY3bowCpKmhb7Zdj0b1zqTpt0FvAs0s3x1gu
	 rEfeey8eKtPWmUf5PN6sZl4PGnDfZKVbuB8sfdilOqT2PSPmaqztm6GsF4VC2FFnJ2
	 0fjLdn3z9DVqMsscFimh9Z1a2yt5MZAi8/vaMLLp8JnM03G6ru+Pr+KMFznsOyRx1H
	 +6IGNahTNugP15VA0DwJklm+lNxqqJdbii7K4H+7L4KF57HtnC5wZPwLvAoMnPnZ0q
	 DI4fPUF7QEtgtwU+0zclo4Df2Q4w7z28sZvhvi3wHpAkVTvmF823QiaOz7xkM0VT4+
	 4A++/tB7cQmDA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>, Andrea Parri
 <parri.andrea@gmail.com>, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 pulehui@huawei.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paulmck@kernel.org, puranjay12@gmail.com
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrea Parri <parri.andrea@gmail.com>
Subject: Re: [PATCH] riscv, bpf: Make BPF_CMPXCHG fully ordered
In-Reply-To: <mb61piktqpz25.fsf@kernel.org>
References: <20241017143628.2673894-1-parri.andrea@gmail.com>
 <mb61piktqpz25.fsf@kernel.org>
Date: Thu, 17 Oct 2024 17:11:03 +0200
Message-ID: <87iktq7ojc.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_081108_453845_87B55006 
X-CRM114-Status: UNSURE (   9.34  )
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

VGhhbmtzLCBBbmRyZWEhCgpQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXlAa2VybmVsLm9yZz4gd3Jp
dGVzOgoKPiBBbmRyZWEgUGFycmkgPHBhcnJpLmFuZHJlYUBnbWFpbC5jb20+IHdyaXRlczoKPgo+
PiBBY2NvcmRpbmcgdG8gdGhlIHByb3RvdHlwZSBmb3JtYWwgQlBGIG1lbW9yeSBjb25zaXN0ZW5j
eSBtb2RlbAo+PiBkaXNjdXNzZWQgZS5nLiBpbiBbMV0gYW5kIGZvbGxvd2luZyB0aGUgb3JkZXJp
bmcgcHJvcGVydGllcyBvZgo+PiB0aGUgQy9pbi1rZXJuZWwgbWFjcm8gYXRvbWljX2NtcHhjaGco
KSwgYSBCUEYgYXRvbWljIG9wZXJhdGlvbgo+PiB3aXRoIHRoZSBCUEZfQ01QWENIRyBtb2RpZmll
ciBpcyBmdWxseSBvcmRlcmVkLiAgSG93ZXZlciwgdGhlCj4+IGN1cnJlbnQgUklTQy1WIEpJVCBs
b3dlcmluZ3MgZmFpbCB0byBtZWV0IHN1Y2ggbWVtb3J5IG9yZGVyaW5nCj4+IHByb3BlcnR5LiAg
VGhpcyBpcyBpbGx1c3RyYXRlZCBieSB0aGUgZm9sbG93aW5nIGxpdG11cyB0ZXN0Ogo+Pgo+PiBC
UEYgQlBGX19NUCtzdWNjZXNzX2NtcHhjaGcrZmVuY2UKPj4gewo+PiAgMDpyMT14OyAwOnIzPXk7
IDA6cjU9MTsKPj4gIDE6cjI9eTsgMTpyND1mOyAxOnI3PXg7Cj4+IH0KPj4gIFAwICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgUDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDsKPj4gICoodTY0ICopKHIxICsgMCkgPSAxICAgICAgICAgICAgIHwgcjEgPSAq
KHU2NCAqKShyMiArIDApICAgICAgICAgICAgICAgICAgICAgIDsKPj4gIHIyID0gY21weGNoZ182
NCAocjMgKyAwLCByNCwgcjUpIHwgcjMgPSBhdG9taWNfZmV0Y2hfYWRkKCh1NjQgKikocjQgKyAw
KSwgcjUpIDsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgcjYgPSAqKHU2
NCAqKShyNyArIDApICAgICAgICAgICAgICAgICAgICAgIDsKPj4gZXhpc3RzICgxOnIxPTEgL1wg
MTpyNj0wKQo+Pgo+PiB3aG9zZSAiZXhpc3RzIiBjbGF1c2UgaXMgbm90IHNhdGlzZmlhYmxlIGFj
Y29yZGluZyB0byB0aGUgQlBGCj4+IG1lbW9yeSBtb2RlbC4gIFVzaW5nIHRoZSBjdXJyZW50IFJJ
U0MtViBKSVQgbG93ZXJpbmdzLCB0aGUgdGVzdAo+PiBjYW4gYmUgbWFwcGVkIHRvIHRoZSBmb2xs
b3dpbmcgUklTQy1WIGxpdG11cyB0ZXN0Ogo+Pgo+PiBSSVNDViBSSVNDVl9fTVArc3VjY2Vzc19j
bXB4Y2hnK2ZlbmNlCj4+IHsKPj4gIDA6eDE9eDsgMDp4Mz15OyAwOng1PTE7Cj4+ICAxOngyPXk7
IDE6eDQ9ZjsgMTp4Nz14Owo+PiB9Cj4+ICBQMCAgICAgICAgICAgICAgICAgfCBQMSAgICAgICAg
ICAgICAgICAgICAgICAgICAgOwo+PiAgc2QgeDUsIDAoeDEpICAgICAgIHwgbGQgeDEsIDAoeDIp
ICAgICAgICAgICAgICAgIDsKPj4gIEwwMDogICAgICAgICAgICAgICB8IGFtb2FkZC5kLmFxcmwg
eDMsIHg1LCAwKHg0KSA7Cj4+ICBsci5kIHgyLCAwKHgzKSAgICAgfCBsZCB4NiwgMCh4NykgICAg
ICAgICAgICAgICAgOwo+PiAgYm5lIHgyLCB4NCwgTDAxICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDsKPj4gIHNjLmQgeDYsIHg1LCAwKHgzKSB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA7Cj4+ICBibmUgeDYsIHg0LCBMMDAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOwo+PiAgZmVuY2UgcncsIHJ3ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDsKPj4gIEwwMTogICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA7Cj4+IGV4aXN0cyAoMTp4MT0xIC9cIDE6eDY9MCkKPj4KPj4gd2hlcmUgdGhlIHR3byBzdG9y
ZXMgaW4gUDAgY2FuIGJlIHJlb3JkZXJlZC4gIFVwZGF0ZSB0aGUgUklTQy1WCj4+IEpJVCBsb3dl
cmluZ3MvaW1wbGVtZW50YXRpb24gb2YgQlBGX0NNUFhDSEcgdG8gZW1pdCBhbiBTQyB3aXRoCj4+
IFJFTEVBU0UgKCJybCIpIGFubm90YXRpb24gaW4gb3JkZXIgdG8gbWVldCB0aGUgZXhwZWN0ZWQg
bWVtb3J5Cj4+IG9yZGVyaW5nIGd1YXJhbnRlZXMuICBUaGUgcmVzdWx0aW5nIFJJU0MtViBKSVQg
bG93ZXJpbmdzIG9mCj4+IEJQRl9DTVBYQ0hHIG1hdGNoIHRoZSBSSVNDLVYgbG93ZXJpbmdzIG9m
IHRoZSBDIGF0b21pY19jbXB4Y2hnKCkuCj4KPiBUaGFua3MgZm9yIGZpeGluZyB0aGlzLCBJIGZp
eGVkIGFsbCBvdGhlcnMgaW46Cj4KPiAyMGE3NTlkZjNiYmEgKCJyaXNjdiwgYnBmOiBtYWtlIHNv
bWUgYXRvbWljIG9wZXJhdGlvbnMgZnVsbHkgb3JkZXJlZCIpCj4KPj4gRml4ZXM6IGRkNjQyY2Ni
NDVlYyAoInJpc2N2LCBicGY6IEltcGxlbWVudCBtb3JlIGF0b21pYyBvcGVyYXRpb25zIGZvciBS
VjY0IikKPj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhIFBhcnJpIDxwYXJyaS5hbmRyZWFAZ21haWwu
Y29tPgo+Cj4gUmV2aWV3ZWQtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheUBrZXJuZWwub3Jn
PgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
