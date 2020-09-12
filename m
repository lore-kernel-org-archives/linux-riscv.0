Return-Path: <SRS0=wYeJ=CV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B052C433E2
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 02:10:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EDEC20672
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 02:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ycm3PJrF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NhZ6t58s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EDEC20672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=erT4zImgTFy5kdciL/JgLBUwWVJvvMIUyRQfDo9fJO4=; b=Ycm3PJrF1IFVM4T+h25Lxakwq
	62wi7iILBM5jhzCe7oYCAazCDr0Kf9QyLC9+LWjBLLU+ZOLwYfM6PXcEKyEs/z++TpKUtJ4BGv22V
	f0LwerMaBVxfJdN4DAKll2I4sI/6ZFgdmAzFNsdHw3lRKEdNlibDZ+HngVXFMzU3cHhpggOGbo2rs
	zLOA0S1L2xTW6Eq5pLdHj3Jtk4bDB4oQmFcTW4JgIlQJadqX8AVgoRAcgLZf590bFPWaFh/1H+MCa
	S1ZSrBLKNXcJNhzJP5KBvtdvagaATtoX3yzbLLd4CA0GdrkOnpI6JhQywewG5f+efrH/cAUnk268D
	cwUZ5ks9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGuzl-0005JP-El; Sat, 12 Sep 2020 02:10:29 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGuzi-0005Iu-BZ
 for linux-riscv@lists.infradead.org; Sat, 12 Sep 2020 02:10:27 +0000
Received: by mail-qt1-x841.google.com with SMTP id t20so9426575qtr.8
 for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2020 19:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZiqJJzRszA8sfylho0I06IV4lu0RleMsXL29ujwW9Qc=;
 b=NhZ6t58sndgHcFesG2epVOV01yvEmPYqN8GFSC1/TpoKeXCsxndzzKNQu4jsKA7Hr5
 Xs08pBMsNdgRG7Uxzv7m955oW+OslAMzQdzIxBpA1XQqDnmtNNvOZCr20BhdNoTLIqKC
 0hgWV1DU7XaVbjufHui2ymxoInHFlP/KqFfxpm7PbX3+ggGYgu2NWc9qYpVilJ+BRx0X
 R281BW7nSbkNpxCqdK8JqGdSbRy3Cw7vNNdmncqaY2snh4mMTj0UW0aJU2yjANsq3pGr
 RZaer54KiY1/8xVWPpQhSJ0ITjyrabRFxulj4dY6jEGXofmmYetEPA64FEdstcPVClP2
 lk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZiqJJzRszA8sfylho0I06IV4lu0RleMsXL29ujwW9Qc=;
 b=rBXUysnXv2XvuiGeInK2MftlQTIwnnotP2oGtwmKbJ84L4lvc0QoSl8Jjd1KgyoZex
 gCihHbXP8P6o+ZVk2UIbfM/rX7ctijaVtrDrxVlxn+y+Wf/tsC/O1j+qX9079j3Qm/Rz
 oWJKWckB4aynGaa5oFxRYIZKnp1k1NQ+aET1HkLvv0fBzT1y5rgSCmCqPwCbTEWx/yUW
 n+kSPVDPV3o9300+d8mujxSI7tCRPaUb3oVkJR3Wp4IeocRU0kgwVFH+25Zdwz+MkF/1
 ALgXfIaY9fIE4HVEteTT1MpvGMGbLLj3pEboxdM95t1RwSAxgY/FPmU4qBH0dU7rUI8g
 BvPQ==
X-Gm-Message-State: AOAM532qP0f2H1RXDdUmOWUeTk+XMiixlmske3D/7O5L61FeFxOH2YIk
 DY4Yusv6RIiMHgkIV1e4V6l/NgkszcNJwFcI9HdjwA==
X-Google-Smtp-Source: ABdhPJyQ9TcOcosXc8x+MEogEBhbztazXLTte+z2BLrqlvJOLe/OFX/EBEgJi/a6XOqalPPPB9DZD/3ae4mc6P8ir5k=
X-Received: by 2002:ac8:1667:: with SMTP id x36mr4647841qtk.51.1599876622754; 
 Fri, 11 Sep 2020 19:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200912013441.9730-1-atish.patra@wdc.com>
 <20200912013441.9730-4-atish.patra@wdc.com>
