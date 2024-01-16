Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC67BC4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okYkVMRyPEEbgj+L2gL+5pYXcT6Y9nvT/ATHDDVo9ZY=; b=jq9FH4uYTZY5Ma
	xGvsEhU0mM0LkwctERDeC7hV/IQkNmKG2ujBs2TOx3/idC85Cmcc4jPnv9Ono7cvrb3xHthI4BXzw
	2Awvq3cigaphub82z1MHBR6BZuH08nYJttkR1L4GIhMH66vWFfONdVVSmi1vHqIvxK4wSkFMoTFl/
	BVFEoHdBbX0O2tKB8GWxsnojnJ6HYpzc7E2k1BuyS3bVXR6VMYMWvRlOTycB5yicT4dCjsZkhldgQ
	pCRtN9Pqjnfy4hCp8QIC2tSDHtEU0oj5Wxzg3SdNdsjqvV0wBQenIy34zw4h2DyxHWVq3tfdeCPAe
	bpI2Xv1MT98fkQNWV2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPfNx-00BUs2-28;
	Tue, 16 Jan 2024 09:05:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPfNu-00BUr3-2K
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 09:05:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DB3F1CE189F;
	Tue, 16 Jan 2024 09:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDB9C433C7;
	Tue, 16 Jan 2024 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705395919;
	bh=3wk1068K3TGnKtsD4ebXyJqtioBrDnPmvG2cESe+G+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kyYuLsTk+AwGm9v+g6IMhpKFglDFLgAC7I/fQR7W5ZA2o3bwhXXYZJewj6240JCdr
	 SzVp7ogn6Yo+XOwWQfjGeLRikqyioBeMeX4b0hsfDxCkc5dfEhZWcsH2CIz+jtB/zk
	 eVHqC20RFbIVWkYEtythRDb/NA0xlnLaGWL7WK3Qmxf9R3E9h+o39jhuU3NG/KsZkC
	 dv5avLtcXQvsxav4PB6ovovnMQ8aUxsqS7Kslw81HWZIsp9+zRmq7B8LewCGKlZYja
	 vxJp1NHgu9DZYic6fuulRPbkgRlkbk96GarbFafdhH53LiDPt//04kQvZGg03O2AiT
	 QSFSl20zs97nw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next v2 0/6] Zbb support and code simplification for
 RV64 JIT
In-Reply-To: <421fcfcd-6be6-4dfc-9948-3b57c7517538@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <87h6neo9vh.fsf@all.your.base.are.belong.to.us>
 <421fcfcd-6be6-4dfc-9948-3b57c7517538@huaweicloud.com>
Date: Tue, 16 Jan 2024 10:05:13 +0100
Message-ID: <87le8ptzqu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_010526_952272_8E8BB718 
X-CRM114-Status: UNSURE (   8.60  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IE9uIDIwMjMvOS8y
OCAxODo0NCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
Y2xvdWQuY29tPiB3cml0ZXM6Cj4+IAo+Pj4gQWRkIFpiYiBzdXBwb3J0IFswXSB0byBvcHRpbWl6
ZSBjb2RlIHNpemUgYW5kIHBlcmZvcm1hbmNlIG9mIFJWNjQgSklULgo+Pj4gTWVhbndoaWxlLCBh
ZGp1c3QgdGhlIGNvZGUgZm9yIHVuaWZpY2F0aW9uIGFuZCBzaW1wbGlmaWNhdGlvbi4gVGVzdHMK
Pj4+IHRlc3RfYnBmLmtvIGFuZCB0ZXN0X3ZlcmlmaWVyIGhhdmUgcGFzc2VkLCBhcyB3ZWxsIGFz
IHRoZSByZWxhdGl2ZQo+Pj4gdGVzdGNhc2VzIG9mIHRlc3RfcHJvZ3MqLgo+PiAKPj4gTmljZSB3
b3JrIQo+PiAKPj4gRGlkIHlvdSBtZWFzdXJlIGhvdyB0aGUgaW5zdHJ1Y3Rpb24gY291bnQgY2hh
bmdlZCBmb3IsIHNheSwgdGVzdF9icGYua28KPj4gYW5kIHRlc3RfcHJvZ3M/ID4KPgo+IFNvcnJ5
IGZvciBub3QgcmVzcG9uZGluZyBmb3Igc28gbG9uZy4KCldlbGNvbWUgYmFjayEKCj4gSSBtYWRl
IHN0YXRpc3RpY3Mgb24gdGhlIG51bWJlciBvZiBib2R5IGluc3RydWN0aW9ucyBhbmQgdGhlIGNo
YW5nZXMgYXJlIAo+IGFzIGZvbGxvd3M6Cj4KPiB0ZXN0X3Byb2dzOgo+IDEuIHZlcmlmaWVyX21v
dnN4OiAyNjAgLT4gMjI0Cj4gMi4gdmVyaWZpZXJfYnN3YXA6IDE4MCAtPiA1Ngo+Cj4gdGVzdF9i
cGYua286Cj4gMS4gTU9WU1g6IDE1NCAtPiAxNDYKPiAyLiBCU1dBUDogMzM2IC0+IDEzNgo+Cj4g
V2UgY2FuIHNlZSB0aGF0IHRoZSBjaGFuZ2UgaW4gQlNXQVAgaXMgb2J2aW91cywgYW5kIHRoZSBj
aGFuZ2UgaW4gTU9WU1ggCj4gaXMgaW4gbGluZSB3aXRoIGV4cGVjdGF0aW9ucy4KClRoYW5rIHlv
dS4gSSdsbCB0ZXN0L3JldmlldyB0aGUgdjMgZHVyaW5nIHRoZSB3ZWVrIQoKCkNoZWVycywKQmrD
tnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
