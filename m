Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A22C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 10:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kklFsG1y3UGZWVP4Q+TOXt7PLIHTPStlKZANm4ZMb8=; b=3s6gn/X2s18H86
	xaRf1Z0zoaa6du9npW3D7z+6gqvONDyoYx4xX9x/s9YrPUepKwkMyAn2XNfRhB3gYTcReIALiST9T
	U+ZylKHxNP/fZyEiJdiwwLHy/pNE3odhLDRLMh/V+VnAqIC4JM/XnldPhd5ppqy8pxqayfhJkJk/1
	xY5j4YRJ1+MvPEw0whSOXjAUFSGgC08fVVx1/mHYFOsTq0gZMX8CgWm/c687MzYSdvjRtZJnaHwv9
	ABt8zebTNgkvlxY5Z/towtBJLI/bcRURbpZT1NnOUTQ5KQ/3AAfr8ln/KFk/QdnCY3sAybHL9UmJT
	GztExGxHDUX2nNqZ6dCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pew4O-00FhLA-2r;
	Wed, 22 Mar 2023 10:51:52 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pew4M-00FhKa-2v
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 10:51:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id d13so18155480pjh.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 03:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679482309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCVN8NvFNmahfNwZXQmqIKZYwz3rhCb+WsNZR0GMjac=;
        b=PCYTDgPSwnsVRjO+quqdqsdfxVQK0x8qyy3cQr77EcscrF+ykYvM+ze+t6VQgM8WsH
         1qZXjrtpzEawuOX5621QIvkwAVCNM97MiHTJ0Sfr3WkCgd74lSOYYIBrW3wFJis1nQgS
         diEGdjx/tqxHKQ9KA9EXuxhjLD+MzykrNakq2rjg5rgVAWjMBZoOB3aBsOCEAzq9o9kD
         jbdUQfsgnxARkRrySMzDuCobE9Uw0S+xQD7N8FKBQxCD4gkpf2ZsVNAJUJ2zZOr0Wtp0
         8pBViaMKdMf5K1dA8roSEEBfUE6ZQioZtHnwY8DS1iJyoVSrslMTNbnnQS5dDYBX7UuF
         b9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679482309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCVN8NvFNmahfNwZXQmqIKZYwz3rhCb+WsNZR0GMjac=;
        b=y6/CwDb53cnjPEHYAGaQ5SHD9fvoKWLmSWDJH+f0abzRUklpBqKT4zzWbS+tVjgD3Z
         A1T6IecgjxBJOVzk3SNInKUcKmcKYho61kSEWdVbFBeyCAJr/uu7a4T4gy6HcmJVm7Y+
         5uA5pOQqn2AsUf8MQlzpFPkJXaGxb2KuYGKCmJOECMvU/43An6z3lsZv8DQVcsq7wr3J
         MpO04/fFSBkMB6vl97LzP4+Frp5MKRb8eCu0ykmNvZU/XtoHZXnj6tIXDKxjnSskTdwv
         LBqbjM48IWgEvQFOi1OtsVc2atnIjzfFfwqplP1Tay258SfPPozaaXVkd9s1S8JLe8UM
         FAsw==
X-Gm-Message-State: AO0yUKVp8nMK8qtYxoAbgYTGI623aynM6ysEMrtHJRC3DK32n8imSCcV
	2a+1mzU/cEEG/5InCnOvspcXxqqLMS/Bnymk6rA=
X-Google-Smtp-Source: AK7set8QJ5xyq6hE/gvezPTx09u8amKDTQ9SBywjmf9WAjQMKrY7vGhaGOIjGh9HBjIqfDEkM9SxAz+Kc024W2Lt6HM=
X-Received: by 2002:a17:90a:bf91:b0:23b:517d:beca with SMTP id
 d17-20020a17090abf9100b0023b517dbecamr949601pjs.0.1679482309423; Wed, 22 Mar
 2023 03:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230322061856.2774840-1-suagrfillet@gmail.com> <20230322080345.j4oi7nz2nz4rk6ib@orel>
In-Reply-To: <20230322080345.j4oi7nz2nz4rk6ib@orel>
From: Song Shuai <suagrfillet@gmail.com>
Date: Wed, 22 Mar 2023 10:51:38 +0000
Message-ID: <CAAYs2=hg_h=dotuY2XE2ncXYg3FuiDkQmfCJ0NYfOn278HOdbQ@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: export cpu/freq invariant to scheduler
To: Andrew Jones <ajones@ventanamicro.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_035150_965368_44668DCE 
X-CRM114-Status: GOOD (  22.47  )
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

