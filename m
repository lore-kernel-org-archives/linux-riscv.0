Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4196BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 21:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNcaid51bu9H3Rgf6yw3bZ4dMg4nj/E8u4PNd0mSNV0=; b=P6kbwQ4QYyqigQ
	T0s/vnrJbgSjGwQRtIkAHcmh1aOuUg2xQjjAOhbzjNPjs7VFGmm+/ZB7vMYyp4X0el8cxX4ECdfai
	mwK7n75CDFcgdsMzDEon4vXH2jQvWxwdUovFoQD58c2ZjYqLeFQDucaLBqPTb32I/c8/8xaK1UuGz
	jiZwgLFgzJbLMazcqrWD00lZDRvJ15azWJwAApBgr/O1LAoCRHO1bc9Wt78Tet6AvzMxQIGTva9ub
	BeRxwu9u73HZqhFmnuizvt38pJ3z3jgf0wnrWFoRxH0cbHVAMN7LekbaXNjP2xRO9z1benwhR6Vto
	zSxTC0Na4RV81Dh0woqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otEgD-00AKkg-FQ; Thu, 10 Nov 2022 21:01:45 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otEgA-00AKcK-GG
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 21:01:44 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-13ae8117023so3491503fac.9
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 13:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSbodY8FqZ0Ciim/vAb77VV4F9ElrHL2UVuKiq5ungA=;
        b=YMGD8nMS55gvLSoZ8tKrtFoOZ/Ve6TrHy42MgIRNg7/fmubAxDJH5DG0RW10SxvOeP
         DjTT4GnaBPcWIi5FHosoNTKOgkLUY73yZvvLd9GalbDMFolHEKGR8P2hdFUvIFmPB/SO
         BrV90aXQ1eoZkI6c1yhjIGCApzY+hu3tS/DTZEU/Fg2s7BMNOWpnAvF4Cuip1vbjLDDi
         Wi0Cf6JFPCLTbtm34QorcHgGhquebmcOqtlB6bTQLk4Mr7H+4Eba3Bf+AHWKYeyJTbOW
         TJMserRFDaCMIXo5v2+5i1CgxrdLo/ul7beHcB3VpcJHaJjJRJj3Y82oz8ECPN2Z55/w
         fCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSbodY8FqZ0Ciim/vAb77VV4F9ElrHL2UVuKiq5ungA=;
        b=FGqFF2njIxorsH7XP8Z7zmohKqf8Fz54wsvQCQNrxtS18Zq7Cj8FUMDXBebZOiEqtG
         mYeeRWqp/ZtSYLOgnH1Jy9exYQxeW4DJO2+DfuW8bp1FhJzmBXAD6Kjbokx+xqwUY7NZ
         DGZRkL+RQTVvUlvtgVntYI+YW8zI5S5VkerU0JD3EIjayzUz47J3c7gcfi9nzHc2kEx8
         DMK/AN2u3m7/vxbmbO+ywMzUHOx5c205ffHGBdDxg792DModgwMuqiTZMLPYG3UpNRni
         fmGt6IYqkmeKG9MOA0EQ8bT8m6Fo4gDN3xrIi3DtrMNc8f23AYwBNQavz/PGdQXtTt5/
         6irA==
X-Gm-Message-State: ACrzQf3sIGBTQK+gwCdc+8qC1lz5cr30GjoksjaYm7XTis7z1myBqwCz
	Q7Eps8m6C0Kmwy222d9bZg+e6DrFf0T/MtF/qchQYLXHBevLopHm
X-Google-Smtp-Source: AMsMyM5Lbc1uK8AP5uOpZgGwnsT6w5cfTgiZG9wE2H4u+6rVvgryo+vd5IZC988GgRuXQXR3iL+1Gj8CZ3j8fJF1g8o=
X-Received: by 2002:a05:6870:ab84:b0:13c:7d1c:5108 with SMTP id
 gs4-20020a056870ab8400b0013c7d1c5108mr2177638oab.282.1668114096980; Thu, 10
 Nov 2022 13:01:36 -0800 (PST)
