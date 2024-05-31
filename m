Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8296EC25B7E
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WoaismB6POAHrnmmDg893nMJUEzYz9w7H9y+ZpKg0v0=; b=sq0a/mK2tSjdVY
	Isf2BuS8tsyZIUZCk35cD/b71t9es6aK/Ls3sN5tsBj19LTRQmtRT3OOx7zea8svdtfxGeUiV6i8i
	7BSE/yFwSFTWRvq3JRIdk+aIFnaPe5cP12SOmSsRoVzr9L9g1u9/r1mG4m4Em7yOpkGBgKvj1elOz
	I6VNzlsRz9mPX4SEwAkV9U2Rp3vtoNtUUVIVpyOyy3Y2nHG2DggbJmPWQE/ZYh0Y+Rk9Zkz5d9O2V
	HYw/Qf0WoG/34muoOrylgEzTTqKo39IkXpRSDKW3/Z967qhKZqptI/FNr+yKM4f4HLkQgB0IOLuiy
	q5tL3M8S1mYHbsM2nmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD5O2-0000000AtYq-1LBQ;
	Fri, 31 May 2024 16:45:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD5Ny-0000000AtX2-1iUo
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 16:45:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-420107286ecso2125e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 09:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717173944; x=1717778744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH4bnbtSSVEcXN8q4TBBHbQcYVbG9UpE4sBQSCvIGBs=;
        b=KM0gPFx0sqkOdyQYqaZopRaA2U7CwflZ+nqZ1U7nAk0K0no98w0kJstKm1o2CuTUgR
         0wNGZJ8Txse5u+SYG82pCY8S5boAXz9iTyyDhUYvGMLXQCM7lvge1NbOQH3EjV8xRfhX
         px+uANRddFviQAIDYdMsQl5U+IWL0GrqE7RL5NmUt0nELcramCoOi+y+QhAPMEjNHZew
         8p4fdt1l/UB4wtl47B1N4b+kTlRna3f4OBpzarhpFF7wdHhkL6sLkk5t59QfbDeDHTuS
         QAs2r31/rvi2x3J2oOvrpPxfiHsp5T+JxMD2Mxqc2t0ukQUjKdInPy1xtZFYO0BSXC23
         I51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717173944; x=1717778744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH4bnbtSSVEcXN8q4TBBHbQcYVbG9UpE4sBQSCvIGBs=;
        b=IRylEGvzjqLO4CfD6pRje2cqqn5oyFrfGVHAuWO3jM4YVSof/f/BI+b5JLUVBB4XTo
         YVIOg0buI50EQa78XKa7L8/yLRIR3WgUzyhd/xbwPy+ZjjzmFLhfkYUmjVgca6rYXpbl
         35jvoo895hUWPhgaEWdb1pQhLxxCkq32CENtnhWe5besuy/NVsyOe3I3Hc17rl6WGsQS
         s/e/1ovvxqouhz+JNvONbidW92HeEDMoaHCSCzaNHdEoh6pbqJFBSYelB4+4AIPbDhh4
         nM7UA9AkOgR+maRLWf2AGn3BdHK5UXDcWOhbap7AzV6DpEL37zIKgJ58xbcUx5shvsBU
         TVrw==
X-Forwarded-Encrypted: i=1; AJvYcCXYVMcwSq4lz8nDEmHYAeTaUCMU1HFIG7zDeoauuXLsM52rtJ2f7YNgQFDYLjJ19u8z9R3L6OwwudOAF5kvu5MDL2E7m9+QFQoi3mVuatzr
X-Gm-Message-State: AOJu0YxNLqcBu2TNvYeVkiuxLhFHNE9IS2Vf4kp5gzG8of03Qx1ef10A
	ittdFN4kaUM5RFn4R3Yti8S6SjTixpl1mErSBbpoT213uZ+Gp0CPdsMNerRpfwmZB095oFfFr7r
	AYeyKNx51ZV8IEBxftylz+BdIbOSPrjisMOzx
X-Google-Smtp-Source: AGHT+IEq8Fs3z13ePwWrnbWJUDpx50btCGNNHylLrjkBr8g/csKK0P+GO3+xFEqljtHAVxZhGvPrjS68k6wXeE2cHVA=
X-Received: by 2002:a05:600c:6546:b0:41f:9dd0:7168 with SMTP id
 5b1f17b1804b1-4212c091f55mr2200815e9.2.1717173943952; Fri, 31 May 2024
 09:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com> <Zll2ILUNWE-JPi9U@linux.dev>
