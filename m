Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9285DC48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6okZezTdR7Xt4rjtpjOC3NWn7O+0zGdQUsiQaLyT7zA=; b=v4zAng6cFZvPg0
	IMcOPDtIdPauW8JuZenFWcP/J/AbexM/9O2KRMKndtNiLB3GhTW87agiTWoEdqNUqKWvFI7cqxxIb
	InISCEky6ncM7JpQqZuRTUKmd+teLuGM+Zn7XxCV4nQ1WzXDHziOaPNEROY7SLRILSZ5o6xetJcvS
	QitZQ9rTo+CFS69GL4tSaKnV3NKrYSOZQQqE3CQHbZ7kNO3phF56a4DyTRNNCCMuzSwRWkYdZD5Fd
	khgwxEo71tYOKs+DW6yxsj5MLeE9WRO6rjGTaSZPNFXFSOBSZVH2Kz1sDP4ZDpzRDY3MVTHXj7J7m
	Pae3yOrDNUDI9B19saLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rctA2-00000002TZf-2UGB;
	Wed, 21 Feb 2024 20:25:46 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rct9z-00000002TYk-3fBE;
	Wed, 21 Feb 2024 20:25:45 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso7218329276.1;
        Wed, 21 Feb 2024 12:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708547142; x=1709151942; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUZZ04EW9/qUv3qL29C/Oq6T36PR4Q6EbgcYZzQ1nWg=;
        b=N+t7VbStYBjChxbAiRu8Ga8a/vIQcWE2aJzKdZ4dHjVsFOBx4Sh9AB/UW3tcj9fcKz
         c5qnbXaAJ3Z9kPab9PYkaBMaLruxpEUBod90Pu+ZuBb7H1hGWxMlqbYGxNcwz6cs3nXK
         hK8EzMnVVE50DrYsB8sxRhGKJ0t/kdLy8Hkf4EnWSGWQY8/zOvG8o1jMiIfIpeXFrn0p
         7OJ0J7WUeFL7MIvKvogT206eSIzrooaenGbNdgVT5UZM/lqGWixYvKXGgzymfuddYjTJ
         uwze2rK+k5EoW66oNWjkUlXIYL1jKl7QP2DAidoEGZohLaAFkvB5sn1cleu3xHofvZuW
         PZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708547142; x=1709151942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUZZ04EW9/qUv3qL29C/Oq6T36PR4Q6EbgcYZzQ1nWg=;
        b=Iqy5x274iP7InfpsQZaJmWKnSIDoiBySED3PeZPYaIW7Wb2g3WLl2XYmtNgeE26kwb
         QTqn0quaZ56ClfBTNV2wsLFImz70t3V6iP2Zp+MFD9Du6eG9Q+aD924N+5tVCakZ/VVw
         +yc4KWfyPc67C6JmZ+5JFhOCsiJpEDkcbk1PC50LhatGrrziMRkG/T9IKuMBRGJUNSgZ
         rOcQE54b877wzTTM1pm5/p1FUOg5F+3+J+zZWjrU1clv7/flX5AVQGbWcqpegXOpxVe/
         mIDVxb0u7B/zJUijqQCDxn5oQgvlqHlQCP8jrnQ7eIXavOJWDCsEKHCCitUp+60QtV+d
         MR5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeu58GArteG/udWBnC+3BGNLMkg208gK7rVop5CgoEHNR4OnENnSB0Pin+yu5cyhWjk2WIvGw9W+vA8Un+dBmZ6ECevyyK0d1RXSjNpMFo1VR/1IuVcgC/DPaMDesa5FfpTc0Wz0DJ4ZKf1vSDSYlu787RwsI=
X-Gm-Message-State: AOJu0YxMo7AEr1G1+MLsD4rLJopav92hT7yAk6mx1K4TL0CljmnuMJO5
	1nmIuVUFLZpup7VYk5jBiLPwDnMpwbXSubdZG33qHa+0zIUrStSRsmDdx9uZp5lSNyGAx1QmR+E
	zRJMRJX9w2bX3S5tXKZKXpu74ad8=
