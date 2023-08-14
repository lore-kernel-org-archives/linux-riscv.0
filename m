Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38E9C001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTldO4TLCJv7/sXiTcuIs7XgGggs/xEibc5GjB43bJc=; b=QNsFokigZf4e1l
	ZeMtpVfNzeYgnQsCPBq9VP4hK98irgfZOYqiukKh8qZhWWxq6SkwAu8M0ER59hQt4cqBg34WFgDdo
	PqAAMLAttlG2l5a1QCeONj1iRdqSvGdLdTv/1bU626Ci7F0fNpshpxcKiafA6Hpk519A66YNe3LA3
	3OQYfaZ37aRDoTIsW3exeT4iGS9o0kRfnTA7LWABOLqH240/MANIVVSWMf1iFr+CsMCvd0GyikC2+
	cbIUHDRRDaVGc5m52swDp2Mjo+OSEFKTjLHzdW95Se6pWwiKu2f0DXK33tYH7VdMkNB/hM0QSrAHf
	nF4ZOP/tBHWyBo52bLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVWlv-00H3ep-0B;
	Mon, 14 Aug 2023 12:34:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVWls-00H3eU-2K
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 12:34:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9117F647E8;
	Mon, 14 Aug 2023 12:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A5AC433C8;
	Mon, 14 Aug 2023 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692016447;
	bh=t71erLmdjDETQFMozOa5QiuBONUPlCTO6eXNRPYpsaQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pJ3RlT5N10HvSfKcd/fgnkpycLpBYhyLanjgHlWoH8pNrUcTNHEDLKexj1+G6810c
	 djt2PQGj+NHmGBig8UMSPsqfsKk4WDWJDGfcAry8Vxrr0AFf0j9/zQtgmnTtkuUHmf
	 Lllm0o0Zp3P0/811gPu9W4XCpyiPB043JF9xEqT2SQK/frqVhcfeKMleDiLGcLF03N
	 It1tFoKOk4gsTVFTkJ9jIIdozSFmArNSDDPPpU+rwRRrxjcrVWf8WeSwxw1o2WGp5T
	 7MYh1YwqT9LHD1WUR2dfG7CNOJl+nwE4HGutVSMDqAX7enITVGi0MNtk51Y+hWJ/wD
	 C12gwixr6U3Pw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Luke Nelson <lukenels@cs.washington.edu>, bpf@vger.kernel.org
Cc: Luke Nelson <luke.r.nels@gmail.com>, kernel test robot <lkp@intel.com>,
 Xi Wang <xi.wang@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] riscv/bpf: Fix truncated immediate warning in
 rv_s_insn
In-Reply-To: <20230727024931.17156-1-luke.r.nels@gmail.com>
References: <20230727024931.17156-1-luke.r.nels@gmail.com>
Date: Mon, 14 Aug 2023 14:34:04 +0200
Message-ID: <87edk5g5vn.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_053408_845041_31FFC1A5 
X-CRM114-Status: GOOD (  19.13  )
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

