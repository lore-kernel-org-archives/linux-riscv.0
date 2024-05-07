Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BC9C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FfhF/xapjYIBc+0y68KptJy0MIzIZ/OxhZBZf1mwIs=; b=mOqtGyCPMpYkm/
	swkGCaVvA+vAXunYjE2qOqvhoCXwvgtuKzTNhFqieA0YoNi2y+p25YcXpFQn/HHZVkCA+GkU5LafK
	7RKc0dx9FzlS5mcVjVlBszeV7Tps4sNiHR3+aMEXsWr2frcp6vRYZWKa5WQMeeMfsZ1j7BbR42XSC
	DLBQacje1bVkpS9uXZ0OfgG/aikP3tKJvqFnmHUajE1bTkNNl4N4SSpjQmC1RHuEWSgNKLNxsdgkG
	GHZ5V6UifWPGXC06sQGMroWiNqLMLZUQEKbLNIqLbW+u5uOW/YhqaOF22NWtwBFSRPSRXS7tmKPko
	+Yh5n6b4E3AFY0JSWTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Mc4-0000000BieX-2Q4M;
	Tue, 07 May 2024 15:20:16 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Mc1-0000000Bido-1mYD
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 15:20:14 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7e17c2a9eefso69228939f.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715095211; x=1715700011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3612MOIikzCEeo+mwv3X2VMyaMFpK5mgqqdWHRbusjg=;
        b=ZaDjYVHkgLXk5vZIlOc9yxUQFeA+GuIRHHWdfwjs/McYJXkAohNzQOHHHUg/xXPubV
         BAHT/ouiZU7m7mdPDs0IHwBvpDDGWMYr8MxWg0erNOuT7AWL8vvbuDIbbU3tM7fhD9cc
         Vmqn0JazvJt0zPYd5QLycyjD9AvPPBd/dsW3dWrf+YWV6LL6nN0emhFbN2C3DazVQcz1
         4RNfm3VLHzaM2XkkvLg0hsMFiSJUG65xIxFUSXGm2AUZJxF4P9QhgJLTQOL7t9IzLdM4
         /i/4JU3at2CKhvaJYrciQDsHKaw+25vtAfM91JxwgZu6KWRWW6ji4Z3jQdnpVs7hOUE5
         07Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715095211; x=1715700011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3612MOIikzCEeo+mwv3X2VMyaMFpK5mgqqdWHRbusjg=;
        b=PnqjuNT5reZdBDaPIM2hKvPgnQq0IsGGYsjEoPa1/k4C6N/NJ/7Kz/YOMEnbrxacbo
         qic8NoQ8Dq4O2BFyzVhxbKLH45AAfJUCZOmhu6VqaH8FUtrMSbvS9fBFhh+zW4s/nFHq
         yhI8ICepN5sNr1BHjXPp5z8l6SiCAj1VME8PI/eG057W2HfxJMVMbY6GWT1nzZC4hNvo
         XMRap6VKhwm4srAtBSTJysmzL6GJpBjNOejrbzSAQdY26RK7aBYnD+l+t4mQxRYgc6ju
         7M0ky5nP2xUBLmNa8saBGI3kWvd03nluarnYM4AnBoBngPjbyaQnnrGl7Z1WADm3EOE3
         cqJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyUmYEYUPtkDlIxkFHtZiFl/NGPQRBrd97Csb27/UxbIvGIhfVouRM84K3GkFHR6BJxhDY22ceesrMJcDzqsZdBXjUQPh5lBKYRzV6Ec3D
X-Gm-Message-State: AOJu0Yy0aY3CBykHcG/Li44K3a7a0IdtluSEDA5h4l0g0Wr9+KyrTdzQ
	+FljtxVTqN/c6h8CxzPcebF5t2jHf9jK1/KDWZIK3NC3IetxXPFImxtOBzfweduYGytuaf52AWJ
	jDTrdFwzHNcRyT87PShnn8XLoirgdi3l1fPhGPg==
X-Google-Smtp-Source: AGHT+IFHKLBV5UyA+nE/FKsONZhELrkveEhHfV9QMKA63cqAy8XVSr7F4OwiQdsFr0lrM8BGsK3l5VTeIv2rndOqxu4=
X-Received: by 2002:a05:6602:f08:b0:7de:ac01:4224 with SMTP id
 hl8-20020a0566020f0800b007deac014224mr15044010iob.1.1715095210897; Tue, 07
 May 2024 08:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240507142600.23844-1-zong.li@sifive.com> <20240507142600.23844-5-zong.li@sifive.com>
 <20240507145456.GH901876@ziepe.ca>
In-Reply-To: <20240507145456.GH901876@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 7 May 2024 23:19:58 +0800
Message-ID: <CANXhq0ptCxyUc==oCG8MgLOCdF7Z=KRW4pct62BCSgsB_9hQkQ@mail.gmail.com>
Subject: Re: [PATCH RFC RESEND 4/6] iommu/riscv: support nested iommu for
 getting iommu hardware information
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kevin.tian@intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_082013_535713_D1BFD8FA 
X-CRM114-Status: GOOD (  17.25  )
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

