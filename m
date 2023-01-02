Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF61C4708D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuQsg1DgABAWrC20WAFp1NFxHTDvzrmFiTV6v7IeIeI=; b=vYScaI0zSXJnH8
	SvzjlCBRPMSPf2vqHt0Bh8uBZIHFmaesYkWynd5XTlVW9sTsFvAu4/SdV+zgHCI1l7Y2TBIvoo1XR
	fWXKNjQOBP1PZ+n6ceoEnI7qJMPsG+mYggRZqfZBU/JSDIAzl/OabL6L02ltnZY3oNIUcsd1CkZ4h
	l5/RdsVx5YRdT8Ssh94Xs5fFfBF5viNvnEUVaZ8FrH/MMOm1WHzzGpJi3w56PJQwyEPSbUS2Rqmct
	J6Fm0qAUllUOXicfWmjkC3MvgTdhJEtL7URQRPRUwFh9z0fVlIp23Ag3MGcj9DR8c5jBq1uRGoC3u
	ALoGPJkrzBf8Ys/MUfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPAq-00DL1h-Bi; Mon, 02 Jan 2023 18:04:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCP9v-00DKrs-6i
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 18:03:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9B5DBB80DD2;
	Mon,  2 Jan 2023 18:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BBEC433D2;
	Mon,  2 Jan 2023 18:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672682616;
	bh=eiL9ov92ii0rNfUZ7WxyqD7kXKuY844nLoQQukaQwBg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cJIzhIrYoeZceLj1oFq0IBdCXGVFGwdlyxWjWtC7PW1im40Ah2MK80CAKQDWdvne7
	 DLZB0rMIhbCbYpckJj7ziXzs4fatXTrvnz6lIU3Dz7pYxWzwbRVfVNWiY2oP8RDEWj
	 vqeUygwfAKV+yETWlgxgkC6Y+ZFgu0gMuZokegOlDY9Sdtd5lIY0D0lKWNJbROC09Z
	 5AiHEBOuo/+5BafbU8o94y0bcGGDgEIvtpqo6YFb6rOTTm5x6W8K+fL2dDkp7pnzp0
	 eNx7ERADrC0ClivHV0UY654QqhLae6i8B1KS9+KXys+kmaMXR3A1S+A+f62sP7htbQ
	 TdveTeTVWR+1Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v5 3/9] riscv/kprobe: Prepare the skeleton to prepare
 optimized kprobe
In-Reply-To: <20221224114315.850130-4-chenguokai17@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-4-chenguokai17@mails.ucas.ac.cn>
Date: Mon, 02 Jan 2023 19:03:33 +0100
Message-ID: <87v8lovmoa.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_100339_469005_65D0718C 
X-CRM114-Status: GOOD (  13.78  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IEZy
b206IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KCj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL3Byb2Jlcy9vcHQuYyB8IDEwNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMKPiBpbmRleCA1NmM4YTIyN2M4NTcuLmE0MjcxZTYwMzNi
YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMKPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMKCj4gQEAgLTI0LDcgKzcyLDY0IEBAIGludCBh
cmNoX2NoZWNrX29wdGltaXplZF9rcHJvYmUoc3RydWN0IG9wdGltaXplZF9rcHJvYmUgKm9wKQo+
ICBpbnQgYXJjaF9wcmVwYXJlX29wdGltaXplZF9rcHJvYmUoc3RydWN0IG9wdGltaXplZF9rcHJv
YmUgKm9wLAo+ICAJCQkJICBzdHJ1Y3Qga3Byb2JlICpvcmlnKQo+ICB7Cj4gLQlyZXR1cm4gMDsK
PiArCWxvbmcgcmVsOwo+ICsJaW50IHJkLCByYSwgcmV0Owo+ICsJa3Byb2JlX29wY29kZV90ICpj
b2RlID0gTlVMTCwgKnNsb3QgPSBOVUxMOwo+ICsKPiArCWlmICghY2FuX29wdGltaXplKCh1bnNp
Z25lZCBsb25nKW9yaWctPmFkZHIsIG9wKSkKPiArCQlyZXR1cm4gLUVJTFNFUTsKPiArCj4gKwlj
b2RlID0ga3phbGxvYyhNQVhfT1BUSU5TTl9TSVpFLCBHRlBfS0VSTkVMKTsKPiArCXNsb3QgPSBn
ZXRfb3B0aW5zbl9zbG90KCk7Cj4gKwlpZiAoIWNvZGUgfHwgIXNsb3QpIHsKPiArCQlyZXQgPSAt
RU5PTUVNOwo+ICsJCWdvdG8gb25fZXJyb3I7Cj4gKwl9Cj4gKwo+ICsJLyoKPiArCSAqIFZlcmlm
eSBpZiB0aGUgYWRkcmVzcyBnYXAgaXMgd2l0aGluIDRHQiByYW5nZSwgYmVjYXVzZSB0aGlzIHVz
ZXMKPiArCSAqIGEgYXVpcGMramFsciBwYWlyLgoKVHJ5IHRvIGJlIGNvbnNpc3RlbnQuIFlvdSdy
ZSBtaXhpbmcgIkFVSVBDL0pBTFIiIHdpdGggImF1aXBjK2phbHIiLgoKPiArCSAqLwo+ICsJcmVs
ID0gKHVuc2lnbmVkIGxvbmcpc2xvdCAtICh1bnNpZ25lZCBsb25nKW9yaWctPmFkZHI7Cj4gKwlp
ZiAoIWluX2F1aXBjX2phbHJfcmFuZ2UocmVsKSkgewo+ICsJCS8qCj4gKwkJICogRGlmZmVyZW50
IGZyb20geDg2LCB3ZSBmcmVlIGNvZGUgYnVmIGRpcmVjdGx5IGluc3RlYWQKPiBvZgoKUmV3b3Jk
IGZvciByZWFkZXJzIHRoYXQgYXJlIG5vdCBmYW1pbGlhciB3aXRoIHg4Ni4KCgpCasO2cm4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
