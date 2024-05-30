Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCADC25B78
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3Sxs0sd76s9lk988tehjUjm0K/lAhoBoAwg7WRDSfo=; b=vWgJ6buukn12Jx
	31tLckJE8KuPLpupZ3ys39bM/063xcBGCTh8GWKk44xA3tuwAv8hy9+rbomXYGhgMUFLA42DVQdGj
	mdJYZ6VtM0NbwoiQf0j2fuJc1jZp7ijcmhZuTWOYTGLCEB/eR+ZKWdqe4A3ho1F0VdUVl9wlCEYSD
	THw0QD8A739tNyJHP9umqVEyp5m48yfrlrsbZBv+OHRI2vJIU5sRvpES204RZcurRVh6HAQ/DFRaX
	9XzkPyVlgoGt13i/V3m2pU9f03c3aWmtEYuMeKB3+wFl+p8Q73y36t4UCHCWeRXc2NxFF2FkStcRB
	QGK1THWKpLc4XzATx98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCZyr-00000006UFN-0CnF;
	Thu, 30 May 2024 07:13:45 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCZyo-00000006UEv-2PC5
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 07:13:44 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-627e3368394so5373117b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 00:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717053216; x=1717658016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6F3VqP7Q2oLA+uLC5C8SWEiyXRUAjqkP7GVUyyrZleE=;
        b=U9YSm28bqorv1Hxw+So17kB2aQ7YhEnvWYuJcQVbxgCNUunMMwsO0fX9aV2Orc5pPH
         L9MP875Uo5uMBQqIaaVNjYydwU5N5LhBwXtYme6HLYlN0s72qm1CLxfzR82Udr3I1phP
         5sHJZNCnSRALJxCCN07XIjFX0faSWLFCc1PMOzOOzJZFuevlJUVrQynk63EYy2ZyvrDF
         BBovGlAKc0kbxenq7fJeRjbanwAXx8e9YkFpi6q6zqKo13r3Jg/5Rz+DPe/nhVvfOdQ8
         TUbQinjeUz6o9y/bRfbxcF8k6ZUYiIyMBFWV5fBhWCEUNsqcdIAM9MMA6DyyYDx4OUFW
         F92Q==
X-Forwarded-Encrypted: i=1; AJvYcCWexibGzBtb8dfoNz0RvfAXxryNewDS+4hylaqxGISOMM62nSnTJo7NGvvgGnvevz2lboxuQr1In/tkFDzAnaUMMapzIdVVNiB3RzbgMZPS
X-Gm-Message-State: AOJu0YyFj/rgJPRpTJr3lKJ+HfWcjUsuC0nd/c7cDZ+obM7lyleIilsh
	8crqzl9kfC7bALATBkxQms99XKORiw5OaiOByma4LXr7CDyA8t7XFQGo0Krl
X-Google-Smtp-Source: AGHT+IG4e/9ZFXdorCajomqYxA+kEO0uI1P8wpVuYgS2kHvtnBcUlV3SmgQhHyXNsxSzw/QLEIfgpA==
X-Received: by 2002:a0d:f943:0:b0:61a:e4ef:51d with SMTP id 00721157ae682-62c6bbce9c1mr14293317b3.9.1717053216433;
        Thu, 30 May 2024 00:13:36 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a52eb60sm27267167b3.112.2024.05.30.00.13.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 00:13:36 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df4dce67becso494248276.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 00:13:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlsf0AwpN4+LxevfvnoH3Ib3Q1r61PsdCThfzEVwaLmJUR8ZCBcqnQchVyTRl4LKQ6jrErfIAiFP6ezw7UFT8wQN9Gy+9ll5ybVIqj4WM9
X-Received: by 2002:a25:53c9:0:b0:de5:4ab8:317f with SMTP id
 3f1490d57ef6-dfa5a5da05amr1478827276.20.1717053215497; Thu, 30 May 2024
 00:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240529215458.937817-1-samuel.holland@sifive.com>
In-Reply-To: <20240529215458.937817-1-samuel.holland@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 09:13:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLgpxPCK0chTY=GvMVPgF5G1Oyj=XXoJZBORvH5shFxQ@mail.gmail.com>
Message-ID: <CAMuHMdVLgpxPCK0chTY=GvMVPgF5G1Oyj=XXoJZBORvH5shFxQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Chain to parent IRQ after handlers
 are ready
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_001342_710094_E73585FD 
X-CRM114-Status: GOOD (  20.12  )
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

SGkgU2FtdWVsLAoKT24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMTE6NTXigK9QTSBTYW11ZWwgSG9s
bGFuZAo8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gTm93IHRoYXQgdGhlIFBM
SUMgdXNlcyBhIHBsYXRmb3JtIGRyaXZlciwgdGhlIGRyaXZlciBwcm9iZWQgbGF0ZXIgaW4gdGhl
Cj4gYm9vdCBwcm9jZXNzLCB3aGVyZSBpbnRlcnJ1cHRzIGZyb20gcGVyaXBoZXJhbHMgbWlnaHQg
YWxyZWFkeSBiZQo+IHBlbmRpbmcuIEFzIGEgcmVzdWx0LCBwbGljX2hhbmRsZV9pcnEoKSBtYXkg
YmUgY2FsbGVkIGFzIGVhcmx5IGFzIHRoZQo+IGNhbGwgdG8gaXJxX3NldF9jaGFpbmVkX2hhbmRs
ZXIoKS4gQnV0IHRoaXMgY2FsbCBoYXBwZW5zIGJlZm9yZSB0aGUKPiBwZXItY29udGV4dCBoYW5k
bGVyIGlzIGNvbXBsZXRlbHkgc2V0IHVwLCBzbyB0aGVyZSBpcyBhIHdpbmRvdyB3aGVyZQo+IHBs
aWNfaGFuZGxlX2lycSgpIGNhbiBzZWUgaW5jb21wbGV0ZSBwZXItY29udGV4dCBzdGF0ZSBhbmQg
Y3Jhc2guIEF2b2lkCj4gdGhpcyBieSBkZWxheWluZyB0aGUgY2FsbCB0byBpcnFfc2V0X2NoYWlu
ZWRfaGFuZGxlcigpIHVudGlsIGFsbAo+IGhhbmRsZXJzIGZyb20gYWxsIFBMSUNzIGFyZSBpbml0
aWFsaXplZC4KPgo+IEZpeGVzOiA4ZWM5OWIwMzMxNDcgKCJpcnFjaGlwL3NpZml2ZS1wbGljOiBD
b252ZXJ0IFBMSUMgZHJpdmVyIGludG8gYSBwbGF0Zm9ybSBkcml2ZXIiKQo+IFJlcG9ydGVkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+IENsb3NlczogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9DQU11SE1kVllGRlI3SzVTYkhCTFktSkhoYjdZcGdHTVNf
aG5SV204SDBLRC13Qm8rNEFAbWFpbC5nbWFpbC5jb20vCj4gU2lnbmVkLW9mZi1ieTogU2FtdWVs
IEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghCgpUaGlzIGZpeGVzIHRoZSBpc3N1ZSBJIHdhcyBzZWVyaW5nIG9uIFN0YXJsaWdodCwgYW5k
IGRvZXMgbm90IHNlZW0gdG8KY2F1c2UgcmVncmVzc2lvbnMgb24gUlovRml2ZSwgSWNpY2xlLCBL
MjEwLCBvciBWZXhSaXNjVi4KClRlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
