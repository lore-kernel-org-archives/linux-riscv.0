Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE645C02187
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 02:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcSAbVvKLuLx+tQ+8envYOGTzYVNQ+Ty1Ck+7XRsxVs=; b=zHVpAn7Sr3f1rF
	XD6mUN/VxEd4Mp/w8RfGlzHSYo9efi9/gRsIRm3kTwcmaMEU3ibbGyX0GiWViaAaM15aToj0b187L
	MFRAcWQ3G8cKykFlY0HIhIlB7ELT/uRexp3g7sPlLKVMXA13JT9GryzSssbU+GvjUNSCCTULqmT+M
	DXRVpwriTNUMlQ0vKoa7dO8UdEWpqIrjcqSQZEj9XTzVQSCxeqyGdnXwm3ZI269jY6U6LeqNaJQ5+
	p9gENhwkNVfqssJGivczuhEn6Wb3aUGdYXoOZ0rW02P6TTEiCJ2GAkngFmq0fv5gRomGK13h8P16i
	WhDBB6lO1gSU70Wn9rSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhPx-00000004Zcv-2I3D;
	Mon, 20 Jan 2025 02:21:33 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZhPu-00000004Zca-1xey
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 02:21:31 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso6131561276.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jan 2025 18:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737339689; x=1737944489; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcIUTAR53/iE8PZgENFqtkeSs3/WXHCVurjOHUCmDy0=;
        b=Vwnm9fSMANbhTIvm6fVWXVXUl3UKpo6ce+qdaW6Wmu2rHpFlpNAprwmLV5JWjZ8Ps0
         xjMGxk+wf8eiOXR86F1os3uR3d/CKhAsJ+TmI40pRQAFL8A2XrbgJMDQG3GdxldEoWpd
         xnUu+bg28FnSL7xCsja3XDuvuCRqa5AZr22xmD4IuLElyEx8kbQsnhyITathVr40DBUx
         q3jOH6aQkdaekxXgnuqQbmdQ7e29Nv9eRashxpi1tDYpe9V4iKXkFyDbjrlTRkEKepoz
         Jth0qBk4KDPVV+s4zSym3dHxomuogK+jwIZMT8Zah3ULbxQpRJnrcVDqrxIPD4thBA8W
         UqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737339689; x=1737944489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcIUTAR53/iE8PZgENFqtkeSs3/WXHCVurjOHUCmDy0=;
        b=trm4azxlIA7+8hrUdvYJJ+fzyUOI18tZawEqwI+gAhEsZddcoz3tD9IMvoKMoQ9hSu
         TchDHhF452L7h0CneoIzUT+R4AJlncvF2AwoT/ILC+Fv4rdmRZuMqaMMahSVOpL2qk34
         jrB/jSX3eE5e+PGKz6iuLSAPZcCo72Vrn9i+ddtCy5e509yqwrn9V9a5SAqxsUTh1J5E
         5p9pOkdRm7xaJbgrcsHI7gs/akrlsaufbUbVNHhYrvJEewNOBft+mxwXjiB6fSXusUJk
         TfggViiLIhuT6ctixxFn+H+RlRXj/ElK6WHhJW1DR6K/uYnolS6hFbFNAUEhQhONMoFz
         5SEw==
X-Gm-Message-State: AOJu0YxFyjzlhUDRchDSZSzgLttKlsNfay0PHa24L8ejABSBrPSffveD
	9ISbxfzgGDNI65g6e7wXWR3AwaEbEuVLN4qzkLYSBDeS1L2DEEVoYoDSZpSbeVlncO2eKYh0ez4
	Jk7yUwTjbKfmjzLOvLC9zKsgXTxI=
X-Gm-Gg: ASbGncv1d6/NGs6BJ2LMCdsv1yiyD5PJTUSoSlemPVDJEnkmtDJfIrHiMxmbzOnaVCG
	0YL7md5FudIPikT2TqTfDJ63dmNFkQBACFy/e5pGKW2YEbVIA4QU2XZ8PXcEcSOIPt33vK4Ta21
	iNtk0iJQ==
