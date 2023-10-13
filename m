Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAA3CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 21:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqTD/Upn+eLvnmDd/qGfklLgjhDGFKQxSJ7E3Y+wDGs=; b=oOY67yG/A7/DLW
	+0bfwtJGorDTtzyiPSnZsLT3fzaS/abvfXV6Jffx3A1kj+oruTu6ZVmVXmkBY7i/BMMxHE5xvNj9k
	vdh8O0sSF0qEQUyC2LE2Tc3S7aJb8nCzVnPtcA3CkF268ZhijfZe7+nvrgtVtEgH9RA79qJqILf7n
	Ctp3iZ4AbdMbarpfL8GOmhK/id5LFUoflxhRy/p1eQI94DoLNE0VvRx0tVhY+465HrSc0kCq300tf
	tza6v8TXIWayY89XJj5141Ujf3q05WmT/UMhG99n+U9ioZYKYv0RcHTh4Pl9HV2FNrtkUnWoWTd0n
	tnSWvCt4WDg+yly6XTNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrPJf-004GzS-38;
	Fri, 13 Oct 2023 21:03:27 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrPJc-004Gxw-25;
	Fri, 13 Oct 2023 21:03:25 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d852b28ec3bso2728243276.2;
        Fri, 13 Oct 2023 14:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697231000; x=1697835800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtiOVCn2uSsz0FoSYRDQt6Ad/oEEDkzUyvmWznVzlSA=;
        b=F6CfyybyCm1j/A1x+F24idBShEHCJvLKbReeVteAQMnHtURrf6yZTDIxEcCeUkgdL/
         Z5rGI0rBrIU4g9bPyyyRVSCHIAcYm8HICZic5DpCsW4Bb7q/1Jt+scdjZzfZ28RFYiTg
         hvDeZ7neF8tDdPTkximVv7v6dLThMn346FyN5VSEcvg71VO9fpOMjHsTXBFsV8uwaKXM
         iAce4sCcCu5k1n5Ds1cMpx2ex9CAcVfCbVQku78BLKTp5TVHUGzrrB7rzktVI00y58Pa
         Jcs0T1Y4+ptOvGqEJ7h+A+VuexOHQRvs1YYIQZ5mGhzKgqIHfnKJqadoHCtPO/Tz7e07
         8RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697231000; x=1697835800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtiOVCn2uSsz0FoSYRDQt6Ad/oEEDkzUyvmWznVzlSA=;
        b=bNYQ3hGkFlkawIheYgjfXYYExv7fA6vX8b+CDpPYXHlfJCChyjStIQVYKx5HMOGyBM
         56xGZEg7ZKcNjJAPP2KRs6ianXygdCEbjPwWpSxFKTzFOFHbaPTes/HN3d8cK2EiMEY2
         ZUFSo84as9WClNj4PLbkkSk45Y0iNPARI5jwhbNVQEf35fxM2QK6u0HEGKi7RQEK7X62
         ECfy2lrxMXuoDttS+5+W9MrkeH1rpe3NEA3MbeNnfrtay11o6aIFRtLevPRuGmJOr1ve
         gO19oqZnyszCF69va2o5lhQVbTUYb6/4dameCIXAyKZOYh4M65rr7F0aQgR0cSm/YewS
         8tqw==
X-Gm-Message-State: AOJu0Ywapy11Gxt5+dxl7t5whcu4uH6grLVCtwb+ZzePRMzhwtD+t8n8
	vLYCe/ae6DNbq6mNyEkeceKfr2wtDoYLyB4k2nI=
X-Google-Smtp-Source: AGHT+IHWHj9ILTPWExZ8ekeA0/ryyRW0ZV6k5VhEVnOo+k5EpZsvEbKt/nom23K7vTTS2zHZvjjk2tEmm58T8MLLm1U=
X-Received: by 2002:a5b:64d:0:b0:d9b:3b3e:5a07 with SMTP id
 o13-20020a5b064d000000b00d9b3b3e5a07mr2004058ybq.5.1697230999223; Fri, 13 Oct
 2023 14:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230807230513.102486-1-vishal.moola@gmail.com>
 <20230807230513.102486-15-vishal.moola@gmail.com> <20231012072505.6160-A-hca@linux.ibm.com>
In-Reply-To: <20231012072505.6160-A-hca@linux.ibm.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Fri, 13 Oct 2023 14:03:08 -0700
Message-ID: <CAOzc2px-SFSnmjcPriiB3cm1fNj3+YC8S0VSp4t1QvDR0f4E2A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v9 14/31] s390: Convert various pgalloc
 functions to use ptdescs
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_140324_708326_F176220B 
X-CRM114-Status: GOOD (  17.80  )
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

