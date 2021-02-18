Return-Path: <SRS0=Picb=HU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9738AC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Feb 2021 19:25:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D885614A7
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Feb 2021 19:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D885614A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n6pXMuzQ+OBzysSJq2q49AtAeolUDcjTRnxEAL+J71w=; b=G7eUq++vRkmxzf8fuFAuHcrc4
	D9SfGwHURdXrY0oHj00ZmaWwpDd62nSUr0zLykfpHK37rKfRkG6MPpyZQ6ydMbbqxF2ujjbN8saqS
	ghMDI/riZm2NQ+Kfrmq+yJGAs1q8G9hACTd/CGH8w5NO26K5iZHo43T2PidfmW/j0ERfhIGT6M6c0
	R5+evFX+Vc9DJqZ7A56Ued9/K2en1UNgWWplFcc+44sNlICFlKcZDbl2sKgKnrpTf7LiwVFeA23Da
	A6sp6UCD+CvH57BujLw/hkaLSmgL4fnhZ1bAV43EIQbma522UT735z2ZIdvzDXDIXvTZYYjsi6gHT
	hGOFh/oDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCovH-0006DA-Tz; Thu, 18 Feb 2021 19:25:11 +0000
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCovB-0006Bk-Ee; Thu, 18 Feb 2021 19:25:05 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id F205E40CD9; Thu, 18 Feb 2021 16:25:03 -0300 (-03)
Date: Thu, 18 Feb 2021 16:25:03 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v5] perf tools: Fix arm64 build error with gcc-11
Message-ID: <YC6/D1KwxnkEPObJ@kernel.org>
References: <20210218031245.2078492-1-Jianlin.Lv@arm.com>
 <bd474bfa-2bdb-53ea-5142-3a6570d63b7f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd474bfa-2bdb-53ea-5142-3a6570d63b7f@huawei.com>
X-Url: http://acmel.wordpress.com
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, peterz@infradead.org, guoren@kernel.org,
 linux-riscv@lists.infradead.org, jolsa@redhat.com, will@kernel.org,
 linux-csky@vger.kernel.org, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, iecedge@gmail.com, ravi.bangoria@linux.ibm.com,
 aou@eecs.berkeley.edu, kjain@linux.ibm.com, paul.walmsley@sifive.com,
 namhyung@kernel.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 atrajeev@linux.vnet.ibm.com, mathieu.poirier@linaro.org,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, leo.yan@linaro.org,
 Jianlin Lv <Jianlin.Lv@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RW0gVGh1LCBGZWIgMTgsIDIwMjEgYXQgMDk6MjY6MTdBTSArMDAwMCwgSm9obiBHYXJyeSBlc2Ny
ZXZldToKPiBPbiAxOC8wMi8yMDIxIDAzOjEyLCBKaWFubGluIEx2IHdyb3RlOgo+ID4gZ2NjIHZl
cnNpb246IDExLjAuMCAyMDIxMDIwOCAoZXhwZXJpbWVudGFsKSAoR0NDKQo+ID4gCj4gPiBGb2xs
b3dpbmcgYnVpbGQgZXJyb3Igb24gYXJtNjQ6Cj4gPiAKPiA+IC4uLi4uLi4KPiA+IEluIGZ1bmN0
aW9uIOKAmHByaW50ZuKAmSwKPiA+ICAgICAgaW5saW5lZCBmcm9tIOKAmHJlZ3NfZHVtcF9fcHJp
bnRm4oCZIGF0IHV0aWwvc2Vzc2lvbi5jOjExNDE6MywKPiA+ICAgICAgaW5saW5lZCBmcm9tIOKA
mHJlZ3NfX3ByaW50ZuKAmSBhdCB1dGlsL3Nlc3Npb24uYzoxMTY5OjI6Cj4gPiAvdXNyL2luY2x1
ZGUvYWFyY2g2NC1saW51eC1nbnUvYml0cy9zdGRpbzIuaDoxMDc6MTA6IFwKPiA+ICAgIGVycm9y
OiDigJglLTVz4oCZIGRpcmVjdGl2ZSBhcmd1bWVudCBpcyBudWxsIFstV2Vycm9yPWZvcm1hdC1v
dmVyZmxvdz1dCj4gPiAKPiA+IDEwNyB8ICAgcmV0dXJuIF9fcHJpbnRmX2NoayAoX19VU0VfRk9S
VElGWV9MRVZFTCAtIDEsIF9fZm10LCBcCj4gPiAgICAgICAgICAgICAgICAgIF9fdmFfYXJnX3Bh
Y2sgKCkpOwo+ID4gCj4gPiAuLi4uLi4KPiA+IEluIGZ1bmN0aW9uIOKAmGZwcmludGbigJksCj4g
PiAgICBpbmxpbmVkIGZyb20g4oCYcGVyZl9zYW1wbGVfX2ZwcmludGZfcmVncy5pc3Jh4oCZIGF0
IFwKPiA+ICAgICAgYnVpbHRpbi1zY3JpcHQuYzo2MjI6MTQ6Cj4gPiAvdXNyL2luY2x1ZGUvYWFy
Y2g2NC1saW51eC1nbnUvYml0cy9zdGRpbzIuaDoxMDA6MTA6IFwKPiA+ICAgICAgZXJyb3I6IOKA
mCU1c+KAmSBkaXJlY3RpdmUgYXJndW1lbnQgaXMgbnVsbCBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZs
b3c9XQo+ID4gICAgMTAwIHwgICByZXR1cm4gX19mcHJpbnRmX2NoayAoX19zdHJlYW0sIF9fVVNF
X0ZPUlRJRllfTEVWRUwgLSAxLCBfX2ZtdCwKPiA+ICAgIDEwMSB8ICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fdmFfYXJnX3BhY2sgKCkpOwo+ID4gCj4gPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWlu
ZyB0cmVhdGVkIGFzIGVycm9ycwo+ID4gLi4uLi4uLgo+ID4gCj4gPiBUaGlzIHBhdGNoIGZpeGVz
IFdmb3JtYXQtb3ZlcmZsb3cgd2FybmluZ3MuIEFkZCBoZWxwZXIgZnVuY3Rpb24gdG8KPiA+IGNv
bnZlcnQgTlVMTCB0byAidW5rbm93biIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEppYW5saW4g
THY8Smlhbmxpbi5MdkBhcm0uY29tPgo+IAo+IHRoYW5rcwo+IFJldmlld2VkLWJ5OiBKb2huIEdh
cnJ5IDxqb2huLmdhcnJ5QGh1YXdlaS5jb20+CgoKVGhhbmtzLCBhcHBsaWVkLgoKLSBBcm5hbGRv
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
