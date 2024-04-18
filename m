Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21A3C001CC
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 02:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+4Qrb9vpUSMKbEtIhwuFbCxJZPLxL0kOTuuxoS2aV8=; b=tQg2zaMMhiDKap
	Fa7TNfFth6VRBu3gMEdvmY8gYjByGQIrvcP+/mzbResux765QcZwyuejoGOpF4CDyXqqRf/mbXX8/
	IhZm18DW2UPKmQcPlS/2SA3WQZ+b4IJN/mguBHjoa47Iou2xuQpm2WXwdq4oUvOgUuedw3E21T/Tf
	Piv+ZhVg7/jdivCbjHGTuTMR1YGHOekv7m4QCxKw2E/71gHc6RnelPChHx3Ow3AY91qdh4bptqdM2
	YE3mU5ocX0vY6tC/3ekCU4dbkNUayjqxLNq/LtZT9HhoacbmYVjGmANWgXCMHgo7YZ77RwVmHiCRZ
	tI/02S1YcTrb89eZetrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxHtR-00000000jwO-3xsv;
	Thu, 18 Apr 2024 02:52:57 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxHtO-00000000jvW-3aNE
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 02:52:56 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-2348a5d1584so233944fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 19:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713408770; x=1714013570; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KAnRFRHACv8tVuZ6WXGHdutSp2eDzczfpAG5G+ekeo=;
        b=Csb6KKWTkI9izKRm3ZoGp/IAPjwBHC+gn5OEzzr/q6DzxCrexQvT1dus72D/uDm2lL
         I7LNjIKhJpr8yjaC034t1Oxc+7c/AJtgCJ8J8Aq9slgWnC/aO1z8PrEfQ/mSIhRQn+Aj
         w323lGLqTGO57LWX9XzcgI47MBhuGixTvZcVbsFjtR6YXQLymuznRzto4NN9xrd24/sC
         BA6PAhybYwculkts89o9k+UFzWq1xc8PfV6JGYaZ36rAmL2aJQnqknKnOyjFGheRdrWw
         +C4fN32sIEsc3UD9szbSCvL1CophklTyA/1m3vxFm4VHSOwYv8vtUP3k0qTVBZJJeMN4
         qQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713408770; x=1714013570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KAnRFRHACv8tVuZ6WXGHdutSp2eDzczfpAG5G+ekeo=;
        b=g7deYkJFv0inC+vdss3FDtv+MzF2Xf5OEE0mpMpndg0R8CNDZqu8YcDcrns0Wr6AZ0
         CWFxJzlcBBrOHL5Z5tArnX0Qlsn8kXC63QnWTybqO6qXvqW9ArgmWTRSJaQsZ5XXkYmj
         Tofy+3KwHM75Go0jKXH2IsbbEGzGsegPXoLXYzXVzXI3tMVKY5l40yWrE5O05y4t55XN
         /M4vZ03fqPVA7IQBFYc3aHCnk4ICxP37e6nyDE0T9f87vRmfW9eh4SwUvT9UPhMv2NTl
         t/vQqZ0yBBpkrt4EShijbWRjg/J3HTlKTQS2V1SOoR/SYRkK1b640X5UT9P7v0zj9y9o
         ++FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKXAI25U8mQfO9otcKZ2+685BFzI03v5jWcka3NOoc4w7zMw1NpKrxUXJcwCOld+g9xyyOBBcxPpm5N/pWjkEZvDt1Pm8PRiFwRz2QiN8R
X-Gm-Message-State: AOJu0YznMQWfyfR87SGfo1Zw4fK2nccwMyAJemxxaQeZpHw11t4H2jev
	Gxqy6uwM4h6U5z9TJhzxjhhR+vcORYQ82RMGC2DRMuo5vo08yZf1vcbSoUgNw0/bTawX0K28ORP
	xtwKCpEjILnuVtVrq/viKZKijUu0djxrMSF8JcA==
X-Google-Smtp-Source: AGHT+IEz1qXw0zEwY0hM3OQNuvnvteufmwQVzsfsyl68XIgc+AN5q25yfuZ+0bnJM0H06GgffoXYWnRbvoWwM1qazsY=
X-Received: by 2002:a05:6870:4724:b0:22e:15d2:6773 with SMTP id
 b36-20020a056870472400b0022e15d26773mr1921626oaq.32.1713408770492; Wed, 17
 Apr 2024 19:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240416031438.7637-1-cuiyunhui@bytedance.com>
 <20240416031438.7637-2-cuiyunhui@bytedance.com> <9f36bedd-1a68-43a9-826d-ce56caf01c52@arm.com>
 <CAEEQ3w=W+xLGP3WsyAQmRNaHm1xVRtqcGJ+t0TnZvJdCTR4v6w@mail.gmail.com> <260d9932-bf51-43ac-8490-99c39f5e9258@arm.com>
