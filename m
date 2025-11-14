Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9FECDB46F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 02:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHaWIIHA2VOx3g9gvDJj68eHGWCdq6rLtFt2k3GWEpc=; b=DQ/79g2rc8f8bq
	RNhggUz+r34n3axiqp7sdda6Fvy5dqnX5opVmB6xlB5CSEsAnj6w6NnLhWje+mmWH7DXFEBTn8sZo
	KdQPw3pEjyiQmk++GA25N71qsCxWkF+yxt6QUdXmpTj1bnDy/EqTZxgI1X7uVyugP37KJMKFhBMRa
	G4VGuffE2TK1mz1EXZjLFSpa9Sf/gjaFVZBXZMxz5Pdl5tFcgnB3yoRQTb8ZmFHeY6sjBE3YqKtuH
	FGROr4xacCHn73cVVvjmzkBSF0Qvdllr8uhGIfsi0GWSmG4CnA4ULQtAiT+uxRL96ARVXYbRZNdzl
	EaXjWS1jJ7NJEIN5eaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjJB-0000000BPHF-3T1E;
	Fri, 14 Nov 2025 02:13:05 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjJ7-0000000BPFn-0NDy
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 02:13:03 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-45038ffac4fso688118b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 18:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763086374; x=1763691174; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBM3vq37SG4A6w1IUkBk6VD1Hqp+KmIvSGnOQB9SSPA=;
        b=AxJs5IU3Ex7V7beompP1UGxRQNs1VlzlUiYP09xRs4MXUjQ21+cOKvMcBb6OaUNLNT
         fPDGK2But6AP/ZUHm7stIDguZbXmoXNGfaUnC9Ao3RwcYwf9rY7lQF3nePflYk6gEy3Y
         xd2RjJlHHP/bAZTreTc41GUimGHruCRaPBsoMHxnennj+P3t/UMQzhCNjHOOYhxE0dK3
         ZwW2GOjWfFEJnMIWCK9bN8kzhKdcxaD3iGD+iYPGV/sKhpfpEr+14BuihWxFL/YzN24z
         NKXfXZwtEXzziA9XgQRu6sq7KPd8IYy9YAOzoIOJTjEd12Qmse9Qwlk3ufHxMYYDcVDq
         XIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763086374; x=1763691174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBM3vq37SG4A6w1IUkBk6VD1Hqp+KmIvSGnOQB9SSPA=;
        b=XbjZMFrvci+oIkrs1hGzSGhboO6MD7JOZBrp0TEbe3NQu+IfaYNvdv20H7ggyV6uOU
         AIXQQsLvR6CL1jlcV1WNZPFqQRjfDWZ7upo93jQgmaY+Bvl1TZpVKeEDmGEsxuaAcGFe
         ouqi5LQBsygkdM+9ee2z4/4T2ozuo9+8torrevx5O0Kld828TjXH90jLtqGF1R9d9pIE
         XriuMSt2ul1EMurvpzDDMCROMuRGBwKwbgyB6R5/KRGVVZz6ZvX+AOgba9SZe9pnYUXy
         ELm4sI5m0VhihJprHpb9+xgBt0zC+zEcyuf/wcuRYRKOioVBaa56hFWHy48cp24HmPkK
         9dAg==
X-Forwarded-Encrypted: i=1; AJvYcCXqkkwCeBTVd7SkHOm9b57tAcIFErNAc2tKpthJbHlQ3rCmw7nCf7rHYKPtoaYYHsHpz7OtUmD9IUxuxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxddcOwCmutSzBJcyFqCMFWm2w5rEnRXrpEwRNjchEdhKM3s6BF
	gvobxweoLgbNsrrTOTNWVIZe5FS+PNw6ysaZ+hOgmoUfLKQX5eHmytyjEEp9hDV4+xNmyX8LGmG
	Aez2bTlTX0q7Qab6CDQ8kj/EQZWrrqOovmljaCrnyTQ==
X-Gm-Gg: ASbGncsfAeSjA1lrp+vC4yOAeWL7VqD2XZx7cncr3ktSh+OIxmX+jews0dpzdjwA9Rb
	AlXa8IL9xdKow2GndUNJaMobAaxnr/g5H3zdHjkwwtWVhrML2jstyqotlQJiQQJk6Eru5UlVktW
	zc1rrs4M1bbe7UKRGQc5fzcSlxFgD/7MAEQXNnbzBJwZBwdURHFJx+r9jJBHgnddkTrUrpYUXhd
	0VSSpQWpxWK0Jl5wtNFm7R7d4HmAA8xDpThtxBAV9OPRe2aH0wjt/bZl+KVbW4utZHCV1JhLoAb
	qceQt0sl
