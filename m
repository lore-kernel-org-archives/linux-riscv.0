Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AA3606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ckDuMmz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=IOhal8xJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vbKuYqYsbCCO/9O6hgxmALlpIRPxbhWhGUel7B2nPtY=; b=2ckDuMmzsJ5P6wVnTQcoal2BI4
	Vz3Ok0ew+FwvjKW3GtRZ6Hh4mILV99qRiKa5Hu+xyVODNGjbcRL0gRbap0KXMGxF+NH4wtuPlLdpr
	gJHTIEmBQ/P0i/8haDoBYrPAHhfIyo582NhLUlnUxPO/oxj2oe5ZbqsyFoAIyiZlX91QFlTElpiei
	qgCVMq8VCsJlniJjJlyOKuQ3IriZGFJ6Ze6/lK8Z97zn6r1RN8Zl/KdvGzd+VkPYXwx2axFFbmoxp
	Sq1nahGRf2Sn6xPSiLVc6loJU0z1WMihYvL8I39JEyQ8KteFFM07ufUVqBNNYD0UCmLAUOc3A1ro9
	Mk1o/2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5u1-00000008Ugo-04r3;
	Wed, 25 Nov 2026 05:50:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tw-00000008Ucq-3kq3
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:50:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so50560415e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585839; cv=none;
        d=google.com; s=arc-20260327;
        b=p6KPu9s2EW2zhgWIn2it4dr1WVQZbc3IGl9SRSrwQ3O42cjNIyNUgEAaY5FpcHrn15
         Pv3s32ndIGSy5hyYwL4HoL26Nlog9U7NVDjxZe1cZzeii3Twvl69Xn4vCfsXW9Ni90+Z
         lLg4/l0Unj9ynJbBMB2XaXTFOaym9FijKndQ0ZZgTG9SJ/G6/dM20UKDlaMW6GQ+t0nd
         N8jax2rXfx86zuV/1EYwEbddBNoFTuDg8qOxjLYiU1zGKcCXvOTUrbMhA7+nBQm2L9X5
         a4mrKK5pTLR8l3Ws4WbOZaAFHpr3Mp9YDYhY/qfu2wwWgWiK856zSDKNdYnS1eiVCPg4
         YGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/ey3VoMnoIASJUisM8PXIjosjBIaHmMcX0osRpbhk3U=;
        fh=JfY1BBR6OGNLutWZ67lQk4NzpTfZ3EvWw2zermIqGYU=;
        b=ru6J98A6Wcm5Q3Ky/tPLT/Ay9pzSsQ5JrdtGGB8eqwYQIsBaCtM+o0o41ED5FFKKbv
         5wih+HONMM+CT30sZAYgXg0yT5pPubAZgVAAKtauuwFheGvdWj8nU7PL31tv29Gw+O+a
         nilFUPdPY04QP5ogcmuqRYK2Hc2YdLZi2PNnrQuTxbksqSVOvz4SIuDgQrW10Dx1aTBC
         dSzbJ/t0KQtMXavbFbGSKI1j3e9YFI+EsQBD2xYtprHAnyfrTJxgJjDwAj0UfGvVDul+
         yQP1pw1i9be5VKPkHaYxz2a7G0qXe1cIJZPZyflLVIsHEG8AzuLSq5hjgWnZkeeY9EuM
         95eA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585839; x=1796190639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ey3VoMnoIASJUisM8PXIjosjBIaHmMcX0osRpbhk3U=;
        b=IOhal8xJguzQ9zkq0SLHRHdvzPVDFcMf3bORlMOIiT97VjUQJIdvJ90NHukr6rme2N
         p4SZ46EDtWgtVwRmn4cocydFquctQUzQWr0jUT39SyQrnw6eHhIhW0ckHfhPyVLK4i0M
         yk4cABvv8DNVFJWgi6j3qXfFNSmgBMI0MEbiwaGASotfPZytHsFftDhgT91XcZQQcsj1
         rN0nHw+r0GwB2SmUXCcysQCm7uQ6isV9J8AHWTbylqVDx2d2WpAn95zimD8Xan84B7ne
         O0pMnA9g37AMaTHw30jUvvxO8aDg3kp5HqdD82YTV1KDE8CsgcEVc7HrMWw96YmT3vR+
         Wyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585839; x=1796190639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ey3VoMnoIASJUisM8PXIjosjBIaHmMcX0osRpbhk3U=;
        b=01JJSTDVf9qg9w2yLJhjx0vFKqhos6U0BFqpNF/i7ANihMEsAQpzYGMNQRYRLcOrea
         XqMF1AtpHFfly5K7ekmEkENX88eh854BOGrUMyJ8ZvImrmLV3n1EnMe3S+oQJHhHDuBl
         Sa8gK2j3nP5f6YYMN78+ncOM1z+6cgRnpTQvuua3TVXHHIHv2Dh52ZXzW43Gt82yfoNe
         zkp62gDIZfkvEPYw7ZInVFYEuw47yXi4vvqVd0+1oaOwf+hEBfH4s5rmBrBpyA5APy0E
         lGsEOCPVUAsG4+oV3MTzTt8g4keYt/FJyPbA8oBcqWZ9idSk9Voaq+wMeHh2RRukE0mC
         s88w==
