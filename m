Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7B0C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 01:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NCsih4iE3rAm0s6sfYg3RsIr4+1J6nogsyMJtLjlOg=; b=hFNIRm5wupXOPn
	bmR3uLBjMFeaXDWTNa5lh5xSWtpjyN6fhuePVno7P9MFcQAwxp8mNVIKfR6dBCqg616/KLRphEYNo
	ILfM+n2t+VUQKSAE/PkS1NohDvNs/PuTvWxV/iw7DTYW9DaZMP1lTMu1YSNEtOnYJgRG2VW0A550R
	9xlUgJpKeb4udDyKCYj1B+JUFMxVxsUFV+kMgN4rnuzas0iBrcSgbAYKtGhl6TdJr7+GHWRxrHdd3
	NN8FDzMn1vKsiK5XFkqbsUjjCgVsvsT25OU5A1AQYpv7WF1lBmWLRfsqXVMOHkKmT0p0/8XeM9uQE
	xWsCqDIwWgCvwrlR4VGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG8E1-001Sd1-0h;
	Thu, 21 Dec 2023 01:51:49 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG8Dy-001Sca-04
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 01:51:47 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1f060e059a3so189695fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 17:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1703123501; x=1703728301; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAWSfxg1miex9VPUVo9Ilnw4CJ41/kT47/lxOaa6acg=;
        b=W8iRosf1N6zqWhiof1KdfK9oNO3VL94cl+E36RqYvR8ONYkQiekqJnCSCc9Cb0R5vt
         F3PwqIwWlZchpnwF3m1ku4u51g57fqnLI3hLHZHja3+W5+ttrS1/knXWcneSXd19UOC3
         Tolty7TjmGWGRPdJPcrDYM64rZLo62pXt3789g/0lPMq3YAoTj/IrhFld1TVgXqA02JB
         EoSeK014u2elsZuTv+EEPHgP1ALHlP2FIc+DIrbK4NeKVTSiMi/XprQ3uQS/O8dyxge8
         DdORdsEg3iz0EcUNr07J7QklvOYzhDosKB1CVyPZ/03luxvJDQXPVzoAK20tEH5h11Zx
         sJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703123501; x=1703728301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAWSfxg1miex9VPUVo9Ilnw4CJ41/kT47/lxOaa6acg=;
        b=wstVXUetWIx7sVCQ5B4TD49KCP/ZJrlI+gh8ZouL41CF9QiR5Z+4BIJP9C2fTNXzEy
         3kRKnRopaIRX9SEfl5PwWV1q5aSmXWkvmDC489OON5hcSoXr8u7N3Wisko8v01dRuzQy
         /Y7c5FVEMe3WmPZ+dc33Xpaojhoe3UEJBTYoThryn6e9N8HlsdKMzFnxVnrcSZbiYUA7
         2tvkT55SE7MKm+bfVPSWxx9D8zUjOYQ3FcMedLkIkoPojh++GVCVs3LUpGtL5wgKYRBs
         Uk58yIE45OC5QT1gFVwGt+su/Nztj830C3ZgnsInExsfdyEhC1XwOv49MVpxZ4Lk1hNE
         pZBw==
X-Gm-Message-State: AOJu0YzjeM7SeDRhZleIUdT7oEf3nv8x4mrKPDMUL3OoGDje+k2vaG7Q
	+EvelJ4b08Ac/1Ul5Q++fce+A2yoFtxnrXJ+AM94qw==
X-Google-Smtp-Source: AGHT+IGN8PP7Ek6OmvKkh+7+/vTCnhK7cnIN5E/W9H5dAyu3VY2JS7fSNFsVpuoOstd0OaOISNlEDGsV6vgYcUy4Mus=
X-Received: by 2002:a05:6871:4d4:b0:203:4038:dfd5 with SMTP id
 n20-20020a05687104d400b002034038dfd5mr782420oai.94.1703123500988; Wed, 20 Dec
 2023 17:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20231220103428.61758-1-cuiyunhui@bytedance.com>
 <594df6bc-0207-46f6-aa81-dcf1f3665917@ghiti.fr> <20231220-bash-booting-2dc46e8c41f7@spud>