X-Google-Smtp-Source: AGHT+IHulW4fhdXYsgZSX5RqxAxS95jeQrXQWkLqG01c1LAdpuKIFalEI/fkzodUlC0P2/EUntFG0c+fYBgzVA4WA2w=
X-Received: by 2002:a25:1f8b:0:b0:dc7:46ef:8b9e with SMTP id
 f133-20020a251f8b000000b00dc746ef8b9emr389206ybf.29.1708547142617; Wed, 21
 Feb 2024 12:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20240220235415.GP4163@brightrain.aerifal.cx> <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx> <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx> <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
 <20240221175717.GS4163@brightrain.aerifal.cx> <f4a54297767eb098d903404cbe8860d655d79bed.camel@intel.com>
 <20240221183055.GT4163@brightrain.aerifal.cx> <c3085fbe10193dfe59b25bc7da776e60779b0e8c.camel@intel.com>
 <20240221190639.GU4163@brightrain.aerifal.cx> <e3a432c0fa9f5fe837e9d2fc7b36304709a34428.camel@intel.com>
 <CAMe9rOoUO-D7Uoj9s3eq+w9pJBZ=iucEDpU4hqtJYtPmW5T4dQ@mail.gmail.com>
In-Reply-To: <CAMe9rOoUO-D7Uoj9s3eq+w9pJBZ=iucEDpU4hqtJYtPmW5T4dQ@mail.gmail.com>
From: "H.J. Lu" <hjl.tools@gmail.com>
Date: Wed, 21 Feb 2024 12:25:06 -0800
Message-ID: <CAMe9rOr1frpnKSnVQrqeiKK3aAR3xpG=VAiPYLOR9OpHnHhYUw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240221_122543_938450_15CC7F77 
X-CRM114-Status: GOOD (  31.68  )
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

