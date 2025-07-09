Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C95C83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Icfcd9WpTm/e8HdyQFsDFEmBpYMALALzn9hnSBWpBtU=; b=lhZPTdBuMwROzF
	tw4DCEU9ND9b2G8ILvtGIG7z+GuhtIU5XpXaVWhB49XNvmKszq7E74j2lfU8s1m7l8pp+KdZotv1a
	DFbtB0RrDDqkKEvsL7f0xXoLgWroptQ+zckVKoQLEreK3frJPgwlT1oANOiWuL9xgRl0xU+rWyo84
	w9OdAHBJjO59xWShJXQcUtzxMgYWI/YKu7ezKj+M+Zx+yzQUnw3uHNA4ZJL9G4rQPESyd7T5s7Z60
	PSci9+GKRH8oYJvMLu39JrUkErtiIjiiskDs1yrc7VK8El0WAwyMvxWICYMl6Ll8HCfMyal6JCi3K
	WZ6kjTRAGd/SRaR01iiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZW2W-000000091fA-1xtr;
	Wed, 09 Jul 2025 14:44:52 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTCE-00000008WrT-33aq
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 11:42:44 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-40b859461easo2954792b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752061358; x=1752666158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf6wWl6n7d/QhS1jb85XHnTgsGudA3C5Y1Dh/3rgidQ=;
        b=g75aWBCvgIMaShiZ4D0mpqqyZQMUnFLpD4KSrsNUpLkPmAAWTpRDLSI6QyJyuoWdPU
         xxF8UhwdFWE99E70wrNXyWzHK8ML8SUvnXwFC6EBfh3wAw7T6OsPoFoFPWWJFsNLxEhc
         CyqaXAVmgB8ygOhMyr1n5PbpIUDXE0P3+2eFvZCFdDGRAto0AJ2Ugix7hRJ9btMw/KFr
         Yffb8ytaIT8pLGKokXvU9s7nmGfBK8fluHltgdotsNyY3WQXJO5oCLbR/8UNYcpp/uWP
         BEsjS0vDg8eFb0mPy2QCbnhS6i6M+mP5bBSRtDWvZU5oEEE4774mivll4SNLDvLr1vi/
         0AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061358; x=1752666158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uf6wWl6n7d/QhS1jb85XHnTgsGudA3C5Y1Dh/3rgidQ=;
        b=Mzd58TW048cK/3zqVGGSSa3GEH+Oi0AgjaqXvIcSVGaXsiKJ81EfO6PHXNIPZhYA1m
         ef55jQBxyJOtBohA/2mDkkdVadfF3Wy/e/4d7DSRrcnD1csOyilKVNR1WFCZULA2UirC
         6JeWBrpRpqqBeqJglO9P52zxwMMnvKvfBhWPylJOZuU2ekPb1OcmXu4MkBHd0IManxZb
         N5o+3jyt8YyadP1vfaGvWS7owAs/5LaP1egdkvlf9/Nl9p+KgL5fhj6kjx5AnfaUHepu
         oN/lb8aWC3uqB4jDQzqQBm0a7iQsXH6SJ3nlDRsOSJE6ndFrT+f0dg+wSN7Pm64I+kWH
         7Nlg==
X-Forwarded-Encrypted: i=1; AJvYcCV1bKDGbKDDkGgozwkOksc+msWswiggwc3ARVDhUTYXCzF1/p3uw+QR0KShONVUy6ydXHoO7CVmjWEs7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB4bNuqOwl+Hd1bGjhAv2JOr4FaW1uf/l4vveGHjxoVZLeQjlO
	X3NTD1DlNF8c/0cbh+hhsQhzY7QjlK5FKaTY2kBJrhTM2v7EGeXIEcza5WX7fXjR1TpWgbR9+1Z
	jpHwdx64fTVm7wMWtEJf3BWws4ECqziHfV3jp6inL1g==
X-Gm-Gg: ASbGnctzpR4ZwcPHcvLIfJhRqxDu1QGgQ9hvIH0VTRM0zNiRAYGkRwbE7vLCursB/zF
	nH/ypgGxWz4krAGDQMVEDFv5EHtZEysmcJ38rPw+b0h9K8NDg4VznFMOnGFIS7ujz3lttZf9D3F
	uXONYWHdiAU4qx2DvWnvI1VlU0w+9tx3KJxYjhAaMl47Umpw==
