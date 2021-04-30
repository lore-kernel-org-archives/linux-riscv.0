Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00443C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 19:51:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 832ED61459
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 19:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 832ED61459
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=r3avuEdvpxykEMi2t+r4ahhafHKlsrWtum0GlNnXHto=; b=DcJW4uzz77MrhZ5m6Jnf5+3WW
	MbT0MN7x7ICGamPT2bO+MOHm4FZ6VJ+ajqD9m9geZqCgQANKCSAQ6XKtFrqH0RzAhy/gdfmjS+znv
	lN+s7Tn8n0xwgI5yHgISZbaHqzMkLJkXXVZsswiFzWU+gI4PpNJKvzwKaSF+MTVheZ+gv5EFob3Cc
	i0TR2C3vdJ/kqh8VhGlb+fcDuId5thPHhAawQKxALv0RxIfWKezW23OD/ix0+WpC7+fzJM5OjVhUT
	5hlLb8HDeHS9eebFrC//RiMgEP5gVIjjFSeg4oJDKawd0tO1aLhS1Gx7ZMy6I+oJ31sy4sq99lBbP
	mXihZWvCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcZ9x-008SbH-8O; Fri, 30 Apr 2021 19:50:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcZ6b-008S1y-9S
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 19:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=JpP3SOMsyKbKdgdhycOI1PqF+crmAFSB33V4ZUkSKZs=; b=1osfCJO40o69k7SS1oIFUlDN67
 ZPp6L/XI3pNBPmhk7yRanyPdpkHmkF0YxqM6CkdS1NQj44psxftefW5kQQVZcmxNxSDzv6HN5/yW5
 gQXfiUeqHOKDWAgVMyvD4Ll2/OLsayqC7lMGmMceMujWOLA4FReNIZMUHH6DYdiIBJars+XMggXYm
 3wwZzaVtmf6kGk0atjYmNfcUU5OuBhlc+pZ5/Q7W2qtZisr1A+QXxkDlBIb3pxU6f5E8V9jiOVjKP
 nl6xfIax3bDnZ6n6f7v3luxuztaPEvCKzUusBb9oDZDH5KYLWOV/yK7BGBHnF0eaDo0WiBjjSyzxK
 F5YJD0QA==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcZ6Y-001cam-5P
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 19:47:15 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so2312056pjh.1
 for <linux-riscv@lists.infradead.org>; Fri, 30 Apr 2021 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=JpP3SOMsyKbKdgdhycOI1PqF+crmAFSB33V4ZUkSKZs=;
 b=GUZvOaan0TFHPmegXK/2LcZXVUNAnqkcrhKPmSPfOOdVTkxQQV08BB/++nr1roQ096
 m8TSef8NvmbWBtrEh6mmfqt8Ghgq4ttaWzNUYXMhngaolLTlhz/xtLqUGAx3E9C/NdCp
 WLoKm7MoGvdgUz71VGXN9eIpOwvF29VtzQpMDckGIIu/0mx4xyW2sBmVDKa9fA0PamPE
 QKtZkIgr6HvzdPu4lxnLDqcMdTI9KKopz1YYMJwvJBh8/okjHYzPLT1VWQtnSEmmya4x
 ibBHsOZ4etXDJGLTKU3q0dVUrsawI+U/66jRoXZLSmIAYKHYVLyc2qWFreqeRfzbw5W/
 NamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JpP3SOMsyKbKdgdhycOI1PqF+crmAFSB33V4ZUkSKZs=;
 b=JFfjmNbc7jr+Wmk56pZhh8RyTknhYr7x3GxlWzLOWFAU+QxpiTq89dHsj8vlaG+hBe
 fjFGJ3Bh41IkQxACd9zKphCjCG+ZZ+lQ9Am7ZqHml+iTK2wxtcgNPxOlWIMrz8FBQWBu
 +v/vWafajOsHkv8QmEFl6biqoYt8sA83OJaqmb1nL6EhSSH3sab0zxIxKgJd0Rqw3tEV
 gyTeamUCY3qULDh6lfSqJNhjKZDMvyPD6IhDHSVCvj0Zm63fxX71aMYt6sH7lf+1miqv
 3mbgSLWjKRPzk8VcC2qPecjS1XMpSr60E2CJUzNlyxLzw+mF/FLZU7m6CSDr5ZdwXJdB
 DrCw==
