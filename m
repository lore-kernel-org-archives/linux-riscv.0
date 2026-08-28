Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC5BC61DBD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 05:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rLRtEkj7JF4VDWEFeEGC3Avc2hhG0cv6/PaAhw+1mE=; b=n4r/FjeroUaS/M
	5ymO+SG3YFjIGtusjTeb53UTQD8u7b0T73hTMmI4fRqRdCJvlf3WR3ASqIJdn6pvVxXGw3Csxhfuz
	fmBAqm7OpdLPeaF1Oe5WlnH5fVy3LWybasRg/03W7RRaqwD6t10+8muSX9rk0r/xZaH0D9T/f/sSx
	36PT8iS1icNV5cEMrNtB9+lD1ff8a5CoLGAnItgLH8VXJbb07a/NNaqdYvB6AHr7fKpAXXxukfJQa
	/W07LWKuBZa6WA6hQt6Rh6b/f/e7sGRcM/EZITyu2EaLdhTJr3mCcTT/Nkzvvxm+tyZpdB8Cg9yMT
	Aqb99PCfBJKV5Lg8pBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzoks-000000057f5-3LPz;
	Fri, 28 Aug 2026 05:03:54 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzokq-000000057ek-0tf7
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 05:03:53 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-465e7ba7b4bso220211fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2026 22:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787893431; cv=none;
        d=google.com; s=arc-20260327;
        b=gp9qhzVjcILXEkCOavdCZzcLiVGwRa9EmS2O9uOJ5pwvzy5m7IzHm2kiwD6UBeZSHq
         P8e460isabihkNj7+3hrQWUTaOjH3LHea1QBsNZPt3JJAV+BKyYvBYtKouoCG+kdPvYC
         IfgiK3y9OiGXJNjyM9mRr24IHsvbFvxrfzXG3Z72xWPTX5+5kE7eH/wiNpyrDPvmoiw9
         xYp3vj44HAv0PT9Uz2qvQ7+GBpIRq0yzNbIZaRnUqnYb0leTPLhhWA5/KsaClXcuFyVf
         TjUaJtRdj6zEL1T0YhiU4P9owsoZpqaf87ufGm47bVtx19Ib8xE1MxMbjWjmpLHDq/0r
         xiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uKashRpSnYUPFliUTGy88kOqZjp7nFwTVxTCMKxmJHY=;
        fh=hcOEBUjekJi774ZHkc5pT81GzpE1PyIDxnsKxNGq1cE=;
        b=gA1QZECgtcJxRQCcYWWHR6Yvnf2aEKrccs/4PZqKa1t0fRYQl0mu9ks9841ZjlRaBT
         dJS+38LiR874Hqi1Irsnfd2YfG/lAz2mujKIQLCrai56HYmw0FodGEU4fVATitMkSmgC
         HUJ0WxRbzNP31XVuiV/+65x+Lre/1lLc0h3cpjTW+aGzbb1/wg5bdDNXfxXreJ8LCnYb
         EJt0QtvlpFPPZYp5JwOuF1hO2voZsLqSsOIgJgDvVvndjJJRQjHckBeYQJMuM9D+hY9V
         gDmtJwZApOpfG5cuywHkSrEFi41FJjr8f4bZF7J857JA+LpXxlpgFhRN7B7N53IWqhdE
         2SWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787893431; x=1788498231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uKashRpSnYUPFliUTGy88kOqZjp7nFwTVxTCMKxmJHY=;
        b=L5GFK86vFeUc2hiGXmxyGLwUrXKILo01YCsr97mwPW8oT1EWu0Y6y77OVEzkavfoCD
         PsMtWk7FNDj5aDsOXw7h6p1BrReCpI/DLv1l8bklbVzXcuqMsYpZD0VH0D4t9oSrZpNB
         UfdbtjF3W4jHKq0RhSBCzbKWXuSW/ODFvcIPXgX13bWBigIKKFnfl1U+b5iPkOeobP5w
         pyNHnZFzwnJVPLvscYi1IWQsmCjtQvUL2QpjwcTjZcR0/MNH0qVO/MaLxbo0cLztsmJ7
         YXHPbDbcSz9VA099bcnQxB7n3vIGT3/xXJfuKE+nda17ReRAFpMtj1tImF9zQXYmlLL3
         2N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893431; x=1788498231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uKashRpSnYUPFliUTGy88kOqZjp7nFwTVxTCMKxmJHY=;
        b=cJcK7qjeqNYDFrL+mfsZE77eEHmk92UgPHRDgJ+TxuKk9by/PH7yhecVvKklB1VKyn
         LB/xYowPrqnDBByoGwyAAAxrrqypEVHntCM385PCsklW4KCZTX1AfSmESwcHxiHG7ymw
         t5oYE8TmFxWzhsxgYDYGOtbflgMcX5UxnUNIBUCphoW88W9zIbUT90WvGog002lZwEik
         OtwIEygGKmSQCzrEBARUINAkwCkg/BAlqQJ8qtF6L8iPxGxXX51E0RWpkwyDIDvUT6nm
         MErjB5cngitnKPsKwApBnqVkvDYr2mwbm2PWoTdQui3lYXAHK9jZNibUw6b5C3bju++L
         yFmw==
