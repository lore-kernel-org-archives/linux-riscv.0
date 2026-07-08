Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77113C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 17:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhgDHbJZTu8CaCPspqFFGrYZQzhVWjic4NToJFQF+aM=; b=b9nPSksfaSd3BU
	UeO8pl8gah2Oj9rUPvAdBWH0f/odMFA9gRA3H8bqpFMjESEmSJiUpmfIvxc+KMXgota4lQEehaPBQ
	bYeGfmhr27HIrdoamgUWIyN1wdVmE58hlg1h4Yq/38DMDnnKRWCfWwsjdaEeW+eUmMT24N29P9Au1
	v0lBvZr2PkXqrML6zC/OMeTOwMirMcXJoda7vLXLJCLhHqYuF0znLkqdWUvBXg4G0aZFZr1IoEcIs
	RE1VzrtzXxvqNu0QnTZ++CBmHkuh5nJa/fj56HEpaZocnsKTgTlUMELGzMPaRhIsV02/TTxqHT/2I
	dadM0hX4mtxKusOdaOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVx3-000000005EA-2AJU;
	Wed, 08 Jul 2026 17:20:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVx0-000000005DS-13MV
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 17:20:47 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783531240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJ6OSb62+IgBxwwYG61LmV+eZUaWRn2nhO0DDPk2LNM=;
	b=PT9Ab1c12G2jSSIjgdIlHjiXJ76kZSEsz9oLw3ESSvFabGjsvlB8c/BiTBlYgyeEezfxbq
	vfhArQVI6OOBbIAjvhKbisZMxxgUFeT2PKRlO3b4nVsQr8OndnXkWu7ctFg3e3I5p9indO
	5w8wD8SFUbLKVwCkjM/fqkAOtKsfWkVmFrEbiONUsGm3dMblkppSthXTYT+/t8pBdnhtnP
	gmIjJ44UcwBIQv1a27THywmkOuIrSilqpe1watYq+MMiUrUiWxvVMUCor2WX+CRIM9qg2F
	Y8qv1F9pTSsmXv9uUKKysNT7Sa2T7ITFBS5vbINuFKoAfZP/eNwB+ZrvW4L2/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783531240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJ6OSb62+IgBxwwYG61LmV+eZUaWRn2nhO0DDPk2LNM=;
	b=e1kvS8/YnLXq6InSbpZ9GvpoOubkwZa3R9S2DxqdlkGm5ScWA5Py9kiPkURHuDIYBYSpXt
	7nYSAYZHAWqX54Bw==
To: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <pjw@kernel.org>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Mathieu
 Desnoyers
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, kernel-dev@igalia.com
Subject: Re: [PATCH 5/5] riscv: vdso: Implement
 __vdso_futex_robust_try_unlock()
In-Reply-To: <8d1bd8fb-1c35-4944-ab77-4dfc73ae5056@igalia.com>
References: <cover.1781876501.git.namcao@linutronix.de>
 <7e567e288f9ddeb2128f5d7ed83a518945fb50d9.1781876501.git.namcao@linutronix.de>
 <8d1bd8fb-1c35-4944-ab77-4dfc73ae5056@igalia.com>
Date: Wed, 08 Jul 2026 19:20:39 +0200
Message-ID: <874ii9pfdk.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_102046_432232_8668983B 
X-CRM114-Status: GOOD (  11.62  )
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