In-Reply-To: <Zll2ILUNWE-JPi9U@linux.dev>
From: Yu Zhao <yuzhao@google.com>
Date: Fri, 31 May 2024 10:45:04 -0600
Message-ID: <CAOUHufb_-w=B+NfHAUAo=O8bDXZBdXeeGRZD6kY=krN07srbGA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_094546_509040_458C18D4 
X-CRM114-Status: GOOD (  19.37  )
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

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTowM+KAr0FNIE9saXZlciBVcHRvbiA8b2xpdmVyLnVw
dG9uQGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAzMSwgMjAyNCBhdCAxMjowNTo0
OEFNIC0wNjAwLCBZdSBaaGFvIHdyb3RlOgoKTGV0IG1lIGFkZCBiYWNrIHdoYXQgSSBzYWlkIGVh
cmxpZXI6CgogIEknbSBub3QgY29udmluY2VkLCBidXQgaXQgZG9lc24ndCBtZWFuIHlvdXIgcG9p
bnQgb2YgdmlldyBpcwogIGludmFsaWQuIElmIHlvdSBmdWxseSB1bmRlcnN0YW5kIHRoZSBpbXBs
aWNhdGlvbnMgb2YgeW91ciBkZXNpZ24KICBjaG9pY2UgYW5kIGRvY3VtZW50IHRoZW0sIEkgd2ls
bCBub3Qgb2JqZWN0LgoKPiA+IEFsbCBvcHRpbWl6YXRpb25zIGluIHYyIHdlcmUgbWVhc3VyZWQg
c3RlcCBieSBzdGVwLiBFdmVuIHRoYXQgYml0bWFwLAo+ID4gd2hpY2ggbWlnaHQgYmUgY29uc2lk
ZXJlZCBvdmVyZW5naW5lZXJlZCwgYnJvdWdodCBhIHJlYWRpbHkKPiA+IG1lYXN1YXJhYmxlIDQl
IGltcHJvdmVtZW50IGluIG1lbWNhY2hlZCB0aHJvdWdocHV0IG9uIEFsdHJhIE1heAo+ID4gc3dh
cHBpbmcgdG8gT3B0YW5lOgo+Cj4gVGhhdCdzIGdyZWF0LCBidXQgdGFraW5nIGFuIGl0ZXJhdGl2
ZSBhcHByb2FjaCB0byB0aGUgcHJvYmxlbSBhbGxvd3MKPiB0aGUgcmV2aWV3ZXJzIGFuZCBtYWlu
dGFpbmVycyB0byBjb21lIHRvIHRoZWlyIG93biBjb25jbHVzaW9ucyBhYm91dAo+IGVhY2ggb3B0
aW1pemF0aW9uIGluZGVwZW5kZW50bHkuIFNxdWFzaGluZyBhbGwgb2YgdGhhdCB0b2dldGhlciBh
bmQKPiBwb3N0aW5nIHRoZSByZXN1bHQgZG9lc24ndCBhbGxvdyBmb3IgdGhpcy4KClRoYXQncyB5
b3VyIG1ldGhvZG9sb2d5LCB3aGljaCBJIHJlc3BlY3Q6IGFzIEkgc2FpZCBJIHdvbid0IHN0YW5k
IGluIHlvdXIgd2F5LgoKQnV0IG1pbmUgaXMgYmFja2VkIGJ5IGRhdGEsIHBsZWFzZSBkbyByZXNw
ZWN0IHRoYXQgYXMgd2VsbCwgYnkgZG9pbmcKd2hhdCBJIGFza2VkOiBkb2N1bWVudCB5b3VyIGp1
c3RpZmljYXRpb25zLgoKPiBFdmVuIGlmIHdlIHdlcmUgdG8gdGFrZSB0aGUgc2VyaWVzIGFzLWlz
LCB0aGUgZG9vciBpcyB3aWRlIG9wZW4gdG8KPiBzdWJzZXF1ZW50IGltcHJvdmVtZW50cy4KPgo+
ID4gV2hhdCBJIGRvbid0IHRoaW5rIGlzIGFjY2VwdGFibGUgaXMgc2ltcGxpZnlpbmcgdGhvc2Ug
b3B0aW1pemF0aW9ucwo+ID4gb3V0IHdpdGhvdXQgZG9jdW1lbnRpbmcgeW91ciBqdXN0aWZpY2F0
aW9ucyAoSSB3b3VsZCBldmVuIGNhbGwgaXQgYQo+ID4gZGVzaWduIGNoYW5nZSwgcmF0aGVyIHRo
YW4gc2ltcGxpZmljYXRpb24sIGZyb20gdjMgdG8gdjQpLgo+Cj4gTm8sIHNvcnJ5LCB0aGVyZSdz
IG5vdGhpbmcgd3Jvbmcgd2l0aCBKYW1lcycgYXBwcm9hY2ggaGVyZS4KClNvcnJ5LCBhcmUgeW91
IHNheWluZyAid2l0aG91dCBkb2N1bWVudGluZyB5b3VyIGp1c3RpZmljYXRpb25zIiBpcwpub3Ro
aW5nIHdyb25nPyBJZiBzbywgcGxlYXNlIGVsYWJvcmF0ZS4KCj4gVGhlIGRpc2N1c3Npb24gdGhh
dCBsZWQgdG8gdGhlIGRlc2lnbiBvZiB2NCBoYXBwZW5lZCBvbiBsaXN0OyB5b3Ugd2VyZQo+IG9u
IENDLiBUaGUgZ2VuZXJhbCBjb25zZW5zdXMgb24gdGhlIEtWTSBzaWRlIHdhcyB0aGF0IHRoZSBi
aXRtYXAgd2FzCj4gY29tcGxpY2F0ZWQgYW5kIGxhY2tlZCBpbmRlcGVuZGVudCBqdXN0aWZpY2F0
aW9uLiBUaGVyZSB3YXMgYW1wbGUKPiBvcHBvcnR1bml0eSB0byB2b2ljZSB5b3VyIGNvbmNlcm5z
IGJlZm9yZSBoZSBzcGVudCB0aGUgdGltZSBvbiB2NC4KClBsZWFzZSByZS1yZWFkIG15IHByZXZp
b3VzIGVtYWlscyAtLSBJIG5ldmVyIG9iamVjdCB0byB0aGUgcmVtb3ZhbCBvZgp0aGUgYml0bWFw
IG9yIEphbWVzJyBhcHByb2FjaC4KCkFuZCBwbGVhc2Ugc3RvcCBtYWtpbmcgYXNzdW1wdGlvbnMg
LS0gSSBkaWQgdm9pY2UgbXkgY29uY2VybnMgd2l0aApKYW1lcyBwcml2YXRlbHkuCgo+IFlvdSBz
ZXJpb3VzbHkgY2Fubm90IGZhdWx0IGEgY29udHJpYnV0b3IgZm9yIHJlc3Bpbm5pbmcgdGhlaXIg
d29yayBiYXNlZAo+IG9uIHRoZSBwcm92aWRlZCBmZWVkYmFjay4KCkFyZSB5b3Ugc2F5aW5nIEkg
ZmF1bHRlZCBKYW1lcyBmb3IgdGFraW5nIG90aGVycycgZmVlZGJhY2s/IElmIHNvLAp3aGVyZT8g
QW5kIEknbGwgbWFrZSBzdXJlIEkgZG9uJ3QgZ2l2ZSBzdWNoIGFuIGltcHJlc3Npb24gaW4gdGhl
CmZ1dHVyZS4KCkFsc28gd2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhlIHRlY2huaWNhbCBmbGF3
cyBhbmQgaW5hY2N1cmF0ZQp1bmRlcnN0YW5kaW5ncyBJIHBvaW50ZWQgb3V0PyBZb3Ugc2VlbSB0
byBoYXZlIGEgc3Ryb25nIG9waW5pb24gb24KeW91ciBpdGVyYXRlIGFwcHJvYWNoLCBidXQgSSBo
b3BlIHlvdSBkaWRuJ3QgY2hvb3NlIHRvIG92ZXJsb29rIHRoZQpyZWFsIG1lYXQgb2YgdGhpcyBk
aXNjdXNzaW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