MIME-Version: 1.0
References: <mhng-9e6b4607-6bea-411c-b843-916c1e0798ee@palmerdabbelt-glaptop> <182c1d4e-a117-79d6-4dd1-8e3c8a447b4a@ghiti.fr>
In-Reply-To: <182c1d4e-a117-79d6-4dd1-8e3c8a447b4a@ghiti.fr>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 10 Nov 2022 13:01:26 -0800
Message-ID: <CACT4Y+YYAfTafFk7DE0B=qQFgkPXS7492AhBdY_CP1WdB8CGfA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
To: Alex Ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, macro@orcam.me.uk, david.abdurachmanov@gmail.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-api@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_130142_583029_E83EEAC3 
X-CRM114-Status: GOOD (  40.34  )
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

T24gTW9uLCAyMSBKdW4gMjAyMSBhdCAwMDoxMSwgQWxleCBHaGl0aSA8YWxleEBnaGl0aS5mcj4g
d3JvdGU6Cj4KPiBIaSBQYWxtZXIsCj4KPiBMZSAyMy8wNC8yMDIxIMOgIDA0OjU3LCBQYWxtZXIg
RGFiYmVsdCBhIMOpY3JpdCA6Cj4gPiBPbiBGcmksIDAyIEFwciAyMDIxIDExOjMzOjMwIFBEVCAo
LTA3MDApLCBtYWNyb0BvcmNhbS5tZS51ayB3cm90ZToKPiA+PiBPbiBGcmksIDIgQXByIDIwMjEs
IERhdmlkIEFiZHVyYWNobWFub3Ygd3JvdGU6Cj4gPj4KPiA+Pj4gPiA+ID4gIFRoaXMgbWFjcm8g
aXMgZXhwb3J0ZWQgYXMgYSBwYXJ0IG9mIHRoZSB1c2VyIEFQSSBzbyBpdCBtdXN0Cj4gPj4+IG5v
dCBkZXBlbmQgb24KPiA+Pj4gPiA+ID4gS2NvbmZpZy4gIEFsc28gY2hhbmdpbmcgaXQgKHJhdGhl
ciB0aGFuIHNheSBhZGRpbmcKPiA+Pj4gQ09NTUFORF9MSU5FX1NJWkVfVjIgb3IKPiA+Pj4gPiA+
ID4gc3dpdGNoaW5nIHRvIGFuIGVudGlyZWx5IG5ldyBkYXRhIG9iamVjdCB0aGF0IGhhcyBpdHMg
ZGltZW5zaW9uCj4gPj4+IHNldCBpbiBhCj4gPj4+ID4gPiA+IGRpZmZlcmVudCB3YXkpIHJlcXVp
cmVzIGNhcmVmdWwgZXZhbHVhdGlvbiBhcyBleHRlcm5hbCBiaW5hcmllcwo+ID4+PiBoYXZlIGFu
ZAo+ID4+PiA+ID4gPiB3aWxsIGhhdmUgdGhlIHZhbHVlIGl0IGV4cGFuZHMgdG8gY29tcGlsZWQg
aW4sIHNvIGl0J3MgYSBwYXJ0Cj4gPj4+IG9mIHRoZSBBQkkKPiA+Pj4gPiA+ID4gdG9vLgo+ID4+
PiA+ID4KPiA+Pj4gPiA+IFRoYW5rcywgSSBkaWRuJ3QgcmVhbGl6ZSB0aGlzIHdhcyBwYXJ0IG9m
IHRoZSB1c2VyIEJJLiAgSW4gdGhhdAo+ID4+PiBjYXNlIHdlCj4gPj4+ID4gPiByZWFsbHkgY2Fu
J3QgY2hhZ2UgaXQsIHNvIHdlJ2xsIGhhdmUgdG8gc29ydCBvdXQgc29tZSBvdGhlciB3YXkKPiA+
Pj4gZG8gZml4Cj4gPj4+ID4gPiB3aGF0ZXZlciBpcyBnb2luZyBvbi4KPiA+Pj4gPiA+Cj4gPj4+
ID4gPiBJJ3ZlIGRyb3BwZWQgdGhpcyBmcm9tIGZpeGVzLgo+ID4+PiA+Cj4gPj4+ID4gRG9lcyBp
bmNyZWFzaW5nIENPTU1BTkRfTElORV9TSVpFIGJyZWFrIHVzZXItc3BhY2UgYmluYXJpZXM/IEkg
d291bGQKPiA+Pj4gPiBleHBlY3QgaXQgdG8gd29yayB0aGUgc2FtZSB3YXkgYXMgYWRkaW5nIG5l
dyBlbnVtIHZhbHVlcywgb3IgYWRkaW5nCj4gPj4+ID4gZmllbGRzIGF0IHRoZSBlbmQgb2YgdmVy
c2lvbmVkIHN0cnVjdHMsIGV0Yy4KPiA+Pj4gPiBJIHdvdWxkIGFzc3VtZSB0aGUgb2xkIGJvb3Rs
b2FkZXJzL2V0YyB3aWxsIG9ubHkgc3VwcG9ydCB1cCB0byB0aGUKPiA+Pj4gPiBvbGQsIHNtYWxs
ZXIgbWF4IGNvbW1hbmQgbGluZSBzaXplLCB3aGlsZSB0aGUga2VybmVsIHdpbGwgc3VwcG9ydAo+
ID4+PiA+IGxhcmdlciBjb21tYW5kIGxpbmUgc2l6ZSwgd2hpY2ggaXMgZmluZS4KPiA+Pj4gPiBI
b3dldmVyLCBpZiBzb21ldGhpbmcgY29waWVzIC9wcm9jL2NtZGxpbmUgaW50byBhIGZpeGVkLXNp
emUgYnVmZmVyCj4gPj4+ID4gYW5kIGV4cGVjdHMgdGhhdCB0byB3b3JrLCB0aGF0IHdpbGwgYnJl
YWsuLi4gdGhhdCdzIHF1aXRlIHVuZm9ydHVuYXRlCj4gPj4+ID4gdXNlci1zcGFjZSBjb2RlLi4u
IGlzIGl0IHdoYXQgd2UgYWZyYWlkIG9mPwo+ID4+PiA+Cj4gPj4+ID4gQWx0ZXJuYXRpdmVseSwg
Y291bGQgZXhwb3NlIHRoZSBzYW1lIENPTU1BTkRfTElORV9TSVpFLCBidXQgaW50ZXJuYWxseQo+
ID4+PiA+IHN1cHBvcnQgYSBsYXJnZXIgY29tbWFuZCBsaW5lPwo+ID4+Pgo+ID4+PiBMb29raW5n
IGF0IGtlcm5lbCBjb21taXQgaGlzdG9yeSBJIHNlZSBQb3dlclBDIHN3aXRjaGVkIGZyb20gNTEy
IHRvCj4gPj4+IDIwNDgsIGFuZCBJIGRvbid0IHNlZSBjb21wbGFpbnRzIGFib3V0IHRoZSBBQkkg
b24gdGhlIG1haWxpbmcgbGlzdC4KPiA+Pj4KPiA+Pj4gSWYgQ09NTUFORF9MSU5FX1NJWkUgaXMg
dXNlZCBieSB1c2VyIHNwYWNlIGFwcGxpY2F0aW9ucyBhbmQgd2UKPiA+Pj4gaW5jcmVhc2UgaXQg
dGhlcmUgc2hvdWxkbid0IGJlIHByb2JsZW1zLiBJIHdvdWxkIGV4cGVjdCB0aGluZ3MgdG8KPiA+
Pj4gd29yaywgYnV0IGp1c3QgZ2V0IHRydW5jYXRlZCBib290IGFyZ3M/IFRoYXQgaXMgdGhlIGFw
cGxpY2F0aW9uIHdpbGwKPiA+Pj4gY29udGludWUgb25seSB0byBsb29rIGF0IHRoZSBpbml0aWFs
IDUxMiBjaGFycy4KPiA+Pgo+ID4+ICBUaGUgbWFjcm8gaXMgaW4gYW4gaW5jbHVkZS91YXBpIGhl
YWRlciwgc28gaXQncyBleHBvcnRlZCB0byB0aGUgdXNlcmxhbmQKPiA+PiBhbmQgYSBwYXJ0IG9m
IHRoZSB1c2VyIEFQSS4gIEkgZG9uJ3Qga25vdyB3aGF0IHRoZSBjb25zZXF1ZW5jZXMgYXJlIGZv
cgo+ID4+IHRoZSBSSVNDLVYgcG9ydCBzcGVjaWZpY2FsbHksIGJ1dCBpdCBoYXMgcmFpc2VkIG15
IGF0dGVudGlvbiwgYW5kIEkgdGhpbmsKPiA+PiBpdCBoYXMgdG8gYmUgaW52ZXN0aWdhdGVkLgo+
ID4+Cj4gPj4gIFBlcmhhcHMgaXQncyBPSyB0byBjaGFuZ2UgaXQgYWZ0ZXIgYWxsLCBidXQgeW91
J2QgaGF2ZSB0byBnbyB0aHJvdWdoCj4gPj4ga25vd24vcG90ZW50aWFsIHVzZXJzIG9mIHRoaXMg
bWFjcm8uICBJIGd1ZXNzIHRoZXJlIHNob3VsZG4ndCBiZSB0aGF0Cj4gPj4gbWFueQo+ID4+IG9m
IHRoZW0uCj4gPj4KPiA+PiAgSW4gYW55IGNhc2UgaXQgY2Fubm90IGRlcGVuZCBvbiBLY29uZmln
LCBiZWNhdXNlIHRoZSB1c2VybGFuZCB3b24ndCBoYXZlCj4gPj4gYWNjZXNzIHRvIHRoZSBjb25m
aWd1cmF0aW9uLCBhbmQgdGhlbiBwcmVzdW1hYmx5IHdhbnRzIHRvIGhhbmRsZSBhbnkgYW5kCj4g
Pj4gYWxsLgo+ID4KPiA+IEl0IGtpbmQgb2YgZmVlbHMgdG8gbWUgbGlrZSBDT01NQU5EX0xJTkVf
U0laRSBzaG91bGRuJ3QgaGF2ZSBiZWVuIHBhcnQKPiA+IG9mIHRoZSBVQUJJIHRvIGJlZ2luIHdp
dGguICBJIHNlbnQgYSBwYXRjaCB0byByZW1vdmUgaXQgZnJvbSB0aGUKPiA+IGFzbS1nZW5lcmlj
IFVBQkksIGxldCdzIHNlZSBpZiBhbnlvbmUga25vd3Mgb2YgYSByZWFzb24gaXQgc2hvdWxkIGJl
IFVBQkk6Cj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJjaC8yMDIxMDQy
MzAyNTU0NS4zMTM5NjUtMS1wYWxtZXJAZGFiYmVsdC5jb20vVC8jdQo+Cj4gQXJuZCBzZWVtZWQg
dG8gYWdyZWUgd2l0aCB5b3UgYWJvdXQgcmVtb3ZpbmcgQ09NTUFORF9MSU5FX1NJWkUgZnJvbSB0
aGUKPiBVQUJJLCBhbnkgcHJvZ3Jlc3Mgb24geW91ciBzaWRlPwoKV2FzIHRoaXMgZXZlciBtZXJn
ZWQ/IERvbid0IHNlZSB0aGlzIGV2ZW4gaW4gbGludXgtbmV4dC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
