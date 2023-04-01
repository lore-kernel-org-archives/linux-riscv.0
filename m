Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C77C76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKsKlBW7DR5YN/ggVPKa2KRQlTOZCiX6wpyAO4xUPic=; b=30MQeOotufdlt7
	cS9wVG1cSJJvruZcBRSA6BooQ/lhZAZ1BGR9TN0wt2kUxj75yAqYOYBJJrm3lKOOStYfhkR6XUb7H
	rjaHEecVyo9OebRa6RYO5AskN9L7cJaEQQVgjfFg69i0DzAWGGMN4CCyMcZeT4/xoECkKB5h9wjzL
	8SiQ9EgkYMZ6yZPSC7BLN8Dc2XPIXeSHISmTsePNR88hKKFY/0fJSF8FQ5ztWnzhkVUkprp4DAT0v
	M0OEoPV3wgGF1Vh4/V9N3/+j1FGX/MZ5JWb8qlXUBWc2GlvtY7DjqCN5kb/RwN/LX6flRJUpDxPKm
	yYG64B3XAXa8GrIMUcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1picgF-00AjXO-1H;
	Sat, 01 Apr 2023 14:58:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1picgB-00AjWi-1q
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 14:58:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1110DB80B8B;
	Sat,  1 Apr 2023 14:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D239C433EF;
	Sat,  1 Apr 2023 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680361083;
	bh=6G88e8pww0Jmm8KfuNru+iwNiZqjL8RHu4Gh57Zku7w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SB3cj+AtUSQDwlkup/tiuAzSyLHexZM3VRq0q7k5xL09jbjtvG+dBlnLhE+QE/Z6C
	 B6BqTJOvk/UYDtYsQ5shpu8Md6fCy5NLoDGIMzIgwhxHYRGGoAALojoW7UWFgXZdpk
	 /Ntc/cZDjl1tQoDq0WVjsijfZ1AX9qq2NZNqnRZvhLq5nDhvwe4W/Pilntx7ER/Mcs
	 zAPK74Fy5q+LgsojwK896JQymBxf/+hlqx94UbxcVOaATuidZ40zni/PVasPFJK/YS
	 ctypA+glgcH8J2eVP+liWNJG+YD9dIwyJogBwtyJPVcBrgJW7SHjck9rR2SXvZdglP
	 cp4V/tArnStVw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Guo Ren
 <guoren@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, palmer@rivosinc.com,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Yipeng Zou
 <zouyipeng@huawei.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
In-Reply-To: <87edp3loai.fsf@all.your.base.are.belong.to.us>
References: <20230222033021.983168-1-guoren@kernel.org>
 <23668656.ouqheUzb2q@diego>
 <CAJF2gTSWETHhQFuE19H+RVX6Jbue+UAu8o94QoBFx65NABas1Q@mail.gmail.com>
 <2587778.7s5MMGUR32@diego> <87mt3rloyr.fsf@all.your.base.are.belong.to.us>
 <87edp3loai.fsf@all.your.base.are.belong.to.us>
