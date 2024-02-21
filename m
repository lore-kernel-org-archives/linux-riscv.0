Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312A8C5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 21:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0o0LnPh0GMJT79H/+WbJeM0H6MyqlaVkqLtyaNMypzI=; b=DDhOQoAgg3yzFk
	m+Uavarhs5bC+uQGhyx7SlvULqrjn0hU/rHnfntW1acXDMyqBZ0Xe+tTMdvcdRM5KSrzwzX3zUsfZ
	u6t+rQY5ECEN7ZBOvo12mMh2QYfi/gUHKu0YRCgzZOHSgpBDf4y17zDHBok0rb7CkFwWmkto1k15j
	hAlulMNj5mjKdfA/6xguz+DE0Ou9F90qPjGsq2em7W74fmbgkoH+nbb4fo23W3faqzE70wzuri3Nx
	Rnb3qVvjm0NWFdWL7gjaJOpuJQTpnZE9ABLqNiPjQIasgxG/T/FhEGMgvAEcVYohBJw1EGWZ6fO3+
	uIMIPROLhyGYukNn4FaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rctuD-00000002aie-41qa;
	Wed, 21 Feb 2024 21:13:29 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rctuA-00000002agn-3hnC;
	Wed, 21 Feb 2024 21:13:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d51ba18e1bso11740105ad.0;
        Wed, 21 Feb 2024 13:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708550005; x=1709154805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOe8CQ1Fe+hIMHxzKX7XWlTimkc/iuaovpymvDphgj4=;
        b=S21W7mBZF3KCFexYnPN+I3MKQrlVbsmiQgN7CmZyvATYaWZCklleOi3u4EHh3a9y+z
         EIeT6GJOnE976XCjrzNjMRvgFPROPSjpJeUUtb8Cx/5gc+Q/zmVyhLarOt09I/b2i7FS
         bpxLY7XBmp3+RNOUMOVYwZQZCAt7ImYowrSdZ3Ori4M547A14fBiTyEBTGC/c+xEByNn
         m/fWQFWNMNl/GH08sJGJN6QC2QHk2EXSLR/y/kVmetiuT0mw7lYxrg66YfaZxuE8MJ98
         htk5O+Lbn+s4+nXRS/DXWA6ydQrWn+AqZ0bCaA/a+NhzJjyxwFntdv6wfa5ev8DlhZxA
         XtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708550005; x=1709154805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOe8CQ1Fe+hIMHxzKX7XWlTimkc/iuaovpymvDphgj4=;
        b=rf8TAHOrpgIf1daqWG1fgUNtBrQqUUsx3QjXZiPLAsjsx9Y+9VTHwmZAbyx9hIseMS
         yQ+XoZd6LMwQPDnOZ+BOoIID1ncx1P4Au9VzdawpysO2eEmm+TeelnC6suFxBEr4vSRj
         Uqj5du1uGRuJPp388CbB90ziy+31tkfw40SYf4pOca1EpwWGH+hufbsi0vKG5phS9teh
         niYT6hcK+OzeVUnUb/3487myZKrskOV7oUwEqpld4xdB9II8TtNy/aYBLId+2jOW1Bx0
         DwjAvs3vlJzS8MHB0uUMjZi7j06H/AV1j+17RmeRO85nlHXns24E6Bmm6LCKuA6L6whL
         gpxg==
X-Forwarded-Encrypted: i=1; AJvYcCVMbhMFtgR6x+ZDX9ecdXlo8S7Sop11bGH+k+pVYtqPpKhWtNrMSGSQJfvfqIwHgWM7Fzb+i2bts3UJaaKo3TfH89Q4E+A2suUTYZzMjmyUySrYtKsOHmk+TqARDb7vFliG01S09GuBPS/e6no83d/9iod/hMM=
X-Gm-Message-State: AOJu0YwNvmY5KF145eLPbahkWOQyKAZlgIbI88hrfbTU+oIRm6joQTB9
	3MU693HbgUtx4oz2LU0XMHPFM+IPqUUJHOdU3ScSMAxnhkpoHEVEugMLcLpIbzmF1yw1WBBPr9N
	cEEv8QumKYAwoCxcEtrjPsnKIxzI=
