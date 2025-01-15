Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4475BC02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWHG9tAos/NxBbHU/wH/KUHn/1GbsX9xtxTFgBuD6g8=; b=0IO8LsLFVB1mAX
	IUWvSFIHblIum3fQ740F+R1nkC2bkh6d2uwxUUkYe7yxM/8svUxGXBHDCqQdZ7xPJjADDy2I9pm5L
	2esY9Tfssz0s9sFBrZ/lAzQ1KXPpno+6f2lc3TiBCaaqzClhyVdPD7iK3w/tx4f+EL1Me6KNXfA+V
	1AKPyFBIKZj+31Guwx91d4gYh+WI3hAfj0tI1PIw3goye1vHWvkCeSSSAIf0d+SPNFbPEkWR4U86b
	wQ4R/eqkbiYh6eOWbnhwDjmJp2KDTwyHdRKwixZaWM0BxJ6Tf0aAz6XBzBOoqDn27CZNJpyvW/vSj
	Z2a45viaW7QhW+fwhv9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxFg-0000000ArRu-2a0N;
	Wed, 15 Jan 2025 06:51:44 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxFd-0000000ArQ1-3u3k
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 06:51:43 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id CA25592009D; Wed, 15 Jan 2025 07:51:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C3F0192009C;
	Wed, 15 Jan 2025 06:51:37 +0000 (GMT)
Date: Wed, 15 Jan 2025 06:51:37 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Jeff Law <jeffreyalaw@gmail.com>
cc: Florian Weimer <fweimer@redhat.com>, linux-riscv@lists.infradead.org, 
    Palmer Dabbelt <palmer@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>
Subject: Re: Page sizes supported by RISC-V
In-Reply-To: <31ce4016-9420-4143-ae31-faf36a878cb4@gmail.com>
Message-ID: <alpine.DEB.2.21.2501150631330.50458@angie.orcam.me.uk>
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com> <e55950a2-beb0-4f2a-81da-1c66724116d7@gmail.com> <8734lixzss.fsf@oldenburg.str.redhat.com> <cbbc9925-12a5-4043-a6c5-ccd1ef0997c8@gmail.com> <31ce4016-9420-4143-ae31-faf36a878cb4@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_225142_129577_A208C986 
X-CRM114-Status: GOOD (  20.30  )
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

