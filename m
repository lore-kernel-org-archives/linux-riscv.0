Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639DDCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AVH3mgHe7xBzbFOzUDXJgoxpHeqGHLU/mX2UBzoR8Q=; b=wnfvDfYKF6+r5M
	mXGLVr2KSingcVZ03+hh/9DztFolYPuj6MRWA085+f7Y07jcyN+YffMb2/MZlvw81WG7ns7eRdKuP
	KZLB7MG1xn+QIP6IOl5MYaRvQ5gkcH7JaPu9Hu37LuQFMbahX+KNo564LCno9ZUA9B6TYv0/m/345
	7m8bUt0ALazWQOedMvntQgn0v3sN3Ec53xCCBPg5hF5PpYszPmmEdzzpS825H0d7PotUIIlVxIv0J
	pehDXH0G5i2Oa5e0MiLUTWVuAXRtzzuex+2rop8d6wt3vnSVHyFRWdt/25c7I9eLPV9j8pAcMM4ku
	43fV/SrIzwTgwB6PV4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrf4u-0000000BZJu-43pi;
	Tue, 02 Apr 2024 14:25:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrf4r-0000000BZIo-3RmQ
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 14:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A634CE1B1F;
	Tue,  2 Apr 2024 14:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FECC433F1;
	Tue,  2 Apr 2024 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712067927;
	bh=05KPAcK7dAHejAqXCS3gStMEGMQcesXYI/mYO3QHKbg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aTMpo1PZGrw4qjemIspGevm8YLHd2f/XrXbhGu3W9kgoM99qOUtJWV0Q8wTv7foSh
	 IxUF/IdqAwa09OU7wlFmkoL0wH1VLwZ1GjlU/FnLR3kODxIL7BcswcOFUNt/J8kL/N
	 1SCMR5XQxyX9jJvyECbCP3cuVoZq4T6iAi/CFNB9W1eonl2PZYx+sGPhB70uFlUsqr
	 FSHsrn9UzLA2ljcisrcmoyCiH8vwodEUACVpX8gDOpdT3yr73f7bbnu84lL4GLjtrb
	 C5u8/sWIZnRDlnKnUvP8M2sya7/64U8HFSKg0+OlrqPS6q16Y1euvumdy7mtWOA69f
	 0RmSF7TtmDAug==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, Stefan O'Rear <sorear@fastmail.com>,
 Conor Dooley <conor@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko
 <mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
