Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F747C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6L19lq0h9ncsVoi456eRZ0UttSDBoyRtTnRu+kgN9B8=; b=eyszkQccAbnon2
	SICqYEe9gu2igrD3EIC49i+3/M8DsGPELciajjgUyo5aqm8WxzYhVFMjouxVLlfAvaxW4CH4iVxV5
	i/96aE//MWjTAajrIMvCXlCVUWNh/4H16R1BAJW0DYOubTbUqn2BLV6PoGKIVIJQOC034fErxMPlU
	SA0hrPwvLBQbx8yEBkp3ahPOk9Y1AgQ4tqUNZsBkmy0FOgg/v03ZoFE0flNRJWXddUgyt3ygtl0mE
	EvZb7BPzHdRqCab++1dwi+FYuTgKTfLy0D1m8eapGs2Y+rnjjvQPA1JSLvcwwgwlFbIpTOsmdrPNf
	syJsEqjbnLInEOqhcEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZBK-0000000DGY5-1WSn;
	Thu, 02 May 2024 16:21:14 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZBH-0000000DGXX-2m5C
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 16:21:13 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-51f0602bc58so1077867e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714666870; x=1715271670; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUyPRHnVMRowddCFlTczt50QKNbUT/pUuDV1uKnddi0=;
        b=M7HhBk7g4OLpiIh0dHaTR/a52ZNFt5jV8zANyvno3Kp+Uq2FdO4wIgjhBPFa05tVR4
         fCPKr644osbVL9OlWKupaslXc1+MD1FMr+tg/owfIkITm65Bnc2JckysHhdtGwxXaeVd
         3JjDU091Da8JlC1q5T/79TfXo2oddL6TVIF2LMXAUgpoaeON7AvheU2+xGvOkLestiv3
         kdbw6zYtP1fElQ3l2J+JXX20c0I1zRc5i5nEBIwZ8hB1VdIUIznWVfbt0wbh3TDWqzbI
         B07ZS2V+Yv1/G0zEblA0bQcSFu9eQuDM8crNNmc/NSNo0+DboOJ2XO4Vc0QwjtyH6p7x
         BcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714666870; x=1715271670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUyPRHnVMRowddCFlTczt50QKNbUT/pUuDV1uKnddi0=;
        b=bvqM/2yHa5yvLa6b184lX4KXz0HzBhmxz96sr40ngWQaVelvKYSH/bAmPivvUvPDwQ
         rMskJrA2fUQ79kS0nk5OtmF7/5Qi7QjGKOjOpHLoZs9MnZmPHNdAU9ycXOFvunUhDSsS
         b26k4mBwhm7NYTAiGPR1GV2p/GqayTrs6W1Rm2OTThI/9E2KBsmomWA4x9UlmiVwWahk
         cv2Ht9lGpuoduJm1VjiPUu2coW2jG4tDiUAdJJd6wxHSNKVCHxQrx/pdQcVwCF0/49cH
         H+FWqT7ldRXxV9Xd9c26aEJjTU1UXe9IJvH6d2xEw0C4tjHSJ0IaXak0PfOwGpa/gh8K
         gB3A==
X-Forwarded-Encrypted: i=1; AJvYcCXM5lMhfOKuw1jmjtXfFSHKhs3fU2LGeR6hIx5gIpal8e8LjkYowx4qhRnYBP0yDxVHxB2n7aYAnBcYoX42ofe5cZm5uxJl04K2NCOKj1qS
X-Gm-Message-State: AOJu0Yzo2n/R7VEkONOLM86ctMDCjGGsSpr0eSwsJp1hoPKNh0NqfTXU
	R6uXyjfoyaegcxeBUJ++2cJak6BaywSyGdAlsyaSLtSXtTmCBOt3nYu0LMcxRNcS22yhVLOqaqe
	KJROfV5x4SBRxQtPL19KkaWg900o=
X-Google-Smtp-Source: AGHT+IFOMg2OJ5YJgQMKha2I9j/taqMwMA0kN2XIRspOFD/wRUx7YTn+ftuZKKdXuBjvac3cdyvRa5yCNRZ1h8UWG0M=
X-Received: by 2002:ac2:4541:0:b0:51e:efec:dfaa with SMTP id
 j1-20020ac24541000000b0051eefecdfaamr56193lfm.19.1714666869406; Thu, 02 May
 2024 09:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240430175834.33152-1-puranjay@kernel.org> <20240430175834.33152-2-puranjay@kernel.org>
 <CAEf4Bzb2NY+wuK159Xb8F9Nu4CuVoYJ6WWR3_0LeTAi+zONewQ@mail.gmail.com> <87jzkcw5kx.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87jzkcw5kx.fsf@all.your.base.are.belong.to.us>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Thu, 2 May 2024 18:20:58 +0200
Message-ID: <CANk7y0gqpAqjp-Ny6GyCsmTB5uk3UGc0uHpPr=ujOD0Rz_ogWw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] riscv, bpf: add internal-only MOV
 instruction to resolve per-CPU addrs
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_092111_724087_3435506F 
X-CRM114-Status: GOOD (  27.63  )
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

