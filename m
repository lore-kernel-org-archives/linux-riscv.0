Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F05EC388F7
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 20:04:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BEEA207DE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 20:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+afHO0S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BEEA207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LZpt/15pr9v3gBuIkOl/B+I4ne8ynDUfFjqKngngfUI=; b=e+afHO0SQFcid9YGjI/FI6Xsm
	nFP9z3rzFLQXbIPbeWEniHvb0R9sn9LoyICQ+kB1jFttd11qbrdi56k/gTzDAk+hEwxbXvua6Rzs3
	y1Jre0U65ZdG93Mjbj3rpqXvHVDPBKXeNy9gllVEt2aVnTyh3Ci+Sa/pOkdKcI+k/I1KazFw3bK6z
	0HQln7klddlvkOVNVU4lzrudT/0kd/zAT9vLhxPZaq5L69JzR7nP9WfSxVQvOi7bUXmAT5NniV4ck
	wz9OLVcWpjGEbudhhQEQr3yBz2eB43cPJezWOlfb1jbJg9q1kL63xdMoqIsC7p8cknKBA4ntlyei3
	40Ho3G37A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdIp9-00059A-Cu; Thu, 12 Nov 2020 20:04:03 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdIp6-000580-Cn
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 20:04:01 +0000
IronPort-SDR: 61ybTCkUT74gBfV/DhciFkz0x74mXsWCVPjETS4lQwW3GBEAF8tFXZxpbZC9QTH2p6y1M0Xa5U
 3shxdnLsOpUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="149642861"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="149642861"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 12:03:51 -0800
IronPort-SDR: oOuoTu/7vhOTPZURxBJfR+3O5Vhizlr+P/M/kjNMij7Y+CaMuXLS6Ut1s+uZjAItUlxJKeDDZ5
 E3U5Oy2Ukmlg==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="542384739"
Received: from geigerri-mobl.ger.corp.intel.com (HELO
 btopel-mobl.ger.intel.com) ([10.252.34.175])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 12:03:49 -0800
Subject: Re: Status for RISC-V Summit
To: Drew Fustini <pdp7pdp7@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>
References: <CAEf4M_AUtGb3NXb+hh6CuY0_y26VF+bkVeZHbcBCbrA+HKRj_Q@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Message-ID: <79e3fe40-fff7-341e-420c-50b27d63803e@intel.com>
Date: Thu, 12 Nov 2020 21:03:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <CAEf4M_AUtGb3NXb+hh6CuY0_y26VF+bkVeZHbcBCbrA+HKRj_Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_150400_594137_646F161C 
X-CRM114-Status: GOOD (  17.55  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0xMS0xMiAxMzo0OCwgRHJldyBGdXN0aW5pIHdyb3RlOgo+IEhlbGxvLCBJIGFtIHVw
ZGF0aW5nIG15IEVtYmVkZGVkIExpbnV4IENvbmZlcmVuY2UgdGFsayBhYm91dCBMaW51eCBvbgo+
IFJJU0MtViBmb3IgdGhlIFJJU0MtViBTdW1taXQgaW4gRGVjZW1iZXIgWzFdLiAgSSB3YW50IHRv
IGhhdmUgYSBzbGlkZQo+IG9yIHR3byB0aGF0IGNhcHR1cmVzIHRoZSByZWNlbnQgYWNjb21wbGlz
aG1lbnRzIGZvciBSSVNDLVYgTGludXgKPiBzdXBwb3J0IGFuZCB3aGF0IGlzIG9uIHRoZSBob3Jp
em9uLgo+IAo+IEkgY3VycmVudCBoYXZlIGxpc3RlZCBhcyByZWNlbnQgYW5kIG9uZ29pbmcgd29y
azoKPiAKPiAtIEtWTSAoQW51cCBQYXRlbC9BdGlzaCBQYXRyYSkKPiAgICBbd2FpdGluZyBvbiBy
YXRpZmljYXRpb24gb2YgSHlwZXJ2aXNvciBzcGVjXQo+IC0gZUJQRiBKSVQgKEJqw7ZybiBUw7Zw
ZWwpCj4gLSAgS0dEQiBzdXBwb3J0IChWaW5jZW50IENoZW4pCj4gLSAga2V4ZWMva2R1bXAgc3Vw
cG9ydCAoTmljayBLb3NzaWZpZGlzKQo+IC0ga3Byb2Jlcy9rcmV0cHJvYmVzIChHdW8gUmVuKQo+
IC0gZ2VuZXJpYyB2RFNPIHN1cHBvcnQKPiAtIHN5c3pjYWxsZXIgc3VwcG9ydAo+IC0gYnVpbGQg
d2l0aCBMTFZNL2NsYW5nCj4gCj4gSSB3b3VsZCByZWFsbHkgYXBwcmVjaWF0ZSBhbnkgZmVlZGJh
Y2sgb24gd2hhdCBJIHNob3VsZCBhZGQsIG1vZGlmeSBvciByZW1vdmUuCj4KCldoYXQgYSBuaWNl
IHNsaWRlIGRlY2ssIERyZXchIExvb2tpbmcgZm9yd2FyZCB0byB0aGUgc3VtbWl0IHByZXNlbnRh
dGlvbi4KCk9uIHRoZSBlQlBGIHNpZGUgb2YgdGhpbmdzLCB3ZSd2ZSBnYWluZWQgUlZDIHN1cHBv
cnQuIEFzIHlvdSBrbm93IEJQRgpyZWFsbHkgc2hpbmVzIGluIHRoZSB0cmFjaW5nIHNpZGUsIHNv
IEknbSBwZXJzb25hbGx5IHZlcnkgZXhjaXRlZCB0aGF0ClJlbiBpcyBzdGlsbCB3b3JraW5nIG9u
IGtwcm9iZXMgLS0gaG9wZWZ1bGx5IGl0J2xsIGJlIG1lcmdlZCB0aGUgbmV4dAp3aW5kb3cuIFdo
ZW4ga3Byb2JlcyBsYW5kIHdlIGNhbiB1c2UgYnBmdHJhY2UgWzJdIG9uIFJJU0MtVi4gSXQnbGwg
bWFrZQpwZXJmIGEgd2hvbGUgbG90IG1vcmUgdXNhYmxlIGFzIHdlbGwuCgpFbWlsIFJlbm5lciBC
ZXJ0aGluZyBhZGRlZCBqdW1wLWxhYmVsIHN1cHBvcnQuCgouLi5idXQgdGhhdCdzIHByb2JhYmx5
IHRvbyBtdWNoIGRldGFpbCBmb3IgdGhlIGRlY2suIDotUAoKCkknbGwgdGFrZSBhIG1vcmUgZGV0
YWlsZWQgbG9vaywgYW5kIGdldCBiYWNrIGlmIEkgaGF2ZSBhbnkgZmVlZGJhY2suCgoKQ2hlZXJz
LApCasO2cm4KClsyXSBodHRwczovL2dpdGh1Yi5jb20vaW92aXNvci9icGZ0cmFjZQoKPiBUaGFu
ayB5b3UsCj4gRHJldwo+IAo+IFsxXSBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9wcmVzZW50YXRp
b24vZC8xbUQteVBkLXpCLUROWFZUVE5XR2QyMkVadVNpOV80aGNKR0hZenJEUUxqVS9lZGl0P3Vz
cD1zaGFyaW5nCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