X-Forwarded-Encrypted: i=1; AHgh+RpTyhntOZCsPs/5/41kbZtHnfv4KaxgukjTGnhNobfT/I3DCJ3JaiQVxzRUDIGzqQR7B2xLRYuvouV8FQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lY+ZTu68zR3dO8OrPXKATES4DwC3c+GydPY9bKGYPm1nUVxc+b
	pqkynYSXaprHs60p52rD5g2P4tSpJHOVej4eKbXSrjTXM1LY3MmNSyb/3no+V5TMRnPUEaCMkaG
	IG/HpuWv/tMW3mXkXgn0w96Gv8wFqNovRDc3I3CWuOA==
X-Gm-Gg: AR+sD10AWmV2U2PGiKPezVpRZ2JgfgHyB8+XlBsCI0OkoUtLsx+IqWXOXxQt+SafrlZ
	Rgsc4pVoiqfjj4v7hSjCo2YJpEgENGXfMEje3fMri5nXn0pjLHopyDyl2PXPPGxnIdHWnk9ogZH
	rr82uE5huYr8af16fEARwqEl8byt2P3uQRQ/PykyPLQtI4BC0JeOWRigRZEOR9ELDKFD/VgqJzT
	VhAmpVqLNJNdMTlVmC7aUBDoqYbQT7AUSxVZ3sqDcdG9V4YZBEwlWUJ8fnnTvWQ1KacMXJ5ViIj
	jiPYySselZdtQRJv+yLar/JP+Q75n58CCoH0Tn2WsF+Aod4=
X-Received: by 2002:a05:6870:c182:b0:45e:d529:40cc with SMTP id
 586e51a60fabf-46837ac2325mr5098714fac.18.1787893429367; Thu, 27 Aug 2026
 22:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAJh9TS+k9P7bpa5gW+XV_da6JvA6TOGFJEdmsEmAULNAiZTBaQ@mail.gmail.com>
In-Reply-To: <CAJh9TS+k9P7bpa5gW+XV_da6JvA6TOGFJEdmsEmAULNAiZTBaQ@mail.gmail.com>
From: Jimmy Ho <jimmy.ho@sifive.com>
Date: Fri, 28 Aug 2026 13:03:35 +0800
X-Gm-Features: AcwNN1XOLDIsCYXyapO8M1FJULUnlNzkdGOpqC8ZHsYtuHzqK9OR7sVUK57JHys
Message-ID: <CAJh9TSJWr8eLG=9_UjwdOqwUqfsCxaAJb8NUUJ9NKjnmPcLSPA@mail.gmail.com>
Subject: Re: RISC-V genpd race in OSI mode (genpd domain power_off vs firmware
 suspend call)
To: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, rafael@kernel.org, daniel.lezcano@linaro.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
	ulfh@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220352_274863_710455B7 
X-CRM114-Status: GOOD (  30.12  )
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