T24gVGh1LCBNYXkgMiwgMjAyNCBhdCA2OjE44oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBbmRyaWkgTmFrcnlpa28gPGFuZHJpaS5uYWtyeWlrb0BnbWFp
bC5jb20+IHdyaXRlczoKPgo+ID4gT24gVHVlLCBBcHIgMzAsIDIwMjQgYXQgMTA6NTjigK9BTSBQ
dXJhbmpheSBNb2hhbiA8cHVyYW5qYXlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBTdXBw
b3J0IGFuIGluc3RydWN0aW9uIGZvciByZXNvbHZpbmcgYWJzb2x1dGUgYWRkcmVzc2VzIG9mIHBl
ci1DUFUKPiA+PiBkYXRhIGZyb20gdGhlaXIgcGVyLUNQVSBvZmZzZXRzLiBUaGlzIGluc3RydWN0
aW9uIGlzIGludGVybmFsLW9ubHkgYW5kCj4gPj4gdXNlcnMgYXJlIG5vdCBhbGxvd2VkIHRvIHVz
ZSB0aGVtIGRpcmVjdGx5LiBUaGV5IHdpbGwgb25seSBiZSB1c2VkIGZvcgo+ID4+IGludGVybmFs
IGlubGluaW5nIG9wdGltaXphdGlvbnMgZm9yIG5vdyBiZXR3ZWVuIEJQRiB2ZXJpZmllciBhbmQg
QlBGCj4gPj4gSklUcy4KPiA+Pgo+ID4+IFJJU0MtViB1c2VzIGdlbmVyaWMgcGVyLWNwdSBpbXBs
ZW1lbnRhdGlvbiB3aGVyZSB0aGUgb2Zmc2V0cyBmb3IgQ1BVcwo+ID4+IGFyZSBrZXB0IGluIGFu
IGFycmF5IGNhbGxlZCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV9udW1iZXJdLiBSSVNDViBzdG9yZXMK
PiA+PiB0aGUgYWRkcmVzcyBvZiB0aGUgdGFza19zdHJ1Y3QgaW4gVFAgcmVnaXN0ZXIuIFRoZSBm
aXJzdCBlbGVtZW50IGluCj4gPj4gdGFza19zdHJ1Y3QgaXMgc3RydWN0IHRocmVhZF9pbmZvLCBh
bmQgd2UgY2FuIGdldCB0aGUgY3B1IG51bWJlciBieQo+ID4+IHJlYWRpbmcgZnJvbSB0aGUgVFAg
cmVnaXN0ZXIgKyBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2luZm8sIGNwdSkuCj4gPj4KPiA+PiBP
bmNlIHdlIGhhdmUgdGhlIGNwdSBudW1iZXIgaW4gYSByZWdpc3RlciB3ZSByZWFkIHRoZSBvZmZz
ZXQgZm9yIHRoYXQKPiA+PiBjcHUgZnJvbSBhZGRyZXNzOiAmX19wZXJfY3B1X29mZnNldCArIGNw
dV9udW1iZXIgPDwgMy4gVGhlbiB3ZSBhZGQgdGhpcwo+ID4+IG9mZnNldCB0byB0aGUgZGVzdGlu
YXRpb24gcmVnaXN0ZXIuCj4gPj4KPiA+PiBUbyBtZWFzdXJlIHRoZSBpbXByb3ZlbWVudCBmcm9t
IHRoaXMgY2hhbmdlLCB0aGUgYmVuY2htYXJrIGluIFsxXSB3YXMKPiA+PiB1c2VkIG9uIFFlbXU6
Cj4gPj4KPiA+PiBCZWZvcmU6Cj4gPj4gZ2xvYi1hcnItaW5jICAgOiAgICAxLjEyNyDCsSAwLjAx
M00vcwo+ID4+IGFyci1pbmMgICAgICAgIDogICAgMS4xMjEgwrEgMC4wMDRNL3MKPiA+PiBoYXNo
LWluYyAgICAgICA6ICAgIDAuNjgxIMKxIDAuMDUyTS9zCj4gPj4KPiA+PiBBZnRlcjoKPiA+PiBn
bG9iLWFyci1pbmMgICA6ICAgIDEuMTM4IMKxIDAuMDExTS9zCj4gPj4gYXJyLWluYyAgICAgICAg
OiAgICAxLjM2NiDCsSAwLjAwNk0vcwo+ID4+IGhhc2gtaW5jICAgICAgIDogICAgMC42NzYgwrEg
MC4wMDFNL3MKPiA+Pgo+ID4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vYW5ha3J5aWtvL2xpbnV4
L2NvbW1pdC84ZGVjOTAwOTc1ZWYKPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1v
aGFuIDxwdXJhbmpheUBrZXJuZWwub3JnPgo+ID4+IC0tLQo+ID4+ICBhcmNoL3Jpc2N2L25ldC9i
cGZfaml0X2NvbXA2NC5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4gPj4gIDEgZmls
ZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMKPiA+PiBpbmRleCAxNWU0ODJmMmM2NTcuLjk5ZDcwMDZmMTQyMCAxMDA2NDQKPiA+PiAtLS0g
YS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wNjQuYwo+ID4+IEBAIC0xMiw2ICsxMiw3IEBACj4gPj4gICNpbmNsdWRl
IDxsaW51eC9zdG9wX21hY2hpbmUuaD4KPiA+PiAgI2luY2x1ZGUgPGFzbS9wYXRjaC5oPgo+ID4+
ICAjaW5jbHVkZSA8YXNtL2NmaS5oPgo+ID4+ICsjaW5jbHVkZSA8YXNtL3BlcmNwdS5oPgo+ID4+
ICAjaW5jbHVkZSAiYnBmX2ppdC5oIgo+ID4+Cj4gPj4gICNkZWZpbmUgUlZfRkVOVFJZX05JTlNO
UyAyCj4gPj4gQEAgLTEwODksNiArMTA5MCwyNCBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29u
c3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPiA+
PiAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0X29yKFJWX1JFR19UMSwgcmQsIFJWX1JFR19U
MSwgY3R4KTsKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0X212KHJkLCBSVl9SRUdf
VDEsIGN0eCk7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPj4gKyAgICAg
ICAgICAgICAgIH0gZWxzZSBpZiAoaW5zbl9pc19tb3ZfcGVyY3B1X2FkZHIoaW5zbikpIHsKPiA+
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAocmQgIT0gcnMpCj4gPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBlbWl0X212KHJkLCBycywgY3R4KTsKPgo+IE5vIGJpZ2dpZSwg
YnV0IHlvdSBkaWQgbm90IGZvbGQgdGhpcyBjaGVjayBpbnRvIGVtaXRfbXYoKS4KPgo+ID4+ICsj
aWZkZWYgQ09ORklHX1NNUAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyog
TG9hZCBjdXJyZW50IENQVSBudW1iZXIgaW4gVDEgKi8KPiA+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGVtaXRfbGQoUlZfUkVHX1QxLCBvZmZzZXRvZihzdHJ1Y3QgdGhyZWFkX2lu
Zm8sIGNwdSksCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJW
X1JFR19UUCwgY3R4KTsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIDw8
IDMgYmVjYXVzZSBvZmZzZXRzIGFyZSA4IGJ5dGVzICovCj4gPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBlbWl0X3NsbGkoUlZfUkVHX1QxLCBSVl9SRUdfVDEsIDMsIGN0eCk7Cj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBMb2FkIGFkZHJlc3Mgb2YgX19w
ZXJfY3B1X29mZnNldCBhcnJheSBpbiBUMiAqLwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW1pdF9hZGRyKFJWX1JFR19UMiwgKHU2NCkmX19wZXJfY3B1X29mZnNldCwgZXh0
cmFfcGFzcywgY3R4KTsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEFk
ZCBvZmZzZXQgb2YgY3VycmVudCBDUFUgdG8gIF9fcGVyX2NwdV9vZmZzZXQgKi8KPiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVtaXRfYWRkKFJWX1JFR19UMSwgUlZfUkVHX1Qy
LCBSVl9SRUdfVDEsIGN0eCk7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAv
KiBMb2FkIF9fcGVyX2NwdV9vZmZzZXRbY3B1XSBpbiBUMSAqLwo+ID4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZW1pdF9sZChSVl9SRUdfVDEsIDAsIFJWX1JFR19UMSwgY3R4KTsK
PiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEFkZCB0aGUgb2Zmc2V0IHRv
IFJkICovCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0X2FkZChyZCwg
cmQsIFJWX1JFR19UMSwgY3R4KTsKPiA+Cj4gPiBpcyB0aGlzIHRoZSByaWdodCBsZXZlbCBvZiBj
b2RlIGluZGVudGF0aW9uPwo+Cj4gTG9va3Mgd3JvbmcuCj4KPiBXaGVuIHRoZSBpbmRlbnQgaXMg
Zml4ZWQsIGZlZWwgZnJlZSB0byBhZGQ6Cj4KPiBBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Aa2VybmVsLm9yZz4KCkkgZml4ZWQgdGhlIGluZGVudCBhbmQgc2VudCBpdCBhcyBwYXJ0IG9m
OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA1MDIxNTE4NTQuOTgxMC0xLXB1cmFu
amF5QGtlcm5lbC5vcmcvCgpBbHNvLCBmb3IgdGhlIGVtaXRfbXYoKSB0aGluZywgSSB3YW50ZWQg
dG8gdmVyaWZ5IGlmIHdlIGFyZSB1c2luZyB0aGF0CnNvbWV3aGVyZSBmb3IgemVyby1leHRlbnNp
b24gb3Igc29tZXRoaW5nLgpTbywgSSB0aG91Z2h0IEkgd291bGQgc2VuZCBhIHNlcGFyYXRlIHBh
dGNoIGZvciBpdC4KClRoYW5rcywKUHVyYW5qYXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