X-Gm-Message-State: AOAM530PFEPU277oy/tLWw4tl813FD8m53Bnfbo7DwnTbaJdUEdcdTKJ
 fyH09bXJg3Q7nY8sd3WeLINDvw==
X-Google-Smtp-Source: ABdhPJx+PObPLCgu6rRhjlUXqLxkXBqF/d+dgd6UMd6Or54JjNDlPQAy4zbB21j8eBcs+s2bJeR7Yw==
X-Received: by 2002:a17:90a:fa0e:: with SMTP id
 cm14mr16606392pjb.59.1619812030129; 
 Fri, 30 Apr 2021 12:47:10 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e65sm3120704pfe.9.2021.04.30.12.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 12:47:09 -0700 (PDT)
Date: Fri, 30 Apr 2021 12:47:09 -0700 (PDT)
X-Google-Original-Date: Fri, 30 Apr 2021 12:47:08 PDT (-0700)
Subject: Re: [PATCH] riscv: Disallow to build XIP_KERNEL with SOC_SIFIVE
In-Reply-To: <35b97408-328a-a9cd-1bb8-6758f42bde2d@ghiti.fr>
CC: vitaly.wool@konsulko.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-16ec61ad-00c2-4d7e-a85e-6f651bdff654@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_124714_297813_C719D212 
X-CRM114-Status: GOOD (  32.67  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAzMCBBcHIgMjAyMSAwMTowOToxNCBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBMZSA0LzI5LzIxIMOgIDg6MTMgQU0sIEFsZXggR2hpdGkgYSDDqWNyaXTCoDoKPj4g
TGUgNC8yOS8yMSDDoCA1OjExIEFNLCBWaXRhbHkgV29vbCBhIMOpY3JpdMKgOgo+Pj4gT24gVGh1
LCBBcHIgMjksIDIwMjEgYXQgMTA6NDcgQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZy
PiB3cm90ZToKPj4+Pgo+Pj4+IFJJU0NWX0VSUkFUQV9BTFRFUk5BVElWRSBwYXRjaGVzIHRleHQg
YXQgcnVudGltZSB3aGljaCBpcyBub3QKPj4+PiBwb3NzaWJsZSB3aGVuCj4+Pj4gdGhlIGtlcm5l
bCBpcyBleGVjdXRlZCBmcm9tIHRoZSBmbGFzaCBpbiBYSVAgbW9kZSwgYW5kIGFzIHRoZSBTSUZJ
VkUKPj4+PiBlcnJhdGEgbXVzdCBiZSBmaXhlZCBzb21laG93LCBkaXNhbGxvdyB0byBidWlsZCBh
IFhJUCBrZXJuZWwgdGhhdAo+Pj4+IHN1cHBvcnRzIFNJRklWRSBzb2NzLgo+Pj4KPj4+IENvdWxk
IHlvdSBwbGVhc2UgaG9sZCBvZmYgdGhpcyBwYXRjaCBmb3IgYSBiaXQ/IEkgd2lsbCB0cnkgdG8g
Y29tZSB1cAo+Pj4gd2l0aCBhbiBhbHRlcm5hdGl2ZSBzb2x1dGlvbi4gSXQgc2hvdWxkIGJlIHBv
c3NpYmxlIHRvIGRlZmluZSBhCj4+PiBzcGVjaWFsIHNlY3Rpb24gd2l0aGluIHRoZSBSVyBhcmVh
IGFuZCBwbGFjZSB0aGUgZnVuY3Rpb25zIHRoYXQgbmVlZAo+Pj4gc3VjaCBwYXRjaGluZyB0aGVy
ZS4KPj4+IE5vdCB0aGF0IEkgbGlrZSB0aGF0IG11Y2ggYnV0IGF0IGxlYXN0IHdlJ2xsIGtlZXAg
dGhlIGFiaWxpdHkgdG8gdXNlCj4+PiBYSVAgb24gU2lGaXZlLgo+Pgo+PiBPaywgSSdtIHdvbmRl
cmluZyB3aHkgSSBkaWQgbm90IHRoaW5rIG9mIHRoYXQuLi5JJ2xsIGdpdmUgaXQgYSB0cnkganVz
dAo+PiB0byBwdW5pc2ggbXlzZWxmLgo+Pgo+PiBUaGFua3MgVml0YWx5LAo+Pgo+PiBBbGV4Cj4+
Cj4KPiBJIHRyaWVkIHdoYXQgeW91IHByb3Bvc2VkIGFuZCBpdCB3b3JrcyB3ZWxsLCAqY2FsbGVy
cyogbXVzdCBiZSBwbGFjZWQKPiBpbnRvIHRoaXMgd3JpdGFibGUgc2VjdGlvbiBpbiBSQU0gYW5k
IHRoYXQncyBpdCwgdGhhdCBtYXkgYmUgbW9yZQo+IGNvbXBsaWNhdGVkIGlmIGF0IHNvbWUgcG9p
bnQgdGhlIHBhdGNoZWQgZnVuY3Rpb25zIGFyZSBnZW5lcmljIGJ1dCBJCj4gdGhpbmsgd2UgY2Fu
IHVzZSBhbiBpbnRlcm1lZGlhdGUgcmlzY3YgZnVuY3Rpb24gdG8gcGF0Y2ggaW5zdGVhZCBvcgo+
IHNvbWV0aGluZyBlbHNlLgo+Cj4gVGhlIG1vZGlmaWNhdGlvbnMgSSBkaWQgb25seSBjb25zaXN0
IGluIHB1dHRpbmcgYWx0ZXJuYXRpdmUgc2VjdGlvbiBpbgo+IFJBTSBhbmQgcGxhY2UgdGhlIGV4
Y2VwdGlvbiB2ZWN0b3IgdGFibGUgaW4gdGhpcyBzZWN0aW9uLgo+Cj4gSWYgeW91IGNhbiBkbyB0
aGUgcHJvcGVyIHBhdGNoLCBJJ2xsIGxldCB5b3UgZG8gaXQsIG90aGVyd2lzZSBJJ2xsIGRvCj4g
dGhhdCBsYXRlciBhcyBJIGhhdmUgb3RoZXIgdGhpbmdzIHRvIGRvIGJlZm9yZS4KPgo+IFNvIFBh
bG1lciB5b3UgY2FuIGRyb3AgdGhpcyBwYXRjaC4KCkdyZWF0LiAgSSB3YXMgZ29pbmcgdG8gcHVz
aCBiYWNrIGFuZCBqdXN0IHNheSAid2Ugc2hvdWxkIHN3YXAgdGhlIAphbHRlcm5hdGl2ZXMgb3Zl
ciB0byB0aGUgZXJyYXRhIGltcGxlbW5ldGF0aW9uIGZvciBYSVAsIGFzIHRoZSBjdXJyZW50IApv
bmVzIGFyZSBqdXN0IGEgcGVyZm9ybWFuY2UgaGl0IHdoZW4gdW5uZWNlc3NhcnkgYW5kIFhJUCB1
c2VycyBhcmUgCmxpa2VseSB0byBidWlsZCBmb3IgYSBzaW5nbGUgU09DIGFueXdheSIuICBUaGF0
IHdvdWxkIG1lYW4gd2UnZCBuZWVkIHRvIApzb3J0IHNvbWV0aGluZyBvdXQgV1JUIGVycmF0YSB0
aGF0IHJlbHkgb24gZGVzaWduLXNwZWNpZmljIApmdW5jdGlvbmFsaXR5LCBhbmQgZXZlcnl0aGlu
ZyBJIGNhbWUgdXAgd2l0aCB0aGVyZSB3YXMgYSBoZWFkYWNoZS4KCkl0J3Mgd2F5IGJldHRlciBp
ZiB3ZSBjYW4ganVzdCBmdWxsIHN1cHBvcnQgdGhlIGFsdGVybmF0aXZlcyBzdHVmZiwgc28gCkkn
bGwganVzdCB3YWl0IGZvciB0aGF0LgoKPgo+IFRoYW5rcyBhZ2FpbiwKPgo+Pj4KPj4+IEJlc3Qg
cmVnYXJkcywKPj4+IMKgwqDCoCBWaXRhbHkKPj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgo+Pj4+IC0tLQo+Pj4+IMKgIGFyY2gvcmlzY3YvS2Nv
bmZpZy5lcnJhdGFzIHwgMiArLQo+Pj4+IMKgIGFyY2gvcmlzY3YvS2NvbmZpZy5zb2NzwqDCoMKg
IHwgMSArCj4+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhcyBi
L2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGFzCj4+Pj4gaW5kZXggZDVkMDNhZThkNjg1Li45NTM3
ZGJkNjczNTcgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YXMKPj4+
PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhcwo+Pj4+IEBAIC0yLDcgKzIsNyBAQCBt
ZW51ICJDUFUgZXJyYXRhIHNlbGVjdGlvbiIKPj4+Pgo+Pj4+IMKgIGNvbmZpZyBSSVNDVl9FUlJB
VEFfQUxURVJOQVRJVkUKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgIlJJU0MtViBhbHRlcm5h
dGl2ZSBzY2hlbWUiCj4+Pj4gLcKgwqDCoMKgwqDCoCBkZWZhdWx0IHkKPj4+PiArwqDCoMKgwqDC
oMKgIGRlZmF1bHQgeSBpZiAhWElQX0tFUk5FTAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaGVscAo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRoaXMgS2NvbmZpZyBhbGxvd3MgdGhlIGtlcm5lbCB0
byBhdXRvbWF0aWNhbGx5IHBhdGNoIHRoZQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVycmF0
YSByZXF1aXJlZCBieSB0aGUgZXhlY3V0aW9uIHBsYXRmb3JtIGF0IHJ1biB0aW1lLiBUaGUKPj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgYi9hcmNoL3Jpc2N2L0tjb25m
aWcuc29jcwo+Pj4+IGluZGV4IDAwYzJiMjA1NjU0Yy4uOWNiMzhiYzlkN2NkIDEwMDY0NAo+Pj4+
IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9LY29u
ZmlnLnNvY3MKPj4+PiBAQCAtOSw2ICs5LDcgQEAgY29uZmlnIFNPQ19NSUNST0NISVBfUE9MQVJG
SVJFCj4+Pj4KPj4+PiDCoCBjb25maWcgU09DX1NJRklWRQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAg
Ym9vbCAiU2lGaXZlIFNvQ3MiCj4+Pj4gK8KgwqDCoMKgwqDCoCBkZXBlbmRzIG9uICFYSVBfS0VS
TkVMCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBzZWxlY3QgU0VSSUFMX1NJRklWRSBpZiBUVFkKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgIHNlbGVjdCBTRVJJQUxfU0lGSVZFX0NPTlNPTEUgaWYgVFRZCj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoCBzZWxlY3QgQ0xLX1NJRklWRQo+Pj4+IC0tCj4+Pj4gMi4yMC4x
Cj4+Pj4KPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+Pj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+Pj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YKPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+PiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+Pgo+Pgo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
