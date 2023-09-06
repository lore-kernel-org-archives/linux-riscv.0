Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23254EB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkfafoV9Tekw+A/ITdGAyAIcPqr6p2SYgcqKE/VCzGU=; b=iw9jkB4CydyVkS
	oc0rdcn90ndyxyjtO67s9aU6sZc7qwrBL7dkR4Zd7R2lnFJjTHPDNr7GGYum6b+YwPLh4CFSrfvH0
	3OobURMxT03nlzI4+whB4dhNDkWx2pWSAPNO4oEdY4wcLkAAov44vHJoBHDMO/wnNHJW847KpIYsa
	hQDbQ3GtzBP5oM7wQ/xsTQ+T4WLRfRsQtkOuZ1/gFCArEhnF/IU6HMO5Saw5GcxlZ608KRglYhehY
	+JoggRc58rrb0NjMwFjnKPpgibv9jRkdV0Rvdgk/kWE7CQxr2Ly57syPOIIRiTIYe0hb2PPfNGpaA
	Xe1rlHfbRFRpgURvpdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrak-009Mqh-26;
	Wed, 06 Sep 2023 12:25:06 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdraf-009Miz-0t
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 12:25:04 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-34961362f67so2352095ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 05:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694003098; x=1694607898; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fLhsTfYTqZdZr8z56hbpmg5XtICWKziyrzDfh2mv1o=;
        b=KP3j1dpnrhw638Q+xxYR0Gb5AdeBtC6Zmwf/O+vrjWgccb6ETKO7MaNTUMUbBZ3VEm
         auZXSFcfRisEwCTLnAdkel6z9rcTPxfV7VimthwKm7Pqg1jUCKwOGNx+fweC0h93QSOL
         LeLPDUa7eEedL1P7m+qXXxzGiuQgqNHZGMz1RCv+xbLJnVFvbPGFOT1u6wxSHLR1RSNW
         qkROhA7S3YOwZUswtmx1bVsnvLt9jxG8O+3KoivnpI/HnJ4vlASZTyCiX8tLBms/Wk7k
         jkyC0awVB+NXhr/LxGSPMSRtgJMw/3yP+zaV38XqwoRx24HMJnH5TZ06j8grdtwSJjEy
         IDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694003098; x=1694607898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fLhsTfYTqZdZr8z56hbpmg5XtICWKziyrzDfh2mv1o=;
        b=LqY0BrMKF4GaIMMEHVgRXWzuLAHY9r3+MliVzjM32Yzotg8wnX0bljnf5fil8HD1er
         w7mkOiWmUYjavavj6GjzNth5s0UCvKOHnXGX+54nusaDwFN4Fxufg7AGO5KFiSMeMgNQ
         qtRWG1b2PXzjDehvcPWMj3RMI74sYYflEDPBtZlLQBPrRWx+E0EIf3dxEXlEwnwaaXDX
         SiCzxSw3iAJb1JIfm86tgnY35XydxeDf3lFB+TEi6Ui9VotfU6Q2s85108GteibxX24L
         DhDiXUITBSWDjzsWxkb50q1HhO0oTc5o74LGRBaynJXsrvcKHlceRTVxvdUU0uKRoMuG
         AQNw==
X-Gm-Message-State: AOJu0YyoIxtO7tpjPcBTIAPODwUTMtof1E1Ghs69KJeQa+2avuw2QFGa
	+msP0padYU9Y5rGusdb3LPZknYa0YA8taR1zmrQ=
X-Google-Smtp-Source: AGHT+IFXuzhnrvDWBwLUAAVx6AQhArl0lv3tw42IPTTuVjcH7zGUQNDliDj5Ts43x4pPls6rz9VqRxSdtcA8m3KZ8rM=
X-Received: by 2002:a05:6e02:19c5:b0:34a:95f9:650c with SMTP id
 r5-20020a056e0219c500b0034a95f9650cmr18133885ill.10.1694003098249; Wed, 06
 Sep 2023 05:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com> <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
 <CAHVXubiENHt36LrcSBoNU0rAMQ8EoT6tde9M8vLP3Hw2nwMm8g@mail.gmail.com>
 <CA+V-a8vJJFCKy3pCL2Qp1NogL-K5s9moGDbv3tTvx+z1FeKarw@mail.gmail.com> <CAHVXubhLB9Pw51C1ed1Youp9k0qTJKrokUAqf=Xnr+m3BoN5=g@mail.gmail.com>
In-Reply-To: <CAHVXubhLB9Pw51C1ed1Youp9k0qTJKrokUAqf=Xnr+m3BoN5=g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 Sep 2023 13:23:57 +0100
Message-ID: <CA+V-a8s0i=VMSbMa6WvOiZpqe_idAhq4cZ0inSdCNy39-rQeAg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_052501_343600_DE07DE3F 
X-CRM114-Status: GOOD (  31.57  )
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