QW5kcsOpIEFsbWVpZGEgPGFuZHJlYWxtZWlkQGlnYWxpYS5jb20+IHdyaXRlczoKPiBIaSBOYW0g
Q2FvLCB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpIaSwKCj4gSG93IGhhdmUgeW91IHRlc3RlZCBp
dD8KCldpdGggYSBnZGIgYnJlYWtwb2ludCBpbiB0aGUgY3JpdGljYWwgc2Vzc2lvbi4KCj4gSSBi
ZWxpZXZlIHRoaXMgaXMgbWlzc2luZyB0aGUgaWZkZWYgaGVhZGVyIGd1YXJkCj4KPiAjaWZuZGVm
IF9fQVNNX1ZEU09fRlVURVhfSAo+ICNkZWZpbmUgX19BU01fVkRTT19GVVRFWF9ICgpSaWdodCwg
dGhhbmtzIQoKPj4gKyNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9JU0FfWkFDQVMpICYmIGRlZmlu
ZWQoQ09ORklHX1RPT0xDSEFJTl9IQVNfWkFDQVMpCj4+ICsjZGVmaW5lIEZVVEVYX0NBU19PVkVS
V1JJVEVfVkRTT19DU19SQU5HRSh2ZHNvLCBmZCwgaWR4LCB4bGVuLCBzeW1ib2wpCQkJCVwKPj4g
K3sJCQkJCQkJCQkJCQlcCj4+ICsJaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklT
Q1ZfSVNBX0VYVF9aQUNBUykpIHsJCQkJXAo+PiArCQl2b2lkICpzdGFydCA9IHN5bWJvbCh2ZHNv
LCBDT05DQVQzKGZ1dGV4X2xpc3QsIHhsZW4sIF90cnlfdW5sb2NrX2NzX2Nhc19zdGFydCkpO1wK
Pj4gKwkJdm9pZCAqZW5kICAgPSBzeW1ib2wodmRzbywgQ09OQ0FUMyhmdXRleF9saXN0LCB4bGVu
LCBfdHJ5X3VubG9ja19jc19jYXNfZW5kKSk7CVwKPj4gKwkJCQkJCQkJCQkJCVwKPj4gKwkJZnV0
ZXhfc2V0X3Zkc29fY3NfcmFuZ2UoZmQsIGlkeCwgKHVpbnRwdHJfdClzdGFydCwgKHVpbnRwdHJf
dCllbmQsIHhsZW4gPT0gMzIpOwlcCj4+ICsJfQkJCQkJCQkJCQkJXAo+PiArfQo+PiArI2Vsc2UK
Pj4gKyNkZWZpbmUgRlVURVhfQ0FTX09WRVJXUklURV9WRFNPX0NTX1JBTkdFKC4uLikKPj4gKyNl
bmRpZgo+PiArCj4+ICsjZGVmaW5lIEZVVEVYX1NFVF9WRFNPX0NTX1JBTkdFKHZkc28sIGZkLCBp
ZHgsIHhsZW4sIHN5bWJvbCkJCQkJCVwKPj4gK3sJCQkJCQkJCQkJCQlcCj4+ICsJdm9pZCAqc3Rh
cnQgPSBzeW1ib2wodmRzbywgQ09OQ0FUMyhmdXRleF9saXN0LCB4bGVuLCBfdHJ5X3VubG9ja19j
c19scnNjX3N0YXJ0KSk7CVwKPj4gKwl2b2lkICplbmQgICA9IHN5bWJvbCh2ZHNvLCBDT05DQVQz
KGZ1dGV4X2xpc3QsIHhsZW4sIF90cnlfdW5sb2NrX2NzX2xyc2NfZW5kKSk7CQlcCj4+ICsJCQkJ
CQkJCQkJCQlcCj4+ICsJZnV0ZXhfc2V0X3Zkc29fY3NfcmFuZ2UoZmQsIGlkeCwgKHVpbnRwdHJf
dClzdGFydCwgKHVpbnRwdHJfdCllbmQsIHhsZW4gPT0gMzIpOwkJXAo+PiArCQkJCQkJCQkJCQkJ
XAo+PiArCUZVVEVYX0NBU19PVkVSV1JJVEVfVkRTT19DU19SQU5HRSh2ZHNvLCBmZCwgaWR4LCB4
bGVuLCBzeW1ib2wpOwkJCQlcCj4+ICsJCQkJCQkJCQkJCQlcCj4KPiBTbyBpZiB0aGUgYnVpbGQg
aGFzIHN1cHBvcnQgZm9yIENBUywgdGhlIGZ1bmN0aW9uIG92ZXJ3cml0ZSB3aGF0IGl0IGhhZCAK
PiBqdXN0IHNldC4gV2h5IGRvIGl0IGV2ZW4gd3JpdGVzIGl0IGluIHRoZSBmaXJzdCBwbGFjZSB0
aGVuLCBjYW4ndCB0aGlzIAo+IGJlIGFuIGlmL2Vsc2U/CgpGdW5jdGlvbmFsbHkgc3BlYWtpbmcs
IGFuIGlmL2Vsc2UgbWFrZXMgbW9yZSBzZW5zZS4gSG93ZXZlciwgSSBjYW5ub3QKZmlndXJlIG91
dCBob3cgdG8gZG8gdGhhdCB3aXRob3V0IGNyZWF0aW5nIGEgY29tcGxldGUgbWVzcywgc2luY2UK
Kl90cnlfdW5sb2NrX2NzX2Nhc19zdGFydCBhbmQgKl90cnlfdW5sb2NrX2NzX2Nhc19lbmQgYXJl
IG5vdCBhbHdheXMKYXZhaWxhYmxlLiBJZiB5b3UgaGF2ZSBhIHN1Z2dlc3Rpb24sIHBsZWFzZSBk
byBsZXQgbWUga25vdy4gQnV0IGRvaW5nCml0IHRoaXMgd2F5IG9ubHkgY29zdHMgdXMgYSBmZXcg
bW9yZSBpbnN0cnVjdGlvbnMuCgpOYW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