In-Reply-To: <20200912013441.9730-4-atish.patra@wdc.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Sat, 12 Sep 2020 10:10:09 +0800
Message-ID: <CAHCEehJqV1aBQjWCB1b=r+aQmkMmQnx1ynYzHgCW92NNntZrfg@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH v2 3/5] riscv: Separate memory init from paging
 init
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_221026_693529_4B1FAB2F 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Jia He <justin.he@arm.com>,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Price <steven.price@arm.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+IOaWvCAyMDIw5bm0OeaciDEy5pelIOmA
seWFrSDkuIrljYg5OjM05a+r6YGT77yaCj4KPiBDdXJyZW50bHksIHdlIHBlcmZvcm0gc29tZSBt
ZW1vcnkgaW5pdCBmdW5jdGlvbnMgaW4gcGFnaW5nIGluaXQuIEJ1dCwKPiB0aGF0IHdpbGwgYmUg
YW4gaXNzdWUgZm9yIE5VTUEgc3VwcG9ydCB3aGVyZSBEVCBuZWVkcyB0byBiZSBmbGF0dGVuZWQK
PiBiZWZvcmUgbnVtYSBpbml0aWFsaXphdGlvbiBhbmQgbWVtYmxvY2tfcHJlc2VudCBjYW4gb25s
eSBiZSBjYWxsZWQKPiBhZnRlciBudW1hIGluaXRpYWxpemF0aW9uLgo+Cj4gTW92ZSBtZW1vcnkg
aW5pdGlhbGl6YXRpb24gcmVsYXRlZCBmdW5jdGlvbnMgdG8gYSBzZXBhcmF0ZSBmdW5jdGlvbi4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDEgKwo+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9zZXR1cC5jICAgICAgICB8IDEgKwo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAg
ICAgICAgICB8IDYgKysrKystCj4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IGluZGV4IGVhZWExZjcx
NzAxMC4uNTE1YjQyZjk4ZDM0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGd0YWJsZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBAQCAt
NDY2LDYgKzQ2Niw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2tlcm5lbF9tYXBfcGFnZXMoc3Ry
dWN0IHBhZ2UgKnBhZ2UsIGludCBudW1wYWdlcywgaW50IGVuYWJsCj4gIGV4dGVybiB2b2lkICpk
dGJfZWFybHlfdmE7Cj4gIHZvaWQgc2V0dXBfYm9vdG1lbSh2b2lkKTsKPiAgdm9pZCBwYWdpbmdf
aW5pdCh2b2lkKTsKPiArdm9pZCBtaXNjX21lbV9pbml0KHZvaWQpOwo+Cj4gICNkZWZpbmUgRklS
U1RfVVNFUl9BRERSRVNTICAwCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0
dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiBpbmRleCAyYzZkZDMyOTMxMmIuLjA3
ZmE2ZDEzMzY3ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+IEBAIC03OCw2ICs3OCw3IEBAIHZvaWQgX19p
bml0IHNldHVwX2FyY2goY2hhciAqKmNtZGxpbmVfcCkKPiAgI2Vsc2UKPiAgICAgICAgIHVuZmxh
dHRlbl9kZXZpY2VfdHJlZSgpOwo+ICAjZW5kaWYKPiArICAgICAgIG1pc2NfbWVtX2luaXQoKTsK
Pgo+ICAjaWZkZWYgQ09ORklHX1NXSU9UTEIKPiAgICAgICAgIHN3aW90bGJfaW5pdCgxKTsKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+
IGluZGV4IDE4ODI4MWZjMjgxNi4uOGYzMWE1NDI4Y2U0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBAQCAtNTY4LDggKzU2
OCwxMiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcmVzb3VyY2VfaW5pdCh2b2lkKQo+ICB2b2lkIF9f
aW5pdCBwYWdpbmdfaW5pdCh2b2lkKQo+ICB7Cj4gICAgICAgICBzZXR1cF92bV9maW5hbCgpOwo+
IC0gICAgICAgc3BhcnNlX2luaXQoKTsKPiAgICAgICAgIHNldHVwX3plcm9fcGFnZSgpOwo+ICt9
Cj4gKwo+ICt2b2lkIF9faW5pdCBtaXNjX21lbV9pbml0KHZvaWQpCj4gK3sKPiArICAgICAgIHNw
YXJzZV9pbml0KCk7Cj4gICAgICAgICB6b25lX3NpemVzX2luaXQoKTsKPiAgICAgICAgIHJlc291
cmNlX2luaXQoKTsKPiAgfQoKVGhhbmsgeW91LCBBdGlzaC4KUmV2aWV3ZWQtYnk6IEdyZWVudGlt
ZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