THVrZSBOZWxzb24gPGx1a2VuZWxzQGNzLndhc2hpbmd0b24uZWR1PiB3cml0ZXM6Cgo+IFNwYXJz
ZSB3YXJucyB0aGF0IGEgY2FzdCBpbiBydl9zX2luc24gdHJ1bmNhdGVzIGJpdHMgZnJvbSB0aGUg
Y29uc3RhbnQKPiAweDdmZiB0byAweGZmLiAgVGhlIHdhcm5pbmcgb3JpZ2luYXRlcyBmcm9tIHRo
ZSB1c2Ugb2YgYSBjb25zdGFudCBvZmZzZXQKPiBvZiAtOCBpbiBhIHN0b3JlIGluc3RydWN0aW9u
IGluIGJwZl9qaXRfY29tcDY0LmM6Cj4KPiAgIGVtaXQocnZfc2QoUlZfUkVHX1NQLCAtOCwgUlZf
UkVHX1JBKSwgJmN0eCk7Cj4KPiBydl9zZCB0aGVuIGNhbGxzIHJ2X3NfaW5zbiwgd2l0aCBpbW0x
MV8wIGVxdWFsIHRvICh1MTYpKC04KSwgb3IgMHhmZmY4Lgo+Cj4gSGVyZSdzIHRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIG9mIHJ2X3NfaW5zbjoKPgo+ICAgc3RhdGljIGlubGluZSB1MzIgcnZf
c19pbnNuKHUxNiBpbW0xMV8wLCB1OCByczIsIHU4IHJzMSwgdTggZnVuY3QzLCB1OCBvcGNvZGUp
Cj4gICB7Cj4gICAgICAgICAgIHU4IGltbTExXzUgPSBpbW0xMV8wID4+IDUsIGltbTRfMCA9IGlt
bTExXzAgJiAweDFmOwo+Cj4gICAgICAgICAgIHJldHVybiAoaW1tMTFfNSA8PCAyNSkgfCAocnMy
IDw8IDIwKSB8IChyczEgPDwgMTUpIHwgKGZ1bmN0MyA8PCAxMikgfAo+ICAgICAgICAgICAgICAg
ICAgKGltbTRfMCA8PCA3KSB8IG9wY29kZTsKPiAgIH0KPgo+IGltbTExXzAgaXMgYSBzaWduZWQg
MTItYml0IGltbWVkaWF0ZSBvZmZzZXQgb2YgdGhlIHN0b3JlIGluc3RydWN0aW9uLiBUaGUKPiBp
bnN0cnVjdGlvbiBlbmNvZGluZyByZXF1aXJlcyBzcGxpdHRpbmcgdGhlIGltbWVkaWF0ZSBpbnRv
IGJpdHMgMTE6NSBhbmQKPiBiaXRzIDQ6MC4gSW4gdGhpcyBjYXNlLCBpbW0xMV8wID4+IDUgPSAw
eDdmZiwgd2hpY2ggdGhlbiBnZXRzIHRydW5jYXRlZAo+IHRvIDB4ZmYgd2hlbiBjYXN0IHRvIHU4
LCBjYXVzaW5nIHRoZSB3YXJuaW5nIGZyb20gc3BhcnNlLiBIb3dldmVyLCB0aGlzIGlzCj4gbm90
IGFjdHVhbGx5IGFuIGlzc3VlIGJlY2F1c2UgdGhlIGltbWVkaWF0ZSBvZmZzZXQgaXMgc2lnbmVk
LS0tdHJ1bmNhdGluZwo+IHVwcGVyIGJpdHMgdGhhdCBhcmUgYWxsIHNldCB0byAxIGhhcyBubyBl
ZmZlY3Qgb24gdGhlIHZhbHVlIG9mIHRoZQo+IGltbWVkaWF0ZS4KPgo+IFRoZXJlIGlzIGFub3Ro
ZXIgc3VidGxlIHF1aXJrIHdpdGggdGhpcyBjb2RlLCB3aGljaCBpcyBpbW0xMV81IGlzCj4gc3Vw
cG9zZWQgdG8gYmUgdGhlIHVwcGVyIDcgYml0cyBvZiB0aGUgMTItYml0IHNpZ25lZCBpbW1lZGlh
dGUsIGJ1dCBpdHMKPiB0eXBlIGlzIHU4IHdpdGggbm8gZXhwbGljaXQgbWFzayB0byBzZWxlY3Qg
b3V0IG9ubHkgdGhlIGJvdHRvbSA3IGJpdHMuCj4gVGhpcyBoYXBwZW5zIHRvIGJlIG9rYXkgaGVy
ZSBiZWNhdXNlIGltbTExXzUgaXMgdGhlIGxlZnQtbW9zdCBmaWVsZCBpbgo+IHRoZSBpbnN0cnVj
dGlvbiBhbmQgdGhlICJleHRyYSIgYml0IHdpbGwgYmUgc2hpZnRlZCBvdXQgd2hlbiBpbW0xMV81
IGlzCj4gc2hpZnRlZCBsZWZ0IGJ5IDI1Lgo+Cj4gVGhpcyBjb21taXQgZml4ZXMgdGhlIHdhcm5p
bmcgYnkgY2hhbmdpbmcgdGhlIHR5cGUgb2YgaW1tMTFfNSBhbmQgaW1tNF8wCj4gdG8gYmUgdTMy
IGluc3RlYWQgb2YgdTgsIGFuZCBhZGRpbmcgYW4gZXhwbGljaXQgbWFzayB0byBjb21wdXRlIGlt
bTExXzUKPiBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gdHJ1bmNhdGlvbiArIHNoaWZ0aW5nLgo+Cj4g
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IENsb3Nlczog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDcyNjA3MDQuZFVFbENy
V1UtbGtwQGludGVsLmNvbS8KPiBJbi1SZXBseS1UbzogPDIwMjMwNzI2MDcwNC5kVUVsQ3JXVS1s
a3BAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEx1a2UgTmVsc29uIDxsdWtlLnIubmVsc0Bn
bWFpbC5jb20+Cj4gQ2M6IFhpIFdhbmcgPHhpLndhbmdAZ21haWwuY29tPgo+IENjOiBEYW5pZWwg
Qm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PgoKClRoYW5rcywgTHVrZSEKCkFja2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