X-Google-Smtp-Source: AGHT+IFFarpV+643bKt5qJ+DNCUdXRkgdbFv1DFborAIItZ6HyKDTIAMbIuL6CmIep7RFIIvzboL1lf5sVGTpr/bZVk=
X-Received: by 2002:a05:6808:4fea:b0:40b:4208:710f with SMTP id
 5614622812f47-412bc6654bdmr1245049b6e.24.1752061357971; Wed, 09 Jul 2025
 04:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com> <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
In-Reply-To: <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 9 Jul 2025 19:42:26 +0800
X-Gm-Features: Ac12FXxVaWmUGd4ywnuSLaoxkhkOuISEKPywBGSGA0DKa-8LUWkMvwEIkoA4H6I
Message-ID: <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
Subject: Re: [External] [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com, 
	bjorn@rivosinc.com, cyrilbur@tenstorrent.com, rostedt@goodmis.org, 
	puranjay@kernel.org, ben.dooks@codethink.co.uk, zhangchunyan@iscas.ac.cn, 
	ruanjinjie@huawei.com, jszhang@kernel.org, charlie@rivosinc.com, 
	cleger@rivosinc.com, antonb@tenstorrent.com, ajones@ventanamicro.com, 
	debug@rivosinc.com, haibo1.xu@intel.com, samuel.holland@sifive.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>, wangziang.ok@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_044243_030398_54AC59DD 
X-CRM114-Status: GOOD (  28.18  )
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

SGkgUmFkaW0sCgpPbiBUdWUsIEp1bCA4LCAyMDI1IGF0IDc6MTDigK9QTSBSYWRpbSBLcsSNbcOh
xZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiAyMDI1LTA3LTA4VDE4OjA3
OjI3KzA4OjAwLCB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT46Cj4gPiBUaGlz
IHBhdGNoIGNsZXZlcmx5IGRpZmZlcmVudGlhdGVzIHdoZXRoZXIgYW4gZXhjZXB0aW9uIG9yaWdp
bmF0ZXMKPiA+IGZyb20gdXNlciBtb2RlIG9yIGtlcm5lbCBtb2RlLiBIb3dldmVyLCB0aGVyZSdz
IHN0aWxsIGFuIGlzc3VlIHdpdGgKPiA+IHVzaW5nIENTUl9TQ1JBVENIOiBlYWNoIHRpbWUgaGFu
ZGxlX2V4Y2VwdGlvbigpIGlzIGNhbGxlZCwgdGhlCj4gPiBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb25z
IG11c3QgYmUgZXhlY3V0ZWQ6Cj4gPgo+ID4gUkVHX0wgczAsIFRBU0tfVElfQ1BVKHRwKQo+ID4g
c2xsaSBzMCwgczAsIDMKPiA+IGxhIHMxLCBfX3Blcl9jcHVfb2Zmc2V0Cj4gPiBhZGQgczEsIHMx
LCBzMAo+ID4gUkVHX0wgczEsIDAoczEpCj4gPiBjc3J3IENTUl9TQ1JBVENILCBzMQo+Cj4gV2Ug
Y2FuIG1pbmltaXplIHRoZSBjb3N0IGF0IGV4Y2VwdGlvbiBlbnRyeSBieSBzdG9yaW5nIHRoZSBw
cmVjb21wdXRlZAo+IG9mZnNldCBpbiB0aHJlYWRfaW5mbywgd2hpY2ggYmxvYXRzIHRoZSBzdHJ1
Y3QsIGFuZCBhbHNvIGluY3VycyB1cGRhdGUKPiBjb3N0IG9uIGNwdSBtaWdyYXRpb24sIGJ1dCBz
aG91bGQgc3RpbGwgYmUgYSBuZXQgcGVyZm9ybWFuY2UgZ2Fpbi4KPgo+IFRoZSBtaW5pbWFsIGNv
ZGUgYXQgZXhjZXB0aW9uIGVudHJ5IHdvdWxkIGJlOgo+Cj4gICBSRUdfTCBzMCwgVEFTS19USV9Q
RVJDUFVfT0ZGU0VUKHRwKQo+ICAgY3NydyBDU1JfU0NSQVRDSCwgczAKPgo+ID4gU2hvdWxkIHdl
IGNvbnNpZGVyIGFkZGluZyBhIGRlZGljYXRlZCBDU1IgKGUuZy4sIENTUl9TQ1JBVENIMikgdG8K
PiA+IHN0b3JlIHRoZSBwZXJjcHUgb2Zmc2V0IGluc3RlYWQ/Cj4gPiBTZWU6IGh0dHBzOi8vbGlz
dHMucmlzY3Yub3JnL2cvdGVjaC1wcml2aWxlZ2VkL3RvcGljLzExMzQzNzU1MyNtc2cyNTA2Cj4K
PiBJdCB3b3VsZCBiZSBuaWNlIHRvIGdhdGhlciBtb3JlIGRhdGEgb24gdGhlIENTUl9TQ1JBVENI
IGFwcHJvYWNoLgo+IEJhc2ljYWxseSwgdGhlIG92ZXJoZWFkIG9mICJSRUdfTCBzMCwgVEFTS19U
SV9QRVJDUFVfT0ZGU0VUKHRwKSIuCj4gKE9yIHRoZSBsb25nZXIgc2VxdWVuY2UgaWYgd2UgdGhp
bmsgaXQgaXMgd29ydGggaXQuKQo+Cj4gQ2FuIHlvdSBiZW5jaG1hcmsgdGhlIHBhdGNoIGFmdGVy
IHJldmVydGluZyBwZXJjcHUuaCwgc28gd2UgaW5jbHVkZSB0aGUKPiBvdmVyaGVhZCBvZiBzd2l0
Y2hpbmcgQ1NSX1NDUkFUQ0gsIGJ1dCB3aXRob3V0IGFueSBiZW5lZml0cyBwcm92aWRlZCBieQo+
IHRoZSBwZXItY3B1IG9mZnNldD8KPiBUaGUgYmFzZWxpbmUgd291bGQgYmUgdGhlIHBhdGNoIHdp
dGggcmV2ZXJ0ZWQgcGVyY3B1LmgsIGFuZCByZXZlcnRlZCB0aGUKPiBzZXF1ZW5jZSB0aGF0IHNl
dHMgdGhlIENTUl9TQ1JBVENIIGluIGhhbmRsZV9leGNlcHRpb24sIHNvIHdlIHJvdWdobHkKPiBl
c3RpbWF0ZSB0aGUgYmVuZWZpdCBvZiBhZGRpbmcgQ1NSX1NDUkFUQ0gyLgo+Cj4gVGhlIENTUl9T
Q1JBVENIMiBkb2VzIGFkZCBvdmVyaGVhZCB0byBoYXJkd2FyZSwgYW5kIHRvIGRvbWFpbiBjb250
ZXh0Cj4gc3dpdGNoZXMsIGFuZCB3ZSBhbHNvIGhhdmUgdG8gZG8gc29tZXRoaW5nIGVsc2UgZm9y
IGEgZmV3IHllYXJzIGFueXdheSwKPiBiZWNhdXNlIGl0J3Mgbm90IGV2ZW4gcmF0aWZpZWQuLi4g
IEl0J3MgcG9zc2libGUgd2UgbWlnaHQgbm90IGJlbmVmaXQKPiBlbm91Z2ggZnJvbSBDU1JfU0NS
QVRDSDIgdG8gbWFrZSBhIGdvb2QgY2FzZSBmb3IgaXQuCj4KPiBUaGFua3MuCgpCZW5jaCBwbGF0
Zm9ybTogU3BhY2VtaXQoUikgWDYwCk5vIGNoYW5nZXM6CjYuNzcsIDYuNzkxLCA2Ljc5MiwgNi44
MjYsIDYuNzg0LCA2LjgzOSwgNi43NzYsIDYuNzMzLCA2Ljc5NSwgNi43NjMKR2VvbWV0cmljIG1l
YW46IDYuNzg2ODM5MzA1ClJldXNpbmcgdGhlIGN1cnJlbnQgc2NyYXRjaDoKNy4wODUsIDcuMDks
IDcuMDIxLCA3LjA4OSwgNy4wNjgsIDcuMDM0LCA3LjA2LCA3LjA2MiwgNy4wNjUsIDcuMDUxCkdl
b21ldHJpYyBtZWFuOiA3LjA2MjQ2Njg3NgpBIGRlZ3JhZGF0aW9uIG9mIGFwcHJveGltYXRlbHkg
NC4wNiUgaXMgb2JzZXJ2ZWQuIFRoZSBwb3NzaWJsZSBjYXVzZQpvZiB0aGUgZGVncmFkYXRpb24g
aXMgdGhhdCB0aGUgQ1NSX1RWRUMgcmVnaXN0ZXIgaXMgc2V0IGV2ZXJ5IHRpbWUgYQprZXJuZWwv
dXNlciBleGNlcHRpb24gb2NjdXJzLgoKVGhlIGZvbGxvd2luZyBpcyB0aGUgcGF0Y2ggd2l0aG91
dCBwZXJjcHUgb3B0aW1pemF0aW9uLCB3aGljaCBvbmx5CnRlc3RzIHRoZSBvdmVyaGVhZCBvZiBz
ZXBhcmF0aW5nIGV4Y2VwdGlvbnMgaW50byBrZXJuZWwgYW5kIHVzZXIKbW9kZXMuCgotLS0KIGFy
Y2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgfCAzOSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0KIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyAgfCAgNyArLS0tLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5T
CmluZGV4IDlkMWEzMDVkNTUwOC4uY2MyZmQ0Y2Q1NGEwIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKQEAgLTE5LDE3
ICsxOSw4IEBACgogIC5zZWN0aW9uIC5pcnFlbnRyeS50ZXh0LCAiYXgiCgotU1lNX0NPREVfU1RB
UlQoaGFuZGxlX2V4Y2VwdGlvbikKLSAvKgotICogSWYgY29taW5nIGZyb20gdXNlcnNwYWNlLCBw
cmVzZXJ2ZSB0aGUgdXNlciB0aHJlYWQgcG9pbnRlciBhbmQgbG9hZAotICogdGhlIGtlcm5lbCB0
aHJlYWQgcG9pbnRlci4gIElmIHdlIGNhbWUgZnJvbSB0aGUga2VybmVsLCB0aGUgc2NyYXRjaAot
ICogcmVnaXN0ZXIgd2lsbCBjb250YWluIDAsIGFuZCB3ZSBzaG91bGQgY29udGludWUgb24gdGhl
IGN1cnJlbnQgVFAuCi0gKi8KLSBjc3JydyB0cCwgQ1NSX1NDUkFUQ0gsIHRwCi0gYm5leiB0cCwg
LkxzYXZlX2NvbnRleHQKLQotLkxyZXN0b3JlX2tlcm5lbF90cHNwOgotIGNzcnIgdHAsIENTUl9T
Q1JBVENICitTWU1fQ09ERV9TVEFSVChoYW5kbGVfa2VybmVsX2V4Y2VwdGlvbikKKyBjc3J3IENT
Ul9TQ1JBVENILCB0cAogIFJFR19TIHNwLCBUQVNLX1RJX0tFUk5FTF9TUCh0cCkKCiAjaWZkZWYg
Q09ORklHX1ZNQVBfU1RBQ0sKQEAgLTQwLDcgKzMxLDIwIEBAIFNZTV9DT0RFX1NUQVJUKGhhbmRs
ZV9leGNlcHRpb24pCiAgUkVHX0wgc3AsIFRBU0tfVElfS0VSTkVMX1NQKHRwKQogI2VuZGlmCgot
LkxzYXZlX2NvbnRleHQ6CisgaiBoYW5kbGVfZXhjZXB0aW9uCitTWU1fQ09ERV9FTkQoaGFuZGxl
X2tlcm5lbF9leGNlcHRpb24pCisKK1NZTV9DT0RFX1NUQVJUKGhhbmRsZV91c2VyX2V4Y2VwdGlv
bikKKyAvKgorICogSWYgY29taW5nIGZyb20gdXNlcnNwYWNlLCBwcmVzZXJ2ZSB0aGUgdXNlciB0
aHJlYWQgcG9pbnRlciBhbmQgbG9hZAorICogdGhlIGtlcm5lbCB0aHJlYWQgcG9pbnRlci4KKyAq
LworIGNzcnJ3IHRwLCBDU1JfU0NSQVRDSCwgdHAKKyBqIGhhbmRsZV9leGNlcHRpb24KKworU1lN
X0NPREVfRU5EKGhhbmRsZV91c2VyX2V4Y2VwdGlvbikKKworU1lNX0NPREVfU1RBUlRfTk9BTElH
TihoYW5kbGVfZXhjZXB0aW9uKQogIFJFR19TIHNwLCBUQVNLX1RJX1VTRVJfU1AodHApCiAgUkVH
X0wgc3AsIFRBU0tfVElfS0VSTkVMX1NQKHRwKQogIGFkZGkgc3AsIHNwLCAtKFBUX1NJWkVfT05f
U1RBQ0spCkBAIC03MSwxMSArNzUsOCBAQCBTWU1fQ09ERV9TVEFSVChoYW5kbGVfZXhjZXB0aW9u
KQogIFJFR19TIHM0LCBQVF9DQVVTRShzcCkKICBSRUdfUyBzNSwgUFRfVFAoc3ApCgotIC8qCi0g
KiBTZXQgdGhlIHNjcmF0Y2ggcmVnaXN0ZXIgdG8gMCwgc28gdGhhdCBpZiBhIHJlY3Vyc2l2ZSBl
eGNlcHRpb24KLSAqIG9jY3VycywgdGhlIGV4Y2VwdGlvbiB2ZWN0b3Iga25vd3MgaXQgY2FtZSBm
cm9tIHRoZSBrZXJuZWwKLSAqLwotIGNzcncgQ1NSX1NDUkFUQ0gsIHgwCisgbGEgczEsIGhhbmRs
ZV9rZXJuZWxfZXhjZXB0aW9uCisgY3NydyBDU1JfVFZFQywgczEKCiAgLyogTG9hZCB0aGUgZ2xv
YmFsIHBvaW50ZXIgKi8KICBsb2FkX2dsb2JhbF9wb2ludGVyCkBAIC0xNDEsNiArMTQyLDEwIEBA
IFNZTV9DT0RFX1NUQVJUX05PQUxJR04ocmV0X2Zyb21fZXhjZXB0aW9uKQogICogc3RydWN0dXJl
cyBhZ2Fpbi4KICAqLwogIGNzcncgQ1NSX1NDUkFUQ0gsIHRwCisKKyBsYSBhMCwgaGFuZGxlX3Vz
ZXJfZXhjZXB0aW9uCisgY3NydyBDU1JfVFZFQywgYTAKKwogMToKICNpZmRlZiBDT05GSUdfUklT
Q1ZfSVNBX1ZfUFJFRU1QVElWRQogIG1vdmUgYTAsIHNwCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKaW5kZXggYTJlMmYwZGQz
ODk5Li45OTJhY2VjM2JjODcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwor
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKQEAgLTE3MiwxNCArMTcyLDkgQEAgc2Vjb25k
YXJ5X3N0YXJ0X3NiaToKIC5hbGlnbiAyCiAuTHNldHVwX3RyYXBfdmVjdG9yOgogIC8qIFNldCB0
cmFwIHZlY3RvciB0byBleGNlcHRpb24gaGFuZGxlciAqLwotIGxhIGEwLCBoYW5kbGVfZXhjZXB0
aW9uCisgbGEgYTAsIGhhbmRsZV9rZXJuZWxfZXhjZXB0aW9uCiAgY3NydyBDU1JfVFZFQywgYTAK
Ci0gLyoKLSAqIFNldCBzdXAwIHNjcmF0Y2ggcmVnaXN0ZXIgdG8gMCwgaW5kaWNhdGluZyB0byBl
eGNlcHRpb24gdmVjdG9yIHRoYXQKLSAqIHdlIGFyZSBwcmVzZW50bHkgZXhlY3V0aW5nIGluIGtl
cm5lbC4KLSAqLwotIGNzcncgQ1NSX1NDUkFUQ0gsIHplcm8KICByZXQKCiAuYWxpZ24gMgotLQoy
LjQzLjAKCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
