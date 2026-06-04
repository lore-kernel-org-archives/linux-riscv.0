Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F2BCD6E4A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 05:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tD2XcvuLZ3cOegVLhVLJresBYZqe7JLkGD28WqGzUNk=; b=zKhH/JijB6PFIw
	G8Fh2X9v3qZnwqM9ne9obkyG3jPrNy4tuEQjcP7nJn2R8sSlwn6YFhbFj9+Cl+/us0diU/qYDv+SW
	6vZfBCk8yzs/EUjuogKFrqPISbnVCMankYMpKC4OAnL4PZrAANkkLsAhKf2U25ulXYW0fMFPEL62v
	R6QfJ5C0CBmovV+lZKNp0CRyHG2zNjT5y1bipYJd3Kr7YJvggUV7CcTxn32Ud8DER3OJVqFJLtxGz
	Noc7FKMFSS6wC3IAQJyDwlnAjV9uoQBNc6oCpIRs+J+TuU+1oRUtjFME2hy8M3xANhS6yXoYLEkfr
	YyaMv5wWc+YVu0YlEWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0re-0000000GBuN-1wwQ;
	Thu, 04 Jun 2026 05:43:34 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0rb-0000000GBtO-0F0h
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 05:43:32 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5176d4c14f5so2520541cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 22:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780551810; cv=none;
        d=google.com; s=arc-20240605;
        b=kXBpOCSuGVxIw/s13Y/jlBuGG7bluGLMKOPRSzED0e2YIL3sKnIfeKdukO1f4LwwY3
         YhNHTQxWPPe1hfZz6To6OhC1F7fPWc358wneoMTkR4oXr0qfI9TSUfGiiTU5JHYS/Q/6
         wi631cw53JoHjKyzY6SuZnr66TnnzgyogyzDKS9u/Uyf8Wy8GNllT18MX87owohJYzqk
         qF3CxeWFTFFuHOzxquuMd52dm7GIvgEe3SwyiupCR64SG6Dw+q1Af/AO5/uLSSg6JI3b
         X0MuUXiYmukIe3R8i9YGFwxm5DIfwk1qCv8DOV4H/w9L0z38ciLjxDaGI8vzk5SWCNSf
         WL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2vjbEpBMrkd6U50bbMhDulG6rAcsMtJMj2QzzvisOk8=;
        fh=xfbnrPXaXpylKAsz8+er4LKCdOe6sfAFOPRFe7+6VkU=;
        b=JRyBMrn4xIuyo7wAU7G6UR3samWvX8+MjjmGVY1/9neVzfK2mML//LK8vbJKXwUru8
         YjFDtJaPE/iUOiWDhgQTF14SadVi3mBII2IuThZwibCp/y5f5OVZUjYT7HFO39CIqkw9
         uytv+68370QZtj7iCuzZKe2IvSUS0RsDpoOdfObyNIiVjENowRVVy22EuwQJ0VG4M+um
         OIDvsdqaeJq1WQkaHgf7y1PVwR9w3SsA5ptCyuPKRpzHWR6GgH0U2LSQeS39HpAoY1OP
         yZenB6law/zCSBUB4OcyydXKiS4tk01Jxq2H5CY2PJzBy27Z0axEci1PRAjMaqzoBwQI
         zrPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780551810; x=1781156610; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vjbEpBMrkd6U50bbMhDulG6rAcsMtJMj2QzzvisOk8=;
        b=Fy9XU0SXyKzLyBQxHY08Fq6YhdkV2xGfM03L6HsXsWbGPGT0RpTX+MXtw+iJUWBBnz
         lIYRgTaZgp06kmfm/kxYxesBGsyQnxpN3OvEKcJ67K1QA0awqShQ55a4TjkLrFuDxvCk
         OmVSgveGUxDOpbfslApCtPVC6PIIxCIjQNW5XHTKAOyq0UUiz60VDVgtScSvps/TEEB3
         RWHHbSfvTRfRPG57JNrPo1NQiZb5Nw7TdGiv/AD42cXbtQzPvXgJ3DaxGc/8Q2G0jFcw
         fpPBasTDwt5q4iZlLUNw/tR+in3JSkw99m4AK2IA6YsvhfJ8CPcl4X0lmJmPpa71St1V
         8AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780551810; x=1781156610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2vjbEpBMrkd6U50bbMhDulG6rAcsMtJMj2QzzvisOk8=;
        b=pmpiDC+of5dG/Mrg6M5Hu7ArxA2h3OIo/SOeYWBoHYZWKYHA6ST3urP8d95ACUs4r9
         5RfvzgAssGvW/DH3ZUKE7KO7lFV5BRbAgVZMVHJiXvH/1x/NHOIF33WkLG9k5gWEV4+U
         mCsbHvD0s/7ekLbPLrikpU25H7vdhqP5UbBScVto6wlBKzxQ/KL7I68MZ5IfuAEr2kCk
         H/TZ6iN+T7cqdyB+5MKL013QqPJ26Rrc6kL/h4l4Hhau6xtkAP562gIAETtiGAXiOoHs
         Sp8FVXaAXRz/o29LuxEOzTKBXNHqWNGoi1tb5EtunpqDYNieqdgR3ogHYR4RLG4mq6je
         pJSw==
