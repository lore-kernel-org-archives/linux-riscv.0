Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2128C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 03:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuGPSoTM05rTqjvThgoT+DDZxJc0FQ3ooi7Z+PIKexc=; b=Sgxz5Pr8z177Aa
	ys3/8r8w3lq9KE1EzvO+oaJOw7wT8XQI+22pr0buRVa3+QX2UGxyJ4PcUdyzUx6r3d5utN20KWi5+
	4rSxdeVe3oeAILCZAxhIg7CFqSPGh2hS/1vx5xD5WL8+mMOrkm3UZXINV+/eNeEHe5JfGkiRMf99r
	NRCifHhEFznLel5yTiylksgb3huLlbb1J35fPnlgTJ8mF/Z3AeZM5b8GAEiY3PPMrJPyCjKGAiM4t
	OEgv4SosEsK8vyo7N+uZ78FBOs8QLLKFWfCMm0qdczChaoNvW5ZnVC78XiwO8QU5gnpGIbrJDypsT
	zXizE2JVqgX0WFN0TXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Jk1-000000056i3-1Ruo;
	Tue, 15 Sep 2026 03:21:53 +0000
Received: from out-167.mta0.migadu.com ([2001:41d0:1004:224b::a7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Jjy-000000056hP-3USc
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 03:21:52 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=y/OtVCA6wyffOTm7nVE84OZqq0f/muSgEVkAYUjs39A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789442506; v=1; x=1790047306;
 b=xh/0BQWHnnUyEsn/rqCgiUVNnleVAxCgx5ZKbGBft7eZJl1lhACLlQmo/KVRuESSRjgbsJwP
 JoVkZAHnuJ/Zy8zIm5qKkG7KMqsvNA5Zg+oLIj1mnkB7/2j3IjRH8eB8HSuP7djkDGgrgzV+DTU
 A1aQb+LV+moNFaNnYYsCN5FE=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f2615d5adab7b479;
	Tue, 15 Sep 2026 03:21:46 +0000
X-Mizu-Trace-ID: f2615d5adab7b479
X-Migadu-Flow: FLOW_OUT
Message-ID: <2cd4868b-05b1-4f3c-992a-3bed5afd0abf@linux.dev>
Date: Tue, 15 Sep 2026 11:21:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] riscv: Introduce support for hardware
 break/watchpoints
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
 linux-riscv@lists.infradead.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org,
 shuah@kernel.org, linux-kernel@vger.kernel.org, thecharlesjenkins@gmail.com,
 jtaubepe@redhat.com
References: <20260803134913.2013674-1-himanshu.chauhan@oss.qualcomm.com>
 <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260803134913.2013674-2-himanshu.chauhan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_202151_033344_6F7F9981 
X-CRM114-Status: UNSURE (   8.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMDI2LzgvMyAyMTo0OSwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPiArI2RlZmlu
ZSBNRU1fSEkoX20pCSgodW5zaWduZWQgbG9uZyl1cHBlcl8zMl9iaXRzKF9tKSkKPiArI2RlZmlu
ZSBNRU1fTE8oX20pCSgodW5zaWduZWQgbG9uZylsb3dlcl8zMl9iaXRzKF9tKSkKPiArCj4gK3N0
YXRpYyBpbnQgYXJjaF9zbXBfc2V0dXBfc2JpX3NobWVtKHVuc2lnbmVkIGludCBjcHUpCj4gK3sK
PiArCXVuaW9uIHNiaV9kYnRyX3NobWVtX2VudHJ5ICpkYnRyX3NobWVtOwo+ICsJcGh5c19hZGRy
X3Qgc2htZW1fcGE7Cj4gKwlzdHJ1Y3Qgc2JpcmV0IHJldDsKPiArCj4gKwlkYnRyX3NobWVtID0g
cGVyX2NwdV9wdHIoc2JpX2RidHJfc2htZW0sIGNwdSk7Cj4gKwlpZiAoIWRidHJfc2htZW0pIHsK
CnBlcl9jcHVfcHRyKCkgbmV2ZXIgcmV0dXJucyBOVUxMLCBzbyB0aGlzIGNoZWNrIGNhbiBiZSBy
ZW1vdmVkLgoKPiArCQlwcl9lcnIoIkludmFsaWQgcGVyLWNwdSBzaGFyZWQgbWVtb3J5IGZvciBk
ZWJ1ZyB0cmlnZ2Vyc1xuIik7Cj4gKwkJcmV0dXJuIC1FTk9ERVY7Cj4gKwl9Cj4gKwo+ICsJc2ht
ZW1fcGEgPSBwZXJfY3B1X3B0cl90b19waHlzKGRidHJfc2htZW0pOwo+ICsKPiArCXJldCA9IHNi
aV9lY2FsbChTQklfRVhUX0RCVFIsIFNCSV9FWFRfREJUUl9TRVRVUF9TSE1FTSwKPiArCQkJTUVN
X0xPKHNobWVtX3BhKSwgTUVNX0hJKHNobWVtX3BhKSwgMCwgMCwgMCwgMCk7CgpUaGUgQUJJIHRh
a2VzIGxvd2VyIGFuZCB1cHBlciBYTEVOIGJpdHMgaW5zdGVhZCBvZiBmaXhlZCAzMiBiaXRzLCBz
byAKdGhpcyB3aWxsIGJyZWFrIG9uIGFuIFhMRU4gPT0gNjQgc3lzdGVtIGFuZCBhIHBoeXNpY2Fs
IGFkZHJlc3MgPj0gNEdpQi4KCiNpZiBfX3Jpc2N2X3hsZW4gPT0gNjQKI2RlZmluZSBNRU1fSEko
X20pwqAgwqAgMFVMCiNkZWZpbmUgTUVNX0xPKF9tKcKgIMKgICh1bnNpZ25lZCBsb25nKShfbSkK
I2VsaWYgX19yaXNjdl94bGVuID09IDMyCiNkZWZpbmUgTUVNX0hJKF9tKcKgIMKgICh1bnNpZ25l
ZCBsb25nKXVwcGVyXzMyX2JpdHMoX20pCiNkZWZpbmUgTUVNX0xPKF9tKcKgIMKgICh1bnNpZ25l
ZCBsb25nKWxvd2VyXzMyX2JpdHMoX20pCiNlbHNlCiNlcnJvciAiVW5rbm93biBfX3Jpc2N2X3hs
ZW4iCiNlbmRpZgoKPiArCj4gKwlpZiAocmV0LmVycm9yKSB7Cj4gKwkJcHJfd2FybigiJXM6IGZh
aWxlZCB0byBzZXR1cCBzaGFyZWQgbWVtb3J5LiBlcnJvcjogJWxkXG4iLAo+ICsJCQlfX2Z1bmNf
XywgcmV0LmVycm9yKTsKPiArCQlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVy
cm9yKTsKPiArCX0KPiArCj4gKwlwcl9pbmZvKCJDUFUgJWQ6IEhXIEJyZWFrcG9pbnQgc2hhcmVk
IG1lbW9yeSByZWdpc3RlcmVkLlxuIiwgY3B1KTsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQpLaW5k
IHJlZ2FyZHMsClFpbmdmYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
