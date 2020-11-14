Return-Path: <SRS0=8VSx=EU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EFDC5519F
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2020 08:34:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6593F2222C
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2020 08:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qVC17kqB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6593F2222C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g2xU+4jgiyR280cYF85A031+aXHiT3sqUn0jlfs0+oE=; b=qVC17kqBJ/gdQD1wmRZ0wFt0R
	lK8yJ2hKtJb9omULLMMKR0EpGLNJ6XeeAvwclk4NRch3jxq5N74mluZofvmqnvRBBYqepnZnBmE6B
	LnmX2ZOxUMv2colhbzU3MVKeiq8HQOv2ZtluK+Cjw6uzWK0Sp0LmgXke9l/Bszv5UQiMuX1mT6JXM
	63NHLAi0uALlYbWkLKLaIBycod0JxG9tgw9KKZ+9eePh+/7aR+BZiG2JUK4x8N++CEGw9WkFJr2qT
	vSp7nCK/cSQMMsy3pW+yO6o4MRvp957X3p2qnY2f9p/1gdBFyRK0nnUiQ0bdVsaENYwV8bOczIBfe
	Itpw2i8AA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdr0M-0001D9-JG; Sat, 14 Nov 2020 08:33:54 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdr0J-0001Ca-04
 for linux-riscv@lists.infradead.org; Sat, 14 Nov 2020 08:33:52 +0000
X-Originating-IP: 90.112.190.212
Received: from [192.168.1.12] (lfbn-gre-1-231-212.w90-112.abo.wanadoo.fr
 [90.112.190.212]) (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 20977FF802;
 Sat, 14 Nov 2020 08:33:44 +0000 (UTC)
Subject: Re: Status for RISC-V Summit
To: Nick Kossifidis <mick@ics.forth.gr>, Drew Fustini <pdp7pdp7@gmail.com>
References: <CAEf4M_AUtGb3NXb+hh6CuY0_y26VF+bkVeZHbcBCbrA+HKRj_Q@mail.gmail.com>
 <78887a31983b1d7324cb5d934dabfc3a@mailhost.ics.forth.gr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <2bfee4c9-b29b-2da6-7cc8-725d5c068794@ghiti.fr>
Date: Sat, 14 Nov 2020 03:33:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <78887a31983b1d7324cb5d934dabfc3a@mailhost.ics.forth.gr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_033351_146695_ABDD10D5 
X-CRM114-Status: GOOD (  17.18  )
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
Cc: Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atishp@atishpatra.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpMZSAxMS8xMy8yMCDDoCAxOjI5IEFNLCBOaWNrIEtvc3NpZmlkaXMgYSDDqWNyaXTCoDoK
PiDOo8+EzrnPgiAyMDIwLTExLTEyIDE0OjQ4LCBEcmV3IEZ1c3Rpbmkgzq3Os8+BzrHPiM61Ogo+
PiBIZWxsbywgSSBhbSB1cGRhdGluZyBteSBFbWJlZGRlZCBMaW51eCBDb25mZXJlbmNlIHRhbGsg
YWJvdXQgTGludXggb24KPj4gUklTQy1WIGZvciB0aGUgUklTQy1WIFN1bW1pdCBpbiBEZWNlbWJl
ciBbMV0uwqAgSSB3YW50IHRvIGhhdmUgYSBzbGlkZQo+PiBvciB0d28gdGhhdCBjYXB0dXJlcyB0
aGUgcmVjZW50IGFjY29tcGxpc2htZW50cyBmb3IgUklTQy1WIExpbnV4Cj4+IHN1cHBvcnQgYW5k
IHdoYXQgaXMgb24gdGhlIGhvcml6b24uCj4+Cj4+IEkgY3VycmVudCBoYXZlIGxpc3RlZCBhcyBy
ZWNlbnQgYW5kIG9uZ29pbmcgd29yazoKPj4KPj4gLSBLVk0gKEFudXAgUGF0ZWwvQXRpc2ggUGF0
cmEpCj4+IMKgIFt3YWl0aW5nIG9uIHJhdGlmaWNhdGlvbiBvZiBIeXBlcnZpc29yIHNwZWNdCj4+
IC0gZUJQRiBKSVQgKEJqw7ZybiBUw7ZwZWwpCj4+IC3CoCBLR0RCIHN1cHBvcnQgKFZpbmNlbnQg
Q2hlbikKPj4gLcKgIGtleGVjL2tkdW1wIHN1cHBvcnQgKE5pY2sgS29zc2lmaWRpcykKPj4gLSBr
cHJvYmVzL2tyZXRwcm9iZXMgKEd1byBSZW4pCj4+IC0gZ2VuZXJpYyB2RFNPIHN1cHBvcnQKPj4g
LSBzeXN6Y2FsbGVyIHN1cHBvcnQKPj4gLSBidWlsZCB3aXRoIExMVk0vY2xhbmcKPj4KPj4gSSB3
b3VsZCByZWFsbHkgYXBwcmVjaWF0ZSBhbnkgZmVlZGJhY2sgb24gd2hhdCBJIHNob3VsZCBhZGQs
IG1vZGlmeSBvciAKPj4gcmVtb3ZlLgo+Pgo+PiBUaGFuayB5b3UsCj4+IERyZXcKPj4KPiAKPiBO
aWNlIHdvcmsgRHJldywgdmVyeSB1c2VmdWwgcHJlc2VudGF0aW9uICEKPiAKPiBUaGVyZSBpcyBh
bHNvIEFsZXggR2hpdGkncyB3b3JrIG9uIHN2NDggYW5kIHJlbG9jYXRhYmxlIGtlcm5lbDoKPiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8/c2Vy
aWVzPTI5OTE5Nwo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1y
aXNjdi9saXN0Lz9zZXJpZXM9Mjk3NTI1Cj4gCj4gSSBkb24ndCBrbm93IGlmIHRoYXQncyBzdGls
bCBhY3RpdmUgdGhvdWdoIGFuZCB3aGF0J3MgdGhlIHBsYW4gZm9yIAo+IG1vdmluZyBmb3J3YXJk
LCBtYXliZSBBbGV4IChjY2VkKSBjYW4gdGVsbCB1cyBtb3JlLgo+IAoKSSBjbGVhcmx5IGRpZCBu
b3QgbWFrZSBhbnkgcHJvZ3Jlc3Mgc2luY2UgSSBoYXZlIHBvc3RlZCB0aG9zZSBzZXJpZXMuIEkg
CndpbGwgaGF2ZSBtb3JlIHRpbWUgaW4gdGhlIHdlZWtzIHRvIGNvbWUsIHNvIHdlIGNhbiBzYXkg
aXQgaXMgc3RpbGwgaW4gCmRldmVsb3BtZW50LgoKVGhhbmtzIGZvciByZW1pbmRpbmcgbWUgdGhp
cyBOaWNrIDopCgpBbGV4Cgo+IFJlZ2FyZHMsCj4gTmljawo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