X-Google-Smtp-Source: AGHT+IHy0n4gQ/6J6Qsut3+AMNzWOn2pYSEr7TLktEg1mu/utZ4gYoyrlrE9G2GmaDzmMmkxvEL9sFE1ukImX70O6Wg=
X-Received: by 2002:a05:6808:221f:b0:450:76f:b1a8 with SMTP id
 5614622812f47-450973ba31emr745094b6e.30.1763086373692; Thu, 13 Nov 2025
 18:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20251111073459.44030-1-cuiyunhui@bytedance.com> <CAD=FV=VGvp5XsT9R9-LR-dSbGAZ5YVcm=HxBYibCcSdVnNkyPA@mail.gmail.com>
In-Reply-To: <CAD=FV=VGvp5XsT9R9-LR-dSbGAZ5YVcm=HxBYibCcSdVnNkyPA@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 14 Nov 2025 10:12:41 +0800
X-Gm-Features: AWmQ_bkAOsbu28DhTbtm-Wf7KobQu9Ki7D8PlLDLwgn0w5kVCtpXXRPq6fTQ_oc
Message-ID: <CAEEQ3wnGUDW_dqbbhM8nLeDH0kL=s89=8x2ESYs=Nm6AMzkV4A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 0/2] Add HARDLOCKUP_DETECTOR_PERF
 support for RISC-V
To: Doug Anderson <dianders@chromium.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_181301_652275_C0B08232 
X-CRM114-Status: GOOD (  22.36  )
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

