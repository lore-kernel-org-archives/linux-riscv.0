Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B222BC11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 16:39:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A7AA61416
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 16:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A7AA61416
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usvg2OrbXYmohFa0h/VEb842C6cLnAC8/+aNHsZOIC8=; b=dc3XD9FYciTLIJ
	GFe51jMmQKHfogtJ+TMLwOaDS4XlVzAi0cqBdJoiK8tkzo4WknJZS+iP4iXWplPG099UYKSImicCi
	oBc3TctEJgMcmjGoRxCuj/WVsh1jckVyFnLftU0TOHOD9P4X7OdXGHiGtc8+p4YdWiP+FdeApBtb6
	tG0narYxF5qmYiWuwisvCBxS+sDfb7SWJQR3blBzLa+c2qj8fFRXjRUbLxvlgVvP+bY0AxVAaFyoO
	WAiJT5yGGQ1jSamvJArralUNwQJTH0aohXBb2xmUoXJfTpAFaeCTuit8+M8ektlMMoffQkOI8n4I+
	lHJuLAUWxM/KvdJqOI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzMBx-003Xz8-5F; Fri, 02 Jul 2021 16:39:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzMBk-003XxD-KO; Fri, 02 Jul 2021 16:38:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45060147A;
 Fri,  2 Jul 2021 09:38:43 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.15.239])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94E3C3F5A1;
 Fri,  2 Jul 2021 09:38:38 -0700 (PDT)
Date: Fri, 2 Jul 2021 17:38:36 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Joe Perches <joe@perches.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Zhu Lingshan <lingshan.zhu@intel.com>, wanpengli@tencent.com,
 Like Xu <like.xu@linux.intel.com>, eranian@google.com,
 weijiang.yang@intel.com, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, kan.liang@linux.intel.com,
 ak@linux.intel.com, kvm@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, joro@8bytes.org, x86@kernel.org,
 linux-csky@vger.kernel.org, wei.w.wang@intel.com,
 xen-devel@lists.xenproject.org, liuxiangdong5@huawei.com,
 bp@alien8.de, Paul Walmsley <paul.walmsley@sifive.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 like.xu.linux@gmail.com, Nick Hu <nickhu@andestech.com>,
 seanjc@google.com, linux-kernel@vger.kernel.org,
 pbonzini@redhat.com, vkuznets@redhat.com
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <20210702163836.GB94260@C02TD0UTHF1T.local>
References: <20210622094306.8336-1-lingshan.zhu@intel.com>
 <20210622094306.8336-2-lingshan.zhu@intel.com>
 <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
 <7379289718c6826dd1affec5824b749be2aee0a4.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7379289718c6826dd1affec5824b749be2aee0a4.camel@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_093848_798718_B1293566 
X-CRM114-Status: GOOD (  19.03  )
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