QW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4g5LqOMjAyM+W5tDPmnIgyMuaX
peWRqOS4iSAwODowM+WGmemBk++8mgo+Cj4gT24gV2VkLCBNYXIgMjIsIDIwMjMgYXQgMDI6MTg6
NTZQTSArMDgwMCwgU29uZyBTaHVhaSB3cm90ZToKPiA+IFJJU0MtViBub3cgbWFuYWdlcyBDUFUg
dG9wb2xvZ3kgdXNpbmcgYXJjaF90b3BvbG9neSB3aGljaCBwcm92aWRlcwo+ID4gQ1BVIGNhcGFj
aXR5IGFuZCBmcmVxdWVuY3kgcmVsYXRlZCBpbnRlcmZhY2VzIHRvIGFjY2VzcyB0aGUgY3B1L2Zy
ZXEKPiA+IGludmFyaWFudCBpbiBwb3NzaWJsZSBoZXRlcm9nZW5lb3VzIG9yIERWRlMtZW5hYmxl
ZCBwbGF0Zm9ybXMuCj4gPgo+ID4gSGVyZSBhZGRzIHRvcG9sb2d5LmggZmlsZSB0byBleHBvcnQg
dGhlIGFyY2hfdG9wb2xvZ3kgaW50ZXJmYWNlcyBmb3IKPiA+IHJlcGxhY2luZyB0aGUgc2NoZWR1
bGVyJ3MgY29uc3RhbnQtYmFzZWQgY3B1L2ZyZXEgaW52YXJpYW50IGFjY291bnRpbmcuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90b3BvbG9neS5oIHwgMTkgKysrKysrKysr
KysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdG9wb2xvZ3kuaAo+ID4KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RvcG9sb2d5LmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3RvcG9sb2d5LmgKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjE0YmJkMjQ3MmFmNgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90b3BvbG9neS5oCj4gPiBAQCAtMCwwICsxLDE5IEBA
Cj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+ICsjaWZuZGVm
IF9fQVNNX1JJU0NWX1RPUE9MT0dZX0gKPiA+ICsjZGVmaW5lIF9fQVNNX1JJU0NWX1RPUE9MT0dZ
X0gKPgo+IHJpc2N2IHVzZXMgYSBzaW5nbGUgbGVhZGluZyB1bmRlcnNjb3JlLgpvay4KPgo+ID4g
Kwo+ID4gKyNpbmNsdWRlIDxsaW51eC9hcmNoX3RvcG9sb2d5Lmg+Cj4gPiArCj4gPiArLyogUmVw
bGFjZSB0YXNrIHNjaGVkdWxlcidzIGRlZmF1bHQgZnJlcXVlbmN5LWludmFyaWFudCBhY2NvdW50
aW5nICovCj4gPiArI2RlZmluZSBhcmNoX3NjYWxlX2ZyZXFfdGljayB0b3BvbG9neV9zY2FsZV9m
cmVxX3RpY2sKPiA+ICsjZGVmaW5lIGFyY2hfc2V0X2ZyZXFfc2NhbGUgdG9wb2xvZ3lfc2V0X2Zy
ZXFfc2NhbGUKPiA+ICsjZGVmaW5lIGFyY2hfc2NhbGVfZnJlcV9jYXBhY2l0eSB0b3BvbG9neV9n
ZXRfZnJlcV9zY2FsZQo+ID4gKyNkZWZpbmUgYXJjaF9zY2FsZV9mcmVxX2ludmFyaWFudCB0b3Bv
bG9neV9zY2FsZV9mcmVxX2ludmFyaWFudAo+ID4gKwo+ID4gKy8qIFJlcGxhY2UgdGFzayBzY2hl
ZHVsZXIncyBkZWZhdWx0IGNwdS1pbnZhcmlhbnQgYWNjb3VudGluZyAqLwo+ID4gKyNkZWZpbmUg
YXJjaF9zY2FsZV9jcHVfY2FwYWNpdHkgdG9wb2xvZ3lfZ2V0X2NwdV9zY2FsZQo+ID4gKyNkZWZp
bmUgYXJjaF91cGRhdGVfY3B1X3RvcG9sb2d5IHRvcG9sb2d5X3VwZGF0ZV9jcHVfdG9wb2xvZ3kK
PiA+ICsKPiA+ICsKPiA+ICsjaW5jbHVkZSA8YXNtLWdlbmVyaWMvdG9wb2xvZ3kuaD4KPiA+ICsj
ZW5kaWYgLyogX19BU01fUklTQ1ZfVE9QT0xPR1lfSCAqLwo+ID4gLS0KPiA+IDIuMjAuMQo+ID4K
Pgo+IFRoaXMgbG9va3MgcmVhc29uYWJsZSwgYXQgbGVhc3QgZnJvbSBhICJkbyB3aGF0IGFybTY0
IGRvZXMiIHR5cGUgb2YKPiBwZXJzcGVjdGl2ZS4gV2h5IHRoZSBSRkM/IElzIGl0IG5vdCB0ZXN0
ZWQ/Ckkgb25seSB0ZXN0ZWQgaXQgaW4gdGhlIHFlbXUgc2lmaXZlX3UgbWFjaGluZSB3aXRoIGEg
Y3VzdG9tZWQgZHRiCm5vdCBzdXJlIGlmIGl0IHdvcmtzIGluIHJlYWwgaGFyZHdhcmUsIHNvIEkg
cG9zdGVkIGl0IHdpdGggUkZDLgo+Cj4gQWxzbywgaWYgeW91IHJlcG9zdCwgY291bGQgcGxlYXNl
IG5lYXRlbiBpdCB1cCBhIGJpdD8gQWxpZ25pbmcgYWxsCj4gdGhlIGRlZmluZXMgd291bGQgaGVs
cCBhbmQgcmVtb3ZpbmcgdGhlIGV4dHJhIGJsYW5rIGxpbmUuIEZpbmFsbHksCj4gd2h5IHdhc24n
dCB0aGUgIi8qIEVuYWJsZSB0b3BvbG9neSBmbGFnIHVwZGF0ZXMgKi8iIGNvbW1lbnQgYWxzbwo+
IGxpZnRlZCBmcm9tIGFybTY0IGxpa2UgdGhlIG90aGVycz8KSSdsbCBhZGQgdGhlIGNvbW1lbnQg
YmFjayBhbmQgdGlkeSBpdCB1cCBpbiB0aGUgbmV4dCBwb3N0Lgo+Cj4gVGhhbmtzLAo+IGRyZXcK
CgoKLS0gClRoYW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
