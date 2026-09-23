Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7385EC98307
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 12:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuA5upNEb5nlShUSB0jwoK7Lkx9jCfpwIMeindKaIa4=; b=PvGooZpsAg3O6d
	D92nDU1a0aYAODn5Sk++sbfXxH6WroWRQJi5nQBVcwmvelnAfSUp3vRyFfy8kXEMlhKGG97pDP8q6
	hnjj+5+Q6RvSFPZMAUnzSPAyyo5ci93gM4zpKZMBr4FiXhfLS7/h46QM7RJ+0FavDZqIkVxZ5dMOs
	GzUn0ABOjr4jTI13ZMxv0QUJdD0fsny07+7OKBWpK4g3kXqV6hPMXKnx0SuB5nyjYLt9i7YcCOZJN
	XaWpTFY45VvulauVKDGZOIbxt0F/lcuJoQaqQXiGKViLJLmpwLiLpPmEopK6rfOeJdajxp1TDR3Lm
	hmMVoDPrY/9tYpT+tGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LfL-00000008AWd-0eSb;
	Wed, 23 Sep 2026 12:01:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LfK-00000008AWM-1Ptg
	for linux-riscv@bombadil.infradead.org;
	Wed, 23 Sep 2026 12:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7oV5NhC84tix+b+JvApE1dpYWTnu/MAWxqkNt5esyEI=; b=M24VnG2Y7rzHsSndz25qW8kfxh
	CjjiWNaBSwsiVpWtNtlbtsfPlpzrrl9n7rjC0tUsAffGNt9hU8+G0zRN0pG/t0zXLaHfht57noOQ/
	LXH0aXsd4phY8vtCleHl+Aw8beQHCEAb0Yc9NOMCOGbEPMYlYa1iCHi/06ig8XRU3xFXMDZPwmH83
	E37frcFcMQw0Blqtr54b4ug+yvCd5fbXZxBIrscMlMRHZ79aUYDOyOrk6yYontPve0WfkmCJUWVjB
	LMdySl3K4/Egv6mjSujjMi7LB0OnWf0i7Pe7jgr1iNMR9/1FrEGM33ulEY3+9/EZ92aEI1BtN4v7e
	C7VMFagA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Lf6-0000000Ej5q-1OQy
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 12:01:30 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350faaso557139f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 05:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790164878; cv=none;
        d=google.com; s=arc-20260327;
        b=BcbEvSEOvl9T7yG4TolLiWS/PSbJZa+J0BUyGs27kgJAc90olcl6juqV6l6jLtc4po
         zIs2aHZaZrT9hoU26Hlm5HtD8IKAkbxTdb/ZDkK4DpV9ZXxFuoMLtStJA5wl1pFL6ELy
         QpIJB10DmVGvv3BOw4j9bf62y9kXiz1LKotmQ1AKbsw2cOCIiRCInfZXZmZREbPwmFrr
         YoQFNtv988GePq9EhG32WDx2JCFnjHbbjgxIpkeKYt7cKTiMFxK8jhouRBjCjkx9qmNf
         LHsTPVg3xaAjXUT9qz29mCutl/myOpo1eLp+cG4idCD4CNKbrIL5qtMWjxQsXmAz/QPj
         tV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7oV5NhC84tix+b+JvApE1dpYWTnu/MAWxqkNt5esyEI=;
        fh=H5WwhnEgaNaZTKk19GJ1ONBlqCz1A00/ER6CJ4P2t28=;
        b=HekSGYH/SXrYWCgrIG137+vZP0qIDGn4E9JcN2wkGeGaGRqtGsPEPqiCcSomm5yJDI
         LvjK5PcN1SuwYzOr2j6Rj6oU0nLzDHQniMvqvR9L5B8NSIv3i84V3kc1QJJDuppX2Fnx
         jjJhyfhRRI1rAJoPwf42soQoLk19RxibEinlyd9pTeEYBkg7XtsMgPQ/SgJQN4WdiDE/
         Mi24D6GrESKAdqjRvxzO5aCjt5FaFWxEh4gS/ohT/Jn1RuDOEZpiRic1e8O2P+sPlMO1
         xeh+qF0zFfOhBLGDyA3MJpSF76kQnANXEiRZBu83oDirIiN2BtOA0rTavSFv2P2x/Lex
         w2nw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790164878; x=1790769678; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7oV5NhC84tix+b+JvApE1dpYWTnu/MAWxqkNt5esyEI=;
        b=LX4089jELyUTH6/hQOpDXJN+M54dX8CvZ04KRiRkPQXHHggE29MHg+WBtkwUwwDIOA
         hL6+n2ewuwLkOboA20iBgNS5n97Dtrww9ecjxpyP7fEDkftD4/ftu8wzhC3P1D09rOEp
         JoO84Kp/0xJev+YloIvAzR7L5Ud7J+EkvT+mDQG12HPoU5Vf0HteFe1l/A4Eq4wlEiq/
         xX4IT7t7EB1/ELQrqiH65PfTPDAdsMTodm14I4P2Vtib1Ykf5vb/b2crndmpXrc0OJXY
         kA2bIiL9mH4sBCoPgZl9K13O8fe8R/28wlKDL7Ff66scKUGIXVCNVMRFSnLCtjt5agnx
         mP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164878; x=1790769678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7oV5NhC84tix+b+JvApE1dpYWTnu/MAWxqkNt5esyEI=;
        b=Jc4CdB0F5oV+xC4dGv4pudfEE8mT4SQZt976Sb24bJJ0tWUaLOXDcH0jpMn2rzbjI7
         ZgJAGUF2uJB00F9WjfqzeWAFModKMDmaY2ZOpw632qsAAhKVgjtxL51wi1PTNurNmmYt
         7IC4x8m1c4fJIVcq2jp/b3yctp5LFK7Xerfh4k7PQ11EjEUTw4jTKqckIbo1zgQ+G42q
         MQ5mrkVE4w0fAMCxd+f6AiIamHEzwuxA7i07qHXAWuAPZv+P6pB2IbyVu0QcZRStpvmx
         GTlVzQ2vuRD8ip8FPoafsPdSHxxIx87GCc3YmvMPr3N1Y+pOYxpmj9NGmN3BjO/jEr6Q
         DFMA==