Date: Sat, 01 Apr 2023 16:58:01 +0200
Message-ID: <878rfblkee.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_075807_914200_FE39A805 
X-CRM114-Status: GOOD (  16.75  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiAoTmFycm93aW5nIHRo
ZSBDYyBsaXN0LikKPgo+IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyaXRlczoK
Pgo+Pj4+ID4gPiA+IFRoaXMgaGFzIHVuZm9ydHVuYXRlbHkgYnJva2VuIGJvb3RpbmcgbXkgdXN1
YWwgTkZTIHJvb3RmcyBvbiBib3RoIG15IEQxCj4+Pj4gPiA+ID4gYW5kIEljaWNsZS4gSXQncyBv
bmUgb2YgdGhlIEZlZG9yYSBpbWFnZXMgZnJvbSBEYXZpZCwgSSB0aGluayB0aGlzIG9uZToKPj4+
PiA+ID4gPiBodHRwOi8vZmVkb3JhLnJpc2N2LnJvY2tzL2tvamlmaWxlcy93b3JrL3Rhc2tzLzM5
MzMvMTMxMzkzMy8KPj4+PiA+ID4gPgo+Pj4+ID4gPiA+IEl0IGdldHMgcHJldHR5IGZhciBpbnRv
IHRoaW5ncywgaXQncyBvbmNlIHN5c3RlbWQgaXMgb3BlcmF0aW9uYWwgdGhhdAo+Pj4+ID4gPiA+
IHRoaW5ncyBnbyBwZWFyIHNoYXBlZDoKPj4+PiA+ID4KPj4+PiA+ID4gU2hvdWxkYSBzYWlkLCBj
YW4gc2hhcmUgdGhlIGZ1bGwgbG9ncyBpZiByZXF1aXJlZCBvZiBjb3Vyc2UsIGJ1dCB0aGV5J3Jl
Cj4+Pj4gPiA+IHF1aXRlIHZlcmJvc2UgY29zIHN5c3RlbWQgZXRjLgo+Pj4+ID4KPj4+PiA+IEkg
d2FzIGp1c3QgaW52ZXN0aWdhdGluZyB0aGUgc2FtZSB0aGluZyBqdXN0IG5vdy4gU28gdGhhdCBz
YXZlcyBtZSBzb21lCj4+Pj4gPiB0cmFja2luZyBkb3duIHRoZSBjdWxwcml0IDotKSAuCj4+Pj4g
Pgo+Pj4+ID4gTXkgbWFpbiBxZW11IGlzIGxpdmluZyBhcyBhICJib2FyZCIgaW4gbXkgYm9hcmRm
YXJtIChhbHNvIGRvaW5nIG5mc3Jvb3QpCj4+Pj4gPiBhcyB3ZWxsIGFzIG15IGQxIG5lemhhIHdp
dGggbmZzcm9vdCB3YXMgYWZmZWN0ZWQuCj4+Pj4gQ2FuIHlvdSByZXByb2R1Y2UgaXQgd2l0aCBx
ZW11PyBDb3VsZCBnaXZlIG1lIHNvbWUgdGlwcyBhbmQgbGV0IG1lCj4+Pj4gcmVwcm9kdWNlIGl0
IG9uIHFlbXU/Cj4+Cj4+IEZXSVcsIEknbSBnZXR0aW5nIHRoZSBzeXN0ZW1kIGlzc3VlIHcvbyBO
RlMsIG9uIGEgcmVndWxhciA5cCB2aXJ0ZnMuCj4+Cj4+IHwgJCBzdWRvIG1tZGVic3RyYXAgLS1h
cmNoaXRlY3R1cmU9cmlzY3Y2NCBsdW5hciBydi1yb290ZnMgaHR0cDovL3BvcnRzLnVidW50dS5j
b20KPj4KPj4gYW5kIHRoZSByb290ZnMgcWVtdSBjb25maWc6Cj4+ICB8ICAtZnNkZXYgbG9jYWws
aWQ9cm9vdCxwYXRoPS9wYXRoL3RvL3J2LXJvb3Rmcy8sc2VjdXJpdHlfbW9kZWw9bm9uZSBcCj4+
ICB8ICAtZGV2aWNlIHZpcnRpby05cC1wY2ksZnNkZXY9cm9vdCxtb3VudF90YWc9L2Rldi9yb290
IFwKPj4gIHwgIC1hcHBlbmQgInJvb3Q9L2Rldi9yb290IHJ3IHJvb3Rmc3R5cGU9OXAgcm9vdGZs
YWdzPXZlcnNpb249OXAyMDAwLkwsdHJhbnM9dmlydGlvLGNhY2hlPW1tYXAsYWNjZXNzPWFueSBz
ZWN1cml0eT1ub25lIGVhcmx5Y29uIGNvbnNvbGU9dHR5MCBjb25zb2xlPXR0eVMwIgo+Cj4gSSB0
b29rIGEgY291cGxlIG9mIGRpZmZlcmVudCB2ZXJzaW9ucyBvZiB0aGUgc2VyaWVzIGZvciBhIHNw
aW4sIGFuZCBmb3IKPiBtZSBpdCBzdG9wcyB3b3JraW5nIGJldHdlZW4gdGhlc2UgdmVyc2lvbnMu
Cj4KPiAkIGdpdCBmZXRjaCBodHRwczovL2dpdGh1Yi5jb20vZ3VvcmVuODMvbGludXguZ2l0IGdl
bmVyaWNfZW50cnlfdjEyOmdlLXYxMgo+ICQgZ2l0IGZldGNoIGh0dHBzOi8vZ2l0aHViLmNvbS9n
dW9yZW44My9saW51eC5naXQgZ2VuZXJpY19lbnRyeV92MTM6ZzItdjEzCj4KPiB2MTIgaXMgaGFw
cHkgd2l0aCBzeXN0ZW1kLCB2MTMgaXMgbm90LgoKSG1tLCB0aGlzIHBhdGNoIHNlZW1zIHRvIHJl
c29sdmUgdGhlIGlzc3VlIGZvciBtZToKCi0tODwtLQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKaW5kZXggICAgICAgMWY0
ZTM3YmU3ZWIzLi44YzI1OGI3OGM5MjUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwpAQCAtMjcwLDExICsyNzAsMTEg
QEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxs
X3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAgICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewog
ICAgICAgICAgICAgICAgdWxvbmcgc3lzY2FsbCA9IHJlZ3MtPmE3OwogCi0gICAgICAgICAgICAg
ICBzeXNjYWxsID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBzeXNjYWxsKTsK
LQogICAgICAgICAgICAgICAgcmVncy0+ZXBjICs9IDQ7CiAgICAgICAgICAgICAgICByZWdzLT5v
cmlnX2EwID0gcmVncy0+YTA7CiAKKyAgICAgICAgICAgICAgIHN5c2NhbGwgPSBzeXNjYWxsX2Vu
dGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOworCiAgICAgICAgICAgICAgICBpZiAo
c3lzY2FsbCA8IE5SX3N5c2NhbGxzKQogICAgICAgICAgICAgICAgICAgICAgICBzeXNjYWxsX2hh
bmRsZXIocmVncywgc3lzY2FsbCk7CiAgICAgICAgICAgICAgICBlbHNlCi0tPjgtLQoKU2VlbXMg
bGlrZSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgY2xvYmJlciByZWdzLT5hMC4KCgpC
asO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
