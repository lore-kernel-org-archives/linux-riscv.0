Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DB2C7EE24
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 19:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4+N7x3zND4PHqK07OLGifBEdN9o4jcHozO+ac/6NEE=; b=gS1/QKZpYsrrtG
	eyDRHVrs37OFPQg//pFgEc+ufgPjkFZLUoz7mIB+tIoyOZJDhexyUF54zuO9CCXzP6cY67LSlnT+u
	4MPHJ7H+vF0OrrIY+AG1IVL7fnXOQffUrtVABtWz2ZSJptMRk96svChWze6nOmTSxB59p/g7KyoHf
	OzxY/HBa4wFT6tABhfPCiMIM7M8VyYXPQ4ERbMBMu2o2bD4+9wnxevW5PaD0ZhiFZ+U5V8s0enaco
	FHBPBme+xnTPEMSGGMhUBCuZqGGNTG+qAHNpVGiSUsEoZy0l98lZ085Fpkmj3Jn0HPaPfzOl9M/4C
	dgHcCOVRoIWdCSTpiG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxCB0-009qj5-1X;
	Thu, 11 May 2023 19:42:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxCAx-009qht-2N
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 19:42:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 008E965161;
	Thu, 11 May 2023 19:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D80C433EF;
	Thu, 11 May 2023 19:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683834126;
	bh=QpVinai7JL1pP3rlbbUdOOyw1HmQ+Nd16p9jSiVEw10=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bwcXVRwxBue8gU9VyMRjLJ8rs6LCJhDK0kQ2Ju9IpqIOHGLQVIJ3J05dZPj8j7w9a
	 buxnKBKltkT8RTR5qxgDcACuogbG2AtMvMDBIhjzI6ofeDtRYEN3m0xR19e8hu3D1P
	 rxaD66Wmlvz9lZojNlRbBIyDdzL+vA7uNZWUH+XcFxT53luDEqvnDIqUgGVsFa4/N0
	 bjN8PKO8K3VBsJjtRI7gZ/+urSSHoPMS0dNjWPkBmqV7ZbDO69Tdz5OXBg9VL0/eua
	 NsF6cwVfOb1g/A6ZgmzWJo/RIcE/RsB7LQSX5qe4FV3NU/inG9qNGhBFXvrTOeqHAR
	 ltCoUnfR6sPqA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, guoren@kernel.org,
 suagrfillet@gmail.com, jszhang@kernel.org, e.shatokhin@yadro.com,
 bjorn@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH V10 3/4] riscv: ftrace: Add
 DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
In-Reply-To: <20230511093234.3123181-4-suagrfillet@gmail.com>
References: <20230511093234.3123181-1-suagrfillet@gmail.com>
 <20230511093234.3123181-4-suagrfillet@gmail.com>
Date: Thu, 11 May 2023 21:42:03 +0200
Message-ID: <87zg6ad59w.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_124207_835275_BF608FAD 
X-CRM114-Status: UNSURE (   9.78  )
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

U29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFRoaXMgcGF0Y2gg
YWRkcyBEWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyBzdXBwb3J0IGZvciBSSVNDLVYu
Cj4KPiBzZWxlY3QgdGhlIERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIHRvIHByb3Zp
ZGUgdGhlCj4gcmVnaXN0ZXJfZnRyYWNlX2RpcmVjdFtfbXVsdGldIGludGVyZmFjZXMgYWxsb3dp
bmcgdXNlcnMgdG8gcmVnaXN0ZXIKPiB0aGUgY3VzdG9tZWQgdHJhbXBvbGluZSAoZGlyZWN0X2Nh
bGxlcikgYXMgdGhlIG1jb3VudCBmb3Igb25lIG9yCj4gbW9yZSB0YXJnZXQgZnVuY3Rpb25zLiBB
bmQgbW9kaWZ5X2Z0cmFjZV9kaXJlY3RbX211bHRpXSBhcmUgYWxzbwo+IHByb3ZpZGVkIGZvciBt
b2RpZnlpbmcgZGlyZWN0X2NhbGxlci4KPgo+IFRvIG1ha2UgdGhlIGRpcmVjdF9jYWxsZXIgYW5k
IHRoZSBvdGhlciBmdHJhY2UgaG9va3MgKGVnLiBmdW5jdGlvbi9mZ3JhcGgKPiB0cmFjZXIsIGtb
cmV0XXByb2JlcykgY28tZXhpc3QsIGEgdGVtcG9yYXJ5IHJlZ2lzdGVyIGlzIG5vbWluYXRlZCB0
bwo+IHN0b3JlIHRoZSBhZGRyZXNzIG9mIGRpcmVjdF9jYWxsZXIgaW4gZnRyYWNlX3JlZ3NfY2Fs
bGVyLiBBZnRlciB0aGUKPiBzZXR0aW5nIG9mIHRoZSBhZGRyZXNzIGRpcmVjdF9jYWxsZXIgYnkg
ZGlyZWN0X29wcy0+ZnVuYyBhbmQgdGhlCj4gUkVTVE9SRV9SRUdTIGluIGZ0cmFjZV9yZWdzX2Nh
bGxlciwgZGlyZWN0X2NhbGxlciB3aWxsIGJlIGp1bXBlZCB0bwo+IGJ5IHRoZSBganJgIGluc3Qu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4g
VGVzdGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBH
dW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KClRoYW5rIHlvdSBmb3IgYWRkcmVzc2luZyBteSBj
b21tZW50cywgYW5kIGZvciB5b3VyIHdvcmsgb24KV0lUSF9ESVJFQ1RfQ0FMTFMhCgpBY2tlZC1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