X-Gm-Message-State: AFuF++kIj1HjNbIN+XIsADYq4dqxQILLOha2DfepAoansqgMTHWH3W+x
	LO4QxzA8VeyWv7OSrRP+MvKEMR1IHD3mm+UiDvFU96cWPr1EcSKQP7ya456/hALP2f+vpllzUxU
	P57mdZ4l/AIvEkxrJ/M8SsIzmggj0mTj6uVOphe48vg==
X-Gm-Gg: AYBFou0garXk+jFZcjq/c18pXte9jXM8+RR3ZePZmoigF8SGkjs5z91oR97GdwR6k26
	j+tN7uKeKfPy9C7pB/j+gRBHyML/GofO7pYzOJXkFBGeNuTDUVxInVOJF2g/XTFW8E1LhvyVfrO
	lYah8HFFE8pO8ceqLXMJ+a5Gh1VV7AKmapU6YOsWGQU/w1XuAFCl6oSqASEz1lIl38T3gdBVON1
	2PVi62zaHG67HjkmxGfF2EhPnHCCHgE1ff0Nz+PTBZtEnp+jPGkquPDE0cp8ayIR0CDPjuxKGsg
	MKYeYM1INOHTPSWsu2qVGH9ffzb/X4/03JUBUATx3KBFvbEUhr65QDHdgW/XHs2RcIg0Q0COBCJ
	S8n9D2XRRU889EAs43Da768Ff4cEfyDeqbmoJ1v5gCdkXrPsKWMFV+WwXdytq74PJR96/tbPAXb
	A=
X-Received: by 2002:a05:6000:70b:b0:487:81c:183f with SMTP id
 ffacd0b85a97d-4886704926dmr3859972f8f.10.1790164877652; Wed, 23 Sep 2026
 05:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com> <20260831145943.313726-13-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260831145943.313726-13-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Sep 2026 17:31:05 +0530
X-Gm-Features: AclHuK-2ObkketlET_SBsJ58iMsfQLM0zUzwlh7sLplMTaBDRnaBDkNaFuzixnM
Message-ID: <CAAhSdy36ZUbJ5OetQ0n7C8UYYBVhqUsbHc3+XMDOfXX2O9ZjmA@mail.gmail.com>
Subject: Re: [PATCH v5 12/17] irqchip/riscv-imsic: Support IOMMU MSI address lists
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, tglx@kernel.org, 
	kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_130122_425835_2C36631A 