X-Forwarded-Encrypted: i=1; AFNElJ8b93b83zarR9PWBgBWy7kOjCyzmE+3TugC0CpIy7rOwXGTsN09BsMvje66XMTCRFTUcugB72RpARJ2hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxaD5cpeaN3yv2yn/fP0UsKHslwYC9oaTJ3PENAOQrBZn3ZvAI
	D5AvA7sevGUpdrSSBdvRPKirEQX9J1bTzF8fViWij1yxGWItor0z99ZGNi95XefSMVD6F6LEWos
	g1J7+u4wLlPrdued63Efi6+EFRqLBulSKIFpyrqvKWA==
X-Gm-Gg: Acq92OH11ReGuZDCmaPN8RfdZuzmhcb2puR32tw51rHyRjvvL93AgARfpP/OsfrKuTD
	7vqYCDN3RZWUnFod/3ww6ywMINpuektpAKd3fLm6kDMet3gkTL3FqO6kmjdwIgcLJsT0CudMx+R
	FI8eyFHamiTQ9wivQeradbxtZph9TxhSHrGVxIvKa1R8QLh1Qc+7h/qjNQtCgAcN0ATtPOJUCaM
	YxtLc4PzsveRycOVrJMcWLChJFmclsjTA5Se2p9eUoty6WAAQ598QzF23MssrjQRKIH01k46HmW
	gk2BpFLLGfzjqcivFHGH8J1v+AeuiPBLB7s6jb6bvrztvGv9faWuuxI9byrA7wKgZuYWkgPwGzY
	Vs77V9ZvfpNBkT8SMsycXyWKJsuDw1K+ges3E
X-Received: by 2002:a05:622a:1814:b0:516:dda7:51e0 with SMTP id
 d75a77b69052e-51778631404mr87800321cf.17.1780551809656; Wed, 03 Jun 2026
 22:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260525013642.999187-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260525013642.999187-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jun 2026 11:13:17 +0530
X-Gm-Features: AVHnY4LKdTw-t4ZyqgvR4oG_oI5TCCSH84iuLHduTqP5duPhyYA_CKeqJZ0xlus
Message-ID: <CAAhSdy0LCXF677cBuS-CUBynUqWL7d_ra8+e+uOJurLm2nZzWg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Document a TOCTOU race in SBI system
 suspend handler
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_224331_101311_D63AC36C 
X-CRM114-Status: GOOD (  20.97  )
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