In-Reply-To: <260d9932-bf51-43ac-8490-99c39f5e9258@arm.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 18 Apr 2024 10:52:39 +0800
Message-ID: <CAEEQ3w=TZ8M6x0twDOcZ5iZ9O4L=bJNGFGKafZX1=e-Q8ALjYA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com, 
	james.morse@arm.com, jhugo@codeaurora.org, john.garry@huawei.com, 
	Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, sudeep.holla@arm.com, 
	tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_195255_094846_5C34EC88 
X-CRM114-Status: GOOD (  27.02  )
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

SGkgSmVyZW15LAoKT24gV2VkLCBBcHIgMTcsIDIwMjQgYXQgMTA6MDDigK9QTSBKZXJlbXkgTGlu
dG9uIDxqZXJlbXkubGludG9uQGFybS5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiA0LzE2LzI0
IDIyOjE1LCB5dW5odWkgY3VpIHdyb3RlOgo+ID4gSGkgSmVyZW15LAo+ID4KPiA+IE9uIFdlZCwg
QXByIDE3LCAyMDI0IGF0IDQ6MDTigK9BTSBKZXJlbXkgTGludG9uIDxqZXJlbXkubGludG9uQGFy
bS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gSGksCj4gPj4KPiA+Pgo+ID4+IE9uIDQvMTUvMjQgMjI6
MTQsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPj4+IEJlZm9yZSBjYWNoZWluZm8gY2FuIGJlIGJ1aWx0
IGNvcnJlY3RseSwgd2UgbmVlZCB0byBpbml0aWFsaXplIGxldmVsCj4gPj4+IGFuZCB0eXBlLiBT
aW5jZSBSU0lDLVYgY3VycmVudGx5IGRvZXMgbm90IGhhdmUgYSByZWdpc3RlciBncm91cCB0aGF0
Cj4gPj4+IGRlc2NyaWJlcyBjYWNoZS1yZWxhdGVkIGF0dHJpYnV0ZXMgbGlrZSBBUk02NCwgd2Ug
Y2Fubm90IG9idGFpbiB0aGVtCj4gPj4+IGRpcmVjdGx5LCBzbyBub3cgd2Ugb2J0YWluIGNhY2hl
IGxlYXZlcyBmcm9tIHRoZSBBQ1BJIFBQVFQgdGFibGUKPiA+Pj4gKGFjcGlfZ2V0X2NhY2hlX2lu
Zm8oKSkgYW5kIHNldCB0aGUgY2FjaGUgdHlwZSB0aHJvdWdoIHNwbGl0X2xldmVscy4KPiA+Pj4K
PiA+Pj4gU3VnZ2VzdGVkLWJ5OiBKZXJlbXkgTGludG9uIDxqZXJlbXkubGludG9uQGFybS5jb20+
Cj4gPj4+IFN1Z2dlc3RlZC1ieTogU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
Cj4gPj4+IC0tLQo+ID4+PiAgICBhcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyB8IDIwICsr
KysrKysrKysrKysrKysrKysrCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8u
YyBiL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4gPj4+IGluZGV4IDMwYTY4NzgyODdh
ZC4uZGM1ZmI3MDM2MmYxIDEwMDY0NAo+ID4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNo
ZWluZm8uYwo+ID4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYwo+ID4+PiBA
QCAtNiw2ICs2LDcgQEAKPiA+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L2NwdS5oPgo+ID4+PiAgICAj
aW5jbHVkZSA8bGludXgvb2YuaD4KPiA+Pj4gICAgI2luY2x1ZGUgPGFzbS9jYWNoZWluZm8uaD4K
PiA+Pj4gKyNpbmNsdWRlIDxsaW51eC9hY3BpLmg+Cj4gPj4+Cj4gPj4+ICAgIHN0YXRpYyBzdHJ1
Y3QgcmlzY3ZfY2FjaGVpbmZvX29wcyAqcnZfY2FjaGVfb3BzOwo+ID4+Pgo+ID4+PiBAQCAtNzgs
NiArNzksMjUgQEAgaW50IHBvcHVsYXRlX2NhY2hlX2xlYXZlcyh1bnNpZ25lZCBpbnQgY3B1KQo+
ID4+PiAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwcmV2ID0gTlVMTDsKPiA+Pj4gICAgICAg
IGludCBsZXZlbHMgPSAxLCBsZXZlbCA9IDE7Cj4gPj4+Cj4gPj4+ICsgICAgIGlmICghYWNwaV9k
aXNhYmxlZCkgewo+ID4+PiArICAgICAgICAgICAgIGludCByZXQsIGlkeCwgZndfbGV2ZWxzLCBz
cGxpdF9sZXZlbHM7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgICAgICAgICByZXQgPSBhY3BpX2dldF9j
YWNoZV9pbmZvKGNwdSwgJmZ3X2xldmVscywgJnNwbGl0X2xldmVscyk7Cj4gPj4+ICsgICAgICAg
ICAgICAgaWYgKHJldCkKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
Pj4+ICsKPiA+Pj4gKyAgICAgICAgICAgICBmb3IgKGlkeCA9IDA7IGxldmVsIDw9IHRoaXNfY3B1
X2NpLT5udW1fbGV2ZWxzICYmCj4gPj4+ICsgICAgICAgICAgICAgICAgICBpZHggPCB0aGlzX2Nw
dV9jaS0+bnVtX2xlYXZlczsgaWR4KyssIGxldmVsKyspIHsKPiA+Pgo+ID4+IEFGQUlLIHRoZSBw
dXJwb3NlIG9mIGlkeCBoZXJlIGl0IHRvIGFzc3VyZSB0aGF0IHRoZSBudW1iZXIgb2YgY2FjaGUK
PiA+PiBsZWF2ZXMgaXMgbm90IG92ZXJmbG93aW5nLiBCdXQgcmlnaHQgYmVsb3cgd2UgYXJlIHV0
aWxpemluZyB0d28gb2YgdGhlbQo+ID4+IGF0IG9uY2UsIHNvIHRoaXMgY2hlY2sgaXNuJ3QgY29y
cmVjdC4gT1RPSCwgc2luY2UgaXRzIGFsbG9jYXRlZCBhcwo+ID4+IGxldmVscyArIHNwbGl0X2xl
dmVscyBJIGRvbid0IHRoaW5rIGl0cyBhY3R1YWxseSBwb3NzaWJsZSBmb3IgdGhpcyB0bwo+ID4+
IGNhdXNlIGEgcHJvYmxlbS4gTWlnaHQgYmUgd29ydGh3aGlsZSB0byBqdXN0IGhvaXN0IGl0IGJl
Zm9yZSB0aGUgbG9vcAo+ID4+IGFuZCByZXZhbGlkYXRlIHRoZSB0b3RhbCBsZWF2ZXMgYWJvdXQg
dG8gYmUgdXRpbGl6ZWQuCj4gPj4KPgo+IEkgdGhpbmsgSSB3YXMgc3VnZ2VzdGluZyBzb21ldGhp
bmcgYWxvbmcgdGhlIGxpbmVzIG9mOgo+Cj4gQlVHX09OKChzcGxpdF9sZXZlbHMgPiBmd19sZXZl
bHMpIHx8IChzcGxpdF9sZXZlbHMgKyBmd19sZXZlbHMgPgo+IHRoaXNfY3B1X2NpLT5udW1fbGVh
dmVzKSk7Cj4KPiBUaGVuIHJlbW92aW5nIGlkeCBlbnRpcmVseS4gZXg6Ck9rYXksIEknbGwgZm9s
bG93IHlvdXJzIGFuZCB1cGRhdGUgdjQuCgoKPiBmb3IgKDsgbGV2ZWwgPD0gdGhpc19jcHVfY2kt
Pm51bV9sZXZlbHM7IGxldmVsKyspCj4gLi4uCj4gPgo+ID4gRG8geW91IG1lYW4gdG8gbW9kaWZ5
IHRoZSBsb2dpYyBhcyBmb2xsb3dzIHRvIG1ha2UgaXQgbW9yZSBjb21wbGV0ZT8KPiBTdXJlIHRo
YXQgaXMgb25lIHdheSB0byBkbyBpdCwgYnV0IHRoZW4geW91IG5lZWQgdG8gcHJvYmFibHkgcmVw
ZWF0IHRoZQo+IGlkeCBjaGVjazoKPiA+IGZvciAoaWR4ID0gMDsgbGV2ZWwgPD0gdGhpc19jcHVf
Y2ktPm51bV9sZXZlbHMgJiYKPiA+ICAgICAgICBpZHggPCB0aGlzX2NwdV9jaS0+bnVtX2xlYXZl
czsgbGV2ZWwrKykgewo+ID4gICAgICAgICAgaWYgKGxldmVsIDw9IHNwbGl0X2xldmVscykgewo+
ID4gICAgICAgICAgICAgICAgIGNpX2xlYWZfaW5pdCh0aGlzX2xlYWYrKywgQ0FDSEVfVFlQRV9E
QVRBLCBsZXZlbCk7Cj4gPiAgICAgICAgICAgICAgICAgaWR4Kys7Cj4gaWYgKGlkeCA+PSB0aGlz
X2NwdV9jaS0+bnVtX2xlYXZlcykgYnJlYWs7Cj4gPiAgICAgICAgICAgICAgICAgY2lfbGVhZl9p
bml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX0lOU1QsIGxldmVsKTsKPiA+ICAgICAgICAgICAg
ICAgICBpZHgrKzsKPiA+ICAgICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgICBjaV9s
ZWFmX2luaXQodGhpc19sZWFmKyssIENBQ0hFX1RZUEVfVU5JRklFRCwgbGV2ZWwpOwo+ID4gICAg
ICAgICAgICAgICAgIGlkeCsrOwo+ID4gICAgICAgIH0KPiA+IH0KPgo+Cj4KClRoYW5rcywKWXVu
aHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
