Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0180C46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5M7uCVWul3c3r7ecIL5lVry4IyXzGq0toU/9yRbkQ0=; b=yxLZ2sVGHockyo
	sjhbWTIUeTtexjEQKr1W+wD7njp2Paafj0pPEZ7xjxrz5dYzTip1yHfIfh4+F076Ra618tCQJ/COl
	SMRJ/V/LeSJofoZJYDmX0HnX4N2l8h6po9jHXAcu1MObB6q5CaHwG6AhPUYSCFc4RbCnUA313iyv0
	1ByLvdvoeO3ylIf0sTprSFdLMQa5RkiZgIgxDVCCPHzKur+mL2owYKiCH0VUtt0qJ2aMl17UrTtAo
	YbXHuJcUuT7oBT44KAVtRXeNUgXSwR13IYeMyKMEp3un8hRdu+5Zfc7ufVwJdVwePQOLFbwRLXD6+
	rkzQ5VG62a7eIMHTrgpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5WU-00A2Kn-HE; Wed, 04 Jan 2023 15:17:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0mI-008Ksv-LQ
	for linux-riscv@bombadil.infradead.org; Wed, 04 Jan 2023 10:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2h+kTATqnvXK6/bIibqgU2JkALqzkVd5rH0/8PmYmsY=; b=ARXRfiA+vSv+FbCl2LshsUYWVI
	Uz9h/OYMlb2FhG2dEPiruNYxIZSRPHOjHaD5t0SY/lzkrH/TNZUb295CfmOWyCQDrzwVuFImgKxmL
	CBnIxMLpdwXDgsazoU9w9eTHNwj2/XkeAO++xg6/suywwNRSmkvrksOrEt/AFpsM7/mZfNF9Jhxje
	pPXzCP/IhdAgfIrLurMnEP0EmjRGv1tSr7Crqen+O0F6p/V4oSOxZadRc+5cF9Wt9ZvzsbjiD8DZS
	RsUysroJjvoXD6PqdBfaaA8+uziGKg2tg2CAlr0VeTF/SYeNSyqWxTJ5DOzS484SO/n5Bh8eAht7C
	zJp3RV6w==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCzWi-000rOV-0O
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jan 2023 08:53:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3F40BCE16E6;
	Wed,  4 Jan 2023 08:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C50C433EF;
	Wed,  4 Jan 2023 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672822384;
	bh=c+W/ETy2yHoE82hOmg9G4o49+KrhbGh7VQyzmOuvRYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QGm9BblgEHoUQmt0vLv+vmpdz1Hip7XG2GPXYNH/ozjESyrRkzZeehUPgEDnfF8wx
	 VcmZuplhQma31DKo16UTFvnXdSuB+vOE2mOdmys5I6lDOVoRgAJGlufIyeGENYSF7J
	 SGr7bnhwMFbdCN7NTf0FqEomCH2DTnBIhG7++KbWhLjcQZqqZjp2EYoVWKhF/KxRD/
	 25NZbEZIXp/9tp39011WFZvoAIJMZgWZwNk2y4Z9zYPSW0zakLYT5ZrdNId20YyOmI
	 gMPXJgqxXRCloyM8FZrngD68+sLhXwKPEqmHWPfKJoJyA7sSjG3v/UVR7/lKvophSs
	 40rnYPJoSFVug==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: "liaochang (A)" <liaochang1@huawei.com>, Chen Guokai
 <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] Add OPTPROBES feature on RISCV
In-Reply-To: <f2e121f3-2bb7-5389-79e3-91edbebe60b8@huawei.com>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <87y1qkvmpf.fsf@all.your.base.are.belong.to.us>
 <f2e121f3-2bb7-5389-79e3-91edbebe60b8@huawei.com>
Date: Wed, 04 Jan 2023 09:53:01 +0100
Message-ID: <878riismtu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_085336_525433_7741B074 
X-CRM114-Status: GOOD (  14.99  )
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

ImxpYW9jaGFuZyAoQSkiIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+IHdyaXRlczoKCj4gSGnvvIxC
asO2cm7vvIxhcHByZWNpYXRlIGZvciB5b3VyIHJldmlldyBhbmQgdGVzdGluZyBhYm91dCB0aGlz
IGZlYXR1cmUuCgpUaGFuayB5b3UgZm9yIHRoZSBoYXJkIHdvcmshCgo+IOWcqCAyMDIzLzEvMyAy
OjAyLCBCasO2cm4gVMO2cGVsIOWGmemBkzoKPj4gQ2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0Bt
YWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cj4+IAo+Pj4gQWRkIGp1bXAgb3B0aW1pemF0aW9uIHN1
cHBvcnQgZm9yIFJJU0MtVi4KPj4gCj4+IFRoYW5rIHlvdSBmb3IgY29udGludWluZyB0byB3b3Jr
IG9uIHRoZSBzZXJpZXMhIEkgdG9vayB0aGUgc2VyaWVzIGZvciBhCj4+IHNwaW4sIGFuZCByYW4g
aW50byBhIG51bWJlciBvZiBpc3N1ZXMgdGhhdCBtYWtlcyBtZSB3b25kZXIgaG93IHlvdSB0ZXN0
Cj4+IHRoZSBzZXJpZXMsIGFuZCBob3cgdGhlIHRlc3RpbmcgaXMgZGlmZmVyZW50IGZyb20gbXkg
cnVucy4KPgo+IEkgaGF2ZSBwaWNrIHNvbWUga2VybmVsIGZ1bmN0aW9ucyB0byB0ZXN0IHRoaXMg
c2VyaWVzLCB3aGljaCBtZWFucyBhbGwgb3B0cHJvYmUKPiBhcmUgaW5zdGFsbCBhdCBlbnRyeSBv
ZiBmdW5jdGlvbiwgaSBndWVzcyB0aGUgaW5zdHJ1Y3Rpb24gcGF0dGVybiBpcyBub3QgdmVyc2F0
aWxlCj4gZW5vdWdoIGZvciBteSB0ZXN0Y2FzZXMgbGVhZHMgdG8gc29tZSBidWdzIGFyZSBub3Qg
ZGlzY292ZXJlZC4KPgo+IERvIHlvdSB0aGluayBpdCBpcyBnb29kIGlkZWEgdG8gdGVzdCB0aGlz
IGZlYXR1cmUgdmlhIGJpbmFyeSBmdHJhY2V0ZXN0IGFuZCB0aGUKPiBrcHJvYmUgcmVsYXRlZCB0
YyBzY3JpcHRzIGluIHRvb2xzL3Rlc3RpbmcvZnRyYWNlIGRpcmVjdG9yeT8KCkRlZmluaXRlbHkh
IEJvdGggcnVubmluZyBhbGwgdGVzdHMgaW4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZnRyYWNl
IGFuZAp3aXRoIHRoZSBDT05GSUdfS1BST0JFU19TQU5JVFlfVEVTVCBtb2R1bGUuCgpbLi4uXQoK
Pj4gNC4gTG9ja2RlcCBzcGxhdAoKWy4uLl0KCj4gTmVlZCB0byBzdHVkeSB0aGlzIGJhY2t0cmFj
ZSBmdXJ0aGVyLCBidXQgYXQgZmlyc3QgZ2xhbmNlLCBpIGd1ZXNzIENPTkZJR19EWU5BTUlDX0ZU
UkFDRSBpcyBlbmFibGVkIG9uIHlvdXIga2VybmVsLCByaWdodD8KPiBJZiBzbywgYWxsIGtycG9i
ZSBpcyBpbnN0YWxsZWQgdmlhIGZ0cmFjZSBzdHViLCB0aGVuIGtwcm9iZSBvcHRpbWl6dGlvbiBv
Y2N1ciBpbiB0aGUgZnRyYWNlIHRyYW1wb2xpbmUgY29kZSwgYW5kIGl0IGFsc28KPiBhIGNvcm5l
ciBjYXNlIHRvIGN1cnJlbnQgb3B0cHJvYmUgaW1wbGVtZW50YXRpb24uCgpZZXMsIENPTkZJR19E
WU5BTUlDX0ZUUkFDRSBpcyBvbi4gTXkga2VybmVsIGNvbmZpZyB3YXMgc2ltcGx5OgogIG1ha2Ug
QVJDSD1yaXNjdiBDUk9TU19DT01QSUxFPXJpc2N2NjQtbGludXgtZ251LSBkZWZjb25maWcKICBt
YWtlIEFSQ0g9cmlzY3YgQ1JPU1NfQ09NUElMRT1yaXNjdjY0LWxpbnV4LWdudS0ga3NlbGZ0ZXN0
LW1lcmdlCgoKVGhhbmtzLApCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