T24gVHVlLCBNYXkgNywgMjAyNCBhdCAxMDo1NOKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDA3LCAyMDI0IGF0IDEwOjI1OjU4UE0gKzA4
MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPiArewo+ID4gKyAgICAgc3RydWN0IHJpc2N2X2lvbW11X2Rl
dmljZSAqaW9tbXUgPSBkZXZfdG9faW9tbXUoZGV2KTsKPiA+ICsgICAgIHN0cnVjdCBpb21tdV9o
d19pbmZvX3Jpc2N2X2lvbW11ICppbmZvOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFpb21tdSkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4KPiBUaGlzIGlzIG5vdCBw
b3NzaWJsZSwgZG9uJ3QgaW5jbHVkZSBpbXBvc3NpYmxlIGNoZWNrcyBsaWtlIHRoaXMuCgpUaGFu
a3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LCBJIHdpbGwgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IHZl
cnNpb24uCgo+Cj4gPiArICAgICBpbmZvID0ga3phbGxvYyhzaXplb2YoKmluZm8pLCBHRlBfS0VS
TkVMKTsKPiA+ICsgICAgIGlmICghaW5mbykKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIEVSUl9Q
VFIoLUVOT01FTSk7Cj4gPiArCj4gPiArICAgICBpbmZvLT5jYXBhYmlsaXR5ID0gaW9tbXUtPmNh
cHM7Cj4gPiArICAgICBpbmZvLT5mY3RsID0gcmlzY3ZfaW9tbXVfcmVhZGwoaW9tbXUsIFJJU0NW
X0lPTU1VX1JFR19GQ1RMKTsKPiA+ICsKPiA+ICsgICAgICpsZW5ndGggPSBzaXplb2YoKmluZm8p
Owo+ID4gKyAgICAgKnR5cGUgPSBJT01NVV9IV19JTkZPX1RZUEVfUklTQ1ZfSU9NTVU7Cj4gPiAr
Cj4gPiArICAgICByZXR1cm4gaW5mbzsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIGludCByaXNj
dl9pb21tdV9kZXZpY2VfZG9tYWluX3R5cGUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gIHsKPiA+
ICAgICAgIHJldHVybiAwOwo+ID4gQEAgLTE1NjAsNiArMTU4Miw3IEBAIHN0YXRpYyB2b2lkIHJp
c2N2X2lvbW11X3JlbGVhc2VfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IGlvbW11X29wcyByaXNjdl9pb21tdV9vcHMgPSB7Cj4gPiAgICAgICAucGdz
aXplX2JpdG1hcCA9IFNaXzRLLAo+ID4gICAgICAgLm9mX3hsYXRlID0gcmlzY3ZfaW9tbXVfb2Zf
eGxhdGUsCj4gPiArICAgICAuaHdfaW5mbyA9IHJpc2N2X2lvbW11X2h3X2luZm8sCj4gPiAgICAg
ICAuaWRlbnRpdHlfZG9tYWluID0gJnJpc2N2X2lvbW11X2lkZW50aXR5X2RvbWFpbiwKPiA+ICAg
ICAgIC5ibG9ja2VkX2RvbWFpbiA9ICZyaXNjdl9pb21tdV9ibG9ja2luZ19kb21haW4sCj4gPiAg
ICAgICAucmVsZWFzZV9kb21haW4gPSAmcmlzY3ZfaW9tbXVfYmxvY2tpbmdfZG9tYWluLAo+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9pb21tdWZkLmggYi9pbmNsdWRlL3VhcGkv
bGludXgvaW9tbXVmZC5oCj4gPiBpbmRleCAxZGZlYWEyZTY0OWUuLmVjOWFhZmQ3ZDM3MyAxMDA2
NDQKPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9pb21tdWZkLmgKPiA+ICsrKyBiL2luY2x1
ZGUvdWFwaS9saW51eC9pb21tdWZkLmgKPiA+IEBAIC00NzUsMTUgKzQ3NSwyOCBAQCBzdHJ1Y3Qg
aW9tbXVfaHdfaW5mb192dGQgewo+ID4gICAgICAgX19hbGlnbmVkX3U2NCBlY2FwX3JlZzsKPiA+
ICB9Owo+ID4KPiA+ICsvKioKPiA+ICsgKiBzdHJ1Y3QgaW9tbXVfaHdfaW5mb19yaXNjdl9pb21t
dSAtIFJJU0NWIElPTU1VIGhhcmR3YXJlIGluZm9ybWF0aW9uCj4gPiArICoKPiA+ICsgKiBAY2Fw
YWJpbGl0eTogVmFsdWUgb2YgUklTQy1WIElPTU1VIGNhcGFiaWxpdHkgcmVnaXN0ZXIKPiA+ICsg
KiBAZmN0bDogVmFsdWUgb2YgUklTQy1WIElPTU1VIGZlYXR1cmUgY29udHJvbCByZWdpc3Rlcgo+
ID4gKyAqLwo+Cj4gUGxlYXNlIGNhbGwgb3V0IGV4cGxpY3RseSB3aGF0IHNwZWMgdGhlc2UgdmFs
dWVzIGNvbWUgZnJvbS4KCkxldCBtZSBhZGQgdGhlIGRlc2NyaXB0aW9uIGZvciB0aGUgc2VjdGlv
biB0aGF0IGRlZmluZXMgdGhlbS4KCj4KPiA+ICtzdHJ1Y3QgaW9tbXVfaHdfaW5mb19yaXNjdl9p
b21tdSB7Cj4gPiArICAgICBfX2FsaWduZWRfdTY0IGNhcGFiaWxpdHk7Cj4gPiArICAgICBfX3Uz
MiBmY3RsOwo+ID4gK307Cj4KPiBBZGQgZXhwbGljaXQgcGFkZGluZyBoZXJlCgpBZGQgYSB1MzIg
cmVzZXJ2ZSBoZXJlIGluIHRoZSBuZXh0IHZlcnNpb24uIFRoYW5rcwoKPgo+IEphc29uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