T24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMTI6MTjigK9QTSBILkouIEx1IDxoamwudG9vbHNAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgRmViIDIxLCAyMDI0IGF0IDExOjIy4oCvQU0gRWRn
ZWNvbWJlLCBSaWNrIFAKPiA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5jb20+IHdyb3RlOgo+ID4K
PiA+IE9uIFdlZCwgMjAyNC0wMi0yMSBhdCAxNDowNiAtMDUwMCwgZGFsaWFzQGxpYmMub3JnIHdy
b3RlOgo+ID4gPiBEdWUgdG8gYXJiaXRyYXJpbHkgbmVzdGFibGUgc2lnbmFsIGZyYW1lcywgbm8s
IHRoaXMgZG9lcyBub3Qgc3VmZmljZS4KPiA+ID4gQW4gaW50ZXJydXB0ZWQgb3BlcmF0aW9uIHVz
aW5nIHRoZSBsb2NrIGNvdWxkIGJlIGFyYml0cmFyaWx5IGRlbGF5ZWQsCj4gPiA+IGV2ZW4gbmV2
ZXIgZXhlY3V0ZSBhZ2FpbiwgbWFraW5nIGFueSBjYWxsIHRvIGRsb3BlbiBkZWFkbG9jay4KPiA+
Cj4gPiBEb2ghIFllcCwgaXQgaXMgbm90IHJvYnVzdCB0byB0aGlzLiBUaGUgb25seSB0aGluZyB0
aGF0IGNvdWxkIGJlIGRvbmUKPiA+IHdvdWxkIGJlIGEgdGltZW91dCBpbiBkbG9wZW4oKS4gV2hp
Y2ggd291bGQgbWFrZSB0aGUgd2hvbGUgdGhpbmcganVzdAo+ID4gYmV0dGVyIHRoYW4gbm90aGlu
Zy4KPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4KPiA+ID4gSXQncyBmaW5lIHRvIHR1cm4gUkRTU1Ag
aW50byBhbiBhY3R1YWwgZW11bGF0ZWQgcmVhZCBvZiB0aGUgU1NQLCBvcgo+ID4gPiBhdAo+ID4g
PiBsZWFzdCBhbiBlbXVsYXRlZCBsb2FkIG9mIHplcm8gc28gdGhhdCB1bmluaXRpYWxpemVkIGRh
dGEgaXMgbm90IGxlZnQKPiA+ID4gaW4gdGhlIHRhcmdldCByZWdpc3Rlci4KPiA+Cj4gPiBXZSBj
YW4ndCBpbnRlcmNlcHQgUkRTU1AsIGJ1dCBpdCBiZWNvbWVzIGEgTk9QIGJ5IGRlZmF1bHQuIChk
aXNjbGFpbWVyCj4gPiB4ODYtb25seSBrbm93bGVkZ2UpLgo+ID4KPiA+ID4gIElmIGRvaW5nIHRo
ZSBsYXR0ZXIsIGNvZGUgd29ya2luZyB3aXRoIHRoZQo+ID4gPiBzaGFkb3cgc3RhY2sganVzdCBu
ZWVkcyB0byBiZSBwcmVwYXJlZCBmb3IgdGhlIHBvc3NpYmlsaXR5IHRoYXQgaXQKPiA+ID4gY291
bGQgYmUgYXN5bmMtZGlzYWJsZWQsIGFuZCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlLgo+ID4gPgo+
ID4gPiBJIGhhdmUgbm90IGxvb2tlZCBhdCBhbGwgdGhlIGluc3RydWN0aW9ucyB0aGF0IGJlY29t
ZSAjVUQgYnV0IEkKPiA+ID4gc3VzcGVjdCB0aGV5IGFsbCBoYXZlIHJlYXNvbmFibGUgdHJpdmlh
bCB3YXlzIHRvIGltcGxlbWVudCBhCj4gPiA+ICJkaXNhYmxlZCIgdmVyc2lvbiBvZiB0aGVtIHRo
YXQgdXNlcnNwYWNlIGNhbiBhY3QgdXBvbiByZWFzb25hYmx5Lgo+ID4KPiA+IFRoaXMgd291bGQg
aGF2ZSB0byBiZSB0aG91Z2h0IHRocm91Z2ggZnVuY3Rpb25hbGx5IGFuZCBwZXJmb3JtYW5jZQo+
ID4gd2lzZS4gSSdtIG5vdCBvcHBvc2VkIGlmIGNhbiBjb21lIHVwIHdpdGggYSBmdWxseSBmbGVz
aGVkIG91dCBwbGFuLiBIb3cKPiA+IHNlcmlvdXMgYXJlIHlvdSBpbiBwdXJzdWluZyBtdXNsIHN1
cHBvcnQsIGlmIHdlIGhhZCBzb21ldGhpbmcgbGlrZQo+ID4gdGhpcz8KPiA+Cj4gPiBISiwgYW55
IHRob3VnaHRzIG9uIHdoZXRoZXIgZ2xpYmMgd291bGQgdXNlIHRoaXMgYXMgd2VsbD8KPgo+IEFz
c3VtaW5nIHRoYXQgd2UgYXJlIHRhbGtpbmcgYWJvdXQgcGVybWlzc2l2ZSBtb2RlLCAgaWYga2Vy
bmVsIGNhbgo+IHN1cHByZXNzIFVELCB3ZSBkb24ndCBuZWVkIHRvIGRpc2FibGUgU0hTVEsuICAg
R2xpYmMgY2FuIGVuYWJsZQo+IEFSQ0hfU0hTVEtfU1VQUFJFU1NfVUQgaW5zdGVhZC4KCktlcm5l
bCBtdXN0IHN1cHByZXNzIGFsbCBwb3NzaWJsZSBTSFNUSyBVRHMuCgo+ID4gSXQgaXMgcHJvYmFi
bHkgd29ydGggbWVudGlvbmluZyB0aGF0IGZyb20gdGhlIHNlY3VyaXR5IHNpZGUgKGFzIE1hcmsK
PiA+IG1lbnRpb25lZCB0aGVyZSBpcyBhbHdheXMgdGVuc2lvbiBpbiB0aGUgdHJhZGVvZmZzIG9u
IHRoZXNlIGZlYXR1cmVzKSwKPiA+IHBlcm1pc3NpdmUgbW9kZSBpcyBzZWVuIGJ5IHNvbWUgYXMg
c29tZXRoaW5nIHRoYXQgd2Vha2VucyBzZWN1cml0eSB0b28KPiA+IG11Y2guIEFwcHMgY291bGQg
Y2FsbCBkbG9wZW4oKSBvbiBhIGtub3duIHVuc3VwcG9ydGVkIERTTyBiZWZvcmUgZG9pbmcKPiA+
IFJPUC4gSSBkb24ndCBrbm93IGlmIHlvdSBoYXZlIGFueSBtdXNsIHVzZXJzIHdpdGggc3BlY2lm
aWMgc2hhZG93IHN0YWNrCj4gPiB1c2UgY2FzZXMgdG8gYXNrIGFib3V0IHRoaXMuCj4KPgo+Cj4g
LS0KPiBILkouCgoKCi0tIApILkouCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