T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMTI6MjXigK9BTSBIZWlrbyBDYXJzdGVucyA8aGNhQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMDcsIDIwMjMgYXQgMDQ6MDQ6NTZQ
TSAtMDcwMCwgVmlzaGFsIE1vb2xhIChPcmFjbGUpIHdyb3RlOgo+ID4gQXMgcGFydCBvZiB0aGUg
Y29udmVyc2lvbnMgdG8gcmVwbGFjZSBwZ3RhYmxlIGNvbnN0cnVjdG9yL2Rlc3RydWN0b3JzIHdp
dGgKPiA+IHB0ZGVzYyBlcXVpdmFsZW50cywgY29udmVydCB2YXJpb3VzIHBhZ2UgdGFibGUgZnVu
Y3Rpb25zIHRvIHVzZSBwdGRlc2NzLgo+ID4KPiA+IFNvbWUgb2YgdGhlIGZ1bmN0aW9ucyB1c2Ug
dGhlICpnZXQqcGFnZSooKSBoZWxwZXIgZnVuY3Rpb25zLiBDb252ZXJ0Cj4gPiB0aGVzZSB0byB1
c2UgcGFnZXRhYmxlX2FsbG9jKCkgYW5kIHB0ZGVzY19hZGRyZXNzKCkgaW5zdGVhZCB0byBoZWxw
Cj4gPiBzdGFuZGFyZGl6ZSBwYWdlIHRhYmxlcyBmdXJ0aGVyLgo+ID4KPiA+IEFja2VkLWJ5OiBN
aWtlIFJhcG9wb3J0IChJQk0pIDxycHB0QGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBW
aXNoYWwgTW9vbGEgKE9yYWNsZSkgPHZpc2hhbC5tb29sYUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
ICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vcGdhbGxvYy5oIHwgICA0ICstCj4gPiAgYXJjaC9zMzkw
L2luY2x1ZGUvYXNtL3RsYi5oICAgICB8ICAgNCArLQo+ID4gIGFyY2gvczM5MC9tbS9wZ2FsbG9j
LmMgICAgICAgICAgfCAxMjggKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQo+IC4uLgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9tbS9wZ2FsbG9jLmMgYi9hcmNoL3MzOTAvbW0vcGdh
bGxvYy5jCj4gPiBpbmRleCBkNzM3NGFkZDc4MjAuLjA3ZmM2NjBhMjRhYSAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvczM5MC9tbS9wZ2FsbG9jLmMKPiA+ICsrKyBiL2FyY2gvczM5MC9tbS9wZ2FsbG9j
LmMKPiAuLi4KPiA+IEBAIC00ODgsMTYgKzQ4NiwyMCBAQCBzdGF0aWMgdm9pZCBiYXNlX3BndF9m
cmVlKHVuc2lnbmVkIGxvbmcgKnRhYmxlKQo+ID4gIHN0YXRpYyB1bnNpZ25lZCBsb25nICpiYXNl
X2Nyc3RfYWxsb2ModW5zaWduZWQgbG9uZyB2YWwpCj4gPiAgewo+ID4gICAgICAgdW5zaWduZWQg
bG9uZyAqdGFibGU7Cj4gPiArICAgICBzdHJ1Y3QgcHRkZXNjICpwdGRlc2M7Cj4gPgo+ID4gLSAg
ICAgdGFibGUgPSAodW5zaWduZWQgbG9uZyAqKV9fZ2V0X2ZyZWVfcGFnZXMoR0ZQX0tFUk5FTCwg
Q1JTVF9BTExPQ19PUkRFUik7Cj4gPiAtICAgICBpZiAodGFibGUpCj4gPiAtICAgICAgICAgICAg
IGNyc3RfdGFibGVfaW5pdCh0YWJsZSwgdmFsKTsKPiA+ICsgICAgIHB0ZGVzYyA9IHBhZ2V0YWJs
ZV9hbGxvYyhHRlBfS0VSTkVMICYgfl9fR0ZQX0hJR0hNRU0sIENSU1RfQUxMT0NfT1JERVIpOwo+
Cj4gSSBndWVzcyBJIG11c3QgbWlzcyBzb21ldGhpbmcsIGJ1dCB3aGF0IGlzIHRoZSByZWFzb24g
dG8gbWFzayBvdXQKPiBfX0dGUF9ISUdITUVNIGhlcmU/IEl0IGlzIG5vdCBwYXJ0IG9mIEdGUF9L
RVJORUwsIG5vciBkb2VzIHMzOTAgc3VwcG9ydAo+IEhJR0hNRU0uCgpZb3UncmUgbm90IG1pc3Np
bmcgYW55dGhpbmcuCgpUaGlzIHdhcyByZXBsYWNpbmcgX19nZXRfZnJlZV9wYWdlcygpIHdoaWNo
IGFsc28gZG9lc24ndCBzdXBwb3J0IEhJR0hNRU0sCnNvIEkgaGFkIHRoYXQgaW4gdG8gZW5zdXJl
IGEgbm9uLUhJR0hNRU0gYWxsb2NhdGlvbiBpbiBjYXNlIGEKcGFzc2VkLWluIGdmcF9mbGFncwpo
YWQgaXQgc2V0LiBJbiBoaW5kc2lnaHQgc2luY2Ugd2UncmUganVzdCBwYXNzaW5nIGluIHRoZSBH
RlAgZmxhZ3MKZGlyZWN0bHkgaGVyZSwgd2UgZG9uJ3QKYWN0dWFsbHkgbmVlZCB0byBtYXNrIG91
dCBHRlBfSElHSE1FTS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