X-Forwarded-Encrypted: i=1; AL+hErHpuFe+L2BNBC9ZauCiKpFyjo6Gj6NjvvDy3SdibNGGAhiIHQeh8j8ojqjEUONmzBCWWinsYOnttU6BWg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8vUdPxejPBxbf1W/rPLTtVh4YlVdoxu5wT8+LH++jutITopJvc
	BVsIG3i5BqFs8MHlgvs5UT+Os7sO52PHWr/cBB1XY81eBy5KUhCioqpxLdJ4ZSQXQlkHVyoRRLC
	WoUITRYbzNzPmFxz9I7GU8d4XTK0GdHKgvIk0JUZNjRZOiraRkqy6
X-Gm-Gg: AZFdTZcOWNalq9oYCXQraIwxIEPlVcxM27klQI629sCYICMbMfjuFHy4Iz3BnMPnRmL
	sIwS0r7t2luN97s+W1/XzorkuqUfSgkRMJAd74aN6ioJSZxiW2IPvTITGf59p58bbK6wVXB7Dgh
	GZBV/ns3NkZfEXxpGwH2LlvXOTCUJMepAP8NbZJVhABOt5CTCvcX53Cf/f2m8yPaa2DIBjXbwt+
	DM1+Jv5MPnU+THdANmSINQlW44a/Zzd7n6SgfiDl0cvcLBkEQWUsb4nNcj9NxoqMbKabycHQ72h
	9Kd5O8DXAc/c8tOE/n0J/lPVm6sHXsRxN+fkSukigGygTOCROaEJeWqmdNcFV/shVDOMwpD2Xa+
	ScLKTsPoCKuQP/matErr9zAqSdhmJaDXRVDSqv1yNlsT3EYhjWssQHc1K3RWlPruHhFw88pXtHZ
	Jh7T9iPXSvlsZjQKU4M0VbbFmxQdlvCxKrpOCM/4nn29tPKgezsh5vRJCq8JdiMf2yRvUJHIJc2
	Dox
X-Received: by 2002:a05:600c:46cc:b0:4bb:69b3:2b42 with SMTP id
 5b1f17b1804b1-4bb888277b3mr355988315e9.16.1795585838954; Tue, 24 Nov 2026
 21:50:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:20:26 +0530