SGkgQWxleGFuZHJlLAoKT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAxOjE44oCvUE0gQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDYs
IDIwMjMgYXQgMjowOeKAr1BNIExhZCwgUHJhYmhha2FyCj4gPHByYWJoYWthci5jc2VuZ2dAZ21h
aWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBbGV4YW5kcmUsCj4gPgo+ID4gT24gV2VkLCBTZXAg
NiwgMjAyMyBhdCAxOjAx4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgUHJhYmhha2FyLAo+ID4gPgo+ID4gPiBPbiBXZWQs
IFNlcCA2LCAyMDIzIGF0IDE6NDnigK9QTSBMYWQsIFByYWJoYWthcgo+ID4gPiA8cHJhYmhha2Fy
LmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkgQWxleGFuZHJlLAo+
ID4gPiA+Cj4gPiA+ID4gT24gVHVlLCBBdWcgMSwgMjAyMyBhdCA5OjU44oCvQU0gQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBUaGlzIGZ1bmN0aW9uIHVzZWQgdG8gc2ltcGx5IGZsdXNoIHRoZSB3aG9sZSB0bGIgb2YgYWxs
IGhhcnRzLCBiZSBtb3JlCj4gPiA+ID4gPiBzdWJ0aWxlIGFuZCB0cnkgdG8gb25seSBmbHVzaCB0
aGUgcmFuZ2UuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBjYW4g
b25seSB1c2UgUEFHRV9TSVpFIGFzIHN0cmlkZSBzaW5jZSB3ZSBkb24ndCBrbm93Cj4gPiA+ID4g
PiB0aGUgc2l6ZSBvZiB0aGUgdW5kZXJseWluZyBtYXBwaW5nIGFuZCB0aGVuIHRoaXMgZnVuY3Rp
b24gd2lsbCBiZSBpbXByb3ZlZAo+ID4gPiA+ID4gb25seSBpZiB0aGUgc2l6ZSBvZiB0aGUgcmVn
aW9uIHRvIGZsdXNoIGlzIDwgdGhyZXNob2xkICogUEFHRV9TSVpFLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNv
bT4KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90
bGJmbHVzaC5oIHwgMTEgKysrKystLS0tLQo+ID4gPiA+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1
c2guYyAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+ID4g
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+
ID4gPiA+ID4KPiA+ID4gPiBBZnRlciBhcHBseWluZyB0aGlzIHBhdGNoLCBJIGFtIHNlZWluZyBt
b2R1bGUgbG9hZCBpc3N1ZXMgb24gUlovRml2ZQo+ID4gPiA+IChjb21wbGV0ZSBsb2cgWzBdKS4g
SSBhbSB0ZXN0aW5nIGRlZmNvbmZpZyArIFsxXSAocnovZml2ZSByZWxhdGVkCj4gPiA+ID4gY29u
ZmlncykuCj4gPiA+ID4KPiA+ID4gPiBBbnkgcG9pbnRlcnMgb24gd2hhdCBjb3VsZCBiZSBhbiBp
c3N1ZSBoZXJlPwo+ID4gPgo+ID4gPiBDYW4geW91IGdpdmUgbWUgdGhlIGV4YWN0IHZlcnNpb24g
b2YgdGhlIGtlcm5lbCB5b3UgdXNlPyBUaGUgdHJhcAo+ID4gPiBhZGRyZXNzZXMgYXJlIHZtYWxs
b2MgYWRkcmVzc2VzLCBhbmQgYSBmaXggZm9yIHRob3NlIGxhbmRlZCB2ZXJ5IGxhdGUKPiA+ID4g
aW4gdGhlIHJlbGVhc2UgY3ljbGUuCj4gPiA+Cj4gPiBJIGFtIHVzaW5nIG5leHQtMjAyMzA5MDYs
IEl2ZSBwdXNoZWQgYSBicmFuY2ggWzFdIGZvciB5b3UgdG8gaGF2ZSBhIGxvb2suCj4gPgo+ID4g
WzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9wcmFiaGFrYXJsYWQvbGludXgvdHJlZS9yemZpdmUtZGVi
dWcKPgo+IEdyZWF0LCB0aGFua3MsIEkgaGFkIHRvIGdldCByaWQgb2YgdGhpcyBwb3NzaWJpbGl0
eSA6KQo+Cj4gQXMtaXMsIEkgaGF2ZSBubyBpZGVhLCBjYW4geW91IHRyeSB0byAiYmlzZWN0IiB0
aGUgcHJvYmxlbT8gSSBtZWFuCj4gd2hpY2ggcGF0Y2ggaW4gdGhlIHNlcmllcyBsZWFkcyB0byB0
aG9zZSB0cmFwcz8KPgpPb3BzIHNvcnJ5IGZvciBub3QgbWVudGlvbmluZyBlYXJsaWVyLCB0aGlz
IGlzIHRoZSBvZmZlbmRpbmcgcGF0Y2gKd2hpY2ggbGVhZHMgdG8gdGhlIGlzc3VlcyBzZWVuIG9u
IHJ6L2ZpdmUuCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