UmVzZW5kaW5nIHRoaXMgZm9sbG93LXVwIHRvIFVsZuKAmXMgY3VycmVudCBhZGRyZXNzCgpPbiBG
cmksIEF1ZyAyOCwgMjAyNiBhdCAxMjo1NuKAr1BNIEppbW15IEhvIDxqaW1teS5ob0BzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IEhpIGxpbnV4LXBtLAo+Cj4gV2UgaGl0IGEgcmFjZSBjb25kaXRpb24g
aW52b2x2aW5nIGdlbnBkJ3MgQ1BVIFBNIGRvbWFpbiAoT1NJLW1vZGUKPiBoaWVyYXJjaGljYWwg
Y3B1aWRsZSwgc2ltaWxhciB0byB0aGUgQVJNIFBTQ0kgT1NJIG1vZGVsKSBvbiBhIFJJU0MtVgo+
IHBsYXRmb3JtLCBhbmQgd291bGQgbGlrZSB0byBnZXQgeW91ciBvcGluaW9uIG9uIHdoZXRoZXIg
dGhpcyBpcyBhCj4gZ2VucGQtbGV2ZWwgaXNzdWUgYW5kIHdoYXQgdGhlIHByZWZlcnJlZCBnZW5l
cmljIGZpeCB3b3VsZCBsb29rIGxpa2UuCj4KPiBCYWNrZ3JvdW5kCj4gLS0tLS0tLS0tLQo+IE9i
c2VydmVkIHRoaXMgaXNzdWUgb24gcWVtdSBwbGF0Zm9ybQo+IE9uIG91ciBTb0MsIGRyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jIHJlZ2lzdGVycyBhIGdlbnBkCj4gbm90aWZp
ZXIgdG8gc2F2ZS9yZXN0b3JlIHRoZSBTLW1vZGUgQVBMSUMgY29udGV4dDoKPgo+ICAgYXBsaWNf
bm90aWZpZXIoKQo+ICAgICBHRU5QRF9OT1RJRllfUFJFX09GRiAtPiBhcGxpY19zYXZlKCkKPiAg
ICAgR0VOUERfTk9USUZZX09OICAgICAgLT4gYXBsaWNfcmVzdG9yZSgpCj4KPiBDUFVzIGFyZSBh
dHRhY2hlZCB0byB0aGlzIGdlbnBkIHZpYSBkdF9pZGxlX2F0dGFjaF9jcHUoKSAoYXMgaW4KPiBk
cml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYywgbWlycm9yaW5nIGNwdWlkbGUtcHNj
aS5jKS4gV2hlbgo+IHRoZSBsYXN0IENQVSBpbiB0aGUgZG9tYWluIGdvZXMgaWRsZSwgZ2VucGRf
cG93ZXJfb2ZmKCkgZGVjaWRlcyB0aGUKPiBkb21haW4gY2FuIGJlIHR1cm5lZCBvZmYgKGJhc2Vk
IG9uIHRoZSAibm90X3N1c3BlbmRlZCIgY291bnQgY29tcHV0ZWQKPiB1bmRlciBnZW5wZF9sb2Nr
KS4gV2hlbiB0aGUgZmlyc3QgQ1BVCj4gcmVzdW1lcywgZ2VucGRfcG93ZXJfb24oKSBkZWNpZGVz
IHRvIHR1cm4gdGhlIGRvbWFpbiBiYWNrIG9uIGFuZCBmaXJlcwo+IEdFTlBEX05PVElGWV9PTiwg
d2hpY2ggdHJpZ2dlcnMgYXBsaWNfcmVzdG9yZSgpLgo+Cj4gSG93ZXZlciwgdGhlIGFjdHVhbCBT
QkkgSFNNIHN1c3BlbmQgY2FsbCAocmlzY3Zfc2JpX2hhcnRfc3VzcGVuZCgpLAo+IHNpbWlsYXIg
dG8gYSBQU0NJIENQVV9TVVNQRU5EIGNhbGwpIGlzICpub3QqIGlzc3VlZCBpbnNpZGUKPiBnZW5w
ZF9sb2NrLiBnZW5wZCdzIHBvd2VyX29mZigpIGNhbGxiYWNrIG9ubHkgcmVjb3JkcyB3aGljaCBk
b21haW4KPiBpZGxlIHN0YXRlIHdhcyBzZWxlY3RlZDsgdGhlIHJlYWwgZmlybXdhcmUgc3VzcGVu
ZCBjYWxsIGhhcHBlbnMgbGF0ZXIsCj4gYXN5bmNocm9ub3VzbHksIG9uIGVhY2ggQ1BVJ3Mgb3du
IGNwdWlkbGUgZW50ZXIgcGF0aAo+IChfX3NiaV9lbnRlcl9kb21haW5faWRsZV9zdGF0ZSgpKS4K
Pgo+IFRoZSByYWNlCj4gLS0tLS0tLS0KPiBCZWNhdXNlIG9mIHRoaXMgZ2FwIGJldHdlZW4gImdl
bnBkJ3Mgc29mdHdhcmUgZGVjaXNpb24gdGhhdCB0aGlzIENQVQo+IGlzIGxhc3QtbWFuIC8gZmly
c3QtbWFuIiBhbmQgInRoZSBDUFUgYWN0dWFsbHkgaXNzdWluZyB0aGUgZmlybXdhcmUKPiBzdXNw
ZW5kL3Jlc3VtZSBjYWxsIiwgd2Ugb2JzZXJ2ZWQgdGhlIGZvbGxvd2luZyBzZXF1ZW5jZQo+Cj4g
MS4gQ1BVMCByZXF1ZXN0cyBhIHN5c3RlbSBkb21haW4tbGV2ZWwgcG93ZXItZ2F0ZSAoZGVlcCBz
bGVlcCwgdGVhcnMgZG93biB0aGUKPiAgICBzaGFyZWQgUy1tb2RlIEFQTElDIGNvbnRleHQpIGFu
ZCBoYW5kcyBvZmYgdG8gZmlybXdhcmUuCj4gMi4gQmVmb3JlIENQVTAncyByZXF1ZXN0IGlzIHBo
eXNpY2FsbHkgY29tcGxldGVkLCBDUFUxIHdha2VzIHVwLAo+ICAgIGdlbnBkX3Bvd2VyX29uKCkg
cnVucywgR0VOUERfTk9USUZZX09OIGZpcmVzLCBhcGxpY19yZXN0b3JlKCkgcnVucy4KPiAzLiBD
UFUxIGdvZXMgaWRsZSBhZ2FpbiwgYnV0IHRoaXMgdGltZSBzeXN0ZW0gZG9tYWluLWxldmVsIGdl
bnBkIHJlamVjdAo+ICAgIHJlcXVlc3QsIHNvIGl0IGZhbGxiYWNrIHRvIGNvcmUgbGV2ZWwgcG93
ZXItZ2F0ZQo+IDQuIENQVTAncyBvcmlnaW5hbCBzeXN0ZW0gZGVlcCBwb3dlci1nYXRlIHJlcXVl
c3QgZXZlbnR1YWxseSBjb21wbGV0ZXMgYXQgdGhlCj4gICAgZmlybXdhcmUgbGV2ZWwgLS0gcGh5
c2ljYWxseSBjb2xsYXBzaW5nIHRoZSBzeXN0ZW0gZG9tYWluLCBpbmNsdWRpbmcgdGhlCj4gICAg
Uy1tb2RlIEFQTElDIGNvbnRleHQsIHNhdmVkIGVhcmxpZXIgYnkgYXBsaWNfc2F2ZSgpCj4gNS4g
Q1BVMCB3YWtlcyB1cCAoZS5nLiBVQVJUIGludGVycnVwdCksIGVudGVycyBMaW51eCwgYnV0IHN5
c3RlbSBnZW5wZCdzCj4gICAgc29mdHdhcmUgc3RhdGUgc3RpbGwgc2F5cyB0aGUgZG9tYWluIGlz
ICJvbiIgKGZyb20gc3RlcCAyKSwgc28gc3lzdGVtIGRvbWFpbgo+ICAgIEdFTlBEX05PVElGWV9P
TiB3aWxsIG5vdCBiZSBmaXJlZCBhZ2FpbiBhbmQgYXBsaWNfcmVzdG9yZSgpIHdpbGwgbm90IGJl
Cj4gICAgY2FsbGVkCj4KPiBUaGlzIGxvb2tzIHN0cnVjdHVyYWxseSBpZGVudGljYWwgdG8gdGhl
IHJhY2UgVEYtQSdzIFBTQ0kgT1MtaW5pdGlhdGVkCj4gbW9kZSBkb2N1bWVudGF0aW9uIGRlc2Ny
aWJlczoKPiBodHRwczovL3RydXN0ZWRmaXJtd2FyZS1hLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVz
dC9kZXNpZ25fZG9jdW1lbnRzL3BzY2lfb3NpX21vZGUuaHRtbCNyYWNlcy1pbi1vcy1pbml0aWF0
ZWQtbW9kZQo+Cj4KPiAgICJJbiBPUy1pbml0aWF0ZWQgbW9kZSwgdGhlcmUgYXJlIHJhY2Ugd2lu
ZG93cyB3aGVyZSB0aGUgT1MncyB2aWV3Cj4gICBhbmQgaW1wbGVtZW50YXRpb24ncyB2aWV3IG9m
IHRoZSBzeXN0ZW0ncyBzdGF0ZSBkaWZmZXIuLi4gdGhlIE9TCj4gICBtaWdodCByZXF1ZXN0IGEg
cG93ZXJkb3duIHN0YXRlIGZvciBhIG5vZGUgZnJvbSBvbmUgY29yZSwgd2hpbGUgYXQKPiAgIHRo
ZSBzYW1lIHRpbWUsIHRoZSBpbXBsZW1lbnRhdGlvbiBvYnNlcnZlcyB0aGF0IGFub3RoZXIgY29y
ZSBpbgo+ICAgdGhhdCBub2RlIGlzIHBvd2VyaW5nIHVwLiIKPgo+IFRGLUEncyBhbnN3ZXIgaXMg
dG8gcmVxdWlyZSB0aGUgT1MgdG8gZW5jb2RlIGEgImxhc3RfYXRfcHdybHZsIiBmaWVsZAo+IGlu
dG8gdGhlIFN0YXRlSUQgcGFzc2VkIHRvIENQVV9TVVNQRU5ELCB3aGljaCBmaXJtd2FyZSB2YWxp
ZGF0ZXMKPiBhZ2FpbnN0IGl0cyBvd24gdmlldyBvZiBzeXN0ZW0gc3RhdGUgYmVmb3JlIGhvbm9y
aW5nIGEgcG93ZXJkb3duCj4gcmVxdWVzdC4gV2UgY291bGQgbm90IGZpbmQgYW55IGNvZGUgaW4g
Y3VycmVudCBtYWlubGluZSBMaW51eAo+IChjcHVpZGxlLXBzY2kuYyBvciBnZW5lcmljIGNwdWlk
bGUvZ2VucGQgY29kZSkgdGhhdCBhY3R1YWxseSBjb21wdXRlcwo+IGFuZCBlbmNvZGVzIHRoaXMg
ZmllbGQgZHluYW1pY2FsbHkgcGVyIHN1c3BlbmQgY2FsbCwgc28gYXMgZmFyIGFzIHdlCj4gY2Fu
IHRlbGwgdGhpcyByYWNlIGlzIHVuaGFuZGxlZCBnZW5lcmljYWxseSB0b2RheSwgb24gYm90aCBh
cm0vcHNjaQo+IGFuZCByaXNjdi9zYmkgYmFja2VuZHMuCj4KPiBPcHRpb25zIHdlIGNvbnNpZGVy
ZWQKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gMS4gSW1wbGVtZW50IHNvbWV0aGluZyBsaWtl
IFBTQ0kncyBsYXN0X2F0X3B3cmx2bCBnZW5lcmljYWxseTogZXhwb3NlCj4gICAgZ2VucGQncyBh
bHJlYWR5LWNvbXB1dGVkICJhbSBJIHRoZSBsYXN0IENQVSBpbiB0aGlzIGRvbWFpbiIKPiAgICBp
bmZvcm1hdGlvbiB0aHJvdWdoIHRoZSBwb3dlcl9vZmYoKSBjYWxsYmFjayBBUEksIHNvCj4gICAg
YmFja2VuZHMgY2FuIHBhc3MgaXQgZG93biB0byBmaXJtd2FyZSwgYW5kIGhhdmUgZmlybXdhcmUg
dmFsaWRhdGUvCj4gICAgcmVqZWN0IHN0YWxlIHJlcXVlc3RzLgo+ICAgIC0gUHJvOiBtYXRjaGVz
IHRoZSBkb2N1bWVudGVkIFBTQ0kgT1NJIGFwcHJvYWNoLgo+ICAgIC0gQ29uOiBXZSBkb24ndCBr
bm93IGhvdyB0byBzZXQgdGhpcyBmbGFnIHByb3Blcmx5IGluIGEgZ2VuZXJpYyB3YXkuCj4gICAg
ICBsYXN0X2F0X3B3cmx2bCBpcyBvbmx5IG1lYW5pbmdmdWwgb24gcmlzY3YvYXJtLCBzbyB3ZSBj
YW4ndCBqdXN0Cj4gICAgICBhZGQgaXQgdG8gZ2VucGQncyBnZW5lcmljIGNvZGUgcGF0aC4gZ2Vu
cGQgYWxzbyBkb2Vzbid0IGtlZXAgYQo+ICAgICAgY291bnRlciBvZiBob3cgbWFueSBDUFVzIGlu
IGEgZG9tYWluIGFyZSBzdGlsbCBhbGl2ZSwgc28gdGhlcmUncwo+ICAgICAgbm8gZXhpc3Rpbmcg
c3RhdGUgaW4gZ2VucGQncyBwb3dlcl9vZmYoKSBjYWxsYmFjayB3ZSBjb3VsZCByZWFkCj4gICAg
ICB0byBkZXJpdmUgdGhlIGZsYWcuIE9uZSBpZGVhIHdvdWxkIGJlIHRvIHdhbGsgdGhlIGdlbnBk
IGhpZXJhcmNoeQo+ICAgICAgZnJvbSB3aXRoaW4gdGhlIHBvd2VyX29mZigpIGNhbGxiYWNrIGFu
ZCBjaGVjayB0aGUgcnVudGltZV9zdGF0dXMKPiAgICAgIG9mIGVhY2ggQ1BVIGRldmljZSBpbiB0
aGUgc2FtZSBkb21haW4gKGdlbnBkIGRvbWFpbnMgYWxyZWFkeSBjYXJyeQo+ICAgICAgYSBDUFUg
bWFzaywgYW5kIGdldF9jcHVfZGV2aWNlKCkgY2FuIGJlIHVzZWQgdG8gbG9vayB1cCB0aGUKPiAg
ICAgIGNvcnJlc3BvbmRpbmcgQ1BVIGRldmljZSkKPgo+IDIuIERvIHRoZSBwb3dlci1kb21haW4g
Y29udHJvbCBkaXJlY3RseSBmcm9tIHRoZSBwb3dlcl9vZmYoKS9wb3dlcl9vbigpCj4gICAgZ2Vu
cGQgY2FsbGJhY2tzIChlLmcuIGhhdmUgdGhlbSBwb2tlIHRoZSBTb0MncyBwb3dlciBjb250cm9s
bGVyCj4gICAgcmVnaXN0ZXJzIHZpYSBhbiBTQkkgY2FsbCwgaW5zdGVhZCBvZiByZWx5aW5nIG9u
IGVhY2ggQ1BVJ3Mgb3duCj4gICAgaWRsZS1lbnRyeSBwYXRoIHRvIHRyaWdnZXIgdGhlIGRlZXBl
c3Qgc3RhdGUpLgo+ICAgIGl0IGNyZWF0ZXMgdHdvIGluZGVwZW5kZW50IGRyaXZlciB0aGF0IHdp
bGwgdG91Y2ggcG93ZXIgY29udHJvbGxlcgo+ICAgIChvcGVuc2JpIHZzIGxpbnV4KQo+Cj4gMy4g
SGF2ZSBlYWNoIENQVSBwYXNzIGEgbW9ub3RvbmljYWxseSBpbmNyZWFzaW5nIHNlcXVlbmNlIG51
bWJlcgo+ICAgIGFsb25nc2lkZSBpdHMgc3VzcGVuZCByZXF1ZXN0IHRvIGZpcm13YXJlLCBhbmQg
aGF2ZSBmaXJtd2FyZQo+ICAgIGl0c2VsZiBkZXRlY3QgYW5kIHJlamVjdC9kb3duZ3JhZGUgYSBk
ZWVwIHBvd2VyLWRvd24gcmVxdWVzdCBpZiBhCj4gICAgKm5ld2VyKiBzZXF1ZW5jZSBudW1iZXIg
ZnJvbSBhIHNoYWxsb3dlciAoaS5lLiAic29tZSBDUFUgYmVjYW1lCj4gICAgYWN0aXZlIGFnYWlu
IikgcmVxdWVzdCBoYXMgYmVlbiBvYnNlcnZlZCBmb3IgdGhlIHNhbWUgZG9tYWluIHNpbmNlLgo+
ICAgIFRoaXMgaXMgYSBmaXJtd2FyZS1zaWRlIHN0YWxlbmVzcyBjaGVjaywgZW50aXJlbHkgYmVs
b3cgdGhlIFNCSQo+ICAgIGNhbGwgYm91bmRhcnkKPiAgICB0aGlzIHNlcSBudW1iZXIgY2FuIGJl
IG1haW50YWluZWQgaW4gZ2VuZHBkIGdlbmVyaWMgY29kZQo+ICAgIG9yIHJpc2N2IHBvd2VyX29m
ZigpIGNhbGxiYWNrLCB3aGVyZSBkbyB5b3Ugc3VnZ2VzdCB0aGlzIHRvIGJlCj4gICAgYWRkZWQ/
Cj4KPiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiB0byBzb2x2aW5nIHRoaXMgaXNzdWU/Cj4g
VGhhbmtzLAo+IEppbW15IEhvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