X-Google-Smtp-Source: AGHT+IGhaBTSHgXe8Ob108OXBWpnIgIuyMFeVcBje1ELrXkN/4PqTmNclSgXiBJchbcFk4tPPGc/HanP+MFeXILDTxM=
X-Received: by 2002:a17:90a:d911:b0:299:e9d1:fc52 with SMTP id
 c17-20020a17090ad91100b00299e9d1fc52mr6242900pjv.0.1708550004870; Wed, 21 Feb
 2024 13:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20240220235415.GP4163@brightrain.aerifal.cx> <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx> <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx> <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
 <20240221175717.GS4163@brightrain.aerifal.cx> <f4a54297767eb098d903404cbe8860d655d79bed.camel@intel.com>
 <20240221183055.GT4163@brightrain.aerifal.cx> <c3085fbe10193dfe59b25bc7da776e60779b0e8c.camel@intel.com>
 <20240221190639.GU4163@brightrain.aerifal.cx> <e3a432c0fa9f5fe837e9d2fc7b36304709a34428.camel@intel.com>
 <CAMe9rOoUO-D7Uoj9s3eq+w9pJBZ=iucEDpU4hqtJYtPmW5T4dQ@mail.gmail.com> <CAMe9rOr1frpnKSnVQrqeiKK3aAR3xpG=VAiPYLOR9OpHnHhYUw@mail.gmail.com>
In-Reply-To: <CAMe9rOr1frpnKSnVQrqeiKK3aAR3xpG=VAiPYLOR9OpHnHhYUw@mail.gmail.com>
From: "H.J. Lu" <hjl.tools@gmail.com>
Date: Wed, 21 Feb 2024 13:12:47 -0800
Message-ID: <CAMe9rOoo55aFHHuLf=zdc4PNvU+Tu9rtpWaMUdRL=JtHGbE3pA@mail.gmail.com>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS in userspace
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "dalias@libc.org" <dalias@libc.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>, 
	"musl@lists.openwall.com" <musl@lists.openwall.com>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "broonie@kernel.org" <broonie@kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"debug@rivosinc.com" <debug@rivosinc.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"shuah@kernel.org" <shuah@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org" <maz@kernel.org>, 
	"oleg@redhat.com" <oleg@redhat.com>, "fweimer@redhat.com" <fweimer@redhat.com>, 
	"keescook@chromium.org" <keescook@chromium.org>, "james.morse@arm.com" <james.morse@arm.com>, 
	"ebiederm@xmission.com" <ebiederm@xmission.com>, "will@kernel.org" <will@kernel.org>, 
	"brauner@kernel.org" <brauner@kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "ardb@kernel.org" <ardb@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "sorear@fastmail.com" <sorear@fastmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_131326_952449_BA13065D 
