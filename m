Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD6CCCFA13
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 15:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JREioUNBECQTJ+zSkR4sU1OI79C9PEOlcG75DuVYb8U=; b=z9SPAIGmyeC49m
	nRfypc8XZlhMYNWfe8FJPMEqVL0iIssivv7a94o+aCMye5HwAZV0/4O8mC4hZLLSXaD7pXPw5wLCO
	OELPBraIfh49FHrvhQL3ig5qekXub4tY0vOpX+zh2fZaJ2S1JAbiPy/s4KNdkaPsEFUIbJotXWhhz
	7XQ0MgaTBw27nV6wpGd5uTpZ1LxCXXVubBsh0VY7kSheB+uqEIdzoTx6qtKxQzUBMxDKghqVRA+S6
	/fn2Fjpy6rzbuyGvGyVzaAqLVTSzn5oWzR7DtkxMuCOG+7M3iOIOL0oDI3AZlFcIGFT1hhK/jwdze
	uj36R8NcEPVPj6Gm5Xiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI73z-00000003sGs-2TnW;
	Wed, 29 Apr 2026 15:42:59 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI73u-00000003sFK-2YXL;
	Wed, 29 Apr 2026 15:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777477367; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=tas8BUWZ8wM+1fug3uQFtJRlvMGVnHXKsmJWRGCqFW8=;
	b=rn09NnYbdKmpCjRlbS1c3FJVXQ47FBdYMcYMOv9scMTuxQ6fWTBZ7M7VSF8lF5HWz+2tzJ8sF/rLLCDmzAUINnWhFroZ+zAVEvnt3kPva9kKsgUm3M2SxIV1HRUei7w8XoUvzvbaYwyFz8r+kePFwPaFSHfOmD20ebKLIKku1d0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X1y9STm_1777477357;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1y9STm_1777477357 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 23:42:39 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@ziepe.ca
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: Re: Re: [RFC PATCH 01/11] iommupt: Add RISC-V Second-stage (iohgatp) page table support 
Date: Wed, 29 Apr 2026 23:42:35 +0800
Message-Id: <20260429154235.47462-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260429121820.GL849557@ziepe.ca>
References: <20260429121820.GL849557@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_084255_998418_FED60E4E 
X-CRM114-Status: UNSURE (   8.25  )
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

Pj4gPj4gQEAgLTI2Myw2ICsyODEsMjIgQEAgcmlzY3ZwdF9pb21tdV9mbXRfaW5pdChzdHJ1Y3Qg
cHRfaW9tbXVfcmlzY3ZfNjQgKmlvbW11X3RhYmxlLAo+PiA+PiAgCWNhc2UgNTc6Cj4+ID4+ICAJ
CXB0X3RvcF9zZXRfbGV2ZWwoJnRhYmxlLT5jb21tb24sIDQpOwo+PiA+PiAgCQlicmVhazsKPj4g
Pj4gKwkvKgo+PiA+PiArCSAqIFNlY29uZC1zdGFnZSAoaW9oZ2F0cCk6IFN2Mzl4NCAvIFN2NDh4
NCAvIFN2NTd4NC4KPj4gPj4gKwkgKiBUaGUgdG9wIGxldmVsIGlzIHRoZSBzYW1lIGFzIGZvciB0
aGUgZmlyc3Qtc3RhZ2UgY291bnRlcnBhcnQuCj4+ID4+ICsJICovCj4+ID4+ICsJY2FzZSA0MToK
Pj4gPj4gKwkJcHRfdG9wX3NldF9sZXZlbCgmdGFibGUtPmNvbW1vbiwgMik7Cj4+ID4+ICsJCXRh
YmxlLT5zZWNvbmRfc3RhZ2UgPSB0cnVlOwo+PiA+PiArCQlicmVhazsKPj4gPgo+PiA+U2Vjb25k
IHN0YWdlIG5lZWRzIHRvIGJlIGFuIGV4cGxpY2l0IFBUX0ZFQVQgbm90IGltcGxpY2l0bHkgZGVk
dWNlZAo+PiA+YmFzZWQgb24gdGhlIHZhc3ouCj4+IAo+PiBBZ3JlZWQuIEkgd2lsbCBhZGQgYW4g
ZXhwbGljaXQgUFRfRkVBVF9SSVNDVl9TRUNPTkRfU1RBR0UgZmxhZyBhbmQKPj4gc3RvcCBkZXJp
dmluZyBzZWNvbmQtc3RhZ2Ugc2VtYW50aWNzIGZyb20gdmFzei4KPgo+UFRfRkVBVF9SSVNDVl9T
MiB3b3VsZCBtYXRjaCB3aGF0IEkgaGF2ZSBmb3IgQVJNCj4KClRoYW5rcyBmb3IgdGhlIHN1Z2dl
c3Rpb24sIEnigJlsbCB1c2UgUFRfRkVBVF9SSVNDVl9TMiB0byBtYXRjaCB0aGUgQVJNIG5hbWlu
Zy4KCkZhbmd5dQoKPkphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