X-Gm-Features: Aa3M54qb1blyKaEVtKNBi5ctu8cJHJ3FLqTUOGiPqQSapaUrHW7z2azgq7gQGnk
Message-ID: <CAAhSdy2BkWEY3+FDpcLwFtrP+03GSfJHCmsCmu5513M8AMyPpg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] KVM: riscv: Age G-stage PTEs locklessly
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_215040_981037_57CF6DDD 
X-CRM114-Status: GOOD (  21.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWdpbmcgRy1zdGFnZSBQVEVzIGN1cnJlbnRseSBydW5z
IHdpdGggbW11X2xvY2sgaGVsZCBmb3Igd3JpdGUsIHRha2VuCj4gYnkgdGhlIGNvbW1vbiBNTVUg
bm90aWZpZXIgY29kZS4gV2hlbiBNR0xSVSBvciBrc3dhcGQgYWdlcyBhIGxhcmdlCj4gcmFuZ2Us
IGV2ZXJ5IHZDUFUgdGFraW5nIGEgRy1zdGFnZSBmYXVsdCBibG9ja3Mgb24gdGhlIGxvY2ssIGFu
ZCB0aGUKPiBkaXJ0eS1sb2dnaW5nIHJlYWQtc2lkZSBmYXN0IHBhdGggYmxvY2tzIGJlaGluZCBh
Z2luZyBhcyB3ZWxsLgo+Cj4gVGhpcyBzZXJpZXMgbGV0cyBSSVNDLVYgc2VsZWN0IEtWTV9NTVVf
TE9DS0xFU1NfQUdJTkcsIHNvIEctc3RhZ2UKPiBhZ2luZyBjYW4gcnVuIHdpdGhvdXQgbW11X2xv
Y2sgd2hpbGUgcHJvdGVjdGluZyBwYWdlLXRhYmxlIHdhbGtzIHdpdGgKPiBSQ1UuCj4KPiAgIDEu
IEFnZSBhbGwgRy1zdGFnZSBQVEVzIGluIGEgR0ZOIHJhbmdlCj4gICAgICBCdWcgZml4LCBwb3N0
ZWQgc2VwYXJhdGVseSBbMV0gYW5kIGluY2x1ZGVkIHVuY2hhbmdlZCBzbyB0aGUKPiAgICAgIHNl
cmllcyBhcHBsaWVzIG9uIHJpc2N2X2t2bV9xdWV1ZS4gRHJvcCBpdCBpZiBhbHJlYWR5IGFwcGxp
ZWQuCj4KPiAgIDIuIFJlYWQgRy1zdGFnZSBQVEVzIG9uY2Ugd2hlbiB3YWxraW5nIHBhZ2UgdGFi
bGVzCj4gICAgICBBIGxvY2tsZXNzIHdhbGtlciBtdXN0IGRlcml2ZSBwcmVzZW5jZSwgbGVhZi1u
ZXNzIGFuZCB0aGUgY2hpbGQKPiAgICAgIGFkZHJlc3MgZnJvbSBhIHNpbmdsZSBzbmFwc2hvdCBv
ZiBlYWNoIGVudHJ5Lgo+Cj4gICAzLiBXcml0ZS1wcm90ZWN0IEctc3RhZ2UgUFRFcyBhdG9taWNh
bGx5Cj4gICAgICBBZ2luZyB3aWxsIGNsZWFyIHRoZSBBY2Nlc3NlZCBiaXQgd2l0aG91dCBtbXVf
bG9jazsgdGhlIHBsYWluCj4gICAgICByZWFkLW1vZGlmeS13cml0ZSBpbiBHU1RBR0VfT1BfV1Ag
Y291bGQgY2xvYmJlciB0aGF0IHVwZGF0ZS4KPgo+ICAgNC4gRnJlZSBHLXN0YWdlIHBhZ2UgdGFi
bGVzIGFmdGVyIGFuIFJDVSBncmFjZSBwZXJpb2QKPiAgICAgIFRhYmxlIHBhZ2VzIGFuZCB0aGUg
cm9vdCBvdXRsaXZlIGFueSBSQ1UgcmVhZGVyLiBSb290IHRlYXJkb3duCj4gICAgICBrZWVwcyBw
Z2RfbGV2ZWxzIGludGFjdCBzbyBhIHdhbGtlciBob2xkaW5nIHRoZSBvbGQgcm9vdCBzZWVzCj4g
ICAgICBjb25zaXN0ZW50IG1ldGFkYXRhLgo+Cj4gICA1LiBBZ2UgRy1zdGFnZSBQVEVzIGxvY2ts
ZXNzbHkKPiAgICAgIFNlbGVjdCBLVk1fTU1VX0xPQ0tMRVNTX0FHSU5HIGFuZCB3YWxrIHVuZGVy
IHJjdV9yZWFkX2xvY2soKS4KPgo+IFRoaXMgYnVpbGRzIG9uIEppbnl1IFRhbmcncyByd2xvY2sg
YW5kIGNtcHhjaGcgaGVscGVycyBhbHJlYWR5IGluCj4gcmlzY3Zfa3ZtX3F1ZXVlLiBXYW5nIFll
Y2hhbydzIGh1Z2UgcGFnZSByZWNvdmVyeSBzZXJpZXMgWzJdIGFkZHMgYQo+IHNlY29uZCBwYWdl
LXRhYmxlIGZyZWUgc2l0ZSBpbiBrdm1fcmlzY3ZfZ3N0YWdlX3JlY292ZXJfaHVnZSgpOwo+IHdo
aWNoZXZlciBsYW5kcyBzZWNvbmQgd2lsbCBuZWVkIHRvIHN3aXRjaCB0aGF0IHB1dF9wYWdlKCkg
dG8KPiBnc3RhZ2VfZnJlZV9wYWdlX3RhYmxlKCkuIEkgY2FuIHJlYmFzZSB0aGUgc2VyaWVzIGFz
IG5lZWRlZC4KPgo+IEEgcG9zc2libGUgZm9sbG93LXVwIGlzIHRvIHJ1biBjbGVhci1kaXJ0eS1s
b2cgYW5kIHRoZSBnZW5lcmFsIGZhdWx0Cj4gcGF0aCB1bmRlciB0aGUgcmVhZCBzaWRlIG9mIG1t
dV9sb2NrLCBhcyBhcm02NCBhbmQgeDg2IGRvLiBQYXRjaCAzCj4gcHJvdmlkZXMgdGhlIGF0b21p
YyB3cml0ZS1wcm90ZWN0aW9uIG5lZWRlZCBmb3IgdGhlIGZvcm1lci4KPgo+IFRlc3RpbmcKPiAt
LS0tLS0tCj4gUUVNVSB2aXJ0LCAtY3B1IHJ2NjQsaD10cnVlIChTdmFkdSksIDQgdkNQVXMsIFRD
Ry4gVGhlIGhvc3Qga2VybmVsCj4gd2FzIGJ1aWx0IHdpdGggS0FTQU4sIFBST1ZFX0xPQ0tJTkcs
IFBST1ZFX1JDVSwgTE9DS19TVEFUIGFuZCBMUlVfR0VOLgo+Cj4gQWZ0ZXIgZWFjaCBwYXRjaDoK
PiAgIC0gZGlydHlfbG9nX3BlcmZfdGVzdCAtdiAyIC1iIDI1Nk0gLWkgMwo+ICAgLSBhY2Nlc3Nf
dHJhY2tpbmdfcGVyZl90ZXN0IC12IDIgLWIgMjU2TSAtcyBhbm9ueW1vdXNfdGhwCj4gICAgICgy
TSBUSFAgZGlzYWJsZWQgYW5kIDY0SyBtVEhQIGVuYWJsZWQpCj4gICAtIDIwIFZNIGNyZWF0ZS9k
ZXN0cm95IGl0ZXJhdGlvbnMKPgo+IFdpdGggTUdMUlUgYWdpbmcgZm9yY2VkIG9uIHRoZSBWTSdz
IGNncm91cCBldmVyeSA1MC0xMDBtczoKPiAgIC0gZGlydHlfbG9nX3BlcmZfdGVzdCAtdiAzIC1i
IDI1Nk0gLWkgMwo+ICAgLSAzMCBWTSBjcmVhdGUvZGVzdHJveSBpdGVyYXRpb25zCj4KPiBXaXRo
IENPTkZJR19LVk09bSwgNSBtb2R1bGUgbG9hZC91bmxvYWQgY3ljbGVzLCBlYWNoIHdpdGggYSBW
TSBjcmVhdGVkCj4gYW5kIGRlc3Ryb3llZCBpbW1lZGlhdGVseSBiZWZvcmUgbW9kdWxlIHVubG9h
ZCwgdG8gZXhlcmNpc2UgbW9kdWxlCj4gdGVhcmRvd24gYWZ0ZXIgcXVldWluZyBSQ1UgZnJlZXMu
Cj4KPiBObyBXQVJOLCBLQVNBTiwgbG9ja2RlcCBvciBSQ1UgcmVwb3J0cyB3ZXJlIG9ic2VydmVk
LiBUaGUga3ZtX2FnZV9odmEKPiB0cmFjZXBvaW50IHJlY29yZGVkIGFwcHJveGltYXRlbHkgNjVr
IGV2ZW50cyBwZXIgYWdpbmcgcGFzcy4KPgo+IFBlcmZvcm1hbmNlIHJlc3VsdHMgZnJvbSBkaXJ0
eV9sb2dfcGVyZl90ZXN0IC12IDMgLWIgMjU2TSAtaSAzLCB3aXRoCj4gbG9ja19zdGF0IGVuYWJs
ZWQgZm9yIG1tdV9sb2NrIGFuZCA4NiBhZ2luZyBwYXNzZXM6Cj4KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBubyBhZ2luZyAgICAgICAgICBhZ2luZwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBiZWZvcmUgIGFmdGVyICAgICBiZWZvcmUgICBhZnRlcgo+ICAgZ3Vlc3QgZGlydHkgdGlt
ZSAgICAgICAxMi41cyAgIDEyLjRzICAgICAxOC42cyAgICAxNi43cwo+ICAgbW11X2xvY2sgVyB3
YWl0IHRvdGFsICAwLjE1cyAgIDAuMTdzICAgICA0NC40cyAgICAwLjE1cwo+ICAgbW11X2xvY2sg
VyBjb250ZW50aW9ucyAgMzVrICAgICAzNWsgICAgICAxLjBNICAgICAzMGsKPiAgIG1tdV9sb2Nr
IFIgd2FpdCB0b3RhbCAgIDAgICAgICAgMCAgICAgICAgNy41cyAgICAgMAo+Cj4gQmVmb3JlIHRo
ZSBzZXJpZXMsIDkzJSBvZiB3cml0ZS1sb2NrIHdhaXRlcnMgd2VyZSBmcm9tCj4ga3ZtX21tdV9u
b3RpZmllcl9jbGVhcl95b3VuZygpLCBhbmQgdGhlIGRpcnR5LWxvZyByZWFkLXNpZGUgZmFzdCBw
YXRoCj4gd2FpdGVkIGZvciBtbXVfbG9jayAzNTJrIHRpbWVzLiBBZnRlciB0aGUgc2VyaWVzLCBh
Z2luZyBkb2VzIG5vdAo+IGFjcXVpcmUgbW11X2xvY2suCj4KPiBBYnNvbHV0ZSBudW1iZXJzIGFy
ZSBpbmZsYXRlZCBieSBUQ0c7IG9ubHkgdGhlIHJlbGF0aXZlIGNoYW5nZSBpcwo+IG1lYW5pbmdm
dWwuIFVuZGVyIFRDRywgdGhlIGF0b21pYyB3cml0ZS1wcm90ZWN0IGNoYW5nZSBpbiBwYXRjaCAz
Cj4gaW5jcmVhc2VkIHRoZSBjbGVhci1kaXJ0eS1sb2cgdGltZSBmcm9tIGFwcHJveGltYXRlbHkg
MTZtcyB0byAzMG1zLAo+IGFzIFRDRyBzZXJpYWxpc2VzIEFNTyBpbnN0cnVjdGlvbnM7IGhhcmR3
YXJlIG51bWJlcnMgd291bGQgYmUgd2VsY29tZS4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjA5MTgwNzI2MjIuMjg0MTg4LTEtc3V1bmoxMzMxQGdtYWlsLmNvbS8KPiBb
Ml0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtLXJpc2N2LzIwMjYwOTE0MDU1OTM2LjM2NzI3
NTgtMS13YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuLwo+Cj4gU2V1bmdKdSBDaGVvbiAoNSk6Cj4g
ICBLVk06IHJpc2N2OiBBZ2UgYWxsIEctc3RhZ2UgUFRFcyBpbiBhIEdGTiByYW5nZQo+ICAgS1ZN
OiByaXNjdjogUmVhZCBHLXN0YWdlIFBURXMgb25jZSB3aGVuIHdhbGtpbmcgcGFnZSB0YWJsZXMK
PiAgIEtWTTogcmlzY3Y6IFdyaXRlLXByb3RlY3QgRy1zdGFnZSBQVEVzIGF0b21pY2FsbHkKPiAg
IEtWTTogcmlzY3Y6IEZyZWUgRy1zdGFnZSBwYWdlIHRhYmxlcyBhZnRlciBhbiBSQ1UgZ3JhY2Ug
cGVyaW9kCj4gICBLVk06IHJpc2N2OiBBZ2UgRy1zdGFnZSBQVEVzIGxvY2tsZXNzbHkKPgoKUXVl
dWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC03LjUKClRoYW5rcywKQW51cAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
