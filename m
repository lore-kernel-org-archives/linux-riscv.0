Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCC0C531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 19:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pp67Of21J0TR8O07mXHnmWokxDAV41Su7AQl395vY14=; b=Uw34YUTR2ju8Fk
	PEvRKlK2BWpT3/jcZhilRx0YfGE715FJnv7DGLhQFKNPB2G/GT9sivJCOSXUeoh12xiYr++0QxMje
	5jsLSE0d21cNdHMmEvuOCkAREe9ya0mHaBeyBx0alZirWZmb6HARayMfV+H28iWuU/hwaPhAqfoSv
	BGADx15SJdwlh2jVCzrX65VFMwnA+0oNcSCk80ztyvujEYWeVACoNrELuIMgczG2J2pSV1kBkuY+V
	AZILyrauRhe6vODqbJSjn7pqmSkl/7PNrU0Qin33SREyglpoGR2/S5sKSoJ/xFyMwjH/H9NgciJbY
	AC1PB2EbZGX2QaYNO0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLvg-0000000HBvZ-2n89;
	Fri, 24 Jul 2026 19:51:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLvf-0000000HBvT-0kXA
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 19:51:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 730FA41A97;
	Fri, 24 Jul 2026 19:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65181F000E9;
	Fri, 24 Jul 2026 19:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784922690;
	bh=xufiH9DXV0tiDlC53cxtndN+yZzoXD3SbTD8L2MaEcU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XV1l3QmCJopHKETwzxiAgbXzhlAijMPuRFb/b3z+OHELp1gLI8eaAg5F2NaA8Uimv
	 OX0bpN696svmDT7tORfIMj+B74bhwd/JlczFOz9vp+xc/ugrzX1yfFuXlap5m28tk+
	 doaqbth7w1MA5+We8/NhMbh/1Wq0Lc7T1OfvdAGAfnSDBMVUK4fka5XWz73YJAjchs
	 7owhszZSQDsFBVFQHy9/s36SjV2XJ4G4J61taNyplS5wrtMRSiPO3nRKrzmgsPbSDG
	 TNOhJqjwuTVKFvN+35SkB9xpooPG8L4O8MpBa8d2Wkxd6jKJfgiUDJFcnBcRSXtZuR
	 Qua9UQf/o9GmA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huawei.com>, Feng Jiang <jiangfeng@kylinos.cn>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan
 <shuah@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 3/3] selftests/bpf: enable timed may_goto
 tests for riscv64
In-Reply-To: <15ceb481-ae3e-4c51-aeb7-513a3d213959@huawei.com>
References: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
 <20260723-riscv-bpf-timed-may-goto-v5-3-86acb54e5642@kylinos.cn>
 <15ceb481-ae3e-4c51-aeb7-513a3d213959@huawei.com>
Date: Fri, 24 Jul 2026 21:51:27 +0200
Message-ID: <878q70qi80.fsf@all.your.base.are.belong.to.us>
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4gd3JpdGVzOgoKPiBPbiAyMDI2LzcvMjMgMTM6
NDEsIEZlbmcgSmlhbmcgd3JvdGU6Cj4+IEVuYWJsZSB2ZXJpZmllcl9tYXlfZ290b18xIChyYXcg
aW5zdHJ1Y3Rpb24gdGVzdHMpLCBzdHJlYW1fY29uZF9icmVhawo+PiAoMjUwbXMgdGltZW91dCBw
YXRoKSwgYW5kIHRoZSBtYXlfZ290b19pbnRlcmFjdGlvbiBmYXN0Y2FsbCB0ZXN0IG9uCj4+IHJp
c2N2NjQgbm93IHRoYXQgdGhlIEpJVCBzdXBwb3J0cyB0aW1lZCBtYXlfZ290by4KPj4gCj4+IFJl
dmlld2VkLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBGZW5nIEppYW5nIDxqaWFuZ2ZlbmdAa3lsaW5vcy5jbj4KPj4gLS0tCj4+ICAgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3N0cmVhbS5jICAgICAgICAgICAgICAgIHwgMSArCj4+
ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX2JwZl9mYXN0Y2Fs
bC5jIHwgMyArKy0KPj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdmVyaWZp
ZXJfbWF5X2dvdG9fMS5jICAgfCA0ICsrKysKPj4gICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2JwZi9wcm9ncy9zdHJlYW0uYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Jw
Zi9wcm9ncy9zdHJlYW0uYwo+PiBpbmRleCA5MmJhMWQ3MmUwZWMuLjhkOGU1M2QzNzI2NiAxMDA2
NDQKPj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3N0cmVhbS5jCj4+
ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy9zdHJlYW0uYwo+PiBAQCAt
NjQsNiArNjQsNyBAQCBTRUMoInN5c2NhbGwiKQo+PiAgIF9fYXJjaF94ODZfNjQKPj4gICBfX2Fy
Y2hfYXJtNjQKPj4gICBfX2FyY2hfczM5MHgKPj4gK19fYXJjaF9yaXNjdjY0Cj4+ICAgX19zdWNj
ZXNzIF9fcmV0dmFsKDApCj4+ICAgX19zdGRlcnIoIkVSUk9SOiBUaW1lb3V0IGRldGVjdGVkIGZv
ciBtYXlfZ290byBpbnN0cnVjdGlvbiIpCj4KPgo+IFRoaXMgdGVzdCBmYWlscyBiZWNhdXNlIGl0
IHJlbGllcyBvbiBhcmNoX2JwZl9zdGFja193YWxrIHRvIGZldGNoIHRoZSAKPiBwcm9nLiBJdCdz
IGZpbmUgdG8gbGVhdmUgaXQgb24gdGhvdWdoLCBzaW5jZSBzdXBwb3J0IGlzIG9uIHRoZSB3YXku
Cj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyNjA3MjIxNDAwMTUuMTk4MjE1OC0x
LXZhcnVucm1hbGx5YUBnbWFpbC5jb20vCgpJJ20gaW5jbGluZWQgdG8gZG8gdGhlIHNhbWUgaGVy
ZSAtLSBidXQgb25seSBzaW5jZSBpdCdzIFJJU0MtViwgd2hlcmUKdGhlIHRlc3RzIGFyZSBub3Qg
cnVuIGJ5IGFueSBhdXRvbWF0aW9uIHlldC4gSW4gZ2VuZXJhbCBJICpkb24ndCogbGlrZQp0aGF0
IGEgc2VyaWVzIGludHJvZHVjZXMgYSBmYWlsaW5nIHNlbGZ0ZXN0IG1lcmVseSBiZWNhdXNlIGFu
b3RoZXIKdW5tZXJnZWQgc2VyaWVzIGlzIGV4cGVjdGVkIHRvIGZpeCBpdCBsYXRlci4KCgpCasO2
cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