In-Reply-To: <ed3debc9-f2a9-41fb-9cf9-dc6419de5c01@huaweicloud.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <ed3debc9-f2a9-41fb-9cf9-dc6419de5c01@huaweicloud.com>
Date: Tue, 02 Apr 2024 16:25:24 +0200
Message-ID: <87cyr7rgdn.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_072530_237203_05104B4F 
X-CRM114-Status: GOOD (  11.54  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IE9uIDIwMjQvMy8y
OSA2OjA3LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+IE9uIFRodSwgTWFyIDI4LCAyMDI0IGF0IDAz
OjM0OjMxUE0gLTA0MDAsIFN0ZWZhbiBPJ1JlYXIgd3JvdGU6Cj4+PiBPbiBUaHUsIE1hciAyOCwg
MjAyNCwgYXQgODo0OSBBTSwgUHUgTGVodWkgd3JvdGU6Cj4+Pj4gRnJvbTogUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpLmNvbT4KPj4+Pgo+Pj4+IFRoaXMgcGF0Y2ggcmVsYXhlcyB0aGUgcmVzdHJp
Y3Rpb25zIG9uIHRoZSBaYmIgaW5zdHJ1Y3Rpb25zLiBUaGUgaGFyZHdhcmUKPj4+PiBpcyBjYXBh
YmxlIG9mIHJlY29nbml6aW5nIHRoZSBaYmIgaW5zdHJ1Y3Rpb25zIGluZGVwZW5kZW50bHksIGVs
aW1pbmF0aW5nCj4+Pj4gdGhlIG5lZWQgZm9yIHJlbGlhbmNlIG9uIGtlcm5lbCBjb21waWxlIGNv
bmZpZ3VyYXRpb25zLgo+Pj4KPj4+IFRoaXMgZG9lc24ndCBtYWtlIHNlbnNlIHRvIG1lLgo+PiAK
Pj4gSXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIG1lIGVpdGhlci4gT2YgY291cnNlIHRoZSBoYXJk
d2FyZSdzIGNhcGFiaWxpdHkKPj4gdG8gdW5kZXJzdGFuZCBhbiBpbnN0cnVjdGlvbiBpcyBpbmRl
cGVuZGVudCBvZiB3aGV0aGVyIG9yIG5vdCBhCj4+IHRvb2xjaGFpbiBpcyBjYXBhYmxlIG9mIGFj
dHVhbGx5IGVtaXR0aW5nIHRoZSBpbnN0cnVjdGlvbi4KPj4gCj4+PiBSSVNDVl9JU0FfWkJCIGlz
IGRlZmluZWQgYXM6Cj4+Pgo+Pj4gICAgICAgICAgICAgQWRkcyBzdXBwb3J0IHRvIGR5bmFtaWNh
bGx5IGRldGVjdCB0aGUgcHJlc2VuY2Ugb2YgdGhlIFpCQgo+Pj4gICAgICAgICAgICAgZXh0ZW5z
aW9uIChiYXNpYyBiaXQgbWFuaXB1bGF0aW9uKSBhbmQgZW5hYmxlIGl0cyB1c2FnZS4KPj4+Cj4+
PiBJbiBvdGhlciB3b3JkcywgUklTQ1ZfSVNBX1pCQj1uIHNob3VsZCBkaXNhYmxlIGV2ZXJ5dGhp
bmcgdGhhdCBhdHRlbXB0cwo+Pj4gdG8gZGV0ZWN0IFpiYiBhdCBydW50aW1lLiBJdCBpcyBtb3N0
bHkgcmVsZXZhbnQgZm9yIGNvZGUgc2l6ZSByZWR1Y3Rpb24sCj4+PiB3aGljaCBpcyByZWxldmFu
dCBmb3IgQlBGIHNpbmNlIGlmIFJJU0NWX0lTQV9aQkI9biBhbGwgcnZ6YmJfZW5hYmxlZCgpCj4+
PiBjaGVja3MgY2FuIGJlIGNvbnN0YW50LWZvbGRlZC4KPgo+IFRoYW5rcyBmb3IgcmV2aWV3LiBN
eSBpbml0aWFsIHRob3VnaHQgd2FzIHRoZSBzYW1lIGFzIHlvdXJzLCBidXQgYWZ0ZXIgCj4gZGlz
Y3Vzc2lvbnMgWzBdIGFuZCB0ZXN0IHZlcmlmaWNhdGlvbnMsIHRoZSBoYXJkd2FyZSBjYW4gaW5k
ZWVkIAo+IHJlY29nbml6ZSB0aGUgemJiIGluc3RydWN0aW9uIGV2ZW4gaWYgdGhlIGtlcm5lbCBo
YXMgbm90IGVuYWJsZWQgCj4gQ09ORklHX1JJU0NWX0lTQV9aQkIuIEFzIENvbm9yIG1lbnRpb25l
ZCwgd2UgYXJlIGp1c3QgYWN0aW5nIGFzIGEgSklUIHRvIAo+IGVtaXQgemJiIGluc3RydWN0aW9u
IGhlcmUuIE1heWJlIGlzX2h3X3piYl9jYXBhYmxlKCkgd2lsbCBiZSBiZXR0ZXI/CgpJIHN0aWxs
IHRoaW5rIExlaHVpJ3MgcGF0Y2ggaXMgY29ycmVjdDsgQnVpbGRpbmcgYSBrZXJuZWwgdGhhdCBj
YW4gYm9vdApvbiBtdWx0aXBsZSBwbGF0Zm9ybXMgKHcvIG9yIHcvbyBaYmIgc3VwcG9ydCkgYW5k
IG5vdCBoYXZpbmcgWmJiIGluc24gaW4KdGhlIGtlcm5lbCBwcm9wZXIsIGFuZCBpZmYgWmJiIGlz
IGF2YWlsYWJsZSBhdCBydW4tdGltZSB0aGUgQlBGIEpJVCB3aWxsCmVtaXQgWmJiLgoKRm9yIHRo
ZXNlIGtpbmQgb2Ygb3B0aW1pemF0aW9ucywgKElNTykgaXQncyBiZXR0ZXIgdG8gbGV0IHRoZSBC
UEYgSklUCmRlY2lkZSBhdCBydW4tdGltZS4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