SGkgRG91ZywKCk9uIEZyaSwgTm92IDE0LCAyMDI1IGF0IDY6NTHigK9BTSBEb3VnIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBNb24sIE5vdiAx
MCwgMjAyNSBhdCAxMTozNeKAr1BNIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29t
PiB3cm90ZToKPiA+Cj4gPiBBZnRlciBkaXNjdXNzaW9uIFsxXSxbMl0sIGhhcmRsb2NrdXBfcGVy
ZiBjYW5ub3QgYmUgY29tcGxldGVseSByZXBsYWNlZCBieQo+ID4gdGhlIGhhcmRsb2NrdXBfYnVk
ZHkgYXBwcm9hY2gsIHNvIHRoaXMgcGF0Y2ggaXMgc3RpbGwgYmVpbmcgc3VibWl0dGVkLgo+ID4K
PiA+IHYxLT52MjoKPiA+IFRoZSBjb250ZW50cyBvZiBhcmNoL2FybTY0L3dhdGNoZG9nX2hsZC5j
IGFyZSBkaXJlY3RseSBjb25zb2xpZGF0ZWQgaW50bwo+ID4ga2VybmVsL3dhdGNoZG9nX3BlcmYu
Yy4KPiA+Cj4gPgo+ID4gdjItPnYzOgo+ID4gQWRkIENPTkZJR19XQVRDSERPR19QRVJGX0FESlVT
VF9QRVJJT0QgdG8gZW5jbG9zZSB0aGUgcGVyaW9kIHVwZGF0ZSBsb2dpYywKPiA+IHNlbGVjdCBp
dCBieSBkZWZhdWx0IG9uIGFybTY0IGFuZCByaXNjdiwgd2l0aG91dCBhZmZlY3Rpbmcgb3RoZXIg
YXJjaGVzCj4gPiBsaWtlIHg4NiBhbmQgUFBDLgo+ID4KPiA+IHYzLT52NDoKPiA+IFBsYWNlIHRo
ZSBsaW5lICJzZWxlY3QgV0FUQ0hET0dfUEVSRl9BREpVU1RfUEVSSU9EIGlmIEhBUkRMT0NLVVBf
REVURUNUT1JfUEVSRiAmJiBDUFVfRlJFUSIKPiA+IGluIHRoZSBLY29uZmlnIGZpbGVzIGZvciBh
cm02NCBhbmQgcmlzY3YgaW4gb25lIGxpbmUsIHdpdGggbm8gbGluZSBicmVha3MuCj4gPgo+ID4g
djQtPnY1Ogo+ID4gUmVtb3ZlIF9fd2VhayBmcm9tIGh3X25taV9nZXRfc2FtcGxlX3BlcmlvZCgp
Cj4gPgo+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBRD1GVj1VRWhWQ0Q2
SmVoUWkxd29yMnNTbXRUTER5Zj0zN3hmby1ET1RLMT11MXh6QUBtYWlsLmdtYWlsLmNvbS8gWzFd
Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MTYxNDUxMjIuNDE2
MTI4LTEtd2FuZ2ppbmNoYW82MDBAZ21haWwuY29tLyBbMl0KPiA+Cj4gPiBZdW5odWkgQ3VpICgy
KToKPiA+ICAgd2F0Y2hkb2c6IG1vdmUgYXJtNjQgd2F0Y2hkb2dfaGxkIGludG8gY29tbW9uIGNv
ZGUKPiA+ICAgcmlzY3Y6IGFkZCBIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgc3VwcG9ydAo+ID4K
PiA+ICBhcmNoL2FybTY0L0tjb25maWcgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBhcmNoL2Fy
bTY0L2tlcm5lbC9NYWtlZmlsZSAgICAgICB8ICAxIC0KPiA+ICBhcmNoL2FybTY0L2tlcm5lbC93
YXRjaGRvZ19obGQuYyB8IDk0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAg
YXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgfCAgMyArCj4gPiAgZHJpdmVycy9wZXJm
L2FybV9wbXUuYyAgICAgICAgICAgfCAxMCArKystCj4gPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3Bt
dV9zYmkuYyAgICAgfCAxMCArKysrCj4gPiAgaW5jbHVkZS9saW51eC9wZXJmL2FybV9wbXUuaCAg
ICAgfCAgMiAtCj4gPiAga2VybmVsL3dhdGNoZG9nX3BlcmYuYyAgICAgICAgICAgfCA4MyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgbGliL0tjb25maWcuZGVidWcgICAgICAgICAg
ICAgICAgfCAgOCArKysKPiA+ICA5IGZpbGVzIGNoYW5nZWQsIDExNCBpbnNlcnRpb25zKCspLCA5
OCBkZWxldGlvbnMoLSkKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9rZXJuZWwv
d2F0Y2hkb2dfaGxkLmMKPgo+IFBlcmhhcHMgeW91IG1pc3NlZCB0aGF0IChJIHRoaW5rKSBBbmRy
ZXcgaGFkIGFscmVhZHkgZHJvcHBlZCB5b3VyIHY0Cj4gZHVlIHRvIHRoZSBLZXJuZWwgVGVzdCBS
b2JvdCBmaW5kaW5nIGEgcHJvYmxlbS4gU2VlOgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDI1MTAyNDA3MDEuZUI2cjk3VjMtbGtwQGludGVsLmNvbQo+Cj4gSSBkb24ndCB0aGluayB5
b3UndmUgZml4ZWQgdGhlc2UgcHJvYmxlbXMgaW4gdjUsIGhhdmUgeW91PyBJIHRoaW5rIHlvdQo+
IG5lZWQgYSB2NiBmb3IgaXQ/IEkgaGF2ZW4ndCBkdWcgYWxsIHRoZSB3YXksIGJ1dCBJJ2Qgc3Vz
cGVjdCB0aGUKPiBjb21waWxlIGVycm9yIGlzIGlmICJIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYi
IGlzIGRlZmluZWQgYnV0IG5vdAo+ICJDUFVfRlJFUSIuIEluZGVlZCwgdGhhdCBtYXRjaGVzIHRo
ZSBjb25maWcgaW4gdGhlIHJlcG9ydC4uLgo+CgpUaGFua3MgZm9yIHRoZSByZW1pbmRlci4gSSBp
bmRlZWQgbWlzc2VkIHJlcGx5aW5nIHRvIHRoZSBlbWFpbCBkYXRlZApPY3RvYmVyIDI2dGggcmVn
YXJkaW5nIHRoZSBlcnJvciAibGQubGxkOiBlcnJvcjogdW5kZWZpbmVkIHN5bWJvbDoKaHdfbm1p
X2dldF9zYW1wbGVfcGVyaW9kIi4KV2UgY2FuIGZpeCBpdCBkaXJlY3RseSBhcyBmb2xsb3dzOgot
ICAgICAgIHNlbGVjdCBXQVRDSERPR19QRVJGX0FESlVTVF9QRVJJT0QgaWYgSEFSRExPQ0tVUF9E
RVRFQ1RPUl9QRVJGCiYmIENQVV9GUkVRCisgICAgICAgc2VsZWN0IFdBVENIRE9HX1BFUkZfQURK
VVNUX1BFUklPRCBpZiBIQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYKQmVjYXVzZSB3aGVuIENQVV9G
UkVRIGlzIG5vdCBkZWZpbmVkLCB0aGVyZSBpcyBhIHN0dWIgZnVuY3Rpb24sIGFuZAp0aGUgY29y
cmVzcG9uZGluZyBtYXhfY3B1X2ZyZXEgd2lsbCBiZSBzZXQgdG8gU0FGRV9NQVhfQ1BVX0ZSRVEu
Cgo+Cj4gLURvdWcKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