T24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgNzowNuKAr0FNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBTVVNQIGhhbmRsZXIgY2hlY2tzIHRoYXQgYWxs
IG90aGVyIHZDUFVzIGFyZSBzdG9wcGVkIGJlZm9yZQo+IGVudGVyaW5nIHN5c3RlbSBzdXNwZW5k
LCBidXQgYSBjb25jdXJyZW50IEhTTSBIQVJUX1NUQVJUIGNhbiBzdGFydAo+IGEgdkNQVSBhZnRl
ciBpdCBoYXMgYWxyZWFkeSBwYXNzZWQgdGhlIGNoZWNrLgo+Cj4gVGhpcyBpcyBhIGtub3duIFRP
Q1RPVSByYWNlLiBXZSBkbyBub3QgZml4IGl0IGJlY2F1c2U6Cj4gMS4gVHJpZ2dlcmluZyBpdCBy
ZXF1aXJlcyBhIHBhdGhvbG9naWNhbCBndWVzdC4KPiAyLiBPbmx5IGd1ZXN0IHN0YXRlIGlzIGF0
IHJpc2ssIG5vdCBob3N0IGludGVncml0eS4KPiAzLiBVc2Vyc3BhY2UgY2FuIGRvdWJsZS1jaGVj
ayB2Q1BVIHN0YXRlcyBiZWZvcmUgc3VzcGVuZC4KPgo+IEFkZCBhIGNvbW1lbnQgZG9jdW1lbnRp
bmcgdGhlIHJhY2UgYW5kIHRoZSByYXRpb25hbGUgZm9yIG5vdCBmaXhpbmcgaXQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSmlha2FpIFh1IDx4dWppYWthaTIwMjVAaXNjYXMuYWMuY24+Cj4gQXNzaXN0ZWQtYnk6
IFl1YW5TaGVuZzpEZWVwU2Vlay1WMy4yCgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy4y
CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gVjEgLT4gVjI6Cj4gLSBSZXBsYWNlZCB0aGUgZml4IHdp
dGggYSBjb21tZW50Lgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjYwNTIxMTQyMDMwLjE1NjA4NjEtMS14dWppYWthaTIwMjVAaXNjYXMuYWMuY24vdC8jdQo+
IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zeXN0ZW0uYyB8IDE0ICsrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3lzdGVtLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aV9zeXN0ZW0uYwo+IGluZGV4IGM2ZjdlNjA5YWM3OTQuLjZmNjRhNTllNWQzYzQgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3lzdGVtLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3NiaV9zeXN0ZW0uYwo+IEBAIC0zNSw2ICszNSwyMCBAQCBzdGF0aWMgaW50IGt2
bV9zYmlfZXh0X3N1c3BfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1f
cnVuICpydW4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICAg
ICAgICAgIH0KPgo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBDaGVj
ayB0aGF0IGFsbCBvdGhlciB2Q1BVcyBhcmUgc3RvcHBlZCBiZWZvcmUgZW50ZXJpbmcKPiArICAg
ICAgICAgICAgICAgICogc3lzdGVtIHN1c3BlbmQuCj4gKyAgICAgICAgICAgICAgICAqCj4gKyAg
ICAgICAgICAgICAgICAqIFRoZXJlIGlzIGEga25vd24gVE9DVE9VIHJhY2UgaGVyZTogYSBjb25j
dXJyZW50IEhTTQo+ICsgICAgICAgICAgICAgICAgKiBIQVJUX1NUQVJUIG9uIGFub3RoZXIgdkNQ
VSBjYW4gc3RhcnQgYSB2Q1BVIGFmdGVyIGl0Cj4gKyAgICAgICAgICAgICAgICAqIGhhcyBhbHJl
YWR5IHBhc3NlZCB0aGlzIGNoZWNrLCB2aW9sYXRpbmcgdGhlIGludmFyaWFudC4KPiArICAgICAg
ICAgICAgICAgICoKPiArICAgICAgICAgICAgICAgICogV2UgZG8gbm90IGZpeCB0aGlzIGJlY2F1
c2U6Cj4gKyAgICAgICAgICAgICAgICAqIDEuIFRyaWdnZXJpbmcgdGhlIHJhY2UgcmVxdWlyZXMg
YSBwYXRob2xvZ2ljYWwgZ3Vlc3QuCj4gKyAgICAgICAgICAgICAgICAqIDIuIE9ubHkgZ3Vlc3Qg
c3RhdGUgaXMgYXQgcmlzaywgbm90IGhvc3QgaW50ZWdyaXR5Lgo+ICsgICAgICAgICAgICAgICAg
KiAzLiBVc2Vyc3BhY2UgY2FuIGRvdWJsZS1jaGVjayB2Q1BVIHN0YXRlcyBiZWZvcmUKPiArICAg
ICAgICAgICAgICAgICogICAgcHJvY2VlZGluZyB3aXRoIHN1c3BlbmQuCj4gKyAgICAgICAgICAg
ICAgICAqLwo+ICAgICAgICAgICAgICAgICBrdm1fZm9yX2VhY2hfdmNwdShpLCB0bXAsIHZjcHUt
Pmt2bSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh0bXAgPT0gdmNwdSkKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IC0tCj4gMi4zNC4xCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