X-CRM114-Status: GOOD (  32.91  )
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMTI6MjXigK9QTSBILkouIEx1IDxoamwudG9vbHNAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgRmViIDIxLCAyMDI0IGF0IDEyOjE44oCvUE0gSC5K
LiBMdSA8aGpsLnRvb2xzQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBGZWIgMjEs
IDIwMjQgYXQgMTE6MjLigK9BTSBFZGdlY29tYmUsIFJpY2sgUAo+ID4gPHJpY2sucC5lZGdlY29t
YmVAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCAyMDI0LTAyLTIxIGF0IDE0
OjA2IC0wNTAwLCBkYWxpYXNAbGliYy5vcmcgd3JvdGU6Cj4gPiA+ID4gRHVlIHRvIGFyYml0cmFy
aWx5IG5lc3RhYmxlIHNpZ25hbCBmcmFtZXMsIG5vLCB0aGlzIGRvZXMgbm90IHN1ZmZpY2UuCj4g
PiA+ID4gQW4gaW50ZXJydXB0ZWQgb3BlcmF0aW9uIHVzaW5nIHRoZSBsb2NrIGNvdWxkIGJlIGFy
Yml0cmFyaWx5IGRlbGF5ZWQsCj4gPiA+ID4gZXZlbiBuZXZlciBleGVjdXRlIGFnYWluLCBtYWtp
bmcgYW55IGNhbGwgdG8gZGxvcGVuIGRlYWRsb2NrLgo+ID4gPgo+ID4gPiBEb2ghIFllcCwgaXQg
aXMgbm90IHJvYnVzdCB0byB0aGlzLiBUaGUgb25seSB0aGluZyB0aGF0IGNvdWxkIGJlIGRvbmUK
PiA+ID4gd291bGQgYmUgYSB0aW1lb3V0IGluIGRsb3BlbigpLiBXaGljaCB3b3VsZCBtYWtlIHRo
ZSB3aG9sZSB0aGluZyBqdXN0Cj4gPiA+IGJldHRlciB0aGFuIG5vdGhpbmcuCj4gPiA+Cj4gPiA+
ID4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBJdCdzIGZpbmUgdG8gdHVybiBSRFNTUCBpbnRv
IGFuIGFjdHVhbCBlbXVsYXRlZCByZWFkIG9mIHRoZSBTU1AsIG9yCj4gPiA+ID4gYXQKPiA+ID4g
PiBsZWFzdCBhbiBlbXVsYXRlZCBsb2FkIG9mIHplcm8gc28gdGhhdCB1bmluaXRpYWxpemVkIGRh
dGEgaXMgbm90IGxlZnQKPiA+ID4gPiBpbiB0aGUgdGFyZ2V0IHJlZ2lzdGVyLgo+ID4gPgo+ID4g
PiBXZSBjYW4ndCBpbnRlcmNlcHQgUkRTU1AsIGJ1dCBpdCBiZWNvbWVzIGEgTk9QIGJ5IGRlZmF1
bHQuIChkaXNjbGFpbWVyCj4gPiA+IHg4Ni1vbmx5IGtub3dsZWRnZSkuCj4gPiA+Cj4gPiA+ID4g
IElmIGRvaW5nIHRoZSBsYXR0ZXIsIGNvZGUgd29ya2luZyB3aXRoIHRoZQo+ID4gPiA+IHNoYWRv
dyBzdGFjayBqdXN0IG5lZWRzIHRvIGJlIHByZXBhcmVkIGZvciB0aGUgcG9zc2liaWxpdHkgdGhh
dCBpdAo+ID4gPiA+IGNvdWxkIGJlIGFzeW5jLWRpc2FibGVkLCBhbmQgY2hlY2sgdGhlIHJldHVy
biB2YWx1ZS4KPiA+ID4gPgo+ID4gPiA+IEkgaGF2ZSBub3QgbG9va2VkIGF0IGFsbCB0aGUgaW5z
dHJ1Y3Rpb25zIHRoYXQgYmVjb21lICNVRCBidXQgSQo+ID4gPiA+IHN1c3BlY3QgdGhleSBhbGwg
aGF2ZSByZWFzb25hYmxlIHRyaXZpYWwgd2F5cyB0byBpbXBsZW1lbnQgYQo+ID4gPiA+ICJkaXNh
YmxlZCIgdmVyc2lvbiBvZiB0aGVtIHRoYXQgdXNlcnNwYWNlIGNhbiBhY3QgdXBvbiByZWFzb25h
Ymx5Lgo+ID4gPgo+ID4gPiBUaGlzIHdvdWxkIGhhdmUgdG8gYmUgdGhvdWdodCB0aHJvdWdoIGZ1
bmN0aW9uYWxseSBhbmQgcGVyZm9ybWFuY2UKPiA+ID4gd2lzZS4gSSdtIG5vdCBvcHBvc2VkIGlm
IGNhbiBjb21lIHVwIHdpdGggYSBmdWxseSBmbGVzaGVkIG91dCBwbGFuLiBIb3cKPiA+ID4gc2Vy
aW91cyBhcmUgeW91IGluIHB1cnN1aW5nIG11c2wgc3VwcG9ydCwgaWYgd2UgaGFkIHNvbWV0aGlu
ZyBsaWtlCj4gPiA+IHRoaXM/Cj4gPiA+Cj4gPiA+IEhKLCBhbnkgdGhvdWdodHMgb24gd2hldGhl
ciBnbGliYyB3b3VsZCB1c2UgdGhpcyBhcyB3ZWxsPwo+ID4KPiA+IEFzc3VtaW5nIHRoYXQgd2Ug
YXJlIHRhbGtpbmcgYWJvdXQgcGVybWlzc2l2ZSBtb2RlLCAgaWYga2VybmVsIGNhbgo+ID4gc3Vw
cHJlc3MgVUQsIHdlIGRvbid0IG5lZWQgdG8gZGlzYWJsZSBTSFNUSy4gICBHbGliYyBjYW4gZW5h
YmxlCj4gPiBBUkNIX1NIU1RLX1NVUFBSRVNTX1VEIGluc3RlYWQuCj4KPiBLZXJuZWwgbXVzdCBz
dXBwcmVzcyBhbGwgcG9zc2libGUgU0hTVEsgVURzLgoKSWYgU0hTVEsgaXMgZGlzYWJsZWQgYnkg
a2VybmVsLCBub3QgYnkgZ2xpYmMsICB0aGVyZSBjYW4gYmUgMiBpc3N1ZXM6CgoxLiAgR2xpYmMg
YW5kIGtlcm5lbCBtYXkgYmUgb3V0IG9mIHN5bmMgb24gU0hTVEsuCjIuICBXaGVuIGtlcm5lbCBk
aXNhYmxlcyBTSFNUSywgZ2xpYmMgbWF5IGJlIGluIHRoZSBtaWRkbGUgb2YgcmVhZGluZwpzaGFk
b3cgc3RhY2sgaW4gbG9uZ2ptcCwgc2VhcmNoaW5nIGZvciBhIHJlc3RvcmUgdG9rZW4uCgo+ID4g
PiBJdCBpcyBwcm9iYWJseSB3b3J0aCBtZW50aW9uaW5nIHRoYXQgZnJvbSB0aGUgc2VjdXJpdHkg
c2lkZSAoYXMgTWFyawo+ID4gPiBtZW50aW9uZWQgdGhlcmUgaXMgYWx3YXlzIHRlbnNpb24gaW4g
dGhlIHRyYWRlb2ZmcyBvbiB0aGVzZSBmZWF0dXJlcyksCj4gPiA+IHBlcm1pc3NpdmUgbW9kZSBp
cyBzZWVuIGJ5IHNvbWUgYXMgc29tZXRoaW5nIHRoYXQgd2Vha2VucyBzZWN1cml0eSB0b28KPiA+
ID4gbXVjaC4gQXBwcyBjb3VsZCBjYWxsIGRsb3BlbigpIG9uIGEga25vd24gdW5zdXBwb3J0ZWQg
RFNPIGJlZm9yZSBkb2luZwo+ID4gPiBST1AuIEkgZG9uJ3Qga25vdyBpZiB5b3UgaGF2ZSBhbnkg
bXVzbCB1c2VycyB3aXRoIHNwZWNpZmljIHNoYWRvdyBzdGFjawo+ID4gPiB1c2UgY2FzZXMgdG8g
YXNrIGFib3V0IHRoaXMuCj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gSC5KLgo+Cj4KPgo+IC0tCj4g
SC5KLgoKCgotLSAKSC5KLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