X-Google-Smtp-Source: AGHT+IE4vbEC5XQ4QCQ/VgwSA3an89gi0mTtVYcYNlxFGk1CdRlxqHo0fkL0JFPVy52I2x6dqrM5cJrevwqy4piUprI=
X-Received: by 2002:a05:690c:9a13:b0:6e2:1bba:ed4c with SMTP id
 00721157ae682-6f6eb6867f6mr78835277b3.17.1737339689160; Sun, 19 Jan 2025
 18:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20250120021514.125455-1-gch981213@gmail.com>
In-Reply-To: <20250120021514.125455-1-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 20 Jan 2025 10:20:59 +0800
X-Gm-Features: AbW1kvY8Y4i_Y5EWTuqE8tNTLgXudvF7uLiD0LfiJTc7T-bqhi9SJCZQ_nTmeik
Message-ID: <CAJsYDVJbu-oyyP3BdUi4rTj20vX+Qz4t6SXfCcSFqa822utDPQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: add Siflower RISC-V SoC family Kconfig support
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_182130_506734_946142C1 
X-CRM114-Status: GOOD (  15.93  )
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

T24gTW9uLCBKYW4gMjAsIDIwMjUgYXQgMTA6MTXigK9BTSBDaHVhbmhvbmcgR3VvIDxnY2g5ODEy
MTNAZ21haWwuY29tPiB3cm90ZToKPgo+IFNpZmxvd2VyIFJJU0MtViBTb0NzLCBpbmNsdWRpbmcg
U0YyMUE2ODI2LCBTRjIxSDg4OTggYW5kIHNvbWUgb3RoZXIKPiB1cGNvbXBpbmcgY2hpcHMsIGFy
ZSBSSVNDLVYgY2hpcHMgd2l0aCBULUhlYWQgQzkwOCBjb3JlcyBmb3IgaG9tZQo+IHJvdXRlcnMg
YW5kIGdhdGV3YXlzLiBBZGQgYSBLY29uZmlnIGVudHJ5IG5hbWVkIEFSQ0hfU0lGTE9XRVIgZm9y
Cj4gdGhlbS4KPiBOb3RhYmx5IHRoZXNlIGNoaXBzIHVzZXMgQVJNIFBMMDExIGZvciBVQVJULiBB
Uk1fQU1CQSBpcyBzZWxlY3RlZAo+IGZvciBpdHMgZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2h1YW5ob25nIEd1byA8Z2NoOTgxMjEzQGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9L
Y29uZmlnLnNvY3MgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgYi9hcmNoL3Jpc2N2
L0tjb25maWcuc29jcwo+IGluZGV4IDE5MTZjZjdiYTQ1MC4uMmE3MDBjNTE1OTRkIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmln
LnNvY3MKPiBAQCAtMTksNiArMTksMTUgQEAgY29uZmlnIEFSQ0hfU0lGSVZFCj4gICAgICAgICBo
ZWxwCj4gICAgICAgICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciBTaUZpdmUgU29DIHBsYXRm
b3JtIGhhcmR3YXJlLgo+Cj4gK2NvbmZpZyBBUkNIX1NJRkxPV0VSCj4gKyAgICAgICBkZWZfYm9v
bCBTT0NfU0lGTE9XRVIKPiArCj4gK2NvbmZpZyBTT0NfU0lGTE9XRVIKCk9vb29vcHMuIEkgcmVt
b3ZlZCBTT0NfU0lGTE9XRVIgYnV0IGZvcmdvdCB0byBjb21taXQgaXQuCkknbGwgc2VuZCBhIHYy
LiBTb3JyeSBmb3IgdGhlIG5vaXNlLgoKCj4gKyAgICAgICBib29sICJTaWZsb3dlciBSSVNDLVYg
U29DcyIKPiArICAgICAgIHNlbGVjdCBBUk1fQU1CQSBpZiBUVFkKPiArICAgICAgIGhlbHAKPiAr
ICAgICAgICAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIFNpZmxvd2VyIFJJU0MtViBTb0MgcGxh
dGZvcm0gaGFyZHdhcmUuCj4gKwo+ICBjb25maWcgQVJDSF9TT1BIR08KPiAgICAgICAgIGJvb2wg
IlNvcGhnbyBTb0NzIgo+ICAgICAgICAgaGVscAo+IC0tCj4gMi40OC4xCj4KCgotLQpSZWdhcmRz
LApDaHVhbmhvbmcgR3VvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