In-Reply-To: <20231220-bash-booting-2dc46e8c41f7@spud>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 21 Dec 2023 09:51:29 +0800
Message-ID: <CAEEQ3w=_i6cDkt-j+xDZ1oanbScA9o8NpV-KU0s4-w=ZJ1U6cA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: put va_kernel_xip_pa_offset into CONFIG_XIP_KERNEL
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, ajones@ventanamicro.com, alexghiti@rivosinc.com, 
	anup@brainfault.org, samitolvanen@google.com, rppt@kernel.org, 
	panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_175146_364066_1261C8C4 
X-CRM114-Status: GOOD (  21.29  )
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

SGkgQ29ub3LvvIxBbGV4CgpPbiBUaHUsIERlYyAyMSwgMjAyMyBhdCA2OjM14oCvQU0gQ29ub3Ig
RG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgRGVjIDIwLCAyMDIz
IGF0IDEwOjE0OjU5UE0gKzAxMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IEhpIFl1bmh1
aSwKPiA+Cj4gPiBPbiAyMC8xMi8yMDIzIDExOjM0LCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gPiBv
cGl0bWl6ZSB0aGUga2VybmVsX21hcHBpbmdfcGFfdG9fdmEoKSBhbmQga2VybmVsX21hcHBpbmdf
dmFfdG9fcGEoKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGFnZS5oIHwgMzMgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+ID4gPiBpbmRleCA1NDg4ZWNjMzM3YjYuLjBkMmI0Nzlk
MDJjZCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPiA+
ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPiA+ID4gQEAgLTExMyw4ICsx
MTMsOCBAQCBzdHJ1Y3Qga2VybmVsX21hcHBpbmcgewo+ID4gPiAgICAgdW5zaWduZWQgbG9uZyB2
YV9wYV9vZmZzZXQ7Cj4gPiA+ICAgICAvKiBPZmZzZXQgYmV0d2VlbiBrZXJuZWwgbWFwcGluZyB2
aXJ0dWFsIGFkZHJlc3MgYW5kIGtlcm5lbCBsb2FkIGFkZHJlc3MgKi8KPiA+ID4gICAgIHVuc2ln
bmVkIGxvbmcgdmFfa2VybmVsX3BhX29mZnNldDsKPiA+ID4gLSAgIHVuc2lnbmVkIGxvbmcgdmFf
a2VybmVsX3hpcF9wYV9vZmZzZXQ7Cj4gPiA+ICAgI2lmZGVmIENPTkZJR19YSVBfS0VSTkVMCj4g
PiA+ICsgICB1bnNpZ25lZCBsb25nIHZhX2tlcm5lbF94aXBfcGFfb2Zmc2V0Owo+ID4gPiAgICAg
dWludHB0cl90IHhpcHJvbTsKPiA+ID4gICAgIHVpbnRwdHJfdCB4aXByb21fc3o7Cj4gPiA+ICAg
I2VuZGlmCj4gPiA+IEBAIC0xMzQsMTIgKzEzNCwyNSBAQCBleHRlcm4gcGh5c19hZGRyX3QgcGh5
c19yYW1fYmFzZTsKPiA+ID4gICAjZWxzZQo+ID4gPiAgIHZvaWQgKmxpbmVhcl9tYXBwaW5nX3Bh
X3RvX3ZhKHVuc2lnbmVkIGxvbmcgeCk7Cj4gPiA+ICAgI2VuZGlmCj4gPiA+IC0jZGVmaW5lIGtl
cm5lbF9tYXBwaW5nX3BhX3RvX3ZhKHkpICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiA+IC0gICB1bnNpZ25lZCBsb25nIF95ID0gKHVuc2lnbmVkIGxvbmcpKHkp
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+IC0gICAoSVNfRU5BQkxF
RChDT05GSUdfWElQX0tFUk5FTCkgJiYgX3kgPCBwaHlzX3JhbV9iYXNlKSA/ICAgICAgICAgICAg
ICAgICBcCj4gPiA+IC0gICAgICAgICAgICh2b2lkICopKF95ICsga2VybmVsX21hcC52YV9rZXJu
ZWxfeGlwX3BhX29mZnNldCkgOiAgICAgICAgICAgICBcCj4gPiA+IC0gICAgICAgICAgICh2b2lk
ICopKF95ICsga2VybmVsX21hcC52YV9rZXJuZWxfcGFfb2Zmc2V0ICsgWElQX09GRlNFVCk7ICAg
ICBcCj4gPiA+IC0gICB9KQo+ID4gPiArCj4gPiA+ICsjaWZkZWYgQ09ORklHX1hJUF9LRVJORUwK
PiA+ID4gKyNkZWZpbmUga2VybmVsX21hcHBpbmdfcGFfdG9fdmEoeSkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiArICAgKCgodW5zaWduZWQg
bG9uZykoeSkgPCBwaHlzX3JhbV9iYXNlKSA/ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiA+ICsgICAgICAgICAgICh2b2lkICopKCh1bnNpZ25lZCBsb25nKSh5
KSArIGtlcm5lbF9tYXAudmFfa2VybmVsX3hpcF9wYV9vZmZzZXQpIDogICAgIFwKPiA+ID4gKyAg
ICAgICAgICAgKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpKHkpICsga2VybmVsX21hcC52YV9rZXJu
ZWxfcGFfb2Zmc2V0ICsgWElQX09GRlNFVCkpCj4gPiA+ICsKPiA+ID4gKyNkZWZpbmUga2VybmVs
X21hcHBpbmdfdmFfdG9fcGEoeSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ID4gKyAgICgoKHVuc2lnbmVkIGxvbmcpKHkpIDwga2VybmVsX21hcC52aXJ0X2Fk
ZHIgKyBYSVBfT0ZGU0VUKSA/ICAgICAgICAgICAgIFwKPiA+ID4gKyAgICAgICAgICAgKCh1bnNp
Z25lZCBsb25nKSh5KSAtIGtlcm5lbF9tYXAudmFfa2VybmVsX3hpcF9wYV9vZmZzZXQpIDogICAg
IFwKPiA+ID4gKyAgICAgICAgICAgKCh1bnNpZ25lZCBsb25nKSh5KSAtIGtlcm5lbF9tYXAudmFf
a2VybmVsX3BhX29mZnNldCAtIFhJUF9PRkZTRVQpKQo+ID4gPiArI2Vsc2UKPiA+ID4gKyNkZWZp
bmUga2VybmVsX21hcHBpbmdfcGFfdG9fdmEoeSkgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiA+ID4gKyAgICgodm9pZCAqKSgodW5zaWduZWQgbG9uZykoeSkgKyBr
ZXJuZWxfbWFwLnZhX2tlcm5lbF9wYV9vZmZzZXQgKyBYSVBfT0ZGU0VUKSkKPiA+ID4gKwo+ID4g
PiArI2RlZmluZSBrZXJuZWxfbWFwcGluZ192YV90b19wYSh5KSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiArICAgKCh1bnNpZ25lZCBsb25nKSh5KSAtIGtl
cm5lbF9tYXAudmFfa2VybmVsX3BhX29mZnNldCAtIFhJUF9PRkZTRVQpCj4gPiA+ICsjZW5kaWYK
PiA+ID4gKwo+ID4gPiAgICNkZWZpbmUgX19wYV90b192YV9ub2RlYnVnKHgpICAgICAgICAgICAg
IGxpbmVhcl9tYXBwaW5nX3BhX3RvX3ZhKHgpCj4gPiA+ICAgI2lmbmRlZiBDT05GSUdfREVCVUdf
VklSVFVBTAo+ID4gPiBAQCAtMTQ3LDEyICsxNjAsNiBAQCB2b2lkICpsaW5lYXJfbWFwcGluZ19w
YV90b192YSh1bnNpZ25lZCBsb25nIHgpOwo+ID4gPiAgICNlbHNlCj4gPiA+ICAgcGh5c19hZGRy
X3QgbGluZWFyX21hcHBpbmdfdmFfdG9fcGEodW5zaWduZWQgbG9uZyB4KTsKPiA+ID4gICAjZW5k
aWYKPiA+ID4gLSNkZWZpbmUga2VybmVsX21hcHBpbmdfdmFfdG9fcGEoeSkgKHsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAtICAgdW5zaWduZWQg
bG9uZyBfeSA9ICh1bnNpZ25lZCBsb25nKSh5KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gPiAtICAgKElTX0VOQUJMRUQoQ09ORklHX1hJUF9LRVJORUwpICYmIF95IDwg
a2VybmVsX21hcC52aXJ0X2FkZHIgKyBYSVBfT0ZGU0VUKSA/IFwKPiA+ID4gLSAgICAgICAgICAg
KF95IC0ga2VybmVsX21hcC52YV9rZXJuZWxfeGlwX3BhX29mZnNldCkgOiAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ID4gLSAgICAgICAgICAgKF95IC0ga2VybmVsX21hcC52YV9rZXJuZWxfcGFf
b2Zmc2V0IC0gWElQX09GRlNFVCk7ICAgICAgICAgICAgIFwKPiA+ID4gLSAgIH0pCj4gPiA+ICAg
I2RlZmluZSBfX3ZhX3RvX3BhX25vZGVidWcoeCkgICAgICh7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gICAgIHVuc2lnbmVkIGxvbmcgX3ggPSB4
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
Cj4gPgo+ID4gTm90IHN1cmUgdXNpbmcgI2lmZGVmIG9wdGltaXplcyBhbnl0aGluZyBzaW5jZSB0
aGUgY29tcGlsZXIgc2hvdWxkIGRvIHRoZQo+ID4gc2FtZSB3aXRoIHRoZSBJU19FTkFCTEVEKENP
TkZJR19YSVBfS0VSTkVMKSBhbmQgaXQgZG9lcyBub3QgcmVhbGx5IGltcHJvdmUKPiA+IHRoZSBy
ZWFkYWJpbGl0eSBvZiB0aGlzIGZpbGUgd2hpY2ggaXMgYWxyZWFkeSBvdmVybG9hZGVkIHdpdGgg
I2lmZGVmLCBzbyBJCj4gPiBkb24ndCB0aGluayB0aGlzIGNoYW5nZSBpcyBuZWVkZWQuCj4KPiBJ
IHdvdWxkIHNheSB0aGF0IHdlIGV4cGxpY2l0bHkgZG8gbm90IHdhbnQgdG8gbW92ZSB0aGluZ3Mg
dGhhdCBhcmUKPiBndWFyZGVkIGJ5IElTX0VOQUJMRUQoKSB0byBpZmRlZmZlcnkuIEluIGZhY3Qs
IHdlIHNob3VsZCBtb3ZlIHRoaW5ncyBpbgo+IHRoZSBvdGhlciBkaXJlY3Rpb24gaWYgcG9zc2li
bGUsIGVzcGVjaWFsbHkgZm9yIHN0dWZmIGxpa2UgWElQX0tFUk5FTAo+IHRoYXQgbm9ib2R5IGV2
ZXIgYnVpbGQgdGVzdHMuCgpUaGUgcG9pbnQgb2YgdGhpcyBwYXRjaCBpcyB0aGF0IGxvZ2ljYWxs
eSwgbGlrZSB4aXByb20gYW5kIHhpcHJvbV9zeiwKc3R1Y3Qga2VybmVsX21hcHBpbmcudmFfa2Vy
bmVsX3hpcF9wYV9vZmZzZXQgc2hvdWxkIGJlIGluY2x1ZGVkIGluCkNPTkZJR19YSVBfS0VSTkVM
LgoKSSBiZWxpZXZlIHdlIGNhbiBhZ3JlZSBvbiB0aGlzLCByaWdodD8KClRoYW5rcywKWXVuaHVp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