T24gRnJpLCBKdWwgMDIsIDIwMjEgYXQgMDk6MDA6MjJBTSAtMDcwMCwgSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gT24gRnJpLCAyMDIxLTA3LTAyIGF0IDEzOjIyICswMjAwLCBQZXRlciBaaWpsc3RyYSB3
cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDIyLCAyMDIxIGF0IDA1OjQyOjQ5UE0gKzA4MDAsIFpodSBM
aW5nc2hhbiB3cm90ZToKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2V2ZW50cy9jb3JlLmMg
Yi9hcmNoL3g4Ni9ldmVudHMvY29yZS5jCj4gW10KPiA+ID4gQEAgLTkwLDYgKzkwLDI3IEBAIERF
RklORV9TVEFUSUNfQ0FMTF9OVUxMKHg4Nl9wbXVfcGVic19hbGlhc2VzLCAqeDg2X3BtdS5wZWJz
X2FsaWFzZXMpOwo+ID4gPiDCoMKgKi8KPiA+ID4gwqBERUZJTkVfU1RBVElDX0NBTExfUkVUMCh4
ODZfcG11X2d1ZXN0X2dldF9tc3JzLCAqeDg2X3BtdS5ndWVzdF9nZXRfbXNycyk7Cj4gPiA+IMKg
Cj4gPiA+IAo+ID4gPiArREVGSU5FX1NUQVRJQ19DQUxMX1JFVDAoeDg2X2d1ZXN0X3N0YXRlLCAq
KHBlcmZfZ3Vlc3RfY2JzLT5zdGF0ZSkpOwo+ID4gPiArREVGSU5FX1NUQVRJQ19DQUxMX1JFVDAo
eDg2X2d1ZXN0X2dldF9pcCwgKihwZXJmX2d1ZXN0X2Nicy0+Z2V0X2lwKSk7Cj4gPiA+ICtERUZJ
TkVfU1RBVElDX0NBTExfUkVUMCh4ODZfZ3Vlc3RfaGFuZGxlX2ludGVsX3B0X2ludHIsICoocGVy
Zl9ndWVzdF9jYnMtPmhhbmRsZV9pbnRlbF9wdF9pbnRyKSk7Cj4gPiA+ICsKPiA+ID4gK3ZvaWQg
YXJjaF9wZXJmX3VwZGF0ZV9ndWVzdF9jYnModm9pZCkKPiA+ID4gK3sKPiA+ID4gKwlzdGF0aWNf
Y2FsbF91cGRhdGUoeDg2X2d1ZXN0X3N0YXRlLCAodm9pZCAqKSZfX3N0YXRpY19jYWxsX3JldHVy
bjApOwo+ID4gPiArCXN0YXRpY19jYWxsX3VwZGF0ZSh4ODZfZ3Vlc3RfZ2V0X2lwLCAodm9pZCAq
KSZfX3N0YXRpY19jYWxsX3JldHVybjApOwo+ID4gPiArCXN0YXRpY19jYWxsX3VwZGF0ZSh4ODZf
Z3Vlc3RfaGFuZGxlX2ludGVsX3B0X2ludHIsICh2b2lkICopJl9fc3RhdGljX2NhbGxfcmV0dXJu
MCk7Cj4gPiA+ICsKPiA+ID4gKwlpZiAocGVyZl9ndWVzdF9jYnMgJiYgcGVyZl9ndWVzdF9jYnMt
PnN0YXRlKQo+ID4gPiArCQlzdGF0aWNfY2FsbF91cGRhdGUoeDg2X2d1ZXN0X3N0YXRlLCBwZXJm
X2d1ZXN0X2Nicy0+c3RhdGUpOwo+ID4gPiArCj4gPiA+ICsJaWYgKHBlcmZfZ3Vlc3RfY2JzICYm
IHBlcmZfZ3Vlc3RfY2JzLT5nZXRfaXApCj4gPiA+ICsJCXN0YXRpY19jYWxsX3VwZGF0ZSh4ODZf
Z3Vlc3RfZ2V0X2lwLCBwZXJmX2d1ZXN0X2Nicy0+Z2V0X2lwKTsKPiA+ID4gKwo+ID4gPiArCWlm
IChwZXJmX2d1ZXN0X2NicyAmJiBwZXJmX2d1ZXN0X2Nicy0+aGFuZGxlX2ludGVsX3B0X2ludHIp
Cj4gPiA+ICsJCXN0YXRpY19jYWxsX3VwZGF0ZSh4ODZfZ3Vlc3RfaGFuZGxlX2ludGVsX3B0X2lu
dHIsCj4gPiA+ICsJCQkJICAgcGVyZl9ndWVzdF9jYnMtPmhhbmRsZV9pbnRlbF9wdF9pbnRyKTsK
PiA+ID4gK30KPiA+IAo+ID4gQ29kaW5nIHN0eWxlIHdhbnRzIHsgfSBvbiB0aGF0IGxhc3QgaWYo
KS4KPiAKPiBUaGF0J3MganVzdCB5b3VyIHBlcnNvbmFsIHByZWZlcmVuY2UuCj4gCj4gVGhlIGNv
ZGluZy1zdHlsZSBkb2N1bWVudCBkb2Vzbid0IHJlcXVpcmUgdGhhdC4KPiAKPiBJdCBqdXN0IHNh
eXMgc2luZ2xlIHN0YXRlbWVudC4gIEl0J3Mgbm90IHRoZSBudW1iZXIgb2YKPiB2ZXJ0aWNhbCBs
aW5lcyBvciBjaGFyYWN0ZXJzIHJlcXVpcmVkIGZvciB0aGUgc3RhdGVtZW50Lgo+IAo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiBEbyBub3QgdW5uZWNlc3NhcmlseSB1
c2UgYnJhY2VzIHdoZXJlIGEgc2luZ2xlIHN0YXRlbWVudCB3aWxsIGRvLgo+IAo+IC4uIGNvZGUt
YmxvY2s6OiBjCj4gCj4gCWlmIChjb25kaXRpb24pCj4gCQlhY3Rpb24oKTsKPiAKPiBhbmQKPiAK
PiAuLiBjb2RlLWJsb2NrOjogbm9uZQo+IAo+IAlpZiAoY29uZGl0aW9uKQo+IAkJZG9fdGhpcygp
Owo+IAllbHNlCj4gCQlkb190aGF0KCk7Cj4gCj4gVGhpcyBkb2VzIG5vdCBhcHBseSBpZiBvbmx5
IG9uZSBicmFuY2ggb2YgYSBjb25kaXRpb25hbCBzdGF0ZW1lbnQgaXMgYSBzaW5nbGUKPiBzdGF0
ZW1lbnQ7IGluIHRoZSBsYXR0ZXIgY2FzZSB1c2UgYnJhY2VzIGluIGJvdGggYnJhbmNoZXM6CgpJ
bW1lZGlhdGVseSBhZnRlciB0aGlzLCB3ZSBzYXk6Cgp8IEFsc28sIHVzZSBicmFjZXMgd2hlbiBh
IGxvb3AgY29udGFpbnMgbW9yZSB0aGFuIGEgc2luZ2xlIHNpbXBsZSBzdGF0ZW1lbnQ6CnwKfCAu
LiBjb2RlLWJsb2NrOjogYwp8IAp8ICAgICAgICAgd2hpbGUgKGNvbmRpdGlvbikgewp8ICAgICAg
ICAgICAgICAgICBpZiAodGVzdCkKfCAgICAgICAgICAgICAgICAgICAgICAgICBkb19zb21ldGhp
bmcoKTsKfCAgICAgICAgIH0KfCAKCi4uLiBhbmQgd2hpbGUgdGhhdCBzYXlzICJhIGxvb3AiLCB0
aGUgcHJpbmNpcGxlIGlzIG9idmlvdXNseSBzdXBwb3NlZCB0bwphcHBseSB0byBjb25kaXRpb25h
bHMgdG9vOyBzdHJ1Y3R1cmFsbHkgdGhleSdyZSBubyBkaWZmZXJlbnQuIFdlIHNob3VsZApqdXN0
IGZpeCB0aGUgZG9jdW1lbnRhdGlvbiB0byBzYXkgImEgbG9vcCBvciBjb25kaXRpb25hbCIsIG9y
IHNvbWV0aGluZwp0byB0aGF0IGVmZmVjdC4KCk1hcmsuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