T24gVHVlLCAxNCBKYW4gMjAyNSwgSmVmZiBMYXcgd3JvdGU6Cgo+ID4+IEkgdW5kZXJzdGFuZCB0
aGF0IG5vdCBtYWtpbmcgYSBjYWxsIGluIHRoZSBzcGVjaWZpY2F0aW9ucyBhdm9pZHMgdGhlCj4g
Pj4gbmVlZCB0byByZXNvbHZlIHRoZXNlIGNvbmZsaWN0cy7CoCBCdXQgaWYgeW91IGRvbid0IGRl
ZmluZSBhIG1heGltdW0gcGFnZQo+ID4+IHNpemUgdGhlcmUsIGl0IGlzIGVmZmVjdGl2ZWx5IHNw
ZWNpZmllZCBhcyA0MDk2IGJ5dGVzLsKgIFRoaXMgd2lsbCBjYXVzZQo+ID4+IHByb2JsZW1zIGlm
IGRpc3RyaWJ1dGlvbnMgdGFyZ2V0aW5nIGxhcmdlIHN5c3RlbXMgd2FudCBhIGxhcmdlciBwYWdl
Cj4gPj4gc2l6ZSBiZWNhdXNlIGl0IGJldHRlciBhbGlnbnMgd2l0aCB0aGUga2luZCBvZiBoYXJk
d2FyZSB0aGV5IHRhcmdldC4KPiA+PiBJdCdzIHJlYWxseSBiYWQgZm9yIGNyb3NzLWRpc3RyaWJ1
dGlvbiBiaW5hcnkgY29tcGF0aWJpbGl0eSwgc29tZXRoaW5nCj4gPj4gdGhhdCdzIGltcG9ydGFu
dCBvdXRzaWRlIHRoZSBlbWJlZGRlZCBzcGFjZSBhbmQgcHJvYmFibHkgbmVjZXNzYXJ5IGZvcgo+
ID4+IG1haW5zdHJlYW1pbmcuCj4gPj4KPiA+PiAoT2YgY291cnNlIHlvdSBrbm93IGFsbCB0aGlz
LiA4LSkKPiA+IFl1cC7CoCBPbmNlIGl0J3MgYmFrZWQgaW50byBvbmUgc2lnbmlmaWNhbnQgZGlz
dHJvLCBpdCdzIGRvaW5nIHRvIGJlIAo+ID4gYmxvb2R5IGhhcmQgdG8gY2hhbmdlLsKgIEknbSBz
dXJlIHdlIGJvdGggcmVtZW1iZXIgdGhlIFBQQyBwYWdlc2l6ZSBzdHVmZiAKPiA+IGZyb20gYSBm
ZXcgeWVhcnMgYmFjayA7KAo+ID4gCj4gPiBJIHN0cm9uZ2x5IHN1c3BlY3QgdGhlIGxhY2sgb2Yg
c3BlY2lmaWNhdGlvbiBoZXJlIGlzIG1lYW4gdG8gZ2l2ZSAKPiA+IGRlZ3JlZXMgb2YgZnJlZWRv
bSB0byB0aGUgaW1wbGVtZW50b3JzLCBidXQgc29tZXRpbWVzIHRob3NlIHdyaXRpbmcgdGhlIAo+
ID4gc3BlY3MgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhlIGltcGxpY2F0aW9uIG9mIGxlYXZp
bmcgdGhpbmdzIGxpa2UgCj4gPiB0aGlzIHVuc3BlY2lmaWVkIGFuZCBob3cgbXVjaCBwYWluIGl0
IHJlYWxseSBjYXVzZXMgaW4gdGhlIGVuZC4KPiBTbyByZXN1cnJlY3RpbmcgdGhpcyBkaXNjdXNz
aW9uLgo+IAo+IElzIHRoZXJlIGFueSByZWFsaXN0aWMgY2hhbmNlIG9mIGJ1bXBpbmcgdGhlIG1p
bmltdW0gcGFnZXNpemUgZm9yIHJpc2MtdiAKPiBhdCB0aGlzIHBvaW50PyAgWHUgTHUgYW5kIGhp
cyB0ZWFtIGhhdmUgc29tZSBjb21wZWxsaW5nIGRhdGEgdGhhdCAKPiBpbmRpY2F0ZXMgbW92aW5n
IGZvcndhcmQgdG8gNjRrIGNvdWxkIGJlIGhpZ2hseSBwcm9maXRhYmxlLiAgVGhhdCB3b3JrIAo+
IHdhcyBkb25lIG9uIGFhcmNoNjQsIGJ1dCBzaG91bGQgYmUgZ2VuZXJhbGx5IGFwcGxpY2FibGUg
dG8gcmlzY3YgYXMgd2VsbC4KCiBDYW4ndCB3ZSBzaW1wbHkgbWFrZSBhIHJlYXNvbmFibGUgZ3Vl
c3MvYXNzdW1wdGlvbiBqdXN0IGZvciB0aGUgcHVycG9zZSAKb2YgdG9vbGluZz8KCiBGb3IgZXhh
bXBsZSBNSVBTIGhhcmR3YXJlIGhhcyBzdXBwb3J0ZWQgcGFnZSBzaXplcyBvZiB1cCB0byAyNTZN
aUIgc2luY2UgCmZvcmV2ZXIgYW5kIG9uZXMgb2YgdXAgdG8gMjU2VGlCIHNpbmNlIH5SMywgYnV0
IHdlIGNob3NlIHRvIHN1cHBvcnQgc2l6ZXMgCm9mIHVwIHRvIDY0S2lCIG9ubHkgb24gdGhlIHNv
ZnR3YXJlIHNpZGUuICBBbmQgdGhhdCB3YXMgc29tZSAyMCB5ZWFycyBhZ28sIApiYWNrIHdoZW4g
aGFyZHdhcmUgcmVzb3VyY2VzIHdlcmUgY29uc2lkZXJhYmx5IG1vcmUgbGltaXRlZCBhbmQgdGhl
cmVmb3JlIApleHRyYSBWTSBzcGFjZSBjb25zdW1wdGlvbiBmcm9tIGdldHRpbmcgdGhpbmdzIGFs
aWduZWQgdG8gYSBsYXJnZXIgcGFnZSAKc2l6ZSB3YXMgbW9yZSBwYWluZnVsLgoKIEJhc2VkIG9u
IHRoZSBleHBlcmllbmNlIHdpdGggTUlQUy9BQXJjaDY0IHNoYXJlZCBoZXJlIHRoZXJlIHNob3Vs
ZCBiZSBubwpkaXNhZ3JlZW1lbnQgYXMgdG8gZ29pbmcgZm9yIGF0IGxlYXN0IDY0S2lCIEkgc3Vw
cG9zZS4gIFRoZW4gc2hhbGwgd2UgZ28gCmJleW9uZCB0byBsZWF2ZSByb29tIGZvciBzb21lIGV4
cGFuc2lvbiwgc3VjaCBhcyBmb3IgMjU2S2lCPwoKICBNYWNpZWoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