X-CRM114-Status: GOOD (  25.39  )
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

T24gTW9uLCBBdWcgMzEsIDIwMjYgYXQgODozMOKAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gUklTQy1WIElPTU1VIGhvc3QgaW50ZXJy
dXB0IHJlbWFwcGluZyBtYXBzIGV2ZXJ5IHBvc3NpYmxlIGhvc3QgSU1TSUMKPiB0YXJnZXQgaW50
byBvbmUgY29udGlndW91cyBJT1ZBIHJhbmdlLiBNU0kgbWVzc2FnZSBjb21wb3NpdGlvbiB0aGVy
ZWZvcmUKPiBuZWVkcyBlYWNoIHRhcmdldCdzIHBvc2l0aW9uIHdpdGhpbiB0aGF0IHJhbmdlLgo+
Cj4gV2hlbiB0aGUgUy1tb2RlIElNU0lDIGFkZHJlc3MgbGlzdCBpcyBhdmFpbGFibGUsIHByZXBh
cmUgdGhlIGNvbXBsZXRlCj4gbGlzdCB3aGlsZSBhbGxvY2F0aW5nIGFuIElSUS4gVGhpcyBhbGxv
d3MgdGhlIElPTU1VIGJhY2tlbmQgdG8gbWFwIHRoZQo+IHBhZ2VzIGFuZCBjYWNoZSB0aGUgY29u
dGlndW91cyBiYXNlIElPVkEgaW4gdGhlIE1TSSBkZXNjcmlwdG9yLiBTa2lwIHRoZQo+IG9wdGlv
bmFsIHByZXBhcmF0aW9uIHdoZW4gbm8gbGlzdCBpcyBhdmFpbGFibGUsIGFsbG93aW5nIGRldmlj
ZXMgd2hpY2gKPiBkbyBub3QgbmVlZCBJT01NVSBNU0kgdHJhbnNsYXRpb24gdG8ga2VlcCB1c2lu
ZyBwaHlzaWNhbCBNU0kgbWVzc2FnZXMuCj4KPiBXaGVuIHRoZSBkZXNjcmlwdG9yIGhhcyBhbiBJ
T01NVSBNU0kgbWFwcGluZywgdXNlIHRoZSBzZWxlY3RlZCBsb2dpY2FsCj4gQ1BVIGRpcmVjdGx5
IGFzIHRoZSBwYWdlIGluZGV4IHdpdGhpbiB0aGUgSU9WQSByYW5nZS4gVXNlIHRoZSBzYW1lIHBh
dGgKPiBmb3IgaW5pdGlhbCBjb21wb3NpdGlvbiBhbmQgYWZmaW5pdHkgdXBkYXRlcy4gTWVzc2Fn
ZXMgcmVtYWluIHBoeXNpY2FsCj4gd2hlbiBubyBJT01NVSBNU0kgbWFwcGluZyBpcyByZXF1aXJl
ZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFs
Y29tbS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5j
IHwgMjUgKysrKysrKysrKysrKysrKysrKy0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlw
L0tjb25maWcgYi9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZwo+IGluZGV4IDQyZjIyNzhhNzAyZC4u
YzdjZGE1MmIyMWViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9LY29uZmlnCj4gKysr
IGIvZHJpdmVycy9pcnFjaGlwL0tjb25maWcKPiBAQCAtNjU2LDYgKzY1Niw3IEBAIGNvbmZpZyBS
SVNDVl9JTVNJQwo+ICAgICAgICAgc2VsZWN0IElSUV9ET01BSU5fSElFUkFSQ0hZCj4gICAgICAg
ICBzZWxlY3QgR0VORVJJQ19JUlFfTUFUUklYX0FMTE9DQVRPUgo+ICAgICAgICAgc2VsZWN0IEdF
TkVSSUNfTVNJX0lSUQo+ICsgICAgICAgc2VsZWN0IElSUV9NU0lfSU9NTVUKPiAgICAgICAgIHNl
bGVjdCBJUlFfTVNJX0xJQgo+Cj4gIGNvbmZpZyBSSVNDVl9SUE1JX1NZU01TSQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMgYi9kcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiBpbmRleCA2NDNjOGU0NTk2MTEu
LjZlMjZhMzFmNzUwMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLXBsYXRmb3JtLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBs
YXRmb3JtLmMKPiBAQCAtMTAsNiArMTAsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvY3B1Lmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC9pb21tdS5oPgo+ICAjaW5jbHVkZSA8bGludXgvaXJxLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9pcnFjaGlwLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pcnFkb21haW4uaD4K
PiBAQCAtNjksOCArNzAsMTAgQEAgc3RhdGljIHZvaWQgaW1zaWNfaXJxX2FjayhzdHJ1Y3QgaXJx
X2RhdGEgKmQpCj4gICAgICAgICBpcnFfbW92ZV9pcnEoZCk7Cj4gIH0KPgo+IC1zdGF0aWMgdm9p
ZCBpbXNpY19pcnFfY29tcG9zZV92ZWN0b3JfbXNnKHN0cnVjdCBpbXNpY192ZWN0b3IgKnZlYywg
c3RydWN0IG1zaV9tc2cgKm1zZykKPiArc3RhdGljIHZvaWQgaW1zaWNfaXJxX2NvbXBvc2VfdmVj
dG9yX21zZyhzdHJ1Y3QgaXJxX2RhdGEgKmQsIHN0cnVjdCBpbXNpY192ZWN0b3IgKnZlYywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtc2lfbXNnICpt
c2cpCj4gIHsKPiArICAgICAgIHN0cnVjdCBtc2lfZGVzYyAqZGVzYyA9IGlycV9kYXRhX2dldF9t
c2lfZGVzYyhkKTsKPiAgICAgICAgIHBoeXNfYWRkcl90IG1zaV9hZGRyOwo+Cj4gICAgICAgICBp
ZiAoV0FSTl9PTighdmVjKSkKPiBAQCAtNzksNiArODIsMTEgQEAgc3RhdGljIHZvaWQgaW1zaWNf
aXJxX2NvbXBvc2VfdmVjdG9yX21zZyhzdHJ1Y3QgaW1zaWNfdmVjdG9yICp2ZWMsIHN0cnVjdCBt
c2lfbXMKPiAgICAgICAgIGlmIChXQVJOX09OKCFpbXNpY19jcHVfcGFnZV9waHlzKHZlYy0+Y3B1
LCAwLCAmbXNpX2FkZHIpKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gKyAgICAgICBp
ZiAoZGVzYy0+aW9tbXVfbXNpX3NoaWZ0KSB7CgpJcyBpdCBleHBlY3RlZCB0aGF0IGlvbW11X21z
aV9zaGlmdCA9PSAwIG1lYW5zIG5vIElPTU1VIGluIHRoZSBwYXRoPwoKPiArICAgICAgICAgICAg
ICAgbXNpX2FkZHIgPSAoZGVzYy0+aW9tbXVfbXNpX2lvdmEgPDwgZGVzYy0+aW9tbXVfbXNpX3No
aWZ0KSArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdmVjLT5jcHUgKiBJTVNJQ19NTUlP
X1BBR0VfU1o7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgbXNnLT5hZGRyZXNzX2hpID0gdXBw
ZXJfMzJfYml0cyhtc2lfYWRkcik7Cj4gICAgICAgICBtc2ctPmFkZHJlc3NfbG8gPSBsb3dlcl8z
Ml9iaXRzKG1zaV9hZGRyKTsKPiAgICAgICAgIG1zZy0+ZGF0YSA9IHZlYy0+bG9jYWxfaWQ7Cj4g
QEAgLTg2LDcgKzk0LDcgQEAgc3RhdGljIHZvaWQgaW1zaWNfaXJxX2NvbXBvc2VfdmVjdG9yX21z
ZyhzdHJ1Y3QgaW1zaWNfdmVjdG9yICp2ZWMsIHN0cnVjdCBtc2lfbXMKPgo+ICBzdGF0aWMgdm9p
ZCBpbXNpY19pcnFfY29tcG9zZV9tc2coc3RydWN0IGlycV9kYXRhICpkLCBzdHJ1Y3QgbXNpX21z
ZyAqbXNnKQo+ICB7Cj4gLSAgICAgICBpbXNpY19pcnFfY29tcG9zZV92ZWN0b3JfbXNnKGlycV9k
YXRhX2dldF9pcnFfY2hpcF9kYXRhKGQpLCBtc2cpOwo+ICsgICAgICAgaW1zaWNfaXJxX2NvbXBv
c2VfdmVjdG9yX21zZyhkLCBpcnFfZGF0YV9nZXRfaXJxX2NoaXBfZGF0YShkKSwgbXNnKTsKPiAg
fQo+Cj4gICNpZmRlZiBDT05GSUdfU01QCj4gQEAgLTk0LDcgKzEwMiw3IEBAIHN0YXRpYyB2b2lk
IGltc2ljX21zaV91cGRhdGVfbXNnKHN0cnVjdCBpcnFfZGF0YSAqZCwgc3RydWN0IGltc2ljX3Zl
Y3RvciAqdmVjKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXNpX21zZyBtc2cgPSB7IH07Cj4KPiAt
ICAgICAgIGltc2ljX2lycV9jb21wb3NlX3ZlY3Rvcl9tc2codmVjLCAmbXNnKTsKPiArICAgICAg
IGltc2ljX2lycV9jb21wb3NlX3ZlY3Rvcl9tc2coZCwgdmVjLCAmbXNnKTsKPiAgICAgICAgIGly
cV9kYXRhX2dldF9pcnFfY2hpcChkKS0+aXJxX3dyaXRlX21zaV9tc2coZCwgJm1zZyk7Cj4gIH0K
Pgo+IEBAIC0yMjUsNyArMjMzLDkgQEAgc3RhdGljIHN0cnVjdCBpcnFfY2hpcCBpbXNpY19pcnFf
YmFzZV9jaGlwID0gewo+ICBzdGF0aWMgaW50IGltc2ljX2lycV9kb21haW5fYWxsb2Moc3RydWN0
IGlycV9kb21haW4gKmRvbWFpbiwgdW5zaWduZWQgaW50IHZpcnEsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9pcnFzLCB2b2lkICphcmdzKQo+ICB7
Cj4gKyAgICAgICBtc2lfYWxsb2NfaW5mb190ICppbmZvID0gYXJnczsKPiAgICAgICAgIHN0cnVj
dCBpbXNpY192ZWN0b3IgKnZlYzsKPiArICAgICAgIGludCByZXQ7Cj4KPiAgICAgICAgIC8qIE11
bHRpLU1TSSBpcyBub3Qgc3VwcG9ydGVkIHlldC4gKi8KPiAgICAgICAgIGlmIChucl9pcnFzID4g
MSkKPiBAQCAtMjM1LDYgKzI0NSwxNSBAQCBzdGF0aWMgaW50IGltc2ljX2lycV9kb21haW5fYWxs
b2Moc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiwgdW5zaWduZWQgaW50IHZpcnEsCj4gICAgICAg
ICBpZiAoIXZlYykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9TUEM7Cj4KPiArICAgICAg
IGlmIChpbXNpYy0+c21vZGVfbXNpX3BhKSB7CgpUaGUgaW1zaWNfc2V0dXBfc3RhdGUoKSB3aWxs
IGZhaWwgaWYgc21vZGVfbXNpX3BhIGNyZWF0aW9uIGZhaWxzIGF0CmJvb3QgdGltZSBzbyB0aGlz
IGxvb2tzIGxpa2UgYSBwYXJhbm9pZCBjaGVjay4KCj4gKyAgICAgICAgICAgICAgIHJldCA9IGlv
bW11X2RtYV9wcmVwYXJlX21zaV9saXN0KGluZm8tPmRlc2MsIGltc2ljLT5zbW9kZV9tc2lfcGEs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG51bV9w
b3NzaWJsZV9jcHVzKCksIElNU0lDX01NSU9fUEFHRV9TWik7Cj4gKyAgICAgICAgICAgICAgIGlm
IChyZXQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBpbXNpY192ZWN0b3JfZnJlZSh2ZWMp
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICAgICAgICAg
IH0KPiArICAgICAgIH0KPiArCj4gICAgICAgICBpcnFfZG9tYWluX3NldF9pbmZvKGRvbWFpbiwg
dmlycSwgdmlycSwgJmltc2ljX2lycV9iYXNlX2NoaXAsIHZlYywKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaGFuZGxlX2VkZ2VfaXJxLCBOVUxMLCBOVUxMKTsKPiAgICAgICAgIGlycV9z
ZXRfbm9wcm9iZSh2aXJxKTsKPiAtLQo+IDIuNDMuMAo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
